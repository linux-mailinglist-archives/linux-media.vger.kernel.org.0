Return-Path: <linux-media+bounces-16850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 889AD95F7D6
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 19:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F027AB21C87
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55ED3198A36;
	Mon, 26 Aug 2024 17:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YmXZODqX";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="bKxa6gUX"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-44.smtp-out.eu-west-1.amazonses.com (a7-44.smtp-out.eu-west-1.amazonses.com [54.240.7.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A40D192D64
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724692816; cv=none; b=Gj5eX2JGaxcH6OcP5hlH7yNdSuGTP1ez+fW9aWBcN50kXdlmjkmzQ9Wv4yRRiY32dpnTFIhBi/VopwfNIJt/eTveW1QHo/QKXfW9zcDRShJBQCHZsz25xOts3x4WKQq5s+6zgOtlT610T0fxWsXO9VnDlvKiXrV/2rM5WgAhthI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724692816; c=relaxed/simple;
	bh=QVo/tzc7xDWTCe9EfvawQcoLFUU5LFSnfElDUCx/Pz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=inljDgnxt5DKtDjQ7RJ1DQezEiRUVPeU7uDAAoszd8iHPUJ0JDwBdEi24u+px/Aj7InkuMqfvdl896bDMvi0/+uOur7xJ5Xjo8dECKfmwUWIhvNFAT5W1LgcE1a5LGtyL/0AyvgLO/FztON8as7oJFLlcoKKsPxRhDUIp0pwjyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YmXZODqX; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=bKxa6gUX; arc=none smtp.client-ip=54.240.7.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724692812;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=QVo/tzc7xDWTCe9EfvawQcoLFUU5LFSnfElDUCx/Pz0=;
	b=YmXZODqXHFygzcMoiQpZkJDZl9hDlCFjnA462lomxDsxyUHkN24sJ2K+0MA4imkt
	Z4XeIyUZoYgr6JXcsmEE6+TgeTZsroJOC0BFfEuORPscKeqJtiXgmHNB1ByBvyx6H0f
	WBKulxqZXlpIFjtTa9BcXCyIS4PNACq4vDlyQL+AYQ1MdXL7fFziv21oi5cijyczhSW
	U3w4lU5IMDnwenIYFXhediMswnLSdfyeAHk7vgGG1g3/6kAMA4rZRe/6PKQemblBeSe
	gwXG0Xc0GeV6FbkHOYejC/DXsmrFb9IOrTLrDVPkp7bq/Z2NKRAJnu90/1GK7DmMHn/
	Z9FNZJRTyg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724692812;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=QVo/tzc7xDWTCe9EfvawQcoLFUU5LFSnfElDUCx/Pz0=;
	b=bKxa6gUX6PwU9TGIT75cnSavRm3VsXRp3P4UHqxXCXMsSvXRm77j9IhwE0MoqzWW
	5+muEec95a+4+1xUNgjSDAUQWDHSWb+bkQ32qLdSsJF2K5BCW8WKdvWwzjPDwR/se40
	S5oKRKggntS6jnqG6QxIp9EQ3iVCzVEWyOlX2PTU=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 2/2] v4l2-ctl-vidcap: Add options to enumerate all pixel formats
Date: Mon, 26 Aug 2024 17:20:12 +0000
Message-ID: <010201918fb3d1ab-e36adb13-c37e-43b5-841d-3cf7e4685412-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826172009.140022-1-benjamin.gaignard@collabora.com>
References: <20240826172009.140022-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.26-54.240.7.44

Add 'all' option to the following test tools to use
V4L2_FMTDESC_FLAG_ENUM_ALL if supported by the driver:
- vidcap --list-formats(-ext) options
- meta --list-formats-meta option
- vidout -list-formats-out(-ext) options

Update functions prototype to provide an additional parameter.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in v4:
- Add 'all' option in vidcap, meta and vidout.
- Make 'all' and 'mbus_code' exclusive.
- Simplify 'all' vs 'mbus_code' parsing.

 utils/common/cv4l-helpers.h         |  5 ++++-
 utils/v4l2-ctl/v4l2-ctl-meta.cpp    | 34 +++++++++++++++++++++--------
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp |  2 +-
 utils/v4l2-ctl/v4l2-ctl-sdr.cpp     |  4 ++--
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp  | 26 +++++++++++++++-------
 utils/v4l2-ctl/v4l2-ctl-vidout.cpp  | 27 ++++++++++++++++-------
 utils/v4l2-ctl/v4l2-ctl.cpp         | 16 +++++++++-----
 utils/v4l2-ctl/v4l2-ctl.h           |  4 ++--
 8 files changed, 81 insertions(+), 37 deletions(-)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index ec33da78..ab9c64b3 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -488,7 +488,7 @@ public:
 		return cv4l_ioctl(VIDIOC_ENUM_DV_TIMINGS, &timings);
 	}
 
-	int enum_fmt(v4l2_fmtdesc &fmt, bool init = false, int index = 0, unsigned type = 0, __u32 mbus_code = 0)
+	int enum_fmt(v4l2_fmtdesc &fmt, bool init = false, int index = 0, unsigned type = 0, __u32 mbus_code = 0, bool enum_all = false)
 	{
 		if (init) {
 			memset(&fmt, 0, sizeof(fmt));
@@ -498,6 +498,9 @@ public:
 		} else {
 			fmt.index++;
 		}
+		if (enum_all)
+			fmt.index |= V4L2_FMTDESC_FLAG_ENUM_ALL;
+
 		return cv4l_ioctl(VIDIOC_ENUM_FMT, &fmt);
 	}
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index 6ad56845..b24cb176 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -5,14 +5,19 @@
 static struct v4l2_format vfmt;	/* set_format/get_format */
 static unsigned mbus_code;
 static unsigned mbus_code_out;
+static bool enum_all;
+static bool enum_all_out;
 
 void meta_usage()
 {
 	printf("\nMetadata Formats options:\n"
-	       "  --list-formats-meta [<mbus_code>] display supported metadata capture formats.\n"
+	       "  --list-formats-meta [<mbus_code>|all] display supported metadata capture formats.\n"
 	       "		     <mbus_code> is an optional media bus code, if the device has\n"
 	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
-	       "		     media bus code are listed [VIDIOC_ENUM_FMT]\n"
+	       "		     media bus code are listed.\n"
+	       "		     When 'all' is specify it enumerates all pixel formats if\n"
+	       "		     V4L2_FMTDESC_FLAG_ENUM_ALL flag is supported by the driver.\n"
+	       "		     [VIDIOC_ENUM_FMT]\n"
 	       "  --get-fmt-meta     query the metadata capture format [VIDIOC_G_FMT]\n"
 	       "  --set-fmt-meta <f> set the metadata capture format [VIDIOC_S_FMT]\n"
 	       "                     parameter is either the format index as reported by\n"
@@ -23,7 +28,10 @@ void meta_usage()
 	       "  --list-formats-meta-out [<mbus_code>] display supported metadata output formats.\n"
 	       "		     <mbus_code> is an optional media bus code, if the device has\n"
 	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
-	       "		     media bus code are listed [VIDIOC_ENUM_FMT]\n"
+	       "		     media bus code are listed.\n"
+	       "		     When 'all' is specify it enumerates all pixel formats if\n"
+	       "		     V4L2_FMTDESC_FLAG_ENUM_ALL flag is supported by the driver.\n"
+	       "		     [VIDIOC_ENUM_FMT]\n"
 	       "  --get-fmt-meta-out query the metadata output format [VIDIOC_G_FMT]\n"
 	       "  --set-fmt-meta-out <f> set the metadata output format [VIDIOC_S_FMT]\n"
 	       "                     parameter is either the format index as reported by\n"
@@ -52,12 +60,20 @@ void meta_cmd(int ch, char *optarg)
 		}
 		break;
 	case OptListMetaFormats:
-		if (optarg)
-			mbus_code = strtoul(optarg, nullptr, 0);
+		if (optarg) {
+			if (strstr(optarg , "all"))
+				enum_all = true;
+			else
+				mbus_code = strtoul(optarg, nullptr, 0);
+		}
 		break;
 	case OptListMetaOutFormats:
-		if (optarg)
-			mbus_code_out = strtoul(optarg, nullptr, 0);
+		if (optarg) {
+			if (strstr(optarg , "all"))
+				enum_all_out = true;
+			else
+				mbus_code_out = strtoul(optarg, nullptr, 0);
+		}
 		break;
 	}
 }
@@ -121,12 +137,12 @@ void meta_list(cv4l_fd &fd)
 {
 	if (options[OptListMetaFormats]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats(fd, V4L2_BUF_TYPE_META_CAPTURE, mbus_code);
+		print_video_formats(fd, V4L2_BUF_TYPE_META_CAPTURE, mbus_code, enum_all);
 	}
 
 	if (options[OptListMetaOutFormats]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT, mbus_code_out);
+		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT, mbus_code_out, enum_all_out);
 	}
 }
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index 5493222d..797b3f34 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -522,7 +522,7 @@ void overlay_list(cv4l_fd &fd)
 {
 	if (options[OptListOverlayFormats]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats(fd, V4L2_BUF_TYPE_VIDEO_OVERLAY, 0);
+		print_video_formats(fd, V4L2_BUF_TYPE_VIDEO_OVERLAY, 0, false);
 	}
 	if (options[OptFindFb])
 		find_fb(fd.g_fd());
diff --git a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
index 4168eeb1..6f4a012a 100644
--- a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
@@ -122,10 +122,10 @@ void sdr_list(cv4l_fd &fd)
 {
 	if (options[OptListSdrFormats]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats(fd, V4L2_BUF_TYPE_SDR_CAPTURE, 0);
+		print_video_formats(fd, V4L2_BUF_TYPE_SDR_CAPTURE, 0, false);
 	}
 	if (options[OptListSdrOutFormats]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats(fd, V4L2_BUF_TYPE_SDR_OUTPUT, 0);
+		print_video_formats(fd, V4L2_BUF_TYPE_SDR_OUTPUT, 0, false);
 	}
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index d593b3b4..250511a1 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -12,20 +12,26 @@ static __u32 ycbcr, quantization, xfer_func, colorspace;
 static __u32 bytesperline[VIDEO_MAX_PLANES];
 static __u32 sizeimage[VIDEO_MAX_PLANES];
 static unsigned mbus_code;
+static bool enum_all;
 
 void vidcap_usage()
 {
 	printf("\nVideo Capture Formats options:\n"
-	       "  --list-formats [<mbus_code>]\n"
+	       "  --list-formats [<mbus_code>|all]\n"
 	       "		     display supported video formats. <mbus_code> is an optional\n"
 	       "		     media bus code, if the device has capability V4L2_CAP_IO_MC\n"
-	       "		     then only formats that support this media bus code are listed\n"
+	       "		     then only formats that support this media bus code are listed.\n"
+	       "		     When 'all' is specify it enumerates all pixel formats if\n"
+	       "		     V4L2_FMTDESC_FLAG_ENUM_ALL flag is supported by the driver.\n"
 	       "		     [VIDIOC_ENUM_FMT]\n"
-	       "  --list-formats-ext [<mbus_code>]\n"
+	       "  --list-formats-ext [<mbus_code>|all]\n"
 	       "		     display supported video formats including frame sizes and intervals\n"
 	       "		     <mbus_code> is an optional media bus code, if the device has\n"
 	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
-	       "		     media bus code are listed [VIDIOC_ENUM_FMT]\n"
+	       "		     media bus code are listed.\n"
+	       "		     When 'all' is specify it enumerates all pixel formats if\n"
+	       "		     V4L2_FMTDESC_FLAG_ENUM_ALL flag is supported by the driver.\n"
+	       "		     [VIDIOC_ENUM_FMT]\n"
 	       "  --list-framesizes <f>\n"
 	       "                     list supported framesizes for pixelformat <f>\n"
 	       "                     [VIDIOC_ENUM_FRAMESIZES]\n"
@@ -113,8 +119,12 @@ void vidcap_cmd(int ch, char *optarg)
 		break;
 	case OptListFormats:
 	case OptListFormatsExt:
-		if (optarg)
-			mbus_code = strtoul(optarg, nullptr, 0);
+		if (optarg) {
+			if (strstr(optarg , "all"))
+				enum_all = true;
+			else
+				mbus_code = strtoul(optarg, nullptr, 0);
+		}
 		break;
 	case OptListFrameSizes:
 		be_pixfmt = strlen(optarg) == 7 && !memcmp(optarg + 4, "-BE", 3);
@@ -331,12 +341,12 @@ void vidcap_list(cv4l_fd &fd)
 {
 	if (options[OptListFormats]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats(fd, vidcap_buftype, mbus_code);
+		print_video_formats(fd, vidcap_buftype, mbus_code, enum_all);
 	}
 
 	if (options[OptListFormatsExt]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats_ext(fd, vidcap_buftype, mbus_code);
+		print_video_formats_ext(fd, vidcap_buftype, mbus_code, enum_all);
 	}
 
 	if (options[OptListFields]) {
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
index 0d06f747..a9473bc6 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
@@ -5,18 +5,25 @@ static __u32 width, height, pixfmt, field, colorspace, xfer_func, ycbcr, quantiz
 static __u32 bytesperline[VIDEO_MAX_PLANES];
 static __u32 sizeimage[VIDEO_MAX_PLANES];
 static unsigned mbus_code_out;
+static bool enum_all;
 
 void vidout_usage()
 {
 	printf("\nVideo Output Formats options:\n"
-	       "  --list-formats-out [<mbus_code>] display supported video output formats.\n"
+	       "  --list-formats-out [<mbus_code>|all] display supported video output formats.\n"
 	       "		     <mbus_code> is an optional media bus code, if the device has\n"
 	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
-	       "		     media bus code are listed [VIDIOC_ENUM_FMT]\n"
-	       "  --list-formats-out-ext [<mbus_code>] display supported video output formats including\n"
+	       "		     media bus code are listed.\n"
+	       "		     When 'all' is specify it enumerates all pixel formats if\n"
+	       "		     V4L2_FMTDESC_FLAG_ENUM_ALL flag is supported by the driver.\n"
+	       "		     [VIDIOC_ENUM_FMT]\n"
+	       "  --list-formats-out-ext [<mbus_code>|all] display supported video output formats including\n"
 	       "		     frame sizes and intervals. <mbus_code> is an optional media bus code,\n"
 	       "		     if the device has capability V4L2_CAP_IO_MC then only formats that\n"
-	       "		     support this media bus code are listed [VIDIOC_ENUM_FMT]\n"
+	       "		     support this media bus code are listed\n"
+	       "		     When 'all' is specify it enumerates all pixel formats if\n"
+	       "		     V4L2_FMTDESC_FLAG_ENUM_ALL flag is supported by the driver.\n"
+	       "		     [VIDIOC_ENUM_FMT]\n"
 	       "  --list-fields-out  list supported fields for the current output format\n"
 	       "  -X, --get-fmt-video-out\n"
 	       "     		     query the video output format [VIDIOC_G_FMT]\n"
@@ -93,8 +100,12 @@ void vidout_cmd(int ch, char *optarg)
 		break;
 	case OptListOutFormats:
 	case OptListOutFormatsExt:
-		if (optarg)
-			mbus_code_out = strtoul(optarg, nullptr, 0);
+		if (optarg) {
+			if (strstr(optarg , "all"))
+				enum_all = true;
+			else
+				mbus_code_out = strtoul(optarg, nullptr, 0);
+		}
 		break;
 	}
 }
@@ -226,12 +237,12 @@ void vidout_list(cv4l_fd &fd)
 {
 	if (options[OptListOutFormats]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats(fd, vidout_buftype, mbus_code_out);
+		print_video_formats(fd, vidout_buftype, mbus_code_out, enum_all);
 	}
 
 	if (options[OptListOutFormatsExt]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats_ext(fd, vidout_buftype, mbus_code_out);
+		print_video_formats_ext(fd, vidout_buftype, mbus_code_out, enum_all);
 	}
 
 	if (options[OptListOutFields]) {
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index a64fa514..513ac8b7 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -602,7 +602,7 @@ void print_frmival(const struct v4l2_frmivalenum &frmival, const char *prefix)
 	}
 }
 
-void print_video_formats(cv4l_fd &fd, __u32 type, unsigned int mbus_code)
+void print_video_formats(cv4l_fd &fd, __u32 type, unsigned int mbus_code, bool enum_all)
 {
 	cv4l_disable_trace dt(fd);
 	struct v4l2_fmtdesc fmt = {};
@@ -611,7 +611,7 @@ void print_video_formats(cv4l_fd &fd, __u32 type, unsigned int mbus_code)
 		mbus_code = 0;
 
 	printf("\tType: %s\n\n", buftype2s(type).c_str());
-	if (fd.enum_fmt(fmt, true, 0, type, mbus_code))
+	if (fd.enum_fmt(fmt, true, 0, type, mbus_code, enum_all))
 		return;
 	do {
 		printf("\t[%d]: '%s' (%s", fmt.index, fcc2s(fmt.pixelformat).c_str(),
@@ -623,10 +623,10 @@ void print_video_formats(cv4l_fd &fd, __u32 type, unsigned int mbus_code)
 			printf(", %s", fmtdesc2s(fmt.flags, is_hsv).c_str());
 		}
 		printf(")\n");
-	} while (!fd.enum_fmt(fmt));
+	} while (!fd.enum_fmt(fmt, false, 0, type, mbus_code, enum_all));
 }
 
-void print_video_formats_ext(cv4l_fd &fd, __u32 type, unsigned int mbus_code)
+void print_video_formats_ext(cv4l_fd &fd, __u32 type, unsigned int mbus_code, bool enum_all)
 {
 	cv4l_disable_trace dt(fd);
 	struct v4l2_fmtdesc fmt = {};
@@ -637,7 +637,7 @@ void print_video_formats_ext(cv4l_fd &fd, __u32 type, unsigned int mbus_code)
 		mbus_code = 0;
 
 	printf("\tType: %s\n\n", buftype2s(type).c_str());
-	if (fd.enum_fmt(fmt, true, 0, type, mbus_code))
+	if (fd.enum_fmt(fmt, true, 0, type, mbus_code, enum_all))
 		return;
 	do {
 		printf("\t[%d]: '%s' (%s", fmt.index, fcc2s(fmt.pixelformat).c_str(),
@@ -649,6 +649,10 @@ void print_video_formats_ext(cv4l_fd &fd, __u32 type, unsigned int mbus_code)
 			printf(", %s", fmtdesc2s(fmt.flags, is_hsv).c_str());
 		}
 		printf(")\n");
+
+		if (enum_all)
+			continue;
+
 		if (fd.enum_framesizes(frmsize, fmt.pixelformat))
 			continue;
 		do {
@@ -664,7 +668,7 @@ void print_video_formats_ext(cv4l_fd &fd, __u32 type, unsigned int mbus_code)
 				print_frmival(frmival, "\t\t");
 			} while (!fd.enum_frameintervals(frmival));
 		} while (!fd.enum_framesizes(frmsize));
-	} while (!fd.enum_fmt(fmt));
+	} while (!fd.enum_fmt(fmt,false, 0, type, mbus_code, enum_all));
 }
 
 int parse_subopt(char **subs, const char * const *subopts, char **value)
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index a1911e80..d8c25da5 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -315,8 +315,8 @@ bool valid_pixel_format(int fd, __u32 pixelformat, bool output, bool mplane);
 void print_frmsize(const struct v4l2_frmsizeenum &frmsize, const char *prefix);
 void print_frmival(const struct v4l2_frmivalenum &frmival, const char *prefix);
 void printfmt(int fd, const struct v4l2_format &vfmt);
-void print_video_formats(cv4l_fd &fd, __u32 type, unsigned int mbus_code);
-void print_video_formats_ext(cv4l_fd &fd, __u32 type, unsigned int mbus_code);
+void print_video_formats(cv4l_fd &fd, __u32 type, unsigned int mbus_code, bool enum_all);
+void print_video_formats_ext(cv4l_fd &fd, __u32 type, unsigned int mbus_code, bool enum_all);
 
 static inline bool subscribe_event(cv4l_fd &fd, __u32 type)
 {
-- 
2.43.0


