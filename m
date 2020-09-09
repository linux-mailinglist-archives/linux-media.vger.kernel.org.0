Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A927262E08
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 13:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729824AbgIILml (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 07:42:41 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:36005 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728709AbgIILmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 07:42:14 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id FyTjkidmrXgwIFyTlkZIq7; Wed, 09 Sep 2020 13:41:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599651695; bh=t3nBPHAPbCW5CVT8PmiIHhtDrxm+7LqfL0hFVYdvpmI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Wc1XdlPY3CUSUNVGoAWyXWVzBBWlMrY9QrDaD7ZPqTvPQMrtOuSSUmy/1UJOZkys6
         btsCGG8+JNYdkmb0DTb+ltrBUW2UOInpykoJdIItAOjEjMa+9DjI/P3P49R6DMr7IP
         lZZMp8dDpRhCHBXwrcsIR65EPOfBHP3bwzLvI/qigG6+8L0Qve2CXXMgp5ZIsYcCPY
         A0bJZYgCV+1inTt9l3Krw/hGKwmzHVU2DsoHdtU3oJn3AAWdeA4jxGvR4aa6L8Iico
         wynzGpdOBBwEL6xn8t3ctbxH9Y/bPa7+KB2ZE+5KZWSToQyBQAQe0keVA5ioubzVIU
         saysxB8IMhumA==
Subject: Re: [PATCH v5 1/7] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
To:     Helen Koike <helen.koike@collabora.com>, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        tfiga@chromium.org, hiroh@chromium.org, nicolas@ndufresne.ca,
        Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, mjourdan@baylibre.com,
        stanimir.varbanov@linaro.org
References: <20200804192939.2251988-1-helen.koike@collabora.com>
 <20200804192939.2251988-2-helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <767d6287-bd9c-b342-d14c-124e58c143e6@xs4all.nl>
Date:   Wed, 9 Sep 2020 13:41:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804192939.2251988-2-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNIHLJxvWIYVsfcjX2GrJmKIFrV8ZC/OeuHmlr3ml5L7r1/92XJ88orCUpht6dxvkW6GQHpYJqRP+DfaOzh4DDWErH/qy/QxgTS3VngIVja8BQDJx8CW
 zuCuz+CibuBFxPIRTJN2m4wkX0p6nLRVqxC/nAS1z9p408j1yV+4DAqxMpA1dtoDwDicmukG3ikFpgQmZzZFM82YPREbxiRV9ZdLB1Xb7npUcLshQyJmTMNa
 9+Oo6fQqK2HMt7BXFO/5NX+KkwNPmXH275avIrNSonORMbR1SdOJ4imbM3qKTauyRMFCW3jvzli+EA022VgdNoNBUaouzdWqMD68nAqi1W58s+/k6U9e2abo
 Pqv7pjv/Ek4CDIh4keiLJLZCdpGMW45VjIvKxUpTLXd257cqnxYqKCCvY8AEYsuUD363VUoyxREP+uoZAy1KfUSb/4uyHmoNByqIISiriQqL42LKiPfG13z9
 80HAAV1N1D7KeJMmHrqy2W7KBGGNuSQOy1J/1Z0Ske/+UI/SMAvsboDkEy1qtYV+nsjg9HBSmQ2O1FlqFj/k/kZoXesWXh6g9lzDl6sePmRBmSSOyWKt20kx
 vYCPwx6bFXIctfHP4yh5K2cC25j9EQ2XWQpWe+/8CdLbqacXQ75+BiMEzbY2ZLpb3SzoYw7e4ibhw3xap8Pd6YqLEQax6K+DZM/74BAm2XyNA7J0yQ6hmNqj
 aItSMWX2tv5rJy6FxTbLUUHmizAAR+1sLazWR+X53aZrODL16RfdGVcvpoI7xYHa2gDUbNpcZ35ZPaKeJFG8Ub6BS2IsIM/ZV6FHREwJCi/fmZdGr//Osg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Some review comments, concentrating on the uAPI.

On 04/08/2020 21:29, Helen Koike wrote:
> This is part of the multiplanar and singleplanar unification process.
> v4l2_ext_pix_format is supposed to work for both cases.
> 
> We also add the concept of modifiers already employed in DRM to expose
> HW-specific formats (like tiled or compressed formats) and allow
> exchanging this information with the DRM subsystem in a consistent way.
> 
> Note that only V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] are accepted in
> v4l2_ext_format, other types will be rejected if you use the
> {G,S,TRY}_EXT_PIX_FMT ioctls.
> 
> New hooks have been added to v4l2_ioctl_ops to support those new ioctls
> in drivers, but, in the meantime, the core takes care of converting
> {S,G,TRY}_EXT_PIX_FMT requests into {S,G,TRY}_FMT so that old drivers can
> still work if the userspace app/lib uses the new ioctls.
> The conversion is also done the other around to allow userspace
> apps/libs using {S,G,TRY}_FMT to work with drivers implementing the
> _ext_ hooks.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> Changes in v5:
> - change sizes and reorder fields to avoid holes in the struct and make
>   it the same for 32 and 64 bits
> - removed __attribute__ ((packed)) from uapi structs
> - Fix doc warning from make htmldocs
> - Updated commit message with EXT_PIX prefix for the ioctls.
> 
> Changes in v4:
> - Use v4l2_ext_pix_format directly in the ioctl, drop v4l2_ext_format,
> making V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] the only valid types.
> - Add reserved fields
> - Removed num_planes from struct v4l2_ext_pix_format
> - Removed flag field from struct v4l2_ext_pix_format, since the only
>   defined value is V4L2_PIX_FMT_FLAG_PREMUL_ALPHA only used by vsp1,
>   where we can use modifiers, or add it back later through the reserved
>   bits.
> - In v4l2_ext_format_to_format(), check if modifier is != MOD_LINEAR &&
>   != MOD_INVALID
> - Fix type assignment in v4l_g_fmt_ext_pix()
> - Rebased on top of media/master (post 5.8-rc1)
> 
> Changes in v3:
> - Rebased on top of media/master (post 5.4-rc1)
> 
> Changes in v2:
> - Move the modifier in v4l2_ext_format (was formerly placed in
>   v4l2_ext_plane)
> - Fix a few bugs in the converters and add a strict parameter to
>   allow conversion of uninitialized/mis-initialized objects
> ---
>  drivers/media/v4l2-core/v4l2-dev.c   |  21 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c | 585 +++++++++++++++++++++++----
>  include/media/v4l2-ioctl.h           |  34 ++
>  include/uapi/linux/videodev2.h       |  56 +++
>  4 files changed, 615 insertions(+), 81 deletions(-)
> 

<snip>

> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c7b70ff53bc1d..7123c6a4d9569 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2254,6 +2254,58 @@ struct v4l2_pix_format_mplane {
>  	__u8				reserved[7];
>  } __attribute__ ((packed));
>  
> +/**
> + * struct v4l2_plane_ext_pix_format - additional, per-plane format definition
> + * @sizeimage:		maximum size in bytes required for data, for which
> + *			this plane will be used.
> + *			Should be set to zero for unused planes.
> + * @bytesperline:	distance in bytes between the leftmost pixels in two
> + *			adjacent lines
> + * @reserved:		extra space reserved for future fields, must be set to 0
> + */
> +struct v4l2_plane_ext_pix_format {
> +	__u32 sizeimage;
> +	__u32 bytesperline;
> +	__u32 reserved;

I'd use reserved[4] here.

> +};
> +
> +/**
> + * struct v4l2_ext_pix_format - extended single/multiplanar format definition
> + * @type:		type of the data stream; V4L2_BUF_TYPE_VIDEO_CAPTURE or
> + *			V4L2_BUF_TYPE_VIDEO_OUTPUT
> + * @width:		image width in pixels
> + * @height:		image height in pixels
> + * @field:		enum v4l2_field; field order (for interlaced video)
> + * @pixelformat:	little endian four character code (fourcc)
> + * @modifier:		modifier applied to the format (used for tiled formats
> + *			and other kind of HW-specific formats, like compressed
> + *			formats)

This should refer to the drm.h header since we're reusing the DRM modifiers.

> + * @colorspace:		enum v4l2_colorspace; supplemental to pixelformat
> + * @plane_fmt:		per-plane information
> + * @ycbcr_enc:		enum v4l2_ycbcr_encoding, Y'CbCr encoding
> + * @hsv_enc:		enum v4l2_hsv_encoding, HSV encoding
> + * @quantization:	enum v4l2_quantization, colorspace quantization
> + * @xfer_func:		enum v4l2_xfer_func, colorspace transfer function
> + * @reserved:		extra space reserved for future fields, must be set to 0
> + */
> +struct v4l2_ext_pix_format {
> +	__u32 type;
> +	__u32 width;
> +	__u32 height;
> +	__u32 field;
> +	__u64 modifier;
> +	__u32 pixelformat;
> +	__u32 colorspace;
> +	struct v4l2_plane_ext_pix_format plane_fmt[VIDEO_MAX_PLANES];
> +	union {
> +		__u32 ycbcr_enc;
> +		__u32 hsv_enc;
> +	};
> +	__u32 quantization;
> +	__u32 xfer_func;

I'd reorder this:

	struct v4l2_plane_ext_pix_format plane_fmt[VIDEO_MAX_PLANES];
	__u32 pixelformat;
	__u32 colorspace;
	__u32 xfer_func;
	union {
		__u32 ycbcr_enc;
		__u32 hsv_enc;
	};
	__u32 quantization;

The reason for reordering is that I like to keep the colorimetry fields in
that order since that is how these fields are processed mathematically: you
apply the colorspace matrix first, then the transfer function, then optionally
convert to Y'CbCr or HSV and finally you quantize the result.

There is also a __u32 flags; field missing (needed for V4L2_PIX_FMT_FLAG_PREMUL_ALPHA
and for the upcoming CSC support).

> +	__u32 reserved[9];
> +};
> +
>  /**
>   * struct v4l2_sdr_format - SDR format definition
>   * @pixelformat:	little endian four character code (fourcc)
> @@ -2571,6 +2623,10 @@ struct v4l2_create_buffers {
>  
>  #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
>  
> +#define VIDIOC_G_EXT_PIX_FMT	_IOWR('V', 104, struct v4l2_ext_pix_format)
> +#define VIDIOC_S_EXT_PIX_FMT	_IOWR('V', 105, struct v4l2_ext_pix_format)
> +#define VIDIOC_TRY_EXT_PIX_FMT	_IOWR('V', 106, struct v4l2_ext_pix_format)
> +
>  /* Reminder: when adding new ioctls please add support for them to
>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>  
> 

Regards,

	Hans
