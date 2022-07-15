Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7837D575F53
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 12:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbiGOKZq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 06:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiGOKZl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 06:25:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7405482F8E;
        Fri, 15 Jul 2022 03:25:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E1EA0621D5;
        Fri, 15 Jul 2022 10:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEACBC34115;
        Fri, 15 Jul 2022 10:25:35 +0000 (UTC)
Message-ID: <0066ae29-5eff-983c-ff49-ca80dc714cd9@xs4all.nl>
Date:   Fri, 15 Jul 2022 12:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 5/6] media: dw100: Add i.MX8MP dw100 dewarper driver
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, stanimir.varbanov@linaro.org,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220713211124.2677275-1-xavier.roumegue@oss.nxp.com>
 <20220713211124.2677275-6-xavier.roumegue@oss.nxp.com>
 <YtCNsx0gl8PkHoOu@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <YtCNsx0gl8PkHoOu@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/14/22 23:42, Laurent Pinchart wrote:
> Hi Xavier,
> 
> Thank you for the patch.
> 
> You're nearly there :-)
> 
> On Wed, Jul 13, 2022 at 11:11:23PM +0200, Xavier Roumegue wrote:
>> Add a V4L2 mem-to-mem driver for the Vivante DW100 Dewarp Processor IP
>> core found on i.MX8MP SoC.
>>
>> The processor core applies a programmable geometrical transformation on
>> input images to correct distorsion introduced by lenses.
>> The transformation function is exposed as a grid map with 16x16 pixel
>> macroblocks indexed using X, Y vertex coordinates.
>>
>> The dewarping map can be set from application through a dedicated v4l2
>> control. If not set or invalid, the driver computes an identity map
>> prior to starting the processing engine.
>>
>> The driver supports scaling, cropping and pixel format conversion.
>>
>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

<snip>

>> +static int dw100_try_fmt(struct v4l2_format *f)
>> +{
>> +	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
>> +	const struct dw100_fmt *fmt;
>> +
>> +	fmt = dw100_find_format(f);
>> +	if (!fmt) {
>> +		f->fmt.pix_mp.pixelformat = formats[0].fourcc;
>> +		fmt = dw100_find_format(f);
> 
> 		fmt = &formats[0];
> 		pix->pixelformat = fmt->fourcc;
> 
>> +	}
>> +
>> +	v4l2_apply_frmsize_constraints(&pix->width, &pix->height,
>> +				       &dw100_frmsize_stepwise);
>> +
>> +	v4l2_fill_pixfmt_mp(pix, fmt->fourcc, pix->width, pix->height);
>> +
>> +	pix->field = V4L2_FIELD_NONE;
>> +
>> +	if (pix->colorspace == V4L2_COLORSPACE_DEFAULT)
>> +		pix->colorspace = V4L2_COLORSPACE_REC709;
>> +	if (pix->xfer_func == V4L2_XFER_FUNC_DEFAULT)
>> +		pix->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pix->colorspace);
>> +	if (pix->ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT)
>> +		pix->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(pix->colorspace);
>> +	if (pix->quantization == V4L2_QUANTIZATION_DEFAULT)
>> +		pix->quantization =
>> +			V4L2_MAP_QUANTIZATION_DEFAULT(false, pix->colorspace,
>> +						      pix->ycbcr_enc);
> 
> There's a little problem here. When this function is called for the
> capture video node, it will happilly accept any colorspace, while the
> DW100 can't do colorspace conversion (as far as I understand).
> 
> I'm actually not entirely sure how try_fmt is supposed to behave on M2M
> devices, if it is meant to be constrained, when operating on the capture
> node, by the current format on the output node. Hans may know. If that's
> the correct behaviour, I would here write

Yes, it is constrained by the output format. So in this case try_fmt would
copy the output format colorimetry fields, since the HW doesn't do colorspace
conversion.

> 
> 	if (fmt->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> 		if (pix->colorspace == V4L2_COLORSPACE_DEFAULT)
> 			pix->colorspace = V4L2_COLORSPACE_REC709;
> 		if (pix->xfer_func == V4L2_XFER_FUNC_DEFAULT)
> 			pix->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pix->colorspace);
> 		if (pix->ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT)
> 			pix->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(pix->colorspace);
> 		if (pix->quantization == V4L2_QUANTIZATION_DEFAULT)
> 			pix->quantization =
> 				V4L2_MAP_QUANTIZATION_DEFAULT(false, pix->colorspace,
> 							      pix->ycbcr_enc);
> 	} else {
> 		/*
> 		 * The DW100 can't perform colorspace conversion, the colorspace
> 		 * on the capture queue must be identical to the output queue.
> 		 */
> 		const struct dw100_q_data *q_data =
> 			dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> 
> 		pix->colorspace = q_data->pix_fmt.colorspace;
> 		pix->xfer_func = q_data->pix_fmt.xfer_func;
> 		pix->ycbcr_enc = q_data->pix_fmt.ycbcr_enc;
> 		pix->quantization = q_data->pix_fmt.quantization;
> 	}
> 
> (There should really be a helper for the first branch of the if, and
> actually something for the second branch too)
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_s_fmt(struct dw100_ctx *ctx, struct v4l2_format *f)
>> +{
>> +	struct dw100_q_data *q_data;
>> +	struct vb2_queue *vq;
>> +
>> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
>> +	if (!vq)
>> +		return -EINVAL;
>> +
>> +	q_data = dw100_get_q_data(ctx, f->type);
>> +	if (!q_data)
>> +		return -EINVAL;
>> +
>> +	if (vb2_is_busy(vq)) {
>> +		dev_dbg(&ctx->dw_dev->pdev->dev, "%s queue busy\n", __func__);
>> +		return -EBUSY;
>> +	}
>> +
>> +	q_data->fmt = dw100_find_format(f);
>> +	q_data->pix_fmt = f->fmt.pix_mp;
>> +	q_data->crop.top = 0;
>> +	q_data->crop.left = 0;
>> +	q_data->crop.width = f->fmt.pix_mp.width;
>> +	q_data->crop.height = f->fmt.pix_mp.height;
>> +
>> +	/* Propagate buffers encoding */
>> +
>> +	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>> +		struct dw100_q_data *dst_q_data =
>> +			dw100_get_q_data(ctx,
>> +					 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +
>> +		dst_q_data->pix_fmt.colorspace = q_data->pix_fmt.colorspace;
>> +		dst_q_data->pix_fmt.ycbcr_enc = q_data->pix_fmt.ycbcr_enc;
>> +		dst_q_data->pix_fmt.quantization = q_data->pix_fmt.quantization;
>> +		dst_q_data->pix_fmt.xfer_func = q_data->pix_fmt.xfer_func;
> 
> Similar to the question above, should a M2M device propagate the full
> format from output to capture ? Hans ?

Not the full format, but enough to keep the current capture format
valid for the new output format.

V4L2 does not specify exactly what should happen, other than that
the state of the formats (output and capture) must be valid for the
hardware. It is up to the driver to decide whether to copy the
output format to the capture format, or just update the fields
required to keep things consistent (the colorimetry fields in this case).

In general the preference is to make the minimum amount of changes
to keep things valid, and I think that makes sense as well for this
driver.

Regards,

	Hans

> 
>> +	}
>> +
>> +	dev_dbg(&ctx->dw_dev->pdev->dev,
>> +		"Setting format for type %u, wxh: %ux%u, fmt: %u\n",
> 
> %p4cc for the pixel format
> 
>> +		f->type, q_data->pix_fmt.width, q_data->pix_fmt.height,
>> +		q_data->pix_fmt.pixelformat);
> 
> And this needs to become
> 
> 		&q_data->pix_fmt.pixelformat);
> 
> There's at least one other location where this could be done too.
> 
>> +
>> +	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>> +		int ret;
>> +		u32 dims[V4L2_CTRL_MAX_DIMS] = {};
>> +		struct v4l2_ctrl *ctrl = ctx->ctrls[DW100_CTRL_DEWARPING_MAP];
>> +
>> +		dims[0] =
>> +			dw100_get_n_vertices_from_length(q_data->pix_fmt.width);
>> +		dims[1] =
>> +			dw100_get_n_vertices_from_length(q_data->pix_fmt.height);
> 
> This is one of the cases where I think it's totally fine to go over the
> 80 columns limit to 82 :-)
> 
> I trust that the next version will address all these comments correctly,
> so
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> +
>> +		v4l2_ctrl_lock(ctrl);
>> +		ctx->user_map_is_valid = false;
>> +		ret = __v4l2_ctrl_modify_dimensions(ctrl, dims);
>> +		v4l2_ctrl_unlock(ctrl);
>> +
>> +		if (ret) {
>> +			dev_err(&ctx->dw_dev->pdev->dev,
>> +				"Modifying LUT dimensions failed with error %d\n",
>> +				ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_try_fmt_vid_cap(struct file *file, void *priv,
>> +				 struct v4l2_format *f)
>> +{
>> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>> +		return -EINVAL;
>> +
>> +	return dw100_try_fmt(f);
>> +}
>> +
>> +static int dw100_s_fmt_vid_cap(struct file *file, void *priv,
>> +			       struct v4l2_format *f)
>> +{
>> +	struct dw100_ctx *ctx = dw100_file2ctx(file);
>> +	int ret;
>> +
>> +	ret = dw100_try_fmt_vid_cap(file, priv, f);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = dw100_s_fmt(ctx, f);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_try_fmt_vid_out(struct file *file, void *priv,
>> +				 struct v4l2_format *f)
>> +{
>> +	if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> +		return -EINVAL;
>> +
>> +	return dw100_try_fmt(f);
>> +}
>> +
>> +static int dw100_s_fmt_vid_out(struct file *file, void *priv,
>> +			       struct v4l2_format *f)
>> +{
>> +	struct dw100_ctx *ctx = dw100_file2ctx(file);
>> +	int ret;
>> +
>> +	ret = dw100_try_fmt_vid_out(file, priv, f);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = dw100_s_fmt(ctx, f);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_g_selection(struct file *file, void *fh,
>> +			     struct v4l2_selection *sel)
>> +{
>> +	struct dw100_ctx *ctx = dw100_file2ctx(file);
>> +	struct dw100_q_data *src_q_data;
>> +
>> +	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
>> +		return -EINVAL;
>> +
>> +	src_q_data = dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +
>> +	switch (sel->target) {
>> +	case V4L2_SEL_TGT_CROP_DEFAULT:
>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>> +		sel->r.top = 0;
>> +		sel->r.left = 0;
>> +		sel->r.width = src_q_data->pix_fmt.width;
>> +		sel->r.height = src_q_data->pix_fmt.height;
>> +		break;
>> +	case V4L2_SEL_TGT_CROP:
>> +		sel->r.top = src_q_data->crop.top;
>> +		sel->r.left = src_q_data->crop.left;
>> +		sel->r.width = src_q_data->crop.width;
>> +		sel->r.height = src_q_data->crop.height;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_s_selection(struct file *file, void *fh,
>> +			     struct v4l2_selection *sel)
>> +{
>> +	struct dw100_ctx *ctx = dw100_file2ctx(file);
>> +	struct dw100_q_data *src_q_data;
>> +	u32 qscalex, qscaley, qscale;
>> +	int x, y, w, h;
>> +	unsigned int wframe, hframe;
>> +
>> +	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
>> +		return -EINVAL;
>> +
>> +	src_q_data = dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +
>> +	dev_dbg(&ctx->dw_dev->pdev->dev,
>> +		">>> Buffer Type: %u Target: %u Rect: %ux%u@%d.%d\n",
>> +		sel->type, sel->target,
>> +		sel->r.width, sel->r.height, sel->r.left, sel->r.top);
>> +
>> +	switch (sel->target) {
>> +	case V4L2_SEL_TGT_CROP:
>> +		wframe = src_q_data->pix_fmt.width;
>> +		hframe = src_q_data->pix_fmt.height;
>> +
>> +		sel->r.top = clamp_t(int, sel->r.top, 0, hframe - DW100_MIN_H);
>> +		sel->r.left = clamp_t(int, sel->r.left, 0, wframe - DW100_MIN_W);
>> +		sel->r.height =
>> +			clamp(sel->r.height, DW100_MIN_H, hframe - sel->r.top);
>> +		sel->r.width =
>> +			clamp(sel->r.width, DW100_MIN_W, wframe - sel->r.left);
>> +
>> +		/* UQ16.16 for float operations */
>> +		qscalex = (sel->r.width << 16) / wframe;
>> +		qscaley = (sel->r.height << 16) / hframe;
>> +		y = sel->r.top;
>> +		x = sel->r.left;
>> +		if (qscalex == qscaley) {
>> +			qscale = qscalex;
>> +		} else {
>> +			switch (sel->flags) {
>> +			case 0:
>> +				qscale = (qscalex + qscaley) / 2;
>> +				break;
>> +			case V4L2_SEL_FLAG_GE:
>> +				qscale = max(qscaley, qscalex);
>> +				break;
>> +			case V4L2_SEL_FLAG_LE:
>> +				qscale = min(qscaley, qscalex);
>> +				break;
>> +			case V4L2_SEL_FLAG_LE | V4L2_SEL_FLAG_GE:
>> +				return -ERANGE;
>> +			default:
>> +				return -EINVAL;
>> +			}
>> +		}
>> +
>> +		w = (u32)((((u64)wframe << 16) * qscale) >> 32);
>> +		h = (u32)((((u64)hframe << 16) * qscale) >> 32);
>> +		x = x + (sel->r.width  - w) / 2;
>> +		y = y + (sel->r.height  - h) / 2;
>> +		x = min(wframe - w, (unsigned int)max(0, x));
>> +		y = min(hframe - h, (unsigned int)max(0, y));
>> +
>> +		sel->r.top = y;
>> +		sel->r.left = x;
>> +		sel->r.width = w;
>> +		sel->r.height = h;
>> +
>> +		src_q_data->crop.top = sel->r.top;
>> +		src_q_data->crop.left = sel->r.left;
>> +		src_q_data->crop.width = sel->r.width;
>> +		src_q_data->crop.height = sel->r.height;
>> +		break;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	dev_dbg(&ctx->dw_dev->pdev->dev,
>> +		"<<< Buffer Type: %u Target: %u Rect: %ux%u@%d.%d\n",
>> +		sel->type, sel->target,
>> +		sel->r.width, sel->r.height, sel->r.left, sel->r.top);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_ioctl_ops dw100_ioctl_ops = {
>> +	.vidioc_querycap		= dw100_querycap,
>> +
>> +	.vidioc_enum_fmt_vid_cap	= dw100_enum_fmt_vid,
>> +	.vidioc_enum_framesizes		= dw100_enum_framesizes,
>> +	.vidioc_g_fmt_vid_cap_mplane	= dw100_g_fmt_vid,
>> +	.vidioc_try_fmt_vid_cap_mplane	= dw100_try_fmt_vid_cap,
>> +	.vidioc_s_fmt_vid_cap_mplane	= dw100_s_fmt_vid_cap,
>> +
>> +	.vidioc_enum_fmt_vid_out	= dw100_enum_fmt_vid,
>> +	.vidioc_g_fmt_vid_out_mplane	= dw100_g_fmt_vid,
>> +	.vidioc_try_fmt_vid_out_mplane	= dw100_try_fmt_vid_out,
>> +	.vidioc_s_fmt_vid_out_mplane	= dw100_s_fmt_vid_out,
>> +
>> +	.vidioc_g_selection		= dw100_g_selection,
>> +	.vidioc_s_selection		= dw100_s_selection,
>> +	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
>> +	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
>> +	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
>> +	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
>> +	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
>> +	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
>> +	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
>> +
>> +	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
>> +	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
>> +
>> +	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
>> +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
>> +};
>> +
>> +static void dw100_job_finish(struct dw100_device *dw_dev, bool with_error)
>> +{
>> +	struct dw100_ctx *curr_ctx;
>> +	struct vb2_v4l2_buffer *src_vb, *dst_vb;
>> +	enum vb2_buffer_state buf_state;
>> +
>> +	curr_ctx = v4l2_m2m_get_curr_priv(dw_dev->m2m_dev);
>> +
>> +	if (!curr_ctx) {
>> +		dev_err(&dw_dev->pdev->dev,
>> +			"Instance released before the end of transaction\n");
>> +		return;
>> +	}
>> +
>> +	src_vb = v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
>> +	dst_vb = v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
>> +
>> +	if (likely(!with_error))
>> +		buf_state = VB2_BUF_STATE_DONE;
>> +	else
>> +		buf_state = VB2_BUF_STATE_ERROR;
>> +
>> +	v4l2_m2m_buf_done(src_vb, buf_state);
>> +	v4l2_m2m_buf_done(dst_vb, buf_state);
>> +
>> +	dev_dbg(&dw_dev->pdev->dev, "Finishing transaction with%s error(s)\n",
>> +		with_error ? "" : "out");
>> +
>> +	v4l2_m2m_job_finish(dw_dev->m2m_dev, curr_ctx->fh.m2m_ctx);
>> +}
>> +
>> +static void dw100_hw_reset(struct dw100_device *dw_dev)
>> +{
>> +	u32 val;
>> +
>> +	val = dw100_read(dw_dev, DW100_DEWARP_CTRL);
>> +	val |= DW100_DEWARP_CTRL_ENABLE;
>> +	val |= DW100_DEWARP_CTRL_SOFT_RESET;
>> +	dw100_write(dw_dev, DW100_DEWARP_CTRL, val);
>> +	val &= ~DW100_DEWARP_CTRL_SOFT_RESET;
>> +	dw100_write(dw_dev, DW100_DEWARP_CTRL, val);
>> +}
>> +
>> +static void _dw100_hw_set_master_bus_enable(struct dw100_device *dw_dev,
>> +					    unsigned int enable)
>> +{
>> +	u32 val;
>> +
>> +	dev_dbg(&dw_dev->pdev->dev, "%sable master bus\n",
>> +		enable ? "En" : "Dis");
>> +
>> +	val = dw100_read(dw_dev, DW100_BUS_CTRL);
>> +
>> +	if (enable)
>> +		val |= DW100_BUS_CTRL_AXI_MASTER_ENABLE;
>> +	else
>> +		val &= ~DW100_BUS_CTRL_AXI_MASTER_ENABLE;
>> +
>> +	dw100_write(dw_dev, DW100_BUS_CTRL, val);
>> +}
>> +
>> +static void dw100_hw_master_bus_enable(struct dw100_device *dw_dev)
>> +{
>> +	_dw100_hw_set_master_bus_enable(dw_dev, 1);
>> +}
>> +
>> +static void dw100_hw_master_bus_disable(struct dw100_device *dw_dev)
>> +{
>> +	_dw100_hw_set_master_bus_enable(dw_dev, 0);
>> +}
>> +
>> +static void dw100_hw_dewarp_start(struct dw100_device *dw_dev)
>> +{
>> +	u32 val;
>> +
>> +	val = dw100_read(dw_dev, DW100_DEWARP_CTRL);
>> +
>> +	dev_dbg(&dw_dev->pdev->dev, "Starting Hardware CTRL:0x%08x\n", val);
>> +	dw100_write(dw_dev, DW100_DEWARP_CTRL, val | DW100_DEWARP_CTRL_START);
>> +	dw100_write(dw_dev, DW100_DEWARP_CTRL, val);
>> +}
>> +
>> +static void dw100_hw_init_ctrl(struct dw100_device *dw_dev)
>> +{
>> +	u32 val;
>> +	/*
>> +	 * Input format YUV422_SP
>> +	 * Output format YUV422_SP
>> +	 * No hardware handshake (SW)
>> +	 * No automatic double src buffering (Single)
>> +	 * No automatic double dst buffering (Single)
>> +	 * No Black Line
>> +	 * Prefetch image pixel traversal
>> +	 */
>> +
>> +	val = DW100_DEWARP_CTRL_ENABLE
>> +	    /* Valid only for auto prefetch mode*/
>> +	    | DW100_DEWARP_CTRL_PREFETCH_THRESHOLD(32);
>> +
>> +	/*
>> +	 * Calculation mode required to support any scaling factor,
>> +	 * but x4 slower than traversal mode.
>> +	 *
>> +	 * DW100_DEWARP_CTRL_PREFETCH_MODE_TRAVERSAL
>> +	 * DW100_DEWARP_CTRL_PREFETCH_MODE_CALCULATION
>> +	 * DW100_DEWARP_CTRL_PREFETCH_MODE_AUTO
>> +	 *
>> +	 * TODO: Find heuristics requiring calculation mode
>> +	 */
>> +	val |= DW100_DEWARP_CTRL_PREFETCH_MODE_CALCULATION;
>> +
>> +	dw100_write(dw_dev, DW100_DEWARP_CTRL, val);
>> +}
>> +
>> +static void dw100_hw_set_pixel_boundary(struct dw100_device *dw_dev)
>> +{
>> +	u32 val;
>> +
>> +	val = DW100_BOUNDARY_PIXEL_V(128)
>> +		| DW100_BOUNDARY_PIXEL_U(128)
>> +		| DW100_BOUNDARY_PIXEL_Y(0);
>> +
>> +	dw100_write(dw_dev, DW100_BOUNDARY_PIXEL, val);
>> +}
>> +
>> +static void dw100_hw_set_scale(struct dw100_device *dw_dev, u8 scale)
>> +{
>> +	dev_dbg(&dw_dev->pdev->dev, "Setting scale factor to %u\n", scale);
>> +
>> +	dw100_write(dw_dev, DW100_SCALE_FACTOR, scale);
>> +}
>> +
>> +static void dw100_hw_set_roi(struct dw100_device *dw_dev, u32 x, u32 y)
>> +{
>> +	u32 val;
>> +
>> +	dev_dbg(&dw_dev->pdev->dev, "Setting ROI region to %u.%u\n", x, y);
>> +
>> +	val = DW100_ROI_START_X(x) | DW100_ROI_START_Y(y);
>> +
>> +	dw100_write(dw_dev, DW100_ROI_START, val);
>> +}
>> +
>> +static void dw100_hw_set_src_crop(struct dw100_device *dw_dev,
>> +				  const struct dw100_q_data *src_q_data,
>> +				  const struct dw100_q_data *dst_q_data)
>> +{
>> +	const struct v4l2_rect *rect = &src_q_data->crop;
>> +	u32 src_scale, qscale, left_scale, top_scale;
>> +
>> +	/* HW Scale is UQ1.7 encoded */
>> +	src_scale = (rect->width << 7) / src_q_data->pix_fmt.width;
>> +	dw100_hw_set_scale(dw_dev, src_scale);
>> +
>> +	qscale = (dst_q_data->pix_fmt.width << 7)  / src_q_data->pix_fmt.width;
>> +
>> +	left_scale = ((rect->left << 7) * qscale) >> 14;
>> +	top_scale = ((rect->top << 7) * qscale) >> 14;
>> +
>> +	dw100_hw_set_roi(dw_dev, left_scale, top_scale);
>> +}
>> +
>> +static void dw100_hw_set_source(struct dw100_device *dw_dev,
>> +				const struct dw100_q_data *q_data,
>> +				struct vb2_buffer *buffer)
>> +{
>> +	u32 width, height, stride, fourcc, val;
>> +	const struct dw100_fmt *fmt = q_data->fmt;
>> +	dma_addr_t addr_y = vb2_dma_contig_plane_dma_addr(buffer, 0);
>> +	dma_addr_t addr_uv;
>> +
>> +	width =  q_data->pix_fmt.width;
>> +	height = q_data->pix_fmt.height;
>> +	stride = q_data->pix_fmt.plane_fmt[0].bytesperline;
>> +	fourcc = q_data->fmt->fourcc;
>> +
>> +	if (q_data->pix_fmt.num_planes == 2)
>> +		addr_uv = vb2_dma_contig_plane_dma_addr(buffer, 1);
>> +	else
>> +		addr_uv = addr_y + (stride * height);
>> +
>> +	dev_dbg(&dw_dev->pdev->dev,
>> +		"Set HW source registers for %ux%u - stride %u, pixfmt: %x, dma:%pad\n",
>> +		width, height, stride, fourcc, &addr_y);
>> +
>> +	/* Pixel Format */
>> +	val = dw100_read(dw_dev, DW100_DEWARP_CTRL);
>> +
>> +	val &= ~DW100_DEWARP_CTRL_INPUT_FORMAT_MASK;
>> +	val |= DW100_DEWARP_CTRL_INPUT_FORMAT(fmt->reg_format);
>> +
>> +	dw100_write(dw_dev, DW100_DEWARP_CTRL, val);
>> +
>> +	/* Swap */
>> +	val = dw100_read(dw_dev, DW100_SWAP_CONTROL);
>> +
>> +	val &= ~DW100_SWAP_CONTROL_SRC_MASK;
>> +	/*
>> +	 * Data swapping is performed only on Y plane for source image.
>> +	 */
>> +	if (fmt->reg_swap_uv &&
>> +	    fmt->reg_format == DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED)
>> +		val |= DW100_SWAP_CONTROL_SRC(DW100_SWAP_CONTROL_Y
>> +					      (DW100_SWAP_CONTROL_BYTE));
>> +
>> +	dw100_write(dw_dev, DW100_SWAP_CONTROL, val);
>> +
>> +	/* Image resolution */
>> +	dw100_write(dw_dev, DW100_SRC_IMG_SIZE,
>> +		    DW100_IMG_SIZE_WIDTH(width) | DW100_IMG_SIZE_HEIGHT(height));
>> +
>> +	dw100_write(dw_dev,  DW100_SRC_IMG_STRIDE, stride);
>> +
>> +	/* Buffers */
>> +	dw100_write(dw_dev, DW100_SRC_IMG_Y_BASE, DW100_IMG_Y_BASE(addr_y));
>> +	dw100_write(dw_dev, DW100_SRC_IMG_UV_BASE, DW100_IMG_UV_BASE(addr_uv));
>> +}
>> +
>> +static void dw100_hw_set_destination(struct dw100_device *dw_dev,
>> +				     const struct dw100_q_data *q_data,
>> +				     const struct dw100_fmt *ifmt,
>> +				     struct vb2_buffer *buffer)
>> +{
>> +	u32 width, height, stride, fourcc, val, size_y, size_uv;
>> +	const struct dw100_fmt *fmt = q_data->fmt;
>> +	dma_addr_t addr_y, addr_uv;
>> +
>> +	width =  q_data->pix_fmt.width;
>> +	height = q_data->pix_fmt.height;
>> +	stride = q_data->pix_fmt.plane_fmt[0].bytesperline;
>> +	fourcc = fmt->fourcc;
>> +
>> +	addr_y = vb2_dma_contig_plane_dma_addr(buffer, 0);
>> +	size_y = q_data->pix_fmt.plane_fmt[0].sizeimage;
>> +
>> +	if (q_data->pix_fmt.num_planes == 2) {
>> +		addr_uv = vb2_dma_contig_plane_dma_addr(buffer, 1);
>> +		size_uv = q_data->pix_fmt.plane_fmt[1].sizeimage;
>> +	} else {
>> +		addr_uv = addr_y + ALIGN(stride * height, 16);
>> +		size_uv = size_y;
>> +		if (fmt->reg_format == DW100_DEWARP_CTRL_FORMAT_YUV420_SP)
>> +			size_uv /= 2;
>> +	}
>> +
>> +	dev_dbg(&dw_dev->pdev->dev,
>> +		"Set HW source registers for %ux%u - stride %u, pixfmt: %x, dma:%pad\n",
>> +		width, height, stride, fourcc, &addr_y);
>> +
>> +	/* Pixel Format */
>> +	val = dw100_read(dw_dev, DW100_DEWARP_CTRL);
>> +
>> +	val &= ~DW100_DEWARP_CTRL_OUTPUT_FORMAT_MASK;
>> +	val |= DW100_DEWARP_CTRL_OUTPUT_FORMAT(fmt->reg_format);
>> +
>> +	dw100_write(dw_dev, DW100_DEWARP_CTRL, val);
>> +
>> +	/* Swap */
>> +	val = dw100_read(dw_dev, DW100_SWAP_CONTROL);
>> +
>> +	val &= ~DW100_SWAP_CONTROL_DST_MASK;
>> +
>> +	/*
>> +	 * Avoid to swap twice
>> +	 */
>> +	if (fmt->reg_swap_uv ^
>> +	    (ifmt->reg_swap_uv && ifmt->reg_format !=
>> +	     DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED)) {
>> +		if (fmt->reg_format == DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED)
>> +			val |= DW100_SWAP_CONTROL_DST(DW100_SWAP_CONTROL_Y
>> +						      (DW100_SWAP_CONTROL_BYTE));
>> +		else
>> +			val |= DW100_SWAP_CONTROL_DST(DW100_SWAP_CONTROL_UV
>> +						      (DW100_SWAP_CONTROL_BYTE));
>> +	}
>> +
>> +	dw100_write(dw_dev, DW100_SWAP_CONTROL, val);
>> +
>> +	/* Image resolution */
>> +	dw100_write(dw_dev, DW100_DST_IMG_SIZE,
>> +		    DW100_IMG_SIZE_WIDTH(width) | DW100_IMG_SIZE_HEIGHT(height));
>> +	dw100_write(dw_dev, DW100_DST_IMG_STRIDE, stride);
>> +	dw100_write(dw_dev, DW100_DST_IMG_Y_BASE, DW100_IMG_Y_BASE(addr_y));
>> +	dw100_write(dw_dev, DW100_DST_IMG_UV_BASE, DW100_IMG_UV_BASE(addr_uv));
>> +	dw100_write(dw_dev, DW100_DST_IMG_Y_SIZE1, DW100_DST_IMG_Y_SIZE(size_y));
>> +	dw100_write(dw_dev, DW100_DST_IMG_UV_SIZE1,
>> +		    DW100_DST_IMG_UV_SIZE(size_uv));
>> +}
>> +
>> +static void dw100_hw_set_mapping(struct dw100_device *dw_dev, dma_addr_t addr,
>> +				 u32 width, u32 height)
>> +{
>> +	dev_dbg(&dw_dev->pdev->dev,
>> +		"Set HW mapping registers for %ux%u addr:%pad",
>> +		width, height, &addr);
>> +
>> +	dw100_write(dw_dev, DW100_MAP_LUT_ADDR, DW100_MAP_LUT_ADDR_ADDR(addr));
>> +	dw100_write(dw_dev, DW100_MAP_LUT_SIZE, DW100_MAP_LUT_SIZE_WIDTH(width)
>> +		    | DW100_MAP_LUT_SIZE_HEIGHT(height));
>> +}
>> +
>> +static void dw100_hw_clear_irq(struct dw100_device *dw_dev, unsigned int irq)
>> +{
>> +	dw100_write(dw_dev, DW100_INTERRUPT_STATUS,
>> +		    DW100_INTERRUPT_STATUS_INT_CLEAR(irq));
>> +}
>> +
>> +static void dw100_hw_enable_irq(struct dw100_device *dw_dev)
>> +{
>> +	dw100_write(dw_dev, DW100_INTERRUPT_STATUS,
>> +		    DW100_INTERRUPT_STATUS_INT_ENABLE_MASK);
>> +}
>> +
>> +static void dw100_hw_disable_irq(struct dw100_device *dw_dev)
>> +{
>> +	dw100_write(dw_dev, DW100_INTERRUPT_STATUS, 0);
>> +}
>> +
>> +static u32 dw_hw_get_pending_irqs(struct dw100_device *dw_dev)
>> +{
>> +	u32 val;
>> +
>> +	val = dw100_read(dw_dev, DW100_INTERRUPT_STATUS);
>> +
>> +	return DW100_INTERRUPT_STATUS_INT_STATUS(val);
>> +}
>> +
>> +static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
>> +{
>> +	struct dw100_device *dw_dev = dev_id;
>> +	u32 pending_irqs, err_irqs, frame_done_irq;
>> +	bool with_error = true;
>> +
>> +	pending_irqs = dw_hw_get_pending_irqs(dw_dev);
>> +	frame_done_irq = pending_irqs & DW100_INTERRUPT_STATUS_INT_FRAME_DONE;
>> +	err_irqs = DW100_INTERRUPT_STATUS_INT_ERR_STATUS(pending_irqs);
>> +
>> +	if (frame_done_irq) {
>> +		dev_dbg(&dw_dev->pdev->dev, "Frame done interrupt\n");
>> +		with_error = false;
>> +		err_irqs &= ~DW100_INTERRUPT_STATUS_INT_ERR_STATUS
>> +			(DW100_INTERRUPT_STATUS_INT_ERR_FRAME_DONE);
>> +	}
>> +
>> +	if (err_irqs)
>> +		dev_err(&dw_dev->pdev->dev, "Interrupt error: %#x\n", err_irqs);
>> +
>> +	dw100_hw_disable_irq(dw_dev);
>> +	dw100_hw_master_bus_disable(dw_dev);
>> +	dw100_hw_clear_irq(dw_dev, pending_irqs |
>> +			   DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT);
>> +
>> +	dw100_job_finish(dw_dev, with_error);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>> +			struct vb2_v4l2_buffer *out_vb)
>> +{
>> +	struct dw100_device *dw_dev = ctx->dw_dev;
>> +
>> +	out_vb->sequence =
>> +		dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)->sequence++;
>> +	in_vb->sequence =
>> +		dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)->sequence++;
>> +
>> +	dev_dbg(&ctx->dw_dev->pdev->dev,
>> +		"Starting queues %p->%p, sequence %u->%u\n",
>> +		v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
>> +				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE),
>> +		v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
>> +				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE),
>> +		in_vb->sequence, out_vb->sequence);
>> +
>> +	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, true);
>> +
>> +	/* Now, let's deal with hardware ... */
>> +	dw100_hw_master_bus_disable(dw_dev);
>> +	dw100_hw_init_ctrl(dw_dev);
>> +	dw100_hw_set_pixel_boundary(dw_dev);
>> +	dw100_hw_set_src_crop(dw_dev, &ctx->q_data[DW100_QUEUE_SRC],
>> +			      &ctx->q_data[DW100_QUEUE_DST]);
>> +	dw100_hw_set_source(dw_dev, &ctx->q_data[DW100_QUEUE_SRC],
>> +			    &in_vb->vb2_buf);
>> +	dw100_hw_set_destination(dw_dev, &ctx->q_data[DW100_QUEUE_DST],
>> +				 ctx->q_data[DW100_QUEUE_SRC].fmt,
>> +				 &out_vb->vb2_buf);
>> +	dw100_hw_set_mapping(dw_dev, ctx->map_dma,
>> +			     ctx->map_width, ctx->map_height);
>> +	dw100_hw_enable_irq(dw_dev);
>> +	dw100_hw_dewarp_start(dw_dev);
>> +
>> +	/* Enable Bus */
>> +	dw100_hw_master_bus_enable(dw_dev);
>> +}
>> +
>> +static void dw100_device_run(void *priv)
>> +{
>> +	struct dw100_ctx *ctx = priv;
>> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>> +
>> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>> +
>> +	dw100_start(ctx, src_buf, dst_buf);
>> +}
>> +
>> +static const struct v4l2_m2m_ops dw100_m2m_ops = {
>> +	.device_run	= dw100_device_run,
>> +};
>> +
>> +static struct video_device *dw100_init_video_device(struct dw100_device *dw_dev)
>> +{
>> +	struct video_device *vfd = &dw_dev->vfd;
>> +
>> +	vfd->vfl_dir = VFL_DIR_M2M;
>> +	vfd->fops = &dw100_fops;
>> +	vfd->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>> +	vfd->ioctl_ops = &dw100_ioctl_ops;
>> +	vfd->minor = -1;
>> +	vfd->release = video_device_release_empty;
>> +	vfd->v4l2_dev = &dw_dev->v4l2_dev;
>> +	vfd->lock = &dw_dev->vfd_mutex;
>> +
>> +	strscpy(vfd->name, DRV_NAME, sizeof(vfd->name));
>> +	mutex_init(vfd->lock);
>> +	video_set_drvdata(vfd, dw_dev);
>> +
>> +	return vfd;
>> +}
>> +
>> +static int dw100_dump_regs_show(struct seq_file *m, void *private)
>> +{
>> +	struct dw100_device *dw_dev = m->private;
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(&dw_dev->pdev->dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = dw100_dump_regs(m);
>> +
>> +	pm_runtime_put_sync(&dw_dev->pdev->dev);
>> +
>> +	return ret;
>> +}
>> +DEFINE_SHOW_ATTRIBUTE(dw100_dump_regs);
>> +
>> +static void dw100_debugfs_init(struct dw100_device *dw_dev)
>> +{
>> +	dw_dev->debugfs_root =
>> +		debugfs_create_dir(dev_name(&dw_dev->pdev->dev), NULL);
>> +
>> +	debugfs_create_file("dump_regs", 0600, dw_dev->debugfs_root, dw_dev,
>> +			    &dw100_dump_regs_fops);
>> +}
>> +
>> +static void dw100_debugfs_exit(struct dw100_device *dw_dev)
>> +{
>> +	debugfs_remove_recursive(dw_dev->debugfs_root);
>> +}
>> +
>> +static int dw100_probe(struct platform_device *pdev)
>> +{
>> +	struct dw100_device *dw_dev;
>> +	struct video_device *vfd;
>> +	struct resource *res;
>> +	int ret, irq;
>> +
>> +	dw_dev = devm_kzalloc(&pdev->dev, sizeof(*dw_dev), GFP_KERNEL);
>> +	if (!dw_dev)
>> +		return -ENOMEM;
>> +	dw_dev->pdev = pdev;
>> +
>> +	ret = devm_clk_bulk_get_all(&pdev->dev, &dw_dev->clks);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Unable to get clocks: %d\n", ret);
>> +		return ret;
>> +	}
>> +	dw_dev->num_clks = ret;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	dw_dev->mmio = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(dw_dev->mmio))
>> +		return PTR_ERR(dw_dev->mmio);
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0)
>> +		return irq;
>> +
>> +	platform_set_drvdata(pdev, dw_dev);
>> +
>> +	pm_runtime_enable(&pdev->dev);
>> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Unable to resume the device: %d\n", ret);
>> +		goto err_pm;
>> +	}
>> +
>> +	pm_runtime_put_sync(&pdev->dev);
>> +
>> +	ret = devm_request_irq(&pdev->dev, irq, dw100_irq_handler, IRQF_ONESHOT,
>> +			       dev_name(&pdev->dev), dw_dev);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = v4l2_device_register(&pdev->dev, &dw_dev->v4l2_dev);
>> +	if (ret)
>> +		goto err_pm;
>> +
>> +	vfd = dw100_init_video_device(dw_dev);
>> +
>> +	dw_dev->m2m_dev = v4l2_m2m_init(&dw100_m2m_ops);
>> +	if (IS_ERR(dw_dev->m2m_dev)) {
>> +		dev_err(&pdev->dev, "Failed to init mem2mem device\n");
>> +		ret = PTR_ERR(dw_dev->m2m_dev);
>> +		goto err_v4l2;
>> +	}
>> +
>> +	dw_dev->mdev.dev = &pdev->dev;
>> +	strscpy(dw_dev->mdev.model, "dw100", sizeof(dw_dev->mdev.model));
>> +	media_device_init(&dw_dev->mdev);
>> +	dw_dev->v4l2_dev.mdev = &dw_dev->mdev;
>> +
>> +	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Failed to register video device\n");
>> +		goto err_m2m;
>> +	}
>> +
>> +	ret = v4l2_m2m_register_media_controller(dw_dev->m2m_dev, vfd,
>> +						 MEDIA_ENT_F_PROC_VIDEO_SCALER);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Failed to init mem2mem media controller\n");
>> +		goto error_v4l2;
>> +	}
>> +
>> +	ret = media_device_register(&dw_dev->mdev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Failed to register mem2mem media device\n");
>> +		goto error_m2m_mc;
>> +	}
>> +
>> +	dw100_debugfs_init(dw_dev);
>> +
>> +	dev_info(&pdev->dev,
>> +		 "dw100 v4l2 m2m registered as /dev/video%u\n", vfd->num);
>> +
>> +	return 0;
>> +
>> +error_m2m_mc:
>> +	v4l2_m2m_unregister_media_controller(dw_dev->m2m_dev);
>> +error_v4l2:
>> +	video_unregister_device(vfd);
>> +err_m2m:
>> +	v4l2_m2m_release(dw_dev->m2m_dev);
>> +err_v4l2:
>> +	v4l2_device_unregister(&dw_dev->v4l2_dev);
>> +err_pm:
>> +	pm_runtime_disable(&pdev->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static int dw100_remove(struct platform_device *pdev)
>> +{
>> +	struct dw100_device *dw_dev = platform_get_drvdata(pdev);
>> +
>> +	dw100_debugfs_exit(dw_dev);
>> +
>> +	pm_runtime_disable(&pdev->dev);
>> +
>> +	media_device_unregister(&dw_dev->mdev);
>> +	v4l2_m2m_unregister_media_controller(dw_dev->m2m_dev);
>> +	media_device_cleanup(&dw_dev->mdev);
>> +
>> +	video_unregister_device(&dw_dev->vfd);
>> +	mutex_destroy(dw_dev->vfd.lock);
>> +	v4l2_m2m_release(dw_dev->m2m_dev);
>> +	v4l2_device_unregister(&dw_dev->v4l2_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused dw100_runtime_suspend(struct device *dev)
>> +{
>> +	struct dw100_device *dw_dev = dev_get_drvdata(dev);
>> +
>> +	clk_bulk_disable_unprepare(dw_dev->num_clks, dw_dev->clks);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused dw100_runtime_resume(struct device *dev)
>> +{
>> +	int ret;
>> +	struct dw100_device *dw_dev = dev_get_drvdata(dev);
>> +
>> +	ret = clk_bulk_prepare_enable(dw_dev->num_clks, dw_dev->clks);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	dw100_hw_reset(dw_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops dw100_pm = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +				pm_runtime_force_resume)
>> +	SET_RUNTIME_PM_OPS(dw100_runtime_suspend,
>> +			   dw100_runtime_resume, NULL)
>> +};
>> +
>> +static const struct of_device_id dw100_dt_ids[] = {
>> +	{ .compatible = "nxp,imx8mp-dw100", .data = NULL },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, dw100_dt_ids);
>> +
>> +static struct platform_driver dw100_driver = {
>> +	.probe		= dw100_probe,
>> +	.remove		= dw100_remove,
>> +	.driver		= {
>> +		.name	= DRV_NAME,
>> +		.pm = &dw100_pm,
>> +		.of_match_table = dw100_dt_ids,
>> +	},
>> +};
>> +
>> +module_platform_driver(dw100_driver);
>> +
>> +MODULE_DESCRIPTION("DW100 Hardware dewarper");
>> +MODULE_AUTHOR("Xavier Roumegue <Xavier.Roumegue@oss.nxp.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/nxp/dw100/dw100_regs.h b/drivers/media/platform/nxp/dw100/dw100_regs.h
>> new file mode 100644
>> index 000000000000..e85dfeff9056
>> --- /dev/null
>> +++ b/drivers/media/platform/nxp/dw100/dw100_regs.h
>> @@ -0,0 +1,117 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * DW100 Hardware dewarper
>> + *
>> + * Copyright 2022 NXP
>> + * Author: Xavier Roumegue (xavier.roumegue@oss.nxp.com)
>> + */
>> +
>> +#ifndef _DW100_REGS_H_
>> +#define _DW100_REGS_H_
>> +
>> +/* AHB register offset */
>> +#define DW100_DEWARP_ID			0x00
>> +#define DW100_DEWARP_CTRL		0x04
>> +#define DW100_DEWARP_CTRL_ENABLE			BIT(0)
>> +#define DW100_DEWARP_CTRL_START				BIT(1)
>> +#define DW100_DEWARP_CTRL_SOFT_RESET			BIT(2)
>> +#define DW100_DEWARP_CTRL_FORMAT_YUV422_SP		0UL
>> +#define DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED		1UL
>> +#define DW100_DEWARP_CTRL_FORMAT_YUV420_SP		2UL
>> +#define DW100_DEWARP_CTRL_INPUT_FORMAT_MASK		GENMASK(5, 4)
>> +#define DW100_DEWARP_CTRL_INPUT_FORMAT(x)		((x) << 4)
>> +#define DW100_DEWARP_CTRL_OUTPUT_FORMAT(x)		((x) << 6)
>> +#define DW100_DEWARP_CTRL_OUTPUT_FORMAT_MASK		GENMASK(7, 6)
>> +#define DW100_DEWARP_CTRL_SRC_AUTO_SHADOW		BIT(8)
>> +#define DW100_DEWARP_CTRL_HW_HANDSHAKE			BIT(9)
>> +#define DW100_DEWARP_CTRL_DST_AUTO_SHADOW		BIT(10)
>> +#define DW100_DEWARP_CTRL_SPLIT_LINE			BIT(11)
>> +#define DW100_DEWARP_CTRL_PREFETCH_MODE_MASK		GENMASK(17, 16)
>> +#define DW100_DEWARP_CTRL_PREFETCH_MODE_TRAVERSAL	(0UL << 16)
>> +#define DW100_DEWARP_CTRL_PREFETCH_MODE_CALCULATION	(1UL << 16)
>> +#define DW100_DEWARP_CTRL_PREFETCH_MODE_AUTO		(2UL << 16)
>> +#define DW100_DEWARP_CTRL_PREFETCH_THRESHOLD_MASK	GENMASK(24, 18)
>> +#define DW100_DEWARP_CTRL_PREFETCH_THRESHOLD(x)		((x) << 18)
>> +
>> +#define DW100_MAP_LUT_ADDR		0x08
>> +#define DW100_MAP_LUT_ADDR_ADDR(addr)	(((addr) >> 4) & GENMASK(29, 0))
>> +#define DW100_MAP_LUT_SIZE		0x0c
>> +#define DW100_MAP_LUT_SIZE_WIDTH(w)	(((w) & GENMASK(10, 0)) << 0)
>> +#define DW100_MAP_LUT_SIZE_HEIGHT(h)	(((h) & GENMASK(10, 0)) << 16)
>> +#define DW100_SRC_IMG_Y_BASE		0x10
>> +#define DW100_IMG_Y_BASE(base)		(((base) >> 4) & GENMASK(29, 0))
>> +#define DW100_SRC_IMG_UV_BASE		0x14
>> +#define DW100_IMG_UV_BASE(base)		(((base) >> 4) & GENMASK(29, 0))
>> +#define DW100_SRC_IMG_SIZE		0x18
>> +#define DW100_IMG_SIZE_WIDTH(w)		(((w) & GENMASK(12, 0)) << 0)
>> +#define DW100_IMG_SIZE_HEIGHT(h)	(((h) & GENMASK(12, 0)) << 16)
>> +
>> +#define DW100_SRC_IMG_STRIDE		0x1c
>> +#define DW100_MAP_LUT_ADDR2		0x20
>> +#define DW100_MAP_LUT_SIZE2		0x24
>> +#define DW100_SRC_IMG_Y_BASE2		0x28
>> +#define DW100_SRC_IMG_UV_BASE2		0x2c
>> +#define DW100_SRC_IMG_SIZE2		0x30
>> +#define DW100_SRC_IMG_STRIDE2		0x34
>> +#define DW100_DST_IMG_Y_BASE		0x38
>> +#define DW100_DST_IMG_UV_BASE		0x3c
>> +#define DW100_DST_IMG_SIZE		0x40
>> +#define DW100_DST_IMG_STRIDE		0x44
>> +#define DW100_DST_IMG_Y_BASE2		0x48
>> +#define DW100_DST_IMG_UV_BASE2		0x4c
>> +#define DW100_DST_IMG_SIZE2		0x50
>> +#define DW100_DST_IMG_STRIDE2		0x54
>> +#define DW100_SWAP_CONTROL		0x58
>> +#define DW100_SWAP_CONTROL_BYTE		BIT(0)
>> +#define DW100_SWAP_CONTROL_SHORT	BIT(1)
>> +#define DW100_SWAP_CONTROL_WORD		BIT(2)
>> +#define DW100_SWAP_CONTROL_LONG		BIT(3)
>> +#define DW100_SWAP_CONTROL_Y(x)		(((x) & GENMASK(3, 0)) << 0)
>> +#define DW100_SWAP_CONTROL_UV(x)	(((x) & GENMASK(3, 0)) << 4)
>> +#define DW100_SWAP_CONTROL_SRC(x)	(((x) & GENMASK(7, 0)) << 0)
>> +#define DW100_SWAP_CONTROL_DST(x)	(((x) & GENMASK(7, 0)) << 8)
>> +#define DW100_SWAP_CONTROL_SRC2(x)	(((x) & GENMASK(7, 0)) << 16)
>> +#define DW100_SWAP_CONTROL_DST2(x)	(((x) & GENMASK(7, 0)) << 24)
>> +#define DW100_SWAP_CONTROL_SRC_MASK	GENMASK(7, 0)
>> +#define DW100_SWAP_CONTROL_DST_MASK	GENMASK(15, 8)
>> +#define DW100_SWAP_CONTROL_SRC2_MASK	GENMASK(23, 16)
>> +#define DW100_SWAP_CONTROL_DST2_MASK	GENMASK(31, 24)
>> +#define DW100_VERTICAL_SPLIT_LINE	0x5c
>> +#define DW100_HORIZON_SPLIT_LINE	0x60
>> +#define DW100_SCALE_FACTOR		0x64
>> +#define DW100_ROI_START			0x68
>> +#define DW100_ROI_START_X(x)		(((x) & GENMASK(12, 0)) << 0)
>> +#define DW100_ROI_START_Y(y)		(((y) & GENMASK(12, 0)) << 16)
>> +#define DW100_BOUNDARY_PIXEL		0x6c
>> +#define DW100_BOUNDARY_PIXEL_V(v)	(((v) & GENMASK(7, 0)) << 0)
>> +#define DW100_BOUNDARY_PIXEL_U(u)	(((u) & GENMASK(7, 0)) << 8)
>> +#define DW100_BOUNDARY_PIXEL_Y(y)	(((y) & GENMASK(7, 0)) << 16)
>> +
>> +#define DW100_INTERRUPT_STATUS		0x70
>> +#define DW100_INTERRUPT_STATUS_INT_FRAME_DONE		BIT(0)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT		BIT(1)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_AXI_RESP		BIT(2)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_X		BIT(3)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_MB_FETCH		BIT(4)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_FRAME2		BIT(5)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_FRAME3		BIT(6)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_FRAME_DONE	BIT(7)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_STATUS(x)	(((x) >> 1) & 0x7f)
>> +#define DW100_INTERRUPT_STATUS_INT_STATUS(x)		((x) & 0xff)
>> +
>> +#define DW100_INTERRUPT_STATUS_INT_ENABLE_MASK		GENMASK(15, 8)
>> +#define DW100_INTERRUPT_STATUS_INT_ENABLE(x)		(((x) & GENMASK(7, 0)) << 8)
>> +#define DW100_INTERRUPT_STATUS_FRAME_BUSY		BIT(16)
>> +#define DW100_INTERRUPT_STATUS_INT_CLEAR(x)		(((x) & GENMASK(7, 0)) << 24)
>> +#define DW100_BUS_CTRL			0x74
>> +#define DW100_BUS_CTRL_AXI_MASTER_ENABLE	BIT(31)
>> +#define DW100_BUS_CTRL1			0x78
>> +#define DW100_BUS_TIME_OUT_CYCLE	0x7c
>> +#define DW100_DST_IMG_Y_SIZE1		0x80
>> +#define DW100_DST_IMG_Y_SIZE(sz)	(((sz) >> 4) & GENMASK(29, 0))
>> +#define DW100_DST_IMG_UV_SIZE(sz)	(((sz) >> 4) & GENMASK(29, 0))
>> +#define DW100_DST_IMG_UV_SIZE1		0x84
>> +#define DW100_DST_IMG_Y_SIZE2		0x88
>> +#define DW100_DST_IMG_UV_SIZE2		0x8c
>> +
>> +#endif /* _DW100_REGS_H_ */
> 
