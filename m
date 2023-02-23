Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59DC86A0E32
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 17:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjBWQpo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Feb 2023 11:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjBWQpn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Feb 2023 11:45:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7FB49892
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 08:45:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 933F9305A;
        Thu, 23 Feb 2023 17:44:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677170694;
        bh=2EyBokB+N4h3Ulgb5t7IYgbzsfPM8co78wnaC0BAd0E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dKMygmwzp/hlC3DtTzeTtFBbmny6rQ/OqtTpvKxQVCIr0EuPJUUcFqf0MrTIh0wx+
         EHv6zsjXVe3isW5y+QECG+ATPtvTYQOqzLtbOdI54+7qyzqQm9aTWaKHCs3aRC70mF
         6EzfBpmBbTvuqWEO1leoYTQ36d/ZkFuv3z0F6Qcs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar,
        tomi.valkeinen@ideasonboard.com
Subject: [v4l-utils] [PATCH v10 5/5] meson: Use -include to include config.h instead of -I.
Date:   Thu, 23 Feb 2023 18:44:41 +0200
Message-Id: <20230223164441.22719-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
References: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Use -include to get config.h included, instead of -I. and having the
source files include the config.h. The issue with the latter is that -I.
is rather late in the command line, and there may be config.h lurking in
some other project include dir (e.g. valgrind's).

For Android, add the -include option directly to the Android.mk files,
pointing to the android-config.h in the root directory.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
[Handle Android support]
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Sean Young <sean@mess.org>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 contrib/test/mc_nextgen_test.c          | 2 --
 contrib/test/pixfmt-test.c              | 2 --
 contrib/test/v4l2gl.c                   | 1 -
 contrib/test/v4l2grab.c                 | 1 -
 lib/libdvbv5/countries.c                | 1 -
 lib/libdvbv5/dvb-dev-local.c            | 2 --
 lib/libdvbv5/dvb-dev-remote.c           | 3 ---
 lib/libdvbv5/dvb-dev.c                  | 2 --
 lib/libdvbv5/dvb-fe.c                   | 2 --
 lib/libdvbv5/dvb-file.c                 | 2 --
 lib/libdvbv5/dvb-log.c                  | 2 --
 lib/libdvbv5/dvb-sat.c                  | 2 --
 lib/libdvbv5/dvb-scan.c                 | 2 --
 lib/libdvbv5/dvb-vdr-format.c           | 2 --
 lib/libdvbv5/parse_string.c             | 1 -
 lib/libv4l-mplane/libv4l-mplane.c       | 1 -
 lib/libv4l1/libv4l1.c                   | 1 -
 lib/libv4l1/v4l1compat.c                | 1 -
 lib/libv4l2/Android.mk                  | 1 +
 lib/libv4l2/libv4l2.c                   | 5 -----
 lib/libv4l2/log.c                       | 5 -----
 lib/libv4l2/v4l2-plugin-android.c       | 5 -----
 lib/libv4l2/v4l2-plugin.c               | 1 -
 lib/libv4l2/v4l2convert.c               | 5 -----
 lib/libv4l2rds/libv4l2rds.c             | 1 -
 lib/libv4lconvert/Android.mk            | 1 +
 lib/libv4lconvert/jl2005bcd.c           | 5 -----
 lib/libv4lconvert/jpeg.c                | 5 -----
 lib/libv4lconvert/jpeg_memsrcdest.c     | 5 -----
 lib/libv4lconvert/libv4lconvert-priv.h  | 5 -----
 lib/libv4lconvert/libv4lconvert.c       | 5 -----
 meson.build                             | 2 +-
 utils/cec-compliance/cec-compliance.h   | 6 ------
 utils/cec-ctl/cec-ctl.cpp               | 6 ------
 utils/cec-ctl/cec-pin.cpp               | 6 ------
 utils/cec-follower/cec-follower.h       | 6 ------
 utils/cx18-ctl/cx18-ctl.c               | 1 -
 utils/dvb/dvb-fe-tool.c                 | 1 -
 utils/dvb/dvb-format-convert.c          | 2 --
 utils/dvb/dvbv5-daemon.c                | 3 ---
 utils/dvb/dvbv5-scan.c                  | 2 --
 utils/dvb/dvbv5-zap.c                   | 2 --
 utils/ir-ctl/ir-ctl.c                   | 2 --
 utils/keytable/keytable.c               | 1 -
 utils/media-ctl/libmediactl.c           | 2 --
 utils/media-ctl/options.h               | 2 --
 utils/qv4l2/alsa_stream.c               | 2 --
 utils/qv4l2/capture-win-gl.h            | 2 --
 utils/qv4l2/general-tab.h               | 2 --
 utils/qv4l2/qv4l2.h                     | 2 --
 utils/qvidcap/qvidcap.h                 | 2 --
 utils/v4l2-compliance/Android.mk        | 1 +
 utils/v4l2-compliance/v4l2-compliance.h | 6 ------
 utils/v4l2-ctl/Android.mk               | 1 +
 utils/v4l2-ctl/v4l2-ctl.h               | 6 ------
 utils/v4l2-dbg/Android.mk               | 2 ++
 utils/v4l2-dbg/v4l2-dbg.cpp             | 6 ------
 utils/v4l2-sysfs-path/v4l2-sysfs-path.c | 1 -
 utils/v4l2-tracer/libv4l2tracer.cpp     | 1 -
 utils/v4l2-tracer/v4l2-tracer-common.h  | 1 -
 60 files changed, 7 insertions(+), 151 deletions(-)

diff --git a/contrib/test/mc_nextgen_test.c b/contrib/test/mc_nextgen_test.c
index 6086ceb4acae..11254a0a1652 100644
--- a/contrib/test/mc_nextgen_test.c
+++ b/contrib/test/mc_nextgen_test.c
@@ -19,8 +19,6 @@
  * Or, point your browser to http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
  * */
 
-#include <config.h>
-
 #include <linux/media.h>
 
 #include <argp.h>
diff --git a/contrib/test/pixfmt-test.c b/contrib/test/pixfmt-test.c
index 43a11c4ef905..1cae69aa2bc1 100644
--- a/contrib/test/pixfmt-test.c
+++ b/contrib/test/pixfmt-test.c
@@ -20,8 +20,6 @@
 
 #define _GNU_SOURCE 1
 
-#include <config.h>
-
 #include <stdio.h>
 #include <stdlib.h>
 #include <stdbool.h>
diff --git a/contrib/test/v4l2gl.c b/contrib/test/v4l2gl.c
index 4df3910ebf0b..dc665fcc5a88 100644
--- a/contrib/test/v4l2gl.c
+++ b/contrib/test/v4l2gl.c
@@ -12,7 +12,6 @@
  */
 
 #include <argp.h>
-#include <config.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/contrib/test/v4l2grab.c b/contrib/test/v4l2grab.c
index d8f2c97a8769..0983f9184546 100644
--- a/contrib/test/v4l2grab.c
+++ b/contrib/test/v4l2grab.c
@@ -12,7 +12,6 @@
  */
 
 #include <argp.h>
-#include <config.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <linux/videodev2.h>
diff --git a/lib/libdvbv5/countries.c b/lib/libdvbv5/countries.c
index 609add0bd652..a6e5f4150a8e 100644
--- a/lib/libdvbv5/countries.c
+++ b/lib/libdvbv5/countries.c
@@ -15,7 +15,6 @@
  *
  */
 
-#include <config.h>
 #include "libdvbv5/countries.h"
 
 #include <ctype.h>
diff --git a/lib/libdvbv5/dvb-dev-local.c b/lib/libdvbv5/dvb-dev-local.c
index a5e3979fa591..ea51147174ec 100644
--- a/lib/libdvbv5/dvb-dev-local.c
+++ b/lib/libdvbv5/dvb-dev-local.c
@@ -27,8 +27,6 @@
 #include <unistd.h>
 #include <string.h>
 
-#include <config.h>
-
 #ifdef HAVE_PTHREAD
 #  include <pthread.h>
 #endif
diff --git a/lib/libdvbv5/dvb-dev-remote.c b/lib/libdvbv5/dvb-dev-remote.c
index 536f0acfb0bd..de4d11e4841f 100644
--- a/lib/libdvbv5/dvb-dev-remote.c
+++ b/lib/libdvbv5/dvb-dev-remote.c
@@ -20,9 +20,6 @@
 #define _LARGEFILE_SOURCE 1
 #define _LARGEFILE64_SOURCE 1
 
-#include <config.h>
-
-
 #ifdef HAVE_BACKTRACE
 #include <execinfo.h>
 #endif
diff --git a/lib/libdvbv5/dvb-dev.c b/lib/libdvbv5/dvb-dev.c
index c379f4020097..4bf87fcaaeb6 100644
--- a/lib/libdvbv5/dvb-dev.c
+++ b/lib/libdvbv5/dvb-dev.c
@@ -23,8 +23,6 @@
 #include <unistd.h>
 #include <string.h>
 
-#include <config.h>
-
 #include "dvb-fe-priv.h"
 #include "dvb-dev-priv.h"
 
diff --git a/lib/libdvbv5/dvb-fe.c b/lib/libdvbv5/dvb-fe.c
index beda5cd88e56..7848fcda39b0 100644
--- a/lib/libdvbv5/dvb-fe.c
+++ b/lib/libdvbv5/dvb-fe.c
@@ -30,8 +30,6 @@
 #include <unistd.h>
 #include <stdarg.h>
 
-#include <config.h>
-
 #ifdef ENABLE_NLS
 # include "gettext.h"
 # include <libintl.h>
diff --git a/lib/libdvbv5/dvb-file.c b/lib/libdvbv5/dvb-file.c
index 4187de9d3c07..51e86d4119ac 100644
--- a/lib/libdvbv5/dvb-file.c
+++ b/lib/libdvbv5/dvb-file.c
@@ -50,8 +50,6 @@
 #include <libdvbv5/desc_hierarchy.h>
 #include <libdvbv5/countries.h>
 
-#include <config.h>
-
 #ifdef ENABLE_NLS
 # include "gettext.h"
 # include <libintl.h>
diff --git a/lib/libdvbv5/dvb-log.c b/lib/libdvbv5/dvb-log.c
index f92da5f84a40..5aa6906daff2 100644
--- a/lib/libdvbv5/dvb-log.c
+++ b/lib/libdvbv5/dvb-log.c
@@ -24,8 +24,6 @@
 #include <unistd.h>
 #include <stdarg.h>
 
-#include <config.h>
-
 #ifdef ENABLE_NLS
 # include "gettext.h"
 # include <libintl.h>
diff --git a/lib/libdvbv5/dvb-sat.c b/lib/libdvbv5/dvb-sat.c
index 71ded42507e7..36a42344af32 100644
--- a/lib/libdvbv5/dvb-sat.c
+++ b/lib/libdvbv5/dvb-sat.c
@@ -25,8 +25,6 @@
 #include "dvb-fe-priv.h"
 #include <libdvbv5/dvb-v5-std.h>
 
-#include <config.h>
-
 #ifdef ENABLE_NLS
 # include "gettext.h"
 # include <libintl.h>
diff --git a/lib/libdvbv5/dvb-scan.c b/lib/libdvbv5/dvb-scan.c
index 5c8aca96df33..af4f16910151 100644
--- a/lib/libdvbv5/dvb-scan.c
+++ b/lib/libdvbv5/dvb-scan.c
@@ -61,8 +61,6 @@
 #include <libdvbv5/desc_t2_delivery.h>
 #include <libdvbv5/desc_sat.h>
 
-#include <config.h>
-
 #ifdef ENABLE_NLS
 # include "gettext.h"
 # include <libintl.h>
diff --git a/lib/libdvbv5/dvb-vdr-format.c b/lib/libdvbv5/dvb-vdr-format.c
index d2365712c9a9..9c8728c62f32 100644
--- a/lib/libdvbv5/dvb-vdr-format.c
+++ b/lib/libdvbv5/dvb-vdr-format.c
@@ -23,8 +23,6 @@
 #include <libdvbv5/dvb-file.h>
 #include <libdvbv5/dvb-v5-std.h>
 
-#include <config.h>
-
 #ifdef ENABLE_NLS
 # include "gettext.h"
 # include <libintl.h>
diff --git a/lib/libdvbv5/parse_string.c b/lib/libdvbv5/parse_string.c
index d354f49776d3..e673343c5533 100644
--- a/lib/libdvbv5/parse_string.c
+++ b/lib/libdvbv5/parse_string.c
@@ -21,7 +21,6 @@
  *   c.f. EN 300 468 annex A
  */
 
-#include <config.h>
 #include <iconv.h>
 #include <stdio.h>
 #include <stdlib.h>
diff --git a/lib/libv4l-mplane/libv4l-mplane.c b/lib/libv4l-mplane/libv4l-mplane.c
index 2f685a73fe3b..071e9bc73520 100644
--- a/lib/libv4l-mplane/libv4l-mplane.c
+++ b/lib/libv4l-mplane/libv4l-mplane.c
@@ -16,7 +16,6 @@
  * Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <config.h>
 #include <errno.h>
 #include <stdint.h>
 #include <stdio.h>
diff --git a/lib/libv4l1/libv4l1.c b/lib/libv4l1/libv4l1.c
index b4efa995aaaf..ec903305eebd 100644
--- a/lib/libv4l1/libv4l1.c
+++ b/lib/libv4l1/libv4l1.c
@@ -47,7 +47,6 @@
       in turn will call v4l1_open, so therefor v4l1_open (for example) may not
       use the regular open()!
 */
-#include <config.h>
 #include <errno.h>
 #include <stdarg.h>
 #include <stdio.h>
diff --git a/lib/libv4l1/v4l1compat.c b/lib/libv4l1/v4l1compat.c
index e5c9e56261e2..705d7d4b523a 100644
--- a/lib/libv4l1/v4l1compat.c
+++ b/lib/libv4l1/v4l1compat.c
@@ -24,7 +24,6 @@
 #undef _FILE_OFFSET_BITS
 #define _LARGEFILE64_SOURCE 1
 
-#include <config.h>
 #include <stdlib.h>
 #include <stdarg.h>
 #include <fcntl.h>
diff --git a/lib/libv4l2/Android.mk b/lib/libv4l2/Android.mk
index 7d723fbe4ebc..c57626cbd0f1 100644
--- a/lib/libv4l2/Android.mk
+++ b/lib/libv4l2/Android.mk
@@ -10,6 +10,7 @@ LOCAL_SRC_FILES := \
 
 LOCAL_CFLAGS += -Wno-missing-field-initializers
 LOCAL_CFLAGS += -Wno-sign-compare
+LOCAL_CFLAGS += -include ../../android-config.h
 
 LOCAL_C_INCLUDES := \
     $(LOCAL_PATH)/../include \
diff --git a/lib/libv4l2/libv4l2.c b/lib/libv4l2/libv4l2.c
index 9ebf8c18e016..032a4f1c471d 100644
--- a/lib/libv4l2/libv4l2.c
+++ b/lib/libv4l2/libv4l2.c
@@ -55,11 +55,6 @@
    When modifications are made, one should be careful that this behavior is
    preserved.
  */
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
 #include <errno.h>
 #include <stdarg.h>
 #include <stdio.h>
diff --git a/lib/libv4l2/log.c b/lib/libv4l2/log.c
index 9517b86fd7a3..0e0e70b316ea 100644
--- a/lib/libv4l2/log.c
+++ b/lib/libv4l2/log.c
@@ -18,11 +18,6 @@
 # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/lib/libv4l2/v4l2-plugin-android.c b/lib/libv4l2/v4l2-plugin-android.c
index c4ebc658d4cd..1aee111c0711 100644
--- a/lib/libv4l2/v4l2-plugin-android.c
+++ b/lib/libv4l2/v4l2-plugin-android.c
@@ -16,11 +16,6 @@
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
 #include <stdarg.h>
 #include <dlfcn.h>
 #include <fcntl.h>
diff --git a/lib/libv4l2/v4l2-plugin.c b/lib/libv4l2/v4l2-plugin.c
index ff42eed4731d..e2356cb6fdc1 100644
--- a/lib/libv4l2/v4l2-plugin.c
+++ b/lib/libv4l2/v4l2-plugin.c
@@ -16,7 +16,6 @@
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
-#include <config.h>
 #include <stdarg.h>
 #include <dlfcn.h>
 #include <fcntl.h>
diff --git a/lib/libv4l2/v4l2convert.c b/lib/libv4l2/v4l2convert.c
index 13ca4cfb1b08..97bed9a9b29c 100644
--- a/lib/libv4l2/v4l2convert.c
+++ b/lib/libv4l2/v4l2convert.c
@@ -28,11 +28,6 @@
 #undef _FILE_OFFSET_BITS
 #define _LARGEFILE64_SOURCE 1
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
 #include <stdarg.h>
 #include <stdlib.h>
 #include <fcntl.h>
diff --git a/lib/libv4l2rds/libv4l2rds.c b/lib/libv4l2rds/libv4l2rds.c
index 2e67d06052dc..4bc017218c1b 100644
--- a/lib/libv4l2rds/libv4l2rds.c
+++ b/lib/libv4l2rds/libv4l2rds.c
@@ -10,7 +10,6 @@
 #include <stdlib.h>
 #include <string.h>
 #include <time.h>
-#include <config.h>
 #include <sys/types.h>
 #include <sys/mman.h>
 
diff --git a/lib/libv4lconvert/Android.mk b/lib/libv4lconvert/Android.mk
index a4e75c951784..fc0d1abad659 100644
--- a/lib/libv4lconvert/Android.mk
+++ b/lib/libv4lconvert/Android.mk
@@ -35,6 +35,7 @@ LOCAL_SRC_FILES := \
 
 LOCAL_CFLAGS += -Wno-missing-field-initializers
 LOCAL_CFLAGS += -Wno-sign-compare
+LOCAL_CFLAGS += -include ../../android-config.h
 
 LOCAL_C_INCLUDES := \
     $(LOCAL_PATH)/../include \
diff --git a/lib/libv4lconvert/jl2005bcd.c b/lib/libv4lconvert/jl2005bcd.c
index ec7103d5c51a..707c3205c977 100644
--- a/lib/libv4lconvert/jl2005bcd.c
+++ b/lib/libv4lconvert/jl2005bcd.c
@@ -23,11 +23,6 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
 #include <stdlib.h>
 #include <string.h>
 
diff --git a/lib/libv4lconvert/jpeg.c b/lib/libv4lconvert/jpeg.c
index 15f8dec7724d..ebfc814901e6 100644
--- a/lib/libv4lconvert/jpeg.c
+++ b/lib/libv4lconvert/jpeg.c
@@ -16,11 +16,6 @@
 # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
 #include <errno.h>
 #include <stdlib.h>
 #include "libv4lconvert-priv.h"
diff --git a/lib/libv4lconvert/jpeg_memsrcdest.c b/lib/libv4lconvert/jpeg_memsrcdest.c
index 0540470f7484..6c09efe9c45f 100644
--- a/lib/libv4lconvert/jpeg_memsrcdest.c
+++ b/lib/libv4lconvert/jpeg_memsrcdest.c
@@ -16,11 +16,6 @@
 
 /* this is not a core library module, so it doesn't define JPEG_INTERNALS */
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
 #include <stdlib.h>
 #include <stdio.h>
 
diff --git a/lib/libv4lconvert/libv4lconvert-priv.h b/lib/libv4lconvert/libv4lconvert-priv.h
index 0fd6a102a904..ff2f4a753091 100644
--- a/lib/libv4lconvert/libv4lconvert-priv.h
+++ b/lib/libv4lconvert/libv4lconvert-priv.h
@@ -19,11 +19,6 @@
 #ifndef __LIBV4LCONVERT_PRIV_H
 #define __LIBV4LCONVERT_PRIV_H
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
 #include <stdio.h>
 #include <stdint.h>
 #include <sys/types.h>
diff --git a/lib/libv4lconvert/libv4lconvert.c b/lib/libv4lconvert/libv4lconvert.c
index 201dcf45b388..80f39dc4541e 100644
--- a/lib/libv4lconvert/libv4lconvert.c
+++ b/lib/libv4lconvert/libv4lconvert.c
@@ -16,11 +16,6 @@
 # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
 #include <errno.h>
 #include <string.h>
 #include <stdlib.h>
diff --git a/meson.build b/meson.build
index ecedc8a1983e..bebaf3c6ddd8 100644
--- a/meson.build
+++ b/meson.build
@@ -41,10 +41,10 @@ common_arguments = [
     '-D_GNU_SOURCE',
     '-DPROMOTED_MODE_T=int',
     '-DENABLE_NLS',
+    '-include', meson.current_build_dir() / 'config.h',
 ]
 
 v4l2_utils_incdir_arr = [
-    '.', # Needed for config.h
     'lib' / 'include',
 ]
 
diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index 34ed9a8176b2..44f8643d0739 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -11,12 +11,6 @@
 #include <linux/cec-funcs.h>
 #include "cec-htng-funcs.h"
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
-
 #include <cec-info.h>
 
 #include <vector>
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 015d2763a0e1..11fb7e7e8b1b 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -25,12 +25,6 @@
 #include "cec-log.h"
 #include "cec-parse.h"
 
-#ifdef __ANDROID__
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
-
 #include "cec-ctl.h"
 #include "compiler.h"
 
diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
index cf4b6d34c848..f35005554bfd 100644
--- a/utils/cec-ctl/cec-pin.cpp
+++ b/utils/cec-ctl/cec-pin.cpp
@@ -8,12 +8,6 @@
 #include <linux/cec.h>
 #include "cec-htng.h"
 
-#ifdef __ANDROID__
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
-
 #include "cec-ctl.h"
 #include "cec-log.h"
 
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 54f4df52a625..dc0a5530d1d7 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -11,12 +11,6 @@
 #include <linux/cec-funcs.h>
 #include "cec-htng-funcs.h"
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
-
 #include <cec-info.h>
 #include <cec-log.h>
 #include <set>
diff --git a/utils/cx18-ctl/cx18-ctl.c b/utils/cx18-ctl/cx18-ctl.c
index 16a2c82f839b..8586f72de116 100644
--- a/utils/cx18-ctl/cx18-ctl.c
+++ b/utils/cx18-ctl/cx18-ctl.c
@@ -19,7 +19,6 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
-#include <config.h>
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
diff --git a/utils/dvb/dvb-fe-tool.c b/utils/dvb/dvb-fe-tool.c
index 92b909051f03..994fa4e842f1 100644
--- a/utils/dvb/dvb-fe-tool.c
+++ b/utils/dvb/dvb-fe-tool.c
@@ -20,7 +20,6 @@
 
 #include "libdvbv5/dvb-file.h"
 #include "libdvbv5/dvb-dev.h"
-#include <config.h>
 #include <argp.h>
 #include <signal.h>
 #include <stdlib.h>
diff --git a/utils/dvb/dvb-format-convert.c b/utils/dvb/dvb-format-convert.c
index d9019e508fa5..e4bd95df6bc1 100644
--- a/utils/dvb/dvb-format-convert.c
+++ b/utils/dvb/dvb-format-convert.c
@@ -29,8 +29,6 @@
 #include <sys/time.h>
 #include <argp.h>
 
-#include <config.h>
-
 #ifdef ENABLE_NLS
 # define _(string) gettext(string)
 # include "gettext.h"
diff --git a/utils/dvb/dvbv5-daemon.c b/utils/dvb/dvbv5-daemon.c
index d9b701816ebb..669b3321655e 100644
--- a/utils/dvb/dvbv5-daemon.c
+++ b/utils/dvb/dvbv5-daemon.c
@@ -24,14 +24,11 @@
 #define _LARGEFILE_SOURCE 1
 #define _LARGEFILE64_SOURCE 1
 
-#include <config.h>
-
 #ifdef HAVE_BACKTRACE
 #include <execinfo.h>
 #endif
 
 #include <argp.h>
-#include <config.h>
 #include <endian.h>
 #include <netinet/in.h>
 #include <poll.h>
diff --git a/utils/dvb/dvbv5-scan.c b/utils/dvb/dvbv5-scan.c
index 0a52243306ae..9f47ead767fe 100644
--- a/utils/dvb/dvbv5-scan.c
+++ b/utils/dvb/dvbv5-scan.c
@@ -30,8 +30,6 @@
 #include <sys/time.h>
 #include <argp.h>
 
-#include <config.h>
-
 #ifdef ENABLE_NLS
 # define _(string) gettext(string)
 # include "gettext.h"
diff --git a/utils/dvb/dvbv5-zap.c b/utils/dvb/dvbv5-zap.c
index 1cd6989f165b..5f84e101c41f 100644
--- a/utils/dvb/dvbv5-zap.c
+++ b/utils/dvb/dvbv5-zap.c
@@ -49,8 +49,6 @@
 #include <sys/time.h>
 #include <time.h>
 
-#include <config.h>
-
 #ifdef ENABLE_NLS
 # define _(string) gettext(string)
 # include "gettext.h"
diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 240a37524905..3c389bd9e09f 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -26,8 +26,6 @@
 #include <argp.h>
 #include <sysexits.h>
 
-#include <config.h>
-
 #include <linux/lirc.h>
 
 #include "ir-encode.h"
diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 6cd1244fc86a..c47211fae6ef 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -12,7 +12,6 @@
    GNU General Public License for more details.
  */
 
-#include <config.h>
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
diff --git a/utils/media-ctl/libmediactl.c b/utils/media-ctl/libmediactl.c
index 1fd6525b40d3..a18b063e7d78 100644
--- a/utils/media-ctl/libmediactl.c
+++ b/utils/media-ctl/libmediactl.c
@@ -19,8 +19,6 @@
  * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "config.h"
-
 #include <sys/ioctl.h>
 #include <sys/stat.h>
 #include <sys/types.h>
diff --git a/utils/media-ctl/options.h b/utils/media-ctl/options.h
index b1751f56d464..7e0556fcdc3c 100644
--- a/utils/media-ctl/options.h
+++ b/utils/media-ctl/options.h
@@ -22,8 +22,6 @@
 #ifndef __OPTIONS_H
 #define __OPTIONS_H
 
-#include <config.h>
-
 struct media_options
 {
 	const char *devname;
diff --git a/utils/qv4l2/alsa_stream.c b/utils/qv4l2/alsa_stream.c
index 2dca283b68ea..8f5246db7ed2 100644
--- a/utils/qv4l2/alsa_stream.c
+++ b/utils/qv4l2/alsa_stream.c
@@ -26,8 +26,6 @@
  *
  */
 
-#include <config.h>
-
 #ifdef HAVE_ALSA
 #include "alsa_stream.h"
 
diff --git a/utils/qv4l2/capture-win-gl.h b/utils/qv4l2/capture-win-gl.h
index 35235d7a835c..e27b2b3f5d83 100644
--- a/utils/qv4l2/capture-win-gl.h
+++ b/utils/qv4l2/capture-win-gl.h
@@ -6,8 +6,6 @@
 #ifndef CAPTURE_WIN_GL_H
 #define CAPTURE_WIN_GL_H
 
-#include <config.h>
-
 #ifdef HAVE_QTGL
 #define GL_GLEXT_PROTOTYPES
 #define QT_NO_OPENGL_ES_2
diff --git a/utils/qv4l2/general-tab.h b/utils/qv4l2/general-tab.h
index 9b4b5bcd5a46..f5ec73e5788b 100644
--- a/utils/qv4l2/general-tab.h
+++ b/utils/qv4l2/general-tab.h
@@ -21,8 +21,6 @@
 #ifndef GENERAL_TAB_H
 #define GENERAL_TAB_H
 
-#include <config.h>
-
 #include <QSpinBox>
 #include <QCheckBox>
 #include <QDoubleSpinBox>
diff --git a/utils/qv4l2/qv4l2.h b/utils/qv4l2/qv4l2.h
index aaba74d0e7a9..99d1f30bcbab 100644
--- a/utils/qv4l2/qv4l2.h
+++ b/utils/qv4l2/qv4l2.h
@@ -20,8 +20,6 @@
 #ifndef QV4L2_H
 #define QV4L2_H
 
-#include <config.h>
-
 #include <QMainWindow>
 #include <QTabWidget>
 #include <QSignalMapper>
diff --git a/utils/qvidcap/qvidcap.h b/utils/qvidcap/qvidcap.h
index 7292d8e770e2..40b1b4e6db6d 100644
--- a/utils/qvidcap/qvidcap.h
+++ b/utils/qvidcap/qvidcap.h
@@ -8,8 +8,6 @@
 #ifndef QVIDCAP_H
 #define QVIDCAP_H
 
-#include <config.h>
-
 // Must come before cv4l-helpers.h
 #include <libv4l2.h>
 
diff --git a/utils/v4l2-compliance/Android.mk b/utils/v4l2-compliance/Android.mk
index 3b901dabd194..a395ef9bde4b 100644
--- a/utils/v4l2-compliance/Android.mk
+++ b/utils/v4l2-compliance/Android.mk
@@ -8,6 +8,7 @@ LOCAL_MODULE_TAGS := optional
 LOCAL_CFLAGS += -DNO_LIBV4L2
 LOCAL_CFLAGS += -Wno-missing-braces
 LOCAL_CFLAGS += -Wno-missing-field-initializers
+LOCAL_CFLAGS += -include ../../android-config.h
 LOCAL_C_INCLUDES := \
     $(LOCAL_PATH)/../.. \
     $(LOCAL_PATH)/../../include \
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index e574c06c98f0..020e56a9e0f6 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -29,12 +29,6 @@
 #include <linux/v4l2-subdev.h>
 #include <linux/media.h>
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
-
 #ifndef NO_LIBV4L2
 #include <libv4l2.h>
 #endif
diff --git a/utils/v4l2-ctl/Android.mk b/utils/v4l2-ctl/Android.mk
index 1eab3cd23c34..3078c629ba95 100644
--- a/utils/v4l2-ctl/Android.mk
+++ b/utils/v4l2-ctl/Android.mk
@@ -7,6 +7,7 @@ LOCAL_MODULE_TAGS := optional
 
 LOCAL_CFLAGS += -DNO_LIBV4L2
 LOCAL_CFLAGS += -Wno-missing-field-initializers
+LOCAL_CFLAGS += -include ../../android-config.h
 LOCAL_C_INCLUDES := \
     $(LOCAL_PATH)/../.. \
     $(LOCAL_PATH)/../../include \
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index 70a80ade3d1b..8f2726eac07e 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -1,12 +1,6 @@
 #ifndef _V4L2_CTL_H
 #define _V4L2_CTL_H
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
-
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
 #include <v4l-getsubopt.h>
diff --git a/utils/v4l2-dbg/Android.mk b/utils/v4l2-dbg/Android.mk
index f605e10a96cf..4f424f659ab1 100644
--- a/utils/v4l2-dbg/Android.mk
+++ b/utils/v4l2-dbg/Android.mk
@@ -5,6 +5,8 @@ include $(CLEAR_VARS)
 LOCAL_MODULE := v4l2-dbg
 LOCAL_MODULE_TAGS := optional
 
+LOCAL_CFLAGS += -include ../../android-config.h
+
 LOCAL_C_INCLUDES := \
     $(LOCAL_PATH)/../.. \
     $(LOCAL_PATH)/../../include \
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index f6a9f433cc7e..bd08b4cf6e3c 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -27,12 +27,6 @@
 #include <sys/ioctl.h>
 #include <unistd.h>
 
-#ifdef ANDROID
-#include <android-config.h>
-#else
-#include <config.h>
-#endif
-
 #ifdef HAVE_SYS_KLOG_H
 #include <sys/klog.h>
 #endif
diff --git a/utils/v4l2-sysfs-path/v4l2-sysfs-path.c b/utils/v4l2-sysfs-path/v4l2-sysfs-path.c
index c440b24fdaa2..d1ad7edb5382 100644
--- a/utils/v4l2-sysfs-path/v4l2-sysfs-path.c
+++ b/utils/v4l2-sysfs-path/v4l2-sysfs-path.c
@@ -24,7 +24,6 @@
  *	Mauro Carvalho Chehab
  */
 
-#include <config.h>
 #include "../libmedia_dev/get_media_devices.h"
 #include <stdio.h>
 #include <argp.h>
diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index 5d0817b22dea..a9f039c7fb7f 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -4,7 +4,6 @@
  */
 
 #include "trace.h"
-#include <config.h> /* For PROMOTED_MODE_T */
 #include <dlfcn.h>
 #include <stdarg.h>
 
diff --git a/utils/v4l2-tracer/v4l2-tracer-common.h b/utils/v4l2-tracer/v4l2-tracer-common.h
index 0bdb125d2135..10362acb2ecc 100644
--- a/utils/v4l2-tracer/v4l2-tracer-common.h
+++ b/utils/v4l2-tracer/v4l2-tracer-common.h
@@ -8,7 +8,6 @@
 
 #include "v4l2-info.h"
 #include "codec-fwht.h"
-#include "config.h"
 #include "media-info.h"
 #include <algorithm>
 #include <dirent.h>
-- 
Regards,

Laurent Pinchart

