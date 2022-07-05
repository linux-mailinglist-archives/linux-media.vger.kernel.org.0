Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273D05672DE
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 17:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbiGEPmG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 11:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbiGEPmE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 11:42:04 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660C31A3AA
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 08:41:59 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id 126so12270225vsq.13
        for <linux-media@vger.kernel.org>; Tue, 05 Jul 2022 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aOSlQwGHqHMk9jCb7FPi1YVKKmzo7IkyF9AxYI+HMwc=;
        b=lEWYc0FJmy7xsUlF/XqFFqDpLao+GFseZKedmcnA0vAJuySut4DrLfOe39xKBsH1ri
         cK/6c74WRGCa3t8DbnHiI6xGbwa1T7IpbQxrR1hwxOeWrVxeGu+CB2uMFg9dEGmkPUHX
         Zpwm384wCGRHWdyWYJKrwfDI3MZbjFrMQfroX4F2tGKFRSCquCWo5/i4s9GisyD7zcnM
         FVmZPZDlDOJqvuWlo1CSqfb+c5XpXSCMWnCeiQvSfs/LtubdJ40SLsSn5KiUB9vIdOet
         IMMVfLLV/3InoUMEisC63P1q55YiKizx0nlc+GPDEBtLHxB2YMrasGSgGJVCVZZOO+mA
         7xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aOSlQwGHqHMk9jCb7FPi1YVKKmzo7IkyF9AxYI+HMwc=;
        b=R9rT1aDXypXCADBsjC31GnHeiIKZa/6OQ39hws3o67hw7X29Y4dm1Qx5rgBfguXPNA
         ils5QXt+es+GY/OHCysPui4IP4PvxuZ2CoZoEqb1WYmUX7e2ZtaEAhfSjvJtnqW8sQzQ
         ithmS3F10+h8DBL4nwOAHso44VdEBESz1Kox19FJGIzVO0hqSmcL9RRT2oViV1HI5e/g
         G3L/Lgo4uipa8cc+z9NzTUjcdT3UkIyBy9iYlGVepNlOZ+yKWDWHsaXILokKIl2ds/Nk
         GeH5aqs4Nal+kqZtUPQLV2QzS9QCApK5SH+omxWTIDR8pryvFNjAapL7eSW3X8k28ant
         TKWw==
X-Gm-Message-State: AJIora/ZpNgcL27yrRxKx9H7f+rV/QWViTAJvtJ2jl6g/xd8miekgu26
        ciIJHKqIIqMDnfz/WlVGth91zA==
X-Google-Smtp-Source: AGRyM1um77GB4FnVI9AhmpdjQZMc0MTu0qqLKDXNb5ztuNGuTH/WhZIyDFVsPgWlx34rbCdsVJ0Dpw==
X-Received: by 2002:a05:6102:3ec7:b0:356:cbdf:122d with SMTP id n7-20020a0561023ec700b00356cbdf122dmr5234167vsv.9.1657035718331;
        Tue, 05 Jul 2022 08:41:58 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id m11-20020a1fa30b000000b0036fbf614bb3sm6234190vke.19.2022.07.05.08.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 08:41:57 -0700 (PDT)
Date:   Tue, 5 Jul 2022 12:41:51 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com
Subject: Re: [PATCH v10 10/17] media: uapi: Move parsed HEVC pixel format out
 of staging
Message-ID: <YsRbv7VLqYFSNIJA@eze-laptop>
References: <20220705085420.272912-1-benjamin.gaignard@collabora.com>
 <20220705085420.272912-11-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705085420.272912-11-benjamin.gaignard@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 05, 2022 at 10:54:13AM +0200, Benjamin Gaignard wrote:
> Move HEVC pixel format since we are ready to stabilize the uAPI
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 5 -----
>  include/media/hevc-ctrls.h                                  | 3 ---
>  include/uapi/linux/videodev2.h                              | 1 +
>  3 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index 967fc803ef94..c352d91a73d8 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -215,11 +215,6 @@ Compressed Formats
>  	See the :ref:`associated Codec Control IDs <v4l2-mpeg-hevc>`.
>  	Buffers associated with this pixel format must contain the appropriate
>  	number of macroblocks to decode a full corresponding frame.
> -
> -	.. note::
> -
> -	   This format is not yet part of the public kernel API and it
> -	   is expected to change.
>      * .. _V4L2-PIX-FMT-FWHT:
>  
>        - ``V4L2_PIX_FMT_FWHT``
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index 341fc795d550..a372c184689e 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -13,9 +13,6 @@
>  
>  #include <linux/videodev2.h>
>  
> -/* The pixel format isn't stable at the moment and will likely be renamed. */
> -#define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
> -
>  #define V4L2_CID_STATELESS_HEVC_SPS		(V4L2_CID_CODEC_BASE + 1008)
>  #define V4L2_CID_STATELESS_HEVC_PPS		(V4L2_CID_CODEC_BASE + 1009)
>  #define V4L2_CID_STATELESS_HEVC_SLICE_PARAMS	(V4L2_CID_CODEC_BASE + 1010)
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9018aa984db3..37f9f23a67fe 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -712,6 +712,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
>  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
>  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
> +#define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
>  
>  /*  Vendor-specific formats   */
>  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
> -- 
> 2.32.0
> 
