Return-Path: <linux-media+bounces-42910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDF5B8F6A7
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 10:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 900CA3AB2AD
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 08:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB752FD1B2;
	Mon, 22 Sep 2025 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDxNhSxh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58699EACD;
	Mon, 22 Sep 2025 08:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528623; cv=none; b=ZM5Er4hYNmIE3srC7JpNB35cgFhedeUaRMcGRgYK/n0zCKe0NsCSI/4k0MnARpVS3NETAX6lIZCsCtRd34AM314omMn2pN4GxhWaockyMpwjTtxxm7zAflC9eYb//QPkxv48mTw5/jpxSrD7YM5cSBaIFVnffBhPQ1mz/wx3ddQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528623; c=relaxed/simple;
	bh=5HPJIJ5UdDfeF+JVqlj2EiSW9oZQZPyDRdtUpZ0LPmE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VoN385YI/ICMfmjKk0jiLu/LCbiyO0Tu4drSbKbb8SCY3CXx/lHsEUE6Pbl+8lCxRU1/N1c7vm3yW2LciNwa++oy0h4lqt7yKEifAgmjyTtxcUnYBg1cRyqT5AcQHIle4YcJcw6T+bsLcnuWS33835y1CS74y3fy+QEIbL5Gz44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDxNhSxh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6030C116D0;
	Mon, 22 Sep 2025 08:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758528622;
	bh=5HPJIJ5UdDfeF+JVqlj2EiSW9oZQZPyDRdtUpZ0LPmE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=NDxNhSxhNqXeA5B9Zy8t5oc9fzl29HrvEE8y+29NBWoMh7ubQdPmqYcAKEN5Gtgke
	 13RUWOq+F+ed2fFL4jkTNEHCx1c7ZOcjm6c56HyFzaoR5RyvWLYdyf+HmgCnULW8Ig
	 TGW+cJaDEWhxRnQmz/z/iVKN+21+2eYDAoqhuCbpI4zbM8neuQe4T9k5Oew9SHK/UU
	 851EhQrzRK3ZbQXnkvvNs5VcHOFtGJ86DwYGTJ94GXJYhyBbizOIrsnajgleBVVkQV
	 2V/pkT48aJ+cQKjQWSrD/fekwouxeYoXXrBzVojpOdGhbHVB8r4b3g4WXTt4hT1WQo
	 KWOjl6MoO++xA==
Message-ID: <dc694dae-ef81-43d2-9ec1-a657690b8da7@kernel.org>
Date: Mon, 22 Sep 2025 10:10:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 05/10] media: v4l2-ioctl: Add video_device_state
 argument to v4l2 ioctl wrappers
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
 <20250919-vdev-state-v2-5-b2c42426965c@ideasonboard.com>
 <1209fda7-984c-42a9-98cc-ffa446f19903@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <1209fda7-984c-42a9-98cc-ffa446f19903@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/09/2025 10:09, Hans Verkuil wrote:
> On 19/09/2025 11:55, Jai Luthra wrote:
>> Add a third argument to all v4l2 ioctl wrappers to pass struct
>> video_device_state * directly, replacing the previous opaque pointer
>> approach.
>>
>> Currently, this argument is populated with NULL since existing driver
>> hooks still expect a void *priv argument. This will be addressed in a
>> subsequent patch.
> 
> There is one more occurrance of this in v4l2_compat_ioctl32.c in function
> ctrl_is_pointer() where vidioc_query_ext_ctrl is called.

Ignore this, this doesn't apply to this patch.

> 
> Regards,
> 
> 	Hans
> 
>>
>> Most changes to the ioctl wrappers were generated using the following
>> Coccinelle semantic patch:
>>
>> @ioctl@
>> identifier v4l2_ioctls;
>> identifier ioctl;
>> identifier fn;
>> identifier debug;
>> expression flags;
>> @@
>> struct v4l2_ioctl_info v4l2_ioctls[] = {
>> 	...,
>> 	IOCTL_INFO(ioctl, fn, debug, flags),
>> 	...,
>> };
>>
>> @depends on ioctl@
>> identifier ioctl.fn;
>> identifier ops;
>> identifier file;
>> identifier arg;
>> identifier handler;
>> expression list args;
>> @@
>> -int fn(const struct v4l2_ioctl_ops *ops, struct file *file, void *arg)
>> +int fn(const struct v4l2_ioctl_ops *ops, struct file *file,
>> +       struct video_device_state *state, void *arg)
>> {
>> 	<...
>> -	ops->handler(file, NULL, args)
>> +	ops->handler(file, state, args)
>> 	...>
>> }
>>
>> Manual changes were made to handle calls to v4l_[gs]_selection, update
>> the v4l2_ioctl_info structure definition and macros, fix argument
>> wrapping in some function definitions, and handle the common function
>> pointer in v4l2_ioctl_info.
>>
>> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>> --
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: Hans Verkuil <hverkuil@kernel.org>
>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Cc: Ricardo Ribalda <ribalda@chromium.org>
>> Cc: Hans de Goede <hansg@kernel.org>
>> Cc: Jai Luthra <jai.luthra@ideasonboard.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 360 ++++++++++++++++++-----------------
>>  1 file changed, 186 insertions(+), 174 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..644f06521673ff7ce5b194335d50f0e375ca7f51 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1090,7 +1090,7 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
>>  }
>>  
>>  static int v4l_querycap(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			void *arg)
>> +			struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_capability *cap = (struct v4l2_capability *)arg;
>>  	struct video_device *vfd = video_devdata(file);
>> @@ -1103,7 +1103,7 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  	media_set_bus_info(cap->bus_info, sizeof(cap->bus_info),
>>  			   vfd->dev_parent);
>>  
>> -	ret = ops->vidioc_querycap(file, NULL, cap);
>> +	ret = ops->vidioc_querycap(file, state, cap);
>>  
>>  	/*
>>  	 * Drivers must not change device_caps, so check for this and
>> @@ -1124,7 +1124,7 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  }
>>  
>>  static int v4l_g_input(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		       void *arg)
>> +		       struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  
>> @@ -1133,11 +1133,11 @@ static int v4l_g_input(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		return 0;
>>  	}
>>  
>> -	return ops->vidioc_g_input(file, NULL, arg);
>> +	return ops->vidioc_g_input(file, state, arg);
>>  }
>>  
>>  static int v4l_g_output(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			void *arg)
>> +			struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  
>> @@ -1146,11 +1146,11 @@ static int v4l_g_output(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		return 0;
>>  	}
>>  
>> -	return ops->vidioc_g_output(file, NULL, arg);
>> +	return ops->vidioc_g_output(file, state, arg);
>>  }
>>  
>>  static int v4l_s_input(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		       void *arg)
>> +		       struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	int ret;
>> @@ -1162,22 +1162,22 @@ static int v4l_s_input(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  	if (vfd->device_caps & V4L2_CAP_IO_MC)
>>  		return  *(int *)arg ? -EINVAL : 0;
>>  
>> -	return ops->vidioc_s_input(file, NULL, *(unsigned int *)arg);
>> +	return ops->vidioc_s_input(file, state, *(unsigned int *)arg);
>>  }
>>  
>>  static int v4l_s_output(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			void *arg)
>> +			struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  
>>  	if (vfd->device_caps & V4L2_CAP_IO_MC)
>>  		return  *(int *)arg ? -EINVAL : 0;
>>  
>> -	return ops->vidioc_s_output(file, NULL, *(unsigned int *)arg);
>> +	return ops->vidioc_s_output(file, state, *(unsigned int *)arg);
>>  }
>>  
>>  static int v4l_g_priority(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			  void *arg)
>> +			  struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd;
>>  	u32 *p = arg;
>> @@ -1188,7 +1188,7 @@ static int v4l_g_priority(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  }
>>  
>>  static int v4l_s_priority(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			  void *arg)
>> +			  struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd;
>>  	struct v4l2_fh *vfh;
>> @@ -1200,7 +1200,7 @@ static int v4l_s_priority(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  }
>>  
>>  static int v4l_enuminput(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			 void *arg)
>> +			 struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_input *p = arg;
>> @@ -1222,11 +1222,11 @@ static int v4l_enuminput(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		return 0;
>>  	}
>>  
>> -	return ops->vidioc_enum_input(file, NULL, p);
>> +	return ops->vidioc_enum_input(file, state, p);
>>  }
>>  
>>  static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			  void *arg)
>> +			  struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_output *p = arg;
>> @@ -1248,7 +1248,7 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		return 0;
>>  	}
>>  
>> -	return ops->vidioc_enum_output(file, NULL, p);
>> +	return ops->vidioc_enum_output(file, state, p);
>>  }
>>  
>>  static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>> @@ -1588,7 +1588,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  }
>>  
>>  static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			void *arg)
>> +			struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vdev = video_devdata(file);
>>  	struct v4l2_fmtdesc *p = arg;
>> @@ -1618,12 +1618,12 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  
>>  		if (unlikely(!ops->vidioc_enum_fmt_vid_cap))
>>  			break;
>> -		ret = ops->vidioc_enum_fmt_vid_cap(file, NULL, arg);
>> +		ret = ops->vidioc_enum_fmt_vid_cap(file, state, arg);
>>  		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>>  		if (unlikely(!ops->vidioc_enum_fmt_vid_overlay))
>>  			break;
>> -		ret = ops->vidioc_enum_fmt_vid_overlay(file, NULL, arg);
>> +		ret = ops->vidioc_enum_fmt_vid_overlay(file, state, arg);
>>  		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> @@ -1635,27 +1635,27 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  
>>  		if (unlikely(!ops->vidioc_enum_fmt_vid_out))
>>  			break;
>> -		ret = ops->vidioc_enum_fmt_vid_out(file, NULL, arg);
>> +		ret = ops->vidioc_enum_fmt_vid_out(file, state, arg);
>>  		break;
>>  	case V4L2_BUF_TYPE_SDR_CAPTURE:
>>  		if (unlikely(!ops->vidioc_enum_fmt_sdr_cap))
>>  			break;
>> -		ret = ops->vidioc_enum_fmt_sdr_cap(file, NULL, arg);
>> +		ret = ops->vidioc_enum_fmt_sdr_cap(file, state, arg);
>>  		break;
>>  	case V4L2_BUF_TYPE_SDR_OUTPUT:
>>  		if (unlikely(!ops->vidioc_enum_fmt_sdr_out))
>>  			break;
>> -		ret = ops->vidioc_enum_fmt_sdr_out(file, NULL, arg);
>> +		ret = ops->vidioc_enum_fmt_sdr_out(file, state, arg);
>>  		break;
>>  	case V4L2_BUF_TYPE_META_CAPTURE:
>>  		if (unlikely(!ops->vidioc_enum_fmt_meta_cap))
>>  			break;
>> -		ret = ops->vidioc_enum_fmt_meta_cap(file, NULL, arg);
>> +		ret = ops->vidioc_enum_fmt_meta_cap(file, state, arg);
>>  		break;
>>  	case V4L2_BUF_TYPE_META_OUTPUT:
>>  		if (unlikely(!ops->vidioc_enum_fmt_meta_out))
>>  			break;
>> -		ret = ops->vidioc_enum_fmt_meta_out(file, NULL, arg);
>> +		ret = ops->vidioc_enum_fmt_meta_out(file, state, arg);
>>  		break;
>>  	}
>>  	if (ret == 0)
>> @@ -1679,7 +1679,7 @@ static void v4l_pix_format_touch(struct v4l2_pix_format *p)
>>  }
>>  
>>  static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		     void *arg)
>> +		     struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_format *p = arg;
>>  	struct video_device *vfd = video_devdata(file);
>> @@ -1695,50 +1695,50 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		if (unlikely(!ops->vidioc_g_fmt_vid_cap))
>>  			break;
>>  		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> -		ret = ops->vidioc_g_fmt_vid_cap(file, NULL, arg);
>> +		ret = ops->vidioc_g_fmt_vid_cap(file, state, arg);
>>  		/* just in case the driver zeroed it again */
>>  		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>>  		if (vfd->vfl_type == VFL_TYPE_TOUCH)
>>  			v4l_pix_format_touch(&p->fmt.pix);
>>  		return ret;
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -		return ops->vidioc_g_fmt_vid_cap_mplane(file, NULL, arg);
>> +		return ops->vidioc_g_fmt_vid_cap_mplane(file, state, arg);
>>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>> -		return ops->vidioc_g_fmt_vid_overlay(file, NULL, arg);
>> +		return ops->vidioc_g_fmt_vid_overlay(file, state, arg);
>>  	case V4L2_BUF_TYPE_VBI_CAPTURE:
>> -		return ops->vidioc_g_fmt_vbi_cap(file, NULL, arg);
>> +		return ops->vidioc_g_fmt_vbi_cap(file, state, arg);
>>  	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
>> -		return ops->vidioc_g_fmt_sliced_vbi_cap(file, NULL, arg);
>> +		return ops->vidioc_g_fmt_sliced_vbi_cap(file, state, arg);
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>>  		if (unlikely(!ops->vidioc_g_fmt_vid_out))
>>  			break;
>>  		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> -		ret = ops->vidioc_g_fmt_vid_out(file, NULL, arg);
>> +		ret = ops->vidioc_g_fmt_vid_out(file, state, arg);
>>  		/* just in case the driver zeroed it again */
>>  		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>>  		return ret;
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> -		return ops->vidioc_g_fmt_vid_out_mplane(file, NULL, arg);
>> +		return ops->vidioc_g_fmt_vid_out_mplane(file, state, arg);
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>> -		return ops->vidioc_g_fmt_vid_out_overlay(file, NULL, arg);
>> +		return ops->vidioc_g_fmt_vid_out_overlay(file, state, arg);
>>  	case V4L2_BUF_TYPE_VBI_OUTPUT:
>> -		return ops->vidioc_g_fmt_vbi_out(file, NULL, arg);
>> +		return ops->vidioc_g_fmt_vbi_out(file, state, arg);
>>  	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
>> -		return ops->vidioc_g_fmt_sliced_vbi_out(file, NULL, arg);
>> +		return ops->vidioc_g_fmt_sliced_vbi_out(file, state, arg);
>>  	case V4L2_BUF_TYPE_SDR_CAPTURE:
>> -		return ops->vidioc_g_fmt_sdr_cap(file, NULL, arg);
>> +		return ops->vidioc_g_fmt_sdr_cap(file, state, arg);
>>  	case V4L2_BUF_TYPE_SDR_OUTPUT:
>> -		return ops->vidioc_g_fmt_sdr_out(file, NULL, arg);
>> +		return ops->vidioc_g_fmt_sdr_out(file, state, arg);
>>  	case V4L2_BUF_TYPE_META_CAPTURE:
>> -		return ops->vidioc_g_fmt_meta_cap(file, NULL, arg);
>> +		return ops->vidioc_g_fmt_meta_cap(file, state, arg);
>>  	case V4L2_BUF_TYPE_META_OUTPUT:
>> -		return ops->vidioc_g_fmt_meta_out(file, NULL, arg);
>> +		return ops->vidioc_g_fmt_meta_out(file, state, arg);
>>  	}
>>  	return -EINVAL;
>>  }
>>  
>>  static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		     void *arg)
>> +		     struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_format *p = arg;
>>  	struct video_device *vfd = video_devdata(file);
>> @@ -1758,7 +1758,7 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		if (unlikely(!ops->vidioc_s_fmt_vid_cap))
>>  			break;
>>  		memset_after(p, 0, fmt.pix);
>> -		ret = ops->vidioc_s_fmt_vid_cap(file, NULL, arg);
>> +		ret = ops->vidioc_s_fmt_vid_cap(file, state, arg);
>>  		/* just in case the driver zeroed it again */
>>  		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>>  		if (vfd->vfl_type == VFL_TYPE_TOUCH)
>> @@ -1771,7 +1771,7 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>>  			memset_after(&p->fmt.pix_mp.plane_fmt[i],
>>  				     0, bytesperline);
>> -		return ops->vidioc_s_fmt_vid_cap_mplane(file, NULL, arg);
>> +		return ops->vidioc_s_fmt_vid_cap_mplane(file, state, arg);
>>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>>  		if (unlikely(!ops->vidioc_s_fmt_vid_overlay))
>>  			break;
>> @@ -1779,22 +1779,22 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		p->fmt.win.clips = NULL;
>>  		p->fmt.win.clipcount = 0;
>>  		p->fmt.win.bitmap = NULL;
>> -		return ops->vidioc_s_fmt_vid_overlay(file, NULL, arg);
>> +		return ops->vidioc_s_fmt_vid_overlay(file, state, arg);
>>  	case V4L2_BUF_TYPE_VBI_CAPTURE:
>>  		if (unlikely(!ops->vidioc_s_fmt_vbi_cap))
>>  			break;
>>  		memset_after(p, 0, fmt.vbi.flags);
>> -		return ops->vidioc_s_fmt_vbi_cap(file, NULL, arg);
>> +		return ops->vidioc_s_fmt_vbi_cap(file, state, arg);
>>  	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
>>  		if (unlikely(!ops->vidioc_s_fmt_sliced_vbi_cap))
>>  			break;
>>  		memset_after(p, 0, fmt.sliced.io_size);
>> -		return ops->vidioc_s_fmt_sliced_vbi_cap(file, NULL, arg);
>> +		return ops->vidioc_s_fmt_sliced_vbi_cap(file, state, arg);
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>>  		if (unlikely(!ops->vidioc_s_fmt_vid_out))
>>  			break;
>>  		memset_after(p, 0, fmt.pix);
>> -		ret = ops->vidioc_s_fmt_vid_out(file, NULL, arg);
>> +		ret = ops->vidioc_s_fmt_vid_out(file, state, arg);
>>  		/* just in case the driver zeroed it again */
>>  		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>>  		return ret;
>> @@ -1805,7 +1805,7 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>>  			memset_after(&p->fmt.pix_mp.plane_fmt[i],
>>  				     0, bytesperline);
>> -		return ops->vidioc_s_fmt_vid_out_mplane(file, NULL, arg);
>> +		return ops->vidioc_s_fmt_vid_out_mplane(file, state, arg);
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>>  		if (unlikely(!ops->vidioc_s_fmt_vid_out_overlay))
>>  			break;
>> @@ -1813,43 +1813,43 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		p->fmt.win.clips = NULL;
>>  		p->fmt.win.clipcount = 0;
>>  		p->fmt.win.bitmap = NULL;
>> -		return ops->vidioc_s_fmt_vid_out_overlay(file, NULL, arg);
>> +		return ops->vidioc_s_fmt_vid_out_overlay(file, state, arg);
>>  	case V4L2_BUF_TYPE_VBI_OUTPUT:
>>  		if (unlikely(!ops->vidioc_s_fmt_vbi_out))
>>  			break;
>>  		memset_after(p, 0, fmt.vbi.flags);
>> -		return ops->vidioc_s_fmt_vbi_out(file, NULL, arg);
>> +		return ops->vidioc_s_fmt_vbi_out(file, state, arg);
>>  	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
>>  		if (unlikely(!ops->vidioc_s_fmt_sliced_vbi_out))
>>  			break;
>>  		memset_after(p, 0, fmt.sliced.io_size);
>> -		return ops->vidioc_s_fmt_sliced_vbi_out(file, NULL, arg);
>> +		return ops->vidioc_s_fmt_sliced_vbi_out(file, state, arg);
>>  	case V4L2_BUF_TYPE_SDR_CAPTURE:
>>  		if (unlikely(!ops->vidioc_s_fmt_sdr_cap))
>>  			break;
>>  		memset_after(p, 0, fmt.sdr.buffersize);
>> -		return ops->vidioc_s_fmt_sdr_cap(file, NULL, arg);
>> +		return ops->vidioc_s_fmt_sdr_cap(file, state, arg);
>>  	case V4L2_BUF_TYPE_SDR_OUTPUT:
>>  		if (unlikely(!ops->vidioc_s_fmt_sdr_out))
>>  			break;
>>  		memset_after(p, 0, fmt.sdr.buffersize);
>> -		return ops->vidioc_s_fmt_sdr_out(file, NULL, arg);
>> +		return ops->vidioc_s_fmt_sdr_out(file, state, arg);
>>  	case V4L2_BUF_TYPE_META_CAPTURE:
>>  		if (unlikely(!ops->vidioc_s_fmt_meta_cap))
>>  			break;
>>  		memset_after(p, 0, fmt.meta);
>> -		return ops->vidioc_s_fmt_meta_cap(file, NULL, arg);
>> +		return ops->vidioc_s_fmt_meta_cap(file, state, arg);
>>  	case V4L2_BUF_TYPE_META_OUTPUT:
>>  		if (unlikely(!ops->vidioc_s_fmt_meta_out))
>>  			break;
>>  		memset_after(p, 0, fmt.meta);
>> -		return ops->vidioc_s_fmt_meta_out(file, NULL, arg);
>> +		return ops->vidioc_s_fmt_meta_out(file, state, arg);
>>  	}
>>  	return -EINVAL;
>>  }
>>  
>>  static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		       void *arg)
>> +		       struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_format *p = arg;
>>  	struct video_device *vfd = video_devdata(file);
>> @@ -1866,7 +1866,7 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		if (unlikely(!ops->vidioc_try_fmt_vid_cap))
>>  			break;
>>  		memset_after(p, 0, fmt.pix);
>> -		ret = ops->vidioc_try_fmt_vid_cap(file, NULL, arg);
>> +		ret = ops->vidioc_try_fmt_vid_cap(file, state, arg);
>>  		/* just in case the driver zeroed it again */
>>  		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>>  		if (vfd->vfl_type == VFL_TYPE_TOUCH)
>> @@ -1879,7 +1879,7 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>>  			memset_after(&p->fmt.pix_mp.plane_fmt[i],
>>  				     0, bytesperline);
>> -		return ops->vidioc_try_fmt_vid_cap_mplane(file, NULL, arg);
>> +		return ops->vidioc_try_fmt_vid_cap_mplane(file, state, arg);
>>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>>  		if (unlikely(!ops->vidioc_try_fmt_vid_overlay))
>>  			break;
>> @@ -1887,22 +1887,22 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		p->fmt.win.clips = NULL;
>>  		p->fmt.win.clipcount = 0;
>>  		p->fmt.win.bitmap = NULL;
>> -		return ops->vidioc_try_fmt_vid_overlay(file, NULL, arg);
>> +		return ops->vidioc_try_fmt_vid_overlay(file, state, arg);
>>  	case V4L2_BUF_TYPE_VBI_CAPTURE:
>>  		if (unlikely(!ops->vidioc_try_fmt_vbi_cap))
>>  			break;
>>  		memset_after(p, 0, fmt.vbi.flags);
>> -		return ops->vidioc_try_fmt_vbi_cap(file, NULL, arg);
>> +		return ops->vidioc_try_fmt_vbi_cap(file, state, arg);
>>  	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
>>  		if (unlikely(!ops->vidioc_try_fmt_sliced_vbi_cap))
>>  			break;
>>  		memset_after(p, 0, fmt.sliced.io_size);
>> -		return ops->vidioc_try_fmt_sliced_vbi_cap(file, NULL, arg);
>> +		return ops->vidioc_try_fmt_sliced_vbi_cap(file, state, arg);
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>>  		if (unlikely(!ops->vidioc_try_fmt_vid_out))
>>  			break;
>>  		memset_after(p, 0, fmt.pix);
>> -		ret = ops->vidioc_try_fmt_vid_out(file, NULL, arg);
>> +		ret = ops->vidioc_try_fmt_vid_out(file, state, arg);
>>  		/* just in case the driver zeroed it again */
>>  		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>>  		return ret;
>> @@ -1913,7 +1913,7 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>>  			memset_after(&p->fmt.pix_mp.plane_fmt[i],
>>  				     0, bytesperline);
>> -		return ops->vidioc_try_fmt_vid_out_mplane(file, NULL, arg);
>> +		return ops->vidioc_try_fmt_vid_out_mplane(file, state, arg);
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>>  		if (unlikely(!ops->vidioc_try_fmt_vid_out_overlay))
>>  			break;
>> @@ -1921,55 +1921,55 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		p->fmt.win.clips = NULL;
>>  		p->fmt.win.clipcount = 0;
>>  		p->fmt.win.bitmap = NULL;
>> -		return ops->vidioc_try_fmt_vid_out_overlay(file, NULL, arg);
>> +		return ops->vidioc_try_fmt_vid_out_overlay(file, state, arg);
>>  	case V4L2_BUF_TYPE_VBI_OUTPUT:
>>  		if (unlikely(!ops->vidioc_try_fmt_vbi_out))
>>  			break;
>>  		memset_after(p, 0, fmt.vbi.flags);
>> -		return ops->vidioc_try_fmt_vbi_out(file, NULL, arg);
>> +		return ops->vidioc_try_fmt_vbi_out(file, state, arg);
>>  	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
>>  		if (unlikely(!ops->vidioc_try_fmt_sliced_vbi_out))
>>  			break;
>>  		memset_after(p, 0, fmt.sliced.io_size);
>> -		return ops->vidioc_try_fmt_sliced_vbi_out(file, NULL, arg);
>> +		return ops->vidioc_try_fmt_sliced_vbi_out(file, state, arg);
>>  	case V4L2_BUF_TYPE_SDR_CAPTURE:
>>  		if (unlikely(!ops->vidioc_try_fmt_sdr_cap))
>>  			break;
>>  		memset_after(p, 0, fmt.sdr.buffersize);
>> -		return ops->vidioc_try_fmt_sdr_cap(file, NULL, arg);
>> +		return ops->vidioc_try_fmt_sdr_cap(file, state, arg);
>>  	case V4L2_BUF_TYPE_SDR_OUTPUT:
>>  		if (unlikely(!ops->vidioc_try_fmt_sdr_out))
>>  			break;
>>  		memset_after(p, 0, fmt.sdr.buffersize);
>> -		return ops->vidioc_try_fmt_sdr_out(file, NULL, arg);
>> +		return ops->vidioc_try_fmt_sdr_out(file, state, arg);
>>  	case V4L2_BUF_TYPE_META_CAPTURE:
>>  		if (unlikely(!ops->vidioc_try_fmt_meta_cap))
>>  			break;
>>  		memset_after(p, 0, fmt.meta);
>> -		return ops->vidioc_try_fmt_meta_cap(file, NULL, arg);
>> +		return ops->vidioc_try_fmt_meta_cap(file, state, arg);
>>  	case V4L2_BUF_TYPE_META_OUTPUT:
>>  		if (unlikely(!ops->vidioc_try_fmt_meta_out))
>>  			break;
>>  		memset_after(p, 0, fmt.meta);
>> -		return ops->vidioc_try_fmt_meta_out(file, NULL, arg);
>> +		return ops->vidioc_try_fmt_meta_out(file, state, arg);
>>  	}
>>  	return -EINVAL;
>>  }
>>  
>>  static int v4l_streamon(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			void *arg)
>> +			struct video_device_state *state, void *arg)
>>  {
>> -	return ops->vidioc_streamon(file, NULL, *(unsigned int *)arg);
>> +	return ops->vidioc_streamon(file, state, *(unsigned int *)arg);
>>  }
>>  
>>  static int v4l_streamoff(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			 void *arg)
>> +			 struct video_device_state *state, void *arg)
>>  {
>> -	return ops->vidioc_streamoff(file, NULL, *(unsigned int *)arg);
>> +	return ops->vidioc_streamoff(file, state, *(unsigned int *)arg);
>>  }
>>  
>>  static int v4l_g_tuner(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		       void *arg)
>> +		       struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_tuner *p = arg;
>> @@ -1977,14 +1977,14 @@ static int v4l_g_tuner(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  
>>  	p->type = (vfd->vfl_type == VFL_TYPE_RADIO) ?
>>  			V4L2_TUNER_RADIO : V4L2_TUNER_ANALOG_TV;
>> -	err = ops->vidioc_g_tuner(file, NULL, p);
>> +	err = ops->vidioc_g_tuner(file, state, p);
>>  	if (!err)
>>  		p->capability |= V4L2_TUNER_CAP_FREQ_BANDS;
>>  	return err;
>>  }
>>  
>>  static int v4l_s_tuner(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		       void *arg)
>> +		       struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_tuner *p = arg;
>> @@ -1995,11 +1995,11 @@ static int v4l_s_tuner(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		return ret;
>>  	p->type = (vfd->vfl_type == VFL_TYPE_RADIO) ?
>>  			V4L2_TUNER_RADIO : V4L2_TUNER_ANALOG_TV;
>> -	return ops->vidioc_s_tuner(file, NULL, p);
>> +	return ops->vidioc_s_tuner(file, state, p);
>>  }
>>  
>> -static int v4l_g_modulator(const struct v4l2_ioctl_ops *ops,
>> -			   struct file *file, void *arg)
>> +static int v4l_g_modulator(const struct v4l2_ioctl_ops *ops, struct file *file,
>> +			   struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_modulator *p = arg;
>> @@ -2008,14 +2008,14 @@ static int v4l_g_modulator(const struct v4l2_ioctl_ops *ops,
>>  	if (vfd->vfl_type == VFL_TYPE_RADIO)
>>  		p->type = V4L2_TUNER_RADIO;
>>  
>> -	err = ops->vidioc_g_modulator(file, NULL, p);
>> +	err = ops->vidioc_g_modulator(file, state, p);
>>  	if (!err)
>>  		p->capability |= V4L2_TUNER_CAP_FREQ_BANDS;
>>  	return err;
>>  }
>>  
>> -static int v4l_s_modulator(const struct v4l2_ioctl_ops *ops,
>> -			   struct file *file, void *arg)
>> +static int v4l_s_modulator(const struct v4l2_ioctl_ops *ops, struct file *file,
>> +			   struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_modulator *p = arg;
>> @@ -2023,11 +2023,11 @@ static int v4l_s_modulator(const struct v4l2_ioctl_ops *ops,
>>  	if (vfd->vfl_type == VFL_TYPE_RADIO)
>>  		p->type = V4L2_TUNER_RADIO;
>>  
>> -	return ops->vidioc_s_modulator(file, NULL, p);
>> +	return ops->vidioc_s_modulator(file, state, p);
>>  }
>>  
>> -static int v4l_g_frequency(const struct v4l2_ioctl_ops *ops,
>> -			   struct file *file, void *arg)
>> +static int v4l_g_frequency(const struct v4l2_ioctl_ops *ops, struct file *file,
>> +			   struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_frequency *p = arg;
>> @@ -2037,11 +2037,11 @@ static int v4l_g_frequency(const struct v4l2_ioctl_ops *ops,
>>  	else
>>  		p->type = (vfd->vfl_type == VFL_TYPE_RADIO) ?
>>  				V4L2_TUNER_RADIO : V4L2_TUNER_ANALOG_TV;
>> -	return ops->vidioc_g_frequency(file, NULL, p);
>> +	return ops->vidioc_g_frequency(file, state, p);
>>  }
>>  
>> -static int v4l_s_frequency(const struct v4l2_ioctl_ops *ops,
>> -			   struct file *file, void *arg)
>> +static int v4l_s_frequency(const struct v4l2_ioctl_ops *ops, struct file *file,
>> +			   struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	const struct v4l2_frequency *p = arg;
>> @@ -2060,11 +2060,11 @@ static int v4l_s_frequency(const struct v4l2_ioctl_ops *ops,
>>  		if (type != p->type)
>>  			return -EINVAL;
>>  	}
>> -	return ops->vidioc_s_frequency(file, NULL, p);
>> +	return ops->vidioc_s_frequency(file, state, p);
>>  }
>>  
>>  static int v4l_enumstd(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		       void *arg)
>> +		       struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_standard *p = arg;
>> @@ -2073,7 +2073,7 @@ static int v4l_enumstd(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  }
>>  
>>  static int v4l_s_std(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		     void *arg)
>> +		     struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	v4l2_std_id id = *(v4l2_std_id *)arg, norm;
>> @@ -2087,11 +2087,11 @@ static int v4l_s_std(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		return -EINVAL;
>>  
>>  	/* Calls the specific handler */
>> -	return ops->vidioc_s_std(file, NULL, norm);
>> +	return ops->vidioc_s_std(file, state, norm);
>>  }
>>  
>>  static int v4l_querystd(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			void *arg)
>> +			struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	v4l2_std_id *p = arg;
>> @@ -2109,11 +2109,12 @@ static int v4l_querystd(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  	 * their efforts to improve the standards detection.
>>  	 */
>>  	*p = vfd->tvnorms;
>> -	return ops->vidioc_querystd(file, NULL, arg);
>> +	return ops->vidioc_querystd(file, state, arg);
>>  }
>>  
>>  static int v4l_s_hw_freq_seek(const struct v4l2_ioctl_ops *ops,
>> -			      struct file *file, void *arg)
>> +			      struct file *file,
>> +			      struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_hw_freq_seek *p = arg;
>> @@ -2131,26 +2132,26 @@ static int v4l_s_hw_freq_seek(const struct v4l2_ioctl_ops *ops,
>>  		V4L2_TUNER_RADIO : V4L2_TUNER_ANALOG_TV;
>>  	if (p->type != type)
>>  		return -EINVAL;
>> -	return ops->vidioc_s_hw_freq_seek(file, NULL, p);
>> +	return ops->vidioc_s_hw_freq_seek(file, state, p);
>>  }
>>  
>>  static int v4l_s_fbuf(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		      void *arg)
>> +		      struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_framebuffer *p = arg;
>>  
>>  	p->base = NULL;
>> -	return ops->vidioc_s_fbuf(file, NULL, p);
>> +	return ops->vidioc_s_fbuf(file, state, p);
>>  }
>>  
>>  static int v4l_overlay(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		       void *arg)
>> +		       struct video_device_state *state, void *arg)
>>  {
>> -	return ops->vidioc_overlay(file, NULL, *(unsigned int *)arg);
>> +	return ops->vidioc_overlay(file, state, *(unsigned int *)arg);
>>  }
>>  
>>  static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		       void *arg)
>> +		       struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_requestbuffers *p = arg;
>> @@ -2165,38 +2166,38 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  	if (is_valid_ioctl(vfd, VIDIOC_REMOVE_BUFS))
>>  		p->capabilities = V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS;
>>  
>> -	return ops->vidioc_reqbufs(file, NULL, p);
>> +	return ops->vidioc_reqbufs(file, state, p);
>>  }
>>  
>>  static int v4l_querybuf(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			void *arg)
>> +			struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_buffer *p = arg;
>>  	int ret = check_fmt(file, p->type);
>>  
>> -	return ret ? ret : ops->vidioc_querybuf(file, NULL, p);
>> +	return ret ? ret : ops->vidioc_querybuf(file, state, p);
>>  }
>>  
>>  static int v4l_qbuf(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		    void *arg)
>> +		    struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_buffer *p = arg;
>>  	int ret = check_fmt(file, p->type);
>>  
>> -	return ret ? ret : ops->vidioc_qbuf(file, NULL, p);
>> +	return ret ? ret : ops->vidioc_qbuf(file, state, p);
>>  }
>>  
>>  static int v4l_dqbuf(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		     void *arg)
>> +		     struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_buffer *p = arg;
>>  	int ret = check_fmt(file, p->type);
>>  
>> -	return ret ? ret : ops->vidioc_dqbuf(file, NULL, p);
>> +	return ret ? ret : ops->vidioc_dqbuf(file, state, p);
>>  }
>>  
>> -static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>> -			   struct file *file, void *arg)
>> +static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops, struct file *file,
>> +			   struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_create_buffers *create = arg;
>> @@ -2213,7 +2214,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>>  	if (is_valid_ioctl(vfd, VIDIOC_REMOVE_BUFS))
>>  		create->capabilities = V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS;
>>  
>> -	ret = ops->vidioc_create_bufs(file, NULL, create);
>> +	ret = ops->vidioc_create_bufs(file, state, create);
>>  
>>  	if (create->format.type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
>>  	    create->format.type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>> @@ -2222,28 +2223,28 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>>  	return ret;
>>  }
>>  
>> -static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops,
>> -			   struct file *file, void *arg)
>> +static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops, struct file *file,
>> +			   struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_buffer *b = arg;
>>  	int ret = check_fmt(file, b->type);
>>  
>> -	return ret ? ret : ops->vidioc_prepare_buf(file, NULL, b);
>> +	return ret ? ret : ops->vidioc_prepare_buf(file, state, b);
>>  }
>>  
>> -static int v4l_remove_bufs(const struct v4l2_ioctl_ops *ops,
>> -			   struct file *file, void *arg)
>> +static int v4l_remove_bufs(const struct v4l2_ioctl_ops *ops, struct file *file,
>> +			   struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_remove_buffers *remove = arg;
>>  
>>  	if (ops->vidioc_remove_bufs)
>> -		return ops->vidioc_remove_bufs(file, NULL, remove);
>> +		return ops->vidioc_remove_bufs(file, state, remove);
>>  
>>  	return -ENOTTY;
>>  }
>>  
>>  static int v4l_g_parm(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		      void *arg)
>> +		      struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_streamparm *p = arg;
>> @@ -2253,20 +2254,20 @@ static int v4l_g_parm(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  	if (ret)
>>  		return ret;
>>  	if (ops->vidioc_g_parm)
>> -		return ops->vidioc_g_parm(file, NULL, p);
>> +		return ops->vidioc_g_parm(file, state, p);
>>  	if (p->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
>>  	    p->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>>  		return -EINVAL;
>>  	if (vfd->device_caps & V4L2_CAP_READWRITE)
>>  		p->parm.capture.readbuffers = 2;
>> -	ret = ops->vidioc_g_std(file, NULL, &std);
>> +	ret = ops->vidioc_g_std(file, state, &std);
>>  	if (ret == 0)
>>  		v4l2_video_std_frame_period(std, &p->parm.capture.timeperframe);
>>  	return ret;
>>  }
>>  
>>  static int v4l_s_parm(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		      void *arg)
>> +		      struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_streamparm *p = arg;
>>  	int ret = check_fmt(file, p->type);
>> @@ -2286,11 +2287,11 @@ static int v4l_s_parm(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		p->parm.capture.extendedmode = 0;
>>  		p->parm.capture.capturemode &= V4L2_MODE_HIGHQUALITY;
>>  	}
>> -	return ops->vidioc_s_parm(file, NULL, p);
>> +	return ops->vidioc_s_parm(file, state, p);
>>  }
>>  
>>  static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			 void *arg)
>> +			 struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_query_ext_ctrl qec = {};
>> @@ -2307,7 +2308,7 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  
>>  	/* Simulate query_ext_ctr using query_ctrl. */
>>  	qec.id = p->id;
>> -	ret = ops->vidioc_query_ext_ctrl(file, NULL, &qec);
>> +	ret = ops->vidioc_query_ext_ctrl(file, state, &qec);
>>  	if (ret)
>>  		return ret;
>>  	v4l2_query_ext_ctrl_to_v4l2_queryctrl(p, &qec);
>> @@ -2315,7 +2316,8 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  }
>>  
>>  static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
>> -			      struct file *file, void *arg)
>> +			      struct file *file,
>> +			      struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_query_ext_ctrl *p = arg;
>> @@ -2326,12 +2328,12 @@ static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
>>  	if (vfd->ctrl_handler)
>>  		return v4l2_query_ext_ctrl(vfd->ctrl_handler, p);
>>  	if (ops->vidioc_query_ext_ctrl)
>> -		return ops->vidioc_query_ext_ctrl(file, NULL, p);
>> +		return ops->vidioc_query_ext_ctrl(file, state, p);
>>  	return -ENOTTY;
>>  }
>>  
>>  static int v4l_querymenu(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			 void *arg)
>> +			 struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_querymenu *p = arg;
>> @@ -2342,12 +2344,12 @@ static int v4l_querymenu(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  	if (vfd->ctrl_handler)
>>  		return v4l2_querymenu(vfd->ctrl_handler, p);
>>  	if (ops->vidioc_querymenu)
>> -		return ops->vidioc_querymenu(file, NULL, p);
>> +		return ops->vidioc_querymenu(file, state, p);
>>  	return -ENOTTY;
>>  }
>>  
>>  static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		      void *arg)
>> +		      struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_control *p = arg;
>> @@ -2368,7 +2370,7 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  	ctrl.id = p->id;
>>  	ctrl.value = p->value;
>>  	if (check_ext_ctrls(&ctrls, VIDIOC_G_CTRL)) {
>> -		int ret = ops->vidioc_g_ext_ctrls(file, NULL, &ctrls);
>> +		int ret = ops->vidioc_g_ext_ctrls(file, state, &ctrls);
>>  
>>  		if (ret == 0)
>>  			p->value = ctrl.value;
>> @@ -2378,7 +2380,7 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  }
>>  
>>  static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		      void *arg)
>> +		      struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_control *p = arg;
>> @@ -2401,13 +2403,13 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  	ctrl.value = p->value;
>>  	if (!check_ext_ctrls(&ctrls, VIDIOC_S_CTRL))
>>  		return -EINVAL;
>> -	ret = ops->vidioc_s_ext_ctrls(file, NULL, &ctrls);
>> +	ret = ops->vidioc_s_ext_ctrls(file, state, &ctrls);
>>  	p->value = ctrl.value;
>>  	return ret;
>>  }
>>  
>> -static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>> -			   struct file *file, void *arg)
>> +static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops, struct file *file,
>> +			   struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_ext_controls *p = arg;
>> @@ -2423,11 +2425,11 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>>  	if (ops->vidioc_g_ext_ctrls == NULL)
>>  		return -ENOTTY;
>>  	return check_ext_ctrls(p, VIDIOC_G_EXT_CTRLS) ?
>> -				ops->vidioc_g_ext_ctrls(file, NULL, p) : -EINVAL;
>> +				ops->vidioc_g_ext_ctrls(file, state, p) : -EINVAL;
>>  }
>>  
>> -static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>> -			   struct file *file, void *arg)
>> +static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops, struct file *file,
>> +			   struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_ext_controls *p = arg;
>> @@ -2443,11 +2445,12 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>>  	if (ops->vidioc_s_ext_ctrls == NULL)
>>  		return -ENOTTY;
>>  	return check_ext_ctrls(p, VIDIOC_S_EXT_CTRLS) ?
>> -				ops->vidioc_s_ext_ctrls(file, NULL, p) : -EINVAL;
>> +				ops->vidioc_s_ext_ctrls(file, state, p) : -EINVAL;
>>  }
>>  
>>  static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>> -			     struct file *file, void *arg)
>> +			     struct file *file,
>> +			     struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_ext_controls *p = arg;
>> @@ -2463,7 +2466,7 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>>  	if (ops->vidioc_try_ext_ctrls == NULL)
>>  		return -ENOTTY;
>>  	return check_ext_ctrls(p, VIDIOC_TRY_EXT_CTRLS) ?
>> -			ops->vidioc_try_ext_ctrls(file, NULL, p) : -EINVAL;
>> +			ops->vidioc_try_ext_ctrls(file, state, p) : -EINVAL;
>>  }
>>  
>>  /*
>> @@ -2475,8 +2478,8 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>>   * restore it afterwards. This way applications can use either buffer
>>   * type and drivers don't need to check for both.
>>   */
>> -static int v4l_g_selection(const struct v4l2_ioctl_ops *ops,
>> -			   struct file *file, void *arg)
>> +static int v4l_g_selection(const struct v4l2_ioctl_ops *ops, struct file *file,
>> +			   struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_selection *p = arg;
>>  	u32 old_type = p->type;
>> @@ -2486,13 +2489,13 @@ static int v4l_g_selection(const struct v4l2_ioctl_ops *ops,
>>  		p->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>>  	else if (p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>>  		p->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>> -	ret = ops->vidioc_g_selection(file, NULL, p);
>> +	ret = ops->vidioc_g_selection(file, state, p);
>>  	p->type = old_type;
>>  	return ret;
>>  }
>>  
>> -static int v4l_s_selection(const struct v4l2_ioctl_ops *ops,
>> -			   struct file *file, void *arg)
>> +static int v4l_s_selection(const struct v4l2_ioctl_ops *ops, struct file *file,
>> +			   struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_selection *p = arg;
>>  	u32 old_type = p->type;
>> @@ -2502,13 +2505,13 @@ static int v4l_s_selection(const struct v4l2_ioctl_ops *ops,
>>  		p->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>>  	else if (p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>>  		p->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>> -	ret = ops->vidioc_s_selection(file, NULL, p);
>> +	ret = ops->vidioc_s_selection(file, state, p);
>>  	p->type = old_type;
>>  	return ret;
>>  }
>>  
>>  static int v4l_g_crop(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		      void *arg)
>> +		      struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_crop *p = arg;
>> @@ -2529,7 +2532,7 @@ static int v4l_g_crop(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		s.target = s.target == V4L2_SEL_TGT_COMPOSE ?
>>  			V4L2_SEL_TGT_CROP : V4L2_SEL_TGT_COMPOSE;
>>  
>> -	ret = v4l_g_selection(ops, file, &s);
>> +	ret = v4l_g_selection(ops, file, state, &s);
>>  
>>  	/* copying results to old structure on success */
>>  	if (!ret)
>> @@ -2538,7 +2541,7 @@ static int v4l_g_crop(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  }
>>  
>>  static int v4l_s_crop(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		      void *arg)
>> +		      struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_crop *p = arg;
>> @@ -2559,11 +2562,11 @@ static int v4l_s_crop(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		s.target = s.target == V4L2_SEL_TGT_COMPOSE ?
>>  			V4L2_SEL_TGT_CROP : V4L2_SEL_TGT_COMPOSE;
>>  
>> -	return v4l_s_selection(ops, file, &s);
>> +	return v4l_s_selection(ops, file, state, &s);
>>  }
>>  
>>  static int v4l_cropcap(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		       void *arg)
>> +		       struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_cropcap *p = arg;
>> @@ -2587,7 +2590,7 @@ static int v4l_cropcap(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		return -ENOTTY;
>>  
>>  	if (ops->vidioc_g_pixelaspect)
>> -		ret = ops->vidioc_g_pixelaspect(file, NULL, s.type,
>> +		ret = ops->vidioc_g_pixelaspect(file, state, s.type,
>>  						&p->pixelaspect);
>>  
>>  	/*
>> @@ -2609,7 +2612,7 @@ static int v4l_cropcap(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  		s.target = s.target == V4L2_SEL_TGT_COMPOSE_BOUNDS ?
>>  			V4L2_SEL_TGT_CROP_BOUNDS : V4L2_SEL_TGT_COMPOSE_BOUNDS;
>>  
>> -	ret = v4l_g_selection(ops, file, &s);
>> +	ret = v4l_g_selection(ops, file, state, &s);
>>  	if (ret)
>>  		return ret;
>>  	p->bounds = s.r;
>> @@ -2620,7 +2623,7 @@ static int v4l_cropcap(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  	else
>>  		s.target = V4L2_SEL_TGT_CROP_DEFAULT;
>>  
>> -	ret = v4l_g_selection(ops, file, &s);
>> +	ret = v4l_g_selection(ops, file, state, &s);
>>  	if (ret)
>>  		return ret;
>>  	p->defrect = s.r;
>> @@ -2629,7 +2632,7 @@ static int v4l_cropcap(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  }
>>  
>>  static int v4l_log_status(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -			  void *arg)
>> +			  struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	int ret;
>> @@ -2637,7 +2640,7 @@ static int v4l_log_status(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  	if (vfd->v4l2_dev)
>>  		pr_info("%s: =================  START STATUS  =================\n",
>>  			vfd->v4l2_dev->name);
>> -	ret = ops->vidioc_log_status(file, NULL);
>> +	ret = ops->vidioc_log_status(file, state);
>>  	if (vfd->v4l2_dev)
>>  		pr_info("%s: ==================  END STATUS  ==================\n",
>>  			vfd->v4l2_dev->name);
>> @@ -2645,7 +2648,8 @@ static int v4l_log_status(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  }
>>  
>>  static int v4l_dbg_g_register(const struct v4l2_ioctl_ops *ops,
>> -			      struct file *file, void *arg)
>> +			      struct file *file,
>> +			      struct video_device_state *state, void *arg)
>>  {
>>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>>  	struct v4l2_dbg_register *p = arg;
>> @@ -2665,7 +2669,7 @@ static int v4l_dbg_g_register(const struct v4l2_ioctl_ops *ops,
>>  	}
>>  	if (ops->vidioc_g_register && p->match.type == V4L2_CHIP_MATCH_BRIDGE &&
>>  	    (ops->vidioc_g_chip_info || p->match.addr == 0))
>> -		return ops->vidioc_g_register(file, NULL, p);
>> +		return ops->vidioc_g_register(file, state, p);
>>  	return -EINVAL;
>>  #else
>>  	return -ENOTTY;
>> @@ -2673,7 +2677,8 @@ static int v4l_dbg_g_register(const struct v4l2_ioctl_ops *ops,
>>  }
>>  
>>  static int v4l_dbg_s_register(const struct v4l2_ioctl_ops *ops,
>> -			      struct file *file, void *arg)
>> +			      struct file *file,
>> +			      struct video_device_state *state, void *arg)
>>  {
>>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>>  	const struct v4l2_dbg_register *p = arg;
>> @@ -2693,7 +2698,7 @@ static int v4l_dbg_s_register(const struct v4l2_ioctl_ops *ops,
>>  	}
>>  	if (ops->vidioc_s_register && p->match.type == V4L2_CHIP_MATCH_BRIDGE &&
>>  	    (ops->vidioc_g_chip_info || p->match.addr == 0))
>> -		return ops->vidioc_s_register(file, NULL, p);
>> +		return ops->vidioc_s_register(file, state, p);
>>  	return -EINVAL;
>>  #else
>>  	return -ENOTTY;
>> @@ -2701,7 +2706,8 @@ static int v4l_dbg_s_register(const struct v4l2_ioctl_ops *ops,
>>  }
>>  
>>  static int v4l_dbg_g_chip_info(const struct v4l2_ioctl_ops *ops,
>> -			       struct file *file, void *arg)
>> +			       struct file *file,
>> +			       struct video_device_state *state, void *arg)
>>  {
>>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>>  	struct video_device *vfd = video_devdata(file);
>> @@ -2717,7 +2723,7 @@ static int v4l_dbg_g_chip_info(const struct v4l2_ioctl_ops *ops,
>>  			p->flags |= V4L2_CHIP_FL_READABLE;
>>  		strscpy(p->name, vfd->v4l2_dev->name, sizeof(p->name));
>>  		if (ops->vidioc_g_chip_info)
>> -			return ops->vidioc_g_chip_info(file, NULL, arg);
>> +			return ops->vidioc_g_chip_info(file, state, arg);
>>  		if (p->match.addr)
>>  			return -EINVAL;
>>  		return 0;
>> @@ -2744,7 +2750,7 @@ static int v4l_dbg_g_chip_info(const struct v4l2_ioctl_ops *ops,
>>  }
>>  
>>  static int v4l_dqevent(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		       void *arg)
>> +		       struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
>>  
>> @@ -2752,7 +2758,8 @@ static int v4l_dqevent(const struct v4l2_ioctl_ops *ops, struct file *file,
>>  }
>>  
>>  static int v4l_subscribe_event(const struct v4l2_ioctl_ops *ops,
>> -			       struct file *file, void *arg)
>> +			       struct file *file,
>> +			       struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
>>  
>> @@ -2760,7 +2767,8 @@ static int v4l_subscribe_event(const struct v4l2_ioctl_ops *ops,
>>  }
>>  
>>  static int v4l_unsubscribe_event(const struct v4l2_ioctl_ops *ops,
>> -				 struct file *file, void *arg)
>> +				 struct file *file,
>> +				 struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
>>  
>> @@ -2768,7 +2776,8 @@ static int v4l_unsubscribe_event(const struct v4l2_ioctl_ops *ops,
>>  }
>>  
>>  static int v4l_g_sliced_vbi_cap(const struct v4l2_ioctl_ops *ops,
>> -				struct file *file, void *arg)
>> +				struct file *file,
>> +				struct video_device_state *state, void *arg)
>>  {
>>  	struct v4l2_sliced_vbi_cap *p = arg;
>>  	int ret = check_fmt(file, p->type);
>> @@ -2779,11 +2788,12 @@ static int v4l_g_sliced_vbi_cap(const struct v4l2_ioctl_ops *ops,
>>  	/* Clear up to type, everything after type is zeroed already */
>>  	memset(p, 0, offsetof(struct v4l2_sliced_vbi_cap, type));
>>  
>> -	return ops->vidioc_g_sliced_vbi_cap(file, NULL, p);
>> +	return ops->vidioc_g_sliced_vbi_cap(file, state, p);
>>  }
>>  
>>  static int v4l_enum_freq_bands(const struct v4l2_ioctl_ops *ops,
>> -			       struct file *file, void *arg)
>> +			       struct file *file,
>> +			       struct video_device_state *state, void *arg)
>>  {
>>  	struct video_device *vfd = video_devdata(file);
>>  	struct v4l2_frequency_band *p = arg;
>> @@ -2801,7 +2811,7 @@ static int v4l_enum_freq_bands(const struct v4l2_ioctl_ops *ops,
>>  			return -EINVAL;
>>  	}
>>  	if (ops->vidioc_enum_freq_bands) {
>> -		err = ops->vidioc_enum_freq_bands(file, NULL, p);
>> +		err = ops->vidioc_enum_freq_bands(file, state, p);
>>  		if (err != -ENOTTY)
>>  			return err;
>>  	}
>> @@ -2813,7 +2823,7 @@ static int v4l_enum_freq_bands(const struct v4l2_ioctl_ops *ops,
>>  
>>  		if (p->index)
>>  			return -EINVAL;
>> -		err = ops->vidioc_g_tuner(file, NULL, &t);
>> +		err = ops->vidioc_g_tuner(file, state, &t);
>>  		if (err)
>>  			return err;
>>  		p->capability = t.capability | V4L2_TUNER_CAP_FREQ_BANDS;
>> @@ -2832,7 +2842,7 @@ static int v4l_enum_freq_bands(const struct v4l2_ioctl_ops *ops,
>>  			return -EINVAL;
>>  		if (p->index)
>>  			return -EINVAL;
>> -		err = ops->vidioc_g_modulator(file, NULL, &m);
>> +		err = ops->vidioc_g_modulator(file, state, &m);
>>  		if (err)
>>  			return err;
>>  		p->capability = m.capability | V4L2_TUNER_CAP_FREQ_BANDS;
>> @@ -2849,7 +2859,7 @@ struct v4l2_ioctl_info {
>>  	u32 flags;
>>  	const char * const name;
>>  	int (*func)(const struct v4l2_ioctl_ops *ops, struct file *file,
>> -		    void *p);
>> +		    struct video_device_state *state, void *p);
>>  	void (*debug)(const void *arg, bool write_only);
>>  };
>>  
>> @@ -2870,7 +2880,9 @@ struct v4l2_ioctl_info {
>>  #define DEFINE_V4L_STUB_FUNC(_vidioc)				\
>>  	static int v4l_stub_ ## _vidioc(			\
>>  			const struct v4l2_ioctl_ops *ops,	\
>> -			struct file *file, void *p)		\
>> +			struct file *file,			\
>> +			struct video_device_state *state,	\
>> +			void *p)				\
>>  	{							\
>>  		return ops->vidioc_ ## _vidioc(file, NULL, p);	\
>>  	}
>> @@ -3126,7 +3138,7 @@ static long __video_do_ioctl(struct file *file,
>>  
>>  	write_only = _IOC_DIR(cmd) == _IOC_WRITE;
>>  	if (info != &default_info) {
>> -		ret = info->func(ops, file, arg);
>> +		ret = info->func(ops, file, NULL, arg);
>>  	} else if (!ops->vidioc_default) {
>>  		ret = -ENOTTY;
>>  	} else {
>>
> 
> 


