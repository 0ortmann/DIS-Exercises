package dis.exercises.ex5.persistence;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.List;

public class PersistentFileWriter {

    private static final Logger LOG = LoggerFactory.getLogger(PersistentFileWriter.class);

    protected boolean appendToFile(Path filePath, Object... toPersist) {
        String line = buildLine(toPersist);
        try {
            Files.write(filePath, line.getBytes(), StandardOpenOption.APPEND);
            return true;
        } catch (IOException ex) {
            LOG.error("Error appending to file", ex);
            return false;
        }

    }

    protected boolean overwriteLineInFile(Path filePath, int lineToOverwrite, Object... toPersist) {
        String line = buildLine(toPersist);
        try {
            List<String> lines = Files.readAllLines(filePath);
            lines.set(lineToOverwrite, line);
            Files.write(filePath, lines, StandardOpenOption.WRITE);
            return true;
        } catch (IOException ex) {
            LOG.error("Error overwriting file", ex);
            return false;
        }
    }

    protected String buildLine(Object... toCompose) {
        StringBuilder composedString = new StringBuilder();
        for(Object obj : toCompose) {
            composedString.append(obj.toString());
            composedString.append("\t");
        }
        composedString.append("\n"); // terminate line
        return composedString.toString();
    }
}
