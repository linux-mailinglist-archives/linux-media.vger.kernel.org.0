Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8807144964
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 02:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728921AbgAVBjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 20:39:41 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35972 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728816AbgAVBjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 20:39:41 -0500
Received: by mail-pl1-f193.google.com with SMTP id a6so2184174plm.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 17:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GR5h1tt2wJy5kG2UEKPuOm//LxmTSWIE80O9BC6vjqA=;
        b=W333QISVONGD08j00/Y3QQwYv0ParIpCj6sdrKhnnuuTcSuDqKiL420+3RE+GuwwGs
         hnjJKbHvMWu8cZ1a4c2TBFaiQ994byvcG5nIQSz4JYvaVaVEnAeEaMGIUxblvg7naCbm
         aO+dVJLE9HoeG0xzjx6R0naDuqgvOiTEYRPbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GR5h1tt2wJy5kG2UEKPuOm//LxmTSWIE80O9BC6vjqA=;
        b=U3mRNu4YwKdnxXZC7k9n3+x3bK76TTors17TyZNxkw3sYMVq1JSA2HNTHEGGGOqaqr
         l5nzK8dXGsqrCpgej7kBWNkWECW7S5PredWagzsGDkm44RGjuT1XMWgPMBfpsyloSysG
         6Yj7Qo+aub3YyQcWB7BPNCrhWqy2ynHpkGgywjpIZH87gd6EEEGAdEpJzpR2Qo2/yvYy
         VbdIS2/uV6UmIfu3+a5TZEbkkL+InX1K7fjX+akO9P3w/z6Gb3IhQYDM0CvposqIa8Zm
         3Is3mrHALQjNvljm+yEUBrxI4nfd/Y4a0eQN6wZkHMwiMA8AancYtzoK9CZP9y3Bn7Id
         c+hg==
X-Gm-Message-State: APjAAAVpH8aUPnWXJ4yHqhjDxFmoitZ1GUO2JA+o53lbZanYk5bgdda4
        WrVI4MnZDw4wFKDPTx37AeqMJA==
X-Google-Smtp-Source: APXvYqz3f5+DfmqCYbZN/U5SqXNvv9ofxo48LEFi5s7hXjc+PcN/p7YpBg1Nbu6vnuOWYfKMlALv+g==
X-Received: by 2002:a17:902:6b4b:: with SMTP id g11mr8223389plt.26.1579657180827;
        Tue, 21 Jan 2020 17:39:40 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id w4sm666460pjt.23.2020.01.21.17.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 17:39:40 -0800 (PST)
Date:   Wed, 22 Jan 2020 10:39:37 +0900
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
Subject: Re: [RFC][PATCH 02/15] videobuf2: handle V4L2 buffer cache flags
Message-ID: <20200122013937.GC149602@google.com>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-3-senozhatsky@chromium.org>
 <ada2381c-2c1c-17c3-c190-48439ae1657a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ada2381c-2c1c-17c3-c190-48439ae1657a@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Sorry for the delayed.

On (20/01/10 11:24), Hans Verkuil wrote:
> On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> > Set video buffer cache management flags corresponding to V4L2 cache
> > flags.
> > 
> > Both ->prepare() and ->finish() cache management hints should be
> > passed during this stage (buffer preparation), because there is no
> > other way for user-space to skip ->finish() cache flush.
> > 
> > There are two possible alternative approaches:
> > - The first one is to move cache sync from ->finish() to dqbuf().
> >   But this breaks some drivers, that need to fix-up buffers before
> >   dequeueing them.
> > 
> > - The second one is to move ->finish() call from ->done() to dqbuf.
> 
> Please combine this patch with patch 13/15!

OK.

[..]
> >  }
> >  
> > +static void set_buffer_cache_hints(struct vb2_queue *q,
> > +				   struct vb2_buffer *vb,
> > +				   struct v4l2_buffer *b)
> > +{
> > +	vb->need_cache_sync_on_prepare = 1;
> > +
> > +	if (q->dma_dir != DMA_TO_DEVICE)
> 
> What should be done when dma_dir == DMA_BIDIRECTIONAL?

Well, ->need_cache_sync_on_prepare/->need_cache_sync_on_finish are set,
by default. If the queue supports user-space cache hints (driver has
set ->allow_cache_hints), then user-space can override cache behavior.
We probably cannot enforce any other behavior here. Am I missing
something?

> > +		vb->need_cache_sync_on_finish = 1;
> > +	else
> > +		vb->need_cache_sync_on_finish = 0;
> > +
> > +	if (!q->allow_cache_hints)
> > +		return;
> > +
> > +	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
> > +		vb->need_cache_sync_on_finish = 0;
> > +
> > +	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN)
> > +		vb->need_cache_sync_on_prepare = 0;
> > +}

	-ss
