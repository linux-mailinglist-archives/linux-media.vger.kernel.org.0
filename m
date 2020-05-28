Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A281E5A6B
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 10:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgE1IJS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 04:09:18 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:55919 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726111AbgE1IJR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 04:09:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id eDb9jGuKsFjnUeDbCji31A; Thu, 28 May 2020 10:09:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590653351; bh=B4Oo494ZFWhHndahUAuihGahM+RT9Gygtpgi9anu7TM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vlUUDKMSxzUGAZ94CBCBQKanceW08ll1f6rVfy2mb9oNiC0/URljGPZqBGXvR8oED
         uJlnraw/GaubdyWP9sKvBOf3pQTvRPJVcpM2gxK6fX0akvyclTJLwHDNzj5weE5Z7E
         FJ06a84pDZaWBXffZqnrEWUVJZvtNOFRPTWeIDrLK4534MGKVE2jq04AnRMvAVOTQ+
         1jgRLpJIh07UYEAfqXHQlOn6NSRXkNgwCp9cNfiEbUwi6JTKVVKQjaUkjtNshPecQb
         rIR7Bn7ESvr5mYwAOG1d40Z0zrhXERWvw5ZnLSzVIic25oijqgvQEPINCB9BzM5R8c
         x7UbyGLAsZrbA==
Subject: Re: [Patch 2/2] media: ti-vpe: Add the VIP driver
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20200522225412.29440-1-bparrot@ti.com>
 <20200522225412.29440-3-bparrot@ti.com>
 <6155dc6e-0899-fc66-dc5c-2f7cd5e23dae@xs4all.nl>
 <20200526215708.3vp4z4qjzpj66t36@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <70c296ad-73ff-66e5-6d7d-ac13d5d61dd4@xs4all.nl>
Date:   Thu, 28 May 2020 10:09:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200526215708.3vp4z4qjzpj66t36@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAl0/Z0TunZqs7f82WVhr2nN/JbG/Hte2wfwWRLm2+U6ZI5/+dz/ggYOWE96f9VSQbAXi2DRK7dj+cewFpkVfRrxPrWSN1BEaPc+nH4v6vJeuU2xkguO
 YJ/11S7TfNz5z+qSLcKiOJCrgCWcrmhIgKRXcGg6PF17YZiDZUWR/th2ZIUW93EDmSXcWA/I4uwq5QXHkY8Yp5gwacGWezRt3OQj/OEOJuDgemfgTNk2W1Om
 hc3s68PmQUGVFMeCgPBHdb9F1yI2fa9CO02Du2/fVOQI8CPf4DmRjIwUxfun4DNVy3AK4XeRuJETeTfWhc3YcI1+vPJqOrxUP1UoOWIq7hY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/05/2020 23:57, Benoit Parrot wrote:
> Hans,
> 
> Thanks for the review.
> 
> Hans Verkuil <hverkuil@xs4all.nl> wrote on Tue [2020-May-26 13:48:35 +0200]:
>> On 23/05/2020 00:54, Benoit Parrot wrote:
>>> VIP stands for Video Input Port, it can be found on devices such as
>>> DRA7xx and provides a parallel interface to a video source such as
>>> a sensor or TV decoder.  Each VIP can support two inputs (slices) and
>>> a SoC can be configured with a variable number of VIP's.
>>> Each slice can supports two ports each connected to its own
>>> sub-device.
>>>
>>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> ---
>>>  drivers/media/platform/Kconfig         |   13 +
>>>  drivers/media/platform/ti-vpe/Makefile |    2 +
>>>  drivers/media/platform/ti-vpe/vip.c    | 4158 ++++++++++++++++++++++++
>>>  drivers/media/platform/ti-vpe/vip.h    |  724 +++++
>>>  4 files changed, 4897 insertions(+)
>>>  create mode 100644 drivers/media/platform/ti-vpe/vip.c
>>>  create mode 100644 drivers/media/platform/ti-vpe/vip.h
>>>

<snip>

>>> +static int vip_enum_fmt_vid_cap(struct file *file, void *priv,
>>> +				struct v4l2_fmtdesc *f)
>>> +{
>>> +	struct vip_stream *stream = file2stream(file);
>>> +	struct vip_port *port = stream->port;
>>> +	struct vip_fmt *fmt;
>>> +
>>> +	vip_dbg(3, stream, "enum_fmt index:%d\n", f->index);
>>> +	if (f->index >= port->num_active_fmt)
>>> +		return -EINVAL;
>>> +
>>> +	fmt = port->active_fmt[f->index];
>>> +
>>> +	f->pixelformat = fmt->fourcc;
>>> +	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>>
>> No need to set the type field.
> 
> Ok.
> 
>>
>>> +	vip_dbg(3, stream, "enum_fmt fourcc:%s\n",
>>> +		fourcc_to_str(f->pixelformat));
>>
>> Excessive debugging.
> 
> Why excessive?

Two debug messages for a simple function like this seems overkill.

Besides, the v4l2 core already has debugging support for ioctl calls:

https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-dev.html#video-device-debugging

> 
>>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int vip_enum_framesizes(struct file *file, void *priv,
>>> +			       struct v4l2_frmsizeenum *f)
>>> +{
>>> +	struct vip_stream *stream = file2stream(file);
>>> +	struct vip_port *port = stream->port;
>>> +	struct vip_fmt *fmt;
>>> +	struct v4l2_subdev_frame_size_enum fse;
>>> +	int ret;
>>> +
>>> +	fmt = find_port_format_by_pix(port, f->pixel_format);
>>> +	if (!fmt)
>>> +		return -EINVAL;
>>> +
>>> +	fse.index = f->index;
>>> +	fse.pad = port->source_pad;
>>> +	fse.code = fmt->code;
>>> +	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>> +	ret = v4l2_subdev_call(port->subdev, pad, enum_frame_size, NULL, &fse);
>>> +	if (ret == -ENOIOCTLCMD && !f->index) {
>>> +		/*
>>> +		 * if subdev does not support enum_frame_size
>>> +		 * then use get_fmt
>>
>> I don't think that's right. If the subdev doesn't support this, then
>> this ioctl should be disabled altogether. Typically this ioctl is only
>> valid for sensor subdevs, not for video receivers.
>>
>> Use v4l2_subdev_has_op() and v4l2_disable_ioctl().
> 
> You mean to check if the subdev support this ioctl and if not disable it
> for the current video device only, correct?

Correct.

There are several other drivers that do this, just grep for them.

>>> +static int vip_calc_format_size(struct vip_port *port,
>>> +				struct vip_fmt *fmt,
>>> +				struct v4l2_format *f)
>>> +{
>>> +	enum v4l2_field *field;
>>> +	unsigned int stride;
>>> +
>>> +	if (!fmt) {
>>> +		vip_dbg(2, port,
>>> +			"no vip_fmt format provided!\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	field = &f->fmt.pix.field;
>>> +	if (*field == V4L2_FIELD_ANY)
>>> +		*field = V4L2_FIELD_NONE;
>>> +	else if (V4L2_FIELD_NONE != *field && V4L2_FIELD_ALTERNATE != *field)
>>> +		return -EINVAL;
>>> +
>>> +	v4l_bound_align_image(&f->fmt.pix.width, MIN_W, MAX_W, W_ALIGN,
>>> +			      &f->fmt.pix.height, MIN_H, MAX_H, H_ALIGN,
>>> +			      S_ALIGN);
>>> +
>>> +	stride = f->fmt.pix.width * (fmt->vpdma_fmt[0]->depth >> 3);
>>> +	if (stride > f->fmt.pix.bytesperline)
>>> +		f->fmt.pix.bytesperline = stride;
>>> +
>>> +	f->fmt.pix.bytesperline = clamp_t(u32, f->fmt.pix.bytesperline,
>>> +					  stride, VPDMA_MAX_STRIDE);
>>> +	f->fmt.pix.bytesperline = ALIGN(f->fmt.pix.bytesperline,
>>> +					VPDMA_STRIDE_ALIGN);
>>> +
>>> +	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
>>> +	if (fmt->coplanar) {
>>> +		f->fmt.pix.sizeimage += f->fmt.pix.height *
>>> +					f->fmt.pix.bytesperline *
>>> +					fmt->vpdma_fmt[VIP_CHROMA]->depth >> 3;
>>> +	}
>>> +
>>> +	f->fmt.pix.colorspace = fmt->colorspace;
>>> +	f->fmt.pix.priv = 0;
>>
>> No need to set this.
> 
> You mean pix.priv? I thought I remember v4l2-compliance complaining about
> something like this?

Yes, pix.priv. It used to complain a long time ago, but the v4l2 core should
handle this. Basically drivers shouldn't touch pix.priv.

> 
>>
>>> +
>>> +	vip_dbg(3, port, "calc_format_size: fourcc:%s size: %dx%d bpl:%d img_size:%d\n",
>>> +		fourcc_to_str(f->fmt.pix.pixelformat),
>>> +		f->fmt.pix.width, f->fmt.pix.height,
>>> +		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static inline bool vip_is_size_dma_aligned(u32 bpp, u32 width)
>>> +{
>>> +	return ((width * bpp) == ALIGN(width * bpp, VPDMA_STRIDE_ALIGN));
>>> +}
>>> +
>>> +static int vip_try_fmt_vid_cap(struct file *file, void *priv,
>>> +			       struct v4l2_format *f)
>>> +{
>>> +	struct vip_stream *stream = file2stream(file);
>>> +	struct vip_port *port = stream->port;
>>> +	struct v4l2_subdev_frame_size_enum fse;
>>> +	struct vip_fmt *fmt;
>>> +	u32 best_width, best_height, largest_width, largest_height;
>>> +	int ret, found;
>>> +	enum vip_csc_state csc_direction;
>>> +
>>> +	vip_dbg(3, stream, "try_fmt fourcc:%s size: %dx%d\n",
>>> +		fourcc_to_str(f->fmt.pix.pixelformat),
>>> +		f->fmt.pix.width, f->fmt.pix.height);
>>> +
>>> +	fmt = find_port_format_by_pix(port, f->fmt.pix.pixelformat);
>>> +	if (!fmt) {
>>> +		vip_dbg(2, stream,
>>> +			"Fourcc format (0x%08x) not found.\n",
>>> +			f->fmt.pix.pixelformat);
>>> +
>>> +		/* Just get the first one enumerated */
>>> +		fmt = port->active_fmt[0];
>>> +		f->fmt.pix.pixelformat = fmt->fourcc;
>>> +	}
>>> +
>>> +	csc_direction =  vip_csc_direction(fmt->code, fmt->finfo);
>>> +	if (csc_direction != VIP_CSC_NA) {
>>> +		if (!is_csc_available(port)) {
>>> +			vip_dbg(2, stream,
>>> +				"CSC not available for Fourcc format (0x%08x).\n",
>>> +				f->fmt.pix.pixelformat);
>>> +
>>> +			/* Just get the first one enumerated */
>>> +			fmt = port->active_fmt[0];
>>> +			f->fmt.pix.pixelformat = fmt->fourcc;
>>> +			/* re-evaluate the csc_direction here */
>>> +			csc_direction =  vip_csc_direction(fmt->code,
>>> +							   fmt->finfo);
>>> +		} else {
>>> +			vip_dbg(3, stream, "CSC active on Port %c: going %s\n",
>>> +				port->port_id == VIP_PORTA ? 'A' : 'B',
>>> +				(csc_direction == VIP_CSC_Y2R) ? "Y2R" : "R2Y");
>>> +		}
>>> +	}
>>> +
>>> +	/*
>>> +	 * Given that sensors might support multiple mbus code we need
>>> +	 * to use the one that matches the requested pixel format
>>> +	 */
>>> +	port->try_mbus_framefmt = port->mbus_framefmt;
>>> +	port->try_mbus_framefmt.code = fmt->code;
>>> +
>>> +	/* check for/find a valid width/height */
>>> +	ret = 0;
>>> +	found = false;
>>> +	best_width = 0;
>>> +	best_height = 0;
>>> +	largest_width = 0;
>>> +	largest_height = 0;
>>> +	fse.pad = port->source_pad;
>>> +	fse.code = fmt->code;
>>> +	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>> +	for (fse.index = 0; ; fse.index++) {
>>> +		u32 bpp = fmt->vpdma_fmt[0]->depth >> 3;
>>> +
>>> +		ret = v4l2_subdev_call(port->subdev, pad,
>>> +				       enum_frame_size, NULL, &fse);
>>> +		if (ret == -ENOIOCTLCMD) {
>>> +			/*
>>> +			 * if subdev does not support enum_frame_size
>>> +			 * then just try to set_fmt directly
>>> +			 */
>>> +			struct v4l2_subdev_format format = {
>>> +				.which = V4L2_SUBDEV_FORMAT_TRY,
>>> +			};
>>> +			struct v4l2_subdev_pad_config *pad_cfg;
>>> +
>>> +			pad_cfg = v4l2_subdev_alloc_pad_config(port->subdev);
>>> +			if (!pad_cfg)
>>> +				return -ENOMEM;
>>> +
>>> +			v4l2_fill_mbus_format(&format.format, &f->fmt.pix,
>>> +					      fmt->code);
>>> +			ret = v4l2_subdev_call(port->subdev, pad, set_fmt,
>>> +					       pad_cfg, &format);
>>> +			if (ret)
>>> +				/* here regardless of the reason we give up */
>>> +				break;
>>> +
>>> +			if (f->fmt.pix.width == format.format.width &&
>>> +			    f->fmt.pix.height == format.format.height) {
>>> +				found = true;
>>> +				vip_dbg(3, stream, "try_fmt loop:%d found direct match: %dx%d\n",
>>> +					fse.index, format.format.width,
>>> +					format.format.height);
>>> +			}
>>> +			largest_width = format.format.width;
>>> +			largest_height = format.format.height;
>>> +			best_width = format.format.width;
>>> +			best_height = format.format.height;
>>> +
>>> +			v4l2_subdev_free_pad_config(pad_cfg);
>>> +			break;
>>> +
>>> +		} else if (ret) {
>>> +			break;
>>> +		}
>>> +
>>> +		vip_dbg(3, stream, "try_fmt loop:%d fourcc:%s size: %dx%d\n",
>>> +			fse.index, fourcc_to_str(f->fmt.pix.pixelformat),
>>> +			fse.max_width, fse.max_height);
>>> +
>>> +		if (!vip_is_size_dma_aligned(bpp, fse.max_width))
>>> +			continue;
>>> +
>>> +		if ((fse.max_width >= largest_width) &&
>>> +		    (fse.max_height >= largest_height)) {
>>> +			vip_dbg(3, stream, "try_fmt loop:%d found new larger: %dx%d\n",
>>> +				fse.index, fse.max_width, fse.max_height);
>>> +			largest_width = fse.max_width;
>>> +			largest_height = fse.max_height;
>>> +		}
>>> +
>>> +		if ((fse.max_width >= f->fmt.pix.width) &&
>>> +		    (fse.max_height >= f->fmt.pix.height)) {
>>> +			vip_dbg(3, stream, "try_fmt loop:%d found at least larger: %dx%d\n",
>>> +				fse.index, fse.max_width, fse.max_height);
>>> +
>>> +			if (!best_width ||
>>> +			    ((abs(best_width - f->fmt.pix.width) >=
>>> +			      abs(fse.max_width - f->fmt.pix.width)) &&
>>> +			     (abs(best_height - f->fmt.pix.height) >=
>>> +			      abs(fse.max_height - f->fmt.pix.height)))) {
>>> +				best_width = fse.max_width;
>>> +				best_height = fse.max_height;
>>> +				vip_dbg(3, stream, "try_fmt loop:%d found new best: %dx%d\n",
>>> +					fse.index, fse.max_width,
>>> +					fse.max_height);
>>> +			}
>>> +		}
>>> +
>>> +		if ((f->fmt.pix.width == fse.max_width) &&
>>> +		    (f->fmt.pix.height == fse.max_height)) {
>>> +			found = true;
>>> +			vip_dbg(3, stream, "try_fmt loop:%d found direct match: %dx%d\n",
>>> +				fse.index, fse.max_width,
>>> +				fse.max_height);
>>> +			break;
>>> +		}
>>> +
>>> +		if ((f->fmt.pix.width >= fse.min_width) &&
>>> +		    (f->fmt.pix.width <= fse.max_width) &&
>>> +		    (f->fmt.pix.height >= fse.min_height) &&
>>> +		    (f->fmt.pix.height <= fse.max_height)) {
>>> +			found = true;
>>> +			vip_dbg(3, stream, "try_fmt loop:%d found direct range match: %dx%d\n",
>>> +				fse.index, fse.max_width,
>>> +				fse.max_height);
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	if (found) {
>>> +		port->try_mbus_framefmt.width = f->fmt.pix.width;
>>> +		port->try_mbus_framefmt.height = f->fmt.pix.height;
>>> +		/* No need to check for scaling */
>>> +		goto calc_size;
>>> +	} else if (largest_width && f->fmt.pix.width > largest_width) {
>>> +		port->try_mbus_framefmt.width = largest_width;
>>> +		port->try_mbus_framefmt.height = largest_height;
>>> +	} else if (best_width) {
>>> +		port->try_mbus_framefmt.width = best_width;
>>> +		port->try_mbus_framefmt.height = best_height;
>>> +	} else {
>>> +		/* use existing values as default */
>>> +	}
>>> +
>>> +	vip_dbg(3, stream, "try_fmt best subdev size: %dx%d\n",
>>> +		port->try_mbus_framefmt.width,
>>> +		port->try_mbus_framefmt.height);
>>> +
>>> +	if (is_scaler_available(port) &&
>>> +	    csc_direction != VIP_CSC_Y2R &&
>>> +	    !vip_is_mbuscode_raw(fmt->code) &&
>>> +	    f->fmt.pix.height <= port->try_mbus_framefmt.height &&
>>> +	    port->try_mbus_framefmt.height <= SC_MAX_PIXEL_HEIGHT &&
>>> +	    port->try_mbus_framefmt.width <= SC_MAX_PIXEL_WIDTH) {
>>> +		/*
>>> +		 * Scaler is only accessible if the dst colorspace is YUV.
>>> +		 * As the input to the scaler must be in YUV mode only.
>>> +		 *
>>> +		 * Scaling up is allowed only horizontally.
>>> +		 */
>>> +		unsigned int hratio, vratio, width_align, height_align;
>>> +		u32 bpp = fmt->vpdma_fmt[0]->depth >> 3;
>>> +
>>> +		vip_dbg(3, stream, "Scaler active on Port %c: requesting %dx%d\n",
>>> +			port->port_id == VIP_PORTA ? 'A' : 'B',
>>> +			f->fmt.pix.width, f->fmt.pix.height);
>>> +
>>> +		/* Just make sure everything is properly aligned */
>>> +		width_align = ALIGN(f->fmt.pix.width * bpp, VPDMA_STRIDE_ALIGN);
>>> +		width_align /= bpp;
>>> +		height_align = ALIGN(f->fmt.pix.height, 2);
>>> +
>>> +		f->fmt.pix.width = width_align;
>>> +		f->fmt.pix.height = height_align;
>>> +
>>> +		hratio = f->fmt.pix.width * 1000 /
>>> +			 port->try_mbus_framefmt.width;
>>> +		vratio = f->fmt.pix.height * 1000 /
>>> +			 port->try_mbus_framefmt.height;
>>> +		if (hratio < 125) {
>>> +			f->fmt.pix.width = port->try_mbus_framefmt.width / 8;
>>> +			vip_dbg(3, stream, "Horizontal scaling ratio out of range adjusting -> %d\n",
>>> +				f->fmt.pix.width);
>>> +		}
>>> +
>>> +		if (vratio < 188) {
>>> +			f->fmt.pix.height = port->try_mbus_framefmt.height / 4;
>>> +			vip_dbg(3, stream, "Vertical scaling ratio out of range adjusting -> %d\n",
>>> +				f->fmt.pix.height);
>>> +		}
>>> +		vip_dbg(3, stream, "Scaler: got %dx%d\n",
>>> +			f->fmt.pix.width, f->fmt.pix.height);
>>> +	} else {
>>> +		/* use existing values as default */
>>> +		f->fmt.pix.width = port->try_mbus_framefmt.width;
>>> +		f->fmt.pix.height = port->try_mbus_framefmt.height;
>>> +	}
>>> +
>>> +calc_size:
>>> +	/* That we have a fmt calculate imagesize and bytesperline */
>>> +	return vip_calc_format_size(port, fmt, f);
>>> +}
>>> +
>>> +static int vip_g_fmt_vid_cap(struct file *file, void *priv,
>>> +			     struct v4l2_format *f)
>>> +{
>>> +	struct vip_stream *stream = file2stream(file);
>>> +	struct vip_port *port = stream->port;
>>> +	struct vip_fmt *fmt = port->fmt;
>>> +
>>> +	/* Use last known values or defaults */
>>> +	f->fmt.pix.width	= stream->width;
>>> +	f->fmt.pix.height	= stream->height;
>>> +	f->fmt.pix.pixelformat	= port->fmt->fourcc;
>>> +	f->fmt.pix.field	= stream->sup_field;
>>> +	f->fmt.pix.colorspace	= port->fmt->colorspace;
>>> +	f->fmt.pix.bytesperline	= stream->bytesperline;
>>> +	f->fmt.pix.sizeimage	= stream->sizeimage;
>>> +
>>> +	vip_dbg(3, stream,
>>> +		"g_fmt fourcc:%s code: %04x size: %dx%d bpl:%d img_size:%d\n",
>>> +		fourcc_to_str(f->fmt.pix.pixelformat),
>>> +		fmt->code,
>>> +		f->fmt.pix.width, f->fmt.pix.height,
>>> +		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
>>> +	vip_dbg(3, stream, "g_fmt vpdma data type: 0x%02X\n",
>>> +		port->fmt->vpdma_fmt[0]->data_type);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int vip_s_fmt_vid_cap(struct file *file, void *priv,
>>> +			     struct v4l2_format *f)
>>> +{
>>> +	struct vip_stream *stream = file2stream(file);
>>> +	struct vip_port *port = stream->port;
>>> +	struct v4l2_subdev_format sfmt;
>>> +	struct v4l2_mbus_framefmt *mf;
>>> +	enum vip_csc_state csc_direction;
>>> +	int ret;
>>> +
>>> +	vip_dbg(3, stream, "s_fmt input fourcc:%s size: %dx%d bpl:%d img_size:%d\n",
>>> +		fourcc_to_str(f->fmt.pix.pixelformat),
>>> +		f->fmt.pix.width, f->fmt.pix.height,
>>> +		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
>>> +
>>> +	ret = vip_try_fmt_vid_cap(file, priv, f);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	vip_dbg(3, stream, "s_fmt try_fmt fourcc:%s size: %dx%d bpl:%d img_size:%d\n",
>>> +		fourcc_to_str(f->fmt.pix.pixelformat),
>>> +		f->fmt.pix.width, f->fmt.pix.height,
>>> +		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
>>> +
>>> +	if (vb2_is_busy(&stream->vb_vidq)) {
>>> +		vip_err(stream, "%s queue busy\n", __func__);
>>> +		return -EBUSY;
>>> +	}
>>> +
>>> +	/*
>>> +	 * Check if we need the scaler or not
>>> +	 *
>>> +	 * Since on previous S_FMT call the scaler might have been
>>> +	 * allocated if it is not needed in this instance we will
>>> +	 * attempt to free it just in case.
>>> +	 *
>>> +	 * free_scaler() is harmless unless the current port
>>> +	 * allocated it.
>>> +	 */
>>> +	if (f->fmt.pix.width == port->try_mbus_framefmt.width &&
>>> +	    f->fmt.pix.height == port->try_mbus_framefmt.height)
>>> +		free_scaler(port);
>>> +	else
>>> +		allocate_scaler(port);
>>> +
>>> +	port->fmt = find_port_format_by_pix(port,
>>> +					    f->fmt.pix.pixelformat);
>>> +	stream->width		= f->fmt.pix.width;
>>> +	stream->height		= f->fmt.pix.height;
>>> +	stream->bytesperline	= f->fmt.pix.bytesperline;
>>> +	stream->sizeimage	= f->fmt.pix.sizeimage;
>>> +	stream->sup_field	= f->fmt.pix.field;
>>> +	stream->field		= f->fmt.pix.field;
>>> +
>>> +	port->c_rect.left	= 0;
>>> +	port->c_rect.top	= 0;
>>> +	port->c_rect.width	= stream->width;
>>> +	port->c_rect.height	= stream->height;
>>> +
>>> +	/*
>>> +	 * Check if we need the csc unit or not
>>> +	 *
>>> +	 * Since on previous S_FMT call, the csc might have been
>>> +	 * allocated if it is not needed in this instance we will
>>> +	 * attempt to free it just in case.
>>> +	 *
>>> +	 * free_csc() is harmless unless the current port
>>> +	 * allocated it.
>>> +	 */
>>> +	csc_direction =  vip_csc_direction(port->fmt->code, port->fmt->finfo);
>>> +	if (csc_direction == VIP_CSC_NA)
>>> +		free_csc(port);
>>> +	else
>>> +		allocate_csc(port, csc_direction);
>>> +
>>> +	if (stream->sup_field == V4L2_FIELD_ALTERNATE)
>>> +		port->flags |= FLAG_INTERLACED;
>>> +	else
>>> +		port->flags &= ~FLAG_INTERLACED;
>>> +
>>> +	vip_dbg(3, stream, "s_fmt fourcc:%s size: %dx%d bpl:%d img_size:%d\n",
>>> +		fourcc_to_str(f->fmt.pix.pixelformat),
>>> +		f->fmt.pix.width, f->fmt.pix.height,
>>> +		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
>>> +
>>> +	mf = &sfmt.format;
>>> +	v4l2_fill_mbus_format(mf, &f->fmt.pix, port->fmt->code);
>>> +	/* Make sure to use the subdev size found in the try_fmt */
>>> +	mf->width = port->try_mbus_framefmt.width;
>>> +	mf->height = port->try_mbus_framefmt.height;
>>> +
>>> +	vip_dbg(3, stream, "s_fmt pix_to_mbus mbus_code: %04X size: %dx%d\n",
>>> +		mf->code,
>>> +		mf->width, mf->height);
>>> +
>>> +	sfmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>> +	sfmt.pad = port->source_pad;
>>> +	ret = v4l2_subdev_call(port->subdev, pad, set_fmt, NULL, &sfmt);
>>> +	if (ret) {
>>> +		vip_dbg(1, stream, "set_fmt failed in subdev\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	/* Save it */
>>> +	port->mbus_framefmt = *mf;
>>> +
>>> +	vip_dbg(3, stream, "s_fmt subdev fmt mbus_code: %04X size: %dx%d\n",
>>> +		port->mbus_framefmt.code,
>>> +		port->mbus_framefmt.width, port->mbus_framefmt.height);
>>> +	vip_dbg(3, stream, "s_fmt vpdma data type: 0x%02X\n",
>>> +		port->fmt->vpdma_fmt[0]->data_type);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * Does the exact opposite of set_fmt_params
>>> + * It makes sure the DataPath register is sane after tear down
>>> + */
>>> +static void unset_fmt_params(struct vip_stream *stream)
>>> +{
>>> +	struct vip_dev *dev = stream->port->dev;
>>> +	struct vip_port *port = stream->port;
>>> +
>>> +	stream->sequence = 0;
>>> +	if (stream->port->flags & FLAG_INTERLACED)
>>> +		stream->field = V4L2_FIELD_TOP;
>>> +
>>> +	if (port->csc == VIP_CSC_Y2R) {
>>> +		if (port->port_id == VIP_PORTA) {
>>> +			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_SRC_DATA_SELECT, 0);
>>> +		} else {
>>> +			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>>> +		}
>>> +		/* We are done */
>>> +		return;
>>> +	} else if (port->csc == VIP_CSC_R2Y) {
>>> +		if (port->scaler && port->fmt->coplanar) {
>>> +			if (port->port_id == VIP_PORTA) {
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CSC_SRC_DATA_SELECT, 0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_SC_SRC_DATA_SELECT, 0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>>> +						   0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>>> +						   0);
>>> +			}
>>> +		} else if (port->scaler) {
>>> +			if (port->port_id == VIP_PORTA) {
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CSC_SRC_DATA_SELECT, 0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_SC_SRC_DATA_SELECT, 0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>>> +						   0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>>> +						   0);
>>> +			}
>>> +		} else if (port->fmt->coplanar) {
>>> +			if (port->port_id == VIP_PORTA) {
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CSC_SRC_DATA_SELECT, 0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>>> +						   0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>>> +						   0);
>>> +			}
>>> +		} else {
>>> +			if (port->port_id == VIP_PORTA) {
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CSC_SRC_DATA_SELECT, 0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>>> +						   0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>>> +						   0);
>>> +			}
>>> +		}
>>> +		/* We are done */
>>> +		return;
>>> +	} else if (v4l2_is_format_rgb(port->fmt->finfo)) {
>>> +		if (port->port_id == VIP_PORTA) {
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>>> +		}
>>> +		/* We are done */
>>> +		return;
>>> +	}
>>> +
>>> +	if (port->scaler && port->fmt->coplanar) {
>>> +		if (port->port_id == VIP_PORTA) {
>>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>>> +		} else {
>>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>>> +		}
>>> +	} else if (port->scaler) {
>>> +		if (port->port_id == VIP_PORTA) {
>>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>>> +		} else {
>>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>>> +		}
>>> +	} else if (port->fmt->coplanar) {
>>> +		if (port->port_id == VIP_PORTA) {
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>>> +		} else {
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 0);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>>> +		}
>>> +	} else {
>>> +		/*
>>> +		 * We undo all data path setting except for the multi
>>> +		 * stream case.
>>> +		 * Because we cannot disrupt other on-going capture if only
>>> +		 * one stream is terminated the other might still be going
>>> +		 */
>>> +		vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
>>> +		vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>>> +	}
>>> +}
>>> +
>>> +/*
>>> + * Set the registers that are modified when the video format changes.
>>> + */
>>> +static void set_fmt_params(struct vip_stream *stream)
>>> +{
>>
>> Hmm, this is a *very* long function. Perhaps this could be split up a bit,
>> or reorganized?
> 
> Yeah, I'll start by removing the extra comment lines and reformat it.
> 
>>
>>> +	struct vip_dev *dev = stream->port->dev;
>>> +	struct vip_port *port = stream->port;
>>> +
>>> +	stream->sequence = 0;
>>> +	if (stream->port->flags & FLAG_INTERLACED)
>>> +		stream->field = V4L2_FIELD_TOP;
>>> +
>>> +	if (port->csc == VIP_CSC_Y2R) {
>>> +		port->flags &= ~FLAG_MULT_PORT;
>>> +		/* Set alpha component in background color */
>>> +		vpdma_set_bg_color(dev->shared->vpdma,
>>> +				   (struct vpdma_data_format *)
>>> +				   port->fmt->vpdma_fmt[0],
>>> +				   0xff);
>>> +		if (port->port_id == VIP_PORTA) {
>>> +			/*
>>> +			 * Input A: YUV422
>>> +			 * Output: Y_UP/UV_UP: RGB
>>> +			 * CSC_SRC_SELECT       = 1
>>> +			 * RGB_OUT_HI_SELECT    = 1
>>> +			 * RGB_SRC_SELECT       = 1
>>> +			 * MULTI_CHANNEL_SELECT = 0
>>
>> It's a bit pointless to comment what the register values should be when you
>> set them in the code below. I'd drop that part, it will make the code
>> shorter.
> 
> Ok.
> 
>>
>>> +			 */
>>> +			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 1);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>>
>> For readability purposes I think it is better to keep this on one line. Same for
>> the other vip_set_slice_path calls.
> 
> Ok.
> 
>>
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 1);
>>> +			vip_set_slice_path(dev, VIP_RGB_SRC_DATA_SELECT, 1);
>>> +		} else {
>>> +			/*
>>> +			 * Input B: YUV422
>>> +			 * Output: Y_UP/UV_UP: RGB
>>> +			 * CSC_SRC_SELECT       = 2
>>> +			 * RGB_OUT_LO_SELECT    = 1
>>> +			 * MULTI_CHANNEL_SELECT = 0
>>> +			 */
>>> +			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 2);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 1);
>>> +		}
>>> +		/* We are done */
>>> +		return;
>>> +	} else if (port->csc == VIP_CSC_R2Y) {
>>> +		port->flags &= ~FLAG_MULT_PORT;
>>> +		if (port->scaler && port->fmt->coplanar) {
>>> +			if (port->port_id == VIP_PORTA) {
>>> +				/*
>>> +				 * Input A: RGB
>>> +				 * Output: Y_UP/UV_UP: Scaled YUV420
>>> +				 * CSC_SRC_SELECT       = 4
>>> +				 * SC_SRC_SELECT        = 1
>>> +				 * CHR_DS_1_SRC_SELECT  = 1
>>> +				 * CHR_DS_1_BYPASS      = 0
>>> +				 * RGB_OUT_HI_SELECT    = 0
>>> +				 */
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CSC_SRC_DATA_SELECT, 4);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_SC_SRC_DATA_SELECT, 1);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>>> +						   1);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>>> +						   0);
>>> +			} else {
>>> +				vip_err(stream, "RGB sensor can only be on Port A\n");
>>> +			}
>>> +		} else if (port->scaler) {
>>> +			if (port->port_id == VIP_PORTA) {
>>> +				/*
>>> +				 * Input A: RGB
>>> +				 * Output: Y_UP: Scaled YUV422
>>> +				 * CSC_SRC_SELECT       = 4
>>> +				 * SC_SRC_SELECT        = 1
>>> +				 * CHR_DS_1_SRC_SELECT  = 1
>>> +				 * CHR_DS_1_BYPASS      = 1
>>> +				 * RGB_OUT_HI_SELECT    = 0
>>> +				 */
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CSC_SRC_DATA_SELECT, 4);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_SC_SRC_DATA_SELECT, 1);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>>> +						   1);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_DATA_BYPASS, 1);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>>> +						   0);
>>> +			} else {
>>> +				vip_err(stream, "RGB sensor can only be on Port A\n");
>>> +			}
>>> +		} else if (port->fmt->coplanar) {
>>> +			if (port->port_id == VIP_PORTA) {
>>> +				/*
>>> +				 * Input A: RGB
>>> +				 * Output: Y_UP/UV_UP: YUV420
>>> +				 * CSC_SRC_SELECT       = 4
>>> +				 * CHR_DS_1_SRC_SELECT  = 2
>>> +				 * CHR_DS_1_BYPASS      = 0
>>> +				 * RGB_OUT_HI_SELECT    = 0
>>> +				 */
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CSC_SRC_DATA_SELECT, 4);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>>> +						   2);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>>> +						   0);
>>> +			} else {
>>> +				vip_err(stream, "RGB sensor can only be on Port A\n");
>>> +			}
>>> +		} else {
>>> +			if (port->port_id == VIP_PORTA) {
>>> +				/*
>>> +				 * Input A: RGB
>>> +				 * Output: Y_UP/UV_UP: YUV420
>>> +				 * CSC_SRC_SELECT       = 4
>>> +				 * CHR_DS_1_SRC_SELECT  = 2
>>> +				 * CHR_DS_1_BYPASS      = 1
>>> +				 * RGB_OUT_HI_SELECT    = 0
>>> +				 */
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CSC_SRC_DATA_SELECT, 4);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>>> +						   2);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_CHR_DS_1_DATA_BYPASS, 1);
>>> +				vip_set_slice_path(dev,
>>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>>> +						   0);
>>> +			} else {
>>> +				vip_err(stream, "RGB sensor can only be on Port A\n");
>>> +			}
>>> +		}
>>> +		/* We are done */
>>> +		return;
>>> +	} else if (v4l2_is_format_rgb(port->fmt->finfo)) {
>>> +		port->flags &= ~FLAG_MULT_PORT;
>>> +		/* Set alpha component in background color */
>>> +		vpdma_set_bg_color(dev->shared->vpdma,
>>> +				   (struct vpdma_data_format *)
>>> +				   port->fmt->vpdma_fmt[0],
>>> +				   0xff);
>>> +		if (port->port_id == VIP_PORTA) {
>>> +			/*
>>> +			 * Input A: RGB
>>> +			 * Output: Y_LO/UV_LO: RGB
>>> +			 * RGB_OUT_LO_SELECT    = 1
>>> +			 * MULTI_CHANNEL_SELECT = 1
>>> +			 */
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 1);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 1);
>>> +		} else {
>>> +			vip_err(stream, "RGB sensor can only be on Port A\n");
>>> +		}
>>> +		/* We are done */
>>> +		return;
>>> +	}
>>> +
>>> +	if (port->scaler && port->fmt->coplanar) {
>>> +		port->flags &= ~FLAG_MULT_PORT;
>>> +		if (port->port_id == VIP_PORTA) {
>>> +			/*
>>> +			 * Input A: YUV422
>>> +			 * Output: Y_UP/UV_UP: Scaled YUV420
>>> +			 * SC_SRC_SELECT        = 2
>>> +			 * CHR_DS_1_SRC_SELECT  = 1
>>> +			 * CHR_DS_1_BYPASS      = 0
>>> +			 * RGB_OUT_HI_SELECT    = 0
>>> +			 */
>>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 2);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 1);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>>> +		} else {
>>> +			/*
>>> +			 * Input B: YUV422
>>> +			 * Output: Y_LO/UV_LO: Scaled YUV420
>>> +			 * SC_SRC_SELECT        = 3
>>> +			 * CHR_DS_2_SRC_SELECT  = 1
>>> +			 * RGB_OUT_LO_SELECT    = 0
>>> +			 * MULTI_CHANNEL_SELECT = 0
>>> +			 */
>>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 3);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 1);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>>> +		}
>>> +	} else if (port->scaler) {
>>> +		port->flags &= ~FLAG_MULT_PORT;
>>> +		if (port->port_id == VIP_PORTA) {
>>> +			/*
>>> +			 * Input A: YUV422
>>> +			 * Output: Y_UP: Scaled YUV422
>>> +			 * SC_SRC_SELECT        = 2
>>> +			 * CHR_DS_1_SRC_SELECT  = 1
>>> +			 * CHR_DS_1_BYPASS      = 1
>>> +			 * RGB_OUT_HI_SELECT    = 0
>>> +			 */
>>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 2);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 1);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 1);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>>> +		} else {
>>> +			/*
>>> +			 * Input B: YUV422
>>> +			 * Output: UV_UP: Scaled YUV422
>>> +			 * SC_SRC_SELECT        = 3
>>> +			 * CHR_DS_2_SRC_SELECT  = 1
>>> +			 * CHR_DS_1_BYPASS      = 1
>>> +			 * CHR_DS_2_BYPASS      = 1
>>> +			 * RGB_OUT_HI_SELECT    = 0
>>> +			 */
>>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 3);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 1);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 1);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 1);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>>> +		}
>>> +	} else if (port->fmt->coplanar) {
>>> +		port->flags &= ~FLAG_MULT_PORT;
>>> +		if (port->port_id == VIP_PORTA) {
>>> +			/*
>>> +			 * Input A: YUV422
>>> +			 * Output: Y_UP/UV_UP: YUV420
>>> +			 * CHR_DS_1_SRC_SELECT  = 3
>>> +			 * CHR_DS_1_BYPASS      = 0
>>> +			 * RGB_OUT_HI_SELECT    = 0
>>> +			 */
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 3);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>>> +		} else {
>>> +			/*
>>> +			 * Input B: YUV422
>>> +			 * Output: Y_LO/UV_LO: YUV420
>>> +			 * CHR_DS_2_SRC_SELECT  = 4
>>> +			 * CHR_DS_2_BYPASS      = 0
>>> +			 * RGB_OUT_LO_SELECT    = 0
>>> +			 * MULTI_CHANNEL_SELECT = 0
>>> +			 */
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 4);
>>> +			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 0);
>>> +			vip_set_slice_path(dev,
>>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>>> +		}
>>> +	} else {
>>> +		port->flags |= FLAG_MULT_PORT;
>>> +		/*
>>> +		 * Input A/B: YUV422
>>> +		 * Output: Y_LO: YUV422 - UV_LO: YUV422
>>> +		 * MULTI_CHANNEL_SELECT = 1
>>> +		 * RGB_OUT_LO_SELECT    = 0
>>> +		 */
>>> +		vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
>>> +		vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>>> +	}
>>> +}
>>> +
>>> +static int vip_g_selection(struct file *file, void *fh,
>>> +			   struct v4l2_selection *s)
>>> +{
>>> +	struct vip_stream *stream = file2stream(file);
>>> +
>>> +	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>>> +		return -EINVAL;
>>> +
>>> +	switch (s->target) {
>>> +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
>>> +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
>>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>>> +	case V4L2_SEL_TGT_CROP_DEFAULT:
>>> +		s->r.left = 0;
>>> +		s->r.top = 0;
>>> +		s->r.width = stream->width;
>>> +		s->r.height = stream->height;
>>> +		return 0;
>>> +
>>> +	case V4L2_SEL_TGT_COMPOSE:
>>> +	case V4L2_SEL_TGT_CROP:
>>> +		s->r = stream->port->c_rect;
>>> +		return 0;
>>> +	}
>>> +
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
>>> +{
>>> +	if (a->left < b->left || a->top < b->top)
>>> +		return 0;
>>> +	if (a->left + a->width > b->left + b->width)
>>> +		return 0;
>>> +	if (a->top + a->height > b->top + b->height)
>>> +		return 0;
>>> +
>>> +	return 1;
>>> +}
>>
>> There are helper functions in include/media/v4l2-rect.h, it would make
>> sense to add this one to that header.
> 
> I'll check that out.
> 
>>
>>> +
>>> +static int vip_s_selection(struct file *file, void *fh,
>>> +			   struct v4l2_selection *s)
>>> +{
>>> +	struct vip_stream *stream = file2stream(file);
>>> +	struct v4l2_rect r = s->r;
>>> +
>>> +	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>>> +		return -EINVAL;
>>> +
>>> +	switch (s->target) {
>>> +	case V4L2_SEL_TGT_COMPOSE:
>>> +	case V4L2_SEL_TGT_CROP:
>>
>> Why both crop and compose when it is the same c_rect? That makes no sense.
> 
> Yeah, this is always puzzling to me. When to use which and what not.
> I'll catch you on IRC sometime to chat about this.

For video capture devices cropping occurs before the DMA step, usually
in the sensor. Composing affects the DMA engine: it composes the (possibly
cropped) video frame into a buffer. E.g. the buffer might be sized for
1920x1080, but the video is 1280x720 and you want to have it DMAed to the
center of the 1920x1080-sized buffer.

This requires that the DMA engine supports this, which is uncommon for video
capture drivers. So typically video capture drivers just support cropping.

> 
>>
>>> +		v4l_bound_align_image(&r.width, 0, stream->width, 0,
>>> +				      &r.height, 0, stream->height, 0, 0);
>>> +
>>> +		r.left = clamp_t(unsigned int, r.left, 0,
>>> +				 stream->width - r.width);
>>> +		r.top  = clamp_t(unsigned int, r.top, 0,
>>> +				 stream->height - r.height);
>>> +
>>> +		if (s->flags & V4L2_SEL_FLAG_LE &&
>>> +		    !enclosed_rectangle(&r, &s->r))
>>> +			return -ERANGE;
>>> +
>>> +		if (s->flags & V4L2_SEL_FLAG_GE &&
>>> +		    !enclosed_rectangle(&s->r, &r))
>>> +			return -ERANGE;
>>> +
>>> +		s->r = r;
>>> +		stream->port->c_rect = r;
>>> +
>>> +		vip_dbg(1, stream, "cropped (%d,%d)/%dx%d of %dx%d\n",
>>> +			r.left, r.top, r.width, r.height,
>>> +			stream->width, stream->height);
>>> +
>>> +			s->r = stream->port->c_rect;
>>> +		return 0;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	return 0;
>>> +}

Regards,

	Hans
