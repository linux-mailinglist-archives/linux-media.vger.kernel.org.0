Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1794D0778
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 20:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245038AbiCGTTM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 14:19:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245036AbiCGTTK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 14:19:10 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6223312AD2
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 11:18:15 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id eq14so6897875qvb.3
        for <linux-media@vger.kernel.org>; Mon, 07 Mar 2022 11:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sERIlJ80kGDlaBPNFJxxdzIZBCQf4SAyfzDqvonZ1tQ=;
        b=39p1YBo9S2EtIe/aFBnghKSMXTKHzlHIcPZpQzBTgDB6Yk6lTLmlIQS9K+vECj+pT4
         zH8Dja7PJMisgYufpKZbnSIhdUNZi+98OX9J52oXPBCVD7zfubXSlwztVfn23MjVtDLv
         dQM/BkAn82x86VvKE5HPBafb8NOkbYc9Q3pnou5etQUAuN8E/UO81h1bjuQKoeYtMQGZ
         zqijeRZfWMZ578PEeE9t7emZu2P4OfWotqumSb1MUE+GGM6YFJej0EVAbkOCx5pua1Ku
         3GnnSDiCIkUvacU/ddgDs4l0RpghJ2wmc0Vutt1MmPARKNjsnlum1mZ4ix7hR5IcLIQQ
         mjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sERIlJ80kGDlaBPNFJxxdzIZBCQf4SAyfzDqvonZ1tQ=;
        b=PicIYwffRgJFSy3i5ZadE30orDjGmnR763N7rumUU11AEgJD4Vcza0rxs5OOHiGxKY
         P4wyxRmxtG8iSdB7hfC5idhM/4cUzKuQ4gCGCz48Q0FZQp8nLezalUUTlgv8FFI8cfUb
         SxgmLWOopNziw4X+sE3yot2AbLgHYj91ValF1v2jPU/3wbRQ8ox1/0lqSjap+yf25rXA
         ifWEEGOs3hI0Mu3ApVmxi12SgS9qn0ANaEmIw/JML+yoWNo97On1kMxiuDPW/SEUP40p
         YtAoVd4w7jbD0bL2eGULJr8brziJeuU3FnO9patMlmfGAK5e7L9Y2kG3l5bERq8feOSz
         /rJQ==
X-Gm-Message-State: AOAM530WWy207bH6i0YNfJaj+L4jCRRnE2AePNBo+tlui1AKg/Sj1RCw
        7H0dYX7Y+kgZg1z4A0en6X6uKw==
X-Google-Smtp-Source: ABdhPJzNuNkc6fSeuHXV2HECUlBBle/kRXxAGk2Hda7FVeMX6IW2Zts3RcUA+2ct9obe5OmDhdPLlg==
X-Received: by 2002:a0c:eb81:0:b0:42d:a99:b08c with SMTP id x1-20020a0ceb81000000b0042d0a99b08cmr9708593qvo.52.1646680694309;
        Mon, 07 Mar 2022 11:18:14 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id w7-20020a05620a148700b0067b1ee562edsm1950276qkj.100.2022.03.07.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 11:18:14 -0800 (PST)
Message-ID: <620c9407254e95baef247cc17fed24e5aa0b4e63.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: v4l: Add packed YUV 4:4:4 YUVA and YUVX
 pixel formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>
Date:   Mon, 07 Mar 2022 14:18:13 -0500
In-Reply-To: <20220307180342.10666-2-laurent.pinchart@ideasonboard.com>
References: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
         <20220307180342.10666-2-laurent.pinchart@ideasonboard.com>
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

Le lundi 07 mars 2022 à 20:03 +0200, Laurent Pinchart a écrit :
> The new YUVA and YUVX are permutations of the existing AYUV and XYUV
> formats. They are use by the NXP i.MX8 ISI hardware.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

These are pretty straightforward.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/v4l/pixfmt-packed-yuv.rst           | 20 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 ++
>  include/uapi/linux/videodev2.h                |  2 ++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> index 62bc2bb3f499..92394786251a 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> @@ -229,6 +229,26 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
>        - Y'\ :sub:`7-0`
>        - X\ :sub:`7-0`
>  
> +    * .. _V4L2-PIX-FMT-YUVA32:
> +
> +      - ``V4L2_PIX_FMT_YUVA32``
> +      - 'YUVA'
> +
> +      - Y'\ :sub:`7-0`
> +      - Cb\ :sub:`7-0`
> +      - Cr\ :sub:`7-0`
> +      - A\ :sub:`7-0`
> +
> +    * .. _V4L2-PIX-FMT-YUVX32:
> +
> +      - ``V4L2_PIX_FMT_YUVX32``
> +      - 'YUVX'
> +
> +      - Y'\ :sub:`7-0`
> +      - Cb\ :sub:`7-0`
> +      - Cr\ :sub:`7-0`
> +      - X\ :sub:`7-0`
> +
>      * .. _V4L2-PIX-FMT-YUV24:
>  
>        - ``V4L2_PIX_FMT_YUV24``
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index aeecaca3edba..ca3c7bd19d7e 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1290,6 +1290,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_VUYA32:	descr = "32-bit VUYA 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_VUYX32:	descr = "32-bit VUYX 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_YUVA32:	descr = "32-bit YUVA 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_YUVX32:	descr = "32-bit YUVX 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
>  	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
>  	case V4L2_PIX_FMT_HI240:	descr = "8-bit Dithered RGB (BTTV)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index df8b9c486ba1..16dcd9dd1a50 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -592,6 +592,8 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
>  #define V4L2_PIX_FMT_VUYA32  v4l2_fourcc('V', 'U', 'Y', 'A') /* 32  VUYA-8-8-8-8  */
>  #define V4L2_PIX_FMT_VUYX32  v4l2_fourcc('V', 'U', 'Y', 'X') /* 32  VUYX-8-8-8-8  */
> +#define V4L2_PIX_FMT_YUVA32  v4l2_fourcc('Y', 'U', 'V', 'A') /* 32  YUVA-8-8-8-8  */
> +#define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
>  #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
>  
>  /* two planes -- one Y, one Cr + Cb interleaved  */

