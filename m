Return-Path: <linux-media+bounces-10724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C89EE8BB3E1
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 21:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E0522817CA
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 19:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE51C158A05;
	Fri,  3 May 2024 19:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L4+VQHRb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B86A13B593
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714764157; cv=none; b=XeaNDhn/niGcGurOYbSoymLGxQ1vs02jgJX9Ochao/foSi0Hp+E81SeyYW6e/dxRjlItOc72UG5BK5HKsrxcAxcSDpdVoxDc7LACXC4CZVKWKTtrVdLJZE8V+t3VqB4YFBKrNuAfUOF/Nf4elQ5v1h3VsCqW+loW+RerPtd5Ry8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714764157; c=relaxed/simple;
	bh=/vhkagdjY1ur0Ij8uFGW0Gbs4Yu9/HEVdIAwb5ROFig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3z5x0Ej6JwGbN9g5h1w5C3DpF+uM+NXiJa0PrDjJomp5kzzLmHGWEceXBGn7Knyri/HLTUl9UBhMoij6HEAECUM2OBCQyqLQEsFSNsLGVso7N3CO37vSoaBSubcqljFJt91yNQxfe5K4dq9WgsJEonaJnACMNEiqX9vlAww14A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L4+VQHRb; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f4551f2725so68196b3a.1
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 12:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714764155; x=1715368955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wZE9sdMty9EFGzepC01irLfs4hOfSOdCceQaPVz49U0=;
        b=L4+VQHRbi6irUEuHU3BtzQcHQAmioZnF00U6e1WONksvN7jXusfeSuc9HUwBjmWR8X
         sEpKR9R9Lfhyi6fgG8KcgAwoX6oE7KO94XWAVEDiCBzPNqEqGS0g9EOj607eFYCHaON4
         vBQ3x50+ZKkbTFk5w2N19Ct4/I2TCf5QvGfjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714764155; x=1715368955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZE9sdMty9EFGzepC01irLfs4hOfSOdCceQaPVz49U0=;
        b=K+3tp/NSmHUbm6nPPY+1nygagWSbqpe9jg8+Yzci/sowL7Ianp9gyG3wrmh23dgkJt
         KJXdkHGiDIRvl83LYt0Cm3FowlAXlV7obTIJYYJ+HT2D7enfcwnQSUMb2yqI7Ch2Wvkv
         IXJq7DZE19hD8+fcQv9rSriXamIEk9ARKbjVy1WvJz+ubnzRCl65zU+GNzWyRQq1I8wc
         OAPN5Uxc9mTa8i3IrEDbSSKdNBLXKotA13tdydhLVgFRPG8N1AimU5vNEWufl0gBOe+M
         3PyZOk82V07dHwkABx6LTTaIMex5WQ62bWiJRyXEhrkzcz3/UEa/49e1MGUV38wgy5dk
         KwGw==
X-Forwarded-Encrypted: i=1; AJvYcCXLRXvnykYoRGUK2jS4SRW8sxdWJ3v5xZ6x+fzL7RwTKY5aGaXgK8bX/pi2rCqeQLhwiLhPHrXgHa3pQL+oMr0qTILwIa6ANDjzfsQ=
X-Gm-Message-State: AOJu0YzpFcD5NB9VD8qooTACjUofj7S8xzo9Klxi0Xhqz6S9WTRyD+lw
	2Z22jU9G7Os+lvw/QZ8JPxJchiY2L2RWIvvinJDaraK8Kejgw3PjnEj6ANercQ==
X-Google-Smtp-Source: AGHT+IH/cnBf5AmDAraYkoF01FtIBT3d+Li+us/ROEA5peZIO3ZUwaNqrc+r9saLXIGgSIOvwv5RWw==
X-Received: by 2002:a05:6a00:801:b0:6ed:21d5:fc2c with SMTP id m1-20020a056a00080100b006ed21d5fc2cmr4136967pfk.26.1714764154703;
        Fri, 03 May 2024 12:22:34 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y29-20020aa79e1d000000b006ed59172d2fsm3415250pfq.87.2024.05.03.12.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 12:22:33 -0700 (PDT)
Date: Fri, 3 May 2024 12:22:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Bui Quang Minh <minhquangbui99@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>,
	io-uring@vger.kernel.org, jack@suse.cz,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, Laura Abbott <laura@labbott.name>
Subject: Re: get_file() unsafe under epoll (was Re: [syzbot] [fs?]
 [io-uring?] general protection fault in __ep_remove)
Message-ID: <202405031207.9D62DA4973@keescook>
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>

On Fri, May 03, 2024 at 12:49:11PM -0600, Jens Axboe wrote:
> On 5/3/24 12:26 PM, Kees Cook wrote:
> > Thanks for doing this analysis! I suspect at least a start of a fix
> > would be this:
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 8fe5aa67b167..15e8f74ee0f2 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -267,9 +267,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
> >  
> >  		if (events & EPOLLOUT) {
> >  			/* Paired with fput in dma_buf_poll_cb */
> > -			get_file(dmabuf->file);
> > -
> > -			if (!dma_buf_poll_add_cb(resv, true, dcb))
> > +			if (!atomic_long_inc_not_zero(&dmabuf->file) &&
> > +			    !dma_buf_poll_add_cb(resv, true, dcb))
> >  				/* No callback queued, wake up any other waiters */
> 
> Don't think this is sane at all. I'm assuming you meant:
> 
> 	atomic_long_inc_not_zero(&dmabuf->file->f_count);

Oops, yes, sorry. I was typed from memory instead of copy/paste.

> but won't fly as you're not under RCU in the first place. And what
> protects it from being long gone before you attempt this anyway? This is
> sane way to attempt to fix it, it's completely opposite of what sane ref
> handling should look like.
> 
> Not sure what the best fix is here, seems like dma-buf should hold an
> actual reference to the file upfront rather than just stash a pointer
> and then later _hope_ that it can just grab a reference. That seems
> pretty horrible, and the real source of the issue.

AFAICT, epoll just doesn't hold any references at all. It depends,
I think, on eventpoll_release() (really eventpoll_release_file())
synchronizing with epoll_wait() (but I don't see how this happens, and
the race seems to be against ep_item_poll() ...?)

I'm really confused about how eventpoll manages the lifetime of polled
fds.

> > Due to this issue I've proposed fixing get_file() to detect pathological states:
> > https://lore.kernel.org/lkml/20240502222252.work.690-kees@kernel.org/
> 
> I don't think this would catch this case, as the memory could just be
> garbage at this point.

It catches it just fine! :) I tested it against the published PoC.

And for cases where further allocations have progressed far enough to
corrupt the freed struct file and render the check pointless, nothing
different has happened than what happens today. At least now we have a
window to catch the situation across the time frame before it is both
reallocated _and_ the contents at the f_count offset gets changed to
non-zero.

-- 
Kees Cook

