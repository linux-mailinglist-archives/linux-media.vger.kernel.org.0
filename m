Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF487277877
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 20:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgIXSYs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 14:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727753AbgIXSYs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 14:24:48 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E4DC0613CE
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 11:24:47 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id c62so438113qke.1
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 11:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ZL8zXDR65hrMVCzlD69gphyxZqF0Jib8C6yXxRdNpNk=;
        b=Tzufw7P7j0k0UDyBf/wxd8pmx2xRjnzfNzRxzu13bWdoMxr3bVyEiraM+APni4/qDn
         Y7CmcpwlAXLYR6xgF6YqLDMlBOjatU973MvotjN68huXqnRkdMb8beNVmobeNeFGD1aI
         sZhlT2aOCbEO1aXWBRHvoSrTxYXvHvBxYu4y3hiq7ltWyP/27cQ8M+AfE6Nu1GoN24W3
         QY0R858eDzAftwpN/c60zBEkSviI1PI0VlNqiqmjeDd+Nqho5EuqnVw8Ip4qbu8cnNte
         crVAZV5o79pGGOEBg4wBnT1LcDfPyHGdT3kXAg9y+WLbSvsrw95EBQ4O3Q3jOlv+lTnP
         +pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZL8zXDR65hrMVCzlD69gphyxZqF0Jib8C6yXxRdNpNk=;
        b=cMaphgFMqUJQSaM12JKPJkzjD+PwEZBnRpfEpXxNJfFCi94fE7j/1bOFq8FJB3Md0z
         G6sK4vjvMnYPtqQL38x/zVLdiihJfPBt3dtyN6hEdaSbWLYh7FitiGU3bWPIhJxg3DQr
         pErWAW+KfG2Rmoxoj44c+sQ1IQ5kIzXyzyrv+P5R9jbI4ZXGSm1pGmzR7tSC41avh7Bp
         PP1no19oyZP12+0euHl7l5aZ4W+4QTYEf0Ok40mYkANoz6RBgZq9F5vJdyeX99aBfVog
         njq7hBEDuBCya42g/g/VPxAUsViHplIfWsZklG+CRL0tji6xymhexbZ2ykdCW4wrdBCh
         n7gg==
X-Gm-Message-State: AOAM533gu02zaRSfIluzLJiU0CTTIKSqjUZvvNR95+93kSITyCCwOIM4
        9UMAe43ZqkAUwGZuVEwAITtN1g==
X-Google-Smtp-Source: ABdhPJw6fBkv07DIPUD/1pPKsrBieeV5sJUo/DGqHAzd/OjbksySE7SApTAeAhTxKRM7i5qewvuopA==
X-Received: by 2002:a05:620a:897:: with SMTP id b23mr359322qka.501.1600971886871;
        Thu, 24 Sep 2020 11:24:46 -0700 (PDT)
Received: from skullcanyon (marriott-chateau-champlain-montreal.sites.intello.com. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id j11sm158472qko.111.2020.09.24.11.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 11:24:46 -0700 (PDT)
Message-ID: <9254388432492f46a38af8cfe5fb927f63e9e73b.camel@ndufresne.ca>
Subject: Re: [PATCH/RFC 15/16] media: v4l2: Add 10-, 12- and 16-bpc 4:4:4
 packed VUY formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Date:   Thu, 24 Sep 2020 14:24:44 -0400
In-Reply-To: <20200923024333.920-16-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
         <20200923024333.920-16-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 23 septembre 2020 à 05:43 +0300, Laurent Pinchart a écrit :
> Add three new formats storing packed YUV 4:4:4 in 10-, 12- and 16-bpc
> variants, with component order VUY. They are used by the Xilinx Video
> Frame Buffer Read/Write IP cores.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../media/v4l/pixfmt-packed-yuv.rst           | 55 +++++++++++++++++++
>  include/uapi/linux/videodev2.h                |  3 +
>  2 files changed, 58 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> index 3c7c8e38b7b7..4753ee8c6b7d 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> @@ -264,6 +264,61 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
>        applications and drivers.
>  
>  
> +The next table lists the packed YUV 4:4:4 formats with more than 8 bits per
> +component. They are named similarly to the formats with less than 8 bits per
> +components, based on the order of the Y, Cb and Cr components as seen in a
> +word, which is then stored in memory in little endian byte order, and on the
> +number of bits for each component.
> +
> +.. flat-table:: Packed YUV Image Formats (more than 8bpc)
> +    :header-rows: 1
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      - Byte 0
> +      - Byte 1
> +      - Byte 2
> +      - Byte 3
> +      - Byte 4
> +      - Byte 5
> +
> +    * .. _V4L2-PIX-FMT-XVUY2101010:
> +
> +      - ``V4L2_PIX_FMT_XVUY2101010``
> +      - 'VY30'
> +
> +      - Y'\ :sub:`7-0`
> +      - Cb\ :sub:`5-0` Y'\ :sub:`9-8`
> +      - Cr\ :sub:`3-0` Cb\ :sub:`9-6`
> +      - `-`\ :sub:`1-0` Cr\ :sub:`9-4`
> +      -
> +
> +    * .. _V4L2-PIX-FMT-XVUY4121212:
> +
> +      - ``V4L2_PIX_FMT_XVUY4121212``
> +      - 'VY36'
> +
> +      - Y'\ :sub:`7-0`
> +      - Cb\ :sub:`3-0` Y'\ :sub:`11-8`
> +      - Cb\ :sub:`11-4`
> +      - Cr\ :sub:`7-0`
> +      - `-`\ :sub:`3-0` Cr\ :sub:`11-8`
> +      -
> +
> +    * .. _V4L2-PIX-FMT-VUY161616:
> +
> +      - ``V4L2_PIX_FMT_VUY161616``
> +      - 'VY40'
> +
> +      - Y'\ :sub:`7-0`
> +      - Y'\ :sub:`15-8`
> +      - Cb\ :sub:`7-0`
> +      - Cb\ :sub:`15-8`
> +      - Cr\ :sub:`7-0`
> +      - Cr\ :sub:`15-8`
> +
> +
>  4:2:2 Subsampling
>  =================
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 503a938ea98c..9b4cab651df7 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -605,6 +605,9 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_YUVA32  v4l2_fourcc('Y', 'U', 'V', 'A') /* 32  YUVA-8-8-8-8  */
>  #define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
>  #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
> +#define V4L2_PIX_FMT_XVUY2101010 v4l2_fourcc('V', 'Y', '3', '0') /* 32  XVUY-2-10-10-10 */
> +#define V4L2_PIX_FMT_XVUY4121212 v4l2_fourcc('V', 'Y', '3', '6') /* 40  XVUY-4-12-12-12 */
> +#define V4L2_PIX_FMT_VUY161616 v4l2_fourcc('V', 'Y', '4', '8') /* 48  VUY-16-16-16 */

That is very hard to read. I'm fine with being more verbose, but I
think it would be nice if it remains human readable. A possible fix
could be:

  V4L2_PIX_FMT_XVUY_2_10_10_10

Another approach is a bit-per-component and pixel size approach. That
one would be XYUV10_32. It is more cryptic, and you need more doc to
understand.

That brings me to endianness, I believe it does matter for these
unaligned component, so that should be documented (little).

>  
>  /* two planes -- one Y, one Cr + Cb interleaved  */
>  #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/CbCr 4:2:0  */

