Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD30387E44
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 19:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350828AbhERRMo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 13:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350806AbhERRMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 13:12:43 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45703C06175F
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 10:11:24 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id i67so10002140qkc.4
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 10:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iPqJ4rkXQn06mM21ArGGycI7+JCS79l3ru8H2jra5YU=;
        b=UKnGA9lTCsfLMfy9rF6/nuUzaQ7MMpos3qjUC+/dYDGM8TEfssyfTpCWJMWvSzef6g
         eN4g4OFs8RSpu52DIprZysGaC/T0f/VVpH7MAvvX080A0pFM8zxHhBmDVnOqF2lglW/8
         2RQqA0LLmMYyAy2Mj4JKKwvdWMMZZ9bAEHlMxTD0lj09jfjubEunuTBaqsllk7tE9JBJ
         FH6CHDSthX7cjH64mJxmvfQOdO/oCneJ/TgyhiXhbVTl2jpM0ZHjSIc+Igdfe82pUE9t
         3hO8bCu6VKDnQton0y3d7VgVnMrAcclORdKfh9RLTlUariC32m/STql5LNZHjkOxdOsA
         H2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iPqJ4rkXQn06mM21ArGGycI7+JCS79l3ru8H2jra5YU=;
        b=SbA7A7hpwnJcYeS6djvPuUSNrQSwrJ+uXGafrthCbnVdeBaOh70hkvvow/ogl93DN1
         DyrpjZ9lnMymRHP4CsbLzHfF2YgnPh9yipp3SZetM88Qcv3TnVLSwZHOV8b0O9Cib8b0
         Pp7BVIVwL+sjqQXuQoHoyslCK7G+W9Z2DCW/R3ArhxBCYNKpsGRaZ+KMzUVz6u/XFA+3
         vkVomxGY7R9zN2wx2eBwneWWAhReojGNMBlV+3VVIZDWNHE5Q+KrE0AdBehRf5h1cG81
         qke/o7IXgtyoMOJmZREIQXa0N1GUW3/v51RV2+ZPLlS/IFfWtj+jsUCJkyc+HD83kdBL
         1CQg==
X-Gm-Message-State: AOAM531Yqae7cdyWJqi5oVxtEaw2H3lGWxGVGBI1WKoxx8/7HpBNP5v2
        OTJ2Y8phAIomkRxhP4zHyPlAUw==
X-Google-Smtp-Source: ABdhPJw7EB26ag0NDrx63WlHCWFBLNexsiApzEcSm1iW+fNn+EgEwx/LfYs5Eg5DqZ0OzWKWPKZ+8Q==
X-Received: by 2002:ae9:edcf:: with SMTP id c198mr6677532qkg.54.1621357883459;
        Tue, 18 May 2021 10:11:23 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id l65sm13182843qke.7.2021.05.18.10.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 10:11:22 -0700 (PDT)
Message-ID: <f1ebf16082af8a540e34d834d33a1f48bc267e91.camel@ndufresne.ca>
Subject: Re: [RFC/WIP 1/4] media: Add HEIC compressed pixel format
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Tue, 18 May 2021 13:11:22 -0400
In-Reply-To: <20210429132833.2802390-2-stanimir.varbanov@linaro.org>
References: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
         <20210429132833.2802390-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 29 avril 2021 à 16:28 +0300, Stanimir Varbanov a écrit :
> Add HEIC (High-Efficiency Image Container) pixel format. This an
> image container which use HEVC codec to encoded images.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../userspace-api/media/v4l/pixfmt-compressed.rst    | 12 ++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c                 |  1 +
>  include/uapi/linux/videodev2.h                       |  1 +
>  3 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index ba6c0c961204..246bff90dcac 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -186,6 +186,18 @@ Compressed Formats
>  	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
>  	then the decoder has no	requirements since it can parse all the
>  	information from the raw bytestream.
> +    * .. _V4L2-PIX-FMT-HEIC:
> +
> +      - ``V4L2_PIX_FMT_HEIC``
> +      - 'HEIC'
> +      - High Efficiency Image Container is an image container file format which
> +        uses HEVC encoding and it is a variant of HEIF (High Efficiency Image File)
> +        format.

Can you clarify, is it expected that an HEIF container be compatible or not ?
Assuming this exist. The HEIC being a brand name, and not really a standard
seems rather confusing. Is this is right name, or should you introduce HEIF with
variant control, similar to HEVC profile control.

Speaking of profile, does it inherit anything from HEVC ? So we need to set HEVC
pofile/level ? Is there some way's to affect the quality or is it the HEVC QP
controls ?

> 
> 
> +	The decoder expects one Access Unit per buffer.
> +	The encoder generates one Access Unit per buffer.
> +	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
> +	then the decoder has no	requirements since it can parse all the
> +	information from the raw bytestream.
>      * .. _V4L2-PIX-FMT-HEVC-SLICE:
>  
>        - ``V4L2_PIX_FMT_HEVC_SLICE``
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 31d1342e61e8..3a1b4c3a76c8 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1454,6 +1454,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
>  		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
>  		case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
> +		case V4L2_PIX_FMT_HEIC:		descr = "HEIC Image Format"; break;
>  		default:
>  			if (fmt->description[0])
>  				return;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 79dbde3bcf8d..2153b5c31d46 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -699,6 +699,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
>  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
>  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
> +#define V4L2_PIX_FMT_HEIC	v4l2_fourcc('H', 'E', 'I', 'C') /* HEIC HEVC image format */
>  
>  /*  Vendor-specific formats   */
>  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */


