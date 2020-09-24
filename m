Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362DA27787C
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 20:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbgIXS2C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 14:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728718AbgIXS2C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 14:28:02 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF30C0613CE
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 11:28:01 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id n10so3804337qtv.3
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=FPQLwIA0xnLR0FCLxpOejtG7J3Pz6L3ZqYQhEOaQ/3I=;
        b=pu9dxa94kRTSv2ECK7nJv9CpjhFvtR9TkZKY3elSNAa7YDJ7Wd4w1TC2wiUlLi6DFV
         0mn4bG3k5jpESqM0w3E5mncS4PoNVcNa85M08FZXXprknfTIc/z/l3SV2LfHIFYU+ett
         Hhc9H2X+850lS2AVvYQBH3oYUAarkKfc9/n9j6Jq5dPupdhlaTDdH6Tx5d1S5wHXKscF
         V97ppIrhj73atTYTd7WJkiyRk7fxPgYtntk9oQlSWWBHfBZOxrcrpZYhY8s9buCsGY9V
         ckDZ484E520O8uNk3jbM5qbKPkU3b5Ko5ae+7SQoMo0CNVH/RTmG5O4ay5F6Z479val9
         nszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FPQLwIA0xnLR0FCLxpOejtG7J3Pz6L3ZqYQhEOaQ/3I=;
        b=U2oIgn6DgQmQyhGhHSmy3l9S/zfK6/rsoWQAKtMeYKcKNSiDpYbFb9SjmE/Saaineh
         5ZB9cQVwfWttFuFk0rp+HiJjeNAeHP7T+ehByf08PLLisQAfuI0nZjEcZpLI6/A3Fvp+
         c381zSa6NtKt1N0mURuDnkdlaN/IqV9f1iiDxzPAUJfq5p1CEJsTsVgcSOMZji94LDuH
         iAKz4k5GV4tgKTN7TB8GmL4PlLtXu+ep1NaYgIrby5gtt0Na8bIvoj3jd2IeWEv0xChS
         yYbfaXtmiD55Jc0PtEWF7wnro5yXdgvjVvPNv1YdL1AmheS6SiSnr3lySFefCRdYrJex
         zEMg==
X-Gm-Message-State: AOAM533JDLIOJjvwALp1Njl1b2I2m8mVKgoHQO+UnwnBru6QDO+XMhrF
        O5yRQ2/5J2wN9jB0nFdWn2LJ5A==
X-Google-Smtp-Source: ABdhPJzl/cX+Ik2DU2i5Mkcx+FlWykRGwpdSKxRGaea+0E+BqXKjGm/oNyyF4mJew/dEI7MI017ifw==
X-Received: by 2002:ac8:7414:: with SMTP id p20mr472836qtq.128.1600972081042;
        Thu, 24 Sep 2020 11:28:01 -0700 (PDT)
Received: from skullcanyon (marriott-chateau-champlain-montreal.sites.intello.com. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id y7sm258195qtn.11.2020.09.24.11.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 11:28:00 -0700 (PDT)
Message-ID: <88b9d4edaac40c9a91d88db7c147c2debff79f5c.camel@ndufresne.ca>
Subject: Re: [PATCH/RFC 16/16] media: v4l2: Add 10- and 12-bpc luma-only
 formats with linear packing
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Date:   Thu, 24 Sep 2020 14:27:58 -0400
In-Reply-To: <20200923024333.920-17-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
         <20200923024333.920-17-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 23 septembre 2020 à 05:43 +0300, Laurent Pinchart a écrit :
> Add two new formats storing luma only in 10- and 12-bpc variants, with
> linear packing. They are used by the Xilinx Video Frame Buffer
> Read/Write IP cores.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../media/v4l/pixfmt-yuv-luma.rst             | 23 +++++++++++++++++++
>  include/uapi/linux/videodev2.h                |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index b24947b52cf8..3e2a7af5ed67 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -24,6 +24,7 @@ are often referred to as greyscale formats.
>     - Y'\ :sub:`x`\ [9:2] denotes bits 9 to 2 of the Y' value for pixel at colum
>       `x`.
>     - `0` denotes padding bits set to 0.
> +   - `-` denotes padding bits with undefined values.
>  
>  
>  .. flat-table:: Luma-Only Image Formats
> @@ -82,6 +83,17 @@ are often referred to as greyscale formats.
>        - Y'\ :sub:`3`\ [9:2]
>        - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [1:0] Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [1:0]
>  
> +    * .. _V4L2-PIX-FMT-Y10X:

That's interesting, you are using a different convention here. If I
refer to the XYUV_2101010 one, usign that convention instead would be
XY10X10V10. It's not much more readable, and you have to deduce the 2
bits, just like you have to deduce that X here is 6bits. Perhaps we can
find a compromises that makes it consistent ? YX_10_2 ?

> +
> +      - ``V4L2_PIX_FMT_Y10X``
> +      - 'Y10X'
> +
> +      - Y'\ :sub:`0`\ [7:0]
> +      - Y'\ :sub:`1`\ [5:0] Y'\ :sub:`0`\ [9:8]
> +      - Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [9:6]
> +      - `- -` Y'\ :sub:`2`\ [9:4]
> +      - ...
> +
>      * .. _V4L2-PIX-FMT-Y12:
>  
>        - ``V4L2_PIX_FMT_Y12``
> @@ -93,6 +105,17 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>  
> +    * .. _V4L2-PIX-FMT-Y12X:
> +
> +      - ``V4L2_PIX_FMT_Y12X``
> +      - 'Y12X'
> +
> +      - Y'\ :sub:`0`\ [7:0]
> +      - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [11:8]
> +      - Y'\ :sub:`1`\ [11:4]
> +      - Y'\ :sub:`2`\ [7:0]
> +      - `- - - -` Y'\ :sub:`2`\ [11:8]
> +
>      * .. _V4L2-PIX-FMT-Y14:
>  
>        - ``V4L2_PIX_FMT_Y14``
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9b4cab651df7..3d137a020cdb 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -579,6 +579,8 @@ struct v4l2_pix_format {
>  /* Grey bit-packed formats */
>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
> +#define V4L2_PIX_FMT_Y10X    v4l2_fourcc('Y', '1', '0', 'X') /* 10  Greyscale, 3 pixels in 4 bytes */
> +#define V4L2_PIX_FMT_Y12X    v4l2_fourcc('Y', '1', '2', 'X') /* 12  Greyscale, 4 pixels in 5 bytes */
>  
>  /* Palette formats */
>  #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */

