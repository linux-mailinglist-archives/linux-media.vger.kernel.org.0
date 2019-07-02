Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8695CE75
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 13:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfGBLei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 07:34:38 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:38651 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725835AbfGBLei (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 07:34:38 -0400
X-UUID: 2daf956da3294de5b005213141b0d2d2-20190702
X-UUID: 2daf956da3294de5b005213141b0d2d2-20190702
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 539351229; Tue, 02 Jul 2019 19:34:30 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 2 Jul 2019 19:34:27 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 2 Jul 2019 19:34:27 +0800
Message-ID: <1562067267.1212.23.camel@mtksdccf07>
Subject: Re: [RFC,v3 5/9] media: platform: Add Mediatek ISP P1 V4L2 control
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     <hverkuil@xs4all.nl>, <laurent.pinchart@ideasonboard.com>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <robh@kernel.org>,
        <sean.cheng@mediatek.com>, <sj.huang@mediatek.com>,
        <frederic.chen@mediatek.com>, <ryan.yu@mediatek.com>,
        <rynn.wu@mediatek.com>, <frankie.chiu@mediatek.com>
Date:   Tue, 2 Jul 2019 19:34:27 +0800
In-Reply-To: <20190701055053.GA137710@chromium.org>
References: <jungo.lin@mediatek.com>
         <20190611035344.29814-1-jungo.lin@mediatek.com>
         <20190611035344.29814-6-jungo.lin@mediatek.com>
         <20190701055053.GA137710@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Mon, 2019-07-01 at 14:50 +0900, Tomasz Figa wrote:
> Hi Jungo,
> 
> On Tue, Jun 11, 2019 at 11:53:40AM +0800, Jungo Lin wrote:
> > Reserved Mediatek ISP P1 V4L2 control number with 16.
> > Moreover, add two V4L2 controls for ISP P1 user space
> > usage.
> > 
> > 1. V4L2_CID_MTK_GET_BIN_INFO
> > - Provide the image output width & height in case
> > camera binning mode is enabled.
> 
> Could you explain with a bit more details what these binned width and height
> would mean? How would they relate to the video CAPTURE node width and height?
> Isn't this something that should be rather exposed as an appropriate
> selection rectangle, instead of custom controls?
> 

Frontal binning is Mediatek ISP P1 HW function and it is designed for
low power saving. The input sensor resolution will be divided by 2
including width & height in the source side of ISP HW and lower the
overall ISP throughput. So the ISP clock could be running in the low
speed for power saving. However, the image quality will be bad in this
mode. If the frontal binning is enabled by ISP driver, user space 3A
algorithm needs to know the new resolution of TG. Btw, current ISP
driver doesn't support this function. We just export this V4L2 contorl
for future support. But, after internal discussing, we will remove this
v4l2 control in next patch.

> > 
> > 2. V4L2_CID_MTK_RAW_PATH
> > - Export the path control of the main stream to user space.
> > One is pure raw and the other is processing raw.
> > The default value is 0 which outputs the pure raw bayer image
> > from sesnor, without image processing in ISP HW.
> 
> Is it just effectively a full processing bypass? The driver seems to only
> update the related configuration when the streaming starts. Can it be
> controlled per-frame?
> 
> Generally this sounds more like something that should be modelled using the
> media topology, similar to the example below.
> 
> /----------------\   /-------------------\   /--------------\
> |                |---|                   |   |              |
> | Capture Subdev |   | Processing Subdev |-o-| CAPTURE node |
> |                |-\ |                   | | |              |
> \----------------/ | \-------------------/ | \--------------/
>                    |                       |
>                    \-----------------------/
> 
> Then the userspace can select whether it wants the image from the capture
> interface directly or procesed by the ISP by configuring the media links
> appropriately.
> 
> The current limitation of this model is that it can't be easily configured
> per-frame, as media configurations are not included in the requests yet.
> 
> [snip]
> 

For this V4L2 control, it is designed for per stream, not per frame and
just implemented for future usage. As the same conclusion with the above
one, we will remove this, either in current version. If we have strong
requirement on this, we could adopt your suggestion to use media
topology to per stream control.


> > +static int handle_ctrl_get_bin_info(struct v4l2_ctrl *ctrl, int is_width)
> > +{
> > +	struct mtk_cam_dev *cam_dev = ctrl->priv;
> > +	struct v4l2_format *fmt;
> > +
> > +	fmt = &cam_dev->vdev_nodes[MTK_CAM_P1_MAIN_STREAM_OUT].vdev_fmt;
> > +
> > +	dev_dbg(&cam_dev->pdev->dev, "Get bin info w*h:%d*%d is_width:%d",
> > +		fmt->fmt.pix_mp.width, fmt->fmt.pix_mp.height, is_width);
> > +
> > +	if (is_width)
> > +		ctrl->val = fmt->fmt.pix_mp.width;
> > +	else
> > +		ctrl->val = fmt->fmt.pix_mp.height;
> 
> This seems to contradict to what the comment in the header says, because it just
> always returns the video node format and doesn't seem to care about whether
> binning is enabled or not.
> 

This is because binning mode is not supported in current driver's
implementation and no request on this function. We just create this for
future usage. In order to avoid confusion, we will remove this.

> > +
> > +	return 0;
> > +}
> > +
> > +static int handle_ctrl_get_process_raw(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mtk_cam_dev *cam_dev = ctrl->priv;
> > +	struct isp_p1_device *p1_dev = get_p1_device(&cam_dev->pdev->dev);
> > +
> > +	ctrl->val = (p1_dev->isp_ctx.isp_raw_path == ISP_PROCESS_RAW_PATH);
> > +
> > +	dev_dbg(&cam_dev->pdev->dev, "Get process raw:%d", ctrl->val);
> > +
> > +	return 0;
> > +}
> > +
> > +static int handle_ctrl_set_process_raw(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mtk_cam_dev *cam_dev = ctrl->priv;
> > +	struct isp_p1_device *p1_dev = get_p1_device(&cam_dev->pdev->dev);
> > +
> > +	p1_dev->isp_ctx.isp_raw_path = (ctrl->val) ?
> > +		ISP_PROCESS_RAW_PATH : ISP_PURE_RAW_PATH;
> > +	dev_dbg(&cam_dev->pdev->dev, "Set process raw:%d", ctrl->val);
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_dev_g_ctrl(struct v4l2_ctrl *ctrl)
> 
> This is g_volatile_ctrl not, g_ctrl.
> 

Ok, thanks for your correction.

> > +{
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_MTK_PROCESSING_RAW:
> > +		handle_ctrl_get_process_raw(ctrl);
> > +		break;
> 
> No need to provide getters for non-volatile controls. The
> framework manages them.
> 

Ok, thanks for your correction.

> > +	case V4L2_CID_MTK_GET_BIN_WIDTH:
> > +		handle_ctrl_get_bin_info(ctrl, 1);
> > +		break;
> > +	case V4L2_CID_MTK_GET_BIN_HEIGTH:
> > +		handle_ctrl_get_bin_info(ctrl, 0);
> 
> It's trivial to get the value, so there isn't much benefit in having a
> function to do so, especially if one needs something like a is_width
> argument that further complicates the code.
> 

Ok, we will pay attention in this of implementation next time.

> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_dev_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_MTK_PROCESSING_RAW:
> > +		return handle_ctrl_set_process_raw(ctrl);
> 
> Same as above. The operation is too trivial to deserve a function.
> 

Ok, got it.

> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static const struct v4l2_ctrl_ops mtk_cam_dev_ctrl_ops = {
> > +	.g_volatile_ctrl = mtk_cam_dev_g_ctrl,
> > +	.s_ctrl = mtk_cam_dev_s_ctrl,
> > +};
> > +
> > +struct v4l2_ctrl_config mtk_cam_controls[] = {
> > +	{
> > +	.ops = &mtk_cam_dev_ctrl_ops,
> > +	.id = V4L2_CID_MTK_PROCESSING_RAW,
> > +	.name = "MTK CAM PROCESSING RAW",
> > +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> > +	.min = 0,
> > +	.max = 1,
> > +	.step = 1,
> > +	.def = 1,
> > +	},
> > +	{
> > +	.ops = &mtk_cam_dev_ctrl_ops,
> > +	.id = V4L2_CID_MTK_GET_BIN_WIDTH,
> > +	.name = "MTK CAM GET BIN WIDTH",
> > +	.type = V4L2_CTRL_TYPE_INTEGER,
> > +	.min = IMG_MIN_WIDTH,
> > +	.max = IMG_MAX_WIDTH,
> > +	.step = 1,
> > +	.def = IMG_MAX_WIDTH,
> > +	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
> > +	},
> > +	{
> > +	.ops = &mtk_cam_dev_ctrl_ops,
> > +	.id = V4L2_CID_MTK_GET_BIN_HEIGTH,
> > +	.name = "MTK CAM GET BIN HEIGHT",
> > +	.type = V4L2_CTRL_TYPE_INTEGER,
> > +	.min = IMG_MIN_HEIGHT,
> > +	.max = IMG_MAX_HEIGHT,
> > +	.step = 1,
> > +	.def = IMG_MAX_HEIGHT,
> > +	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
> > +	},
> > +};
> > +
> > +int mtk_cam_ctrl_init(struct mtk_cam_dev *cam_dev,
> > +		      struct v4l2_ctrl_handler *hdl)
> > +{
> > +	unsigned int i;
> > +
> > +	/* Initialized HW controls, allow V4L2_CID_MTK_CAM_MAX ctrls */
> > +	v4l2_ctrl_handler_init(hdl, V4L2_CID_MTK_CAM_MAX);
> > +	if (hdl->error) {
> 
> This should be checked at the end, after all the controls are added.
> 

Ok, got it.

> Best regards,
> Tomasz
> 

Based on above comments, we will remove mtk_cam_ctrl.h & mtk_cam_ctrl.c
in next patch to avoid over design.

Thanks for your comments.

Jungo


