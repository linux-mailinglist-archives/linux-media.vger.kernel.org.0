Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF5D1449BB
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 03:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgAVCSI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 21:18:08 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33926 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgAVCSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 21:18:08 -0500
Received: by mail-pf1-f196.google.com with SMTP id i6so2522497pfc.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 18:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=enRG0ShwLXeGYHvObL4NGsrxBaYIwIDgQKM6w41JByw=;
        b=KdhuEslf2cFzSS+yxCwoePZczvah0zd5geGuKBIlFckjXudk84+yt7u6yx3+ShP8QK
         /IIGDER6QVUhsUhsWFeW2Ykq1CZYo94Cxt/+bx9C8Z0WXpn5bxxYTTaZ4ZorMF8a3MAi
         IW3xmTAtIY7bCz/CVBbqKnjHDyjTwXPHk79Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=enRG0ShwLXeGYHvObL4NGsrxBaYIwIDgQKM6w41JByw=;
        b=pwCTYcM/XX68ozzEB4ZVGPG8rc8hMWmKB5DZ42pv9dD8leJm3sE8eHoBgpltqSmUnk
         I4gzzbjiXXVOL1WRutptgcMy/ybpLEXfAuCIUK10trLyH1iFe3hmgpPRCwDQAH4fXhvB
         8FPuUhiJP1Qs2XM0KCg8m//fLYa1oFOGVbgCtAc8uIW2oj5VqwhOXXFZ8VvSAUw8knaV
         S8DeEQsBZLSVWaO0oqOmPnxVQDgcOQARl37KM/o8U0cA3QboBilFveCmEqX2q5I6zhVy
         uXSRz6H27eds8KaPJDDV7iEMxbFb5fIYShskhM9dN+1qX++Y3H+S0zt/AOUlg+nbcYLo
         s7lQ==
X-Gm-Message-State: APjAAAVDpt9KJ6NbC0AKNSARmsK9f7DdF166lSKH7sTu1OwUrmEjcjc7
        NVB4dldOssZEGwjp0wj9M+cTXg==
X-Google-Smtp-Source: APXvYqydmuvXAqP7l7jK2w+3M7dLweDiMhhrmUdUfaSSl6VUY70uwNrnkOdqwhzCJIbHXcU91vsaow==
X-Received: by 2002:a63:e201:: with SMTP id q1mr8430254pgh.441.1579659487867;
        Tue, 21 Jan 2020 18:18:07 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id 17sm45649020pfv.142.2020.01.21.18.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 18:18:07 -0800 (PST)
Date:   Wed, 22 Jan 2020 11:18:05 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 05/15] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT in REQBUFS
Message-ID: <20200122021805.GE149602@google.com>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-6-senozhatsky@chromium.org>
 <8d0c95c3-64a2-ec14-0ac2-204b0430b2b4@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d0c95c3-64a2-ec14-0ac2-204b0430b2b4@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/01/10 10:55), Hans Verkuil wrote:
> On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> > This patch lets user-space to request a non-consistent memory
> > allocation during REQBUFS ioctl call. We use one bit of a
> > ->reserved[1] member of struct v4l2_requestbuffers, which is
> > now renamed to ->flags.
> > 
> > There is just 1 four-byte reserved area in v4l2_requestbuffers
> > struct, therefore for backward compatibility ->reserved and
> > ->flags were put into anonymous union.
> > 
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > ---
> >  Documentation/media/uapi/v4l/vidioc-reqbufs.rst | 14 ++++++++++++--
> >  drivers/media/common/videobuf2/videobuf2-v4l2.c | 14 ++++++++++++--
> >  drivers/media/v4l2-core/v4l2-ioctl.c            |  3 ---
> >  include/uapi/linux/videodev2.h                  |  5 ++++-
> >  4 files changed, 28 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> > index d0c643db477a..9b69a61d9fd4 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> > @@ -112,10 +112,20 @@ aborting or finishing any DMA in progress, an implicit
> >  	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
> >  	free any previously allocated buffers, so this is typically something
> >  	that will be done at the start of the application.
> > -    * - __u32
> > +    * - union
> > +      - (anonymous)
> > +    * -
> > +      - __u32
> > +      - ``flags``\ [1]
> > +      - Specifies additional buffer management attributes. E.g. when
> > +        ``V4L2_FLAG_MEMORY_NON_CONSISTENT`` set vb2 backends may be allocated
> > +        in non-consistent memory.
> 
> This should link to the table with these memory flags, rather than
> effectively documenting V4L2_FLAG_MEMORY_NON_CONSISTENT again.

OK.

> You also probably meant "vb2 buffers" rather than "vb2 backends".

Thanks.

> 
> > +    * -
> > +      - __u32
> >        - ``reserved``\ [1]
> >        - A place holder for future extensions. Drivers and applications
> > -	must set the array to zero.
> > +	must set the array to zero, unless application wants to specify
> > +        buffer management ``flags``.
> 
> I think support for this flag should be signaled as a V4L2_BUF_CAP capability.
> If the capability is not set, then vb2 should set 'flags' to 0 to preserve the
> old 'Drivers and applications must set the array to zero' behavior.

The patch set adds V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS towards the end of the
series, I guess I can shuffle the patches and change the wording here.

> The documentation for 'reserved[1]' should be changed to something like:
> 
> 	Kept for backwards compatibility. Use ``flags`` instead.

OK.

	-ss
