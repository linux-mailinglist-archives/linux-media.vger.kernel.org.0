Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F3E2B2DA5
	for <lists+linux-media@lfdr.de>; Sat, 14 Nov 2020 15:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgKNOVn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Nov 2020 09:21:43 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41974 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKNOVm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Nov 2020 09:21:42 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 5C4D81F485F3
Subject: Re: [PATCH v5 1/7] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        hiroh@chromium.org, nicolas@ndufresne.ca, Brian.Starkey@arm.com,
        kernel@collabora.com, narmstrong@baylibre.com,
        linux-kernel@vger.kernel.org, frkoenig@chromium.org,
        mjourdan@baylibre.com, stanimir.varbanov@linaro.org
References: <20200804192939.2251988-1-helen.koike@collabora.com>
 <20200804192939.2251988-2-helen.koike@collabora.com>
 <20201002194935.GB1131147@chromium.org>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <f5c9f7cd-f8e1-0671-b4d9-8ed79917b0aa@collabora.com>
Date:   Sat, 14 Nov 2020 11:21:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201002194935.GB1131147@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 10/2/20 4:49 PM, Tomasz Figa wrote:
> Hi Helen,
> 
> On Tue, Aug 04, 2020 at 04:29:33PM -0300, Helen Koike wrote:
>> This is part of the multiplanar and singleplanar unification process.
>> v4l2_ext_pix_format is supposed to work for both cases.
>>
>> We also add the concept of modifiers already employed in DRM to expose
>> HW-specific formats (like tiled or compressed formats) and allow
>> exchanging this information with the DRM subsystem in a consistent way.
>>
>> Note that only V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] are accepted in
>> v4l2_ext_format, other types will be rejected if you use the
>> {G,S,TRY}_EXT_PIX_FMT ioctls.
>>
>> New hooks have been added to v4l2_ioctl_ops to support those new ioctls
>> in drivers, but, in the meantime, the core takes care of converting
>> {S,G,TRY}_EXT_PIX_FMT requests into {S,G,TRY}_FMT so that old drivers can
>> still work if the userspace app/lib uses the new ioctls.
>> The conversion is also done the other around to allow userspace
>> apps/libs using {S,G,TRY}_FMT to work with drivers implementing the
>> _ext_ hooks.
>>
> 
> Thank you for the patch. Please see my comments inline.

Thanks for reviewing.

> 
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> ---
>> Changes in v5:
>> - change sizes and reorder fields to avoid holes in the struct and make
>>   it the same for 32 and 64 bits
>> - removed __attribute__ ((packed)) from uapi structs
>> - Fix doc warning from make htmldocs
>> - Updated commit message with EXT_PIX prefix for the ioctls.
>>
>> Changes in v4:
>> - Use v4l2_ext_pix_format directly in the ioctl, drop v4l2_ext_format,
>> making V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] the only valid types.
>> - Add reserved fields
>> - Removed num_planes from struct v4l2_ext_pix_format
>> - Removed flag field from struct v4l2_ext_pix_format, since the only
>>   defined value is V4L2_PIX_FMT_FLAG_PREMUL_ALPHA only used by vsp1,
>>   where we can use modifiers, or add it back later through the reserved
>>   bits.
>> - In v4l2_ext_format_to_format(), check if modifier is != MOD_LINEAR &&
>>   != MOD_INVALID
>> - Fix type assignment in v4l_g_fmt_ext_pix()
>> - Rebased on top of media/master (post 5.8-rc1)
>>
>> Changes in v3:
>> - Rebased on top of media/master (post 5.4-rc1)
>>
>> Changes in v2:
>> - Move the modifier in v4l2_ext_format (was formerly placed in
>>   v4l2_ext_plane)
>> - Fix a few bugs in the converters and add a strict parameter to
>>   allow conversion of uninitialized/mis-initialized objects
>> ---
>>  drivers/media/v4l2-core/v4l2-dev.c   |  21 +-
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 585 +++++++++++++++++++++++----
>>  include/media/v4l2-ioctl.h           |  34 ++
>>  include/uapi/linux/videodev2.h       |  56 +++
>>  4 files changed, 615 insertions(+), 81 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index a593ea0598b55..e1829906bc086 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -607,25 +607,37 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>  			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
>>  		if ((is_rx && (ops->vidioc_g_fmt_vid_cap ||
>>  			       ops->vidioc_g_fmt_vid_cap_mplane ||
>> +			       ops->vidioc_g_ext_pix_fmt_vid_cap ||
>>  			       ops->vidioc_g_fmt_vid_overlay)) ||
>>  		    (is_tx && (ops->vidioc_g_fmt_vid_out ||
>>  			       ops->vidioc_g_fmt_vid_out_mplane ||
>> -			       ops->vidioc_g_fmt_vid_out_overlay)))
>> +			       ops->vidioc_g_ext_pix_fmt_vid_out ||
>> +			       ops->vidioc_g_fmt_vid_out_overlay))) {
>>  			 set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
>> +			 set_bit(_IOC_NR(VIDIOC_G_EXT_PIX_FMT), valid_ioctls);
> 
> Is it expected to allow the new ioctls for drivers which implement the old
> vid_out_overlay callbacks?

Thanks for noticing it, I don't think so, I'll update this in next version.

> 
>> +		}
>>  		if ((is_rx && (ops->vidioc_s_fmt_vid_cap ||
>>  			       ops->vidioc_s_fmt_vid_cap_mplane ||
>> +			       ops->vidioc_s_ext_pix_fmt_vid_cap ||
>>  			       ops->vidioc_s_fmt_vid_overlay)) ||
>>  		    (is_tx && (ops->vidioc_s_fmt_vid_out ||
>>  			       ops->vidioc_s_fmt_vid_out_mplane ||
>> -			       ops->vidioc_s_fmt_vid_out_overlay)))
>> +			       ops->vidioc_s_ext_pix_fmt_vid_out ||
>> +			       ops->vidioc_s_fmt_vid_out_overlay))) {
>>  			 set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
>> +			 set_bit(_IOC_NR(VIDIOC_S_EXT_PIX_FMT), valid_ioctls);
>> +		}
>>  		if ((is_rx && (ops->vidioc_try_fmt_vid_cap ||
>>  			       ops->vidioc_try_fmt_vid_cap_mplane ||
>> +			       ops->vidioc_try_ext_pix_fmt_vid_cap ||
>>  			       ops->vidioc_try_fmt_vid_overlay)) ||
>>  		    (is_tx && (ops->vidioc_try_fmt_vid_out ||
>>  			       ops->vidioc_try_fmt_vid_out_mplane ||
>> -			       ops->vidioc_try_fmt_vid_out_overlay)))
>> +			       ops->vidioc_try_ext_pix_fmt_vid_out ||
>> +			       ops->vidioc_try_fmt_vid_out_overlay))) {
>>  			 set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
>> +			 set_bit(_IOC_NR(VIDIOC_TRY_EXT_PIX_FMT), valid_ioctls);
>> +		}
>>  		SET_VALID_IOCTL(ops, VIDIOC_OVERLAY, vidioc_overlay);
>>  		SET_VALID_IOCTL(ops, VIDIOC_G_FBUF, vidioc_g_fbuf);
>>  		SET_VALID_IOCTL(ops, VIDIOC_S_FBUF, vidioc_s_fbuf);
>> @@ -682,8 +694,11 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>  		/* touch specific ioctls */
>>  		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_vid_cap);
>>  		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_vid_cap);
>> +		SET_VALID_IOCTL(ops, VIDIOC_G_EXT_PIX_FMT, vidioc_g_fmt_vid_cap);
>>  		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_vid_cap);
>> +		SET_VALID_IOCTL(ops, VIDIOC_S_EXT_PIX_FMT, vidioc_s_fmt_vid_cap);
>>  		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_vid_cap);
>> +		SET_VALID_IOCTL(ops, VIDIOC_TRY_EXT_PIX_FMT, vidioc_try_fmt_vid_cap);
>>  		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMESIZES, vidioc_enum_framesizes);
>>  		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMEINTERVALS, vidioc_enum_frameintervals);
>>  		SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index a556880f225a5..14a0def50f8ea 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -17,6 +17,8 @@
>>  
>>  #include <linux/videodev2.h>
>>  
>> +#include <drm/drm_fourcc.h>
>> +
>>  #include <media/v4l2-common.h>
>>  #include <media/v4l2-ioctl.h>
>>  #include <media/v4l2-ctrls.h>
>> @@ -378,6 +380,27 @@ static void v4l_print_format(const void *arg, bool write_only)
>>  	}
>>  }
>>  
>> +static void v4l_print_ext_pix_format(const void *arg, bool write_only)
>> +{
>> +	const struct v4l2_ext_pix_format *pix = arg;
>> +	unsigned int i;
>> +
>> +	pr_cont("type=%s, width=%u, height=%u, format=%c%c%c%c, modifier %llx, field=%s, colorspace=%d, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
>> +		prt_names(pix->type, v4l2_type_names),
>> +		pix->width, pix->height,
>> +		(pix->pixelformat & 0xff),
>> +		(pix->pixelformat >>  8) & 0xff,
>> +		(pix->pixelformat >> 16) & 0xff,
>> +		(pix->pixelformat >> 24) & 0xff,
>> +		pix->modifier, prt_names(pix->field, v4l2_field_names),
>> +		pix->colorspace, pix->ycbcr_enc,
>> +		pix->quantization, pix->xfer_func);
>> +	for (i = 0; i < VIDEO_MAX_PLANES && pix->plane_fmt[i].sizeimage; i++)
> 
> This is going to print 8 lines every time. Maybe we could skip 0-sized
> planes or something?

I'm already checking pix->plane_fmt[i].sizeimage in the loop, it shouldn't
print 8 lines every time.

> 
>> +		pr_debug("plane %u: bytesperline=%u sizeimage=%u\n",
>> +			 i, pix->plane_fmt[i].bytesperline,
>> +			 pix->plane_fmt[i].sizeimage);
>> +}
>> +
>>  static void v4l_print_framebuffer(const void *arg, bool write_only)
>>  {
>>  	const struct v4l2_framebuffer *p = arg;
>> @@ -964,11 +987,15 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>>  	switch (type) {
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>>  		if ((is_vid || is_tch) && is_rx &&
>> -		    (ops->vidioc_g_fmt_vid_cap || ops->vidioc_g_fmt_vid_cap_mplane))
>> +		    (ops->vidioc_g_fmt_vid_cap ||
>> +		     ops->vidioc_g_ext_pix_fmt_vid_cap ||
>> +		     ops->vidioc_g_fmt_vid_cap_mplane))
>>  			return 0;
>>  		break;
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -		if ((is_vid || is_tch) && is_rx && ops->vidioc_g_fmt_vid_cap_mplane)
>> +		if ((is_vid || is_tch) && is_rx &&
>> +		    (ops->vidioc_g_fmt_vid_cap_mplane ||
>> +		     ops->vidioc_g_ext_pix_fmt_vid_cap))
>>  			return 0;
>>  		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>> @@ -977,11 +1004,15 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>>  		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>>  		if (is_vid && is_tx &&
>> -		    (ops->vidioc_g_fmt_vid_out || ops->vidioc_g_fmt_vid_out_mplane))
>> +		    (ops->vidioc_g_fmt_vid_out ||
>> +		     ops->vidioc_g_ext_pix_fmt_vid_out ||
>> +		     ops->vidioc_g_fmt_vid_out_mplane))
>>  			return 0;
>>  		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> -		if (is_vid && is_tx && ops->vidioc_g_fmt_vid_out_mplane)
>> +		if (is_vid && is_tx &&
>> +		    (ops->vidioc_g_ext_pix_fmt_vid_out ||
>> +		     ops->vidioc_g_fmt_vid_out_mplane))
>>  			return 0;
>>  		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>> @@ -1061,6 +1092,134 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
>>  	       sizeof(fmt->fmt.pix) - offset);
>>  }
>>  
>> +int v4l2_ext_pix_format_to_format(const struct v4l2_ext_pix_format *e,
>> +				  struct v4l2_format *f, bool mplane_cap,
>> +				  bool strict)
>> +{
>> +	const struct v4l2_plane_ext_pix_format *pe;
>> +	struct v4l2_plane_pix_format *p;
>> +	unsigned int i;
>> +
>> +	memset(f, 0, sizeof(*f));
>> +
>> +	/*
>> +	 * Make sure no modifier is required before doing the
>> +	 * conversion.
>> +	 */
>> +	if (e->modifier && strict &&
> 
> Do we need the explicit check for e->modifier != 0 if we have to check for
> the 2 specific values below anyway?

We don't, since DRM_FORMAT_MOD_LINEAR is zero.

But I wanted to make it explicit we don't support modifiers in this conversion.
But I can remove this check, no problem.

> 
>> +	    e->modifier != DRM_FORMAT_MOD_LINEAR &&
>> +	    e->modifier != DRM_FORMAT_MOD_INVALID)
>> +		return -EINVAL;
>> +
>> +	if (!e->plane_fmt[0].sizeimage && strict)
>> +		return -EINVAL;
> 
> Why is this incorrect?

!sizeimage for the first plane means that there are no planes in ef.
strict is true if the result for the conversion should be returned to userspace
and it is not some internal handling.

So if there are no planes, we would return an incomplete v4l2_format struct
to userspace.

But this is not very clear, I'll improve this for the next version.

> 
>> +
>> +	if (e->plane_fmt[1].sizeimage && !mplane_cap && strict)
>> +		return 0;
> 
> Again this seems to be different from what we discussed before. In the ext
> API, the planes would mean color planes and would be all filled in with the
> right values. So for this conversion, if !mplane cap, then we should check
> if bytesperline of planes >= 1 match the format definition and use the sum
> of all planes sizeimage as the sizeimage of the legacy struct.

Agreed, I'll update for next version.

> 
>> +
>> +	if (!mplane_cap) {
>> +		f->fmt.pix.width = e->width;
>> +		f->fmt.pix.height = e->height;
>> +		f->fmt.pix.pixelformat = e->pixelformat;
>> +		f->fmt.pix.field = e->field;
>> +		f->fmt.pix.colorspace = e->colorspace;
>> +		f->fmt.pix.ycbcr_enc = e->ycbcr_enc;
>> +		f->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> +		f->fmt.pix.quantization = e->quantization;
>> +		pe = &e->plane_fmt[0];
>> +		f->fmt.pix.bytesperline = pe->bytesperline;
>> +		f->fmt.pix.sizeimage = pe->sizeimage;
> 
> See above for how these two should be filled in.

Ack.

> 
>> +		f->type = e->type;
>> +		return 0;
>> +	}
>> +
>> +	f->fmt.pix_mp.width = e->width;
>> +	f->fmt.pix_mp.height = e->height;
>> +	f->fmt.pix_mp.pixelformat = e->pixelformat;
>> +	f->fmt.pix_mp.field = e->field;
>> +	f->fmt.pix_mp.colorspace = e->colorspace;
>> +	f->fmt.pix_mp.ycbcr_enc = e->ycbcr_enc;
>> +	f->fmt.pix_mp.quantization = e->quantization;
>> +	if (e->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +	else
>> +		f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +
>> +	for (i = 0; i < VIDEO_MAX_PLANES; i++) {
>> +		pe = &e->plane_fmt[i];
>> +		p = &f->fmt.pix_mp.plane_fmt[i];
>> +		p->bytesperline = pe->bytesperline;
>> +		p->sizeimage = pe->sizeimage;
> 
> This is similar to the above, but the behavior depends on whether the
> pixelformat is an M or non-M variant.

Ack.

> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_ext_pix_format_to_format);
>> +
>> +int v4l2_format_to_ext_pix_format(const struct v4l2_format *f,
>> +				  struct v4l2_ext_pix_format *e, bool strict)
> 
> In other functions "ef" is used for the extended format. Let's make it
> consistent.

Ack.

> 
>> +{
>> +	const struct v4l2_plane_pix_format *p;
>> +	struct v4l2_plane_ext_pix_format *pe;
>> +	unsigned int i;
>> +
>> +	memset(e, 0, sizeof(*e));
>> +
>> +	switch (f->type) {
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>> +		e->width = f->fmt.pix.width;
>> +		e->height = f->fmt.pix.height;
>> +		e->pixelformat = f->fmt.pix.pixelformat;
>> +		e->field = f->fmt.pix.field;
>> +		e->colorspace = f->fmt.pix.colorspace;
>> +		if (f->fmt.pix.flags)
>> +			pr_warn("Ignoring pixelformat flags 0x%x\n",
>> +				f->fmt.pix.flags);
> 
> Would it make sense to print something like video node name and/or function
> name to explain where this warning comes from?

I would need to update the function to receive this information, I can try but
I'm not sure if it is worthy.

> 
>> +		e->ycbcr_enc = f->fmt.pix.ycbcr_enc;
>> +		e->quantization = f->fmt.pix.quantization;
> 
> Missing xfer_func?

Yes, thanks for catching this.

> 
>> +		e->plane_fmt[0].bytesperline = f->fmt.pix.bytesperline;
>> +		e->plane_fmt[0].sizeimage = f->fmt.pix.sizeimage;
> 
> This doesn't look right. In the ext API we expected the planes to describe
> color planes, which means that bytesperline needs to be computed for planes
>> = 1 and sizeimage replaced with per-plane sizes, according to the
>> pixelformat.

Ack.

Just to be clear, even if we are using a planar format that isn't a V4L2_PIX_FMT_*M
variant, we should describe every plane separatly.

For instance, if V4L2_PIX_FMT_YVU420 is being used, then f->fmt.pix.bytesperline
will have data, and we need to calculate bytesperline for all 3 planes, so we'll fill
out:

f->plane_fmt[0].bytesperline = f->fmt.pix.bytesperline;
f->plane_fmt[1].bytesperline = f->fmt.pix.bytesperline / hdiv;
f->plane_fmt[2].bytesperline = f->fmt.pix.bytesperline / hdiv;

I'll update this for the next version.

> 
>> +		e->type = f->type;
>> +		break;
>> +
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +		if ((f->fmt.pix_mp.num_planes > VIDEO_MAX_PLANES ||
>> +		     !f->fmt.pix_mp.num_planes) && strict)
>> +			return -EINVAL;
>> +
>> +		e->width = f->fmt.pix_mp.width;
>> +		e->height = f->fmt.pix_mp.height;
>> +		e->pixelformat = f->fmt.pix_mp.pixelformat;
>> +		e->field = f->fmt.pix_mp.field;
>> +		e->colorspace = f->fmt.pix_mp.colorspace;
>> +		if (f->fmt.pix.flags)
>> +			pr_warn("Ignoring pixelformat flags 0x%x\n",
>> +				f->fmt.pix.flags);
>> +		e->ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
>> +		e->quantization = f->fmt.pix_mp.quantization;
> 
> Missing xfer_func?

Yes, thanks for catching this.

> 
>> +		if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>> +			e->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> +		else
>> +			e->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>> +
>> +		for (i = 0; i < VIDEO_MAX_PLANES; i++) {
>> +			pe = &e->plane_fmt[i];
>> +			p = &f->fmt.pix_mp.plane_fmt[i];
>> +			pe->bytesperline = p->bytesperline;
>> +			pe->sizeimage = p->sizeimage;
>> +		}
> 
> Same here. A blind copy is not enough. For non-M formats, the plane
> parameters need to be filled according to the pixelformat.


Right, following the idea above, we need a different handling if we
aren't using a M-variant of the pixelformat, and we also need to
convert the pixelformat from the M-variant to non-M-variant.

I'll also need to save that the original format was a
M-variant or not, so I can convert it back as expected.

I'll change this and submit for review.


> 
>> +		break;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_format_to_ext_pix_format);
>> +
>>  static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
>>  				struct file *file, void *fh, void *arg)
>>  {
>> @@ -1564,6 +1723,38 @@ static void v4l_pix_format_touch(struct v4l2_pix_format *p)
>>  	p->xfer_func = 0;
>>  }
>>  
>> +static int v4l_g_fmt_ext_pix(const struct v4l2_ioctl_ops *ops,
>> +			     struct file *file, void *fh,
>> +			     struct v4l2_format *f)
>> +{
>> +	struct v4l2_ext_pix_format ef;
>> +	int ret;
>> +
>> +	switch (f->type) {
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +		ef.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> +		ret = ops->vidioc_g_ext_pix_fmt_vid_cap(file, fh, &ef);
>> +		break;
>> +
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +		ef.type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>> +		ret = ops->vidioc_g_ext_pix_fmt_vid_out(file, fh, &ef);
>> +		break;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	return v4l2_ext_pix_format_to_format(&ef, f,
>> +					     V4L2_TYPE_IS_MULTIPLANAR(f->type),
>> +					     true);
>> +}
>> +
>>  static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>>  				struct file *file, void *fh, void *arg)
>>  {
>> @@ -1600,17 +1791,27 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>>  
>>  	switch (p->type) {
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>> -		if (unlikely(!ops->vidioc_g_fmt_vid_cap))
>> -			break;
>> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> -		ret = ops->vidioc_g_fmt_vid_cap(file, fh, arg);
>> -		/* just in case the driver zeroed it again */
>> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> -		if (vfd->vfl_type == VFL_TYPE_TOUCH)
>> -			v4l_pix_format_touch(&p->fmt.pix);
>> -		return ret;
>> +		if (ops->vidioc_g_fmt_vid_cap) {
>> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> +			ret = ops->vidioc_g_fmt_vid_cap(file, fh, arg);
>> +			/* just in case the driver zeroed it again */
>> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> +			if (vfd->vfl_type == VFL_TYPE_TOUCH)
>> +				v4l_pix_format_touch(&p->fmt.pix);
>> +			return ret;
>> +		} else if (ops->vidioc_g_ext_pix_fmt_vid_cap) {
>> +			ret = v4l_g_fmt_ext_pix(ops, file, fh, p);
>> +			if (vfd->vfl_type == VFL_TYPE_TOUCH)
>> +				v4l_pix_format_touch(&p->fmt.pix);
>> +			return ret;
>> +		}
>> +		break;
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -		return ops->vidioc_g_fmt_vid_cap_mplane(file, fh, arg);
>> +		if (ops->vidioc_g_fmt_vid_cap_mplane)
>> +			return ops->vidioc_g_fmt_vid_cap_mplane(file, fh, arg);
>> +		else if (ops->vidioc_g_ext_pix_fmt_vid_cap)
>> +			return v4l_g_fmt_ext_pix(ops, file, fh, p);
>> +		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>>  		return ops->vidioc_g_fmt_vid_overlay(file, fh, arg);
>>  	case V4L2_BUF_TYPE_VBI_CAPTURE:
>> @@ -1618,15 +1819,22 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>>  	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
>>  		return ops->vidioc_g_fmt_sliced_vbi_cap(file, fh, arg);
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>> -		if (unlikely(!ops->vidioc_g_fmt_vid_out))
>> -			break;
>> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> -		ret = ops->vidioc_g_fmt_vid_out(file, fh, arg);
>> -		/* just in case the driver zeroed it again */
>> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> -		return ret;
>> +		if (ops->vidioc_g_fmt_vid_out) {
>> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> +			ret = ops->vidioc_g_fmt_vid_out(file, fh, arg);
>> +			/* just in case the driver zeroed it again */
>> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> +			return ret;
>> +		} else if (ops->vidioc_g_ext_pix_fmt_vid_out) {
>> +			return v4l_g_fmt_ext_pix(ops, file, fh, p);
>> +		}
>> +		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> -		return ops->vidioc_g_fmt_vid_out_mplane(file, fh, arg);
>> +		if (ops->vidioc_g_fmt_vid_out_mplane)
>> +			return ops->vidioc_g_fmt_vid_out_mplane(file, fh, arg);
>> +		else if (ops->vidioc_g_ext_pix_fmt_vid_out)
>> +			return v4l_g_fmt_ext_pix(ops, file, fh, p);
>> +		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>>  		return ops->vidioc_g_fmt_vid_out_overlay(file, fh, arg);
>>  	case V4L2_BUF_TYPE_VBI_OUTPUT:
>> @@ -1645,6 +1853,76 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>>  	return -EINVAL;
>>  }
>>  
>> +static int v4l_g_ext_pix_fmt(const struct v4l2_ioctl_ops *ops,
>> +			     struct file *file, void *fh, void *arg)
>> +{
>> +	struct v4l2_ext_pix_format *ef = arg;
>> +	struct v4l2_format f = {
>> +		.type = ef->type,
>> +	};
>> +	int ret;
>> +
>> +	ret = check_fmt(file, ef->type);
>> +	if (ret)
>> +		return ret;
>> +
>> +	memset(ef, 0, sizeof(*ef));
>> +	ef->type = f.type;
>> +
>> +	switch (f.type) {
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>> +		if (ops->vidioc_g_ext_pix_fmt_vid_cap)
>> +			return ops->vidioc_g_ext_pix_fmt_vid_cap(file, fh, ef);
>> +		break;
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>> +		if (ops->vidioc_g_ext_pix_fmt_vid_out)
>> +			return ops->vidioc_g_ext_pix_fmt_vid_out(file, fh, ef);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = v4l_g_fmt(ops, file, fh, &f);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return v4l2_format_to_ext_pix_format(&f, ef, true);
>> +}
>> +
>> +static int v4l_s_fmt_ext_pix(const struct v4l2_ioctl_ops *ops,
>> +			     struct file *file, void *fh,
>> +			     struct v4l2_format *f)
>> +{
>> +	struct v4l2_ext_pix_format ef;
>> +	int ret;
>> +
>> +	ret = v4l2_format_to_ext_pix_format(f, &ef, false);
>> +	if (ret)
>> +		return ret;
>> +
>> +	switch (f->type) {
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +		ret = ops->vidioc_s_ext_pix_fmt_vid_cap(file, fh, &ef);
>> +		break;
>> +
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +		ret = ops->vidioc_s_ext_pix_fmt_vid_out(file, fh, &ef);
>> +		break;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	return v4l2_ext_pix_format_to_format(&ef, f,
>> +					     V4L2_TYPE_IS_MULTIPLANAR(f->type),
>> +					     true);
>> +}
>> +
>>  static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>>  				struct file *file, void *fh, void *arg)
>>  {
>> @@ -1663,23 +1941,31 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>>  
>>  	switch (p->type) {
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>> -		if (unlikely(!ops->vidioc_s_fmt_vid_cap))
>> +		if (ops->vidioc_s_fmt_vid_cap) {
>> +			CLEAR_AFTER_FIELD(p, fmt.pix);
>> +			ret = ops->vidioc_s_fmt_vid_cap(file, fh, arg);
>> +			/* just in case the driver zeroed it again */
>> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> +		} else if (ops->vidioc_s_ext_pix_fmt_vid_cap) {
>> +			ret = v4l_s_fmt_ext_pix(ops, file, fh, arg);
>> +		} else {
>>  			break;
>> -		CLEAR_AFTER_FIELD(p, fmt.pix);
>> -		ret = ops->vidioc_s_fmt_vid_cap(file, fh, arg);
>> -		/* just in case the driver zeroed it again */
>> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> +		}
>> +
>>  		if (vfd->vfl_type == VFL_TYPE_TOUCH)
>>  			v4l_pix_format_touch(&p->fmt.pix);
>>  		return ret;
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -		if (unlikely(!ops->vidioc_s_fmt_vid_cap_mplane))
>> -			break;
>> -		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
>> -		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>> -			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
>> -					  bytesperline);
>> -		return ops->vidioc_s_fmt_vid_cap_mplane(file, fh, arg);
>> +		if (ops->vidioc_s_fmt_vid_cap_mplane) {
>> +			CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
>> +			for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>> +				CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
>> +						  bytesperline);
>> +			return ops->vidioc_s_fmt_vid_cap_mplane(file, fh, arg);
>> +		} else if (ops->vidioc_s_ext_pix_fmt_vid_cap) {
>> +			return v4l_s_fmt_ext_pix(ops, file, fh, arg);
>> +		}
>> +		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>>  		if (unlikely(!ops->vidioc_s_fmt_vid_overlay))
>>  			break;
>> @@ -1696,21 +1982,27 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>>  		CLEAR_AFTER_FIELD(p, fmt.sliced.io_size);
>>  		return ops->vidioc_s_fmt_sliced_vbi_cap(file, fh, arg);
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>> -		if (unlikely(!ops->vidioc_s_fmt_vid_out))
>> -			break;
>> -		CLEAR_AFTER_FIELD(p, fmt.pix);
>> -		ret = ops->vidioc_s_fmt_vid_out(file, fh, arg);
>> -		/* just in case the driver zeroed it again */
>> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> -		return ret;
>> +		if (ops->vidioc_s_fmt_vid_out) {
>> +			CLEAR_AFTER_FIELD(p, fmt.pix);
>> +			ret = ops->vidioc_s_fmt_vid_out(file, fh, arg);
>> +			/* just in case the driver zeroed it again */
>> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> +			return ret;
>> +		} else if (ops->vidioc_s_ext_pix_fmt_vid_out) {
>> +			return v4l_s_fmt_ext_pix(ops, file, fh, arg);
>> +		}
>> +		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> -		if (unlikely(!ops->vidioc_s_fmt_vid_out_mplane))
>> -			break;
>> -		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
>> -		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>> -			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
>> -					  bytesperline);
>> -		return ops->vidioc_s_fmt_vid_out_mplane(file, fh, arg);
>> +		if (ops->vidioc_s_fmt_vid_out_mplane) {
>> +			CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
>> +			for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>> +				CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
>> +						  bytesperline);
>> +			return ops->vidioc_s_fmt_vid_out_mplane(file, fh, arg);
>> +		} else if (ops->vidioc_s_ext_pix_fmt_vid_out) {
>> +			return v4l_s_fmt_ext_pix(ops, file, fh, arg);
>> +		}
>> +		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>>  		if (unlikely(!ops->vidioc_s_fmt_vid_out_overlay))
>>  			break;
>> @@ -1750,6 +2042,82 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>>  	return -EINVAL;
>>  }
>>  
>> +static int v4l_s_ext_pix_fmt(const struct v4l2_ioctl_ops *ops,
>> +			     struct file *file, void *fh, void *arg)
>> +{
>> +	struct video_device *vfd = video_devdata(file);
>> +	struct v4l2_ext_pix_format *ef = arg;
>> +	struct v4l2_format f;
>> +	int ret;
>> +
>> +	ret = check_fmt(file, ef->type);
>> +	if (ret)
>> +		return ret;
>> +
> 
> Should we zero the reserved fields as it's done with the current structs?

Yes, I'll update this.

> 
>> +	switch (ef->type) {
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>> +		if (ops->vidioc_s_ext_pix_fmt_vid_cap)
>> +			return ops->vidioc_s_ext_pix_fmt_vid_cap(file, fh, ef);
>> +		break;
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>> +		if (ops->vidioc_s_ext_pix_fmt_vid_out)
>> +			return ops->vidioc_s_ext_pix_fmt_vid_out(file, fh, ef);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = v4l2_ext_pix_format_to_format(ef, &f,
>> +					    vfd->device_caps &
>> +					    (V4L2_CAP_VIDEO_CAPTURE_MPLANE |
>> +					     V4L2_CAP_VIDEO_OUTPUT_MPLANE |
>> +					     V4L2_CAP_VIDEO_M2M_MPLANE),
>> +					    false);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = v4l_s_fmt(ops, file, fh, &f);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return v4l2_format_to_ext_pix_format(&f, ef, true);
>> +}
>> +
>> +static int v4l_try_fmt_ext_pix(const struct v4l2_ioctl_ops *ops,
>> +			       struct file *file, void *fh,
>> +			       struct v4l2_format *f)
>> +{
>> +	struct v4l2_ext_pix_format ef;
>> +	int ret;
>> +
>> +	ret = v4l2_format_to_ext_pix_format(f, &ef, false);
>> +	if (ret)
>> +		return ret;
>> +
>> +	switch (f->type) {
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +		ret = ops->vidioc_try_ext_pix_fmt_vid_cap(file, fh, &ef);
>> +		break;
>> +
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +		ret = ops->vidioc_try_ext_pix_fmt_vid_out(file, fh, &ef);
>> +		break;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	return v4l2_ext_pix_format_to_format(&ef, f,
>> +					     V4L2_TYPE_IS_MULTIPLANAR(f->type),
>> +					     true);
>> +}
>> +
>> +
>>  static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>>  				struct file *file, void *fh, void *arg)
>>  {
>> @@ -1765,23 +2133,32 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>>  
>>  	switch (p->type) {
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>> -		if (unlikely(!ops->vidioc_try_fmt_vid_cap))
>> -			break;
>> -		CLEAR_AFTER_FIELD(p, fmt.pix);
>> -		ret = ops->vidioc_try_fmt_vid_cap(file, fh, arg);
>> -		/* just in case the driver zeroed it again */
>> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> -		if (vfd->vfl_type == VFL_TYPE_TOUCH)
>> -			v4l_pix_format_touch(&p->fmt.pix);
>> -		return ret;
>> +		if (ops->vidioc_try_fmt_vid_cap) {
>> +			CLEAR_AFTER_FIELD(p, fmt.pix);
>> +			ret = ops->vidioc_try_fmt_vid_cap(file, fh, arg);
>> +			/* just in case the driver zeroed it again */
>> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> +			if (vfd->vfl_type == VFL_TYPE_TOUCH)
>> +				v4l_pix_format_touch(&p->fmt.pix);
>> +			return ret;
>> +		} else if (ops->vidioc_try_ext_pix_fmt_vid_cap) {
>> +			ret = v4l_try_fmt_ext_pix(ops, file, fh, p);
>> +			if (vfd->vfl_type == VFL_TYPE_TOUCH)
>> +				v4l_pix_format_touch(&p->fmt.pix);
>> +			return ret;
> 
> Should the 3 lines above be outside of the if/else block?

I can move them out, I just need to add an else condition for the break below.
I'll update this in the next version.

> 
>> +		}
>> +		break;
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -		if (unlikely(!ops->vidioc_try_fmt_vid_cap_mplane))
>> -			break;
>> -		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
>> -		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>> -			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
>> -					  bytesperline);
>> -		return ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg);
>> +		if (ops->vidioc_try_fmt_vid_cap_mplane) {
>> +			CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
>> +			for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>> +				CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
>> +						  bytesperline);
>> +			return ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg);
>> +		} else if (ops->vidioc_try_ext_pix_fmt_vid_cap) {
>> +			return v4l_try_fmt_ext_pix(ops, file, fh, p);
>> +		}
>> +		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>>  		if (unlikely(!ops->vidioc_try_fmt_vid_overlay))
>>  			break;
>> @@ -1798,21 +2175,27 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>>  		CLEAR_AFTER_FIELD(p, fmt.sliced.io_size);
>>  		return ops->vidioc_try_fmt_sliced_vbi_cap(file, fh, arg);
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>> -		if (unlikely(!ops->vidioc_try_fmt_vid_out))
>> -			break;
>> -		CLEAR_AFTER_FIELD(p, fmt.pix);
>> -		ret = ops->vidioc_try_fmt_vid_out(file, fh, arg);
>> -		/* just in case the driver zeroed it again */
>> -		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> -		return ret;
>> +		if (ops->vidioc_try_fmt_vid_out) {
>> +			CLEAR_AFTER_FIELD(p, fmt.pix);
>> +			ret = ops->vidioc_try_fmt_vid_out(file, fh, arg);
>> +			/* just in case the driver zeroed it again */
>> +			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>> +			return ret;
>> +		} else if (ops->vidioc_try_ext_pix_fmt_vid_cap) {
>> +			return v4l_try_fmt_ext_pix(ops, file, fh, p);
>> +		}
>> +		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> -		if (unlikely(!ops->vidioc_try_fmt_vid_out_mplane))
>> -			break;
>> -		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
>> -		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>> -			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
>> -					  bytesperline);
>> -		return ops->vidioc_try_fmt_vid_out_mplane(file, fh, arg);
>> +		if (ops->vidioc_try_fmt_vid_out_mplane) {
>> +			CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
>> +			for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
>> +				CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
>> +						  bytesperline);
>> +			return ops->vidioc_try_fmt_vid_out_mplane(file, fh, arg);
>> +		} else if (ops->vidioc_try_ext_pix_fmt_vid_cap) {
>> +			return v4l_try_fmt_ext_pix(ops, file, fh, p);
>> +		}
>> +		break;
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>>  		if (unlikely(!ops->vidioc_try_fmt_vid_out_overlay))
>>  			break;
>> @@ -1852,6 +2235,49 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>>  	return -EINVAL;
>>  }
>>  
>> +static int v4l_try_ext_pix_fmt(const struct v4l2_ioctl_ops *ops,
>> +			       struct file *file, void *fh, void *arg)
>> +{
>> +	struct video_device *vfd = video_devdata(file);
>> +	struct v4l2_ext_pix_format *ef = arg;
>> +	struct v4l2_format f;
>> +	int ret;
>> +
>> +	ret = check_fmt(file, ef->type);
>> +	if (ret)
>> +		return ret;
> 
> Should we zero the reserved fields as it's done with the current structs?

Yes, I'll update this in the next version.

> 
>> +
>> +	switch (ef->type) {
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>> +		if (ops->vidioc_try_ext_pix_fmt_vid_cap)
>> +			return ops->vidioc_try_ext_pix_fmt_vid_cap(file, fh,
>> +								   ef);
>> +		break;
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>> +		if (ops->vidioc_try_ext_pix_fmt_vid_out)
>> +			return ops->vidioc_try_ext_pix_fmt_vid_out(file, fh,
>> +								   ef);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = v4l2_ext_pix_format_to_format(ef, &f,
>> +					    vfd->device_caps &
>> +					    (V4L2_CAP_VIDEO_CAPTURE_MPLANE |
>> +					     V4L2_CAP_VIDEO_OUTPUT_MPLANE |
>> +					     V4L2_CAP_VIDEO_M2M_MPLANE),
>> +					    false);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = v4l_try_fmt(ops, file, fh, &f);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return v4l2_format_to_ext_pix_format(&f, ef, true);
>> +}
>> +
>>  static int v4l_streamon(const struct v4l2_ioctl_ops *ops,
>>  				struct file *file, void *fh, void *arg)
>>  {
>> @@ -2771,7 +3197,9 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>>  	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
>>  	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
>>  	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
>> +	IOCTL_INFO(VIDIOC_G_EXT_PIX_FMT, v4l_g_ext_pix_fmt, v4l_print_ext_pix_format, 0),
>>  	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_EXT_PIX_FMT, v4l_s_ext_pix_fmt, v4l_print_ext_pix_format, INFO_FL_PRIO),
>>  	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
>>  	IOCTL_INFO(VIDIOC_QUERYBUF, v4l_querybuf, v4l_print_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_buffer, length)),
>>  	IOCTL_INFO(VIDIOC_G_FBUF, v4l_stub_g_fbuf, v4l_print_framebuffer, 0),
>> @@ -2818,6 +3246,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>>  	IOCTL_INFO(VIDIOC_S_JPEGCOMP, v4l_stub_s_jpegcomp, v4l_print_jpegcompression, INFO_FL_PRIO),
>>  	IOCTL_INFO(VIDIOC_QUERYSTD, v4l_querystd, v4l_print_std, 0),
>>  	IOCTL_INFO(VIDIOC_TRY_FMT, v4l_try_fmt, v4l_print_format, 0),
>> +	IOCTL_INFO(VIDIOC_TRY_EXT_PIX_FMT, v4l_try_ext_pix_fmt, v4l_print_ext_pix_format, 0),
>>  	IOCTL_INFO(VIDIOC_ENUMAUDIO, v4l_stub_enumaudio, v4l_print_audio, INFO_FL_CLEAR(v4l2_audio, index)),
>>  	IOCTL_INFO(VIDIOC_ENUMAUDOUT, v4l_stub_enumaudout, v4l_print_audioout, INFO_FL_CLEAR(v4l2_audioout, index)),
>>  	IOCTL_INFO(VIDIOC_G_PRIORITY, v4l_g_priority, v4l_print_u32, 0),
>> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
>> index 86878fba332b0..8bbcb74d8ee31 100644
>> --- a/include/media/v4l2-ioctl.h
>> +++ b/include/media/v4l2-ioctl.h
>> @@ -48,11 +48,17 @@ struct v4l2_fh;
>>   * @vidioc_g_fmt_vid_cap: pointer to the function that implements
>>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video capture
>>   *	in single plane mode
>> + * @vidioc_g_ext_pix_fmt_vid_cap: pointer to the function that implements
>> + *	:ref:`VIDIOC_G_EXT_PIX_FMT <vidioc_g_ext_pix_fmt>` ioctl logic for video
>> + *	capture
>>   * @vidioc_g_fmt_vid_overlay: pointer to the function that implements
>>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video overlay
>>   * @vidioc_g_fmt_vid_out: pointer to the function that implements
>>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video out
>>   *	in single plane mode
>> + * @vidioc_g_ext_pix_fmt_vid_out: pointer to the function that implements
>> + *	:ref:`VIDIOC_G_EXT_PIX_FMT <vidioc_g_ext_pix_fmt>` ioctl logic for video
>> + *	out
>>   * @vidioc_g_fmt_vid_out_overlay: pointer to the function that implements
>>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video overlay output
>>   * @vidioc_g_fmt_vbi_cap: pointer to the function that implements
>> @@ -82,11 +88,16 @@ struct v4l2_fh;
>>   * @vidioc_s_fmt_vid_cap: pointer to the function that implements
>>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video capture
>>   *	in single plane mode
>> + * @vidioc_s_ext_pix_fmt_vid_cap: pointer to the function that implements
>> + *	:ref:`VIDIOC_S_EXT_PIX_FMT <vidioc_g_ext_pix_fmt>` ioctl logic for video
>> + *	capture
>>   * @vidioc_s_fmt_vid_overlay: pointer to the function that implements
>>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video overlay
>>   * @vidioc_s_fmt_vid_out: pointer to the function that implements
>>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video out
>>   *	in single plane mode
>> + * @vidioc_s_ext_pix_fmt_vid_out: pointer to the function that implements
>> + *	:ref:`VIDIOC_S_EXT_PIX_FMT <vidioc_g_fmt>` ioctl logic for video out
>>   * @vidioc_s_fmt_vid_out_overlay: pointer to the function that implements
>>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video overlay output
>>   * @vidioc_s_fmt_vbi_cap: pointer to the function that implements
>> @@ -116,11 +127,16 @@ struct v4l2_fh;
>>   * @vidioc_try_fmt_vid_cap: pointer to the function that implements
>>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video capture
>>   *	in single plane mode
>> + * @vidioc_try_ext_pix_fmt_vid_cap: pointer to the function that implements
>> + *	:ref:`VIDIOC_TRY_EXT_PIX_FMT <vidioc_g_ext_pix_fmt>` ioctl logic for
>> +	video capture
>>   * @vidioc_try_fmt_vid_overlay: pointer to the function that implements
>>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video overlay
>>   * @vidioc_try_fmt_vid_out: pointer to the function that implements
>>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video out
>>   *	in single plane mode
>> + * @vidioc_try_ext_pix_fmt_vid_out: pointer to the function that implements
>> + *	:ref:`VIDIOC_TRY_EXT_PIX_FMT <vidioc_g_fmt>` ioctl logic for video out
>>   * @vidioc_try_fmt_vid_out_overlay: pointer to the function that implements
>>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video overlay
>>   *	output
>> @@ -319,10 +335,14 @@ struct v4l2_ioctl_ops {
>>  	/* VIDIOC_G_FMT handlers */
>>  	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
>>  				    struct v4l2_format *f);
>> +	int (*vidioc_g_ext_pix_fmt_vid_cap)(struct file *file, void *fh,
>> +					    struct v4l2_ext_pix_format *f);
>>  	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *fh,
>>  					struct v4l2_format *f);
>>  	int (*vidioc_g_fmt_vid_out)(struct file *file, void *fh,
>>  				    struct v4l2_format *f);
>> +	int (*vidioc_g_ext_pix_fmt_vid_out)(struct file *file, void *fh,
>> +					    struct v4l2_ext_pix_format *f);
>>  	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *fh,
>>  					    struct v4l2_format *f);
>>  	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *fh,
>> @@ -349,10 +369,14 @@ struct v4l2_ioctl_ops {
>>  	/* VIDIOC_S_FMT handlers */
>>  	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
>>  				    struct v4l2_format *f);
>> +	int (*vidioc_s_ext_pix_fmt_vid_cap)(struct file *file, void *fh,
>> +					    struct v4l2_ext_pix_format *f);
>>  	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *fh,
>>  					struct v4l2_format *f);
>>  	int (*vidioc_s_fmt_vid_out)(struct file *file, void *fh,
>>  				    struct v4l2_format *f);
>> +	int (*vidioc_s_ext_pix_fmt_vid_out)(struct file *file, void *fh,
>> +					    struct v4l2_ext_pix_format *f);
>>  	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *fh,
>>  					    struct v4l2_format *f);
>>  	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *fh,
>> @@ -379,10 +403,14 @@ struct v4l2_ioctl_ops {
>>  	/* VIDIOC_TRY_FMT handlers */
>>  	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
>>  				      struct v4l2_format *f);
>> +	int (*vidioc_try_ext_pix_fmt_vid_cap)(struct file *file, void *fh,
>> +					      struct v4l2_ext_pix_format *f);
>>  	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *fh,
>>  					  struct v4l2_format *f);
>>  	int (*vidioc_try_fmt_vid_out)(struct file *file, void *fh,
>>  				      struct v4l2_format *f);
>> +	int (*vidioc_try_ext_pix_fmt_vid_out)(struct file *file, void *fh,
>> +					      struct v4l2_ext_pix_format *f);
>>  	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *fh,
>>  					     struct v4l2_format *f);
>>  	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *fh,
>> @@ -724,6 +752,12 @@ long int video_usercopy(struct file *file, unsigned int cmd,
>>  long int video_ioctl2(struct file *file,
>>  		      unsigned int cmd, unsigned long int arg);
>>  
>> +int v4l2_format_to_ext_pix_format(const struct v4l2_format *f,
>> +				  struct v4l2_ext_pix_format *e, bool strict);
>> +int v4l2_ext_pix_format_to_format(const struct v4l2_ext_pix_format *e,
>> +				  struct v4l2_format *f,
>> +				  bool mplane_cap, bool strict);
>> +
>>  /*
>>   * The user space interpretation of the 'v4l2_event' differs
>>   * based on the 'time_t' definition on 32-bit architectures, so
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index c7b70ff53bc1d..7123c6a4d9569 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -2254,6 +2254,58 @@ struct v4l2_pix_format_mplane {
>>  	__u8				reserved[7];
>>  } __attribute__ ((packed));
>>  
>> +/**
>> + * struct v4l2_plane_ext_pix_format - additional, per-plane format definition
>> + * @sizeimage:		maximum size in bytes required for data, for which
>> + *			this plane will be used.
>> + *			Should be set to zero for unused planes.
>> + * @bytesperline:	distance in bytes between the leftmost pixels in two
>> + *			adjacent lines
>> + * @reserved:		extra space reserved for future fields, must be set to 0
>> + */
>> +struct v4l2_plane_ext_pix_format {
> 
> nit: Maybe v4l2_ext_plane_pix_format, since the struct describes an
> ext variant of a plane_pix_format?

I'm removing this struct as mentioned below.

> 
>> +	__u32 sizeimage;
>> +	__u32 bytesperline;
>> +	__u32 reserved;
>> +};
> 
> Actually, this seems to be exactly the same as the existing
> v4l2_plane_pix_format, except actually having less reserved space. Could it
> make sense to just reuse the existing struct?

I think so, I'm removing this struct for the next version.

Regards,
Helen

> 
> Best regards,
> Tomasz
> 
