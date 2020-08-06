Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E24923E1CB
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 21:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729765AbgHFTC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 15:02:28 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14673 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbgHFTBo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 15:01:44 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2c53650003>; Thu, 06 Aug 2020 12:00:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 12:01:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Aug 2020 12:01:43 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 19:01:43 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 6 Aug 2020 19:01:42 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.172.190]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2c53950000>; Thu, 06 Aug 2020 12:01:42 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 07/10] media: tegra-video: Add support for selection ioctl ops
Date:   Thu, 6 Aug 2020 12:01:31 -0700
Message-ID: <1596740494-19306-8-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596740494-19306-1-git-send-email-skomatineni@nvidia.com>
References: <1596740494-19306-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596740453; bh=MY7OOyZbj1LgF9iiygCS22H/LqLtPRo9jxHh5A4z9vs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=a310Y1Dhqq/dfKu+UgCJTdMbOS7BpSwg9rpRiMA4yDOKknr844Xmy+/EnM/SHKuuO
         2a72qnsTzqKHeHBzH/F9OJGi66m+ZieEh7OZSYZwT5BMP8Se8IbB8NjblqRtmHSuEn
         vdv4F+3sDq+FfGCD1qL84J/Uc6a6ZImT1wGw5sUk/h3MBILCUPdNZ8JypjzfykPLGM
         wFvh+6uf32Ryx/8wuGBZT5VHWtPV67rFY4ae1HpNm+HmZ6oixnc+BSPMHnzfUFP7MC
         RasIyc0j8c3AkZurcufLCDfoT+q9rBj/fFN68UgH7+XWED7w/i3RgKRGVu0/rcomJr
         AZI4Pzz/gwm7g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds selection v4l2 ioctl operations to allow configuring
a selection rectangle in the sensor through the Tegra video device
node.

Some sensor drivers supporting crop uses try_crop rectangle from
v4l2_subdev_pad_config during try format for computing binning.

So with selection ops support, this patch also updates try format
to use try crop rectangle either from subdev frame size enumeration
or from subdev crop boundary.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 106 +++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index deb1252..29a172f 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -474,6 +474,13 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	struct v4l2_subdev *subdev;
 	struct v4l2_subdev_format fmt;
 	struct v4l2_subdev_pad_config *pad_cfg;
+	struct v4l2_subdev_frame_size_enum fse = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+	};
+	struct v4l2_subdev_selection sdsel = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.target = V4L2_SEL_TGT_CROP_BOUNDS,
+	};
 	int ret;
 
 	subdev = tegra_channel_get_remote_source_subdev(chan);
@@ -499,6 +506,24 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fmt.which = V4L2_SUBDEV_FORMAT_TRY;
 	fmt.pad = 0;
 	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
+
+	/*
+	 * Attempt to obtain the format size from subdev.
+	 * If not available, try to get crop boundary from subdev.
+	 */
+	fse.code = fmtinfo->code;
+	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, pad_cfg, &fse);
+	if (ret) {
+		ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
+		if (ret)
+			return -EINVAL;
+		pad_cfg->try_crop.width = sdsel.r.width;
+		pad_cfg->try_crop.height = sdsel.r.height;
+	} else {
+		pad_cfg->try_crop.width = fse.max_width;
+		pad_cfg->try_crop.height = fse.max_height;
+	}
+
 	ret = v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
 	if (ret < 0)
 		return ret;
@@ -588,6 +613,85 @@ static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
 	return 0;
 }
 
+static int tegra_channel_g_selection(struct file *file, void *priv,
+				     struct v4l2_selection *sel)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev_selection sdsel = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.target = sel->target,
+	};
+	int ret;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, pad, get_selection))
+		return -ENOTTY;
+
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+	/*
+	 * Try the get selection operation and fallback to get format if not
+	 * implemented.
+	 */
+	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
+	if (!ret)
+		sel->r = sdsel.r;
+	if (ret != -ENOIOCTLCMD)
+		return ret;
+
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	if (ret < 0)
+		return ret;
+
+	sel->r.left = 0;
+	sel->r.top = 0;
+	sel->r.width = fmt.format.width;
+	sel->r.height = fmt.format.height;
+
+	return 0;
+}
+
+static int tegra_channel_s_selection(struct file *file, void *fh,
+				     struct v4l2_selection *sel)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+	int ret;
+	struct v4l2_subdev_selection sdsel = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.target = sel->target,
+		.flags = sel->flags,
+		.r = sel->r,
+	};
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, pad, set_selection))
+		return -ENOTTY;
+
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	if (vb2_is_busy(&chan->queue))
+		return -EBUSY;
+
+	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, &sdsel);
+	if (!ret) {
+		sel->r = sdsel.r;
+		/*
+		 * Subdev active format resolution may have changed during
+		 * set selection operation. So, update channel format to
+		 * the sub-device active format.
+		 */
+		return tegra_channel_set_subdev_active_fmt(chan);
+	}
+
+	return ret;
+}
+
 static int tegra_channel_enum_input(struct file *file, void *fh,
 				    struct v4l2_input *inp)
 {
@@ -645,6 +749,8 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
 	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+	.vidioc_g_selection		= tegra_channel_g_selection,
+	.vidioc_s_selection		= tegra_channel_s_selection,
 };
 
 /*
-- 
2.7.4

