Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4191BD36C
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 06:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgD2EGi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 00:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726702AbgD2EGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 00:06:37 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483ACC03C1AC
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 21:06:37 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id z6so353450plk.10
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 21:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=b1uKb70LXRyDSBLoWl8yZQ9BoF1bc2+mOEiuStCSyF4=;
        b=k0HpuL4kVE3cRTv9ydck06w1AmdRnEK2xmdH96NbFmjVHmC8C1mZJLopAjAcg4/eW0
         M0IZGdW4fme+TcVtiQMVjQIycMsM1GfuJIXzp08RyhhxUd2lijDHGu2dWZVKT5/RLTC6
         FYBFU+Gu+2OEIdV2AVO/Bo2i22rzLslO2BCzM6EsbpjQ5jVyhy/U4Ibakfx1qBid53Nk
         oCsmEyByAleMqtk7m89lSVt+AQF9bdv7OBHo12UrwBGxpH93I2m0QAYdHTrd02j8X4UT
         yiTV9b43GjzUQ64manUDGv1a0NfUWwXvdGDo9M+SHRWUyYgBhbKi3QPKnHipo5sWRJV8
         xVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b1uKb70LXRyDSBLoWl8yZQ9BoF1bc2+mOEiuStCSyF4=;
        b=eyna+zw+aZxp2vNs3CSaoJefOstdiCADq3rYDJ2q8C5z6Eq+jjKPseL/Nmgr/oKI7c
         v9YPvgnOR14vIm3fqJRrPa2vpyFZk8ierUXNCHvLZKbQRmQNo1UrVX0Xe3Igzbuag3Nc
         1nT0Xm7pW3qxzDbolZxJFwbbcfgx3TPKl1/NP05ppI3YBmmnRDCuvsrJEj9JfJSr+gPF
         oSGu2Dw0pAbGu6hC+QvO7/zm7MM2gtStfSfN6V81ps4iEja9y7dgUVZRezwpoeNPqZT8
         i34aS4ye3z+eBVaXzRu6daRuHCE+XZgutpRFV1byhi3WhWSqr0n7JzAT9p+/3Nm8AIgj
         aOJg==
X-Gm-Message-State: AGi0PuY5d5eU4fPhishQN8mexYWF4Et0LaagPv+RVDlC0MkVhnxZ1v5c
        r2ImMc9iao0J21yx+9IWnLuamHJipx4=
X-Google-Smtp-Source: APiQypJ/ODU1hjlPBYJVKSuNa0z0zZ9yoUofbzEHSG8GxYVCvlIuZFygtV6Gc1K9snUeH3juRgseqA==
X-Received: by 2002:a17:902:b097:: with SMTP id p23mr32428938plr.195.1588133195916;
        Tue, 28 Apr 2020 21:06:35 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id i25sm16103370pfo.196.2020.04.28.21.06.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 21:06:35 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 7/7] utils: switch C to C++ headers
Date:   Tue, 28 Apr 2020 21:06:27 -0700
Message-Id: <20200429040627.27859-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200429040627.27859-1-rosenp@gmail.com>
References: <20200429040627.27859-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Recently, I changed exit() to the std variant, which caused build
failures on older platforms. Switch all headers to the C++ variants
to avoid this.

These C headers are deprecated by C++14.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp          | 10 +++++-----
 utils/cec-compliance/cec-test-adapter.cpp        | 10 +++++-----
 utils/cec-compliance/cec-test-audio.cpp          | 10 +++++-----
 utils/cec-compliance/cec-test-fuzzing.cpp        | 10 +++++-----
 utils/cec-compliance/cec-test-power.cpp          | 10 +++++-----
 utils/cec-compliance/cec-test.cpp                |  8 ++++----
 utils/cec-ctl/cec-ctl.cpp                        | 10 +++++-----
 utils/cec-ctl/cec-pin.cpp                        | 12 ++++++------
 utils/cec-follower/cec-follower.cpp              |  8 ++++----
 utils/cec-follower/cec-processing.cpp            | 10 +++++-----
 utils/cec-follower/cec-tuner.cpp                 |  2 +-
 utils/common/media-info.cpp                      | 10 +++++-----
 utils/common/v4l2-info.cpp                       | 10 +++++-----
 utils/libcecutil/cec-info.cpp                    |  2 +-
 utils/libcecutil/cec-log.cpp                     |  8 ++++----
 utils/libcecutil/cec-parse.cpp                   | 10 +++++-----
 utils/rds-ctl/rds-ctl.cpp                        | 14 +++++++-------
 utils/v4l2-compliance/v4l2-compliance.cpp        | 12 ++++++------
 utils/v4l2-compliance/v4l2-test-buffers.cpp      | 10 +++++-----
 utils/v4l2-compliance/v4l2-test-codecs.cpp       | 12 ++++++------
 utils/v4l2-compliance/v4l2-test-colors.cpp       | 12 ++++++------
 utils/v4l2-compliance/v4l2-test-controls.cpp     | 10 +++++-----
 utils/v4l2-compliance/v4l2-test-debug.cpp        | 12 ++++++------
 utils/v4l2-compliance/v4l2-test-formats.cpp      | 12 ++++++------
 utils/v4l2-compliance/v4l2-test-input-output.cpp | 10 +++++-----
 utils/v4l2-compliance/v4l2-test-io-config.cpp    | 10 +++++-----
 utils/v4l2-compliance/v4l2-test-media.cpp        | 12 ++++++------
 utils/v4l2-compliance/v4l2-test-subdevs.cpp      | 12 ++++++------
 utils/v4l2-ctl/v4l2-ctl-common.cpp               | 10 +++++-----
 utils/v4l2-ctl/v4l2-ctl-edid.cpp                 |  8 ++++----
 utils/v4l2-ctl/v4l2-ctl-io.cpp                   | 12 ++++++------
 utils/v4l2-ctl/v4l2-ctl-meta.cpp                 | 12 ++++++------
 utils/v4l2-ctl/v4l2-ctl-misc.cpp                 | 12 ++++++------
 utils/v4l2-ctl/v4l2-ctl-modes.cpp                |  4 ++--
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp              | 12 ++++++------
 utils/v4l2-ctl/v4l2-ctl-sdr.cpp                  | 12 ++++++------
 utils/v4l2-ctl/v4l2-ctl-selection.cpp            | 12 ++++++------
 utils/v4l2-ctl/v4l2-ctl-stds.cpp                 | 12 ++++++------
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp            | 10 +++++-----
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp               | 12 ++++++------
 utils/v4l2-ctl/v4l2-ctl-tuner.cpp                | 10 +++++-----
 utils/v4l2-ctl/v4l2-ctl-vbi.cpp                  | 10 +++++-----
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp               | 12 ++++++------
 utils/v4l2-ctl/v4l2-ctl-vidout.cpp               | 12 ++++++------
 utils/v4l2-ctl/v4l2-ctl.cpp                      | 12 ++++++------
 utils/v4l2-dbg/v4l2-dbg.cpp                      | 10 +++++-----
 46 files changed, 236 insertions(+), 236 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index ced256f2..8a520786 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -4,17 +4,17 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/time.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/wait.h>
 #include <sstream>
diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index df7374df..b7a8159d 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -4,16 +4,16 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/wait.h>
 #include <sstream>
diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index d422a7da..edf528c9 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -4,15 +4,15 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <config.h>
 
diff --git a/utils/cec-compliance/cec-test-fuzzing.cpp b/utils/cec-compliance/cec-test-fuzzing.cpp
index ce0bf12d..708a8ec3 100644
--- a/utils/cec-compliance/cec-test-fuzzing.cpp
+++ b/utils/cec-compliance/cec-test-fuzzing.cpp
@@ -4,15 +4,15 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <config.h>
 #include <sstream>
diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
index 2758c36d..e35264aa 100644
--- a/utils/cec-compliance/cec-test-power.cpp
+++ b/utils/cec-compliance/cec-test-power.cpp
@@ -4,15 +4,15 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <config.h>
 
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 75e56fde..ac99eeba 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -6,14 +6,14 @@
 #include <cstring>
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
+#include <cstdlib>
+#include <cstdio>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <config.h>
 #include <sstream>
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index c7fd7cd8..de7bfc97 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -6,8 +6,8 @@
 #include <cstring>
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
+#include <cstdlib>
+#include <cstdio>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
@@ -15,10 +15,10 @@
 #include <sys/time.h>
 #include <dirent.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
-#include <stdarg.h>
+#include <cstdarg>
 #include <ctime>
 #include <cerrno>
 #include <string>
diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
index c09d6bbd..3ff4734f 100644
--- a/utils/cec-ctl/cec-pin.cpp
+++ b/utils/cec-ctl/cec-pin.cpp
@@ -4,19 +4,19 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/time.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
-#include <stdarg.h>
+#include <cstdarg>
 #include <cerrno>
 #include <string>
 #include <vector>
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 3314a0a1..2819c769 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -6,15 +6,15 @@
 #include <cstring>
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
+#include <cstdlib>
+#include <cstdio>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/wait.h>
 #include <sstream>
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index bc8c9c09..e2c5c8e2 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -4,16 +4,16 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/time.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <config.h>
 
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 4aecebce..7ac0decb 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -4,7 +4,7 @@
  */
 
 #include <sys/ioctl.h>
-#include <stdlib.h>
+#include <cstdlib>
 
 #include "cec-follower.h"
 #include "compiler.h"
diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 89dfe2d7..11141677 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -4,15 +4,15 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <sys/sysmacros.h>
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 0aac8504..28116fd3 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -4,15 +4,15 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <sys/sysmacros.h>
diff --git a/utils/libcecutil/cec-info.cpp b/utils/libcecutil/cec-info.cpp
index 6741e358..b91de313 100644
--- a/utils/libcecutil/cec-info.cpp
+++ b/utils/libcecutil/cec-info.cpp
@@ -5,7 +5,7 @@
  * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <stdio.h>
+#include <cstdio>
 #include <string>
 #include <unistd.h>
 #include <fcntl.h>
diff --git a/utils/libcecutil/cec-log.cpp b/utils/libcecutil/cec-log.cpp
index 9410c071..84eef739 100644
--- a/utils/libcecutil/cec-log.cpp
+++ b/utils/libcecutil/cec-log.cpp
@@ -4,11 +4,11 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
-#include <stdarg.h>
+#include <cstdarg>
 #include <string>
 #include <linux/cec-funcs.h>
 #include "cec-htng-funcs.h"
diff --git a/utils/libcecutil/cec-parse.cpp b/utils/libcecutil/cec-parse.cpp
index 54c000bb..b7d2d206 100644
--- a/utils/libcecutil/cec-parse.cpp
+++ b/utils/libcecutil/cec-parse.cpp
@@ -4,8 +4,8 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
+#include <cstdlib>
+#include <cstdio>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
@@ -13,10 +13,10 @@
 #include <sys/time.h>
 #include <dirent.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
-#include <stdarg.h>
+#include <cstdarg>
 #include <cstring>
 #include <ctime>
 #include <cerrno>
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 00908533..9ff5766f 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -8,21 +8,21 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <wchar.h>
-#include <locale.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
+#include <cwchar>
+#include <clocale>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <fcntl.h>
-#include <errno.h>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
 #include <config.h>
-#include <signal.h>
+#include <csignal>
 
 #include <linux/videodev2.h>
 #include <libv4l2rds.h>
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 6c92b901..6721dd20 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -21,22 +21,22 @@
 #include <cstring>
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
+#include <cstdlib>
+#include <cstdio>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <sys/sysmacros.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 #include <sys/utsname.h>
-#include <signal.h>
+#include <csignal>
 #include <vector>
 
 #include "v4l2-compliance.h"
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index fc49fff6..e2df126d 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -19,9 +19,9 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -29,8 +29,8 @@
 #include <sys/wait.h>
 #include <sys/epoll.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <poll.h>
 #include <sys/ioctl.h>
 #include <netinet/in.h>
diff --git a/utils/v4l2-compliance/v4l2-test-codecs.cpp b/utils/v4l2-compliance/v4l2-test-codecs.cpp
index 3fd44c8b..377574ec 100644
--- a/utils/v4l2-compliance/v4l2-test-codecs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-codecs.cpp
@@ -19,17 +19,17 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
-#include <assert.h>
+#include <cassert>
 #include "v4l2-compliance.h"
 
 int testEncoder(struct node *node)
diff --git a/utils/v4l2-compliance/v4l2-test-colors.cpp b/utils/v4l2-compliance/v4l2-test-colors.cpp
index 09d29a3e..6996877d 100644
--- a/utils/v4l2-compliance/v4l2-test-colors.cpp
+++ b/utils/v4l2-compliance/v4l2-test-colors.cpp
@@ -15,19 +15,19 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
-#include <math.h>
+#include <cmath>
 
 #include "compiler.h"
 #include "v4l2-compliance.h"
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index d81dddb2..c3c27119 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -19,15 +19,15 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <vector>
 
diff --git a/utils/v4l2-compliance/v4l2-test-debug.cpp b/utils/v4l2-compliance/v4l2-test-debug.cpp
index 3f43e661..206b4b82 100644
--- a/utils/v4l2-compliance/v4l2-test-debug.cpp
+++ b/utils/v4l2-compliance/v4l2-test-debug.cpp
@@ -19,19 +19,19 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
-#include <math.h>
+#include <cmath>
 #include "v4l2-compliance.h"
 
 int testRegister(struct node *node)
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 4ea97ee7..70df465c 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -19,17 +19,17 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
-#include <assert.h>
+#include <cassert>
 
 #include "compiler.h"
 #include "v4l2-compliance.h"
diff --git a/utils/v4l2-compliance/v4l2-test-input-output.cpp b/utils/v4l2-compliance/v4l2-test-input-output.cpp
index fb8d12b1..e597d126 100644
--- a/utils/v4l2-compliance/v4l2-test-input-output.cpp
+++ b/utils/v4l2-compliance/v4l2-test-input-output.cpp
@@ -19,15 +19,15 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include "v4l2-compliance.h"
 
diff --git a/utils/v4l2-compliance/v4l2-test-io-config.cpp b/utils/v4l2-compliance/v4l2-test-io-config.cpp
index 9ade11e8..be885cb3 100644
--- a/utils/v4l2-compliance/v4l2-test-io-config.cpp
+++ b/utils/v4l2-compliance/v4l2-test-io-config.cpp
@@ -19,15 +19,15 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include "v4l2-compliance.h"
 
diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
index bcd8a725..94c25932 100644
--- a/utils/v4l2-compliance/v4l2-test-media.cpp
+++ b/utils/v4l2-compliance/v4l2-test-media.cpp
@@ -19,19 +19,19 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/sysmacros.h>
 #include <fcntl.h>
 #include <dirent.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
-#include <assert.h>
+#include <cassert>
 #include <set>
 #include <fstream>
 
diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index 489639fb..54d3c430 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -19,17 +19,17 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
-#include <assert.h>
+#include <cassert>
 
 #include "v4l2-compliance.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 632ada9e..c33f4d46 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -1,18 +1,18 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
+#include <cstdlib>
+#include <cstdio>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/sysmacros.h>
 #include <sys/time.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 #include <linux/media.h>
 
 #include "v4l2-ctl.h"
diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
index 3c09de7a..eb8543f3 100644
--- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
@@ -1,12 +1,12 @@
 #include <cstring>
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
+#include <cstdlib>
+#include <cstdio>
 #include <inttypes.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 
 #include "v4l2-ctl.h"
diff --git a/utils/v4l2-ctl/v4l2-ctl-io.cpp b/utils/v4l2-ctl/v4l2-ctl-io.cpp
index 8b6650a4..c4b13d65 100644
--- a/utils/v4l2-ctl/v4l2-ctl-io.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-io.cpp
@@ -1,18 +1,18 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index baf405e8..867342b9 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -1,18 +1,18 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
index 365a03ef..e35beac8 100644
--- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
@@ -1,18 +1,18 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-modes.cpp b/utils/v4l2-ctl/v4l2-ctl-modes.cpp
index b311ce5d..e076be6e 100644
--- a/utils/v4l2-ctl/v4l2-ctl-modes.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-modes.cpp
@@ -6,8 +6,8 @@
  * reserved.
  */
 
-#include <stdio.h>
-#include <stdbool.h>
+#include <cstdio>
+
 #include "v4l2-ctl.h"
 
 static bool valid_params(int width, int height, int refresh_rate)
diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index 0c67a916..4b9ff077 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -1,18 +1,18 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 
 #include <linux/fb.h>
 #include <vector>
diff --git a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
index 5101f66c..8d045660 100644
--- a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
@@ -1,18 +1,18 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-selection.cpp b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
index 017ac0bf..9b53f4c8 100644
--- a/utils/v4l2-ctl/v4l2-ctl-selection.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
@@ -1,18 +1,18 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-stds.cpp b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
index f36f8fbd..02f72f25 100644
--- a/utils/v4l2-ctl/v4l2-ctl-stds.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
@@ -1,18 +1,18 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 0a2b2205..1ba5adcd 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1,8 +1,8 @@
 #include <cstring>
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
+#include <cstdlib>
+#include <cstdio>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
@@ -11,13 +11,13 @@
 #include <netinet/in.h>
 #include <netdb.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <sys/mman.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 #include <linux/media.h>
 
 #include "compiler.h"
diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index d1699635..a89fbaf9 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -1,18 +1,18 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
index cf2fd8af..96be564e 100644
--- a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
@@ -1,14 +1,14 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
index e6795ac2..f554aaf1 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
@@ -1,19 +1,19 @@
 #include <cstring>
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
+#include <cstdlib>
+#include <cstdio>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 
 #include "compiler.h"
 #include "v4l2-ctl.h"
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index a185e33b..3d0d5620 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -1,18 +1,18 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
index e3cb4bcb..39952eef 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
@@ -1,18 +1,18 @@
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 
 #include "v4l2-ctl.h"
 
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 844c1af9..9f7e8117 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -21,22 +21,22 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <cstdlib>
+#include <cstdio>
+#include <cstring>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/epoll.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <sys/sysmacros.h>
 #include <dirent.h>
-#include <math.h>
+#include <cmath>
 
 #include <linux/media.h>
 
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 04ec6475..5fd1a1d5 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -17,18 +17,18 @@
  */
 
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
+#include <cstdlib>
+#include <cstdio>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <ctype.h>
-#include <errno.h>
+#include <cctype>
+#include <cerrno>
 #include <sys/ioctl.h>
 #include <sys/time.h>
-#include <math.h>
+#include <cmath>
 
 #ifdef ANDROID
 #include <android-config.h>
-- 
2.25.3

