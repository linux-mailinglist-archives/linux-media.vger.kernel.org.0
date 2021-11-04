Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542DD4452A7
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 13:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhKDMIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 08:08:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:37180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231388AbhKDMIj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 08:08:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6EDA6124B;
        Thu,  4 Nov 2021 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636027560;
        bh=IThQxwfyehbyQQVThBSABMWOyISpIRIGY2xGviVkzn0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pC/fzFjRU/qvzCBiIwT8mhaWIDEANwwYHo6yvHS3/LccCdMGHKTV1Oq6K0pXjcpix
         EZiKSRNNXrHTnsYiynYYeDaPkxNAPZe2yzNsMEivbvcjZxrs2+Se1noK3cg6UGsEQn
         Cw6tBEPbZ31LMcSWekob9X1Z9ZjLC92TuNFuUQd2o1qpDX2gKyoDXOiiokAdr0zHMi
         9UUjU43y28R/dHUTLhBl9j0zrOVCYleRGUC0rK5jKaHvBFdPcSktAOD7UJSjIcxNBx
         ZmIyZf8TUoHaS5RaLQJEX58Vo3xpQSJxL0UfuDPXb09g/El0B/n7GiqdczEyie8Nne
         zRoGemWqxysHg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mibVG-005nHt-7j; Thu, 04 Nov 2021 12:05:58 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 6/7] media: atomisp: fix try_fmt logic
Date:   Thu,  4 Nov 2021 12:05:55 +0000
Message-Id: <44f582252dd16b512075167530b3d592689c7376.1636026959.git.mchehab+huawei@kernel.org>
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

The internal try_fmt logic is not meant to provide everything
that the V4L2 API should provide. Also, it doesn't decrement
the pads that are used only internally by the driver, but aren't
part of the device's output.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/7] at: https://lore.kernel.org/all/cover.1636026959.git.mchehab+huawei@kernel.org/

 .../staging/media/atomisp/pci/atomisp_cmd.c   |  7 --
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 72 ++++++++++++++++++-
 2 files changed, 71 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 851046ecbdbf..0ddee36cdcd7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4918,13 +4918,6 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	}
 
 	f->pixelformat = fmt->pixelformat;
-	/*
-	 * FIXME: do we need to setup this differently, depending on the
-	 * sensor or the pipeline?
-	 */
-	f->colorspace = V4L2_COLORSPACE_REC709;
-	f->ycbcr_enc = V4L2_YCBCR_ENC_709;
-	f->xfer_func = V4L2_XFER_FUNC_709;
 
 	/*
 	 * If the format is jpeg or custom RAW, then the width and height will
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 84ff97dabbed..1e6da6116a06 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -847,6 +847,72 @@ static int atomisp_g_fmt_file(struct file *file, void *fh,
 	return 0;
 }
 
+static int atomisp_adjust_fmt(struct v4l2_format *f)
+{
+	const struct atomisp_format_bridge *format_bridge;
+	u32 padded_width;
+
+	format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
+
+	padded_width = f->fmt.pix.width + pad_w;
+
+	if (format_bridge->planar) {
+		f->fmt.pix.bytesperline = padded_width;
+		f->fmt.pix.sizeimage = PAGE_ALIGN(f->fmt.pix.height *
+						  DIV_ROUND_UP(format_bridge->depth *
+						  padded_width, 8));
+	} else {
+		f->fmt.pix.bytesperline = DIV_ROUND_UP(format_bridge->depth *
+						      padded_width, 8);
+		f->fmt.pix.sizeimage = PAGE_ALIGN(f->fmt.pix.height * f->fmt.pix.bytesperline);
+	}
+
+	if (f->fmt.pix.field == V4L2_FIELD_ANY)
+		f->fmt.pix.field = V4L2_FIELD_NONE;
+
+	format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
+	if (!format_bridge)
+		return -EINVAL;
+
+	/* Currently, raw formats are broken!!! */
+	if (format_bridge->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+		f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420;
+
+		format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
+		if (!format_bridge)
+			return -EINVAL;
+	}
+
+	padded_width = f->fmt.pix.width + pad_w;
+
+	if (format_bridge->planar) {
+		f->fmt.pix.bytesperline = padded_width;
+		f->fmt.pix.sizeimage = PAGE_ALIGN(f->fmt.pix.height *
+						  DIV_ROUND_UP(format_bridge->depth *
+						  padded_width, 8));
+	} else {
+		f->fmt.pix.bytesperline = DIV_ROUND_UP(format_bridge->depth *
+						      padded_width, 8);
+		f->fmt.pix.sizeimage = PAGE_ALIGN(f->fmt.pix.height * f->fmt.pix.bytesperline);
+	}
+
+	if (f->fmt.pix.field == V4L2_FIELD_ANY)
+		f->fmt.pix.field = V4L2_FIELD_NONE;
+
+	/*
+	 * FIXME: do we need to setup this differently, depending on the
+	 * sensor or the pipeline?
+	 */
+	f->fmt.pix.colorspace = V4L2_COLORSPACE_REC709;
+	f->fmt.pix.ycbcr_enc = V4L2_YCBCR_ENC_709;
+	f->fmt.pix.xfer_func = V4L2_XFER_FUNC_709;
+
+	f->fmt.pix.width -= pad_w;
+	f->fmt.pix.height -= pad_h;
+
+	return 0;
+}
+
 /* This function looks up the closest available resolution. */
 static int atomisp_try_fmt_cap(struct file *file, void *fh,
 			       struct v4l2_format *f)
@@ -858,7 +924,11 @@ static int atomisp_try_fmt_cap(struct file *file, void *fh,
 	rt_mutex_lock(&isp->mutex);
 	ret = atomisp_try_fmt(vdev, &f->fmt.pix, NULL);
 	rt_mutex_unlock(&isp->mutex);
-	return ret;
+
+	if (ret)
+		return ret;
+
+	return atomisp_adjust_fmt(f);
 }
 
 static int atomisp_g_fmt_cap(struct file *file, void *fh,
-- 
2.31.1

