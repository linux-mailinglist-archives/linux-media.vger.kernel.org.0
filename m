Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4ADD44529F
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 13:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhKDMIj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 08:08:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:37106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229705AbhKDMIi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 08:08:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97B2E61215;
        Thu,  4 Nov 2021 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636027560;
        bh=4fP/gN6InLeaX50Pz2txtoNwkefTUW5OCc0inBoWJQ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DYdHjzN4yiSKYsSb0nqlDyAZbrnNsi5zUYwkg2Fgfrj8/q/gSJbIMgVZjgiyS/IOx
         y4zzCxzVsx4dL4Id0cWHD/3wl4PSJwFhHURBHyqtG6Oe6x+sHr6prSp+nPQRoKEsVk
         UkL9Ym0rKQCtT0D/xDmNy0AoXxaUh0zbaGnD+b5QqPcVR6/PhBMg41B6nI2d6PgjT/
         YZrQ79cM65se97UMqQgdyrV8mn16Nv08GKaagEzwTYWlJySTCInXLvHcpc5BGPZ1G/
         Kep2dPG3DTwSATqFDGYMna1E+lmM3HMfmiKN5ILlbL8LXS/YkIMG5A1yZSMwn2yF+F
         +yooQ131J/BXA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mibVG-005nHw-8D; Thu, 04 Nov 2021 12:05:58 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 7/7] media: atomisp: fix g_fmt logic
Date:   Thu,  4 Nov 2021 12:05:56 +0000
Message-Id: <19b4fdf9121e3ad54c085db65c097cfce6ae509e.1636026959.git.mchehab+huawei@kernel.org>
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

The g_fmt logic is currently broken, as it is not returning
the same imagesize as previoulsy calculated by s_fmt.

Fix it by just re-using whatever it was defined at s_fmt,
if this was called before.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/7] at: https://lore.kernel.org/all/cover.1636026959.git.mchehab+huawei@kernel.org/

 .../staging/media/atomisp/pci/atomisp_ioctl.c | 64 ++-----------------
 1 file changed, 7 insertions(+), 57 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 1e6da6116a06..2fb64d5cbead 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -934,75 +934,25 @@ static int atomisp_try_fmt_cap(struct file *file, void *fh,
 static int atomisp_g_fmt_cap(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE
-	};
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct v4l2_fmtdesc fmtdesc = { 0 };
 	struct atomisp_video_pipe *pipe;
-	struct atomisp_sub_device *asd;
-	struct v4l2_subdev *camera;
-	u32 depth;
-	int ret;
 
 	rt_mutex_lock(&isp->mutex);
 	pipe = atomisp_to_video_pipe(vdev);
 	rt_mutex_unlock(&isp->mutex);
 
 	f->fmt.pix = pipe->pix;
-	if (!f->fmt.pix.width) {
-		asd = atomisp_to_video_pipe(vdev)->asd;
-		if (!asd)
-		    return -EINVAL;
 
-		camera = isp->inputs[asd->input_curr].camera;
-		if(!camera)
-			return -EINVAL;
+	/* If s_fmt was issued, just return whatever is was previouly set */
+	if (f->fmt.pix.sizeimage)
+		return 0;
 
-		ret = atomisp_enum_fmt_cap(file, fh, &fmtdesc);
-		if (ret)
-			return ret;
+	f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUYV;
+	f->fmt.pix.width = 10000;
+	f->fmt.pix.height = 10000;
 
-		rt_mutex_lock(&isp->mutex);
-		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-				       pad, get_fmt, NULL, &fmt);
-		rt_mutex_unlock(&isp->mutex);
-		if (ret)
-			return ret;
-
-		v4l2_fill_pix_format(&f->fmt.pix, &fmt.format);
-
-		f->fmt.pix.pixelformat = fmtdesc.pixelformat;
-
-		/*
-		 * HACK: The atomisp does something different here, as it
-		 * seems to set the sensor to a slightly higher resolution than
-		 * the visible ones. That seems to be needed by atomisp's ISP
-		 * in order to properly handle the frames. So, s_fmt adds 16
-		 * extra columns/lines. See atomisp_subdev_set_selection().
-		 *
-		 * Yet, the V4L2 userspace API doesn't expect those, so it
-		 * needs to be decremented when reporting the visible
-		 * resolution to userspace.
-		 */
-		f->fmt.pix.width -= pad_w;
-		f->fmt.pix.height -= pad_h;
-	}
-
-	depth = atomisp_get_pixel_depth(f->fmt.pix.pixelformat);
-	f->fmt.pix.bytesperline = DIV_ROUND_UP(f->fmt.pix.width * depth, 8);
-	f->fmt.pix.sizeimage = PAGE_ALIGN(f->fmt.pix.height * f->fmt.pix.bytesperline);
-
-	/*
-	 * FIXME: do we need to setup this differently, depending on the
-	 * sensor or the pipeline?
-	 */
-	f->fmt.pix.colorspace = V4L2_COLORSPACE_REC709;
-	f->fmt.pix.ycbcr_enc = V4L2_YCBCR_ENC_709;
-	f->fmt.pix.xfer_func = V4L2_XFER_FUNC_709;
-
-	return 0;
+	return atomisp_try_fmt_cap(file, fh, f);
 }
 
 static int atomisp_s_fmt_cap(struct file *file, void *fh,
-- 
2.31.1

