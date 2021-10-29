Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB9243FD4C
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 15:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhJ2N2A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 09:28:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:41576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229603AbhJ2N16 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 09:27:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E5B561167;
        Fri, 29 Oct 2021 13:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635513930;
        bh=+RnqNEo86g+pwCtg0yvYRDENv2czIXcrxcwDKdiKWQc=;
        h=From:To:Cc:Subject:Date:From;
        b=ZHTmh4ANXu+8xmhlyByehrapbXIB9HbHpGKkqcVSSjt21DxYm/olgb8iVQvi7V2Xt
         QuGqY05qQjWaAZ+ewQPqWKGbMPZ80zIvmAkZDx49zaKiWz41xt6DLICQ5rgdBv3Zt2
         XrrulEiHtpSvrabRFuMesVf+99okZ5vT1o4cwzROLkMsOHytrtGoOQPUXS1uB51Am1
         w/hJRlRnDDvrAFFQQCMyErEEsP2uixOqyG3/jvyxEw6Uoczaw000O5lttF/PldDwAL
         9LqZDwWAXNTmVPS6Yv+4fSl4SrATU5HeiQH3Qm2VVOaJmoCj9hSttTne/hVTmaB4WY
         d9nlksYhQRpJw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mgRst-0032Ic-DE; Fri, 29 Oct 2021 14:25:27 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: properly implement g_fmt
Date:   Fri, 29 Oct 2021 14:25:23 +0100
Message-Id: <7be615799148168ca454df998aaa1e0b224b4328.1635513916.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current logic only initializes pipe->pix after setting up a
pipeline - e. g. after start streaming.

While it makes sense to get the format of the pipeline, when
it is set, this breaks support for generic applications, as they
rely on getting the current sensor format (which is usually the
highest resolution format).

So, implement a call to the sensor's get_fmt, when this is called
before setting up a pipeline.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 13 +-----
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  4 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 44 +++++++++++++++++--
 3 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 70c8e86c3205..6b308c81ef77 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2034,7 +2034,7 @@ static int raw_output_format_match_input(u32 input, u32 output)
 	return -EINVAL;
 }
 
-static u32 get_pixel_depth(u32 pixelformat)
+u32 atomisp_get_pixel_depth(u32 pixelformat)
 {
 	switch (pixelformat) {
 	case V4L2_PIX_FMT_YUV420:
@@ -4816,15 +4816,6 @@ int atomisp_get_sensor_mode_data(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-int atomisp_get_fmt(struct video_device *vdev, struct v4l2_format *f)
-{
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-
-	f->fmt.pix = pipe->pix;
-
-	return 0;
-}
-
 static void __atomisp_update_stream_env(struct atomisp_sub_device *asd,
 					u16 stream_index, struct atomisp_input_stream_info *stream_info)
 {
@@ -4973,7 +4964,7 @@ atomisp_try_fmt_file(struct atomisp_device *isp, struct v4l2_format *f)
 		return -EINVAL;
 	}
 
-	depth = get_pixel_depth(pixelformat);
+	depth = atomisp_get_pixel_depth(pixelformat);
 
 	if (field == V4L2_FIELD_ANY) {
 		field = V4L2_FIELD_NONE;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index e8bdd264d31b..fb848d716947 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -266,8 +266,6 @@ int atomisp_compare_grid(struct atomisp_sub_device *asd,
 int atomisp_get_sensor_mode_data(struct atomisp_sub_device *asd,
 				 struct atomisp_sensor_mode_data *config);
 
-int atomisp_get_fmt(struct video_device *vdev, struct v4l2_format *f);
-
 /* This function looks up the closest available resolution. */
 int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 		    bool *res_overflow);
@@ -341,6 +339,8 @@ enum atomisp_metadata_type
 atomisp_get_metadata_type(struct atomisp_sub_device *asd,
 			  enum ia_css_pipe_id pipe_id);
 
+u32 atomisp_get_pixel_depth(u32 pixelformat);
+
 /* Function for HAL to inject a fake event to wake up poll thread */
 int atomisp_inject_a_fake_event(struct atomisp_sub_device *asd, int *event);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 29826f8e4143..37542ea17a38 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -838,15 +838,53 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 static int atomisp_g_fmt_cap(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE
+	};
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
-
+	struct v4l2_fmtdesc fmtdesc = { 0 };
+	struct atomisp_video_pipe *pipe;
+	struct atomisp_sub_device *asd;
+	struct v4l2_subdev *camera;
+	u32 depth;
 	int ret;
 
 	rt_mutex_lock(&isp->mutex);
-	ret = atomisp_get_fmt(vdev, f);
+	pipe = atomisp_to_video_pipe(vdev);
 	rt_mutex_unlock(&isp->mutex);
-	return ret;
+
+	f->fmt.pix = pipe->pix;
+	if (!f->fmt.pix.width) {
+		asd = atomisp_to_video_pipe(vdev)->asd;
+		if (!asd)
+		    return -EINVAL;
+
+		camera = isp->inputs[asd->input_curr].camera;
+		if(!camera)
+			return -EINVAL;
+
+		ret = atomisp_enum_fmt_cap(file, fh, &fmtdesc);
+		if (ret)
+			return ret;
+
+		rt_mutex_lock(&isp->mutex);
+		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
+				       pad, get_fmt, NULL, &fmt);
+		rt_mutex_unlock(&isp->mutex);
+		if (ret)
+			return ret;
+
+		v4l2_fill_pix_format(&f->fmt.pix, &fmt.format);
+
+		f->fmt.pix.pixelformat = fmtdesc.pixelformat;
+	}
+
+	depth = atomisp_get_pixel_depth(f->fmt.pix.pixelformat);
+	f->fmt.pix.bytesperline = (f->fmt.pix.width * depth) >> 3;
+	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
+
+	return 0;
 }
 
 static int atomisp_g_fmt_file(struct file *file, void *fh,
-- 
2.31.1

