Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA892A3549
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 21:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgKBUkk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 15:40:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgKBUj2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 15:39:28 -0500
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F72C0617A6
        for <linux-media@vger.kernel.org>; Mon,  2 Nov 2020 12:39:28 -0800 (PST)
Received: by mail-qv1-xf43.google.com with SMTP id g13so6767227qvu.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2020 12:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=c0Os8/MKK/iOo/A1J0r/eH6ZLhJiFOEcbwWq89W7AXE=;
        b=m8VT9FKx9f3w1fFpSVCrru8oewK59jFb+7TvEoUhOILuIovU1MR0PlHmZZsbut0Z4t
         Mil0gt+2tt9Bdf0CPpFzhOWv+o3Kd3mqCI3ZhSDhUGvHP9me5A1sHqsdcBz8oQ8iiJwv
         DlwXqa34VtMLZhvI0djIWiKVEheyl0Fyrabs/7Fr9LkvCG2llT9rQr54HYFN2LuzM+JY
         cq5Ij34K2QdGhPCjQbFvK9giQw7cfMHPFvK0Jyk9B9b/fbG/QqA0WxoX2gUv12OVH3O3
         5vKN9HyDWd5D2DUaK+qEBafl1Bf2ZqbwDin30PjI+iJqh4dceYFW/sIT9pl/MdLAntmy
         QgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=c0Os8/MKK/iOo/A1J0r/eH6ZLhJiFOEcbwWq89W7AXE=;
        b=XIxKH4z1fxxuirIRAU3k9gSXy8QvV6ivOWeBtypIR4GxJR4fFoASfDUCneW4MHrsSd
         Vkc9HvuxwdIDwy+qJOHkvc0X4i6VCS7i2IOz4by1FjfKDn1mANjqiUAJ4U20wOe0I+dN
         buBENXfCcHeDDGxGvM1pmGdV5RU+k5qinei/vKcdItYv7twXsrd20xycOWo0XTfMzRFB
         axq8wjxtkslhGyR6ml7rD5yvZoHZRXxZaKTswwyuBtE+yNycMjaZob78/TvyPJpNHtVA
         6RqBO0sbdRT/Vn/QoJI+meZrK1VlzlKAveVYuMQAQJHuT5MlkFasZrr5kfU/f/mOKjWF
         BWyw==
X-Gm-Message-State: AOAM530cX+/0BIozB6TXZa50q7rxYzwqVj5dD0gzsYr6k8JMuu3cYYO1
        DlJjrbmPigdyyBA6GnkuU0iKnw==
X-Google-Smtp-Source: ABdhPJwjHAXyMhAxW6gD9ZOSXFirZObXLguCLbXm+nNQNR7WxSuAl55pg2NmNXMH7xFQL5ScqJZWcA==
X-Received: by 2002:a0c:f14b:: with SMTP id y11mr24365019qvl.35.1604349567500;
        Mon, 02 Nov 2020 12:39:27 -0800 (PST)
Received: from [192.168.43.1] (marriott-chateau-champlain-montreal.sites.intello.com. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id g191sm4688887qke.86.2020.11.02.12.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 12:39:26 -0800 (PST)
Message-ID: <62f00dd8b515a94af1e993ad4c3586628d3e2954.camel@ndufresne.ca>
Subject: Re: [PATCH/RFC 15/16] media: v4l2: Add 10-, 12- and 16-bpc 4:4:4
 packed VUY formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Date:   Mon, 02 Nov 2020 15:39:25 -0500
In-Reply-To: <20201101003811.GD4225@pendragon.ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
         <20200923024333.920-16-laurent.pinchart@ideasonboard.com>
         <9254388432492f46a38af8cfe5fb927f63e9e73b.camel@ndufresne.ca>
         <20201101003811.GD4225@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le dimanche 01 novembre 2020 à 02:38 +0200, Laurent Pinchart a écrit :
> Hi Nicolas,
> 
> On Thu, Sep 24, 2020 at 02:24:44PM -0400, Nicolas Dufresne wrote:
> > Le mercredi 23 septembre 2020 à 05:43 +0300, Laurent Pinchart a écrit :
> > > Add three new formats storing packed YUV 4:4:4 in 10-, 12- and 16-bpc
> > > variants, with component order VUY. They are used by the Xilinx Video
> > > Frame Buffer Read/Write IP cores.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  .../media/v4l/pixfmt-packed-yuv.rst           | 55 +++++++++++++++++++
> > >  include/uapi/linux/videodev2.h                |  3 +
> > >  2 files changed, 58 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> > > index 3c7c8e38b7b7..4753ee8c6b7d 100644
> > > --- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> > > @@ -264,6 +264,61 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
> > >        applications and drivers.
> > >  
> > > 
> > > 
> > > 
> > >  
> > > 
> > > 
> > > 
> > > +The next table lists the packed YUV 4:4:4 formats with more than 8 bits per
> > > +component. They are named similarly to the formats with less than 8 bits per
> > > +components, based on the order of the Y, Cb and Cr components as seen in a
> > > +word, which is then stored in memory in little endian byte order, and on the
> > > +number of bits for each component.
> > > +
> > > +.. flat-table:: Packed YUV Image Formats (more than 8bpc)
> > > +    :header-rows: 1
> > > +    :stub-columns: 0
> > > +
> > > +    * - Identifier
> > > +      - Code
> > > +      - Byte 0
> > > +      - Byte 1
> > > +      - Byte 2
> > > +      - Byte 3
> > > +      - Byte 4
> > > +      - Byte 5
> > > +
> > > +    * .. _V4L2-PIX-FMT-XVUY2101010:
> > > +
> > > +      - ``V4L2_PIX_FMT_XVUY2101010``
> > > +      - 'VY30'
> > > +
> > > +      - Y'\ :sub:`7-0`
> > > +      - Cb\ :sub:`5-0` Y'\ :sub:`9-8`
> > > +      - Cr\ :sub:`3-0` Cb\ :sub:`9-6`
> > > +      - `-`\ :sub:`1-0` Cr\ :sub:`9-4`
> > > +      -
> > > +
> > > +    * .. _V4L2-PIX-FMT-XVUY4121212:
> > > +
> > > +      - ``V4L2_PIX_FMT_XVUY4121212``
> > > +      - 'VY36'
> > > +
> > > +      - Y'\ :sub:`7-0`
> > > +      - Cb\ :sub:`3-0` Y'\ :sub:`11-8`
> > > +      - Cb\ :sub:`11-4`
> > > +      - Cr\ :sub:`7-0`
> > > +      - `-`\ :sub:`3-0` Cr\ :sub:`11-8`
> > > +      -
> > > +
> > > +    * .. _V4L2-PIX-FMT-VUY161616:
> > > +
> > > +      - ``V4L2_PIX_FMT_VUY161616``
> > > +      - 'VY40'
> > > +
> > > +      - Y'\ :sub:`7-0`
> > > +      - Y'\ :sub:`15-8`
> > > +      - Cb\ :sub:`7-0`
> > > +      - Cb\ :sub:`15-8`
> > > +      - Cr\ :sub:`7-0`
> > > +      - Cr\ :sub:`15-8`
> > > +
> > > +
> > >  4:2:2 Subsampling
> > >  =================
> > >  
> > > 
> > > 
> > > 
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > index 503a938ea98c..9b4cab651df7 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -605,6 +605,9 @@ struct v4l2_pix_format {
> > >  #define V4L2_PIX_FMT_YUVA32  v4l2_fourcc('Y', 'U', 'V', 'A') /* 32  YUVA-8-8-8-8  */
> > >  #define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
> > >  #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
> > > +#define V4L2_PIX_FMT_XVUY2101010 v4l2_fourcc('V', 'Y', '3', '0') /* 32  XVUY-2-10-10-10 */
> > > +#define V4L2_PIX_FMT_XVUY4121212 v4l2_fourcc('V', 'Y', '3', '6') /* 40  XVUY-4-12-12-12 */
> > > +#define V4L2_PIX_FMT_VUY161616 v4l2_fourcc('V', 'Y', '4', '8') /* 48  VUY-16-16-16 */
> > 
> > That is very hard to read. I'm fine with being more verbose, but I
> > think it would be nice if it remains human readable. A possible fix
> > could be:
> > 
> >   V4L2_PIX_FMT_XVUY_2_10_10_10
> 
> Hans has proposed an interleave naming scheme in the review of 13/16.
> This would become X2V10U10Y10. He also mentioned an alternative option
> that would match your proposal above. I don't have a strong preference.
> Can you and Hans agree on the best option ?

Not that I have a strong preference, they equally describe the format.

1. V4L2_PIX_FMT_X2V10U10Y10:

This is more compact and more likely to fit 80 to 100 chars when
coding.

2. V4L2_PIX_FMT_XVUY_2_10_10_10:

It splits the component order and leave the component size easy to
read. It is overall easier to identify on first read.

I read more code then I write, so my obvious preference would be 2.,
but I'm fine with any. 

> > Another approach is a bit-per-component and pixel size approach. That
> > one would be XYUV10_32. It is more cryptic, and you need more doc to
> > understand.
> > 
> > That brings me to endianness, I believe it does matter for these
> > unaligned component, so that should be documented (little).
> 
> That's already documented in
> Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst.

Ack.

> 
> > >  /* two planes -- one Y, one Cr + Cb interleaved  */
> > >  #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/CbCr 4:2:0  */
> 


