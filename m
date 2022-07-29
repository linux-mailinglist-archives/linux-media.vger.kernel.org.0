Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF97E5855D2
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 21:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238857AbiG2T53 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 15:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbiG2T52 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 15:57:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC5F88747;
        Fri, 29 Jul 2022 12:57:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 568CC6D4;
        Fri, 29 Jul 2022 21:57:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659124644;
        bh=Fnn3BsSY+9Y0ZoK8j2r8OJ5JPOWen6rkhc4Jc5JKggI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t1Lt2uMFpxcd4uIXRIX0TC89Zw3JE8NFq5pMJSoXqbYk7ITBdt3FAJ2peWzbDJIUx
         q20OXY0NtRlT5NrSfeIFpEJFoCI/Wjjb4XV4f67o1mzQtYuefih16R5KNlBws+HBZC
         9yObX8+qwjtXDhGDwrj+8SyBq4NgxZNl6tn3UaRo=
Date:   Fri, 29 Jul 2022 22:57:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>, mchehab@kernel.org,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, ezequiel@vanguardiasur.com.ar,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 5/6] media: dw100: Add i.MX8MP dw100 dewarper driver
Message-ID: <YuQ7oeLLAo9QCt91@pendragon.ideasonboard.com>
References: <20220715135329.975400-1-xavier.roumegue@oss.nxp.com>
 <20220715135329.975400-6-xavier.roumegue@oss.nxp.com>
 <4f7eb28b-f14e-00bd-b96c-3fe9f12b8deb@xs4all.nl>
 <YuJKSLBvoXEMt1T5@pendragon.ideasonboard.com>
 <75fdb576-0985-c93a-1711-1ccf032d5f29@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <75fdb576-0985-c93a-1711-1ccf032d5f29@xs4all.nl>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jul 28, 2022 at 11:08:27AM +0200, Hans Verkuil wrote:
> On 7/28/22 10:35, Laurent Pinchart wrote:
> > On Thu, Jul 28, 2022 at 10:17:32AM +0200, Hans Verkuil wrote:
> >> On 7/15/22 15:53, Xavier Roumegue wrote:
> >>> Add a V4L2 mem-to-mem driver for the Vivante DW100 Dewarp Processor IP
> >>> core found on i.MX8MP SoC.
> >>>
> >>> The processor core applies a programmable geometrical transformation on
> >>> input images to correct distorsion introduced by lenses.
> >>> The transformation function is exposed as a grid map with 16x16 pixel
> >>> macroblocks indexed using X, Y vertex coordinates.
> >>>
> >>> The dewarping map can be set from application through a dedicated v4l2
> >>> control. If not set or invalid, the driver computes an identity map
> >>> prior to starting the processing engine.
> >>>
> >>> The driver supports scaling, cropping and pixel format conversion.
> >>>
> >>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> >>> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>>  drivers/media/platform/nxp/Kconfig            |    1 +
> >>>  drivers/media/platform/nxp/Makefile           |    1 +
> >>>  drivers/media/platform/nxp/dw100/Kconfig      |   17 +
> >>>  drivers/media/platform/nxp/dw100/Makefile     |    3 +
> >>>  drivers/media/platform/nxp/dw100/dw100.c      | 1683 +++++++++++++++++
> >>>  drivers/media/platform/nxp/dw100/dw100_regs.h |  117 ++
> >>>  6 files changed, 1822 insertions(+)
> >>>  create mode 100644 drivers/media/platform/nxp/dw100/Kconfig
> >>>  create mode 100644 drivers/media/platform/nxp/dw100/Makefile
> >>>  create mode 100644 drivers/media/platform/nxp/dw100/dw100.c
> >>>  create mode 100644 drivers/media/platform/nxp/dw100/dw100_regs.h

[snip]

> >>> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> >>> new file mode 100644
> >>> index 000000000000..986ef1c9dfe3
> >>> --- /dev/null
> >>> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> >>> @@ -0,0 +1,1683 @@

[snip]

> >>> +static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
> >>> +{
> >>> +	struct dw100_ctx *ctx =
> >>> +		container_of(ctrl->handler, struct dw100_ctx, hdl);
> >>> +
> >>> +	switch (ctrl->id) {
> >>> +	case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
> >>> +		ctx->user_map_is_valid = true;
> >>
> >> Ah, no. You don't want to do this.
> >>
> >> The control should always be valid.
> > 
> > This is meant to indicate if the control value has been set after a
> > S_FMT call. If the resolution changes, the control value isn't valid
> > anymore.
> > 
> > We could change the control value from within the driver in the S_FMT
> > handler, but frankly that's completely overkill. I'd rather ditch
> > control support and use a custom ioctl then if the control framework
> > and/or the API requirements are not well suited for this purpose.
> 
> It's a general V4L2 design rule that you shouldn't have invalid values.
> If changing one parameter (the format in this case) would cause other
> values to become invalid, then it is the driver that has to fix things
> so the state is once more consistent.

The only thing the driver can do is to reset the control to an identity
map. It seems quite inefficient to do so, compared to creating the map
when needed, as an identity map if the control hasn't been set since the
last S_FMT, or from the control value otherwise.

> Note that v4l2_ctrl_modify_dimensions calls init() already, so adding
> your own init op that fills it with a sane value doesn't add overhead.

Right. I would have gone for a custom ioctl, but it's not my driver so I
don't mind a control :-)

> >> See the next comment...
> >>
> >>> +		break;
> >>> +	}
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>> +static const struct v4l2_ctrl_ops dw100_ctrl_ops = {
> >>> +	.s_ctrl = dw100_s_ctrl,
> >>> +};
> >>> +
> >>> +static const struct v4l2_ctrl_config controls[] = {
> >>> +	[DW100_CTRL_DEWARPING_MAP] = {
> >>> +		.ops = &dw100_ctrl_ops,
> >>
> >> What you want to do here is set .type_ops as well and override the init
> >> function.
> > 
> > Not a blocker for this, but I think the init function of type_ops is
> > really ineffecient for large arrays. Something better is needed.
> 
> I agree, and after looking at the code I think this is quite easy to do.
> Instead of initing each element in turn, it would just be called once
> for the whole array. It's a good optimization.
> 
> The main reason that wasn't done before is that arrays were a late addition
> and are still quite rare and typically are initialized only once. So there
> was never a real need to optimize the code. But for this it makes sense to
> do the work.
> 
> Let me know if you want me to do this.

Thanks for posting a patch already.

> >> This init function should be used to fill in the initial values for the
> >> array, which would be just the x/y coordinates of the vertices, i.e. no
> >> warping.
> >>
> >> This will ensure that the contents of the array is always valid.
> >>
> >>> +		.id = V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP,
> >>> +		.name = "Look-Up Table",
> >>
> >> That's a poor name, I think. How about "Dewarping Vertex Map" or something
> >> along those lines? That at least explains what it does.
> >>
> >>> +		.type = V4L2_CTRL_TYPE_U32,
> >>> +		.min = 0x00000000,
> >>> +		.max = 0xffffffff,
> >>> +		.step = 1,
> >>> +		.def = 0,
> >>> +		.dims = { DW100_MAX_LUT_W, DW100_MAX_LUT_H },
> >>> +	},
> >>> +};

[snip]

> >>> +static int dw100_s_fmt(struct dw100_ctx *ctx, struct v4l2_format *f)
> >>> +{
> >>> +	struct dw100_q_data *q_data;
> >>> +	struct vb2_queue *vq;
> >>> +
> >>> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> >>> +	if (!vq)
> >>> +		return -EINVAL;
> >>> +
> >>> +	q_data = dw100_get_q_data(ctx, f->type);
> >>> +	if (!q_data)
> >>> +		return -EINVAL;
> >>> +
> >>> +	if (vb2_is_busy(vq)) {
> >>> +		dev_dbg(&ctx->dw_dev->pdev->dev, "%s queue busy\n", __func__);
> >>> +		return -EBUSY;
> >>> +	}
> >>> +
> >>> +	q_data->fmt = dw100_find_format(f);
> >>> +	q_data->pix_fmt = f->fmt.pix_mp;
> >>> +	q_data->crop.top = 0;
> >>> +	q_data->crop.left = 0;
> >>> +	q_data->crop.width = f->fmt.pix_mp.width;
> >>> +	q_data->crop.height = f->fmt.pix_mp.height;
> >>> +
> >>> +	/* Propagate buffers encoding */
> >>> +
> >>> +	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> >>> +		struct dw100_q_data *dst_q_data =
> >>> +			dw100_get_q_data(ctx,
> >>> +					 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> >>> +
> >>> +		dst_q_data->pix_fmt.colorspace = q_data->pix_fmt.colorspace;
> >>> +		dst_q_data->pix_fmt.ycbcr_enc = q_data->pix_fmt.ycbcr_enc;
> >>> +		dst_q_data->pix_fmt.quantization = q_data->pix_fmt.quantization;
> >>> +		dst_q_data->pix_fmt.xfer_func = q_data->pix_fmt.xfer_func;
> >>> +	}
> >>> +
> >>> +	dev_dbg(&ctx->dw_dev->pdev->dev,
> >>> +		"Setting format for type %u, wxh: %ux%u, fmt: %p4cc\n",
> >>> +		f->type, q_data->pix_fmt.width, q_data->pix_fmt.height,
> >>> +		&q_data->pix_fmt.pixelformat);
> >>> +
> >>> +	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> >>> +		int ret;
> >>> +		u32 dims[V4L2_CTRL_MAX_DIMS] = {};
> >>> +		struct v4l2_ctrl *ctrl = ctx->ctrls[DW100_CTRL_DEWARPING_MAP];
> >>> +
> >>> +		dims[0] = dw100_get_n_vertices_from_length(q_data->pix_fmt.width);
> >>> +		dims[1] = dw100_get_n_vertices_from_length(q_data->pix_fmt.height);
> >>> +
> >>> +		v4l2_ctrl_lock(ctrl);
> >>> +		ctx->user_map_is_valid = false;
> >>> +		ret = __v4l2_ctrl_modify_dimensions(ctrl, dims);
> >>> +		v4l2_ctrl_unlock(ctrl);
> >>> +
> >>> +		if (ret) {
> >>> +			dev_err(&ctx->dw_dev->pdev->dev,
> >>> +				"Modifying LUT dimensions failed with error %d\n",
> >>> +				ret);
> >>> +			return ret;
> >>> +		}
> >>> +	}
> >>> +
> >>> +	return 0;
> >>> +}

-- 
Regards,

Laurent Pinchart
