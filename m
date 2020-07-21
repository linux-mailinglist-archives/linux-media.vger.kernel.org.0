Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4FE227F8E
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 14:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgGUME5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 08:04:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43198 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgGUME4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 08:04:56 -0400
Received: from localhost.localdomain (p200300cb8737cf006d3158085b9e7324.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:6d31:5808:5b9e:7324])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DEB5E29656D;
        Tue, 21 Jul 2020 13:04:53 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v4l-utils] utils: v4l2-ctl: support V4L2_CAP_IO_MC in v4l2-ctl '--list-formats-*' commands
Date:   Tue, 21 Jul 2020 14:04:46 +0200
Message-Id: <20200721120446.13251-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add optional <mbus_code> arg to all 'v4l2-ctl --list-formats-*'
commands. If <mbus_code> is given and the device has capability
V4L2_CAP_IO_MC then list only the formats that matches the
mbus code.
If <mbus_code> is given and the device doesn't have this
capability then print an error message.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
The patch is only tested on the capture devices of vimc driver,
and for the error message on vivid driver.

 utils/common/cv4l-helpers.h         |  3 +-
 utils/v4l2-ctl/v4l2-ctl-meta.cpp    | 10 +++++--
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp |  7 +++--
 utils/v4l2-ctl/v4l2-ctl-sdr.cpp     | 11 +++++--
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp  | 13 ++++++--
 utils/v4l2-ctl/v4l2-ctl-vidout.cpp  | 12 +++++---
 utils/v4l2-ctl/v4l2-ctl.cpp         | 46 ++++++++++++++++++++++-------
 utils/v4l2-ctl/v4l2-ctl.h           |  1 +
 8 files changed, 77 insertions(+), 26 deletions(-)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 9de0cdf0..56c8397f 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -483,12 +483,13 @@ public:
 		return cv4l_ioctl(VIDIOC_ENUM_DV_TIMINGS, &timings);
 	}
 
-	int enum_fmt(v4l2_fmtdesc &fmt, bool init = false, int index = 0, unsigned type = 0)
+	int enum_fmt(v4l2_fmtdesc &fmt, bool init = false, int index = 0, unsigned type = 0, __u32 mbus_code = 0)
 	{
 		if (init) {
 			memset(&fmt, 0, sizeof(fmt));
 			fmt.type = type ? type : g_type();
 			fmt.index = index;
+			fmt.mbus_code = mbus_code;
 		} else {
 			fmt.index++;
 		}
diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index 2f745e4f..0c8560f4 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -22,7 +22,10 @@ static struct v4l2_format vfmt;	/* set_format/get_format */
 void meta_usage()
 {
 	printf("\nMetadata Formats options:\n"
-	       "  --list-formats-meta display supported metadata capture formats [VIDIOC_ENUM_FMT]\n"
+	       "  --list-formats-meta <mbus_code> display supported metadata capture formats.\n"
+	       "		      <mbus_code> is an optional media bus code, if the driver has\n"
+	       "		      capability V4L2_CAP_IO_MC then only formats that support this\n"
+	       "		      media code are listed [VIDIOC_ENUM_FMT]\n"
 	       "  --get-fmt-meta      query the metadata capture format [VIDIOC_G_FMT]\n"
 	       "  --set-fmt-meta <f>  set the metadata capture format [VIDIOC_S_FMT]\n"
 	       "                     parameter is either the format index as reported by\n"
@@ -30,7 +33,10 @@ void meta_usage()
 	       "  --try-fmt-meta <f>  try the metadata capture format [VIDIOC_TRY_FMT]\n"
 	       "                     parameter is either the format index as reported by\n"
 	       "                     --list-formats-meta, or the fourcc value as a string\n"
-	       "  --list-formats-meta-out display supported metadata output formats [VIDIOC_ENUM_FMT]\n"
+	       "  --list-formats-meta-out <mbus_code> display supported metadata output formats.\n"
+	       "		      <mbus_code> is an optional media bus code, if the driver has\n"
+	       "		      capability V4L2_CAP_IO_MC then only formats that support this\n"
+	       "		      media code are listed [VIDIOC_ENUM_FMT]\n"
 	       "  --get-fmt-meta-out      query the metadata output format [VIDIOC_G_FMT]\n"
 	       "  --set-fmt-meta-out <f>  set the metadata output format [VIDIOC_S_FMT]\n"
 	       "                          parameter is either the format index as reported by\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index 16344a15..992824eb 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -31,8 +31,11 @@ static std::vector<struct v4l2_rect> bitmap_rects;
 void overlay_usage()
 {
 	printf("\nVideo Overlay options:\n"
-	       "  --list-formats-overlay\n"
-	       "                     display supported overlay formats [VIDIOC_ENUM_FMT]\n"
+	       "  --list-formats-overlay <mbus_code>\n"
+	       "                     display supported overlay formats\n"
+	       "		     <mbus_code> is an optional media bus code, if the driver has\n"
+	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
+	       "		     media code are listed [VIDIOC_ENUM_FMT]\n"
 	       "  --find-fb          find the fb device corresponding with the overlay\n"
 	       "  --overlay <on>     turn overlay on (1) or off (0) (VIDIOC_OVERLAY)\n"
 	       "  --get-fmt-overlay  query the video or video output overlay format [VIDIOC_G_FMT]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
index 7a36341a..bfb10694 100644
--- a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
@@ -22,7 +22,10 @@ static struct v4l2_format vfmt;	/* set_format/get_format */
 void sdr_usage()
 {
 	printf("\nSDR Formats options:\n"
-	       "  --list-formats-sdr display supported SDR capture formats [VIDIOC_ENUM_FMT]\n"
+	       "  --list-formats-sdr <mbus_code> display supported SDR capture formats.\n"
+	       "		     <mbus_code> is an optional media bus code, if the driver has\n"
+	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
+	       "		     media code are listed [VIDIOC_ENUM_FMT]\n"
 	       "  --get-fmt-sdr      query the SDR capture format [VIDIOC_G_FMT]\n"
 	       "  --set-fmt-sdr <f>  set the SDR capture format [VIDIOC_S_FMT]\n"
 	       "                     parameter is either the format index as reported by\n"
@@ -30,8 +33,10 @@ void sdr_usage()
 	       "  --try-fmt-sdr <f>  try the SDR capture format [VIDIOC_TRY_FMT]\n"
 	       "                     parameter is either the format index as reported by\n"
 	       "                     --list-formats-sdr-cap, or the fourcc value as a string\n"
-	       "  --list-formats-sdr-out\n"
-	       "                     display supported SDR output formats [VIDIOC_ENUM_FMT]\n"
+	       "  --list-formats-sdr-out <mbus_code> display supported SDR output formats.\n"
+	       "		     <mbus_code> is an optional media bus code, if the driver has\n"
+	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
+	       "		     media code are listed [VIDIOC_ENUM_FMT]\n"
 	       "  --get-fmt-sdr-out  query the SDR output format [VIDIOC_G_FMT]\n"
 	       "  --set-fmt-sdr-out <f>\n"
 	       "                     set the SDR output format [VIDIOC_S_FMT]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 80312b51..cc4af58b 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -27,9 +27,16 @@ static __u32 sizeimage[VIDEO_MAX_PLANES];
 void vidcap_usage()
 {
 	printf("\nVideo Capture Formats options:\n"
-	       "  --list-formats     display supported video formats [VIDIOC_ENUM_FMT]\n"
-	       "  --list-formats-ext display supported video formats including frame sizes\n"
-	       "                     and intervals\n"
+	       "  --list-formats <mbus_code>\n"
+	       "		     display supported video formats. <mbus_code> is an optional\n"
+	       "		     media bus code, if the driver has capability V4L2_CAP_IO_MC\n"
+	       "		     then only formats that support this media code are listed\n"
+	       "		     [VIDIOC_ENUM_FMT]\n"
+	       "  --list-formats-ext <mbus_code>\n"
+	       "		     display supported video formats including frame sizes and intervals\n"
+	       "		     <mbus_code> is an optional media bus code, if the driver has\n"
+	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
+	       "		     media code are listed [VIDIOC_ENUM_FMT]\n"
 	       "  --list-framesizes <f>\n"
 	       "                     list supported framesizes for pixelformat <f>\n"
 	       "                     [VIDIOC_ENUM_FRAMESIZES]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
index 5f433a17..54d77db2 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
@@ -25,10 +25,14 @@ static __u32 sizeimage[VIDEO_MAX_PLANES];
 void vidout_usage()
 {
 	printf("\nVideo Output Formats options:\n"
-	       "  --list-formats-out display supported video output formats [VIDIOC_ENUM_FMT]\n"
-	       "  --list-formats-out-ext\n"
-	       "                     display supported video output formats including frame sizes\n"
-	       "                     and intervals\n"
+	       "  --list-formats-out <mbus_code> display supported video output formats.\n"
+	       "		     <mbus_code> is an optional media bus code, if the driver has\n"
+	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
+	       "		     media code are listed [VIDIOC_ENUM_FMT]\n"
+	       "  --list-formats-out-ext <mbus_code> display supported video output formats including\n"
+	       "		     frame sizes and intervals. <mbus_code> is an optional media bus code,\n"
+	       "		     if the driver has capability V4L2_CAP_IO_MC then only formats that\n"
+	       "		     support this media code are listed [VIDIOC_ENUM_FMT]\n"
 	       "  --list-fields-out  list supported fields for the current output format\n"
 	       "  -X, --get-fmt-video-out\n"
 	       "     		     query the video output format [VIDIOC_G_FMT]\n"
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 321d2d1c..6c371402 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -59,6 +59,8 @@ char options[OptLast];
 static int app_result;
 int verbose;
 
+
+unsigned mbus_code_list_formats;
 unsigned capabilities;
 unsigned out_capabilities;
 unsigned priv_magic;
@@ -114,18 +116,18 @@ static struct option long_options[] = {
 	{"get-freq", no_argument, 0, OptGetFreq},
 	{"set-freq", required_argument, 0, OptSetFreq},
 	{"list-standards", no_argument, 0, OptListStandards},
-	{"list-formats", no_argument, 0, OptListFormats},
-	{"list-formats-ext", no_argument, 0, OptListFormatsExt},
+	{"list-formats", optional_argument, 0, OptListFormats},
+	{"list-formats-ext", optional_argument, 0, OptListFormatsExt},
 	{"list-fields", no_argument, 0, OptListFields},
 	{"list-framesizes", required_argument, 0, OptListFrameSizes},
 	{"list-frameintervals", required_argument, 0, OptListFrameIntervals},
-	{"list-formats-overlay", no_argument, 0, OptListOverlayFormats},
-	{"list-formats-sdr", no_argument, 0, OptListSdrFormats},
-	{"list-formats-sdr-out", no_argument, 0, OptListSdrOutFormats},
-	{"list-formats-out", no_argument, 0, OptListOutFormats},
-	{"list-formats-out-ext", no_argument, 0, OptListOutFormatsExt},
-	{"list-formats-meta", no_argument, 0, OptListMetaFormats},
-	{"list-formats-meta-out", no_argument, 0, OptListMetaOutFormats},
+	{"list-formats-overlay", optional_argument, 0, OptListOverlayFormats},
+	{"list-formats-sdr", optional_argument, 0, OptListSdrFormats},
+	{"list-formats-sdr-out", optional_argument, 0, OptListSdrOutFormats},
+	{"list-formats-out", optional_argument, 0, OptListOutFormats},
+	{"list-formats-out-ext", optional_argument, 0, OptListOutFormatsExt},
+	{"list-formats-meta", optional_argument, 0, OptListMetaFormats},
+	{"list-formats-meta-out", optional_argument, 0, OptListMetaOutFormats},
 	{"list-subdev-mbus-codes", optional_argument, 0, OptListSubDevMBusCodes},
 	{"list-subdev-framesizes", required_argument, 0, OptListSubDevFrameSizes},
 	{"list-subdev-frameintervals", required_argument, 0, OptListSubDevFrameIntervals},
@@ -617,8 +619,13 @@ void print_video_formats(cv4l_fd &fd, __u32 type)
 	cv4l_disable_trace dt(fd);
 	struct v4l2_fmtdesc fmt = {};
 
+	if (mbus_code_list_formats && !(capabilities & V4L2_CAP_IO_MC)) {
+		fprintf(stderr, "<mbus_code> is invalid since the device doesn't have capability V4L2_CAP_IO_MC\n");
+		std::exit(EXIT_FAILURE);
+	}
+
 	printf("\tType: %s\n\n", buftype2s(type).c_str());
-	if (fd.enum_fmt(fmt, true, 0, type))
+	if (fd.enum_fmt(fmt, true, 0, type, mbus_code_list_formats))
 		return;
 	do {
 		printf("\t[%d]: '%s' (%s", fmt.index, fcc2s(fmt.pixelformat).c_str(),
@@ -636,8 +643,13 @@ void print_video_formats_ext(cv4l_fd &fd, __u32 type)
 	struct v4l2_frmsizeenum frmsize;
 	struct v4l2_frmivalenum frmival;
 
+	if (mbus_code_list_formats && !(capabilities & V4L2_CAP_IO_MC)) {
+		fprintf(stderr, "<mbus_code> is invalid since the device doesn't have capability V4L2_CAP_IO_MC\n");
+		std::exit(EXIT_FAILURE);
+	}
+
 	printf("\tType: %s\n\n", buftype2s(type).c_str());
-	if (fd.enum_fmt(fmt, true, 0, type))
+	if (fd.enum_fmt(fmt, true, 0, type, mbus_code_list_formats))
 		return;
 	do {
 		printf("\t[%d]: '%s' (%s", fmt.index, fcc2s(fmt.pixelformat).c_str(),
@@ -1256,6 +1268,18 @@ int main(int argc, char **argv)
 		case OptVersion:
 			print_version();
 			return 0;
+		case OptListFormats:
+		case OptListFormatsExt:
+		case OptListOverlayFormats:
+		case OptListSdrFormats:
+		case OptListSdrOutFormats:
+		case OptListOutFormats:
+		case OptListOutFormatsExt:
+		case OptListMetaFormats:
+		case OptListMetaOutFormats:
+			if (optarg)
+				mbus_code_list_formats = strtoul(optarg, 0L, 0);
+			break;
 		case ':':
 			fprintf(stderr, "Option '%s' requires a value\n",
 					argv[optind]);
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index 27a3ca35..577037cf 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -268,6 +268,7 @@ enum Option {
 };
 
 extern char options[OptLast];
+extern unsigned mbus_code_list_formats;
 extern unsigned capabilities;
 extern unsigned out_capabilities;
 extern unsigned priv_magic;
-- 
2.17.1

