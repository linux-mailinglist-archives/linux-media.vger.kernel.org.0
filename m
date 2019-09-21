Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF1DB9F15
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2019 19:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404416AbfIURGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Sep 2019 13:06:10 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:32902 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbfIURGK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Sep 2019 13:06:10 -0400
Received: by mail-pg1-f193.google.com with SMTP id n190so5604588pgn.0
        for <linux-media@vger.kernel.org>; Sat, 21 Sep 2019 10:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=q3EASD/L/Tbqo5I7bBXhfvJbTdGddqKCIHjoRiVpKvc=;
        b=aTfLU0b3uhpBtZvWJ5wl40qfGIT8/aJUL2UYv4eV8LIvpSxvI3eLOV8n/D2rV4Uv+Y
         4z1W7z6YRNQufIXDI2Coh1FiLB1qUwTCtuG+O6NJmqn3snPe0LF0G1Cey1Se2N5VA7me
         /GilR7k5t6qBHBriShBNS3WY6r7MPHq/3v3g28ElMTeW7pS7CbFaM4KHgiI8xVOT20G7
         2xBEDquf98ih5VT5+/CqyQBAfF6cWMPcLLtEiZBRmGtdVfYQdosZH/fCLxXu8a+SUlDU
         nlqH764lrq51FGlCzSGVsOUX4Do5L0TBPmK3O5lFD4Y/RTU/UXuCl6p3Nht/Gw/vrkC4
         6qFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=q3EASD/L/Tbqo5I7bBXhfvJbTdGddqKCIHjoRiVpKvc=;
        b=H2J2bjfhq/klj0ODj9zJ0lYxU98nh8GwRrNToGq3NsxFo/QEaPSTokgSmBtYJrPKr1
         pw78DG0HAnnOcYcwc8U+YTPqXn6ENA4XJE95z2bQoXK9d6Pj6XeoDM2uFzIYLUmGMadE
         WOBnu3cjQ+gjhhkLcyz9k0mJScKDlDnWmryFoMpmGbJLTmgCJkMoyL7gHTEZ2NAHhqV9
         NbiZJ0OhoLDZmVOYBV5zZcl1A4ZUCE5YeddyMgpV5Ccb4O3oy/S8SlistMl471XJ/TO8
         S9Y5JLS79BQmi7EvhHs9O2vlKOrqPSYKAkQbt9A4vh8hHGtrEjh2uQ5QPop7YdBBxv3d
         zNjw==
X-Gm-Message-State: APjAAAWSG4pVozD1YU4UcYpzJyMThQsYc0OEpw7kX8VWpi5YyxINF0EM
        oGLmwNMAs9m6FMtGeCo7jyiJbCAL
X-Google-Smtp-Source: APXvYqwmM68kZ3jVaMl8NFNyDyOYVl20Ue4KTMGkvmkH3O9fY24awkHpj73EPGNRyMIt3CvLu5ui7w==
X-Received: by 2002:a17:90a:1903:: with SMTP id 3mr11019535pjg.80.1569085569306;
        Sat, 21 Sep 2019 10:06:09 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:50c1:f4e7:d521:49c0])
        by smtp.gmail.com with ESMTPSA id 22sm6811576pfj.139.2019.09.21.10.06.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 21 Sep 2019 10:06:08 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] v4l2-ctl: add sizeimage suboption for set-fmt-video options
Date:   Sun, 22 Sep 2019 02:05:32 +0900
Message-Id: <1569085532-17991-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When I tried to run v4l2-ctl streaming tests with the Hantro VPU JPEG
encoder on ROCKPro64, the following command generates empty output file.

v4l2-ctl -d /dev/video1 --stream-from=/dev/urandom --stream-to=out.jpg \
  --set-fmt-video-out=width=640,height=480 \
  --set-fmt-video=width=640,height=480 \
  --stream-mmap=1 --stream-out-mmap=1 --stream-count=1

This is because the sizeimage field for encoded format is too small.

When opening the video device for the Hantro VPU JPEG encoder, the
sizeimage field for encoded format is reset to the maximum size in bytes
required for the minimam frame size (96x32) by hantro_reset_encoded_fmt()
in linux/drivers/staging/media/hantro/hantro_v4l2.c.

Currently v4l2-ctl doesn't touch the sizeimage fields, so when the frame
size is not small, the JPEG encoder cannot get enough buffer size.

This adds sizeimage suboption for set-fmt-video options and the following
command generates correct jpeg image.

v4l2-ctl -d /dev/video1 --stream-from=/dev/urandom --stream-to=out.jpg \
  --set-fmt-video-out=width=640,height=480 \
  --set-fmt-video=width=640,height=480,sizeimage=0 \
  --stream-mmap=1 --stream-out-mmap=1 --stream-count=1

The following comment for vidioc_try_fmt() in
linux/drivers/staging/media/hantro/hantro_v4l2.c explains why a zero
sizeimage is passed.

		/*
		 * For coded formats the application can specify
		 * sizeimage. If the application passes a zero sizeimage,
		 * let's default to the maximum frame size.
		 */

Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp | 16 +++++++++++++---
 utils/v4l2-ctl/v4l2-ctl-vidout.cpp | 16 +++++++++++++---
 utils/v4l2-ctl/v4l2-ctl.cpp        | 10 +++++++++-
 utils/v4l2-ctl/v4l2-ctl.h          |  4 +++-
 4 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 15ffbea..3a29251 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -21,6 +21,7 @@ static struct v4l2_frmivalenum frmival; /* list frame intervals */
 static unsigned set_fmts;
 static __u32 width, height, pixfmt, field, flags;
 static __u32 bytesperline[VIDEO_MAX_PLANES];
+static __u32 sizeimage[VIDEO_MAX_PLANES];
 
 void vidcap_usage(void)
 {
@@ -42,11 +43,12 @@ void vidcap_usage(void)
 	       "  -v, --set-fmt-video\n"
 	       "  --try-fmt-video width=<w>,height=<h>,pixelformat=<pf>,field=<f>,colorspace=<c>,\n"
 	       "                  xfer=<xf>,ycbcr=<y>,hsv=<hsv>,quantization=<q>,\n"
-	       "                  premul-alpha,bytesperline=<bpl>\n"
+	       "                  premul-alpha,bytesperline=<bpl>,sizeimage=<sz>\n"
 	       "                     set/try the video capture format [VIDIOC_S/TRY_FMT]\n"
 	       "                     pixelformat is either the format index as reported by\n"
 	       "                       --list-formats, or the fourcc value as a string.\n"
-	       "                     The bytesperline option can be used multiple times, once for each plane.\n"
+	       "                     The bytesperline and sizeimage options can be used multiple times,\n"
+	       "                       once for each plane.\n"
 	       "                     premul-alpha sets V4L2_PIX_FMT_FLAG_PREMUL_ALPHA.\n"
 	       "                     <f> can be one of the following field layouts:\n"
 	       "                       any, none, top, bottom, interlaced, seq_tb, seq_bt,\n"
@@ -106,7 +108,8 @@ void vidcap_cmd(int ch, char *optarg)
 	case OptSetVideoFormat:
 	case OptTryVideoFormat:
 		set_fmts = parse_fmt(optarg, width, height, pixfmt, field, colorspace,
-				xfer_func, ycbcr, quantization, flags, bytesperline);
+				xfer_func, ycbcr, quantization, flags, bytesperline,
+				sizeimage);
 		if (!set_fmts ||
 		    (set_fmts & (FmtColorspace | FmtYCbCr | FmtQuantization | FmtXferFunc))) {
 			vidcap_usage();
@@ -211,6 +214,11 @@ int vidcap_get_and_update_fmt(cv4l_fd &_fd, struct v4l2_format &vfmt)
 			for (unsigned i = 0; i < vfmt.fmt.pix_mp.num_planes; i++)
 				vfmt.fmt.pix_mp.plane_fmt[i].bytesperline = 0;
 		}
+		if (set_fmts & FmtSizeImage) {
+			for (unsigned i = 0; i < VIDEO_MAX_PLANES; i++)
+				vfmt.fmt.pix_mp.plane_fmt[i].sizeimage =
+					sizeimage[i];
+		}
 	} else {
 		if (set_fmts & FmtWidth)
 			vfmt.fmt.pix.width = width;
@@ -238,6 +246,8 @@ int vidcap_get_and_update_fmt(cv4l_fd &_fd, struct v4l2_format &vfmt)
 			 */
 			vfmt.fmt.pix.bytesperline = 0;
 		}
+		if (set_fmts & FmtSizeImage)
+			vfmt.fmt.pix.sizeimage = sizeimage[0];
 	}
 
 	if ((set_fmts & FmtPixelFormat) &&
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
index c90bee5..227d624 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
@@ -19,6 +19,7 @@
 static unsigned set_fmts_out;
 static __u32 width, height, pixfmt, field, colorspace, xfer_func, ycbcr, quantization, flags;
 static __u32 bytesperline[VIDEO_MAX_PLANES];
+static __u32 sizeimage[VIDEO_MAX_PLANES];
 
 void vidout_usage(void)
 {
@@ -33,12 +34,13 @@ void vidout_usage(void)
 	       "  -x, --set-fmt-video-out\n"
 	       "  --try-fmt-video-out width=<w>,height=<h>,pixelformat=<pf>,field=<f>,colorspace=<c>,\n"
 	       "                      xfer=<xf>,ycbcr=<y>,hsv=<hsv>,quantization=<q>,\n"
-	       "                      premul-alpha,bytesperline=<bpl>\n"
+	       "                      premul-alpha,bytesperline=<bpl>,sizeimage=<sz>\n"
 	       "                     set/try the video output format [VIDIOC_S/TRY_FMT]\n"
 	       "                     pixelformat is either the format index as reported by\n"
 	       "                       --list-formats-out, or the fourcc value as a string.\n"
 	       "                     premul-alpha sets V4L2_PIX_FMT_FLAG_PREMUL_ALPHA.\n"
-	       "                     The bytesperline option can be used multiple times, once for each plane.\n"
+	       "                     The bytesperline and sizeimage options can be used multiple times,\n"
+	       "                       once for each plane.\n"
 	       "                     <f> can be one of the following field layouts:\n"
 	       "                       any, none, top, bottom, interlaced, seq_tb, seq_bt,\n"
 	       "                       alternate, interlaced_tb, interlaced_bt\n"
@@ -93,7 +95,8 @@ void vidout_cmd(int ch, char *optarg)
 	case OptSetVideoOutFormat:
 	case OptTryVideoOutFormat:
 		set_fmts_out = parse_fmt(optarg, width, height, pixfmt, field,
-				colorspace, xfer_func, ycbcr, quantization, flags, bytesperline);
+				colorspace, xfer_func, ycbcr, quantization, flags, bytesperline,
+				sizeimage);
 		if (!set_fmts_out) {
 			vidcap_usage();
 			exit(1);
@@ -150,6 +153,11 @@ void vidout_set(cv4l_fd &_fd)
 					for (unsigned i = 0; i < vfmt.fmt.pix_mp.num_planes; i++)
 						vfmt.fmt.pix_mp.plane_fmt[i].bytesperline = 0;
 				}
+				if (set_fmts_out & FmtSizeImage) {
+					for (unsigned i = 0; i < VIDEO_MAX_PLANES; i++)
+						vfmt.fmt.pix_mp.plane_fmt[i].sizeimage =
+							sizeimage[i];
+				}
 			} else {
 				if (set_fmts_out & FmtWidth)
 					vfmt.fmt.pix.width = width;
@@ -183,6 +191,8 @@ void vidout_set(cv4l_fd &_fd)
 					 * to the closest value for the new width. */
 					vfmt.fmt.pix.bytesperline = 0;
 				}
+				if (set_fmts_out & FmtSizeImage)
+					vfmt.fmt.pix.sizeimage = sizeimage[0];
 			}
 
 			if ((set_fmts_out & FmtPixelFormat) &&
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 3a2d082..77e0d36 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -744,11 +744,13 @@ __u32 parse_quantization(const char *s)
 
 int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 	      __u32 &field, __u32 &colorspace, __u32 &xfer_func, __u32 &ycbcr,
-	      __u32 &quantization, __u32 &flags, __u32 *bytesperline)
+	      __u32 &quantization, __u32 &flags, __u32 *bytesperline,
+	      __u32 *sizeimage)
 {
 	char *value, *subs;
 	int fmts = 0;
 	unsigned bpl_index = 0;
+	unsigned sizeimage_index = 0;
 	bool be_pixfmt;
 
 	field = V4L2_FIELD_ANY;
@@ -767,6 +769,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 			"premul-alpha",
 			"quantization",
 			"xfer",
+			"sizeimage",
 			NULL
 		};
 
@@ -835,6 +838,11 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 			xfer_func = parse_xfer_func(value);
 			fmts |= FmtXferFunc;
 			break;
+		case 11:
+			sizeimage[sizeimage_index] = strtoul(value, 0L, 0);
+			sizeimage_index++;
+			fmts |= FmtSizeImage;
+			break;
 		default:
 			return 0;
 		}
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index 5797d78..46c87b5 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -296,6 +296,7 @@ typedef struct {
 #define FmtFlags		(1L<<11)
 #define FmtBytesPerLine		(1L<<12)
 #define FmtXferFunc		(1L<<13)
+#define FmtSizeImage		(1L<<14)
 
 // v4l2-ctl.cpp
 int doioctl_name(int fd, unsigned long int request, void *parm, const char *name);
@@ -309,7 +310,8 @@ __u32 parse_hsv(const char *s);
 __u32 parse_quantization(const char *s);
 int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 	      __u32 &field, __u32 &colorspace, __u32 &xfer, __u32 &ycbcr,
-	      __u32 &quantization, __u32 &flags, __u32 *bytesperline);
+	      __u32 &quantization, __u32 &flags, __u32 *bytesperline,
+	      __u32 *sizeimage);
 int parse_selection_target(const char *s, unsigned int &target);
 int parse_selection_flags(const char *s);
 void print_selection(const struct v4l2_selection &sel);
-- 
2.7.4

