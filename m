Return-Path: <linux-media+bounces-10870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4154A8BCE0F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 647D41C235B5
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 12:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163F53FE2A;
	Mon,  6 May 2024 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="FvBv2a8y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4811C6B9
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714999036; cv=none; b=XzCIfnnaG2ZSqQ/cfvkoNaaBT12rLUH+cp7lMcoyJLlBqpSs+xOEb3ew1JS0lcVKcGTtN2hhqAcBm/d0FBKWsA2w1jOdga1Oj0/L7NN7ygbnKDBHeLoCGo03pRmOUgrqs7NC9S1MUZXAMoFfS+IgdKWSYfk/Gpc/6/W5/Rhp9A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714999036; c=relaxed/simple;
	bh=W0ii3TeUy067aqvyqv+adtlSG49/aqc2GUx5qBI/NZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oM2oGAm/QRZyy3lY3dKp/F3Yve0eZMtmXewDaGGDchwrvpBIlByOCWFKib7SXFDR2SXoRGKCjZZgGOFTmzvVBBIcxduQAUbBy/IZ5b5eIlv2dfadXr/c4hvjL8+aRe01+4t8IdGh1qGIuKOHzFGltq/GpLoEVQJyvtfOGdfKyNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=FvBv2a8y; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4190c2ec557so2618565e9.0
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1714999033; x=1715603833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmNWteJIHVG/FsNg6lLCmILTCJBN+MkrWHLSaZrPJk4=;
        b=FvBv2a8y7KaPOzeWXOlRwnY4lH1/WLZlQfEApXgvbpTUi6F1uRXzYtzHLxd34xbg1u
         lzQ4L8SrSgf8fTvp0TUjJwrwNvxd5DfSFpaHbPJ0Vust7ey2Py3OgetloVHthlUVf9qR
         z3R54uLMsCTneHkdevvCARM3z2xfNRrIIF8DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714999033; x=1715603833;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmNWteJIHVG/FsNg6lLCmILTCJBN+MkrWHLSaZrPJk4=;
        b=fLRvYwONZpx29y0WZapBgOqGWGRky5/A+E9S+gkidDibVUuneGKC1bH0UCx238tpgT
         ijGcYME9hTZJ56Rt4mw1HQ5mCkwjOgc2AFdlqX0LUNjiNcaF8OHbR9GOCqpd4NU80ei1
         QBC5JRTU4EjvzMkBdggpvGPiTwZ5wJ5S0KT8LEtU3rkXawPfvHb2hpJ96dfzbHPJ1SEq
         ugj9+YPPcqsrNUtNZtrUc2sEPvSrYlu4CNsU2aZ2qAugdVKgACTnzNrl+SWaaqhR0mkb
         usVtIU4Y+nffEoaSng+IOzNkAVYdnp9/sSmjfmHRWFCPTRGefHDS/AmE7cnXa5whc5oR
         aFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbSKCQE91Owyt9QRXlKuC2deolkHY3fkGqqUoxK927xT4nof21b3Q8mZSiiELWrHZnUBRl/Qp4AYGBK85MTUQkptaUSLRozcxsYwc=
X-Gm-Message-State: AOJu0YxEpTBBLhZuFOm3HvPQehhIEcqswAxyeUwWLxCNvv2noUN/N9Db
	lIeZBL672gJPSIj2JdgGSB1BWDriEZD402psu3R4Xf4zPueVCz5Rqssgp623VcU=
X-Google-Smtp-Source: AGHT+IF4oVKBpTMWMqUQ/dzQ+O/7RQpt5fMGVwZ3eSkPNG4BC5o71WjeNR+MccKjqHnTIbg2KzBZFg==
X-Received: by 2002:a05:600c:1d25:b0:418:ef65:4b11 with SMTP id l37-20020a05600c1d2500b00418ef654b11mr7944219wms.2.1714999033407;
        Mon, 06 May 2024 05:37:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id je16-20020a05600c1f9000b0041c7ac6b0ffsm19767802wmb.37.2024.05.06.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 05:37:13 -0700 (PDT)
Date: Mon, 6 May 2024 14:37:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Al Viro <viro@zeniv.linux.org.uk>,
	axboe@kernel.dk, brauner@kernel.org, christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org,
	jack@suse.cz, laura@labbott.name, linaro-mm-sig@lists.linaro.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, minhquangbui99@gmail.com,
	sumit.semwal@linaro.org,
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
Message-ID: <ZjjO9kaRjT48Uyuc@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>,
	Al Viro <viro@zeniv.linux.org.uk>, axboe@kernel.dk,
	brauner@kernel.org, christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org,
	jack@suse.cz, laura@labbott.name, linaro-mm-sig@lists.linaro.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, minhquangbui99@gmail.com,
	sumit.semwal@linaro.org,
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV>
 <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
 <202405031529.2CD1BFED37@keescook>
 <20240503230318.GF2118490@ZenIV>
 <202405031616.793DF7EEE@keescook>
 <CAHk-=wjoXgm=j=vt9S2dcMk3Ws6Z8ukibrEncFZcxh5n77F6Dg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjoXgm=j=vt9S2dcMk3Ws6Z8ukibrEncFZcxh5n77F6Dg@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 

On Fri, May 03, 2024 at 04:41:19PM -0700, Linus Torvalds wrote:
> On Fri, 3 May 2024 at 16:23, Kees Cook <keescook@chromium.org> wrote:
> >
> > static bool __must_check get_dma_buf_unless_doomed(struct dma_buf *dmabuf)
> > {
> >         return atomic_long_inc_not_zero(&dmabuf->file->f_count) != 0L;
> > }
> >
> > If we end up adding epi_fget(), we'll have 2 cases of using
> > "atomic_long_inc_not_zero" for f_count. Do we need some kind of blessed
> > helper to live in file.h or something, with appropriate comments?
> 
> I wonder if we could try to abstract this out a bit more.
> 
> These games with non-ref-counted file structures *feel* a bit like the
> games we play with non-ref-counted (aka "stashed") 'struct dentry'
> that got fairly recently cleaned up with path_from_stashed() when both
> nsfs and pidfs started doing the same thing.
> 
> I'm not loving the TTM use of this thing, but at least the locking and
> logic feels a lot more straightforward (ie the
> atomic_long_inc_not_zero() here is clealy under the 'prime->mutex'
> lock

The one the vmgfx isn't really needed (I think at least), because all
other drivers that use gem or ttm use the dma_buf export cache in
drm/drm_prime.c, which is protected by a bog standard mutex.

vmwgfx is unfortunately special in a lot of ways due to somewhat parallel
dev history. So there might be an uapi reason why the weak reference is
required. I suspect because vmwgfx is reinventing a lot of its own wheels
it can't play the same tricks as gem_prime.c, which hooks into a few core
drm cleanup/release functions.

tldr; drm really has no architectural need for a get_file_unless_doomed,
and I certainly don't want to spread it it further than the vmwgfx
historical special case that was added in 2013.
-Sima

> IOW, the tty use looks correct to me, and it has fairly simple locking
> and is just catching the the race between 'fput()' decrementing the
> refcount and and 'file->f_op->release()' doing the actual release.
> 
> You are right that it's similar to the epoll thing in that sense, it
> just looks a _lot_ more straightforward to me (and, unlike epoll,
> doesn't look actively buggy right now).
> 
> Could we abstract out this kind of "stashed file pointer" so that we'd
> have a *common* form for this? Not just the inc_not_zero part, but the
> locking rule too?
> 
>               Linus

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

