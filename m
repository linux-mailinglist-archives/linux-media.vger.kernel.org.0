Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E151B1514
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 20:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgDTSrA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 14:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbgDTSq7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 14:46:59 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0978C061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:46:58 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id ay1so4288058plb.0
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pmXgVfrCaEJM4XqVQF1wL6sqq2+r90tusGJ6s4f3xzY=;
        b=b3kin/z+Cvl+1rYfGzrN3EvGx9pjv2rXI+SI71Jc/n9f9F4/yz0UIEVatY2EIMDnSu
         Gjyvzt7Vvqs8U1xwpVAdCw4G6teI7EcJKQrvWUhKiJM7JbidCDRMQL6+msZblINEDFwm
         iAmXn17f2JA1NkAD5OCendXgE7H4KelxAkuaLOgB8SiRxxxUVRJjNxxU2aTIS3PgvCEQ
         KdO5c83inIyQDEh7tAw9epuNwhhSNutG3KUskXx8M6u1i08v34oO9Gvu5+HAP7Zd3P4/
         CNXYX3aVAZyYGwMPYaaRQgft8Drnn0bjT398lQWYr2RZB6aRcm/PsKjvFPPqUmhzv5xi
         26ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pmXgVfrCaEJM4XqVQF1wL6sqq2+r90tusGJ6s4f3xzY=;
        b=JjqPKCfEwsBk61KLpk9oHwLVap+xLvxYSd9eBA4SC/yD9yv7Gytmi8miluFkaxIpdh
         NwMfeD1wNzZn2d4yUyzSHVnoFfYkmXpiJVndL86+//kL32nNpIsbO+PAHgWW/VUZiD27
         FYx88eCJAXShLiEDGKWhIDa3BgaNj0YEyEfS12gG9oBT87bOyG3XElfZO3eFIW3UK8Lq
         b0msiNwOTTbmtaxw2zIq/QhpKzKwiaQLFO/k7AETFnomeBvgTND4z9NLp2b3Hsm1k+IW
         nB9BxUcs3fWFLKFdlY8dgBBdl/9+eBid41Dhcx0wXKmi71LvTzoGxhxpMA/4DBI70Inb
         /FRg==
X-Gm-Message-State: AGi0PuY3EuI7Esmd4p/JVcJqw8MJXoiU7VpbpZdMUXJH7LLmUzNbe0z5
        onDMGEe8fNdNZ/K6hND0yuuRCYJE
X-Google-Smtp-Source: APiQypLh5xDWTcNC0FCOjy1erKlUez/CbmwK/di55CAAGf8+D4NLmymaB+rTe9nHxsoqFs4wvfv9Mw==
X-Received: by 2002:a17:902:bd8f:: with SMTP id q15mr1489840pls.76.1587408417937;
        Mon, 20 Apr 2020 11:46:57 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id n8sm182443pfq.213.2020.04.20.11.46.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 11:46:57 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 7/7] utils: do not use empty void with C++
Date:   Mon, 20 Apr 2020 11:46:49 -0700
Message-Id: <20200420184649.4202-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200420184649.4202-1-rosenp@gmail.com>
References: <20200420184649.4202-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with clang-tidy's modernize-redundant-void-arg

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp   |  2 +-
 utils/cec-compliance/cec-test.cpp         |  4 ++--
 utils/cec-ctl/cec-ctl.cpp                 |  2 +-
 utils/cec-follower/cec-follower.cpp       |  2 +-
 utils/rds-ctl/rds-ctl.cpp                 | 12 ++++++------
 utils/v4l2-compliance/v4l2-compliance.cpp |  2 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp        |  2 +-
 utils/v4l2-ctl/v4l2-ctl-edid.cpp          |  2 +-
 utils/v4l2-ctl/v4l2-ctl-io.cpp            |  2 +-
 utils/v4l2-ctl/v4l2-ctl-meta.cpp          |  2 +-
 utils/v4l2-ctl/v4l2-ctl-misc.cpp          |  2 +-
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp       |  2 +-
 utils/v4l2-ctl/v4l2-ctl-sdr.cpp           |  2 +-
 utils/v4l2-ctl/v4l2-ctl-selection.cpp     |  2 +-
 utils/v4l2-ctl/v4l2-ctl-stds.cpp          |  2 +-
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp     |  2 +-
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp        |  2 +-
 utils/v4l2-ctl/v4l2-ctl-tuner.cpp         |  2 +-
 utils/v4l2-ctl/v4l2-ctl-vbi.cpp           |  2 +-
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp        |  2 +-
 utils/v4l2-ctl/v4l2-ctl-vidout.cpp        |  2 +-
 utils/v4l2-ctl/v4l2-ctl.cpp               |  2 +-
 utils/v4l2-dbg/v4l2-dbg.cpp               |  2 +-
 23 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 6d07bfc9..713e2a58 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -178,7 +178,7 @@ static struct option long_options[] = {
 	{0, 0, 0, 0}
 };
 
-static void usage(void)
+static void usage()
 {
 	printf("Usage:\n"
 	       "  -d, --device <dev>   Use device <dev> instead of /dev/cec0\n"
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index a82069ad..af9f3d38 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -1494,7 +1494,7 @@ static const unsigned num_tests = sizeof(tests) / sizeof(struct remote_test);
 static std::map<std::string, int> mapTests;
 static std::map<std::string, bool> mapTestsNoWarnings;
 
-void collectTests(void)
+void collectTests()
 {
 	std::map<std::string, __u64> mapTestFuncs;
 
@@ -1516,7 +1516,7 @@ void collectTests(void)
 	}
 }
 
-void listTests(void)
+void listTests()
 {
 	for (unsigned i = 0; i < num_tests; i++) {
 		printf("%s:\n", tests[i].name);
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 46cfcd80..929928e2 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -229,7 +229,7 @@ static struct option long_options[] = {
 	{ 0, 0, 0, 0 }
 };
 
-static void usage(void)
+static void usage()
 {
 	printf("Usage:\n"
 	       "  -d, --device <dev>       Use device <dev> instead of /dev/cec0\n"
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index ab3113b6..36bd2fbb 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -71,7 +71,7 @@ static struct option long_options[] = {
 	{ 0, 0, 0, 0 }
 };
 
-static void usage(void)
+static void usage()
 {
 	printf("Usage:\n"
 	       "  -d, --device <dev>  Use device <dev> instead of /dev/cec0\n"
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index fef2a3f1..0511fe5d 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -108,12 +108,12 @@ static struct option long_options[] = {
 	{0, 0, 0, 0}
 };
 
-static void usage_hint(void)
+static void usage_hint()
 {
 	fprintf(stderr, "Try 'rds-ctl --help' for more information.\n");
 }
 
-static void usage_common(void)
+static void usage_common()
 {
 	printf("\nGeneral/Common options:\n"
 	       "  --all              display all device information available\n"
@@ -127,7 +127,7 @@ static void usage_common(void)
 	       );
 }
 
-static void usage_tuner(void)
+static void usage_tuner()
 {
 	printf("\nTuner/Modulator options:\n"
 	       "  -F, --get-freq     query the frequency [VIDIOC_G_FREQUENCY]\n"
@@ -145,7 +145,7 @@ static void usage_tuner(void)
 	       );
 }
 
-static void usage_rds(void)
+static void usage_rds()
 {
 	printf("\nRDS options: \n"
 	       "  -b, --rbds         parse the RDS data according to the RBDS standard\n"
@@ -164,7 +164,7 @@ static void usage_rds(void)
 	       );
 }
 
-static void usage(void)
+static void usage()
 {
 	printf("Usage:\n");
 	usage_common();
@@ -326,7 +326,7 @@ static void print_devices(dev_vec files)
 		printf("%s\n", iter->second.c_str());
 	}
 }
-static dev_vec list_devices(void)
+static dev_vec list_devices()
 {
 	DIR *dp;
 	struct dirent *ep;
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 39dd1aec..3211b492 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -155,7 +155,7 @@ static struct option long_options[] = {
 	{0, 0, 0, 0}
 };
 
-static void usage(void)
+static void usage()
 {
 	printf("Usage:\n");
 	printf("Common options:\n");
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 5dde39b9..3ca02087 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -55,7 +55,7 @@ static enum v4l2_priority prio = V4L2_PRIORITY_UNSET;
 
 static bool have_query_ext_ctrl;
 
-void common_usage(void)
+void common_usage()
 {
 	printf("\nGeneral/Common options:\n"
 	       "  --all              display all information available\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
index 366e6522..9c7c6bc4 100644
--- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
@@ -122,7 +122,7 @@ static __u8 toggle_hdr_md_flags;
 #define HDR_MD_SMPTE_2084	(1 << 2)
 #define HDR_MD_HLG		(1 << 3)
 
-void edid_usage(void)
+void edid_usage()
 {
 	printf("\nEDID options:\n"
 	       "  --set-edid pad=<pad>[,type=<type>|file=<file>][,format=<fmt>][modifiers]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-io.cpp b/utils/v4l2-ctl/v4l2-ctl-io.cpp
index 1130fdc0..9e83c03a 100644
--- a/utils/v4l2-ctl/v4l2-ctl-io.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-io.cpp
@@ -21,7 +21,7 @@ static struct v4l2_audioout vaudout;   	/* audio outputs */
 static int input;			/* set_input/get_input */
 static int output;			/* set_output/get_output */
 
-void io_usage(void)
+void io_usage()
 {
 	printf("\nInput/Output options:\n"
 	       "  -I, --get-input    query the video input [VIDIOC_G_INPUT]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index 0e1071b0..76d4b1dd 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -18,7 +18,7 @@
 
 static struct v4l2_format vfmt;	/* set_format/get_format */
 
-void meta_usage(void)
+void meta_usage()
 {
 	printf("\nMetadata Formats options:\n"
 	       "  --list-formats-meta display supported metadata capture formats [VIDIOC_ENUM_FMT]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
index 23a0fd38..cb933217 100644
--- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
@@ -23,7 +23,7 @@ static struct v4l2_streamparm parm;	/* get/set parm */
 static double fps = 0;			/* set framerate speed, in fps */
 static double output_fps = 0;		/* set framerate speed, in fps */
 
-void misc_usage(void)
+void misc_usage()
 {
 	printf("\nMiscellaneous options:\n"
 	       "  --wait-for-event <event>\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index 4c9609d6..16344a15 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -28,7 +28,7 @@ static const char *fb_device;
 static std::vector<struct v4l2_clip> clips;
 static std::vector<struct v4l2_rect> bitmap_rects;
 
-void overlay_usage(void)
+void overlay_usage()
 {
 	printf("\nVideo Overlay options:\n"
 	       "  --list-formats-overlay\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
index d13f5c76..0b7c4cdc 100644
--- a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
@@ -18,7 +18,7 @@
 
 static struct v4l2_format vfmt;	/* set_format/get_format */
 
-void sdr_usage(void)
+void sdr_usage()
 {
 	printf("\nSDR Formats options:\n"
 	       "  --list-formats-sdr display supported SDR capture formats [VIDIOC_ENUM_FMT]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-selection.cpp b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
index c35d0536..ac5a1d7b 100644
--- a/utils/v4l2-ctl/v4l2-ctl-selection.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
@@ -44,7 +44,7 @@ static struct v4l2_rect vcrop_out_overlay; 	/* crop rect */
 static struct v4l2_selection vselection; 	/* capture selection */
 static struct v4l2_selection vselection_out;	/* output selection */
 
-void selection_usage(void)
+void selection_usage()
 {
 	printf("\nSelection/Cropping options:\n"
 	       "  --get-cropcap      query the crop capabilities [VIDIOC_CROPCAP]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-stds.cpp b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
index 7ba44ae3..62f57a44 100644
--- a/utils/v4l2-ctl/v4l2-ctl-stds.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
@@ -25,7 +25,7 @@ static unsigned set_dv_timing_opts;
 static __u32 list_dv_timings_pad;
 static __u32 dv_timings_cap_pad;
 
-void stds_usage(void)
+void stds_usage()
 {
 	printf("\nStandards/Timings options:\n"
 	       "  --list-standards   display supported video standards [VIDIOC_ENUMSTD]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 833263b6..663d0254 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -257,7 +257,7 @@ double fps_timestamps::fps()
 	return fps;
 };
 
-void streaming_usage(void)
+void streaming_usage()
 {
 	printf("\nVideo Streaming options:\n"
 	       "  --stream-count <count>\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index 17532d5e..747f1699 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -49,7 +49,7 @@ static struct v4l2_subdev_frame_interval_enum frmival;
 static __u32 set_fps_pad;
 static double set_fps;
 
-void subdev_usage(void)
+void subdev_usage()
 {
 	printf("\nSub-Device options:\n"
 	       "  --list-subdev-mbus-codes <pad>\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
index 4c291eb3..bc397ec2 100644
--- a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
@@ -26,7 +26,7 @@ static struct v4l2_hw_freq_seek freq_seek; /* freq-seek */
 static double low, high;		/* freq-seek frequency range */
 static int mode = V4L2_TUNER_MODE_STEREO;  /* set audio mode */
 
-void tuner_usage(void)
+void tuner_usage()
 {
 	printf("\nTuner/Modulator options:\n"
 	       "  -F, --get-freq     query the frequency [VIDIOC_G_FREQUENCY]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
index 148c9e65..c5960f78 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
@@ -21,7 +21,7 @@ static struct v4l2_format sliced_fmt_out; /* set_format/get_format for sliced VB
 static struct v4l2_format raw_fmt;	  /* set_format/get_format for VBI */
 static struct v4l2_format raw_fmt_out;	  /* set_format/get_format for VBI output */
 
-void vbi_usage(void)
+void vbi_usage()
 {
 	printf("\nVBI Formats options:\n"
 	       "  --get-sliced-vbi-cap\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index a9ef8eed..49c20200 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -23,7 +23,7 @@ static __u32 width, height, pixfmt, field, flags;
 static __u32 bytesperline[VIDEO_MAX_PLANES];
 static __u32 sizeimage[VIDEO_MAX_PLANES];
 
-void vidcap_usage(void)
+void vidcap_usage()
 {
 	printf("\nVideo Capture Formats options:\n"
 	       "  --list-formats     display supported video formats [VIDIOC_ENUM_FMT]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
index 227d624f..955b2c50 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
@@ -21,7 +21,7 @@ static __u32 width, height, pixfmt, field, colorspace, xfer_func, ycbcr, quantiz
 static __u32 bytesperline[VIDEO_MAX_PLANES];
 static __u32 sizeimage[VIDEO_MAX_PLANES];
 
-void vidout_usage(void)
+void vidout_usage()
 {
 	printf("\nVideo Output Formats options:\n"
 	       "  --list-formats-out display supported video output formats [VIDIOC_ENUM_FMT]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index c0097203..f6e90f51 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -287,7 +287,7 @@ static struct option long_options[] = {
 	{0, 0, 0, 0}
 };
 
-static void usage_all(void)
+static void usage_all()
 {
        common_usage();
        tuner_usage();
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index dcf8200a..cd387d1d 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -162,7 +162,7 @@ static struct option long_options[] = {
 	{0, 0, 0, 0}
 };
 
-static void usage(void)
+static void usage()
 {
 	printf("Usage: v4l2-dbg [options] [values]\n"
 	       "  -D, --info         Show driver info [VIDIOC_QUERYCAP]\n"
-- 
2.25.2

