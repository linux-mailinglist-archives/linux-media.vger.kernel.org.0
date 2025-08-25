Return-Path: <linux-media+bounces-41034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC1CB344A7
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 16:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CC317A7965
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C762EE297;
	Mon, 25 Aug 2025 14:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVjL/ESs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE752F99BD;
	Mon, 25 Aug 2025 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133642; cv=none; b=H/jElKyyRGBE1Awq37VrI0AmB6TphZR9juFGXmRgyqfh4TjTu28mqvLewm2u3Nh56XcUK3WMm5VynV199UIGcbS2XGM/q2FVYQIRdyIe1zCKoENEW06/GJQazqByxcopR0o6yvR8YiHipzvdHcxwSSg3xS8vDjPpLjhvl5pMHsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133642; c=relaxed/simple;
	bh=bUBI5SfaoxEaLA+fvj02LgVaV0AjaHNRUrs5uYsqKJc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ivP+Ack5ITUGxO/ewcD5c3B9VPpW2LRaDJTdHQFialeY/hqNJPETYbpgGc2OR6DDNRMJBsZja4EHIFVcUXtcMYoCYXZpeAXFlJG8XtUZuGJM123pUvCs8ae38u7otKiehh6w3AWEUvXROSi0u4eWFmX87/NZqFpfJys8cYlk2Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVjL/ESs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5F5C4CEED;
	Mon, 25 Aug 2025 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756133641;
	bh=bUBI5SfaoxEaLA+fvj02LgVaV0AjaHNRUrs5uYsqKJc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=oVjL/ESsKxNHHotD7Vk6dXw2fz3t/pDH8zyFo2pzMbVCiqjGzS35L2h/EI2475/Ih
	 Fq+YLRaZSaI30G5x4cbeMMOU6m+7cqvsZfUis4G9Fh/D+KMYbm5Smi1KLIpUc0jxhy
	 e/8Pmc8hdqQt3PRMU1VS4VXmDYeBakqm+Jb6woyQ4KgykLhJng1Q7dHKVk9voXcjiJ
	 m0HLRqsQryJkN2//8eYTQ2Wu6ePiYC++r3TeQSdQfcSAG1aTiyjnpEvMogrkDoH1Dh
	 ZculupKBVTmRNNe7qUzqYxgoJygWne+ZgkeIkd7ABD+3lMJ5+OyjTDcln3fuhWeMyh
	 jKbAL7/Lon1xQ==
Message-ID: <5f01991c-8bd4-494a-92bf-d0f2751717f7@kernel.org>
Date: Mon, 25 Aug 2025 16:53:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH V2 4/4] media: ti-vpe: Add the VIP driver
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux@armlinux.org.uk, ardb@kernel.org, ebiggers@kernel.org,
 geert+renesas@glider.be, claudiu.beznea@tuxon.dev, bparrot@ti.com,
 andre.draszik@linaro.org, kuninori.morimoto.gx@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, heikki.krogerus@linux.intel.com,
 kory.maincent@bootlin.com, florian.fainelli@broadcom.com, lumag@kernel.org,
 dale@farnsworth.org, sbellary@baylibre.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dagriego@biglakesoftware.com,
 u-kumar1@ti.com
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <20250716111912.235157-5-y-abhilashchandra@ti.com>
Content-Language: en-US, nl
In-Reply-To: <20250716111912.235157-5-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yemike,

A first review of this driver:

On 16/07/2025 13:19, Yemike Abhilash Chandra wrote:
> From: Dale Farnsworth <dale@farnsworth.org>
> 
> VIP stands for Video Input Port; it can be found on devices such as DRA7xx
> and provides a parallel interface to a video source such as a sensor or TV
> decoder. Each VIP can support two inputs (slices) and an SoC can be
> configured with a variable number of VIPs. Each slice ican support two
> ports, each connected to it's own sub-device.
> 
> Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Changelog:
> Changes in v2:
> - Remove vip_dbg, vip_info, vip_err aliases and just use v4l2_dbg, v4l2_info
>   and v4l2_err instead
> - Remove color space information from vip_formats struct
> - Use g_std instead of g_std_output
> - Do not touch pix.priv
> - Remove all comments with just register values
> - Remove support for vidioc_default ioctl
> - In case of any error while streaming, push all pending buffers to vb2
> - Address some minor comments made by Hans throughout the driver
> - Update copyright year
> 
>  drivers/media/platform/ti/Kconfig      |   13 +
>  drivers/media/platform/ti/vpe/Makefile |    2 +
>  drivers/media/platform/ti/vpe/vip.c    | 3824 ++++++++++++++++++++++++
>  drivers/media/platform/ti/vpe/vip.h    |  719 +++++
>  4 files changed, 4558 insertions(+)
>  create mode 100644 drivers/media/platform/ti/vpe/vip.c
>  create mode 100644 drivers/media/platform/ti/vpe/vip.h
> 

<snip>

> +/*
> + * video ioctls
> + */
> +static int vip_querycap(struct file *file, void *priv,
> +			struct v4l2_capability *cap)
> +{
> +	struct vip_stream *stream = file2stream(file);
> +	struct vip_port *port = stream->port;
> +	struct vip_dev *dev = port->dev;
> +	u32 vin_id = 1 + ((dev->instance_id - 1) * 2) + dev->slice_id;
> +
> +	strscpy(cap->driver, VIP_MODULE_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, VIP_MODULE_NAME, sizeof(cap->card));
> +
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:vip%1d:vin%1d%c:stream%1d", dev->instance_id, vin_id,
> +		 port->port_id == VIP_PORTA ? 'a' : 'b', stream->stream_id);

There is no need to fill bus_info for platform devices, it's automatically
filled in.

> +	return 0;
> +}
> +
> +static int vip_enuminput(struct file *file, void *priv,
> +			 struct v4l2_input *inp)
> +{
> +	struct vip_stream *stream = file2stream(file);
> +
> +	if (inp->index)
> +		return -EINVAL;
> +
> +	inp->type = V4L2_INPUT_TYPE_CAMERA;
> +	inp->std = stream->vfd->tvnorms;
> +	sprintf(inp->name, "camera %u", stream->vfd->num);

I'd say "Camera" instead of "camera".

> +
> +	return 0;
> +}
> +
> +static int vip_g_input(struct file *file, void *priv, unsigned int *i)
> +{
> +	*i = 0;
> +	return 0;
> +}
> +
> +static int vip_s_input(struct file *file, void *priv, unsigned int i)
> +{
> +	if (i != 0)
> +		return -EINVAL;
> +	return 0;
> +}
> +
> +static int vip_querystd(struct file *file, void *fh, v4l2_std_id *std)
> +{
> +	struct vip_stream *stream = file2stream(file);
> +	struct vip_port *port = stream->port;
> +
> +	*std = stream->vfd->tvnorms;
> +	v4l2_subdev_call(port->subdev, video, querystd, std);
> +	v4l2_dbg(1, debug, stream, "querystd: 0x%lx\n", (unsigned long)*std);

I'd drop these v4l2_dbg lines for ioctls. You can do that already using dev_debug:

https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-dev.html#video-device-debugging

> +	return 0;
> +}
> +
> +static int vip_g_std(struct file *file, void *fh, v4l2_std_id *std)
> +{
> +	struct vip_stream *stream = file2stream(file);
> +	struct vip_port *port = stream->port;
> +
> +	*std = stream->vfd->tvnorms;
> +	v4l2_subdev_call(port->subdev, video, g_std, std);
> +	v4l2_dbg(1, debug, stream, "g_std: 0x%lx\n", (unsigned long)*std);
> +
> +	return 0;
> +}
> +
> +static int vip_s_std(struct file *file, void *fh, v4l2_std_id std)
> +{
> +	struct vip_stream *stream = file2stream(file);
> +	struct vip_port *port = stream->port;
> +
> +	v4l2_dbg(1, debug, stream, "s_std: 0x%lx\n", (unsigned long)std);
> +
> +	if (!(std & stream->vfd->tvnorms)) {
> +		v4l2_dbg(1, debug, stream, "s_std after check: 0x%lx\n",
> +			 (unsigned long)std);
> +		return -EINVAL;
> +	}

This needs a vb2_is_busy() check to avoid changing standard while streaming.
Return -EBUSY in that case.

> +
> +	v4l2_subdev_call(port->subdev, video, s_std, std);
> +	return 0;
> +}
> +
> +static int vip_enum_fmt_vid_cap(struct file *file, void *priv,
> +				struct v4l2_fmtdesc *f)
> +{
> +	struct vip_stream *stream = file2stream(file);
> +	struct vip_port *port = stream->port;
> +	struct vip_fmt *fmt;
> +
> +	v4l2_dbg(3, debug, stream, "enum_fmt index:%d\n", f->index);
> +	if (f->index >= port->num_active_fmt)
> +		return -EINVAL;
> +
> +	fmt = port->active_fmt[f->index];
> +
> +	f->pixelformat = fmt->fourcc;
> +
> +	return 0;
> +}
> +
> +static int vip_enum_framesizes(struct file *file, void *priv,
> +			       struct v4l2_frmsizeenum *f)
> +{
> +	struct vip_stream *stream = file2stream(file);
> +	struct vip_port *port = stream->port;
> +	struct vip_fmt *fmt;
> +	int ret;
> +	struct v4l2_subdev_frame_size_enum fse = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.pad = 0,
> +	};
> +
> +	fmt = find_port_format_by_pix(port, f->pixel_format);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	fse.index = f->index;
> +	fse.code = fmt->code;
> +	ret = v4l2_subdev_call(port->subdev, pad, enum_frame_size, NULL, &fse);
> +	if (ret)
> +		return -EINVAL;
> +
> +	v4l2_dbg(1, debug, stream, "%s: index: %d code: %x W:[%d,%d] H:[%d,%d]\n",
> +		 __func__, fse.index, fse.code, fse.min_width, fse.max_width,
> +		 fse.min_height, fse.max_height);
> +
> +	f->type = V4L2_FRMSIZE_TYPE_DISCRETE;
> +	f->discrete.width = fse.max_width;
> +	f->discrete.height = fse.max_height;
> +
> +	return 0;
> +}

I'm not sure why this fails with v4l2-compliance. I think it is related to ambiguities in the
V4L2 API, but I can't remember the details.

> +
> +static int vip_enum_frameintervals(struct file *file, void *priv,
> +				   struct v4l2_frmivalenum *f)
> +{
> +	struct vip_stream *stream = file2stream(file);
> +	struct vip_port *port = stream->port;
> +	struct vip_fmt *fmt;
> +	struct v4l2_subdev_frame_interval_enum fie = {
> +		.index = f->index,
> +		.width = f->width,
> +		.height = f->height,
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +	int ret;
> +
> +	fmt = find_port_format_by_pix(port, f->pixel_format);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	fie.code = fmt->code;
> +	ret = v4l2_subdev_call(port->subdev, pad, enum_frame_interval,
> +			       NULL, &fie);
> +	if (ret)
> +		return ret;
> +	f->type = V4L2_FRMIVAL_TYPE_DISCRETE;
> +	f->discrete = fie.interval;
> +
> +	return 0;
> +}
> +
> +static int vip_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
> +{
> +	struct vip_stream *stream = video_drvdata(file);
> +	struct vip_port *port = stream->port;
> +
> +	return v4l2_g_parm_cap(video_devdata(file), port->subdev, a);
> +}
> +
> +static int vip_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
> +{
> +	struct vip_stream *stream = video_drvdata(file);
> +	struct vip_port *port = stream->port;
> +
> +	return v4l2_s_parm_cap(video_devdata(file), port->subdev, a);
> +}
> +
> +static int vip_calc_format_size(struct vip_port *port,
> +				struct vip_fmt *fmt,
> +				struct v4l2_format *f)
> +{
> +	enum v4l2_field *field;
> +	unsigned int stride;
> +
> +	if (!fmt) {
> +		v4l2_dbg(2, debug, port,
> +			 "no vip_fmt format provided!\n");
> +		return -EINVAL;
> +	}
> +
> +	field = &f->fmt.pix.field;
> +	if (*field == V4L2_FIELD_ANY)
> +		*field = V4L2_FIELD_NONE;
> +	else if (V4L2_FIELD_NONE != *field && V4L2_FIELD_ALTERNATE != *field)
> +		return -EINVAL;
> +
> +	v4l_bound_align_image(&f->fmt.pix.width, MIN_W, MAX_W, W_ALIGN,
> +			      &f->fmt.pix.height, MIN_H, MAX_H, H_ALIGN,
> +			      S_ALIGN);
> +
> +	stride = f->fmt.pix.width * (fmt->vpdma_fmt[0]->depth >> 3);
> +	f->fmt.pix.bytesperline = ALIGN(stride, VPDMA_STRIDE_ALIGN);
> +
> +	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
> +	if (fmt->coplanar) {
> +		f->fmt.pix.sizeimage += f->fmt.pix.height *
> +					f->fmt.pix.bytesperline *
> +					fmt->vpdma_fmt[VIP_CHROMA]->depth >> 3;
> +	}
> +
> +	f->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
> +
> +	v4l2_dbg(3, debug, port, "calc_format_size: fourcc:%s size: %dx%d bpl:%d img_size:%d\n",
> +		 fourcc_to_str(f->fmt.pix.pixelformat),
> +		 f->fmt.pix.width, f->fmt.pix.height,
> +		 f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
> +
> +	return 0;
> +}
> +
> +static inline bool vip_is_size_dma_aligned(u32 bpp, u32 width)
> +{
> +	return ((width * bpp) == ALIGN(width * bpp, VPDMA_STRIDE_ALIGN));
> +}
> +
> +static int vip_try_fmt_vid_cap(struct file *file, void *priv,
> +			       struct v4l2_format *f)
> +{
> +	struct vip_stream *stream = file2stream(file);
> +	struct vip_port *port = stream->port;
> +	struct vip_fmt *fmt;
> +	u32 best_width, best_height, largest_width, largest_height;
> +	int ret, found;
> +	enum vip_csc_state csc_direction;
> +	struct v4l2_subdev_frame_size_enum fse = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.pad = 0,
> +	};
> +
> +	v4l2_dbg(3, debug, stream, "try_fmt fourcc:%s size: %dx%d\n",
> +		 fourcc_to_str(f->fmt.pix.pixelformat),
> +		 f->fmt.pix.width, f->fmt.pix.height);
> +
> +	fmt = find_port_format_by_pix(port, f->fmt.pix.pixelformat);
> +	if (!fmt) {
> +		v4l2_dbg(2, debug, stream,
> +			 "Fourcc format (0x%08x) not found.\n",
> +			 f->fmt.pix.pixelformat);
> +
> +		/* Just get the first one enumerated */
> +		fmt = port->active_fmt[0];
> +		f->fmt.pix.pixelformat = fmt->fourcc;
> +	}
> +
> +	csc_direction =  vip_csc_direction(fmt->code, fmt->finfo);
> +	if (csc_direction != VIP_CSC_NA) {
> +		if (!is_csc_available(port)) {
> +			v4l2_dbg(2, debug, stream,
> +				 "CSC not available for Fourcc format (0x%08x).\n",
> +				 f->fmt.pix.pixelformat);
> +
> +			/* Just get the first one enumerated */
> +			fmt = port->active_fmt[0];
> +			f->fmt.pix.pixelformat = fmt->fourcc;
> +			/* re-evaluate the csc_direction here */
> +			csc_direction =  vip_csc_direction(fmt->code,
> +							   fmt->finfo);
> +		} else {
> +			v4l2_dbg(3, debug, stream, "CSC active on Port %c: going %s\n",
> +				 port->port_id == VIP_PORTA ? 'A' : 'B',
> +				 (csc_direction == VIP_CSC_Y2R) ? "Y2R" : "R2Y");
> +		}
> +	}
> +
> +	/*
> +	 * Given that sensors might support multiple mbus code we need
> +	 * to use the one that matches the requested pixel format
> +	 */
> +	port->try_mbus_framefmt = port->mbus_framefmt;
> +	port->try_mbus_framefmt.code = fmt->code;
> +
> +	/* check for/find a valid width/height */
> +	ret = 0;
> +	found = false;
> +	best_width = 0;
> +	best_height = 0;
> +	largest_width = 0;
> +	largest_height = 0;
> +
> +	fse.code = fmt->code;
> +	for (fse.index = 0; ; fse.index++) {
> +		u32 bpp = fmt->vpdma_fmt[0]->depth >> 3;
> +
> +		ret = v4l2_subdev_call(port->subdev, pad,
> +				       enum_frame_size, NULL, &fse);
> +		if (ret)
> +			break;
> +
> +		v4l2_dbg(3, debug, stream, "try_fmt loop:%d fourcc:%s size: %dx%d\n",
> +			 fse.index, fourcc_to_str(f->fmt.pix.pixelformat),
> +			 fse.max_width, fse.max_height);
> +
> +		if (!vip_is_size_dma_aligned(bpp, fse.max_width))
> +			continue;
> +
> +		if (fse.max_width >= largest_width &&
> +		    fse.max_height >= largest_height) {
> +			v4l2_dbg(3, debug, stream, "try_fmt loop:%d found new larger: %dx%d\n",
> +				 fse.index, fse.max_width, fse.max_height);
> +			largest_width = fse.max_width;
> +			largest_height = fse.max_height;
> +		}
> +
> +		if (fse.max_width >= f->fmt.pix.width &&
> +		    fse.max_height >= f->fmt.pix.height) {
> +			v4l2_dbg(3, debug, stream, "try_fmt loop:%d found at least larger: %dx%d\n",
> +				 fse.index, fse.max_width, fse.max_height);
> +
> +			if (!best_width ||
> +			    ((abs(best_width - f->fmt.pix.width) >=
> +			      abs(fse.max_width - f->fmt.pix.width)) &&
> +			     (abs(best_height - f->fmt.pix.height) >=
> +			      abs(fse.max_height - f->fmt.pix.height)))) {
> +				best_width = fse.max_width;
> +				best_height = fse.max_height;
> +				v4l2_dbg(3, debug, stream, "try_fmt loop:%d found new best: %dx%d\n",
> +					 fse.index, fse.max_width,
> +					 fse.max_height);
> +			}
> +		}
> +
> +		if (f->fmt.pix.width == fse.max_width &&
> +		    f->fmt.pix.height == fse.max_height) {
> +			found = true;
> +			v4l2_dbg(3, debug, stream, "try_fmt loop:%d found direct match: %dx%d\n",
> +				 fse.index, fse.max_width,
> +				 fse.max_height);
> +			break;
> +		}
> +
> +		if (f->fmt.pix.width >= fse.min_width &&
> +		    f->fmt.pix.width <= fse.max_width &&
> +		    f->fmt.pix.height >= fse.min_height &&
> +		    f->fmt.pix.height <= fse.max_height) {
> +			found = true;
> +			v4l2_dbg(3, debug, stream, "try_fmt loop:%d found direct range match: %dx%d\n",
> +				 fse.index, fse.max_width,
> +				 fse.max_height);
> +			break;
> +		}
> +	}
> +
> +	if (found) {
> +		port->try_mbus_framefmt.width = f->fmt.pix.width;
> +		port->try_mbus_framefmt.height = f->fmt.pix.height;
> +		/* No need to check for scaling */
> +		goto calc_size;
> +	} else if (f->fmt.pix.width > largest_width) {
> +		port->try_mbus_framefmt.width = largest_width;
> +		port->try_mbus_framefmt.height = largest_height;
> +	} else if (best_width) {
> +		port->try_mbus_framefmt.width = best_width;
> +		port->try_mbus_framefmt.height = best_height;
> +	} else {
> +		/* use existing values as default */
> +	}
> +
> +	v4l2_dbg(3, debug, stream, "try_fmt best subdev size: %dx%d\n",
> +		 port->try_mbus_framefmt.width,
> +		 port->try_mbus_framefmt.height);
> +
> +	if (is_scaler_available(port) &&
> +	    csc_direction != VIP_CSC_Y2R &&
> +	    !vip_is_mbuscode_raw(fmt->code) &&
> +	    f->fmt.pix.height <= port->try_mbus_framefmt.height &&
> +	    port->try_mbus_framefmt.height <= SC_MAX_PIXEL_HEIGHT &&
> +	    port->try_mbus_framefmt.width <= SC_MAX_PIXEL_WIDTH) {
> +		/*
> +		 * Scaler is only accessible if the dst colorspace is YUV.
> +		 * As the input to the scaler must be in YUV mode only.
> +		 *
> +		 * Scaling up is allowed only horizontally.
> +		 */
> +		unsigned int hratio, vratio, width_align, height_align;
> +		u32 bpp = fmt->vpdma_fmt[0]->depth >> 3;
> +
> +		v4l2_dbg(3, debug, stream, "Scaler active on Port %c: requesting %dx%d\n",
> +			 port->port_id == VIP_PORTA ? 'A' : 'B',
> +			 f->fmt.pix.width, f->fmt.pix.height);
> +
> +		/* Just make sure everything is properly aligned */
> +		width_align = ALIGN(f->fmt.pix.width * bpp, VPDMA_STRIDE_ALIGN);
> +		width_align /= bpp;
> +		height_align = ALIGN(f->fmt.pix.height, 2);
> +
> +		f->fmt.pix.width = width_align;
> +		f->fmt.pix.height = height_align;
> +
> +		hratio = f->fmt.pix.width * 1000 /
> +			 port->try_mbus_framefmt.width;
> +		vratio = f->fmt.pix.height * 1000 /
> +			 port->try_mbus_framefmt.height;
> +		if (hratio < 125) {
> +			f->fmt.pix.width = port->try_mbus_framefmt.width / 8;
> +			v4l2_dbg(3, debug, stream, "Horizontal scaling ratio out of range adjusting -> %d\n",
> +				 f->fmt.pix.width);
> +		}
> +
> +		if (vratio < 188) {
> +			f->fmt.pix.height = port->try_mbus_framefmt.height / 4;
> +			v4l2_dbg(3, debug, stream, "Vertical scaling ratio out of range adjusting -> %d\n",
> +				 f->fmt.pix.height);
> +		}
> +		v4l2_dbg(3, debug, stream, "Scaler: got %dx%d\n",
> +			 f->fmt.pix.width, f->fmt.pix.height);
> +	} else {
> +		/* use existing values as default */
> +		f->fmt.pix.width = port->try_mbus_framefmt.width;
> +		f->fmt.pix.height = port->try_mbus_framefmt.height;
> +	}
> +
> +calc_size:
> +	/* That we have a fmt calculate imagesize and bytesperline */
> +	return vip_calc_format_size(port, fmt, f);
> +}
> +
> +static int vip_g_fmt_vid_cap(struct file *file, void *priv,
> +			     struct v4l2_format *f)
> +{
> +	struct vip_stream *stream = file2stream(file);
> +	struct vip_port *port = stream->port;
> +	struct vip_fmt *fmt = port->fmt;
> +
> +	/* Use last known values or defaults */
> +	f->fmt.pix.width	= stream->width;
> +	f->fmt.pix.height	= stream->height;
> +	f->fmt.pix.pixelformat	= port->fmt->fourcc;
> +	f->fmt.pix.field	= stream->sup_field;
> +	f->fmt.pix.colorspace   = V4L2_COLORSPACE_SRGB;
> +	f->fmt.pix.bytesperline	= stream->bytesperline;
> +	f->fmt.pix.sizeimage	= stream->sizeimage;
> +
> +	v4l2_dbg(3, debug, stream,
> +		 "g_fmt fourcc:%s code: %04x size: %dx%d bpl:%d img_size:%d\n",
> +		 fourcc_to_str(f->fmt.pix.pixelformat),
> +		 fmt->code,
> +		 f->fmt.pix.width, f->fmt.pix.height,
> +		 f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
> +	v4l2_dbg(3, debug, stream, "g_fmt vpdma data type: 0x%02X\n",
> +		 port->fmt->vpdma_fmt[0]->data_type);
> +
> +	return 0;
> +}
> +
> +static int vip_s_fmt_vid_cap(struct file *file, void *priv,
> +			     struct v4l2_format *f)
> +{
> +	struct vip_stream *stream = file2stream(file);
> +	struct vip_port *port = stream->port;
> +	struct v4l2_subdev_format sfmt;
> +	struct v4l2_mbus_framefmt *mf;
> +	enum vip_csc_state csc_direction;
> +	int ret;
> +
> +	v4l2_dbg(3, debug, stream, "s_fmt input fourcc:%s size: %dx%d bpl:%d img_size:%d\n",
> +		 fourcc_to_str(f->fmt.pix.pixelformat),
> +		 f->fmt.pix.width, f->fmt.pix.height,
> +		 f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
> +
> +	ret = vip_try_fmt_vid_cap(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_dbg(3, debug, stream, "s_fmt try_fmt fourcc:%s size: %dx%d bpl:%d img_size:%d\n",
> +		 fourcc_to_str(f->fmt.pix.pixelformat),
> +		 f->fmt.pix.width, f->fmt.pix.height,
> +		 f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
> +
> +	if (vb2_is_busy(&stream->vb_vidq)) {
> +		v4l2_err(stream, "%s queue busy\n", __func__);
> +		return -EBUSY;
> +	}
> +
> +	/*
> +	 * Check if we need the scaler or not
> +	 *
> +	 * Since on previous S_FMT call the scaler might have been
> +	 * allocated if it is not needed in this instance we will
> +	 * attempt to free it just in case.
> +	 *
> +	 * free_scaler() is harmless unless the current port
> +	 * allocated it.
> +	 */
> +	if (f->fmt.pix.width == port->try_mbus_framefmt.width &&
> +	    f->fmt.pix.height == port->try_mbus_framefmt.height)
> +		free_scaler(port);
> +	else
> +		allocate_scaler(port);
> +
> +	port->fmt = find_port_format_by_pix(port,
> +					    f->fmt.pix.pixelformat);
> +	stream->width		= f->fmt.pix.width;
> +	stream->height		= f->fmt.pix.height;
> +	stream->bytesperline	= f->fmt.pix.bytesperline;
> +	stream->sizeimage	= f->fmt.pix.sizeimage;
> +	stream->sup_field	= f->fmt.pix.field;
> +
> +	port->c_rect.left	= 0;
> +	port->c_rect.top	= 0;
> +	port->c_rect.width	= stream->width;
> +	port->c_rect.height	= stream->height;
> +
> +	/*
> +	 * Check if we need the csc unit or not
> +	 *
> +	 * Since on previous S_FMT call, the csc might have been
> +	 * allocated if it is not needed in this instance we will
> +	 * attempt to free it just in case.
> +	 *
> +	 * free_csc() is harmless unless the current port
> +	 * allocated it.
> +	 */
> +	csc_direction =  vip_csc_direction(port->fmt->code, port->fmt->finfo);
> +	if (csc_direction == VIP_CSC_NA)
> +		free_csc(port);
> +	else
> +		allocate_csc(port, csc_direction);
> +
> +	if (stream->sup_field == V4L2_FIELD_ALTERNATE)
> +		port->flags |= FLAG_INTERLACED;
> +	else
> +		port->flags &= ~FLAG_INTERLACED;
> +
> +	v4l2_dbg(3, debug, stream, "s_fmt fourcc:%s size: %dx%d bpl:%d img_size:%d\n",
> +		 fourcc_to_str(f->fmt.pix.pixelformat),
> +		 f->fmt.pix.width, f->fmt.pix.height,
> +		 f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
> +
> +	memset(&sfmt, 0, sizeof(sfmt));
> +	mf = &sfmt.format;
> +	v4l2_fill_mbus_format(mf, &f->fmt.pix, port->fmt->code);
> +	/* Make sure to use the subdev size found in the try_fmt */
> +	mf->width = port->try_mbus_framefmt.width;
> +	mf->height = port->try_mbus_framefmt.height;
> +
> +	v4l2_dbg(3, debug, stream, "s_fmt pix_to_mbus mbus_code: %04X size: %dx%d\n",
> +		 mf->code,
> +		 mf->width, mf->height);
> +
> +	sfmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +	sfmt.pad = 0;
> +	ret = v4l2_subdev_call(port->subdev, pad, set_fmt, NULL, &sfmt);
> +	if (ret) {
> +		v4l2_dbg(1, debug, stream, "set_fmt failed in subdev\n");
> +		return ret;
> +	}
> +
> +	/* Save it */
> +	port->mbus_framefmt = *mf;
> +
> +	v4l2_dbg(3, debug, stream, "s_fmt subdev fmt mbus_code: %04X size: %dx%d\n",
> +		 port->mbus_framefmt.code,
> +		 port->mbus_framefmt.width, port->mbus_framefmt.height);
> +	v4l2_dbg(3, debug, stream, "s_fmt vpdma data type: 0x%02X\n",
> +		 port->fmt->vpdma_fmt[0]->data_type);
> +
> +	return 0;
> +}
> +
> +/*
> + * Does the exact opposite of set_fmt_params
> + * It makes sure the DataPath register is sane after tear down
> + */
> +static void unset_fmt_params(struct vip_stream *stream)
> +{
> +	struct vip_dev *dev = stream->port->dev;
> +	struct vip_port *port = stream->port;
> +
> +	stream->sequence = 0;
> +	stream->field = V4L2_FIELD_TOP;
> +
> +	if (port->csc == VIP_CSC_Y2R) {
> +		if (port->port_id == VIP_PORTA) {
> +			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 0);
> +			vip_set_slice_path(dev,
> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_RGB_SRC_DATA_SELECT, 0);
> +		} else {
> +			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 0);
> +			vip_set_slice_path(dev,
> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
> +		}
> +		/* We are done */
> +		return;
> +	} else if (port->csc == VIP_CSC_R2Y) {
> +		if (port->scaler && port->fmt->coplanar) {
> +			if (port->port_id == VIP_PORTA) {
> +				vip_set_slice_path(dev,
> +						   VIP_CSC_SRC_DATA_SELECT, 0);
> +				vip_set_slice_path(dev,
> +						   VIP_SC_SRC_DATA_SELECT, 0);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
> +						   0);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
> +				vip_set_slice_path(dev,
> +						   VIP_RGB_OUT_HI_DATA_SELECT,
> +						   0);
> +			}
> +		} else if (port->scaler) {
> +			if (port->port_id == VIP_PORTA) {
> +				vip_set_slice_path(dev,
> +						   VIP_CSC_SRC_DATA_SELECT, 0);
> +				vip_set_slice_path(dev,
> +						   VIP_SC_SRC_DATA_SELECT, 0);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
> +						   0);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
> +				vip_set_slice_path(dev,
> +						   VIP_RGB_OUT_HI_DATA_SELECT,
> +						   0);
> +			}
> +		} else if (port->fmt->coplanar) {
> +			if (port->port_id == VIP_PORTA) {
> +				vip_set_slice_path(dev,
> +						   VIP_CSC_SRC_DATA_SELECT, 0);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
> +						   0);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
> +				vip_set_slice_path(dev,
> +						   VIP_RGB_OUT_HI_DATA_SELECT,
> +						   0);
> +			}
> +		} else {
> +			if (port->port_id == VIP_PORTA) {
> +				vip_set_slice_path(dev,
> +						   VIP_CSC_SRC_DATA_SELECT, 0);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
> +						   0);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
> +				vip_set_slice_path(dev,
> +						   VIP_RGB_OUT_HI_DATA_SELECT,
> +						   0);
> +			}
> +		}
> +		/* We are done */
> +		return;
> +	} else if (v4l2_is_format_rgb(port->fmt->finfo)) {
> +		if (port->port_id == VIP_PORTA) {
> +			vip_set_slice_path(dev,
> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
> +		}
> +		/* We are done */
> +		return;
> +	}
> +
> +	if (port->scaler && port->fmt->coplanar) {
> +		if (port->port_id == VIP_PORTA) {
> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
> +			vip_set_slice_path(dev,
> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
> +		} else {
> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
> +			vip_set_slice_path(dev,
> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
> +			vip_set_slice_path(dev,
> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
> +		}
> +	} else if (port->scaler) {
> +		if (port->port_id == VIP_PORTA) {
> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
> +			vip_set_slice_path(dev,
> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
> +		} else {
> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
> +			vip_set_slice_path(dev,
> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
> +			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
> +		}
> +	} else if (port->fmt->coplanar) {
> +		if (port->port_id == VIP_PORTA) {
> +			vip_set_slice_path(dev,
> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
> +		} else {
> +			vip_set_slice_path(dev,
> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 0);
> +			vip_set_slice_path(dev,
> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
> +		}
> +	} else {
> +		/*
> +		 * We undo all data path setting except for the multi
> +		 * stream case.
> +		 * Because we cannot disrupt other on-going capture if only
> +		 * one stream is terminated the other might still be going
> +		 */
> +		vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
> +		vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
> +	}
> +}
> +
> +/*
> + * Set the registers that are modified when the video format changes.
> + */
> +static void set_fmt_params(struct vip_stream *stream)
> +{
> +	struct vip_dev *dev = stream->port->dev;
> +	struct vip_port *port = stream->port;
> +
> +	stream->sequence = 0;
> +	stream->field = V4L2_FIELD_TOP;
> +
> +	if (port->csc == VIP_CSC_Y2R) {
> +		port->flags &= ~FLAG_MULT_PORT;
> +		/* Set alpha component in background color */
> +		vpdma_set_bg_color(dev->shared->vpdma,
> +				   (struct vpdma_data_format *)
> +				   port->fmt->vpdma_fmt[0],
> +				   0xff);
> +		if (port->port_id == VIP_PORTA) {
> +			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 1);
> +			vip_set_slice_path(dev,
> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 1);
> +			vip_set_slice_path(dev, VIP_RGB_SRC_DATA_SELECT, 1);
> +		} else {
> +			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 2);
> +			vip_set_slice_path(dev,
> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 1);
> +		}
> +		/* We are done */
> +		return;
> +	} else if (port->csc == VIP_CSC_R2Y) {
> +		port->flags &= ~FLAG_MULT_PORT;
> +		if (port->scaler && port->fmt->coplanar) {
> +			if (port->port_id == VIP_PORTA) {
> +				vip_set_slice_path(dev,
> +						   VIP_CSC_SRC_DATA_SELECT, 4);
> +				vip_set_slice_path(dev,
> +						   VIP_SC_SRC_DATA_SELECT, 1);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
> +						   1);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
> +				vip_set_slice_path(dev,
> +						   VIP_RGB_OUT_HI_DATA_SELECT,
> +						   0);
> +			} else {
> +				v4l2_err(stream, "RGB sensor can only be on Port A\n");
> +			}
> +		} else if (port->scaler) {
> +			if (port->port_id == VIP_PORTA) {
> +				vip_set_slice_path(dev,
> +						   VIP_CSC_SRC_DATA_SELECT, 4);
> +				vip_set_slice_path(dev,
> +						   VIP_SC_SRC_DATA_SELECT, 1);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
> +						   1);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_DATA_BYPASS, 1);
> +				vip_set_slice_path(dev,
> +						   VIP_RGB_OUT_HI_DATA_SELECT,
> +						   0);
> +			} else {
> +				v4l2_err(stream, "RGB sensor can only be on Port A\n");
> +			}
> +		} else if (port->fmt->coplanar) {
> +			if (port->port_id == VIP_PORTA) {
> +				vip_set_slice_path(dev,
> +						   VIP_CSC_SRC_DATA_SELECT, 4);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
> +						   2);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
> +				vip_set_slice_path(dev,
> +						   VIP_RGB_OUT_HI_DATA_SELECT,
> +						   0);
> +			} else {
> +				v4l2_err(stream, "RGB sensor can only be on Port A\n");
> +			}
> +		} else {
> +			if (port->port_id == VIP_PORTA) {
> +				vip_set_slice_path(dev,
> +						   VIP_CSC_SRC_DATA_SELECT, 4);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
> +						   2);
> +				vip_set_slice_path(dev,
> +						   VIP_CHR_DS_1_DATA_BYPASS, 1);
> +				vip_set_slice_path(dev,
> +						   VIP_RGB_OUT_HI_DATA_SELECT,
> +						   0);
> +			} else {
> +				v4l2_err(stream, "RGB sensor can only be on Port A\n");
> +			}
> +		}
> +		/* We are done */
> +		return;
> +	} else if (v4l2_is_format_rgb(port->fmt->finfo)) {
> +		port->flags &= ~FLAG_MULT_PORT;
> +		/* Set alpha component in background color */
> +		vpdma_set_bg_color(dev->shared->vpdma,
> +				   (struct vpdma_data_format *)
> +				   port->fmt->vpdma_fmt[0],
> +				   0xff);
> +		if (port->port_id == VIP_PORTA) {
> +			vip_set_slice_path(dev,
> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 1);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 1);
> +		} else {
> +			v4l2_err(stream, "RGB sensor can only be on Port A\n");
> +		}
> +		/* We are done */
> +		return;
> +	}
> +
> +	if (port->scaler && port->fmt->coplanar) {
> +		port->flags &= ~FLAG_MULT_PORT;
> +		if (port->port_id == VIP_PORTA) {
> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 2);
> +			vip_set_slice_path(dev,
> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 1);
> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
> +		} else {
> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 3);
> +			vip_set_slice_path(dev,
> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 1);
> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
> +			vip_set_slice_path(dev,
> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
> +		}
> +	} else if (port->scaler) {
> +		port->flags &= ~FLAG_MULT_PORT;
> +		if (port->port_id == VIP_PORTA) {
> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 2);
> +			vip_set_slice_path(dev,
> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 1);
> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 1);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
> +		} else {
> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 3);
> +			vip_set_slice_path(dev,
> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 1);
> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 1);
> +			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 1);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
> +		}
> +	} else if (port->fmt->coplanar) {
> +		port->flags &= ~FLAG_MULT_PORT;
> +		if (port->port_id == VIP_PORTA) {
> +			vip_set_slice_path(dev,
> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 3);
> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
> +		} else {
> +			vip_set_slice_path(dev,
> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 4);
> +			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 0);
> +			vip_set_slice_path(dev,
> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
> +		}
> +	} else {
> +		port->flags |= FLAG_MULT_PORT;
> +		vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
> +		vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
> +	}
> +}
> +
> +static int vip_g_selection(struct file *file, void *fh,
> +			   struct v4l2_selection *s)
> +{
> +	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	struct vip_stream *stream = file2stream(file);
> +
> +	switch (s->target) {
> +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +		s->r.left = 0;
> +		s->r.top = 0;
> +		s->r.width = stream->width;
> +		s->r.height = stream->height;
> +		return 0;
> +
> +	case V4L2_SEL_TGT_COMPOSE:
> +	case V4L2_SEL_TGT_CROP:
> +		s->r = stream->port->c_rect;

This makes no sense having the same rectangle for both crop and compose.
What exactly is supported w.r.t. crop and compose?

> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
> +{
> +	if (a->left < b->left || a->top < b->top)
> +		return 0;
> +	if (a->left + a->width > b->left + b->width)
> +		return 0;
> +	if (a->top + a->height > b->top + b->height)
> +		return 0;
> +
> +	return 1;
> +}
> +
> +static int vip_s_selection(struct file *file, void *fh,
> +			   struct v4l2_selection *s)
> +{
> +	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +

This is missing checks against s->target.

> +	struct vip_stream *stream = file2stream(file);
> +	struct v4l2_rect r = s->r;
> +
> +	v4l_bound_align_image(&r.width, 0, stream->width, 0,
> +			      &r.height, 0, stream->height, 0, 0);
> +
> +	r.left = clamp_t(unsigned int, r.left, 0, stream->width - r.width);
> +	r.top  = clamp_t(unsigned int, r.top, 0, stream->height - r.height);
> +
> +	if (s->flags & V4L2_SEL_FLAG_LE && !enclosed_rectangle(&r, &s->r))
> +		return -ERANGE;
> +
> +	if (s->flags & V4L2_SEL_FLAG_GE && !enclosed_rectangle(&s->r, &r))
> +		return -ERANGE;
> +
> +	s->r = r;
> +	stream->port->c_rect = r;
> +
> +	v4l2_dbg(1, debug, stream, "cropped (%d,%d)/%dx%d of %dx%d\n",

Based on this comment I suspect you only support cropping, not composing.

> +		 r.left, r.top, r.width, r.height,
> +		 stream->width, stream->height);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops vip_ioctl_ops = {
> +	.vidioc_querycap	= vip_querycap,
> +	.vidioc_enum_input	= vip_enuminput,
> +	.vidioc_g_input		= vip_g_input,
> +	.vidioc_s_input		= vip_s_input,
> +
> +	.vidioc_querystd	= vip_querystd,
> +	.vidioc_g_std		= vip_g_std,
> +	.vidioc_s_std		= vip_s_std,
> +
> +	.vidioc_enum_fmt_vid_cap = vip_enum_fmt_vid_cap,
> +	.vidioc_g_fmt_vid_cap	= vip_g_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap	= vip_try_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap	= vip_s_fmt_vid_cap,
> +
> +	.vidioc_enum_frameintervals	= vip_enum_frameintervals,
> +	.vidioc_enum_framesizes		= vip_enum_framesizes,
> +	.vidioc_s_parm			= vip_s_parm,
> +	.vidioc_g_parm			= vip_g_parm,
> +	.vidioc_g_selection	= vip_g_selection,
> +	.vidioc_s_selection	= vip_s_selection,
> +	.vidioc_reqbufs		= vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs	= vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf	= vb2_ioctl_prepare_buf,
> +	.vidioc_querybuf	= vb2_ioctl_querybuf,
> +	.vidioc_qbuf		= vb2_ioctl_qbuf,
> +	.vidioc_dqbuf		= vb2_ioctl_dqbuf,
> +	.vidioc_expbuf		= vb2_ioctl_expbuf,
> +
> +	.vidioc_streamon	= vb2_ioctl_streamon,
> +	.vidioc_streamoff	= vb2_ioctl_streamoff,
> +	.vidioc_log_status	= v4l2_ctrl_log_status,
> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +/*
> + * Videobuf operations
> + */
> +static int vip_queue_setup(struct vb2_queue *vq,
> +			   unsigned int *nbuffers, unsigned int *nplanes,
> +			   unsigned int sizes[], struct device *alloc_devs[])
> +{
> +	struct vip_stream *stream = vb2_get_drv_priv(vq);
> +	unsigned int size = stream->sizeimage;
> +
> +	if (vq->max_num_buffers + *nbuffers < 3)
> +		*nbuffers = 3 - vq->max_num_buffers;
> +
> +	if (*nplanes) {
> +		if (sizes[0] < size)
> +			return -EINVAL;
> +		size = sizes[0];
> +	}
> +
> +	*nplanes = 1;
> +	sizes[0] = size;
> +
> +	v4l2_dbg(1, debug, stream, "get %d buffer(s) of size %d each.\n",
> +		 *nbuffers, sizes[0]);
> +
> +	return 0;
> +}
> +
> +static int vip_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vip_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	if (vb2_plane_size(vb, 0) < stream->sizeimage) {
> +		v4l2_dbg(1, debug, stream,
> +			 "%s data will not fit into plane (%lu < %lu)\n",
> +			 __func__, vb2_plane_size(vb, 0),
> +			(long)stream->sizeimage);
> +		return -EINVAL;
> +	}
> +
> +	vb2_set_plane_payload(vb, 0, stream->sizeimage);
> +
> +	return 0;
> +}
> +
> +static void vip_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vip_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vip_dev *dev = stream->port->dev;
> +	struct vip_buffer *buf = container_of(vb, struct vip_buffer,
> +					      vb.vb2_buf);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dev->slock, flags);
> +	list_add_tail(&buf->list, &stream->vidq);
> +	spin_unlock_irqrestore(&dev->slock, flags);
> +}
> +
> +static void return_buffers(struct vb2_queue *vq, int state)
> +{
> +	struct vip_stream *stream = vb2_get_drv_priv(vq);
> +	struct vip_dev *dev = stream->port->dev;
> +	struct vip_buffer *buf, *node;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dev->slock, flags);
> +	list_for_each_entry_safe(buf, node, &stream->vidq, list) {
> +		vb2_buffer_done(&buf->vb.vb2_buf, state);
> +		list_del(&buf->list);
> +	}
> +	spin_unlock_irqrestore(&dev->slock, flags);
> +}
> +
> +static int vip_setup_scaler(struct vip_stream *stream)
> +{
> +	struct vip_port *port = stream->port;
> +	struct vip_dev *dev = port->dev;
> +	struct sc_data *sc = dev->sc;
> +	struct csc_data *csc = dev->csc;
> +	struct vpdma_data *vpdma = dev->shared->vpdma;
> +	struct vip_mmr_adb *mmr_adb = port->mmr_adb.addr;
> +	int list_num = stream->list_num;
> +	int timeout = 500;
> +	struct v4l2_format dst_f;
> +	struct v4l2_format src_f;
> +
> +	memset(&src_f, 0, sizeof(src_f));
> +	src_f.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	v4l2_fill_pix_format(&src_f.fmt.pix, &port->mbus_framefmt);
> +	src_f.fmt.pix.pixelformat = vip_mbus_code_to_fourcc(port->fmt->code);
> +
> +	dst_f = src_f;
> +	dst_f.fmt.pix.pixelformat = port->fmt->fourcc;
> +	dst_f.fmt.pix.width = stream->width;
> +	dst_f.fmt.pix.height = stream->height;
> +
> +	/* if scaler not associated with this port then skip */
> +	if (port->scaler) {
> +		sc_set_hs_coeffs(sc, port->sc_coeff_h.addr,
> +				 port->mbus_framefmt.width,
> +				 port->c_rect.width);
> +		sc_set_vs_coeffs(sc, port->sc_coeff_v.addr,
> +				 port->mbus_framefmt.height,
> +				 port->c_rect.height);
> +		sc_config_scaler(sc, &mmr_adb->sc_regs0[0],
> +				 &mmr_adb->sc_regs8[0], &mmr_adb->sc_regs17[0],
> +				 port->mbus_framefmt.width,
> +				 port->mbus_framefmt.height,
> +				 port->c_rect.width,
> +				 port->c_rect.height);
> +		port->load_mmrs = true;
> +	}
> +
> +	/* if csc not associated with this port then skip */
> +	if (port->csc) {
> +		csc_set_coeff(csc, &mmr_adb->csc_regs[0],
> +			      &src_f, &dst_f);
> +
> +		port->load_mmrs = true;
> +	}
> +
> +	/* If coeff are already loaded then skip */
> +	if (!sc->load_coeff_v && !sc->load_coeff_h && !port->load_mmrs)
> +		return 0;
> +
> +	if (vpdma_list_busy(vpdma, list_num)) {
> +		v4l2_dbg(3, debug, stream, "%s: List %d is busy\n",
> +			 __func__, list_num);
> +	}
> +
> +	/* Make sure we start with a clean list */
> +	vpdma_reset_desc_list(&stream->desc_list);
> +
> +	/* config descriptors */
> +	if (port->load_mmrs) {
> +		vpdma_map_desc_buf(vpdma, &port->mmr_adb);
> +		vpdma_add_cfd_adb(&stream->desc_list, CFD_MMR_CLIENT,
> +				  &port->mmr_adb);
> +
> +		port->load_mmrs = false;
> +		v4l2_dbg(3, debug, stream, "Added mmr_adb config desc\n");
> +	}
> +
> +	if (sc->loaded_coeff_h != port->sc_coeff_h.dma_addr ||
> +	    sc->load_coeff_h) {
> +		vpdma_map_desc_buf(vpdma, &port->sc_coeff_h);
> +		vpdma_add_cfd_block(&stream->desc_list,
> +				    VIP_SLICE1_CFD_SC_CLIENT + dev->slice_id,
> +				    &port->sc_coeff_h, 0);
> +
> +		sc->loaded_coeff_h = port->sc_coeff_h.dma_addr;
> +		sc->load_coeff_h = false;
> +		v4l2_dbg(3, debug, stream, "Added sc_coeff_h config desc\n");
> +	}
> +
> +	if (sc->loaded_coeff_v != port->sc_coeff_v.dma_addr ||
> +	    sc->load_coeff_v) {
> +		vpdma_map_desc_buf(vpdma, &port->sc_coeff_v);
> +		vpdma_add_cfd_block(&stream->desc_list,
> +				    VIP_SLICE1_CFD_SC_CLIENT + dev->slice_id,
> +				    &port->sc_coeff_v, SC_COEF_SRAM_SIZE >> 4);
> +
> +		sc->loaded_coeff_v = port->sc_coeff_v.dma_addr;
> +		sc->load_coeff_v = false;
> +		v4l2_dbg(3, debug, stream, "Added sc_coeff_v config desc\n");
> +	}
> +	v4l2_dbg(3, debug, stream, "CFD_SC_CLIENT %d slice_id: %d\n",
> +		 VIP_SLICE1_CFD_SC_CLIENT + dev->slice_id, dev->slice_id);
> +
> +	vpdma_map_desc_buf(vpdma, &stream->desc_list.buf);
> +	v4l2_dbg(3, debug, stream, "Submitting desc on list# %d\n", list_num);
> +	vpdma_submit_descs(vpdma, &stream->desc_list, list_num);
> +
> +	while (vpdma_list_busy(vpdma, list_num) && timeout--)
> +		usleep_range(1000, 1100);
> +
> +	vpdma_unmap_desc_buf(dev->shared->vpdma, &port->mmr_adb);
> +	vpdma_unmap_desc_buf(dev->shared->vpdma, &port->sc_coeff_h);
> +	vpdma_unmap_desc_buf(dev->shared->vpdma, &port->sc_coeff_v);
> +	vpdma_unmap_desc_buf(dev->shared->vpdma, &stream->desc_list.buf);
> +
> +	vpdma_reset_desc_list(&stream->desc_list);
> +
> +	if (timeout <= 0) {
> +		v4l2_err(stream, "Timed out setting up scaler through VPDMA list\n");
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static int vip_load_vpdma_list_fifo(struct vip_stream *stream)
> +{
> +	struct vip_port *port = stream->port;
> +	struct vip_dev *dev = port->dev;
> +	struct vpdma_data *vpdma = dev->shared->vpdma;
> +	int list_num = stream->list_num;
> +	struct vip_buffer *buf;
> +	unsigned long flags;
> +	int timeout, i;
> +
> +	if (vpdma_list_busy(dev->shared->vpdma, stream->list_num))
> +		return -EBUSY;
> +
> +	for (i = 0; i < VIP_VPDMA_FIFO_SIZE; i++) {
> +		spin_lock_irqsave(&dev->slock, flags);
> +		if (list_empty(&stream->vidq)) {
> +			v4l2_err(stream, "No buffer left!");
> +			spin_unlock_irqrestore(&dev->slock, flags);
> +			return -EINVAL;
> +		}
> +
> +		buf = list_entry(stream->vidq.next,
> +				 struct vip_buffer, list);
> +		buf->drop = false;
> +
> +		list_move_tail(&buf->list, &stream->post_bufs);
> +		spin_unlock_irqrestore(&dev->slock, flags);
> +
> +		v4l2_dbg(2, debug, stream, "%s: start_dma vb2 buf idx:%d\n",
> +			 __func__, buf->vb.vb2_buf.index);
> +		start_dma(stream, buf);
> +
> +		timeout = 500;
> +		while (vpdma_list_busy(vpdma, list_num) && timeout--)
> +			usleep_range(1000, 1100);
> +
> +		if (timeout <= 0) {
> +			v4l2_err(stream, "Timed out loading VPDMA list fifo\n");
> +			return -EBUSY;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int vip_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct vip_stream *stream = vb2_get_drv_priv(vq);
> +	struct vip_port *port = stream->port;
> +	struct vip_dev *dev = port->dev;
> +	int ret;
> +
> +	vip_setup_scaler(stream);
> +
> +	/*
> +	 * Make sure the scaler is configured before the datapath is
> +	 * enabled. The scaler can only load the coefficient
> +	 * parameters when it is idle. If the scaler path is enabled
> +	 * and video data is being received then the VPDMA transfer will
> +	 * stall indefinetely.
> +	 */
> +	set_fmt_params(stream);
> +	vip_setup_parser(port);
> +
> +	if (port->subdev) {
> +		ret = v4l2_subdev_call(port->subdev, video, s_stream, 1);
> +		if (ret) {
> +			return_buffers(vq, VB2_BUF_STATE_QUEUED);
> +			v4l2_dbg(1, debug, stream, "stream on failed in subdev\n");
> +			return ret;
> +		}
> +	}
> +
> +	stream->sequence = 0;
> +	stream->field = V4L2_FIELD_TOP;
> +	populate_desc_list(stream);
> +
> +	ret = vip_load_vpdma_list_fifo(stream);
> +	if (ret)
> +		return ret;
> +
> +	stream->num_recovery = 0;
> +
> +	clear_irqs(dev, dev->slice_id, stream->list_num);
> +	enable_irqs(dev, dev->slice_id, stream->list_num);
> +	vip_schedule_next_buffer(stream);
> +	vip_parser_stop_imm(port, false);
> +	vip_enable_parser(port, true);
> +
> +	return 0;
> +}
> +
> +/*
> + * Abort streaming and wait for last buffer
> + */
> +static void vip_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct vip_stream *stream = vb2_get_drv_priv(vq);
> +	struct vip_port *port = stream->port;
> +	struct vip_dev *dev = port->dev;
> +	struct vip_buffer *buf;
> +	int ret;
> +
> +	vip_parser_stop_imm(port, true);
> +	vip_enable_parser(port, false);
> +	unset_fmt_params(stream);
> +
> +	disable_irqs(dev, dev->slice_id, stream->list_num);
> +	clear_irqs(dev, dev->slice_id, stream->list_num);
> +
> +	if (port->subdev) {
> +		ret = v4l2_subdev_call(port->subdev, video, s_stream, 0);
> +		if (ret)
> +			v4l2_dbg(1, debug, stream, "stream on failed in subdev\n");
> +	}
> +
> +	stop_dma(stream, true);
> +
> +	/* release all active buffers */
> +	while (!list_empty(&stream->post_bufs)) {
> +		buf = list_entry(stream->post_bufs.next,
> +				 struct vip_buffer, list);
> +		list_del(&buf->list);
> +		if (buf->drop == 1)
> +			list_add_tail(&buf->list, &stream->dropq);
> +		else
> +			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +	}
> +	while (!list_empty(&stream->vidq)) {
> +		buf = list_entry(stream->vidq.next, struct vip_buffer, list);
> +		list_del(&buf->list);
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +	}
> +
> +	if (!vb2_is_streaming(vq))
> +		return;
> +
> +	vpdma_unmap_desc_buf(dev->shared->vpdma, &stream->desc_list.buf);
> +	vpdma_reset_desc_list(&stream->desc_list);
> +}
> +
> +static const struct vb2_ops vip_video_qops = {
> +	.queue_setup		= vip_queue_setup,
> +	.buf_prepare		= vip_buf_prepare,
> +	.buf_queue		= vip_buf_queue,
> +	.start_streaming	= vip_start_streaming,
> +	.stop_streaming		= vip_stop_streaming,
> +	.wait_prepare		= vb2_ops_wait_prepare,
> +	.wait_finish		= vb2_ops_wait_finish,

Drop wait_prepare/finish. This is no longer needed and these callbacks will
be removed in the near future.

> +};
> +
> +static int vip_init_dev(struct vip_dev *dev)
> +{
> +	if (dev->num_ports != 0)
> +		goto done;
> +
> +	vip_set_clock_enable(dev, 1);
> +	vip_module_toggle(dev, VIP_SC_RST, false);
> +	vip_module_toggle(dev, VIP_CSC_RST, false);
> +done:
> +	dev->num_ports++;
> +
> +	return 0;
> +}
> +
> +static inline bool is_scaler_available(struct vip_port *port)
> +{
> +	if (port->endpoint.bus_type == V4L2_MBUS_PARALLEL)
> +		if (port->dev->sc_assigned == VIP_NOT_ASSIGNED ||
> +		    port->dev->sc_assigned == port->port_id)
> +			return true;
> +	return false;
> +}
> +
> +static inline bool allocate_scaler(struct vip_port *port)
> +{
> +	if (is_scaler_available(port)) {
> +		if (port->dev->sc_assigned == VIP_NOT_ASSIGNED ||
> +		    port->dev->sc_assigned == port->port_id) {
> +			port->dev->sc_assigned = port->port_id;
> +			port->scaler = true;
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
> +static inline void free_scaler(struct vip_port *port)
> +{
> +	if (port->dev->sc_assigned == port->port_id) {
> +		port->dev->sc_assigned = VIP_NOT_ASSIGNED;
> +		port->scaler = false;
> +	}
> +}
> +
> +static bool is_csc_available(struct vip_port *port)
> +{
> +	if (port->endpoint.bus_type == V4L2_MBUS_PARALLEL)
> +		if (port->dev->csc_assigned == VIP_NOT_ASSIGNED ||
> +		    port->dev->csc_assigned == port->port_id)
> +			return true;
> +	return false;
> +}
> +
> +static bool allocate_csc(struct vip_port *port,
> +			 enum vip_csc_state csc_direction)
> +{
> +	/* Is CSC needed? */
> +	if (csc_direction != VIP_CSC_NA) {
> +		if (is_csc_available(port)) {
> +			port->dev->csc_assigned = port->port_id;
> +			port->csc = csc_direction;
> +			v4l2_dbg(1, debug, port, "%s: csc allocated: dir: %d\n",
> +				 __func__, csc_direction);
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
> +static void free_csc(struct vip_port *port)
> +{
> +	if (port->dev->csc_assigned == port->port_id) {
> +		port->dev->csc_assigned = VIP_NOT_ASSIGNED;
> +		port->csc = VIP_CSC_NA;
> +		v4l2_dbg(1, debug, port, "%s: csc freed\n",
> +			 __func__);
> +	}
> +}
> +
> +static int vip_init_port(struct vip_port *port)
> +{
> +	int ret;
> +	struct vip_fmt *fmt;
> +	struct v4l2_subdev_format sd_fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.pad = 0,
> +	};
> +	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
> +
> +	if (port->num_streams != 0)
> +		goto done;
> +
> +	ret = vip_init_dev(port->dev);
> +	if (ret)
> +		goto done;
> +
> +	/* Get subdevice current frame format */
> +	ret = v4l2_subdev_call(port->subdev, pad, get_fmt, NULL, &sd_fmt);
> +	if (ret)
> +		v4l2_dbg(1, debug, port, "init_port get_fmt failed in subdev: (%d)\n",
> +			 ret);
> +
> +	/* try to find one that matches */
> +	fmt = find_port_format_by_code(port, mbus_fmt->code);
> +	if (!fmt) {
> +		v4l2_dbg(1, debug, port, "subdev default mbus_fmt %04x is not matched.\n",
> +			 mbus_fmt->code);
> +		/* if all else fails just pick the first one */
> +		fmt = port->active_fmt[0];
> +
> +		mbus_fmt->code = fmt->code;
> +		sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +		sd_fmt.pad = 0;
> +		ret = v4l2_subdev_call(port->subdev, pad, set_fmt,
> +				       NULL, &sd_fmt);
> +		if (ret)
> +			v4l2_dbg(1, debug, port, "init_port set_fmt failed in subdev: (%d)\n",
> +				 ret);
> +	}
> +
> +	/* Assign current format */
> +	port->fmt = fmt;
> +	port->mbus_framefmt = *mbus_fmt;
> +
> +	v4l2_dbg(3, debug, port, "%s: g_mbus_fmt subdev mbus_code: %04X fourcc:%s size: %dx%d\n",
> +		 __func__, fmt->code,
> +		fourcc_to_str(fmt->fourcc),
> +		mbus_fmt->width, mbus_fmt->height);
> +
> +	if (mbus_fmt->field == V4L2_FIELD_ALTERNATE)
> +		port->flags |= FLAG_INTERLACED;
> +	else
> +		port->flags &= ~FLAG_INTERLACED;
> +
> +	port->c_rect.left	= 0;
> +	port->c_rect.top	= 0;
> +	port->c_rect.width	= mbus_fmt->width;
> +	port->c_rect.height	= mbus_fmt->height;
> +
> +	ret = vpdma_alloc_desc_buf(&port->sc_coeff_h, SC_COEF_SRAM_SIZE);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = vpdma_alloc_desc_buf(&port->sc_coeff_v, SC_COEF_SRAM_SIZE);
> +	if (ret != 0)
> +		goto free_sc_h;
> +
> +	ret = vpdma_alloc_desc_buf(&port->mmr_adb, sizeof(struct vip_mmr_adb));
> +	if (ret != 0)
> +		goto free_sc_v;
> +
> +	init_adb_hdrs(port);
> +
> +	vip_enable_parser(port, false);
> +done:
> +	port->num_streams++;
> +	return 0;
> +
> +free_sc_v:
> +	vpdma_free_desc_buf(&port->sc_coeff_v);
> +free_sc_h:
> +	vpdma_free_desc_buf(&port->sc_coeff_h);
> +	return ret;
> +}
> +
> +static int vip_init_stream(struct vip_stream *stream)
> +{
> +	struct vip_port *port = stream->port;
> +	struct vip_fmt *fmt;
> +	struct v4l2_mbus_framefmt *mbus_fmt;
> +	struct v4l2_format f;
> +	int ret;
> +
> +	ret = vip_init_port(port);
> +	if (ret != 0)
> +		return ret;
> +
> +	fmt = port->fmt;
> +	mbus_fmt = &port->mbus_framefmt;
> +
> +	memset(&f, 0, sizeof(f));
> +
> +	/* Properly calculate the sizeimage and bytesperline values. */
> +	v4l2_fill_pix_format(&f.fmt.pix, mbus_fmt);
> +	f.fmt.pix.pixelformat = fmt->fourcc;
> +	ret = vip_calc_format_size(port, fmt, &f);
> +	if (ret)
> +		return ret;
> +
> +	stream->width = f.fmt.pix.width;
> +	stream->height = f.fmt.pix.height;
> +	stream->sup_field = f.fmt.pix.field;
> +	stream->bytesperline = f.fmt.pix.bytesperline;
> +	stream->sizeimage = f.fmt.pix.sizeimage;
> +
> +	v4l2_dbg(3, debug, stream, "init_stream fourcc:%s size: %dx%d bpl:%d img_size:%d\n",
> +		 fourcc_to_str(f.fmt.pix.pixelformat),
> +		 f.fmt.pix.width, f.fmt.pix.height,
> +		 f.fmt.pix.bytesperline, f.fmt.pix.sizeimage);
> +	v4l2_dbg(3, debug, stream, "init_stream vpdma data type: 0x%02X\n",
> +		 port->fmt->vpdma_fmt[0]->data_type);
> +
> +	ret = vpdma_create_desc_list(&stream->desc_list, VIP_DESC_LIST_SIZE,
> +				     VPDMA_LIST_TYPE_NORMAL);
> +
> +	if (ret != 0)
> +		return ret;
> +
> +	stream->write_desc = (struct vpdma_dtd *)stream->desc_list.buf.addr
> +				+ 15;
> +
> +	v4l2_dbg(1, debug, stream, "%s: stream instance %pa\n",
> +		 __func__, &stream);
> +
> +	return 0;
> +}
> +
> +static void vip_release_dev(struct vip_dev *dev)
> +{
> +	/*
> +	 * On last close, disable clocks to conserve power
> +	 */
> +
> +	if (--dev->num_ports == 0) {
> +		/* reset the scaler module */
> +		vip_module_toggle(dev, VIP_SC_RST, true);
> +		vip_module_toggle(dev, VIP_CSC_RST, true);
> +		vip_set_clock_enable(dev, 0);
> +	}
> +}
> +
> +static int vip_set_crop_parser(struct vip_port *port)
> +{
> +	struct vip_dev *dev = port->dev;
> +	struct vip_parser_data *parser = dev->parser;
> +	u32 hcrop = 0, vcrop = 0;
> +	u32 width = port->mbus_framefmt.width;
> +
> +	if (port->fmt->vpdma_fmt[0] == &vpdma_raw_fmts[VPDMA_DATA_FMT_RAW8]) {
> +		/*
> +		 * Special case since we are faking a YUV422 16bit format
> +		 * to have the vpdma perform the needed byte swap
> +		 * we need to adjust the pixel width accordingly
> +		 * otherwise the parser will attempt to collect more pixels
> +		 * then available and the vpdma transfer will exceed the
> +		 * allocated frame buffer.
> +		 */
> +		width >>= 1;
> +		v4l2_dbg(1, debug, port, "%s: 8 bit raw detected, adjusting width to %d\n",
> +			 __func__, width);
> +	}
> +
> +	/*
> +	 * Set Parser Crop parameters to source size otherwise
> +	 * scaler and colorspace converter will yield garbage.
> +	 */
> +	hcrop = VIP_ACT_BYPASS;
> +	insert_field(&hcrop, 0, VIP_ACT_SKIP_NUMPIX_MASK,
> +		     VIP_ACT_SKIP_NUMPIX_SHFT);
> +	insert_field(&hcrop, width,
> +		     VIP_ACT_USE_NUMPIX_MASK, VIP_ACT_USE_NUMPIX_SHFT);
> +	reg_write(parser, VIP_PARSER_CROP_H_PORT(port->port_id), hcrop);
> +
> +	insert_field(&vcrop, 0, VIP_ACT_SKIP_NUMLINES_MASK,
> +		     VIP_ACT_SKIP_NUMLINES_SHFT);
> +	insert_field(&vcrop, port->mbus_framefmt.height,
> +		     VIP_ACT_USE_NUMLINES_MASK, VIP_ACT_USE_NUMLINES_SHFT);
> +	reg_write(parser, VIP_PARSER_CROP_V_PORT(port->port_id), vcrop);
> +
> +	return 0;
> +}
> +
> +static int vip_setup_parser(struct vip_port *port)
> +{
> +	struct vip_dev *dev = port->dev;
> +	struct vip_parser_data *parser = dev->parser;
> +	struct v4l2_fwnode_endpoint *endpoint = &port->endpoint;
> +	struct vip_bt656_bus *bt656_ep = &port->bt656_endpoint;
> +	int iface, sync_type;
> +	u32 flags = 0, config0;
> +
> +	/* Reset the port */
> +	vip_reset_parser(port, true);
> +	usleep_range(200, 250);
> +	vip_reset_parser(port, false);
> +
> +	config0 = reg_read(parser, VIP_PARSER_PORT(port->port_id));
> +
> +	if (endpoint->bus_type == V4L2_MBUS_BT656) {
> +		flags = endpoint->bus.parallel.flags;
> +		iface = DUAL_8B_INTERFACE;
> +
> +		/*
> +		 * Ideally, this should come from subdev
> +		 * port->fmt can be anything once CSC is enabled
> +		 */
> +		if (vip_is_mbuscode_rgb(port->fmt->code)) {
> +			sync_type = EMBEDDED_SYNC_SINGLE_RGB_OR_YUV444;
> +		} else {
> +			switch (bt656_ep->num_channels) {
> +			case 4:
> +				sync_type = EMBEDDED_SYNC_4X_MULTIPLEXED_YUV422;
> +				break;
> +			case 2:
> +				sync_type = EMBEDDED_SYNC_2X_MULTIPLEXED_YUV422;
> +				break;
> +			case 1:
> +				sync_type = EMBEDDED_SYNC_SINGLE_YUV422;
> +				break;
> +			default:
> +				sync_type =
> +				EMBEDDED_SYNC_LINE_MULTIPLEXED_YUV422;
> +			}
> +			if (bt656_ep->pixmux == 0)
> +				sync_type =
> +				EMBEDDED_SYNC_LINE_MULTIPLEXED_YUV422;
> +		}
> +
> +	} else if (endpoint->bus_type == V4L2_MBUS_PARALLEL) {
> +		flags = endpoint->bus.parallel.flags;
> +
> +		switch (endpoint->bus.parallel.bus_width) {
> +		case 24:
> +			iface = SINGLE_24B_INTERFACE;
> +		break;
> +		case 16:
> +			iface = SINGLE_16B_INTERFACE;
> +		break;
> +		case 8:
> +		default:
> +			iface = DUAL_8B_INTERFACE;
> +		}
> +
> +		if (vip_is_mbuscode_rgb(port->fmt->code))
> +			sync_type = DISCRETE_SYNC_SINGLE_RGB_24B;
> +		else
> +			sync_type = DISCRETE_SYNC_SINGLE_YUV422;
> +
> +		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> +			config0 |= VIP_HSYNC_POLARITY;
> +		else if (flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> +			config0 &= ~VIP_HSYNC_POLARITY;
> +
> +		if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
> +			config0 |= VIP_VSYNC_POLARITY;
> +		else if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> +			config0 &= ~VIP_VSYNC_POLARITY;
> +
> +		config0 &= ~VIP_USE_ACTVID_HSYNC_ONLY;
> +		config0 |= VIP_ACTVID_POLARITY;
> +		config0 |= VIP_DISCRETE_BASIC_MODE;
> +
> +	} else {
> +		v4l2_err(port, "Device doesn't support CSI2");
> +		return -EINVAL;
> +	}
> +
> +	if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING) {
> +		vip_set_pclk_invert(port);
> +		config0 |= VIP_PIXCLK_EDGE_POLARITY;
> +	} else {
> +		config0 &= ~VIP_PIXCLK_EDGE_POLARITY;
> +	}
> +
> +	config0 |= ((sync_type & VIP_SYNC_TYPE_MASK) << VIP_SYNC_TYPE_SHFT);
> +
> +	reg_write(parser, VIP_PARSER_PORT(port->port_id), config0);
> +
> +	vip_set_data_interface(port, iface);
> +	vip_set_crop_parser(port);
> +
> +	return 0;
> +}
> +
> +static void vip_enable_parser(struct vip_port *port, bool on)
> +{
> +	u32 config0;
> +	struct vip_dev *dev = port->dev;
> +	struct vip_parser_data *parser = dev->parser;
> +
> +	config0 = reg_read(parser, VIP_PARSER_PORT(port->port_id));
> +
> +	if (on) {
> +		config0 |= VIP_PORT_ENABLE;
> +		config0 &= ~(VIP_ASYNC_FIFO_RD | VIP_ASYNC_FIFO_WR);
> +	} else {
> +		config0 &= ~VIP_PORT_ENABLE;
> +		config0 |= (VIP_ASYNC_FIFO_RD | VIP_ASYNC_FIFO_WR);
> +	}
> +	reg_write(parser, VIP_PARSER_PORT(port->port_id), config0);
> +}
> +
> +static void vip_reset_parser(struct vip_port *port, bool on)
> +{
> +	u32 config0;
> +	struct vip_dev *dev = port->dev;
> +	struct vip_parser_data *parser = dev->parser;
> +
> +	config0 = reg_read(parser, VIP_PARSER_PORT(port->port_id));
> +
> +	if (on)
> +		config0 |= VIP_SW_RESET;
> +	else
> +		config0 &= ~VIP_SW_RESET;
> +
> +	reg_write(parser, VIP_PARSER_PORT(port->port_id), config0);
> +}
> +
> +static void vip_parser_stop_imm(struct vip_port *port, bool on)
> +{
> +	u32 config0;
> +	struct vip_dev *dev = port->dev;
> +	struct vip_parser_data *parser = dev->parser;
> +
> +	config0 = reg_read(parser, VIP_PARSER_STOP_IMM_PORT(port->port_id));
> +
> +	if (on)
> +		config0 = 0xffffffff;
> +	else
> +		config0 = 0;
> +
> +	reg_write(parser, VIP_PARSER_STOP_IMM_PORT(port->port_id), config0);
> +}
> +
> +static void vip_release_stream(struct vip_stream *stream)
> +{
> +	struct vip_dev *dev = stream->port->dev;
> +
> +	v4l2_dbg(1, debug, stream, "%s: stream instance %pa\n",
> +		 __func__, &stream);
> +
> +	vpdma_unmap_desc_buf(dev->shared->vpdma, &stream->desc_list.buf);
> +	vpdma_free_desc_buf(&stream->desc_list.buf);
> +	vpdma_free_desc_list(&stream->desc_list);
> +}
> +
> +static void vip_release_port(struct vip_port *port)
> +{
> +	v4l2_dbg(1, debug, port, "%s: port instance %pa\n",
> +		 __func__, &port);
> +
> +	vpdma_free_desc_buf(&port->mmr_adb);
> +	vpdma_free_desc_buf(&port->sc_coeff_h);
> +	vpdma_free_desc_buf(&port->sc_coeff_v);
> +}
> +
> +static void stop_dma(struct vip_stream *stream, bool clear_list)
> +{
> +	struct vip_dev *dev = stream->port->dev;
> +	int ch, size = 0;
> +
> +	/* Create a list of channels to be cleared */
> +	for (ch = 0; ch < VPDMA_MAX_CHANNELS; ch++) {
> +		if (stream->vpdma_channels[ch] == 1) {
> +			stream->vpdma_channels_to_abort[size++] = ch;
> +			v4l2_dbg(2, debug, stream, "Clear channel no: %d\n", ch);
> +		}
> +	}
> +
> +	/* Clear all the used channels for the list */
> +	vpdma_list_cleanup(dev->shared->vpdma, stream->list_num,
> +			   stream->vpdma_channels_to_abort, size);
> +
> +	if (clear_list)
> +		for (ch = 0; ch < VPDMA_MAX_CHANNELS; ch++)
> +			stream->vpdma_channels[ch] = 0;
> +}
> +
> +static int vip_open(struct file *file)
> +{
> +	struct vip_stream *stream = video_drvdata(file);
> +	struct vip_port *port = stream->port;
> +	struct vip_dev *dev = port->dev;
> +	int ret = 0;
> +
> +	mutex_lock(&dev->mutex);
> +
> +	ret = v4l2_fh_open(file);
> +	if (ret) {
> +		v4l2_err(stream, "v4l2_fh_open failed\n");
> +		goto unlock;
> +	}
> +
> +	/*
> +	 * If this is the first open file.
> +	 * Then initialize hw module.
> +	 */
> +	if (!v4l2_fh_is_singular_file(file))
> +		goto unlock;
> +
> +	if (vip_init_stream(stream))
> +		ret = -ENODEV;
> +unlock:
> +	mutex_unlock(&dev->mutex);
> +	return ret;
> +}
> +
> +static int vip_release(struct file *file)
> +{
> +	struct vip_stream *stream = video_drvdata(file);
> +	struct vip_port *port = stream->port;
> +	struct vip_dev *dev = port->dev;
> +	bool fh_singular;
> +	int ret;
> +
> +	mutex_lock(&dev->mutex);
> +
> +	/* Save the singular status before we call the clean-up helper */
> +	fh_singular = v4l2_fh_is_singular_file(file);
> +
> +	/* the release helper will cleanup any on-going streaming */
> +	ret = _vb2_fop_release(file, NULL);
> +
> +	free_csc(port);
> +	free_scaler(port);
> +
> +	/*
> +	 * If this is the last open file.
> +	 * Then de-initialize hw module.
> +	 */
> +	if (fh_singular) {
> +		vip_release_stream(stream);
> +
> +		if (--port->num_streams == 0) {
> +			vip_release_port(port);
> +			vip_release_dev(port->dev);
> +		}
> +	}
> +
> +	mutex_unlock(&dev->mutex);
> +
> +	return ret;
> +}
> +
> +/*
> + * File operations
> + */
> +static const struct v4l2_file_operations vip_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= vip_open,
> +	.release	= vip_release,
> +	.read		= vb2_fop_read,
> +	.poll		= vb2_fop_poll,
> +	.unlocked_ioctl	= video_ioctl2,
> +	.mmap		= vb2_fop_mmap,
> +};
> +
> +static struct video_device vip_videodev = {
> +	.name		= VIP_MODULE_NAME,
> +	.fops		= &vip_fops,
> +	.ioctl_ops	= &vip_ioctl_ops,
> +	.minor		= -1,
> +	.release	= video_device_release,
> +	.tvnorms	= V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
> +	.device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE |
> +			  V4L2_CAP_READWRITE,
> +};
> +
> +static int alloc_stream(struct vip_port *port, int stream_id, int vfl_type)
> +{
> +	struct vip_stream *stream;
> +	struct vip_dev *dev = port->dev;
> +	struct vb2_queue *q;
> +	struct video_device *vfd;
> +	struct vip_buffer *buf;
> +	struct list_head *pos, *tmp;
> +	int ret, i;
> +	u32 vin_id;
> +
> +	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> +	if (!stream)
> +		return -ENOMEM;
> +
> +	stream->port = port;
> +	stream->stream_id = stream_id;
> +	stream->vfl_type = vfl_type;
> +	port->cap_streams[stream_id] = stream;
> +
> +	vin_id = 1 + ((dev->instance_id - 1) * 2) + dev->slice_id;
> +	snprintf(stream->name, sizeof(stream->name), "vin%d%c-%d",
> +		 vin_id, (port->port_id == VIP_PORTA) ? 'a' : 'b', stream_id);
> +
> +	stream->list_num = vpdma_hwlist_alloc(dev->shared->vpdma, stream);
> +	if (stream->list_num < 0) {
> +		v4l2_err(stream, "Could not get VPDMA hwlist");
> +		ret = -ENODEV;
> +		goto do_free_stream;
> +	}
> +
> +	INIT_LIST_HEAD(&stream->post_bufs);
> +
> +	/*
> +	 * Initialize queue
> +	 */
> +	q = &stream->vb_vidq;
> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
> +	q->drv_priv = stream;
> +	q->buf_struct_size = sizeof(struct vip_buffer);
> +	q->ops = &vip_video_qops;
> +	q->mem_ops = &vb2_dma_contig_memops;
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->lock = &dev->mutex;
> +	q->min_reqbufs_allocation = 3;
> +	q->dev = dev->v4l2_dev->dev;
> +
> +	ret = vb2_queue_init(q);
> +	if (ret)
> +		goto do_free_hwlist;
> +
> +	INIT_WORK(&stream->recovery_work, vip_overflow_recovery_work);
> +
> +	INIT_LIST_HEAD(&stream->vidq);
> +
> +	/* Allocate/populate Drop queue entries */
> +	INIT_LIST_HEAD(&stream->dropq);
> +	for (i = 0; i < VIP_DROPQ_SIZE; i++) {
> +		buf = kzalloc(sizeof(*buf), GFP_ATOMIC);
> +		if (!buf) {
> +			ret = -ENOMEM;
> +			goto do_free_dropq;
> +		}
> +		buf->drop = true;
> +		list_add(&buf->list, &stream->dropq);
> +	}
> +
> +	vfd = video_device_alloc();
> +	if (!vfd)
> +		goto do_free_dropq;
> +	*vfd = vip_videodev;
> +	vfd->v4l2_dev = dev->v4l2_dev;
> +	vfd->queue = q;
> +
> +	vfd->lock = &dev->mutex;
> +	video_set_drvdata(vfd, stream);
> +	stream->vfd = vfd;
> +
> +	ret = video_register_device(vfd, vfl_type, -1);
> +	if (ret) {
> +		v4l2_err(stream, "Failed to register video device\n");
> +		goto do_free_vfd;
> +	}
> +
> +	v4l2_info(stream, "device registered as %s\n",
> +		  video_device_node_name(vfd));
> +	return 0;
> +
> +do_free_vfd:
> +	video_device_release(vfd);
> +do_free_dropq:
> +	list_for_each_safe(pos, tmp, &stream->dropq) {
> +		buf = list_entry(pos,
> +				 struct vip_buffer, list);
> +		v4l2_dbg(1, debug, dev, "dropq buffer\n");
> +		list_del(pos);
> +		kfree(buf);
> +	}
> +do_free_hwlist:
> +	vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
> +do_free_stream:
> +	kfree(stream);
> +	return ret;
> +}
> +
> +static void free_stream(struct vip_stream *stream)
> +{
> +	struct vip_dev *dev;
> +	struct vip_buffer *buf;
> +	struct list_head *pos, *q;
> +
> +	if (!stream)
> +		return;
> +
> +	dev = stream->port->dev;
> +	/* Free up the Drop queue */
> +	list_for_each_safe(pos, q, &stream->dropq) {
> +		buf = list_entry(pos,
> +				 struct vip_buffer, list);
> +		v4l2_dbg(1, debug, stream, "dropq buffer\n");
> +		list_del(pos);
> +		kfree(buf);
> +	}
> +
> +	video_unregister_device(stream->vfd);
> +	vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
> +	stream->port->cap_streams[stream->stream_id] = NULL;
> +	kfree(stream);
> +}
> +
> +static int get_subdev_active_format(struct vip_port *port,
> +				    struct v4l2_subdev *subdev)
> +{
> +	struct vip_fmt *fmt;
> +	struct v4l2_subdev_mbus_code_enum mbus_code;
> +	int ret = 0;
> +	unsigned int k, i, j;
> +	enum vip_csc_state csc;
> +
> +	/* Enumerate sub device formats and enable all matching local formats */
> +	port->num_active_fmt = 0;
> +	for (k = 0, i = 0; (ret != -EINVAL); k++) {
> +		memset(&mbus_code, 0, sizeof(mbus_code));
> +		mbus_code.index = k;
> +		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
> +				       NULL, &mbus_code);
> +		if (ret)
> +			continue;
> +
> +		v4l2_dbg(2, debug, port,
> +			 "subdev %s: code: %04x idx: %d\n",
> +			 subdev->name, mbus_code.code, k);
> +
> +		for (j = 0; j < ARRAY_SIZE(vip_formats); j++) {
> +			fmt = &vip_formats[j];
> +			if (mbus_code.code != fmt->code)
> +				continue;
> +
> +			/*
> +			 * When the port is configured for BT656
> +			 * then none of the downstream unit can be used.
> +			 * So here we need to skip all format requiring
> +			 * either CSC or CHR_DS
> +			 */
> +			csc = vip_csc_direction(fmt->code, fmt->finfo);
> +			if (port->endpoint.bus_type == V4L2_MBUS_BT656 &&
> +			    (csc != VIP_CSC_NA || fmt->coplanar))
> +				continue;
> +
> +			port->active_fmt[i] = fmt;
> +			v4l2_dbg(2, debug, port,
> +				 "matched fourcc: %s: code: %04x idx: %d\n",
> +				 fourcc_to_str(fmt->fourcc), fmt->code, i);
> +			port->num_active_fmt = ++i;
> +		}
> +	}
> +
> +	if (i == 0) {
> +		v4l2_err(port, "No suitable format reported by subdev %s\n",
> +			 subdev->name);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int alloc_port(struct vip_dev *dev, int id)
> +{
> +	struct vip_port *port;
> +	u32 vin_id;
> +
> +	if (dev->ports[id])
> +		return -EINVAL;
> +
> +	port = devm_kzalloc(&dev->pdev->dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	dev->ports[id] = port;
> +	port->dev = dev;
> +	port->port_id = id;
> +	vin_id = 1 + ((dev->instance_id - 1) * 2) + dev->slice_id;
> +	snprintf(port->name, sizeof(port->name),
> +		 "vin%d%c", vin_id, (id == VIP_PORTA) ? 'a' : 'b');
> +	port->num_streams = 0;
> +	return 0;
> +}
> +
> +static void free_port(struct vip_port *port)
> +{
> +	if (!port)
> +		return;
> +
> +	v4l2_async_nf_unregister(&port->notifier);
> +	v4l2_async_nf_cleanup(&port->notifier);
> +	free_stream(port->cap_streams[0]);
> +}
> +
> +static int get_field(u32 value, u32 mask, int shift)
> +{
> +	return (value & (mask << shift)) >> shift;
> +}
> +
> +static int vip_probe_complete(struct platform_device *pdev);
> +static void vip_vpdma_fw_cb(struct platform_device *pdev)
> +{
> +	dev_info(&pdev->dev, "VPDMA firmware loaded\n");
> +
> +	if (pdev->dev.of_node)
> +		vip_probe_complete(pdev);
> +}
> +
> +static int vip_create_streams(struct vip_port *port,
> +			      struct v4l2_subdev *subdev)
> +{
> +	struct v4l2_mbus_config_parallel *bus;
> +	struct vip_bt656_bus *bt656_ep;
> +	int i;
> +
> +	for (i = 0; i < VIP_CAP_STREAMS_PER_PORT; i++)
> +		free_stream(port->cap_streams[i]);
> +
> +	if (get_subdev_active_format(port, subdev))
> +		return -ENODEV;
> +
> +	port->subdev = subdev;
> +
> +	if (port->endpoint.bus_type == V4L2_MBUS_PARALLEL) {
> +		port->flags |= FLAG_MULT_PORT;
> +		port->num_streams_configured = 1;
> +		alloc_stream(port, 0, VFL_TYPE_VIDEO);
> +	} else if (port->endpoint.bus_type == V4L2_MBUS_BT656) {
> +		port->flags |= FLAG_MULT_PORT;
> +		bus = &port->endpoint.bus.parallel;
> +		bt656_ep = &port->bt656_endpoint;
> +		port->num_streams_configured = bt656_ep->num_channels;
> +		for (i = 0; i < bt656_ep->num_channels; i++) {
> +			if (bt656_ep->channels[i] >= 16)
> +				continue;
> +			alloc_stream(port, bt656_ep->channels[i], VFL_TYPE_VIDEO);
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int vip_async_bound(struct v4l2_async_notifier *notifier,
> +			   struct v4l2_subdev *subdev,
> +			   struct v4l2_async_connection *asd)
> +{
> +	struct vip_port *port = notifier_to_vip_port(notifier);
> +	int ret;
> +
> +	if (port->subdev) {
> +		v4l2_info(port, "Rejecting subdev %s (Already set!!)",
> +			  subdev->name);
> +		return 0;
> +	}
> +
> +	v4l2_info(port, "Port %c: Using subdev %s for capture\n",
> +		  port->port_id == VIP_PORTA ? 'A' : 'B', subdev->name);
> +
> +	ret = vip_create_streams(port, subdev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int vip_async_complete(struct v4l2_async_notifier *notifier)
> +{
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations vip_async_ops = {
> +	.bound = vip_async_bound,
> +	.complete = vip_async_complete,
> +};
> +
> +static struct fwnode_handle *
> +fwnode_graph_get_next_endpoint_by_regs(const struct fwnode_handle *fwnode,
> +				       int port_reg, int reg)
> +{
> +	return of_fwnode_handle(of_graph_get_endpoint_by_regs(to_of_node(fwnode),
> +							      port_reg, reg));
> +}
> +
> +static int vip_register_subdev_notif(struct vip_port *port,
> +				     struct fwnode_handle *ep)
> +{
> +	struct v4l2_async_notifier *notifier = &port->notifier;
> +	struct fwnode_handle *subdev;
> +	struct v4l2_fwnode_endpoint *vep;
> +	struct vip_bt656_bus *bt656_vep;
> +	struct v4l2_async_connection *asd;
> +	int ret, rval;
> +
> +	vep = &port->endpoint;
> +	bt656_vep = &port->bt656_endpoint;
> +
> +	subdev = fwnode_graph_get_remote_port_parent(ep);
> +	if (!subdev) {
> +		v4l2_dbg(3, debug, port, "can't get remote parent\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_parse(ep, vep);
> +	if (ret) {
> +		v4l2_dbg(3, debug, port, "Failed to parse endpoint:\n");
> +		fwnode_handle_put(subdev);
> +		return -EINVAL;
> +	}
> +
> +	if (vep->bus_type == V4L2_MBUS_BT656) {
> +		if (fwnode_property_present(ep, "ti,vip-pixel-mux"))
> +			bt656_vep->pixmux = 1;
> +		else
> +			bt656_vep->pixmux = 0;
> +		v4l2_dbg(3, debug, port, "ti,vip-pixel-mux %u\n", bt656_vep->pixmux);
> +
> +		bt656_vep->num_channels = 0;
> +		rval = fwnode_property_read_u8_array(ep, "ti,vip-channels",
> +						     NULL, 0);
> +		if (rval > 0) {
> +			bt656_vep->num_channels =
> +				min_t(int, ARRAY_SIZE(bt656_vep->channels),
> +				      rval);
> +
> +			fwnode_property_read_u8_array(ep, "ti,vip-channels",
> +						      bt656_vep->channels,
> +						      bt656_vep->num_channels);
> +		}
> +		v4l2_dbg(3, debug, port, "ti,vip-channels %u\n", bt656_vep->num_channels);
> +	}
> +
> +	v4l2_async_nf_init(notifier, &port->dev->shared->v4l2_dev);
> +
> +	asd = v4l2_async_nf_add_fwnode(notifier, subdev, struct v4l2_async_connection);
> +	if (IS_ERR(asd)) {
> +		v4l2_dbg(1, debug, port, "Error adding asd\n");
> +		fwnode_handle_put(subdev);
> +		v4l2_async_nf_cleanup(notifier);
> +		return -EINVAL;
> +	}
> +
> +	notifier->ops = &vip_async_ops;
> +	ret = v4l2_async_nf_register(notifier);
> +	if (ret) {
> +		v4l2_dbg(1, debug, port, "Error registering async notifier\n");
> +		v4l2_async_nf_cleanup(notifier);
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int vip_endpoint_scan(struct platform_device *pdev)
> +{
> +	struct device_node *parent = pdev->dev.of_node;
> +	struct device_node *ep = NULL;
> +	int count = 0, p;
> +
> +	for (p = 0; p < (VIP_NUM_PORTS * VIP_NUM_SLICES); p++) {
> +		ep = of_graph_get_endpoint_by_regs(parent, p, 0);
> +		if (!ep)
> +			continue;
> +
> +		count++;
> +		of_node_put(ep);
> +	}
> +
> +	return count;
> +}
> +
> +static int vip_probe_complete(struct platform_device *pdev)
> +{
> +	struct vip_shared *shared = platform_get_drvdata(pdev);
> +	struct regmap *syscon_pol = NULL;
> +	u32 syscon_pol_offset = 0;
> +	struct vip_port *port;
> +	struct vip_dev *dev;
> +	struct device_node *parent = pdev->dev.of_node;
> +	struct fwnode_handle *ep = NULL;
> +	int ret, slice_id, port_id, p;
> +
> +	if (parent && of_property_read_bool(parent, "ti,vip-clk-polarity")) {
> +		syscon_pol = syscon_regmap_lookup_by_phandle(parent,
> +							     "ti,vip-clk-polarity");
> +		if (IS_ERR(syscon_pol)) {
> +			dev_err(&pdev->dev, "failed to get ti,vip-clk-polarity regmap\n");
> +			return PTR_ERR(syscon_pol);
> +		}
> +
> +		if (of_property_read_u32_index(parent, "ti,vip-clk-polarity",
> +					       1, &syscon_pol_offset)) {
> +			dev_err(&pdev->dev, "failed to get ti,vip-clk-polarity offset\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	for (p = 0; p < (VIP_NUM_PORTS * VIP_NUM_SLICES); p++) {
> +		ep = fwnode_graph_get_next_endpoint_by_regs(of_fwnode_handle(parent),
> +							    p, 0);
> +		if (!ep)
> +			continue;
> +
> +		switch (p) {
> +		case 0:
> +			slice_id = VIP_SLICE1;	port_id = VIP_PORTA;
> +			break;
> +		case 1:
> +			slice_id = VIP_SLICE2;	port_id = VIP_PORTA;
> +			break;
> +		case 2:
> +			slice_id = VIP_SLICE1;	port_id = VIP_PORTB;
> +			break;
> +		case 3:
> +			slice_id = VIP_SLICE2;	port_id = VIP_PORTB;
> +			break;
> +		default:
> +			dev_err(&pdev->dev, "Unknown port reg=<%d>\n", p);
> +			continue;
> +		}
> +
> +		ret = alloc_port(shared->devs[slice_id], port_id);
> +		if (ret < 0)
> +			continue;
> +
> +		dev = shared->devs[slice_id];
> +		dev->syscon_pol = syscon_pol;
> +		dev->syscon_pol_offset = syscon_pol_offset;
> +		port = dev->ports[port_id];
> +
> +		vip_register_subdev_notif(port, ep);
> +		fwnode_handle_put(ep);
> +	}
> +	return 0;
> +}
> +
> +static int vip_probe_slice(struct platform_device *pdev, int slice, int instance_id)
> +{
> +	struct vip_shared *shared = platform_get_drvdata(pdev);
> +	struct vip_dev *dev;
> +	struct vip_parser_data *parser;
> +	u32 vin_id;
> +	int ret;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->instance_id = instance_id;
> +	vin_id = 1 + ((dev->instance_id - 1) * 2) + slice;
> +	snprintf(dev->name, sizeof(dev->name), "vin%d", vin_id);
> +
> +	dev->irq = platform_get_irq(pdev, slice);
> +	if (dev->irq < 0)
> +		return dev->irq;
> +
> +	ret = devm_request_irq(&pdev->dev, dev->irq, vip_irq,
> +			       0, dev->name, dev);
> +	if (ret < 0)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&dev->slock);
> +	mutex_init(&dev->mutex);
> +
> +	dev->slice_id = slice;
> +	dev->pdev = pdev;
> +	dev->res = shared->res;
> +	dev->base = shared->base;
> +	dev->v4l2_dev = &shared->v4l2_dev;
> +
> +	dev->shared = shared;
> +	shared->devs[slice] = dev;
> +
> +	vip_top_reset(dev);
> +	vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
> +
> +	parser = devm_kzalloc(&pdev->dev, sizeof(*dev->parser), GFP_KERNEL);
> +	if (!parser)
> +		return PTR_ERR(parser);
> +
> +	parser->res = platform_get_resource_byname(pdev,
> +						   IORESOURCE_MEM,
> +						   (slice == 0) ?
> +						   "parser0" :
> +						   "parser1");
> +	parser->base = devm_ioremap_resource(&pdev->dev, parser->res);
> +	if (IS_ERR(parser->base))
> +		return PTR_ERR(parser->base);
> +
> +	parser->pdev = pdev;
> +	dev->parser = parser;
> +
> +	dev->sc_assigned = VIP_NOT_ASSIGNED;
> +	dev->sc = sc_create(pdev, (slice == 0) ? "sc0" : "sc1");
> +	if (IS_ERR(dev->sc))
> +		return PTR_ERR(dev->sc);
> +
> +	dev->csc_assigned = VIP_NOT_ASSIGNED;
> +	dev->csc = csc_create(pdev, (slice == 0) ? "csc0" : "csc1");
> +	if (IS_ERR(dev->sc))
> +		return PTR_ERR(dev->sc);
> +
> +	return 0;
> +}
> +
> +static int vip_probe(struct platform_device *pdev)
> +{
> +	struct vip_shared *shared;
> +	struct pinctrl *pinctrl;
> +	int ret, slice = VIP_SLICE1;
> +	int instance_id;
> +	u32 tmp, pid;
> +	const char *label;
> +
> +	if (!of_property_read_string(pdev->dev.of_node, "label", &label)) {
> +		if (strcmp(label, "vip1") == 0)
> +			instance_id = 1;
> +		else if (strcmp(label, "vip2") == 0)
> +			instance_id = 2;
> +		else if (strcmp(label, "vip3") == 0)
> +			instance_id = 3;
> +	} else {
> +		dev_err(&pdev->dev, "%s: VIP instance id out of range...\n",
> +			__func__);
> +		return -ENODEV;
> +	}
> +
> +	/* If there are no endpoint defined there is nothing to do */
> +	if (!vip_endpoint_scan(pdev)) {
> +		dev_err(&pdev->dev, "%s: No sensor", __func__);
> +		return -ENODEV;
> +	}
> +
> +	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"32-bit consistent DMA enable failed\n");
> +		return ret;
> +	}
> +
> +	shared = devm_kzalloc(&pdev->dev, sizeof(*shared), GFP_KERNEL);
> +	if (!shared)
> +		return -ENOMEM;
> +
> +	shared->res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vip");
> +	shared->base = devm_ioremap_resource(&pdev->dev, shared->res);
> +	if (IS_ERR(shared->base))
> +		return PTR_ERR(shared->base);
> +
> +	vip_init_format_info(&pdev->dev);
> +
> +	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = pm_runtime_get_sync(&pdev->dev);
> +	if (ret)
> +		goto err_runtime_disable;
> +
> +	/* Make sure H/W module has the right functionality */
> +	pid = reg_read(shared, VIP_PID);
> +	tmp = get_field(pid, VIP_PID_FUNC_MASK, VIP_PID_FUNC_SHIFT);
> +
> +	if (tmp != VIP_PID_FUNC) {
> +		dev_info(&pdev->dev, "vip: unexpected PID function: 0x%x\n",
> +			 tmp);
> +		ret = -ENODEV;
> +		goto err_runtime_put;
> +	}
> +
> +	ret = v4l2_device_register(&pdev->dev, &shared->v4l2_dev);
> +	if (ret)
> +		goto err_runtime_put;
> +
> +	/* enable clocks, so the firmware will load properly */
> +	vip_shared_set_clock_enable(shared, 1);
> +	vip_top_vpdma_reset(shared);
> +
> +	platform_set_drvdata(pdev, shared);
> +
> +	v4l2_ctrl_handler_init(&shared->ctrl_handler, 11);
> +	shared->v4l2_dev.ctrl_handler = &shared->ctrl_handler;
> +
> +	for (slice = VIP_SLICE1; slice < VIP_NUM_SLICES; slice++) {
> +		ret = vip_probe_slice(pdev, slice, instance_id);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Creating slice failed");
> +			goto err_dev_unreg;
> +		}
> +	}
> +
> +	shared->vpdma = &shared->vpdma_data;
> +	ret = vpdma_create(pdev, shared->vpdma, vip_vpdma_fw_cb);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Creating VPDMA failed");
> +		goto err_dev_unreg;
> +	}
> +
> +	return 0;
> +
> +err_dev_unreg:
> +	v4l2_ctrl_handler_free(&shared->ctrl_handler);
> +	v4l2_device_unregister(&shared->v4l2_dev);
> +err_runtime_put:
> +	pm_runtime_put_sync(&pdev->dev);
> +err_runtime_disable:
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static void vip_remove(struct platform_device *pdev)
> +{
> +	struct vip_shared *shared = platform_get_drvdata(pdev);
> +	struct vip_dev *dev;
> +	int slice;
> +
> +	for (slice = 0; slice < VIP_NUM_SLICES; slice++) {
> +		dev = shared->devs[slice];
> +		if (!dev)
> +			continue;
> +
> +		free_port(dev->ports[VIP_PORTA]);
> +		free_port(dev->ports[VIP_PORTB]);
> +	}
> +
> +	v4l2_ctrl_handler_free(&shared->ctrl_handler);
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +#if defined(CONFIG_OF)
> +static const struct of_device_id vip_of_match[] = {
> +	{
> +		.compatible = "ti,dra7-vip",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, vip_of_match);
> +#endif
> +
> +static struct platform_driver vip_pdrv = {
> +	.probe		= vip_probe,
> +	.remove		= vip_remove,
> +	.driver		= {
> +		.name	= VIP_MODULE_NAME,
> +		.of_match_table = of_match_ptr(vip_of_match),
> +	},
> +};
> +
> +module_platform_driver(vip_pdrv);
> +
> +MODULE_DESCRIPTION("TI VIP driver");
> +MODULE_AUTHOR("Texas Instruments");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/ti/vpe/vip.h b/drivers/media/platform/ti/vpe/vip.h
> new file mode 100644
> index 000000000000..e790de0881f7
> --- /dev/null
> +++ b/drivers/media/platform/ti/vpe/vip.h
> @@ -0,0 +1,719 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * TI VIP capture driver
> + *
> + * Copyright (C) 2025 Texas Instruments Incorpated - http://www.ti.com/
> + * David Griego, <dagriego@biglakesoftware.com>
> + * Dale Farnsworth, <dale@farnsworth.org>
> + * Yemike Abhilash Chandra, <y-abhilashchandra@ti.com>
> + */
> +
> +#ifndef __TI_VIP_H
> +#define __TI_VIP_H
> +
> +#include <linux/videodev2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/videobuf2-memops.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-async.h>
> +
> +#include "vpdma.h"
> +#include "vpdma_priv.h"
> +#include "sc.h"
> +#include "csc.h"
> +
> +#define VIP_INSTANCE1	1
> +#define VIP_INSTANCE2	2
> +#define VIP_INSTANCE3	3
> +
> +#define VIP_SLICE1	0
> +#define VIP_SLICE2	1
> +#define VIP_NUM_SLICES	2
> +
> +/*
> + * Additional client identifiers used for VPDMA configuration descriptors
> + */
> +#define VIP_SLICE1_CFD_SC_CLIENT	7
> +#define VIP_SLICE2_CFD_SC_CLIENT	8
> +
> +#define VIP_PORTA	0
> +#define VIP_PORTB	1
> +#define VIP_NUM_PORTS	2
> +
> +#define VIP_MAX_PLANES	2
> +#define	VIP_LUMA	0
> +#define VIP_CHROMA	1
> +
> +#define VIP_CAP_STREAMS_PER_PORT	16
> +#define VIP_VBI_STREAMS_PER_PORT	16
> +
> +#define VIP_MAX_SUBDEV			5
> +/*
> + * This value needs to be at least as large as the number of entry in
> + * vip_formats[].
> + * When vip_formats[] is modified make sure to adjust this value also.
> + */
> +#define VIP_MAX_ACTIVE_FMT		16
> +/*
> + * Colorspace conversion unit can be in one of 3 modes:
> + * NA  - Not Available on this port
> + * Y2R - Needed for YUV to RGB on this port
> + * R2Y - Needed for RGB to YUV on this port
> + */
> +enum vip_csc_state {
> +	VIP_CSC_NA = 0,
> +	VIP_CSC_Y2R,
> +	VIP_CSC_R2Y,
> +};
> +
> +/* buffer for one video frame */
> +struct vip_buffer {
> +	/* common v4l buffer stuff */
> +	struct vb2_v4l2_buffer	vb;
> +	struct list_head	list;
> +	bool			drop;
> +};
> +
> +/*
> + * struct vip_fmt - VIP media bus format information
> + * @fourcc: V4L2 pixel format FCC identifier
> + * @code: V4L2 media bus format code
> + * @colorspace: V4L2 colorspace identifier
> + * @coplanar: 1 if unpacked Luma and Chroma, 0 otherwise (packed/interleaved)
> + * @vpdma_fmt: VPDMA data format per plane.
> + * @finfo: Cache v4l2_format_info for associated fourcc
> + */
> +struct vip_fmt {
> +	u32	fourcc;
> +	u32	code;
> +	u32	colorspace;
> +	u8	coplanar;
> +	const struct vpdma_data_format *vpdma_fmt[VIP_MAX_PLANES];
> +	const struct v4l2_format_info *finfo;
> +};
> +
> +/*
> + * The vip_parser_data structures contains the memory mapped
> + * info to access the parser registers.
> + */
> +struct vip_parser_data {
> +	void __iomem		*base;
> +	struct resource		*res;
> +
> +	struct platform_device *pdev;
> +};
> +
> +/*
> + * The vip_shared structure contains data that is shared by both
> + * the VIP1 and VIP2 slices.
> + */
> +struct vip_shared {
> +	struct list_head	list;
> +	struct resource		*res;
> +	void __iomem		*base;
> +	struct vpdma_data	vpdma_data;
> +	struct vpdma_data	*vpdma;
> +	struct v4l2_device	v4l2_dev;
> +	struct vip_dev		*devs[VIP_NUM_SLICES];
> +	struct v4l2_ctrl_handler ctrl_handler;
> +};
> +
> +/*
> + * The vip_bt656_bus structure contains vip specific bt656 bus data.
> + */
> +struct vip_bt656_bus {
> +	unsigned char num_channels;
> +	unsigned char pixmux;
> +	unsigned char channels[16];
> +};
> +
> +/*
> + * There are two vip_dev structure, one for each vip slice: VIP1 & VIP2.
> + */
> +struct vip_dev {
> +	struct v4l2_device	*v4l2_dev;
> +	struct platform_device *pdev;
> +	struct vip_shared	*shared;
> +	struct resource		*res;
> +	struct regmap		*syscon_pol;
> +	u32			syscon_pol_offset;
> +	int			instance_id;
> +	int			slice_id;
> +	int			num_ports;	/* count of open ports */
> +	struct mutex		mutex;
> +	/* protects access to stream buffer queues */
> +	spinlock_t		slock;
> +
> +	int			irq;
> +	void __iomem		*base;
> +
> +	struct vip_port		*ports[VIP_NUM_PORTS];
> +
> +	char			name[16];
> +	/* parser data handle */
> +	struct vip_parser_data	*parser;
> +	/* scaler data handle */
> +	struct sc_data		*sc;
> +	/* scaler port assignation */
> +	int			sc_assigned;
> +	/* csc data handle */
> +	struct csc_data		*csc;
> +	/* csc port assignation */
> +	int			csc_assigned;
> +};
> +
> +/*
> + * There are two vip_port structures for each vip_dev, one for port A
> + * and one for port B.
> + */
> +struct vip_port {
> +	struct vip_dev		*dev;
> +	int			port_id;
> +
> +	unsigned int		flags;
> +	struct v4l2_rect	c_rect;		/* crop rectangle */
> +	struct v4l2_mbus_framefmt mbus_framefmt;
> +	struct v4l2_mbus_framefmt try_mbus_framefmt;
> +
> +	char			name[16];
> +	struct vip_fmt		*fmt;		/* current format info */
> +	/* Number of channels/streams configured */
> +	int			num_streams_configured;
> +	int			num_streams;	/* count of open streams */
> +	struct vip_stream	*cap_streams[VIP_CAP_STREAMS_PER_PORT];
> +
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_subdev	*subdev;
> +	struct v4l2_fwnode_endpoint endpoint;
> +	struct vip_bt656_bus	bt656_endpoint;
> +	struct vip_fmt		*active_fmt[VIP_MAX_ACTIVE_FMT];
> +	int			num_active_fmt;
> +	/* have new shadow reg values */
> +	bool			load_mmrs;
> +	/* shadow reg addr/data block */
> +	struct vpdma_buf	mmr_adb;
> +	/* h coeff buffer */
> +	struct vpdma_buf	sc_coeff_h;
> +	/* v coeff buffer */
> +	struct vpdma_buf	sc_coeff_v;
> +	/* Show if scaler resource is available on this port */
> +	bool			scaler;
> +	/* Show the csc resource state on this port */
> +	enum vip_csc_state	csc;
> +};
> +
> +/*
> + * When handling multiplexed video, there can be multiple streams for each
> + * port.  The vip_stream structure holds per-stream data.
> + */
> +struct vip_stream {
> +	struct video_device	*vfd;
> +	struct vip_port		*port;
> +	int			stream_id;
> +	int			list_num;
> +	int			vfl_type;
> +	char			name[16];
> +	struct work_struct	recovery_work;
> +	int			num_recovery;
> +	enum v4l2_field		field;		/* current field */
> +	unsigned int		sequence;	/* current frame/field seq */
> +	enum v4l2_field		sup_field;	/* supported field value */
> +	unsigned int		width;		/* frame width */
> +	unsigned int		height;		/* frame height */
> +	unsigned int		bytesperline;	/* bytes per line in memory */
> +	unsigned int		sizeimage;	/* image size in memory */
> +	struct list_head	vidq;		/* incoming vip_bufs queue */
> +	struct list_head	dropq;		/* drop vip_bufs queue */
> +	struct list_head	post_bufs;	/* vip_bufs to be DMAed */
> +	/* Maintain a list of used channels - Needed for VPDMA cleanup */
> +	int			vpdma_channels[VPDMA_MAX_CHANNELS];
> +	int			vpdma_channels_to_abort[VPDMA_MAX_CHANNELS];
> +	struct vpdma_desc_list	desc_list;	/* DMA descriptor list */
> +	struct vpdma_dtd	*write_desc;
> +	/* next unused desc_list addr */
> +	void			*desc_next;
> +	struct vb2_queue	vb_vidq;
> +};
> +
> +/*
> + * VIP Enumerations
> + */
> +enum data_path_select {
> +	ALL_FIELDS_DATA_SELECT = 0,
> +	VIP_CSC_SRC_DATA_SELECT,
> +	VIP_SC_SRC_DATA_SELECT,
> +	VIP_RGB_SRC_DATA_SELECT,
> +	VIP_RGB_OUT_LO_DATA_SELECT,
> +	VIP_RGB_OUT_HI_DATA_SELECT,
> +	VIP_CHR_DS_1_SRC_DATA_SELECT,
> +	VIP_CHR_DS_2_SRC_DATA_SELECT,
> +	VIP_MULTI_CHANNEL_DATA_SELECT,
> +	VIP_CHR_DS_1_DATA_BYPASS,
> +	VIP_CHR_DS_2_DATA_BYPASS,
> +};
> +
> +enum data_interface_modes {
> +	SINGLE_24B_INTERFACE = 0,
> +	SINGLE_16B_INTERFACE = 1,
> +	DUAL_8B_INTERFACE = 2,
> +};
> +
> +enum sync_types {
> +	EMBEDDED_SYNC_SINGLE_YUV422 = 0,
> +	EMBEDDED_SYNC_2X_MULTIPLEXED_YUV422 = 1,
> +	EMBEDDED_SYNC_4X_MULTIPLEXED_YUV422 = 2,
> +	EMBEDDED_SYNC_LINE_MULTIPLEXED_YUV422 = 3,
> +	DISCRETE_SYNC_SINGLE_YUV422 = 4,
> +	EMBEDDED_SYNC_SINGLE_RGB_OR_YUV444 = 5,
> +	DISCRETE_SYNC_SINGLE_RGB_24B = 10,
> +};
> +
> +#define VIP_NOT_ASSIGNED	-1
> +
> +/*
> + * Register offsets and field selectors
> + */
> +#define VIP_PID_FUNC			0xf02
> +
> +#define VIP_PID				0x0000
> +#define VIP_PID_MINOR_MASK              0x3f
> +#define VIP_PID_MINOR_SHIFT             0
> +#define VIP_PID_CUSTOM_MASK             0x03
> +#define VIP_PID_CUSTOM_SHIFT            6
> +#define VIP_PID_MAJOR_MASK              0x07
> +#define VIP_PID_MAJOR_SHIFT             8
> +#define VIP_PID_RTL_MASK                0x1f
> +#define VIP_PID_RTL_SHIFT               11
> +#define VIP_PID_FUNC_MASK               0xfff
> +#define VIP_PID_FUNC_SHIFT              16
> +#define VIP_PID_SCHEME_MASK             0x03
> +#define VIP_PID_SCHEME_SHIFT            30
> +
> +#define VIP_SYSCONFIG			0x0010
> +#define VIP_SYSCONFIG_IDLE_MASK         0x03
> +#define VIP_SYSCONFIG_IDLE_SHIFT        2
> +#define VIP_SYSCONFIG_STANDBY_MASK      0x03
> +#define VIP_SYSCONFIG_STANDBY_SHIFT     4
> +#define VIP_FORCE_IDLE_MODE             0
> +#define VIP_NO_IDLE_MODE                1
> +#define VIP_SMART_IDLE_MODE             2
> +#define VIP_SMART_IDLE_WAKEUP_MODE      3
> +#define VIP_FORCE_STANDBY_MODE          0
> +#define VIP_NO_STANDBY_MODE             1
> +#define VIP_SMART_STANDBY_MODE          2
> +#define VIP_SMART_STANDBY_WAKEUP_MODE   3
> +
> +#define VIP_INTC_INTX_OFFSET		0x0020
> +
> +#define VIP_INT0_STATUS0_RAW_SET	0x0020
> +#define VIP_INT0_STATUS0_RAW		VIP_INT0_STATUS0_RAW_SET
> +#define VIP_INT0_STATUS0_CLR		0x0028
> +#define VIP_INT0_STATUS0		VIP_INT0_STATUS0_CLR
> +#define VIP_INT0_ENABLE0_SET		0x0030
> +#define VIP_INT0_ENABLE0		VIP_INT0_ENABLE0_SET
> +#define VIP_INT0_ENABLE0_CLR		0x0038
> +#define VIP_INT0_LIST0_COMPLETE         BIT(0)
> +#define VIP_INT0_LIST0_NOTIFY           BIT(1)
> +#define VIP_INT0_LIST1_COMPLETE         BIT(2)
> +#define VIP_INT0_LIST1_NOTIFY           BIT(3)
> +#define VIP_INT0_LIST2_COMPLETE         BIT(4)
> +#define VIP_INT0_LIST2_NOTIFY           BIT(5)
> +#define VIP_INT0_LIST3_COMPLETE         BIT(6)
> +#define VIP_INT0_LIST3_NOTIFY           BIT(7)
> +#define VIP_INT0_LIST4_COMPLETE         BIT(8)
> +#define VIP_INT0_LIST4_NOTIFY           BIT(9)
> +#define VIP_INT0_LIST5_COMPLETE         BIT(10)
> +#define VIP_INT0_LIST5_NOTIFY           BIT(11)
> +#define VIP_INT0_LIST6_COMPLETE         BIT(12)
> +#define VIP_INT0_LIST6_NOTIFY           BIT(13)
> +#define VIP_INT0_LIST7_COMPLETE         BIT(14)
> +#define VIP_INT0_LIST7_NOTIFY           BIT(15)
> +#define VIP_INT0_DESCRIPTOR             BIT(16)
> +#define VIP_VIP1_PARSER_INT		BIT(20)
> +#define VIP_VIP2_PARSER_INT		BIT(21)
> +
> +#define VIP_INT0_STATUS1_RAW_SET        0x0024
> +#define VIP_INT0_STATUS1_RAW            VIP_INT0_STATUS0_RAW_SET
> +#define VIP_INT0_STATUS1_CLR            0x002c
> +#define VIP_INT0_STATUS1                VIP_INT0_STATUS0_CLR
> +#define VIP_INT0_ENABLE1_SET            0x0034
> +#define VIP_INT0_ENABLE1                VIP_INT0_ENABLE0_SET
> +#define VIP_INT0_ENABLE1_CLR            0x003c
> +#define VIP_INT0_ENABLE1_STAT		0x004c
> +#define VIP_INT0_CHANNEL_GROUP0		BIT(0)
> +#define VIP_INT0_CHANNEL_GROUP1		BIT(1)
> +#define VIP_INT0_CHANNEL_GROUP2		BIT(2)
> +#define VIP_INT0_CHANNEL_GROUP3		BIT(3)
> +#define VIP_INT0_CHANNEL_GROUP4		BIT(4)
> +#define VIP_INT0_CHANNEL_GROUP5		BIT(5)
> +#define VIP_INT0_CLIENT			BIT(7)
> +#define VIP_VIP1_DS1_UV_ERROR_INT	BIT(22)
> +#define VIP_VIP1_DS2_UV_ERROR_INT	BIT(23)
> +#define VIP_VIP2_DS1_UV_ERROR_INT	BIT(24)
> +#define VIP_VIP2_DS2_UV_ERROR_INT	BIT(25)
> +
> +#define VIP_INTC_E0I			0x00a0
> +
> +#define VIP_CLK_ENABLE			0x0100
> +#define VIP_VPDMA_CLK_ENABLE		BIT(0)
> +#define VIP_VIP1_DATA_PATH_CLK_ENABLE	BIT(16)
> +#define VIP_VIP2_DATA_PATH_CLK_ENABLE	BIT(17)
> +
> +#define VIP_CLK_RESET			0x0104
> +#define VIP_VPDMA_RESET			BIT(0)
> +#define VIP_VPDMA_CLK_RESET_MASK	0x1
> +#define VIP_VPDMA_CLK_RESET_SHIFT	0
> +#define VIP_DATA_PATH_CLK_RESET_MASK	0x1
> +#define VIP_VIP1_DATA_PATH_RESET_SHIFT	16
> +#define VIP_VIP2_DATA_PATH_RESET_SHIFT	17
> +#define VIP_VIP1_DATA_PATH_RESET	BIT(16)
> +#define VIP_VIP2_DATA_PATH_RESET	BIT(17)
> +#define VIP_VIP1_PARSER_RESET		BIT(18)
> +#define VIP_VIP2_PARSER_RESET		BIT(19)
> +#define VIP_VIP1_CSC_RESET		BIT(20)
> +#define VIP_VIP2_CSC_RESET		BIT(21)
> +#define VIP_VIP1_SC_RESET		BIT(22)
> +#define VIP_VIP2_SC_RESET		BIT(23)
> +#define VIP_VIP1_DS1_RESET		BIT(25)
> +#define VIP_VIP2_DS1_RESET		BIT(26)
> +#define VIP_VIP1_DS2_RESET		BIT(27)
> +#define VIP_VIP2_DS2_RESET		BIT(28)
> +#define VIP_MAIN_RESET			BIT(31)
> +
> +#define VIP_VIP1_DATA_PATH_SELECT	0x010c
> +#define VIP_VIP2_DATA_PATH_SELECT	0x0110
> +#define VIP_CSC_SRC_SELECT_MASK		0x07
> +#define VIP_CSC_SRC_SELECT_SHFT		0
> +#define VIP_SC_SRC_SELECT_MASK		0x07
> +#define VIP_SC_SRC_SELECT_SHFT		3
> +#define VIP_RGB_SRC_SELECT		BIT(6)
> +#define VIP_RGB_OUT_LO_SRC_SELECT	BIT(7)
> +#define VIP_RGB_OUT_HI_SRC_SELECT	BIT(8)
> +#define VIP_DS1_SRC_SELECT_MASK		0x07
> +#define VIP_DS1_SRC_SELECT_SHFT		9
> +#define VIP_DS2_SRC_SELECT_MASK		0x07
> +#define VIP_DS2_SRC_SELECT_SHFT		12
> +#define VIP_MULTI_CHANNEL_SELECT	BIT(15)
> +#define VIP_DS1_BYPASS			BIT(16)
> +#define VIP_DS2_BYPASS			BIT(17)
> +#define VIP_TESTPORT_B_SELECT		BIT(26)
> +#define VIP_TESTPORT_A_SELECT		BIT(27)
> +#define VIP_DATAPATH_SELECT_MASK	0x0f
> +#define VIP_DATAPATH_SELECT_SHFT	28
> +
> +#define VIP1_PARSER_REG_OFFSET		0x5500
> +#define VIP2_PARSER_REG_OFFSET		0x5a00
> +
> +#define VIP_PARSER_MAIN_CFG		0x0000
> +#define VIP_DATA_INTERFACE_MODE_MASK	0x03
> +#define VIP_DATA_INTERFACE_MODE_SHFT	0
> +#define VIP_CLIP_BLANK			BIT(4)
> +#define VIP_CLIP_ACTIVE			BIT(5)
> +
> +#define VIP_PARSER_PORTA_0		0x0004
> +#define VIP_PARSER_PORTB_0		0x000c
> +#define VIP_SYNC_TYPE_MASK		0x0f
> +#define VIP_SYNC_TYPE_SHFT		0
> +#define VIP_CTRL_CHANNEL_SEL_MASK	0x03
> +#define VIP_CTRL_CHANNEL_SEL_SHFT	4
> +#define VIP_ASYNC_FIFO_WR		BIT(6)
> +#define VIP_ASYNC_FIFO_RD		BIT(7)
> +#define VIP_PORT_ENABLE			BIT(8)
> +#define VIP_FID_POLARITY		BIT(9)
> +#define VIP_PIXCLK_EDGE_POLARITY	BIT(10)
> +#define VIP_HSYNC_POLARITY		BIT(11)
> +#define VIP_VSYNC_POLARITY		BIT(12)
> +#define VIP_ACTVID_POLARITY		BIT(13)
> +#define VIP_FID_DETECT_MODE		BIT(14)
> +#define VIP_USE_ACTVID_HSYNC_ONLY	BIT(15)
> +#define VIP_FID_SKEW_PRECOUNT_MASK	0x3f
> +#define VIP_FID_SKEW_PRECOUNT_SHFT	16
> +#define VIP_DISCRETE_BASIC_MODE		BIT(22)
> +#define VIP_SW_RESET			BIT(23)
> +#define VIP_FID_SKEW_POSTCOUNT_MASK	0x3f
> +#define VIP_FID_SKEW_POSTCOUNT_SHFT	24
> +#define VIP_ANALYZER_2X4X_SRCNUM_POS	BIT(30)
> +#define VIP_ANALYZER_FVH_ERR_COR_EN	BIT(31)
> +
> +#define VIP_PARSER_PORTA_1		0x0008
> +#define VIP_PARSER_PORTB_1		0x0010
> +#define VIP_SRC0_NUMLINES_MASK		0x0fff
> +#define VIP_SRC0_NUMLINES_SHFT		0
> +#define VIP_ANC_CHAN_SEL_8B_MASK	0x03
> +#define VIP_ANC_CHAN_SEL_8B_SHFT	13
> +#define VIP_SRC0_NUMPIX_MASK		0x0fff
> +#define VIP_SRC0_NUMPIX_SHFT		16
> +#define VIP_REPACK_SEL_MASK		0x07
> +#define VIP_REPACK_SEL_SHFT		28
> +
> +#define VIP_PARSER_FIQ_MASK		0x0014
> +#define VIP_PARSER_FIQ_CLR		0x0018
> +#define VIP_PARSER_FIQ_STATUS		0x001c
> +#define VIP_PORTA_VDET			BIT(0)
> +#define VIP_PORTB_VDET			BIT(1)
> +#define VIP_PORTA_ASYNC_FIFO_OF		BIT(2)
> +#define VIP_PORTB_ASYNC_FIFO_OF		BIT(3)
> +#define VIP_PORTA_OUTPUT_FIFO_YUV	BIT(4)
> +#define VIP_PORTA_OUTPUT_FIFO_ANC	BIT(6)
> +#define VIP_PORTB_OUTPUT_FIFO_YUV	BIT(7)
> +#define VIP_PORTB_OUTPUT_FIFO_ANC	BIT(9)
> +#define VIP_PORTA_CONN			BIT(10)
> +#define VIP_PORTA_DISCONN		BIT(11)
> +#define VIP_PORTB_CONN			BIT(12)
> +#define VIP_PORTB_DISCONN		BIT(13)
> +#define VIP_PORTA_SRC0_SIZE		BIT(14)
> +#define VIP_PORTB_SRC0_SIZE		BIT(15)
> +#define VIP_PORTA_YUV_PROTO_VIOLATION	BIT(16)
> +#define VIP_PORTA_ANC_PROTO_VIOLATION	BIT(17)
> +#define VIP_PORTB_YUV_PROTO_VIOLATION	BIT(18)
> +#define VIP_PORTB_ANC_PROTO_VIOLATION	BIT(19)
> +#define VIP_PORTA_CFG_DISABLE_COMPLETE	BIT(20)
> +#define VIP_PORTB_CFG_DISABLE_COMPLETE	BIT(21)
> +
> +#define VIP_PARSER_PORTA_SOURCE_FID	0x0020
> +#define VIP_PARSER_PORTA_ENCODER_FID	0x0024
> +#define VIP_PARSER_PORTB_SOURCE_FID	0x0028
> +#define VIP_PARSER_PORTB_ENCODER_FID	0x002c
> +
> +#define VIP_PARSER_PORTA_SRC0_SIZE	0x0030
> +#define VIP_PARSER_PORTB_SRC0_SIZE	0x0070
> +#define VIP_SOURCE_HEIGHT_MASK		0x0fff
> +#define VIP_SOURCE_HEIGHT_SHFT		0
> +#define VIP_SOURCE_WIDTH_MASK		0x0fff
> +#define VIP_SOURCE_WIDTH_SHFT		16
> +
> +#define VIP_PARSER_PORTA_VDET_VEC	0x00b0
> +#define VIP_PARSER_PORTB_VDET_VEC	0x00b4
> +
> +#define VIP_PARSER_PORTA_EXTRA2		0x00b8
> +#define VIP_PARSER_PORTB_EXTRA2		0x00c8
> +#define VIP_ANC_SKIP_NUMPIX_MASK	0x0fff
> +#define VIP_ANC_SKIP_NUMPIX_SHFT	0
> +#define VIP_ANC_BYPASS			BIT(15)
> +#define VIP_ANC_USE_NUMPIX_MASK		0x0fff
> +#define VIP_ANC_USE_NUMPIX_SHFT		16
> +#define VIP_ANC_TARGET_SRCNUM_MASK	0x0f
> +#define VIP_ANC_TARGET_SRCNUM_SHFT	28
> +
> +#define VIP_PARSER_PORTA_EXTRA3		0x00bc
> +#define VIP_PARSER_PORTB_EXTRA3		0x00cc
> +#define VIP_ANC_SKIP_NUMLINES_MASK	0x0fff
> +#define VIP_ANC_SKIP_NUMLINES_SHFT	0
> +#define VIP_ANC_USE_NUMLINES_MASK	0x0fff
> +#define VIP_ANC_USE_NUMLINES_SHFT	16
> +
> +#define VIP_PARSER_PORTA_EXTRA4		0x00c0
> +#define VIP_PARSER_PORTB_EXTRA4		0x00d0
> +#define VIP_ACT_SKIP_NUMPIX_MASK	0x0fff
> +#define VIP_ACT_SKIP_NUMPIX_SHFT	0
> +#define VIP_ACT_BYPASS			BIT(15)
> +#define VIP_ACT_USE_NUMPIX_MASK		0x0fff
> +#define VIP_ACT_USE_NUMPIX_SHFT		16
> +#define VIP_ACT_TARGET_SRCNUM_MASK	0x0f
> +#define VIP_ACT_TARGET_SRCNUM_SHFT	28
> +
> +#define VIP_PARSER_PORTA_EXTRA5		0x00c4
> +#define VIP_PARSER_PORTB_EXTRA5		0x00d4
> +#define VIP_ACT_SKIP_NUMLINES_MASK	0x0fff
> +#define VIP_ACT_SKIP_NUMLINES_SHFT	0
> +#define VIP_ACT_USE_NUMLINES_MASK	0x0fff
> +#define VIP_ACT_USE_NUMLINES_SHFT	16
> +
> +#define VIP_PARSER_PORTA_EXTRA6		0x00d8
> +#define VIP_PARSER_PORTB_EXTRA6		0x00dc
> +#define VIP_ANC_SRCNUM_STOP_IMM_SHFT	0
> +#define VIP_YUV_SRCNUM_STOP_IMM_SHFT	16
> +
> +#define VIP_CSC_CSC00			0x0200
> +#define VIP_CSC_A0_MASK			0x1fff
> +#define VIP_CSC_A0_SHFT			0
> +#define VIP_CSC_B0_MASK			0x1fff
> +#define VIP_CSC_B0_SHFT			16
> +
> +#define VIP_CSC_CSC01			0x0204
> +#define VIP_CSC_C0_MASK			0x1fff
> +#define VIP_CSC_C0_SHFT			0
> +#define VIP_CSC_A1_MASK			0x1fff
> +#define VIP_CSC_A1_SHFT			16
> +
> +#define VIP_CSC_CSC02			0x0208
> +#define VIP_CSC_B1_MASK			0x1fff
> +#define VIP_CSC_B1_SHFT			0
> +#define VIP_CSC_C1_MASK			0x1fff
> +#define VIP_CSC_C1_SHFT			16
> +
> +#define VIP_CSC_CSC03			0x020c
> +#define VIP_CSC_A2_MASK			0x1fff
> +#define VIP_CSC_A2_SHFT			0
> +#define VIP_CSC_B2_MASK			0x1fff
> +#define VIP_CSC_B2_SHFT			16
> +
> +#define VIP_CSC_CSC04			0x0210
> +#define VIP_CSC_C2_MASK			0x1fff
> +#define VIP_CSC_C2_SHFT			0
> +#define VIP_CSC_D0_MASK			0x0fff
> +#define VIP_CSC_D0_SHFT			16
> +
> +#define VIP_CSC_CSC05			0x0214
> +#define VIP_CSC_D1_MASK			0x0fff
> +#define VIP_CSC_D1_SHFT			0
> +#define VIP_CSC_D2_MASK			0x0fff
> +#define VIP_CSC_D2_SHFT			16
> +#define VIP_CSC_BYPASS			BIT(28)
> +
> +#define VIP_SC_MP_SC0			0x0300
> +#define VIP_INTERLACE_O			BIT(0)
> +#define VIP_LINEAR			BIT(1)
> +#define VIP_SC_BYPASS			BIT(2)
> +#define VIP_INVT_FID			BIT(3)
> +#define VIP_USE_RAV			BIT(4)
> +#define VIP_ENABLE_EV			BIT(5)
> +#define VIP_AUTH_HS			BIT(6)
> +#define VIP_DCM_2X			BIT(7)
> +#define VIP_DCM_4X			BIT(8)
> +#define VIP_HP_BYPASS			BIT(9)
> +#define VIP_INTERLACE_I			BIT(10)
> +#define VIP_ENABLE_SIN2_VER_INTP	BIT(11)
> +#define VIP_Y_PK_EN			BIT(14)
> +#define VIP_TRIM			BIT(15)
> +#define VIP_SELFGEN_FID			BIT(16)
> +
> +#define VIP_SC_MP_SC1			0x0304
> +#define VIP_ROW_ACC_INC_MASK		0x07ffffff
> +#define VIP_ROW_ACC_INC_SHFT		0
> +
> +#define VIP_SC_MP_SC2			0x0308
> +#define VIP_ROW_ACC_OFFSET_MASK		0x0fffffff
> +#define VIP_ROW_ACC_OFFSET_SHFT		0
> +
> +#define VIP_SC_MP_SC3			0x030c
> +#define VIP_ROW_ACC_OFFSET_B_MASK	0x0fffffff
> +#define VIP_ROW_ACC_OFFSET_B_SHFT	0
> +
> +#define VIP_SC_MP_SC4			0x0310
> +#define VIP_TAR_H_MASK			0x07ff
> +#define VIP_TAR_H_SHFT			0
> +#define VIP_TAR_W_MASK			0x07ff
> +#define VIP_TAR_W_SHFT			12
> +#define VIP_LIN_ACC_INC_U_MASK		0x07
> +#define VIP_LIN_ACC_INC_U_SHFT		24
> +#define VIP_NLIN_ACC_INIT_U_MASK	0x07
> +#define VIP_NLIN_ACC_INIT_U_SHFT	28
> +
> +#define VIP_SC_MP_SC5			0x0314
> +#define VIP_SRC_H_MASK			0x03ff
> +#define VIP_SRC_H_SHFT			0
> +#define VIP_SRC_W_MASK			0x07ff
> +#define VIP_SRC_W_SHFT			12
> +#define VIP_NLIN_ACC_INC_U_MASK		0x07
> +#define VIP_NLIN_ACC_INC_U_SHFT		24
> +
> +#define VIP_SC_MP_SC6			0x0318
> +#define VIP_ROW_ACC_INIT_RAV_MASK	0x03ff
> +#define VIP_ROW_ACC_INIT_RAV_SHFT	0
> +#define VIP_ROW_ACC_INIT_RAV_B_MASK	0x03ff
> +#define VIP_ROW_ACC_INIT_RAV_B_SHFT	10
> +
> +#define VIP_SC_MP_SC8			0x0320
> +#define VIP_NLIN_LEFT_MASK		0x07ff
> +#define VIP_NLIN_LEFT_SHFT		0
> +#define VIP_NLIN_RIGHT_MASK		0x07ff
> +#define VIP_NLIN_RIGHT_SHFT		12
> +
> +#define VIP_SC_MP_SC9			0x0324
> +#define VIP_LIN_ACC_INC			VIP_SC_MP_SC9
> +
> +#define VIP_SC_MP_SC10			0x0328
> +#define VIP_NLIN_ACC_INIT		VIP_SC_MP_SC10
> +
> +#define VIP_SC_MP_SC11			0x032c
> +#define VIP_NLIN_ACC_INC		VIP_SC_MP_SC11
> +
> +#define VIP_SC_MP_SC12			0x0330
> +#define VIP_COL_ACC_OFFSET_MASK		0x01ffffff
> +#define VIP_COL_ACC_OFFSET_SHFT		0
> +
> +#define VIP_SC_MP_SC13			0x0334
> +#define VIP_SC_FACTOR_RAV_MASK		0x03ff
> +#define VIP_SC_FACTOR_RAV_SHFT		0
> +#define VIP_CHROMA_INTP_THR_MASK	0x03ff
> +#define VIP_CHROMA_INTP_THR_SHFT	12
> +#define VIP_DELTA_CHROMA_THR_MASK	0x0f
> +#define VIP_DELTA_CHROMA_THR_SHFT	24
> +
> +#define VIP_SC_MP_SC17			0x0344
> +#define VIP_EV_THR_MASK			0x03ff
> +#define VIP_EV_THR_SHFT			12
> +#define VIP_DELTA_LUMA_THR_MASK		0x0f
> +#define VIP_DELTA_LUMA_THR_SHFT		24
> +#define VIP_DELTA_EV_THR_MASK		0x0f
> +#define VIP_DELTA_EV_THR_SHFT		28
> +
> +#define VIP_SC_MP_SC18			0x0348
> +#define VIP_HS_FACTOR_MASK		0x03ff
> +#define VIP_HS_FACTOR_SHFT		0
> +#define VIP_CONF_DEFAULT_MASK		0x01ff
> +#define VIP_CONF_DEFAULT_SHFT		16
> +
> +#define VIP_SC_MP_SC19			0x034c
> +#define VIP_HPF_COEFF0_MASK		0xff
> +#define VIP_HPF_COEFF0_SHFT		0
> +#define VIP_HPF_COEFF1_MASK		0xff
> +#define VIP_HPF_COEFF1_SHFT		8
> +#define VIP_HPF_COEFF2_MASK		0xff
> +#define VIP_HPF_COEFF2_SHFT		16
> +#define VIP_HPF_COEFF3_MASK		0xff
> +#define VIP_HPF_COEFF3_SHFT		23
> +
> +#define VIP_SC_MP_SC20			0x0350
> +#define VIP_HPF_COEFF4_MASK		0xff
> +#define VIP_HPF_COEFF4_SHFT		0
> +#define VIP_HPF_COEFF5_MASK		0xff
> +#define VIP_HPF_COEFF5_SHFT		8
> +#define VIP_HPF_NORM_SHFT_MASK		0x07
> +#define VIP_HPF_NORM_SHFT_SHFT		16
> +#define VIP_NL_LIMIT_MASK		0x1ff
> +#define VIP_NL_LIMIT_SHFT		20
> +
> +#define VIP_SC_MP_SC21			0x0354
> +#define VIP_NL_LO_THR_MASK		0x01ff
> +#define VIP_NL_LO_THR_SHFT		0
> +#define VIP_NL_LO_SLOPE_MASK		0xff
> +#define VIP_NL_LO_SLOPE_SHFT		16
> +
> +#define VIP_SC_MP_SC22			0x0358
> +#define VIP_NL_HI_THR_MASK		0x01ff
> +#define VIP_NL_HI_THR_SHFT		0
> +#define VIP_NL_HI_SLOPE_SH_MASK		0x07
> +#define VIP_NL_HI_SLOPE_SH_SHFT		16
> +
> +#define VIP_SC_MP_SC23			0x035c
> +#define VIP_GRADIENT_THR_MASK		0x07ff
> +#define VIP_GRADIENT_THR_SHFT		0
> +#define VIP_GRADIENT_THR_RANGE_MASK	0x0f
> +#define VIP_GRADIENT_THR_RANGE_SHFT	12
> +#define VIP_MIN_GY_THR_MASK		0xff
> +#define VIP_MIN_GY_THR_SHFT		16
> +#define VIP_MIN_GY_THR_RANGE_MASK	0x0f
> +#define VIP_MIN_GY_THR_RANGE_SHFT	28
> +
> +#define VIP_SC_MP_SC24			0x0360
> +#define VIP_ORG_H_MASK			0x07ff
> +#define VIP_ORG_H_SHFT			0
> +#define VIP_ORG_W_MASK			0x07ff
> +#define VIP_ORG_W_SHFT			16
> +
> +#define VIP_SC_MP_SC25			0x0364
> +#define VIP_OFF_H_MASK			0x07ff
> +#define VIP_OFF_H_SHFT			0
> +#define VIP_OFF_W_MASK			0x07ff
> +#define VIP_OFF_W_SHFT			16
> +
> +#define VIP_VPDMA_REG_OFFSET		0xd000
> +
> +#endif

Regards,

	Hans

