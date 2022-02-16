Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11C604B89EA
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 14:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234290AbiBPN3F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 08:29:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234295AbiBPN3E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 08:29:04 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F761617E9
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 05:28:51 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id g24so1652680qkl.3
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 05:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wkPMino/gBaF2kiZB4kq/vnU9vzHQ5TpLc7MMKlYW/Y=;
        b=4/jG6/NieEFPeKDeOOk0THIEd57Is/dTW2pVW+LRle5bNJxsiZKHBBF84FV+KA5IzO
         l8O1dEeUNY8t7MpB2Rwu4xVvTDRh+jEM+JQba0hJZVr+nQY6E+qBGeeqAEoq988eekfw
         RE7O6+gEIT4IZAMjFfzJFy+9xk4OhazgFObOPnaXuEShFkO4xjH87snbJrePGFWc+cn0
         bwsPXyqUuWTuOZ8skXif8xH9ltRjtOcN/zkQBomPJHp2OFvdJmMOSdq29K0aFnNL6jUP
         tneHty5zJRSavwC4VeJRzfsayomSX6Jss1urf6o5/j+IZjfbxxPQsjvL+T5H9Asx/o6v
         3rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wkPMino/gBaF2kiZB4kq/vnU9vzHQ5TpLc7MMKlYW/Y=;
        b=UuUY6oB8dCOjMDV9ZOsyAOnlE1D5rV1XGJ564kQuaDRKQq3o2nVXoYeeuB6+tMAmz8
         S7JnWZiO2szNuENBmQJwQYl3wiW/WFnhngzeCim8pVZmttr03X3+ZEvZ0tUXjfw/D7Py
         u8qn5lbPnuwfljz0WRuyOmbySYst0YxovVn4SZbTaYFA62Fyb/Nddq+0fw/raaK2xRz0
         z5Lh5f+gWyVvrnhLMu/PQw9lv0OOXLd9eUlZHctwl0FRnRPynRXd7QjuNbSIKkYt5bpg
         1QllSbDTj66V76rMnBKtXmeaZ+vM+c+wRzQRdVzAvVkGgaH7ZTNUBNhq74PfCEgeRkxM
         VPAw==
X-Gm-Message-State: AOAM532quwxRu0tZ7b7T0ATm1fWt8ntfuBd5G+c21O847VybkX8jhxkf
        Ya7I7MuZ181g5SDnVjucnFGuyg==
X-Google-Smtp-Source: ABdhPJyGLvAsUNZCbV/ScVFx1wT2NdYnoIRk/iYeY92NtFSSBh3HDMbH1JtIq9zruFxX4NOppbxyzQ==
X-Received: by 2002:a37:a9d0:0:b0:4b2:e4c0:7ebb with SMTP id s199-20020a37a9d0000000b004b2e4c07ebbmr1208787qke.588.1645018130504;
        Wed, 16 Feb 2022 05:28:50 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id s11sm22063652qtk.82.2022.02.16.05.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 05:28:50 -0800 (PST)
Message-ID: <5684fa5b826bb89354be846ff4d698a97d693962.camel@ndufresne.ca>
Subject: Re: [PATCH 01/10] media: uapi: Add IPU3 packed Y10 format
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Date:   Wed, 16 Feb 2022 08:28:49 -0500
In-Reply-To: <20220215230737.1870630-2-djrscally@gmail.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
         <20220215230737.1870630-2-djrscally@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 15 février 2022 à 23:07 +0000, Daniel Scally a écrit :
> Some platforms with an Intel IPU3 have an IR sensor producing 10 bit
> greyscale format data that is transmitted over a CSI-2 bus to a CIO2
> device - this packs the data into 32 bytes per 25 pixels. Detail that
> format.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    | 14 +++++++++++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
>  include/uapi/linux/videodev2.h                     |  1 +
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index 8ebd58c3588f..5465ce3bb533 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -48,6 +48,17 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>  
> +    * .. _V4L2-PIX-FMT-IPU3-Y10:
> +
> +      - ``V4L2_PIX_FMT_IPU3_Y10``
> +      - 'ip3y'
> +
> +      - Y'\ :sub:`0`\ [7:0]
> +      - Y'\ :sub:`1`\ [5:0] Y'\ :sub:`0`\ [9:8]
> +      - Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [9:6]
> +      - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [9:4]
> +      - Y'\ :sub:`3`\ [9:2]
> +
>      * .. _V4L2-PIX-FMT-Y10:
>  
>        - ``V4L2_PIX_FMT_Y10``
> @@ -133,4 +144,5 @@ are often referred to as greyscale formats.
>  
>      For the Y16 and Y16_BE formats, the actual sampling precision may be lower
>      than 16 bits. For example, 10 bits per pixel uses values in the range 0 to
> -    1023.
> +    1023. For the ip3y format 25 pixels are packed into 32 bytes, which leaves

nit: ip3y-> IPU3_Y10, to be consistent with previous paragraph not using fourcc.

I don't have very strong preference, but this could have been sorted into vendor
formats, as its specific to a HW design, unlike MIPI which is a HW standard.

In any case, with the nit fixed, you can add my:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

cheers,
Nicolas

> +    the 6 most significant bits of the last byte padded with 0.
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 642cb90f457c..89691bbb372d 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1265,6 +1265,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
>  	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
>  	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
> +	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
>  	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index df8b9c486ba1..b378c7e37eac 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -569,6 +569,7 @@ struct v4l2_pix_format {
>  /* Grey bit-packed formats */
>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
> +#define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
>  
>  /* Palette formats */
>  #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */

