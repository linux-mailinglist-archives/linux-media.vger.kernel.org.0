Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0E224C830
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 01:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbgHTXG7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 19:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728587AbgHTXGv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 19:06:51 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E04ECC061385
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 16:06:50 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id m71so124483pfd.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 16:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=db2FsBhRvUQ2HyHBjwMXj+lvYz+EH01UsItCyDfyx1I=;
        b=Rze3oGsGlAbZgFoGG5bh14a4TuDc04geZESx6K9W38DCQReLEV9N311iLVpfqCXRhe
         iiFx3CzrDJyq+N+fJylhaY+y+pSQazoBH0dM5wWgIvR5qX52rUBj0oEc/NwfeD9wc6uM
         ES6NrqdUOGASnWZyjdWxTa2fyc2pVufDXRGR22omkEGpshI4wQL/6cOqnUBW1nBsZI2s
         k+ID3et7VF4yFXXDyjHYyR+nja7DKn02zF0MBdcW5dnn6rMB4QFXkmKDnwxZvElNtFu3
         xSK5oFhSFTq85QNx2VhQtRIsiXqcHSME39YtX4kaeiP4/YxVMR5Xk5zm+u+zwZl5j2Zl
         B5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=db2FsBhRvUQ2HyHBjwMXj+lvYz+EH01UsItCyDfyx1I=;
        b=PjjWM0oa7FL5C5t2KEmqfyYWUlj54UGZDN7Q3Iu01Iwq+YsakYG62zkksOzeIOIcP0
         AxZnVAuvgau8FvBGdp6DRWQ4NRDqhz9rTzgIVNv+Tc9TQRQiCeY6bRvJyTzDVJ/YmNgN
         CYbtt835/D+8Uw9SwevuBRpivbAyj/tkXc0uPej/LZIJlZE80uWDFt57F3F2qqHbmRk7
         0VFHoFYmfpjqkr0ntvbJQqn/+sPrvdN5//qwr9EmGCDtmkOkBPWPGvYQ+97+mgXl1e2K
         uWisJyQHtrqRXfFlFpMdpivzi7kqR1v4neveekFQDTSk54lrXZ6gH5v9V7TpZQh74Vtt
         g/dA==
X-Gm-Message-State: AOAM5311jBqdo9MtbMQa2AwZgyPtjnJcyNmV64sea4Uukt6wlkZJ1zSL
        XIZbh4rcdLgq8pQwjJz2jr/IT4oBcFVtQg==
X-Google-Smtp-Source: ABdhPJzFtCMtXtRMZ1f9Ovb+N1G9js9rw9xD9XPZckunMb92H19YtP7IyL9wojXUBumGusIaFQHG2A==
X-Received: by 2002:aa7:9613:: with SMTP id q19mr115081pfg.9.1597964809137;
        Thu, 20 Aug 2020 16:06:49 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id z25sm129605pfg.150.2020.08.20.16.06.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 16:06:48 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] clean up includes and convert C includes to C++
Date:   Thu, 20 Aug 2020 16:06:47 -0700
Message-Id: <20200820230647.20203-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several C includes ending in .h are deprecated in C++.

Tested with several combinations of uClibc-ng, musl, glibc, libstdcpp,
libcxx, and uClibc++.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp       | 19 +++-------
 utils/cec-compliance/cec-compliance.h         |  4 --
 utils/cec-compliance/cec-test-adapter.cpp     | 19 +++-------
 utils/cec-compliance/cec-test-audio.cpp       | 17 ++-------
 utils/cec-compliance/cec-test-fuzzing.cpp     | 15 ++------
 utils/cec-compliance/cec-test-power.cpp       | 16 +++-----
 utils/cec-compliance/cec-test.cpp             | 18 ++-------
 utils/cec-ctl/cec-ctl.cpp                     | 28 ++++++--------
 utils/cec-ctl/cec-pin.cpp                     | 18 +--------
 utils/cec-follower/cec-follower.cpp           | 15 ++------
 utils/cec-follower/cec-follower.h             |  4 --
 utils/cec-follower/cec-processing.cpp         | 17 +++------
 utils/cec-follower/cec-tuner.cpp              |  4 +-
 utils/common/media-info.cpp                   | 21 ++++-------
 utils/common/v4l2-info.cpp                    | 17 ---------
 utils/common/v4l2-info.h                      |  1 +
 utils/libcecutil/cec-info.cpp                 |  8 ++--
 utils/libcecutil/cec-log.cpp                  | 10 ++---
 utils/libcecutil/cec-parse.cpp                | 23 ++----------
 utils/rds-ctl/rds-ctl.cpp                     | 37 +++++++------------
 utils/v4l2-compliance/v4l2-compliance.cpp     | 24 ++++--------
 utils/v4l2-compliance/v4l2-compliance.h       |  7 ----
 utils/v4l2-compliance/v4l2-test-buffers.cpp   | 26 ++++---------
 utils/v4l2-compliance/v4l2-test-codecs.cpp    | 15 ++------
 utils/v4l2-compliance/v4l2-test-colors.cpp    | 17 ++-------
 utils/v4l2-compliance/v4l2-test-controls.cpp  | 15 ++------
 utils/v4l2-compliance/v4l2-test-debug.cpp     | 17 ++-------
 utils/v4l2-compliance/v4l2-test-formats.cpp   | 15 ++------
 .../v4l2-test-input-output.cpp                | 16 +++-----
 utils/v4l2-compliance/v4l2-test-io-config.cpp | 14 ++-----
 utils/v4l2-compliance/v4l2-test-media.cpp     | 20 +++-------
 utils/v4l2-compliance/v4l2-test-subdevs.cpp   | 14 ++-----
 utils/v4l2-ctl/v4l2-ctl-common.cpp            | 28 +++++---------
 utils/v4l2-ctl/v4l2-ctl-edid.cpp              | 13 +------
 utils/v4l2-ctl/v4l2-ctl-io.cpp                | 16 --------
 utils/v4l2-ctl/v4l2-ctl-meta.cpp              | 17 +--------
 utils/v4l2-ctl/v4l2-ctl-misc.cpp              | 17 ---------
 utils/v4l2-ctl/v4l2-ctl-modes.cpp             |  2 -
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp           | 17 +--------
 utils/v4l2-ctl/v4l2-ctl-sdr.cpp               | 17 ---------
 utils/v4l2-ctl/v4l2-ctl-selection.cpp         | 17 ---------
 utils/v4l2-ctl/v4l2-ctl-stds.cpp              | 17 +--------
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp         | 21 +----------
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp            | 17 ---------
 utils/v4l2-ctl/v4l2-ctl-tuner.cpp             | 15 --------
 utils/v4l2-ctl/v4l2-ctl-vbi.cpp               | 16 --------
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp            | 19 ++--------
 utils/v4l2-ctl/v4l2-ctl-vidout.cpp            | 17 ---------
 utils/v4l2-ctl/v4l2-ctl.cpp                   | 24 ++----------
 utils/v4l2-ctl/v4l2-ctl.h                     |  2 -
 utils/v4l2-dbg/v4l2-dbg.cpp                   | 26 ++++---------
 51 files changed, 167 insertions(+), 662 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 06a8e23f2..2f085b49d 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -3,22 +3,13 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/time.h>
+#include <sstream>
+
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <getopt.h>
 #include <sys/ioctl.h>
-#include <sys/wait.h>
-#include <sstream>
-#include <cstdlib>
+#include <sys/time.h>
+#include <unistd.h>
 
 #include "cec-compliance.h"
 #include "compiler.h"
diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index 728df5821..d87e4f1b7 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -8,10 +8,6 @@
 #ifndef _CEC_COMPLIANCE_H_
 #define _CEC_COMPLIANCE_H_
 
-#include <cstdlib>
-#include <ctime>
-#include <string>
-
 #include <linux/cec-funcs.h>
 #include "cec-htng-funcs.h"
 
diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index f19329a9b..4fb7bc080 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -3,21 +3,14 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
+#include <cerrno>
+#include <ctime>
+#include <string>
+
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
 #include <sys/ioctl.h>
-#include <sys/wait.h>
-#include <sstream>
-#include <cstdlib>
+#include <sys/select.h>
+#include <unistd.h>
 
 #include "cec-compliance.h"
 
diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 85b3777de..980a96400 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -3,23 +3,14 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <ctime>
+#include <string>
+
 #include <sys/ioctl.h>
-#include <config.h>
-#include <cstdlib>
+#include <unistd.h>
 
 #include "cec-compliance.h"
 
-
 /* Dynamic Auto Lipsync */
 
 static int dal_request_current_latency(struct node *node, unsigned me, unsigned la, bool interactive)
diff --git a/utils/cec-compliance/cec-test-fuzzing.cpp b/utils/cec-compliance/cec-test-fuzzing.cpp
index ce0bf12d5..0fe1d5ae5 100644
--- a/utils/cec-compliance/cec-test-fuzzing.cpp
+++ b/utils/cec-compliance/cec-test-fuzzing.cpp
@@ -3,19 +3,10 @@
  * Copyright 2019 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <ctime>
+#include <string>
+
 #include <sys/ioctl.h>
-#include <config.h>
-#include <sstream>
 
 #include "cec-compliance.h"
 
diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
index 3714d03cc..81faa60ed 100644
--- a/utils/cec-compliance/cec-test-power.cpp
+++ b/utils/cec-compliance/cec-test-power.cpp
@@ -3,18 +3,12 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cerrno>
+#include <ctime>
+#include <string>
+
 #include <sys/ioctl.h>
-#include <config.h>
+#include <unistd.h>
 
 #include "cec-compliance.h"
 
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 986d134f7..7b39e20bc 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -3,23 +3,13 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <cstdlib>
 #include <cstring>
-
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <inttypes.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <config.h>
+#include <map>
 #include <sstream>
 #include <vector>
-#include <map>
+
+#include <sys/ioctl.h>
+#include <unistd.h>
 
 #include "cec-compliance.h"
 
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 0cdab383c..217950fa4 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -3,28 +3,22 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <algorithm>
+#include <cctype>
+#include <cerrno>
 #include <cstring>
+#include <ctime>
+#include <map>
+#include <string>
+#include <vector>
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 #include <dirent.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <getopt.h>
 #include <sys/ioctl.h>
-#include <stdarg.h>
-#include <ctime>
-#include <cerrno>
-#include <string>
-#include <vector>
-#include <map>
-#include <algorithm>
+#include <sys/time.h>
+#include <unistd.h>
+
 #include <linux/cec-funcs.h>
 #include "cec-htng-funcs.h"
 #include "cec-log.h"
diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
index c09d6bbd3..f9ecac7fb 100644
--- a/utils/cec-ctl/cec-pin.cpp
+++ b/utils/cec-ctl/cec-pin.cpp
@@ -3,24 +3,8 @@
  * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <stdarg.h>
-#include <cerrno>
 #include <string>
-#include <vector>
-#include <algorithm>
+
 #include <linux/cec.h>
 #include "cec-htng.h"
 
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 673c6e313..975c7dc96 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -3,22 +3,13 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <cstdlib>
 #include <cstring>
+#include <ctime>
+#include <sstream>
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <getopt.h>
 #include <sys/ioctl.h>
-#include <sys/wait.h>
-#include <sstream>
 
 #include "cec-follower.h"
 #include "compiler.h"
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 222342e75..7371126c3 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -8,10 +8,6 @@
 #ifndef _CEC_FOLLOWER_H_
 #define _CEC_FOLLOWER_H_
 
-#include <stdarg.h>
-#include <ctime>
-#include <cerrno>
-#include <string>
 #include <linux/cec-funcs.h>
 #include "cec-htng-funcs.h"
 
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 074e245d5..2a6545689 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -3,19 +3,12 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cerrno>
+#include <ctime>
+#include <string>
+
 #include <sys/ioctl.h>
-#include <config.h>
+#include <sys/time.h>
 
 #include "cec-follower.h"
 #include "compiler.h"
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 4aecebce1..ac5c49950 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -3,8 +3,10 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <ctime>
+#include <string>
+
 #include <sys/ioctl.h>
-#include <stdlib.h>
 
 #include "cec-follower.h"
 #include "compiler.h"
diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 78ed67460..5e40bafc2 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -3,26 +3,19 @@
  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <sys/types.h>
-#include <sys/stat.h>
+#include <cstring>
+#include <fstream>
+#include <iostream>
+
+#include <dirent.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
 #include <sys/ioctl.h>
-#include <sys/time.h>
+#include <sys/stat.h>
 #include <sys/sysmacros.h>
-#include <dirent.h>
-#include <cstdlib>
+#include <unistd.h>
 
 #include <linux/media.h>
 
-#include <iostream>
-#include <fstream>
 #include <media-info.h>
 
 static std::string num2s(unsigned num, bool is_hex = true)
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 16be409a4..2903a125b 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -3,25 +3,8 @@
  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <sys/sysmacros.h>
-#include <dirent.h>
-
 #include <v4l2-info.h>
 
-#include <fstream>
-
 static std::string num2s(unsigned num, bool is_hex = true)
 {
 	char buf[16];
diff --git a/utils/common/v4l2-info.h b/utils/common/v4l2-info.h
index ce2600f06..f7e945a45 100644
--- a/utils/common/v4l2-info.h
+++ b/utils/common/v4l2-info.h
@@ -7,6 +7,7 @@
 #define _V4L2_INFO_H
 
 #include <string>
+
 #include <linux/videodev2.h>
 
 /* Print capability information */
diff --git a/utils/libcecutil/cec-info.cpp b/utils/libcecutil/cec-info.cpp
index 9a12e6a17..8f85db112 100644
--- a/utils/libcecutil/cec-info.cpp
+++ b/utils/libcecutil/cec-info.cpp
@@ -5,12 +5,14 @@
  * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <stdio.h>
+#include <cctype>
 #include <string>
-#include <unistd.h>
-#include <fcntl.h>
+
 #include <dirent.h>
+#include <fcntl.h>
 #include <sys/ioctl.h>
+#include <unistd.h>
+
 #include <cec-info.h>
 #include <cec-htng.h>
 
diff --git a/utils/libcecutil/cec-log.cpp b/utils/libcecutil/cec-log.cpp
index 56676431b..4e34b7092 100644
--- a/utils/libcecutil/cec-log.cpp
+++ b/utils/libcecutil/cec-log.cpp
@@ -3,14 +3,12 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <stdarg.h>
 #include <string>
+
+#include <unistd.h>
+
 #include <linux/cec-funcs.h>
+
 #include "cec-htng-funcs.h"
 #include "cec-info.h"
 #include "cec-log.h"
diff --git a/utils/libcecutil/cec-parse.cpp b/utils/libcecutil/cec-parse.cpp
index 8c869fec0..1190d8e52 100644
--- a/utils/libcecutil/cec-parse.cpp
+++ b/utils/libcecutil/cec-parse.cpp
@@ -3,27 +3,12 @@
  * Copyright 2019 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <stdarg.h>
+#include <cctype>
 #include <cstring>
-#include <ctime>
-#include <cerrno>
 #include <string>
-#include <vector>
-#include <map>
-#include <algorithm>
+
+#include <unistd.h>
+
 #include <linux/cec-funcs.h>
 #include "cec-htng-funcs.h"
 #include "cec-log.h"
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index cabfa5383..37ab7dad4 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -7,34 +7,25 @@
  * Author: Konke Radlow <koradlow@gmail.com>
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <wchar.h>
-#include <locale.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <config.h>
-#include <signal.h>
-
-#include <linux/videodev2.h>
-#include <libv4l2rds.h>
-
 #include <cctype>
+#include <cerrno>
+#include <clocale>
 #include <cmath>
+#include <csignal>
+#include <cstring>
 #include <ctime>
-#include <list>
-#include <vector>
 #include <map>
 #include <string>
-#include <algorithm>
+#include <vector>
+
+#include <dirent.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+#include <linux/videodev2.h>
+#include <libv4l2rds.h>
 
 #define ARRAY_SIZE(arr) ((int)(sizeof(arr) / sizeof((arr)[0])))
 
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index fa941a140..4ff0a3036 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -18,27 +18,17 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <cstdlib>
+#include <cctype>
+#include <csignal>
 #include <cstring>
+#include <map>
+#include <set>
+#include <vector>
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <inttypes.h>
+#include <dirent.h>
 #include <getopt.h>
 #include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <sys/sysmacros.h>
-#include <dirent.h>
-#include <math.h>
-#include <sys/utsname.h>
-#include <signal.h>
-#include <vector>
+#include <unistd.h>
 
 #include "v4l2-compliance.h"
 #include <media-info.h>
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 38a4ded37..5cfe870b8 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -21,13 +21,6 @@
 #ifndef _V4L2_COMPLIANCE_H_
 #define _V4L2_COMPLIANCE_H_
 
-#include <stdarg.h>
-#include <cerrno>
-#include <cstdlib>
-#include <string>
-#include <map>
-#include <set>
-#include <map>
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
 #include <linux/media.h>
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 5df71b80b..aca0eb68f 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -18,28 +18,18 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
-#include <sys/wait.h>
-#include <sys/epoll.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <poll.h>
-#include <pthread.h>
-#include <signal.h>
-#include <sys/ioctl.h>
-#include <netinet/in.h>
 #include <algorithm>
 #include <atomic>
+#include <csignal>
 #include <map>
+#include <set>
 #include <vector>
+
+#include <arpa/inet.h>
+#include <poll.h>
+#include <pthread.h>
+#include <sys/epoll.h>
+
 #include "v4l2-compliance.h"
 
 #define V4L2_CTRL_CLASS_VIVID		0x00f00000
diff --git a/utils/v4l2-compliance/v4l2-test-codecs.cpp b/utils/v4l2-compliance/v4l2-test-codecs.cpp
index 3fd44c8b0..0acdc27de 100644
--- a/utils/v4l2-compliance/v4l2-test-codecs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-codecs.cpp
@@ -18,18 +18,11 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
+#include <map>
+#include <set>
+
 #include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <assert.h>
+
 #include "v4l2-compliance.h"
 
 int testEncoder(struct node *node)
diff --git a/utils/v4l2-compliance/v4l2-test-colors.cpp b/utils/v4l2-compliance/v4l2-test-colors.cpp
index 09d29a3ee..936515048 100644
--- a/utils/v4l2-compliance/v4l2-test-colors.cpp
+++ b/utils/v4l2-compliance/v4l2-test-colors.cpp
@@ -14,20 +14,11 @@
     GNU General Public License for more details.
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
+#include <cstdio>
+#include <map>
+#include <set>
+
 #include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <math.h>
 
 #include "compiler.h"
 #include "v4l2-compliance.h"
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index 1627b8a1a..fcc42cdfb 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -18,19 +18,12 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
+#include <map>
+#include <set>
 #include <vector>
 
+#include <sys/types.h>
+
 #include "compiler.h"
 #include "v4l2-compliance.h"
 
diff --git a/utils/v4l2-compliance/v4l2-test-debug.cpp b/utils/v4l2-compliance/v4l2-test-debug.cpp
index 3f43e661e..877b577c3 100644
--- a/utils/v4l2-compliance/v4l2-test-debug.cpp
+++ b/utils/v4l2-compliance/v4l2-test-debug.cpp
@@ -18,20 +18,11 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
+#include <map>
+#include <set>
+
 #include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <math.h>
+
 #include "v4l2-compliance.h"
 
 int testRegister(struct node *node)
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index d771dc4a2..5ba40d0b5 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -18,18 +18,11 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
+#include <cassert>
+#include <map>
+#include <set>
+
 #include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <assert.h>
 
 #include "compiler.h"
 #include "v4l2-compliance.h"
diff --git a/utils/v4l2-compliance/v4l2-test-input-output.cpp b/utils/v4l2-compliance/v4l2-test-input-output.cpp
index e86d706b1..7088819ad 100644
--- a/utils/v4l2-compliance/v4l2-test-input-output.cpp
+++ b/utils/v4l2-compliance/v4l2-test-input-output.cpp
@@ -18,18 +18,12 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
+#include <map>
+#include <set>
 #include <vector>
+
+#include <sys/types.h>
+
 #include "v4l2-compliance.h"
 
 #define MAGIC 0x1eadbeef
diff --git a/utils/v4l2-compliance/v4l2-test-io-config.cpp b/utils/v4l2-compliance/v4l2-test-io-config.cpp
index 9ade11e82..1d672520d 100644
--- a/utils/v4l2-compliance/v4l2-test-io-config.cpp
+++ b/utils/v4l2-compliance/v4l2-test-io-config.cpp
@@ -18,17 +18,11 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
+#include <map>
+#include <set>
+
 #include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
+
 #include "v4l2-compliance.h"
 
 static int checkStd(struct node *node, bool has_std, v4l2_std_id mask, bool is_input)
diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
index acbee3311..a7dd81b2c 100644
--- a/utils/v4l2-compliance/v4l2-test-media.cpp
+++ b/utils/v4l2-compliance/v4l2-test-media.cpp
@@ -18,22 +18,12 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/sysmacros.h>
-#include <fcntl.h>
-#include <dirent.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <assert.h>
+#include <map>
 #include <set>
-#include <fstream>
+
+#include <dirent.h>
+#include <sys/sysmacros.h>
+#include <sys/types.h>
 
 #include "v4l2-compliance.h"
 
diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index 489639fb0..ec3ef1699 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -18,18 +18,10 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
+#include <map>
+#include <set>
+
 #include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <assert.h>
 
 #include "v4l2-compliance.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index ed28a568c..b15c03f14 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -1,18 +1,14 @@
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
+#include <algorithm>
+#include <cctype>
+#include <cstring>
+#include <list>
+#include <map>
+#include <vector>
+
+#include <dirent.h>
 #include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
 #include <sys/sysmacros.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <math.h>
+
 #include <linux/media.h>
 
 #include "v4l2-ctl.h"
@@ -21,12 +17,6 @@
 #include <sys/klog.h>
 #endif
 
-#include <cstring>
-#include <list>
-#include <vector>
-#include <map>
-#include <algorithm>
-
 struct ctrl_subset {
 	unsigned offset[V4L2_CTRL_MAX_DIMS];
 	unsigned size[V4L2_CTRL_MAX_DIMS];
diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
index a0a08d69a..d82af0c90 100644
--- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
@@ -1,19 +1,10 @@
-#include <cstdlib>
+#include <cctype>
 #include <cstring>
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <inttypes.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
+#include <linux/v4l2-subdev.h>
 
 #include "v4l2-ctl.h"
 
-#include <linux/v4l2-subdev.h>
-
 /*
  * The 24-bit IEEE Registration Identifier for the HDMI-LLC Vendor
  * Specific Data Block.
diff --git a/utils/v4l2-ctl/v4l2-ctl-io.cpp b/utils/v4l2-ctl/v4l2-ctl-io.cpp
index 9e83c03aa..ac30b062b 100644
--- a/utils/v4l2-ctl/v4l2-ctl-io.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-io.cpp
@@ -1,19 +1,3 @@
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <math.h>
-
 #include "v4l2-ctl.h"
 
 static struct v4l2_audio vaudio;	/* list audio inputs */
diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index b4c7bb89b..aa50a9840 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -1,19 +1,4 @@
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <math.h>
-#include <cstdlib>
+#include <endian.h>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
index f37e38e19..a9eec94d1 100644
--- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
@@ -1,20 +1,3 @@
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <math.h>
-#include <cstdlib>
-
 #include "v4l2-ctl.h"
 
 struct v4l2_decoder_cmd dec_cmd; /* (try_)decoder_cmd */
diff --git a/utils/v4l2-ctl/v4l2-ctl-modes.cpp b/utils/v4l2-ctl/v4l2-ctl-modes.cpp
index b311ce5d1..7e1d759ce 100644
--- a/utils/v4l2-ctl/v4l2-ctl-modes.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-modes.cpp
@@ -6,8 +6,6 @@
  * reserved.
  */
 
-#include <stdio.h>
-#include <stdbool.h>
 #include "v4l2-ctl.h"
 
 static bool valid_params(int width, int height, int refresh_rate)
diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index 7809a6dbc..6c73d03df 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -1,21 +1,6 @@
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <math.h>
+#include <vector>
 
 #include <linux/fb.h>
-#include <vector>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
index 7a36341a7..af0d0ef12 100644
--- a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
@@ -1,20 +1,3 @@
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <math.h>
-#include <cstdlib>
-
 #include "v4l2-ctl.h"
 
 static struct v4l2_format vfmt;	/* set_format/get_format */
diff --git a/utils/v4l2-ctl/v4l2-ctl-selection.cpp b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
index 5cafb9f4f..1665607e6 100644
--- a/utils/v4l2-ctl/v4l2-ctl-selection.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
@@ -1,20 +1,3 @@
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <math.h>
-#include <cstdlib>
-
 #include "v4l2-ctl.h"
 
 /* crop specified */
diff --git a/utils/v4l2-ctl/v4l2-ctl-stds.cpp b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
index f613d0379..13f26757b 100644
--- a/utils/v4l2-ctl/v4l2-ctl-stds.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
@@ -1,19 +1,4 @@
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <math.h>
-#include <cstdlib>
+#include <cctype>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index c936299f6..04af717ea 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1,25 +1,8 @@
-#include <algorithm>
-#include <cstdlib>
 #include <cstring>
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/socket.h>
-#include <netinet/in.h>
 #include <netdb.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <sys/mman.h>
-#include <dirent.h>
-#include <math.h>
+#include <sys/types.h>
+
 #include <linux/media.h>
 
 #include "compiler.h"
diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index c0f36eab7..08ead1254 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -1,20 +1,3 @@
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <math.h>
-#include <cstdlib>
-
 #include "v4l2-ctl.h"
 
 struct mbus_name {
diff --git a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
index 2f854dc2b..f5a04d25e 100644
--- a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
@@ -1,19 +1,4 @@
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
 #include <cmath>
-#include <cstdlib>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
index e72886f82..358aba6a3 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
@@ -1,21 +1,5 @@
 #include <cstring>
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <math.h>
-#include <cstdlib>
-
 #include "compiler.h"
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 5abab5e78..4dc993242 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -1,19 +1,6 @@
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <math.h>
-#include <cstdlib>
+#include <cctype>
+
+#include <endian.h>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
index 5f433a17d..1d1d54899 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
@@ -1,20 +1,3 @@
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <dirent.h>
-#include <math.h>
-#include <cstdlib>
-
 #include "v4l2-ctl.h"
 
 static unsigned set_fmts_out;
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index a31b29f81..f426f4cf8 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -20,23 +20,11 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
+#include <cctype>
+
+#include <dirent.h>
 #include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
 #include <sys/epoll.h>
-#include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <sys/sysmacros.h>
-#include <dirent.h>
-#include <math.h>
 
 #include <linux/media.h>
 
@@ -48,12 +36,6 @@
 #include <sys/klog.h>
 #endif
 
-#include <list>
-#include <vector>
-#include <map>
-#include <algorithm>
-#include <fstream>
-
 char options[OptLast];
 
 static int app_result;
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index 4acb4d51f..849db53ea 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -7,8 +7,6 @@
 #include <config.h>
 #endif
 
-#include <string>
-
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
 
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index c4a7b942c..6a190f1b8 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -16,20 +16,16 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <inttypes.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
+#include <cctype>
+#include <cerrno>
+#include <cstring>
+#include <string>
+#include <vector>
+
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <getopt.h>
 #include <sys/ioctl.h>
-#include <sys/time.h>
-#include <math.h>
-#include <cstdlib>
+#include <unistd.h>
 
 #ifdef ANDROID
 #include <android-config.h>
@@ -43,12 +39,6 @@
 
 #include <linux/videodev2.h>
 
-#include <cstring>
-#include <list>
-#include <vector>
-#include <map>
-#include <string>
-
 #include "v4l2-dbg-bttv.h"
 #include "v4l2-dbg-saa7134.h"
 #include "v4l2-dbg-em28xx.h"
-- 
2.26.2

