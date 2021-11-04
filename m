Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FEF34452A5
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 13:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhKDMIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 08:08:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230494AbhKDMIi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 08:08:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACE6961221;
        Thu,  4 Nov 2021 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636027560;
        bh=5u0QHTW5ZORdKNYaVJpfIUkKNT/+DLCcKsFopsYUnZE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KUuPJ5gpjMqeAHxtZ+ZZJV3Ul9Bv44EDCsU5auyaDi7Sl/8LVrmAwsp9Sge3ciivL
         0S9As9UUpvGBr476Tz4Nph/QxT9MbxKfGiwTI4VpZoWP/JBtRVbcT3n2gAJeqzL2We
         lCawXHocqYJS9sigfUNyKlcOprdLSAWHBItJek4t+ycfXU9L6gkKbMH5tXVSmPld0P
         IPHNHohkm7XRRqH4+S2W8Ft21zSxdkB+bPVUAoudPWRY23ynxDuQA0NY5wABeSqCoY
         VdEf31FW4/J8ZvDpZ3l0NPtt9n8F4vlVd7a8AGEEf3FujWeSFU7zOr0IM4GecGOOtg
         LytPu9sEmepUA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mibVG-005nHk-6H; Thu, 04 Nov 2021 12:05:58 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 3/7] media: atomisp: fix VIDIOC_S_FMT logic
Date:   Thu,  4 Nov 2021 12:05:52 +0000
Message-Id: <9cc173c9bbc867b9da41de5eefe8cdaf19c5c7f8.1636026959.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636026959.git.mchehab+huawei@kernel.org>
References: <cover.1636026959.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several issues on S_FMT implementation:

- it doesn't properly handle pad_h/pad_w;
- it reports a wrong visible size to userspace;
- it allows setting the format to a raw mode, which
  currently causes the pipeline to break.

Address such issues, for it to start working with generic
apps.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/7] at: https://lore.kernel.org/all/cover.1636026959.git.mchehab+huawei@kernel.org/

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 46 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 76c9e89afb48..851046ecbdbf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5635,13 +5635,17 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	const struct atomisp_format_bridge *format_bridge;
 	const struct atomisp_format_bridge *snr_format_bridge;
 	struct ia_css_frame_info output_info, raw_output_info;
-	struct v4l2_pix_format snr_fmt = f->fmt.pix;
-	struct v4l2_pix_format backup_fmt = snr_fmt, s_fmt;
+	struct v4l2_pix_format snr_fmt;
+	struct v4l2_pix_format backup_fmt, s_fmt;
 	unsigned int dvs_env_w = 0, dvs_env_h = 0;
 	unsigned int padding_w = pad_w, padding_h = pad_h;
 	bool res_overflow = false, crop_needs_override = false;
 	struct v4l2_mbus_framefmt *isp_sink_fmt;
 	struct v4l2_mbus_framefmt isp_source_fmt = {0};
+	struct v4l2_subdev_format vformat = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_mbus_framefmt *ffmt = &vformat.format;
 	struct v4l2_rect isp_sink_crop;
 	u16 source_pad = atomisp_subdev_source_pad(vdev);
 	struct v4l2_subdev_fh fh;
@@ -5672,9 +5676,38 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	if (!format_bridge)
 		return -EINVAL;
 
+	/* Currently, raw formats are broken!!! */
+
+	if (format_bridge->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+		f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420;
+
+		format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
+		if (!format_bridge)
+			return -EINVAL;
+	}
 	pipe->sh_fmt = format_bridge->sh_fmt;
 	pipe->pix.pixelformat = f->fmt.pix.pixelformat;
 
+	/* Ensure that the resolution is equal or below the maximum supported */
+
+	vformat.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	v4l2_fill_mbus_format(ffmt, &f->fmt.pix, format_bridge->mbus_code);
+	ffmt->height += padding_h;
+	ffmt->width += padding_w;
+
+	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera, pad,
+			       set_fmt, NULL, &vformat);
+	if (ret)
+		return ret;
+
+	f->fmt.pix.width = ffmt->width - padding_w;
+	f->fmt.pix.height = ffmt->height - padding_h;
+
+	snr_fmt = f->fmt.pix;
+	backup_fmt = snr_fmt;
+
+	/**********************************************************************/
+
 	if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VF ||
 	    (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW
 	     && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO)) {
@@ -6080,6 +6113,15 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	else
 		isp->need_gfx_throttle = true;
 
+	/* Report the needed sizes */
+	f->fmt.pix.sizeimage = pipe->pix.sizeimage;
+	f->fmt.pix.bytesperline = pipe->pix.bytesperline;
+
+	dev_dbg(isp->dev, "%s: %dx%d, image size: %d, %d bytes per line\n",
+		__func__,
+		f->fmt.pix.width, f->fmt.pix.height,
+		f->fmt.pix.sizeimage, f->fmt.pix.bytesperline);
+
 	return 0;
 }
 
-- 
2.31.1

