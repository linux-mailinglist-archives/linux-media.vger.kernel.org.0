Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0F05B45E
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 07:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbfGAFvA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 01:51:00 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39709 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbfGAFvA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 01:51:00 -0400
Received: by mail-pl1-f195.google.com with SMTP id b7so6727746pls.6
        for <linux-media@vger.kernel.org>; Sun, 30 Jun 2019 22:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A/bf03g2B0LFEMWFVuMqS52+scFCs4jGeSMIYZD/Yek=;
        b=Iix6DCQErETbgO5HQHrWqtCbZiPADvJ2Zlncl2KylCIk8Cg93HCSVs81Bx75VxNm5Q
         PP5sfNRFhvD+AqwURTKNnqfnR9cQYYSAPtqGAvDt1ETLY2Ewu0DYvu02sMU3MDbATy+n
         pzDjHcXKRMZtzEjlxpPg31D7lH+UlA7Cy7fvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A/bf03g2B0LFEMWFVuMqS52+scFCs4jGeSMIYZD/Yek=;
        b=QHt/lg5YITRTtCz2VZ3uzV1mg4HkAfkunCSpnY1Kysg36sR7SZp0SAiQaW9ebFqk6L
         icJ/tN87DdYsm11F4iY51xQ0YfFxKF5lJ6ZMolJn4fuhEaL8yetZe+DQeUZAFplBMInT
         yX//09Xf4Q0Dcf+gpsg0albaNp4EJahzKDSO8+8+3eakb87O5LZo5AFJER84S9s/c8RM
         0un0sj7tg5NNi8w3AgidK7/Q+a7b7VoIEmoR7XbwkqkavcRaU7kfDZHjMqi2OhLiks08
         OXf8FZW6Qf+GfyevlW7ZFGPgJFr0yAF/JHlpqk4NgGMnuyN89xkuK+LutjfTIVDsd+S8
         gjhw==
X-Gm-Message-State: APjAAAVkoU/VUEJyluwlz07RIlxRMkSXtrm5aX97ymeeNJ93ULJoRbF3
        2GAJI9In7JxjU5o8RWQJb66Svg==
X-Google-Smtp-Source: APXvYqzC+Op6oAeeU9AgUZ7d0ASyA+LyLyhKBUxNaOMz6Sx06gGxqMdsPUz/BBlKvF7i0lYhlvijjA==
X-Received: by 2002:a17:902:9896:: with SMTP id s22mr15507737plp.4.1561960259568;
        Sun, 30 Jun 2019 22:50:59 -0700 (PDT)
Received: from chromium.org ([2401:fa00:4:4:6d27:f13:a0fa:d4b6])
        by smtp.gmail.com with ESMTPSA id m11sm8243540pjv.21.2019.06.30.22.50.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 22:50:58 -0700 (PDT)
Date:   Mon, 1 Jul 2019 14:50:53 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        matthias.bgg@gmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        srv_heupstream@mediatek.com, ddavenport@chromium.org,
        robh@kernel.org, sean.cheng@mediatek.com, sj.huang@mediatek.com,
        frederic.chen@mediatek.com, ryan.yu@mediatek.com,
        rynn.wu@mediatek.com, frankie.chiu@mediatek.com
Subject: Re: [RFC,v3 5/9] media: platform: Add Mediatek ISP P1 V4L2 control
Message-ID: <20190701055053.GA137710@chromium.org>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-6-jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611035344.29814-6-jungo.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jungo,

On Tue, Jun 11, 2019 at 11:53:40AM +0800, Jungo Lin wrote:
> Reserved Mediatek ISP P1 V4L2 control number with 16.
> Moreover, add two V4L2 controls for ISP P1 user space
> usage.
> 
> 1. V4L2_CID_MTK_GET_BIN_INFO
> - Provide the image output width & height in case
> camera binning mode is enabled.

Could you explain with a bit more details what these binned width and height
would mean? How would they relate to the video CAPTURE node width and height?
Isn't this something that should be rather exposed as an appropriate
selection rectangle, instead of custom controls?

> 
> 2. V4L2_CID_MTK_RAW_PATH
> - Export the path control of the main stream to user space.
> One is pure raw and the other is processing raw.
> The default value is 0 which outputs the pure raw bayer image
> from sesnor, without image processing in ISP HW.

Is it just effectively a full processing bypass? The driver seems to only
update the related configuration when the streaming starts. Can it be
controlled per-frame?

Generally this sounds more like something that should be modelled using the
media topology, similar to the example below.

/----------------\   /-------------------\   /--------------\
|                |---|                   |   |              |
| Capture Subdev |   | Processing Subdev |-o-| CAPTURE node |
|                |-\ |                   | | |              |
\----------------/ | \-------------------/ | \--------------/
                   |                       |
                   \-----------------------/

Then the userspace can select whether it wants the image from the capture
interface directly or procesed by the ISP by configuring the media links
appropriately.

The current limitation of this model is that it can't be easily configured
per-frame, as media configurations are not included in the requests yet.

[snip]

> +static int handle_ctrl_get_bin_info(struct v4l2_ctrl *ctrl, int is_width)
> +{
> +	struct mtk_cam_dev *cam_dev = ctrl->priv;
> +	struct v4l2_format *fmt;
> +
> +	fmt = &cam_dev->vdev_nodes[MTK_CAM_P1_MAIN_STREAM_OUT].vdev_fmt;
> +
> +	dev_dbg(&cam_dev->pdev->dev, "Get bin info w*h:%d*%d is_width:%d",
> +		fmt->fmt.pix_mp.width, fmt->fmt.pix_mp.height, is_width);
> +
> +	if (is_width)
> +		ctrl->val = fmt->fmt.pix_mp.width;
> +	else
> +		ctrl->val = fmt->fmt.pix_mp.height;

This seems to contradict to what the comment in the header says, because it just
always returns the video node format and doesn't seem to care about whether
binning is enabled or not.

> +
> +	return 0;
> +}
> +
> +static int handle_ctrl_get_process_raw(struct v4l2_ctrl *ctrl)
> +{
> +	struct mtk_cam_dev *cam_dev = ctrl->priv;
> +	struct isp_p1_device *p1_dev = get_p1_device(&cam_dev->pdev->dev);
> +
> +	ctrl->val = (p1_dev->isp_ctx.isp_raw_path == ISP_PROCESS_RAW_PATH);
> +
> +	dev_dbg(&cam_dev->pdev->dev, "Get process raw:%d", ctrl->val);
> +
> +	return 0;
> +}
> +
> +static int handle_ctrl_set_process_raw(struct v4l2_ctrl *ctrl)
> +{
> +	struct mtk_cam_dev *cam_dev = ctrl->priv;
> +	struct isp_p1_device *p1_dev = get_p1_device(&cam_dev->pdev->dev);
> +
> +	p1_dev->isp_ctx.isp_raw_path = (ctrl->val) ?
> +		ISP_PROCESS_RAW_PATH : ISP_PURE_RAW_PATH;
> +	dev_dbg(&cam_dev->pdev->dev, "Set process raw:%d", ctrl->val);
> +	return 0;
> +}
> +
> +static int mtk_cam_dev_g_ctrl(struct v4l2_ctrl *ctrl)

This is g_volatile_ctrl not, g_ctrl.

> +{
> +	switch (ctrl->id) {
> +	case V4L2_CID_MTK_PROCESSING_RAW:
> +		handle_ctrl_get_process_raw(ctrl);
> +		break;

No need to provide getters for non-volatile controls. The
framework manages them.

> +	case V4L2_CID_MTK_GET_BIN_WIDTH:
> +		handle_ctrl_get_bin_info(ctrl, 1);
> +		break;
> +	case V4L2_CID_MTK_GET_BIN_HEIGTH:
> +		handle_ctrl_get_bin_info(ctrl, 0);

It's trivial to get the value, so there isn't much benefit in having a
function to do so, especially if one needs something like a is_width
argument that further complicates the code.

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int mtk_cam_dev_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	switch (ctrl->id) {
> +	case V4L2_CID_MTK_PROCESSING_RAW:
> +		return handle_ctrl_set_process_raw(ctrl);

Same as above. The operation is too trivial to deserve a function.

> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct v4l2_ctrl_ops mtk_cam_dev_ctrl_ops = {
> +	.g_volatile_ctrl = mtk_cam_dev_g_ctrl,
> +	.s_ctrl = mtk_cam_dev_s_ctrl,
> +};
> +
> +struct v4l2_ctrl_config mtk_cam_controls[] = {
> +	{
> +	.ops = &mtk_cam_dev_ctrl_ops,
> +	.id = V4L2_CID_MTK_PROCESSING_RAW,
> +	.name = "MTK CAM PROCESSING RAW",
> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> +	.min = 0,
> +	.max = 1,
> +	.step = 1,
> +	.def = 1,
> +	},
> +	{
> +	.ops = &mtk_cam_dev_ctrl_ops,
> +	.id = V4L2_CID_MTK_GET_BIN_WIDTH,
> +	.name = "MTK CAM GET BIN WIDTH",
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = IMG_MIN_WIDTH,
> +	.max = IMG_MAX_WIDTH,
> +	.step = 1,
> +	.def = IMG_MAX_WIDTH,
> +	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
> +	},
> +	{
> +	.ops = &mtk_cam_dev_ctrl_ops,
> +	.id = V4L2_CID_MTK_GET_BIN_HEIGTH,
> +	.name = "MTK CAM GET BIN HEIGHT",
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = IMG_MIN_HEIGHT,
> +	.max = IMG_MAX_HEIGHT,
> +	.step = 1,
> +	.def = IMG_MAX_HEIGHT,
> +	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
> +	},
> +};
> +
> +int mtk_cam_ctrl_init(struct mtk_cam_dev *cam_dev,
> +		      struct v4l2_ctrl_handler *hdl)
> +{
> +	unsigned int i;
> +
> +	/* Initialized HW controls, allow V4L2_CID_MTK_CAM_MAX ctrls */
> +	v4l2_ctrl_handler_init(hdl, V4L2_CID_MTK_CAM_MAX);
> +	if (hdl->error) {

This should be checked at the end, after all the controls are added.

Best regards,
Tomasz

