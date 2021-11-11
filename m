Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3DCA44DB1A
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 18:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234365AbhKKRax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 12:30:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:47830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234310AbhKKRaw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 12:30:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAD3061354;
        Thu, 11 Nov 2021 17:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636651682;
        bh=cEvARZE01PkG5TfS7VOFuTCa6kXXGHQhZOv8rZLZKX8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g10FQFg6bijmqsogYzY7FXhYnWUwzrFsdM2nEFUdsho+tV2WGb7Qce/HiFKH/0r1c
         BZNFbREEgrBHY8mYXwRVbkO8UAqqRj9CJ8Ux4Lc2csbh3589tU1CBxqvjEirW4aIME
         FJtMAJyhan8McNLyOdMY3FNBTvETavyQl6xIQStfj0mcXE6wvKjBy7w6TPpKA7kwfe
         r9mTcU7b4dyRgVMIe2aVMCMfUDQ035pNC9k5FJlXz1VMrx7X+ArSPsuHEDIDlFltTI
         CmMPg4/vYjQXlHgvAq4wJUsGa5fcPbDFlcJkRdI6yQmCeEjfSOFFbnEM912Hsi2ZCO
         9nrpXlYYABp0g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mlDrk-0001oi-0f; Thu, 11 Nov 2021 17:28:00 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 3/3] media: atomisp: implement enum framesize/frameinterval
Date:   Thu, 11 Nov 2021 17:27:58 +0000
Message-Id: <88cb16535787c259a088e5bab47146fd1730dd6e.1636651027.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1636651027.git.mchehab+huawei@kernel.org>
References: <cover.1636651027.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add logic to enumerate sensor's frame size and interval.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

See [PATCH 0/3] at: https://lore.kernel.org/all/cover.1636651027.git.mchehab+huawei@kernel.org/

 .../staging/media/atomisp/pci/atomisp_ioctl.c | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 2fb64d5cbead..b2d3b8349234 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -766,6 +766,57 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	return ret;
 }
 
+static int atomisp_enum_framesizes(struct file *file, void *priv,
+				   struct v4l2_frmsizeenum *fsize)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct atomisp_device *isp = video_get_drvdata(vdev);
+	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
+	struct v4l2_subdev_frame_size_enum fse = {
+		.index = fsize->index,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	int ret;
+
+	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
+			       pad, enum_frame_size, NULL, &fse);
+	if (ret)
+		return ret;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+	fsize->discrete.width = fse.max_width - pad_w;
+	fsize->discrete.height = fse.max_height - pad_h;
+
+	return 0;
+}
+
+static int atomisp_enum_frameintervals(struct file *file, void *priv,
+				       struct v4l2_frmivalenum *fival)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct atomisp_device *isp = video_get_drvdata(vdev);
+	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
+	struct v4l2_subdev_frame_interval_enum fie = {
+		.code	= atomisp_in_fmt_conv[0].code,
+		.index = fival->index,
+		.width = fival->width,
+		.height = fival->height,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	int ret;
+
+	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
+			       pad, enum_frame_interval, NULL,
+			       &fie);
+	if (ret)
+		return ret;
+
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fival->discrete = fie.interval;
+
+	return ret;
+}
+
 static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 				struct v4l2_fmtdesc *f)
 {
@@ -3214,6 +3265,8 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_g_ctrl = atomisp_g_ctrl,
 	.vidioc_s_ext_ctrls = atomisp_s_ext_ctrls,
 	.vidioc_g_ext_ctrls = atomisp_g_ext_ctrls,
+	.vidioc_enum_framesizes   = atomisp_enum_framesizes,
+	.vidioc_enum_frameintervals = atomisp_enum_frameintervals,
 	.vidioc_enum_fmt_vid_cap = atomisp_enum_fmt_cap,
 	.vidioc_try_fmt_vid_cap = atomisp_try_fmt_cap,
 	.vidioc_g_fmt_vid_cap = atomisp_g_fmt_cap,
-- 
2.33.1

