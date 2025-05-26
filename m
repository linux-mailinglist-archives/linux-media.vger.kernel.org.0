Return-Path: <linux-media+bounces-33389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48713AC4021
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 15:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09D6716C491
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A1F204098;
	Mon, 26 May 2025 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IF0w6fa8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9187202C58
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265417; cv=none; b=tMv1IHMAtoFZQqf9mEXhp2pfDhIgKss0G4G9QZl3zNC9Jw0VsZZvKJ7/KgZj4oHZgPWpKMYez8lEJGGxAnHXCptgRugdihs4RLTxdClxHHPcbvOh9cKt1wZcyPnVaC/fVzA1fLgCqSBUBO7quuf6pOh6te3AKntKUz0VSSyEJys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265417; c=relaxed/simple;
	bh=4q0q6NEZFzc9IfGMB7XeTs+/9d8mRRN8STC5JzS8Sdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZjEQ+ydBXU1OAEKzhcCmWZzL7AfZ0U3F9BUfiM00AnLWjepdWP5vlSFFIwdzBSMuhqzhiH2WjU0yduUWI5E9uyzELgOwWgzu4rL2DWodSJLZkBzvX0JMEMBXrPkqfO7M0ID9g6IF94ta0Ggd43tD7YfzDIqi/pfgigsgaeEPj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IF0w6fa8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748265413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GARNqGrj9Hq8FoX/S5BWp84kmJS3AdiiZew3Eo4GW38=;
	b=IF0w6fa8+tSk5ZAqvXu6g1Ye6DtNqbdJC+1IPH3ptyEsPfgZMe13AnH9+APr+HuMEv+N3g
	oNMMUD19mhfHnwE3yYwbUjRyXvv96KoBprafWzifWEMlKCYbwS4oTLApNklxbh2xoZLbDM
	QWl88ZFeHeC6sY76+sWC21/S0FpzChE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-CH0li16zON6g2ojJ0OmrBQ-1; Mon, 26 May 2025 09:16:52 -0400
X-MC-Unique: CH0li16zON6g2ojJ0OmrBQ-1
X-Mimecast-MFC-AGG-ID: CH0li16zON6g2ojJ0OmrBQ_1748265411
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acbbb00099eso205350966b.2
        for <linux-media@vger.kernel.org>; Mon, 26 May 2025 06:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748265411; x=1748870211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GARNqGrj9Hq8FoX/S5BWp84kmJS3AdiiZew3Eo4GW38=;
        b=si8dPR/i9RZSjM7349WwQ3J4pi6qeNQSaZMl/4Q2M8tq8+A3Or9C+mq4wLg7fp+MN3
         kL6xAE4PYNd78h8Ab88pJ0PICgHRQZ8QzeYH6bJ9C4352sjza2XTUW5HJ6pxW0FNq6by
         35vdEXjHRriWR9F3TJ7G6G8fkaaiVYRxSqp8e5jDu9Jdt3kd+yqjptkBIMHKW2i2T7Gr
         OfIxV6Ec21tnIYhomN5kXh51iAoKETemn+wDGvHdwo6v9CtU8NeKgDm/bJUHXcxxTPVU
         YUIQB7EHHXlkTC8AlkuYoHtpbRpJgHd+HrquDGaMK/fQNxxNXSHMupcYPdfr98eFaW5J
         JILA==
X-Gm-Message-State: AOJu0Yz7+AEbXbapuD/ve3xV1BrzJeII7prNq5vk3+Ldm2hDKdBpeV9P
	hyd3jV1RgQxcirQTmtYSicidBh0UNofaFaLSKTrY+ut9JiQ6VJxIJg0htrEcSx7nVIQVtKTx/hN
	5lp7GwaF14dVb2OEo1dI53K1SvNk3QA+ZJnU7lZhXTbYFewpFPSjH7eOzmmH+kS9U
X-Gm-Gg: ASbGncu5kkf582m1JvFbJHqgC7Otbcb4bftEQt9w3KRz91vIsd3pjH2SDU7pcysrbFu
	7Ix3dEQT4CSOpeLThjKjxkzsGX96npc/gWKqjar6dGdlHaA+xRKRUY6K08KkwM1Yu/HWIntQobZ
	3gm6fzwPI3NZpdZquUDQy2sI1pIY7ii2NK6yyYVHWBlPV1kjtnu6D5E1RVHYROL700RGFD83Sdr
	6lqA2q12VPgv2gkzJCaFWYXA9zxZMTGxPhvsOjARBK2p0mHE3pfNkRu4SUkJI727rzp2NUopVTe
	I5Q6SNDt0Bazlw4=
X-Received: by 2002:a17:906:f282:b0:ad6:9ea7:cb0a with SMTP id a640c23a62f3a-ad85b0507bemr483614566b.9.1748265411054;
        Mon, 26 May 2025 06:16:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvUeVhdV+Qz2GB6eUmtrEuoEqa8SpVQhDFfXK7oGmNH3seQLq34yXhMm8tjL5VLNDZq7atEA==
X-Received: by 2002:a17:906:f282:b0:ad6:9ea7:cb0a with SMTP id a640c23a62f3a-ad85b0507bemr483612866b.9.1748265410594;
        Mon, 26 May 2025 06:16:50 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6020e441c84sm9941815a12.38.2025.05.26.06.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:16:50 -0700 (PDT)
Message-ID: <f700298f-88c7-40a6-b800-3417311dfa39@redhat.com>
Date: Mon, 26 May 2025 15:16:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-3-f79974fc2d20@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250404-uvc-meta-v5-3-f79974fc2d20@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Apr-25 08:37, Ricardo Ribalda wrote:
> The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> V4L2_META_FMT_D4XX. The only difference between the two of them is that
> V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> V4L2_META_FMT_D4XX copies the whole metadata section.
> 
> Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> devices, but it is useful to have the whole metadata section for any
> device where vendors include other metadata, such as the one described by
> Microsoft:
> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> 
> This patch introduces a new format V4L2_META_FMT_UVC_MSXU_1_5, that is
> identical to V4L2_META_FMT_D4XX.
> 
> For now, flag this format with a new quirk.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans




> ---
>  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
>  .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 ++++++++++++
>  MAINTAINERS                                        |  1 +
>  drivers/media/usb/uvc/uvc_metadata.c               | 43 +++++++++++++++++++---
>  drivers/media/usb/uvc/uvcvideo.h                   |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
>  include/uapi/linux/videodev2.h                     |  1 +
>  7 files changed, 65 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index 86ffb3bc8ade2e0c563dd84441572ecea1a571a6..4de0d094e0702068be0c59154458c9dfecbfe28d 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -19,6 +19,7 @@ These formats are used for the :ref:`metadata` interface only.
>      metafmt-pisp-fe
>      metafmt-rkisp1
>      metafmt-uvc
> +    metafmt-uvc-msxu-1-5
>      metafmt-vivid
>      metafmt-vsp1-hgo
>      metafmt-vsp1-hgt
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..e6f95a88c0ff061df0b066b12cefc30f946b60aa
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _v4l2-meta-fmt-uvc-msxu-1-5:
> +
> +***********************************
> +V4L2_META_FMT_UVC_MSXU_1_5 ('UVCM')
> +***********************************
> +
> +Microsoft(R)'s UVC Payload Metadata.
> +
> +
> +Description
> +===========
> +
> +V4L2_META_FMT_UVC_MSXU_1_5 buffers follow the metadata buffer layout of
> +V4L2_META_FMT_UVC with the only difference that it includes all the UVC
> +metadata, not just the first 2-12 bytes.
> +
> +For more details check the documentation from Microsoft(R) [1].
> +
> +.. _1:
> +
> +[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 306b1384eb6d4cb7a310ada44605eaeb88cc732f..a07ed31ab057b98cf801d919b5bbec5ee334c9ac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25059,6 +25059,7 @@ S:	Maintained
>  W:	http://www.ideasonboard.org/uvc/
>  T:	git git://linuxtv.org/media.git
>  F:	Documentation/userspace-api/media/drivers/uvcvideo.rst
> +F:	Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
>  F:	Documentation/userspace-api/media/v4l/metafmt-uvc.rst
>  F:	drivers/media/common/uvc.c
>  F:	drivers/media/usb/uvc/
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 82de7781f5b6b70c5ba16bcba9e0741231231904..fe2678fc795d7fd5a64e8113199012f34c419176 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -63,15 +63,21 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
>  	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>  	struct uvc_device *dev = stream->dev;
>  	struct v4l2_meta_format *fmt = &format->fmt.meta;
> -	u32 fmeta = fmt->dataformat;
> +	u32 fmeta;
> +
> +	if (fmt->dataformat == dev->info->meta_format)
> +		fmeta = dev->info->meta_format;
> +	else if (fmt->dataformat == V4L2_META_FMT_UVC_MSXU_1_5)
> +		fmeta = V4L2_META_FMT_UVC_MSXU_1_5;
> +	else
> +		fmeta = V4L2_META_FMT_UVC;
>  
>  	if (format->type != vfh->vdev->queue->type)
>  		return -EINVAL;
>  
>  	memset(fmt, 0, sizeof(*fmt));
>  
> -	fmt->dataformat = fmeta == dev->info->meta_format
> -			? fmeta : V4L2_META_FMT_UVC;
> +	fmt->dataformat = fmeta;
>  	fmt->buffersize = UVC_METADATA_BUF_SIZE;
>  
>  	return 0;
> @@ -106,6 +112,27 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
>  	return ret;
>  }
>  
> +static u32 uvc_meta_idx_to_fmeta(struct uvc_device *dev, u32 index)
> +{
> +	switch (index) {
> +	case 0:
> +		return V4L2_META_FMT_UVC;
> +	case 1:
> +		if (dev->info->meta_format)
> +			return dev->info->meta_format;
> +		if (dev->quirks & UVC_QUIRK_MSXU_META)
> +			return V4L2_META_FMT_UVC_MSXU_1_5;
> +		return 0;
> +	case 2:
> +		if (dev->info->meta_format &&
> +		    dev->quirks & UVC_QUIRK_MSXU_META)
> +			return V4L2_META_FMT_UVC_MSXU_1_5;
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
>  static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
>  				      struct v4l2_fmtdesc *fdesc)
>  {
> @@ -113,16 +140,20 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
>  	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>  	struct uvc_device *dev = stream->dev;
>  	u32 index = fdesc->index;
> +	u32 fmeta;
> +
> +	if (fdesc->type != vfh->vdev->queue->type)
> +		return -EINVAL;
>  
> -	if (fdesc->type != vfh->vdev->queue->type ||
> -	    index > 1U || (index && !dev->info->meta_format))
> +	fmeta = uvc_meta_idx_to_fmeta(dev, fdesc->index);
> +	if (!fmeta)
>  		return -EINVAL;
>  
>  	memset(fdesc, 0, sizeof(*fdesc));
>  
>  	fdesc->type = vfh->vdev->queue->type;
>  	fdesc->index = index;
> -	fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
> +	fdesc->pixelformat = fmeta;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..123446683e22589f23b5228a00240e54f00ae6f1 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -77,6 +77,7 @@
>  #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
>  #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
> +#define UVC_QUIRK_MSXU_META		0x00040000
>  
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a16fb44c7246e35f3710306fde5dfc15329b4d95..12f1232e5ca3acdefede8f9751f9e7191eeae58b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1457,6 +1457,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
>  	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
>  	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
> +	case V4L2_META_FMT_UVC_MSXU_1_5:	descr = "UVC MSXU Metadata"; break;
>  	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
>  	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>  	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c8cb2796130f8d1b864d669267d2b31f73b839aa..0cf6885a5dc8752326bd10a893d5d09d47993c21 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -851,6 +851,7 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> +#define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
>  #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
>  
>  /* Vendor specific - used for RK_ISP1 camera sub-system */
> 


