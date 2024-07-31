Return-Path: <linux-media+bounces-15641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD4942F50
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 14:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37BD51F2BA58
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 12:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B731BD01A;
	Wed, 31 Jul 2024 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gNV1SKKI"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BCD1B142A
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430278; cv=none; b=eWOVQeeUDdZEpwRC9RIWJBhhnHVkTcWVSkjonrdQjXJmZFQCONGVzIz8s5voEpw3SkMRON6h72kaowO+m4cTQag2R/lOaeT/wjkZQZooemg8uDq5nAKoC9yml6MnR+gkm6PaVbDccsBAJfr6n9GER8Rvm2thytcfM6rktiRCr2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430278; c=relaxed/simple;
	bh=H0zp3Y+fJEpRqXidedv9nlYe8zSdjXySD41D9URP4mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpoEexBrr9+pUkWrgrjuk0rFMpgLMfyQoZmlpSZ3hvGzht9Wb2sZKFce/H/5mRYJPPgqFAquogVkrbgN2EmMzP08To9DkNfpqAzODMmHYI9mS+GzVNrGtkTIC67k4GKAkrJJZ4ukEQbMG7jpiKA0SghVrrkjgSPQpsFYJOgiypg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gNV1SKKI; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722430274;
	bh=H0zp3Y+fJEpRqXidedv9nlYe8zSdjXySD41D9URP4mc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gNV1SKKIsoMJafCZhhFxIbuXDKPC8bN1K9gGB9zOTD9+YR5PBMVpUQ71w86CmUZrm
	 9N1azspGVzH5PHikPI0X13b68BtHGqbyXtuZOahw0XL0X2jhwmH3J77cmucZmRmDOf
	 zWc5W1iy9vSu2qPaXvU9s6+ZXfA1mzz+i0Rww0b77Lqv9f8d1vkR6Rj/RaJiDVKwTs
	 9Yey/ir038g2T3n+10MkjD+CsciURRmT12fFE9uObRYivEP6kjCDf4DiLWXjxPlb1r
	 LXhVlzfmIb8Gn0b1mW26lQ3oYgjLsJzCTrXz/ZZcNFVE7m/GKZKh3CjXUuXUsRnZi2
	 Jn95BSvqxf4wg==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6F92F37821DB;
	Wed, 31 Jul 2024 12:51:14 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 2/2] v4l2-ctl-vidcap: Add option to enumerate all pixel formats
Date: Wed, 31 Jul 2024 14:51:08 +0200
Message-ID: <20240731125108.38407-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731125108.38407-1-benjamin.gaignard@collabora.com>
References: <20240731125108.38407-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 'all' option to vidcap --list-formats(-ext) option to use
V4L2_FMTDESC_FLAG_ENUM_ALL if supported by the driver.
Update functions prototype to provide an additional parameter.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 3:
- Add 'all' suboption to --list-formats(-ext) options

 utils/common/cv4l-helpers.h         |  5 ++++-
 utils/v4l2-ctl/v4l2-ctl-meta.cpp    |  4 ++--
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp |  2 +-
 utils/v4l2-ctl/v4l2-ctl-sdr.cpp     |  4 ++--
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp  | 25 +++++++++++++++++++------
 utils/v4l2-ctl/v4l2-ctl-vidout.cpp  |  4 ++--
 utils/v4l2-ctl/v4l2-ctl.cpp         | 16 ++++++++++------
 utils/v4l2-ctl/v4l2-ctl.h           |  4 ++--
 8 files changed, 42 insertions(+), 22 deletions(-)

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
index 6ad56845..a7faf600 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -121,12 +121,12 @@ void meta_list(cv4l_fd &fd)
 {
 	if (options[OptListMetaFormats]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats(fd, V4L2_BUF_TYPE_META_CAPTURE, mbus_code);
+		print_video_formats(fd, V4L2_BUF_TYPE_META_CAPTURE, mbus_code, false);
 	}
 
 	if (options[OptListMetaOutFormats]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT, mbus_code_out);
+		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT, mbus_code_out, false);
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
index d593b3b4..63d2b1c7 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -12,20 +12,25 @@ static __u32 ycbcr, quantization, xfer_func, colorspace;
 static __u32 bytesperline[VIDEO_MAX_PLANES];
 static __u32 sizeimage[VIDEO_MAX_PLANES];
 static unsigned mbus_code;
+static bool enum_all;
 
 void vidcap_usage()
 {
 	printf("\nVideo Capture Formats options:\n"
-	       "  --list-formats [<mbus_code>]\n"
+	       "  --list-formats [<mbus_code>],[all]\n"
 	       "		     display supported video formats. <mbus_code> is an optional\n"
 	       "		     media bus code, if the device has capability V4L2_CAP_IO_MC\n"
 	       "		     then only formats that support this media bus code are listed\n"
 	       "		     [VIDIOC_ENUM_FMT]\n"
-	       "  --list-formats-ext [<mbus_code>]\n"
+	       "		     when 'all' is specify it enumerates all pixel formats if\n"
+	       "		     V4L2_FMTDESC_FLAG_ENUM_ALL flag is supported by the driver\n"
+	       "  --list-formats-ext [<mbus_code>],[all]\n"
 	       "		     display supported video formats including frame sizes and intervals\n"
 	       "		     <mbus_code> is an optional media bus code, if the device has\n"
 	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
 	       "		     media bus code are listed [VIDIOC_ENUM_FMT]\n"
+	       "		     when 'all' is specify it enumerates all pixel formats if\n"
+	       "		     V4L2_FMTDESC_FLAG_ENUM_ALL flag is supported by the driver\n"
 	       "  --list-framesizes <f>\n"
 	       "                     list supported framesizes for pixelformat <f>\n"
 	       "                     [VIDIOC_ENUM_FRAMESIZES]\n"
@@ -113,8 +118,16 @@ void vidcap_cmd(int ch, char *optarg)
 		break;
 	case OptListFormats:
 	case OptListFormatsExt:
-		if (optarg)
-			mbus_code = strtoul(optarg, nullptr, 0);
+		if (optarg) {
+			char *all;
+			unsigned code = strtoul(optarg, nullptr, 0);
+			if (!errno)
+				mbus_code = code;
+
+			all = strstr(optarg , "all");
+			if (all)
+				enum_all = true;
+		}
 		break;
 	case OptListFrameSizes:
 		be_pixfmt = strlen(optarg) == 7 && !memcmp(optarg + 4, "-BE", 3);
@@ -331,12 +344,12 @@ void vidcap_list(cv4l_fd &fd)
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
index 0d06f747..59acddcc 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
@@ -226,12 +226,12 @@ void vidout_list(cv4l_fd &fd)
 {
 	if (options[OptListOutFormats]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats(fd, vidout_buftype, mbus_code_out);
+		print_video_formats(fd, vidout_buftype, mbus_code_out, false);
 	}
 
 	if (options[OptListOutFormatsExt]) {
 		printf("ioctl: VIDIOC_ENUM_FMT\n");
-		print_video_formats_ext(fd, vidout_buftype, mbus_code_out);
+		print_video_formats_ext(fd, vidout_buftype, mbus_code_out, false);
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


