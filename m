Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17361B6601
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 23:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbgDWVLE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 17:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgDWVKv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 17:10:51 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BCD0C09B042
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 14:10:50 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id y6so3007781pjc.4
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 14:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eIyMycrq9mzQHu+Ig70I3epWcxbOkWwUJ7sLbAB9DU0=;
        b=gvzzkJ2X58i4BgWCuxF3lqbF4G/aiZCtb7Fq6IOLJOSud/p593a9AsLVcRR0d+EpQV
         JoKujumjh5H/jQxIh7t9k4d2uyEHOTUD4TS+rHo7zrVRjmIAkNCjo4l15cQBcG28g1wy
         7Ju1HEdnSrucbpu6afcvWAJROmRiVcH4aapADN+C8lTTiwQwoIlLhgZ5xYJCK3uqtM8/
         R0kpOGhEATjHe700HaJHhNwSan/LHJ/5rDhk9VhoznQHdvdvWCykIZMuBUSqyffnBxka
         d29oIdIMoJspXWnptxLgTIwmQ65a1DQz7I1wtvNUqi8BcA5wXzWcWVOBleegLU6QcjsK
         UFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eIyMycrq9mzQHu+Ig70I3epWcxbOkWwUJ7sLbAB9DU0=;
        b=hLvjUO1RB1eMdrV8bwzgX0NcucmVzWQsSAY2WKtb9ab+7yrVnKUmKXmhm28S59BjH9
         5rXVhxJV9kItTHhW63fMCZRc0qhl1Eo1moiFWF3D5/MTZj5eGK7pxwXO67l+J+IAkMJS
         7Kqn71TQJjzWUE0Y2mKjj5hoMsMmrZs1hVQZWenz2j/eh9i3WlLg/6cbV8WmjohrJwbL
         FJ8BVDI6BnHCwBOPEvjgL8aNXeDGbnSXQkByNputWadxFFV5nkLgnD/StNqW7V0tgB+J
         yGyCoAhaDf6kwe+4XCS97Pd/JZq8hVec6IDOVtMWzn7qPklSZtJWhza8pHv3IQPYHH6U
         GPdQ==
X-Gm-Message-State: AGi0PuY/reNDOm6hb56vRhwO3mmWQMqrER0+q5zlg44DIvwT6y0VrE7q
        G98ZY4LaVJnO2NUCQKxIMsvbjapo
X-Google-Smtp-Source: APiQypInbN4smKZr4pG3KYvPHJfILWRpgKT6GEqyklCuWFPCDBD4rJD6rTanlwpDSK140y0IAvdE2w==
X-Received: by 2002:a17:902:ab95:: with SMTP id f21mr5169875plr.188.1587676248785;
        Thu, 23 Apr 2020 14:10:48 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id f21sm3563630pfn.71.2020.04.23.14.10.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 14:10:48 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 4/5] utils: fix fallthrough warnings
Date:   Thu, 23 Apr 2020 14:10:39 -0700
Message-Id: <20200423211040.14275-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200423211040.14275-1-rosenp@gmail.com>
References: <20200423211040.14275-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Comments are not enough for clang. Changed to use the C++ attribute.

Found with -Wimplicit-fallthrough

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/compiler.h                           |  9 +++++++++
 utils/cec-compliance/cec-compliance.cpp      |  2 ++
 utils/cec-ctl/cec-ctl.cpp                    |  3 ++-
 utils/cec-follower/cec-follower.cpp          |  2 ++
 utils/cec-follower/cec-processing.cpp        |  4 +++-
 utils/cec-follower/cec-tuner.cpp             |  7 ++++---
 utils/libcecutil/cec-log.cpp                 |  3 ++-
 utils/v4l2-compliance/v4l2-test-colors.cpp   | 12 +++++++-----
 utils/v4l2-compliance/v4l2-test-controls.cpp | 12 +++++++-----
 utils/v4l2-compliance/v4l2-test-formats.cpp  |  6 ++++--
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp        |  5 +++--
 utils/v4l2-ctl/v4l2-ctl-vbi.cpp              |  5 +++--
 12 files changed, 48 insertions(+), 22 deletions(-)
 create mode 100644 include/compiler.h

diff --git a/include/compiler.h b/include/compiler.h
new file mode 100644
index 00000000..22fa660b
--- /dev/null
+++ b/include/compiler.h
@@ -0,0 +1,9 @@
+#ifdef __cplusplus
+
+#ifdef __clang__
+#define fallthrough [[clang::fallthrough]]
+#else
+#define fallthrough [[gnu::fallthrough]]
+#endif
+
+#endif
diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 1c62b5c9..99f4e098 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -20,6 +20,7 @@
 #include <sstream>
 
 #include "cec-compliance.h"
+#include "compiler.h"
 #ifndef ANDROID
 #include "version.h"
 #endif
@@ -486,6 +487,7 @@ void sad_decode(struct short_audio_desc *sad, __u32 descriptor)
 		case SAD_EXT_TYPE_MPEG_H_3D_AUDIO:
 		case SAD_EXT_TYPE_AC_4:
 			sad->format_dependent = b3 & 0x07;
+			fallthrough;
 		case SAD_EXT_TYPE_LPCM_3D_AUDIO:
 			sad->bit_depth_mask = b3 & 0x07;
 			break;
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index ae7b2dba..1e6d7ed9 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -36,6 +36,7 @@
 #endif
 
 #include "cec-ctl.h"
+#include "compiler.h"
 
 static struct timespec start_monotonic;
 static struct timeval start_timeofday;
@@ -1967,7 +1968,7 @@ int main(int argc, char **argv)
 			break;
 		case OptPhysAddrFromEDIDPoll:
 			edid_path = optarg;
-			/* fall-through */
+			fallthrough;
 		case OptPhysAddrFromEDID:
 			phys_addr = parse_phys_addr_from_edid(optarg);
 			break;
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 1eeae2d4..f4842a99 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -19,6 +19,7 @@
 #include <sstream>
 
 #include "cec-follower.h"
+#include "compiler.h"
 #ifndef ANDROID
 #include "version.h"
 #endif
@@ -142,6 +143,7 @@ void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor)
 		case SAD_EXT_TYPE_MPEG_H_3D_AUDIO:
 		case SAD_EXT_TYPE_AC_4:
 			b3 |= sad->format_dependent & 0x07;
+			fallthrough;
 		case SAD_EXT_TYPE_LPCM_3D_AUDIO:
 			b3 |= sad->bit_depth_mask & 0x07;
 			break;
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 8e3a33a2..bc8c9c09 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -18,6 +18,7 @@
 #include <config.h>
 
 #include "cec-follower.h"
+#include "compiler.h"
 
 #define VOLUME_MAX 0x64
 #define VOLUME_MIN 0
@@ -352,7 +353,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		if (cec_has_tv(1 << la) && la_info[la].phys_addr == 0)
 			warn("TV (0) at 0.0.0.0 sent Routing Information.");
 	}
-
+	fallthrough;
 
 		/* System Information */
 
@@ -708,6 +709,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		cec_msg_system_audio_mode_status(&msg, node->state.sac_active ? CEC_OP_SYS_AUD_STATUS_ON :
 						 CEC_OP_SYS_AUD_STATUS_OFF);
 		transmit(node, &msg);
+		fallthrough;
 	case CEC_MSG_GIVE_AUDIO_STATUS:
 		if (!cec_has_audiosystem(1 << me))
 			break;
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index aa19f55d..4aecebce 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -7,6 +7,7 @@
 #include <stdlib.h>
 
 #include "cec-follower.h"
+#include "compiler.h"
 
 #define NUM_ANALOG_FREQS 3
 #define NUM_DIGITAL_CHANS 3
@@ -303,21 +304,21 @@ static int digital_get_service_idx(struct cec_op_digital_service_id *digital)
 	switch (digital->dig_bcast_system) {
 	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T:
 		is_terrestrial = true;
-		/* fall through */
+		fallthrough;
 	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
 		info = &digital_arib_data[is_terrestrial][0];
 		offset = is_terrestrial * NUM_DIGITAL_CHANS;
 		break;
 	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T:
 		is_terrestrial = true;
-		/* fall through */
+		fallthrough;
 	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
 		info = &digital_atsc_data[is_terrestrial][0];
 		offset = (2 + is_terrestrial) * NUM_DIGITAL_CHANS;
 		break;
 	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T:
 		is_terrestrial = true;
-		/* fall through */
+		fallthrough;
 	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
 		info = &digital_dvb_data[is_terrestrial][0];
 		offset = (4 + is_terrestrial) * NUM_DIGITAL_CHANS;
diff --git a/utils/libcecutil/cec-log.cpp b/utils/libcecutil/cec-log.cpp
index 28a1ecac..9410c071 100644
--- a/utils/libcecutil/cec-log.cpp
+++ b/utils/libcecutil/cec-log.cpp
@@ -14,6 +14,7 @@
 #include "cec-htng-funcs.h"
 #include "cec-info.h"
 #include "cec-log.h"
+#include "compiler.h"
 
 static const struct cec_arg arg_u8 = {
 	CEC_ARG_TYPE_U8,
@@ -44,7 +45,7 @@ static void log_arg(const struct cec_arg *arg, const char *arg_name, __u32 val)
 				return;
 			}
 		}
-		/* fall through */
+		fallthrough;
 	case CEC_ARG_TYPE_U8:
 		if (!strcmp(arg_name, "video-latency") ||
 		    !strcmp(arg_name, "audio-out-delay")) {
diff --git a/utils/v4l2-compliance/v4l2-test-colors.cpp b/utils/v4l2-compliance/v4l2-test-colors.cpp
index 887b198b..09d29a3e 100644
--- a/utils/v4l2-compliance/v4l2-test-colors.cpp
+++ b/utils/v4l2-compliance/v4l2-test-colors.cpp
@@ -28,6 +28,8 @@
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <math.h>
+
+#include "compiler.h"
 #include "v4l2-compliance.h"
 
 static void setupPlanes(const cv4l_fmt &fmt, __u8 *planes[3])
@@ -328,7 +330,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
 	case V4L2_PIX_FMT_RGBA444:
 	case V4L2_PIX_FMT_BGRA444:
 		c.a = (v16 >> 12) / 15.0;
-		/* fall through */
+		fallthrough;
 	case V4L2_PIX_FMT_RGB444:
 	case V4L2_PIX_FMT_XRGB444:
 	case V4L2_PIX_FMT_XBGR444:
@@ -345,7 +347,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
 	case V4L2_PIX_FMT_ABGR555:
 	case V4L2_PIX_FMT_BGRA555:
 		c.a = v16 >> 15;
-		/* fall through */
+		fallthrough;
 	case V4L2_PIX_FMT_YUV555:
 	case V4L2_PIX_FMT_RGB555:
 	case V4L2_PIX_FMT_XRGB555:
@@ -376,7 +378,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
 	case V4L2_PIX_FMT_RGBA32:
 	case V4L2_PIX_FMT_BGRA32:
 		c.a = ((v32 >> 24) & 0xff) / 255.0;
-		/* fall through */
+		fallthrough;
 	default:
 		c.r = ((v32 >> 16) & 0xff) / 255.0;
 		c.g = ((v32 >> 8) & 0xff) / 255.0;
@@ -444,7 +446,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
 		Y = (Y - 16.0 / 255.0) * 255.0 / 219.0;
 		cb *= 255.0 / 224.0;
 		cr *= 255.0 / 224.0;
-		/* fall through */
+		fallthrough;
 	case V4L2_YCBCR_ENC_601:
 	default:
 		ycbcr2rgb(bt601, Y, cb, cr, c);
@@ -453,7 +455,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
 		Y = (Y - 16.0 / 255.0) * 255.0 / 219.0;
 		cb *= 255.0 / 224.0;
 		cr *= 255.0 / 224.0;
-		/* fall through */
+		fallthrough;
 	case V4L2_YCBCR_ENC_709:
 		ycbcr2rgb(rec709, Y, cb, cr, c);
 		break;
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index 4184c4fa..d81dddb2 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -30,6 +30,8 @@
 #include <errno.h>
 #include <sys/ioctl.h>
 #include <vector>
+
+#include "compiler.h"
 #include "v4l2-compliance.h"
 
 #define V4L2_CTRL_CLASS_VIVID 0x00f00000
@@ -61,20 +63,20 @@ static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctrl)
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		if (qctrl.maximum > 1)
 			return fail("invalid boolean max value\n");
-		/* fall through */
+		fallthrough;
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_INTEGER_MENU:
 		if (qctrl.step != 1)
 			return fail("invalid step value %lld\n", qctrl.step);
 		if (qctrl.minimum < 0)
 			return fail("min < 0\n");
-		/* fall through */
+		fallthrough;
 	case V4L2_CTRL_TYPE_INTEGER:
 	case V4L2_CTRL_TYPE_INTEGER64:
 		if (qctrl.default_value < qctrl.minimum ||
 		    qctrl.default_value > qctrl.maximum)
 			return fail("def < min || def > max\n");
-		/* fall through */
+		fallthrough;
 	case V4L2_CTRL_TYPE_STRING:
 		if (qctrl.minimum > qctrl.maximum)
 			return fail("min > max\n");
@@ -116,7 +118,7 @@ static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctrl)
 	case V4L2_CTRL_TYPE_BUTTON:
 		if ((fl & rw_mask) != V4L2_CTRL_FLAG_WRITE_ONLY)
 			return fail("button control not write only\n");
-		/* fall through */
+		fallthrough;
 	case V4L2_CTRL_TYPE_BOOLEAN:
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_INTEGER_MENU:
@@ -124,7 +126,7 @@ static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctrl)
 	case V4L2_CTRL_TYPE_BITMASK:
 		if (fl & V4L2_CTRL_FLAG_SLIDER)
 			return fail("slider makes only sense for integer controls\n");
-		/* fall through */
+		fallthrough;
 	case V4L2_CTRL_TYPE_INTEGER64:
 	case V4L2_CTRL_TYPE_INTEGER:
 		if ((fl & rw_mask) == rw_mask)
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 824769b3..4ea97ee7 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -30,6 +30,8 @@
 #include <errno.h>
 #include <sys/ioctl.h>
 #include <assert.h>
+
+#include "compiler.h"
 #include "v4l2-compliance.h"
 
 static const __u32 buftype2cap[] = {
@@ -97,7 +99,7 @@ static int testEnumFrameIntervals(struct node *node, __u32 pixfmt,
 		case V4L2_FRMIVAL_TYPE_CONTINUOUS:
 			if (sw->step.numerator != 1 || sw->step.denominator != 1)
 				return fail("invalid step for continuous frameinterval\n");
-			/* fallthrough */
+			fallthrough;
 		case V4L2_FRMIVAL_TYPE_STEPWISE:
 			if (frmival.index)
 				return fail("index must be 0 for stepwise/continuous frameintervals\n");
@@ -183,7 +185,7 @@ static int testEnumFrameSizes(struct node *node, __u32 pixfmt)
 		case V4L2_FRMSIZE_TYPE_CONTINUOUS:
 			if (frmsize.stepwise.step_width != 1 || frmsize.stepwise.step_height != 1)
 				return fail("invalid step_width/height for continuous framesize\n");
-			/* fallthrough */
+			fallthrough;
 		case V4L2_FRMSIZE_TYPE_STEPWISE:
 			if (frmsize.index)
 				return fail("index must be 0 for stepwise/continuous framesizes\n");
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 6981a3cc..a4cdc4bd 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -19,6 +19,7 @@
 #include <math.h>
 #include <linux/media.h>
 
+#include "compiler.h"
 #include "v4l2-ctl.h"
 #include "v4l-stream.h"
 #include <media-info.h>
@@ -763,7 +764,7 @@ void streaming_cmd(int ch, char *optarg)
 		break;
 	case OptStreamUser:
 		memory = V4L2_MEMORY_USERPTR;
-		/* fall through */
+		fallthrough;
 	case OptStreamMmap:
 		if (optarg) {
 			reqbufs_count_cap = strtoul(optarg, 0L, 0);
@@ -776,7 +777,7 @@ void streaming_cmd(int ch, char *optarg)
 		break;
 	case OptStreamOutUser:
 		out_memory = V4L2_MEMORY_USERPTR;
-		/* fall through */
+		fallthrough;
 	case OptStreamOutMmap:
 		if (optarg) {
 			reqbufs_count_out = strtoul(optarg, 0L, 0);
diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
index c5960f78..987fae25 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
@@ -14,6 +14,7 @@
 #include <dirent.h>
 #include <math.h>
 
+#include "compiler.h"
 #include "v4l2-ctl.h"
 
 static struct v4l2_format sliced_fmt;	  /* set_format/get_format for sliced VBI */
@@ -87,7 +88,7 @@ void vbi_cmd(int ch, char *optarg)
 	case OptSetSlicedVbiOutFormat:
 	case OptTrySlicedVbiOutFormat:
 		sliced = &sliced_fmt_out;
-		/* fall through */
+		fallthrough;
 	case OptSetSlicedVbiFormat:
 	case OptTrySlicedVbiFormat:
 		sliced->fmt.sliced.service_set = 0;
@@ -130,7 +131,7 @@ void vbi_cmd(int ch, char *optarg)
 	case OptSetVbiOutFormat:
 	case OptTryVbiOutFormat:
 		raw = &raw_fmt_out;
-		/* fall through */
+		fallthrough;
 	case OptSetVbiFormat:
 	case OptTryVbiFormat:
 		subs = optarg;
-- 
2.25.3

