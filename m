Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623EA3F03EB
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 14:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235627AbhHRMrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 08:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233634AbhHRMrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 08:47:20 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B129C061764
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 05:46:45 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id k29so3320208wrd.7
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 05:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uP7fJxLQ5TTQ8aYHYwLJ/kNb8CkLiwmQWgbmcKMOm0w=;
        b=PS2hT9t/9lt08j1dPeij1H4maeOQEorQjjXGvVlj3rdRK5EGB3LBdL6ZFc5ihgsxu6
         Raz3EniFUixp+J6NugUiY1vx8r7+9nC42cxjcI6WOR8VaONMTiKSM8toXdb/UC7G9576
         ozvIPU2VygZBZ9UvUWtEYcANJ4iW6Vtt9Cpmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uP7fJxLQ5TTQ8aYHYwLJ/kNb8CkLiwmQWgbmcKMOm0w=;
        b=ABxGLbRVlWYzjiifMWoTZiRAVwjZKOtzTP+Y+o68OvTinBEoJxV05mZyZjsSkrHMkv
         bqyrZTI8W4NK60kIXqCNV0XdXuWWY2wQE2ATBQDdS93W7VvqS+hgQHvPell6rXrhJM/W
         1594rMl+DI97mTjNvJVqouCBE76M1PtEZiIXfaO7lYgpphbTGIsb4yHfckvKWZynO/cR
         IM4SYh3mHtcgt6mS6z545w7mLpYjbS5jibU1ExcV/Q3a5sqgr800ZatcHYOy5ugDmyCo
         JxWPtLhdGMTegoX/vSuU3ohl1wPUSOZAnKXwrF0x+B5+Xz5sS4ckPK/jEylLSsgUTjad
         TPWA==
X-Gm-Message-State: AOAM5326igZGk/8EsYS5jngYfwk81IXJAUrrtzHvI0VHnfzt+M0KI9l/
        N9shiHPzjNAx07Kyo83NcCq/Zw==
X-Google-Smtp-Source: ABdhPJy9q41WJDBnQ045sdEUQOBByE6IbQCS+2X6AUgaQtPFfyt/n6ZzI0Dt7LogN6spZ356e/F0gg==
X-Received: by 2002:adf:e38a:: with SMTP id e10mr10315579wrm.213.1629290802572;
        Wed, 18 Aug 2021 05:46:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o7sm4916803wmc.46.2021.08.18.05.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 05:46:42 -0700 (PDT)
Date:   Wed, 18 Aug 2021 14:46:40 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     "Sa, Nuno" <Nuno.Sa@analog.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Rob Clark <rob@ti.com>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf: return -EINVAL if dmabuf object
 is NULL
Message-ID: <YR0BMCMFcwXLjNAe@phenom.ffwll.local>
References: <20210818115810.274084-1-nuno.sa@analog.com>
 <9a63b45f-6fec-6269-ae16-8604b08514de@amd.com>
 <SJ0PR03MB6359C318092E0CB99D28D85099FF9@SJ0PR03MB6359.namprd03.prod.outlook.com>
 <ed0bf7fd-de49-f94a-3eda-0c1fac50153a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed0bf7fd-de49-f94a-3eda-0c1fac50153a@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 02:31:34PM +0200, Christian König wrote:
> Am 18.08.21 um 14:17 schrieb Sa, Nuno:
> > > From: Christian König <christian.koenig@amd.com>
> > > Sent: Wednesday, August 18, 2021 2:10 PM
> > > To: Sa, Nuno <Nuno.Sa@analog.com>; linaro-mm-sig@lists.linaro.org;
> > > dri-devel@lists.freedesktop.org; linux-media@vger.kernel.org
> > > Cc: Rob Clark <rob@ti.com>; Sumit Semwal
> > > <sumit.semwal@linaro.org>
> > > Subject: Re: [PATCH] dma-buf: return -EINVAL if dmabuf object is
> > > NULL
> > > 
> > > [External]
> > > 
> > > To be honest I think the if(WARN_ON(!dmabuf)) return -EINVAL
> > > handling
> > > here is misleading in the first place.
> > > 
> > > Returning -EINVAL on a hard coding error is not good practice and
> > > should
> > > probably be removed from the DMA-buf subsystem in general.
> > Would you say to just return 0 then? I don't think that having the
> > dereference is also good..
> 
> No, just run into the dereference.
> 
> Passing NULL as the core object you are working on is a hard coding error
> and not something we should bubble up as recoverable error.
> 
> > I used -EINVAL to be coherent with the rest of the code.
> 
> I rather suggest to remove the check elsewhere as well.

It's a lot more complicated, and WARN_ON + bail out is rather
well-established code-pattern. There's been plenty of discussions in the
past that a BUG_ON is harmful since it makes debugging a major pain, e.g.

https://lore.kernel.org/lkml/CA+55aFwyNTLuZgOWMTRuabWobF27ygskuxvFd-P0n-3UNT=0Og@mail.gmail.com/

There's also a checkpatch check for this.

commit 9d3e3c705eb395528fd8f17208c87581b134da48
Author: Joe Perches <joe@perches.com>
Date:   Wed Sep 9 15:37:27 2015 -0700

    checkpatch: add warning on BUG/BUG_ON use

Anyone who is paranoid about security crashes their machine on any WARNING
anyway (like syzkaller does).

My rule of thumb is that if the WARN_ON + bail-out code is just an if
(WARN_ON()) return; then it's fine, if it's more then BUG_ON is the better
choice perhaps.

I think the worst choice is just removing all these checks, because a few
code reorgs later you might not Oops immediately afterwards anymore, and
then we'll merge potentially very busted new code. Which is no good.
-Daniel



> 
> Christian.
> 
> > 
> > - Nuno Sá
> > 
> > > Christian.
> > > 
> > > Am 18.08.21 um 13:58 schrieb Nuno Sá:
> > > > On top of warning about a NULL object, we also want to return with a
> > > > proper error code (as done in 'dma_buf_begin_cpu_access()').
> > > Otherwise,
> > > > we will get a NULL pointer dereference.
> > > > 
> > > > Fixes: fc13020e086b ("dma-buf: add support for kernel cpu access")
> > > > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > > > ---
> > > >    drivers/dma-buf/dma-buf.c | 3 ++-
> > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-
> > > buf.c
> > > > index 63d32261b63f..8ec7876dd523 100644
> > > > --- a/drivers/dma-buf/dma-buf.c
> > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > @@ -1231,7 +1231,8 @@ int dma_buf_end_cpu_access(struct
> > > dma_buf *dmabuf,
> > > >    {
> > > >    	int ret = 0;
> > > > 
> > > > -	WARN_ON(!dmabuf);
> > > > +	if (WARN_ON(!dmabuf))
> > > > +		return -EINVAL;
> > > > 
> > > >    	might_lock(&dmabuf->resv->lock.base);
> > > > 
> 
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
