Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D19A2A355D
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 21:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgKBUqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 15:46:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgKBUpt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 15:45:49 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BE6C0617A6
        for <linux-media@vger.kernel.org>; Mon,  2 Nov 2020 12:45:49 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id z6so12798510qkz.4
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2020 12:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=UoB2zYS41tbOTBuzTtSm4D0uBlQt6ECw7bpXO11FMis=;
        b=hY1yDuKzyQWC2OBVmY65fvx74DMQ6OOlH3NMsgbOLHWeb/D1JlzVhmSL71SZ6s3jNY
         66SVkyBLLVmqgo6xIuC9lyw4pZ3JwqmXV9YuVopWHOYz2y3l4qmuzZ0glRAi8IQPMK3a
         bQMfnfgNtV/Wa6bgzUXn1gQHqum+xmfLghlqGTF75M0lGsKoCW0gAFyie76NV4kAtZZg
         eWAqg3O33pWOkC+E/UvJR4TEmRmPXgNyOqGMBUujpfkNyVm4X7YdrktaeaPc2izRNNsQ
         5nlhXxvhHZFqXMH3F29hwuzKMvGbVp7/0YHgf0Bg5AbFze9O1wouWEHk8wolnQ27rDc4
         DFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UoB2zYS41tbOTBuzTtSm4D0uBlQt6ECw7bpXO11FMis=;
        b=H7ivAPl8ZNhfle2+IS2zwaCP0CeXct9C98MiD/wlijiPP/plnuSni/aQltnXRWFu3F
         4Wu8voVxiJr6uk3X0EqtKI/iEVgX6mtXh+Xi455Euol00+V8aoLcgP19LC7zTzTIMpcp
         kzlVyp53tPonA3WEhLv1SEUWomISNPJYBos4Wy5/QMWXJzfL2ZTYbQc1nrtxZK5+Z6fx
         IXCrZ5EGFrbxPi84XXUbhf8WQcgdlt8Lzxeed8QgF1/5oTJcoAbHH5z/Wz5/9mwRpQBi
         /z9Q/ISGVGGqya5FK+fGi384mkJy3J2876I5NnJmbLThrGJuUwXM6Y+sMaIqY2CwiHbO
         pIWg==
X-Gm-Message-State: AOAM532bffKv5+6/RAGjfElliuFpXkEEUFn6S80qzSQbXU4OQ5OiTa1O
        qEzgBtJbfS2Ex/i8iWqUYvb4sQ==
X-Google-Smtp-Source: ABdhPJxw1xliV+wn/gONjVJCM6+iB5RhDJ9ujc0U/BtanPThJdKpJyIKd5qcHy89KV1KRXvfcsL39w==
X-Received: by 2002:a37:e315:: with SMTP id y21mr16801353qki.194.1604349948441;
        Mon, 02 Nov 2020 12:45:48 -0800 (PST)
Received: from [192.168.43.1] (marriott-chateau-champlain-montreal.sites.intello.com. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id g3sm8869392qki.84.2020.11.02.12.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 12:45:47 -0800 (PST)
Message-ID: <69fef8aea686db4a6b69819e3630626313a0646a.camel@ndufresne.ca>
Subject: Re: [PATCH/RFC 16/16] media: v4l2: Add 10- and 12-bpc luma-only
 formats with linear packing
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Date:   Mon, 02 Nov 2020 15:45:46 -0500
In-Reply-To: <20201101004246.GE4225@pendragon.ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
         <20200923024333.920-17-laurent.pinchart@ideasonboard.com>
         <88b9d4edaac40c9a91d88db7c147c2debff79f5c.camel@ndufresne.ca>
         <20201101004246.GE4225@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le dimanche 01 novembre 2020 à 02:42 +0200, Laurent Pinchart a écrit :
> Hi Nicolas,
> 
> On Thu, Sep 24, 2020 at 02:27:58PM -0400, Nicolas Dufresne wrote:
> > Le mercredi 23 septembre 2020 à 05:43 +0300, Laurent Pinchart a écrit :
> > > Add two new formats storing luma only in 10- and 12-bpc variants, with
> > > linear packing. They are used by the Xilinx Video Frame Buffer
> > > Read/Write IP cores.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  .../media/v4l/pixfmt-yuv-luma.rst             | 23 +++++++++++++++++++
> > >  include/uapi/linux/videodev2.h                |  2 ++
> > >  2 files changed, 25 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > index b24947b52cf8..3e2a7af5ed67 100644
> > > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > @@ -24,6 +24,7 @@ are often referred to as greyscale formats.
> > >     - Y'\ :sub:`x`\ [9:2] denotes bits 9 to 2 of the Y' value for pixel at colum
> > >       `x`.
> > >     - `0` denotes padding bits set to 0.
> > > +   - `-` denotes padding bits with undefined values.
> > >  
> > > 
> > > 
> > > 
> > >  
> > > 
> > > 
> > > 
> > >  .. flat-table:: Luma-Only Image Formats
> > > @@ -82,6 +83,17 @@ are often referred to as greyscale formats.
> > >        - Y'\ :sub:`3`\ [9:2]
> > >        - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [1:0] Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [1:0]
> > >  
> > > 
> > > 
> > > 
> > > +    * .. _V4L2-PIX-FMT-Y10X:
> > 
> > That's interesting, you are using a different convention here. If I
> > refer to the XYUV_2101010 one, usign that convention instead would be
> > XY10X10V10. It's not much more readable, and you have to deduce the 2
> > bits, just like you have to deduce that X here is 6bits. Perhaps we can
> > find a compromises that makes it consistent ? YX_10_2 ?
> 
> I'm not sure to follow you. This is a greyscale format, it only stores
> the luma component, so XY10X10V10 doesn't match (and I assume you meant
> XY10U10V10).

I might have screwed up that comment ;-P I think what I wanted to say
is that the size of X is not descriptive in the name and perhaps it
should be. Y10X, where X is 6bit ?

> 
> > > +#
> > > +      - ``V4L2_PIX_FMT_Y10X``
> > > +      - 'Y10X'
> > > +
> > > +      - Y'\ :sub:`0`\ [7:0]
> > > +      - Y'\ :sub:`1`\ [5:0] Y'\ :sub:`0`\ [9:8]
> > > +      - Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [9:6]
> > > +      - `- -` Y'\ :sub:`2`\ [9:4]
> > > +      - ...
> > > +
> > >      * .. _V4L2-PIX-FMT-Y12:
> > >  
> > > 
> > > 
> > > 
> > >        - ``V4L2_PIX_FMT_Y12``
> > > @@ -93,6 +105,17 @@ are often referred to as greyscale formats.
> > >        - ...
> > >        - ...
> > >  
> > > 
> > > 
> > > 
> > > +    * .. _V4L2-PIX-FMT-Y12X:
> > > +
> > > +      - ``V4L2_PIX_FMT_Y12X``
> > > +      - 'Y12X'
> > > +
> > > +      - Y'\ :sub:`0`\ [7:0]
> > > +      - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [11:8]
> > > +      - Y'\ :sub:`1`\ [11:4]
> > > +      - Y'\ :sub:`2`\ [7:0]
> > > +      - `- - - -` Y'\ :sub:`2`\ [11:8]
> > > +
> > >      * .. _V4L2-PIX-FMT-Y14:
> > >  
> > > 
> > > 
> > > 
> > >        - ``V4L2_PIX_FMT_Y14``
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > index 9b4cab651df7..3d137a020cdb 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -579,6 +579,8 @@ struct v4l2_pix_format {
> > >  /* Grey bit-packed formats */
> > >  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
> > >  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
> > > +#define V4L2_PIX_FMT_Y10X    v4l2_fourcc('Y', '1', '0', 'X') /* 10  Greyscale, 3 pixels in 4 bytes */
> > > +#define V4L2_PIX_FMT_Y12X    v4l2_fourcc('Y', '1', '2', 'X') /* 12  Greyscale, 4 pixels in 5 bytes */
> > >  
> > > 
> > > 
> > > 
> > >  /* Palette formats */
> > >  #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
> > 
> 


