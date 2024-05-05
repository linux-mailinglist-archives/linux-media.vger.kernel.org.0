Return-Path: <linux-media+bounces-10808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C638BC3C3
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 22:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C1BA1C21115
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 20:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AE0757F3;
	Sun,  5 May 2024 20:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gXctGvFK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD423A28D
	for <linux-media@vger.kernel.org>; Sun,  5 May 2024 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714942450; cv=none; b=mu49rwiOPsrgTW07rc4LBBum426RNm7AGRPO+2Ha8u6P3T1tStc0Z1L0tOYldi+kch+V7TPn8j6580sUjpMSRuGeEsVt2pyy3ul7FaPCXI5ihrLHasAgmEnq+ux39w9nSm1/WHaPU+OCDRRffhO20+Xf7TTAQVTFjaF+RtXWu34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714942450; c=relaxed/simple;
	bh=R+qvYyLMsL0XW6ld3jDTzisj//rKgA9vvCmBe+m5ItU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KjWxMTMgw9C3qGovX3mBOzdtobsoWQHuEBxX0qrnJtzeJyUovTrQtzCj64NmfpjganXiV8myEmTdPhuqllGlJ1SIrgCQLpJzPaw12vDAn/qYwEeHmA+PmcqbO7gJaSkAmm0j+v3y6OPzlxJGSi4poVV9crHw9qaAxkYxvy79X0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gXctGvFK; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59a64db066so284168266b.3
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 13:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714942446; x=1715547246; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JMg+wUi7Jg85TzG1l7LAOtzS/OMsOgVla4IG61dTMc8=;
        b=gXctGvFKXFbzc8bOL7b6DUDuHMlQja0fgxiE/wEhh8hgOR56PbJDqI7WqyGKKieLne
         FjU+oLh9i3EcomwLBRkMLdmCjJ8dxyECyWgHNXXVxinlmHyKlQEMirvI3KJIOneB4TYA
         ukvX192FIBo2YfYG8PLayteHC2LQmnjPak0QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714942446; x=1715547246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JMg+wUi7Jg85TzG1l7LAOtzS/OMsOgVla4IG61dTMc8=;
        b=FC07MiYjfcSr+0Xg6fFcz5yIM9gfGHE0U14qQZJWlYekSGqI+VPqmVxQsHE3R2/tED
         tMJPSRIZmr9sk2W59qdCnpS2NlsSdvmcyr3yb/URMLKeqb8qkgStVaZoVo0prvQFGZCv
         bnesnd1nT+uEpxyVlYrU7sJzwle7UgfQkc5CMWhtlJ+oVsR+GOK1WgBpUpNjG9R1RCCV
         LyRHQPHILfjLDB7BcpFz4hbYGLtmWYIaG3EAoqja9RvLmZSdZbuAmqqf27oEmpruGbJP
         UZ1zqjZOUYQvJYzrFBSlaBRBhgtPNYtJ9sAQbdB4CAo8I/DpCr+GKRC6OIxis/28gqUb
         v1jg==
X-Forwarded-Encrypted: i=1; AJvYcCWx5dqmbW8anRuPeSDkYc7jgyEA7EF3oSTMbaB7slFPTdADrXJh21+xaE4NtqBPwtHjJKLEhUmifqebc3SWVrZmEQmTKRZAuAvRY+I=
X-Gm-Message-State: AOJu0Yz0qsud2CqA4g/fVBMH8BPXcWSys8/xjHTPIL0dJ4T8SBXRK3F5
	vr9A3N20HQI85xU6X7ABzlwOpDADlAoZlReWRZGT2gi9+VgT7Qo593yy1Unv0t8XqQFDPwDQmjT
	1qdMQPw==
X-Google-Smtp-Source: AGHT+IGUXJR1DpFG/2nr3X1JOPnf51sGj4O0D+twNnIWTgrnOKrvQqb//HuCabZh+7Vnux2cotjylQ==
X-Received: by 2002:a17:906:3c07:b0:a59:a532:ed5b with SMTP id h7-20020a1709063c0700b00a59a532ed5bmr2919383ejg.50.1714942446463;
        Sun, 05 May 2024 13:54:06 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id w24-20020a17090652d800b00a59aa17f23fsm2050576ejn.203.2024.05.05.13.54.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 May 2024 13:54:06 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-34db6a29998so784166f8f.0
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 13:54:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGiYd128nKCzpZV+iH5cE9MewgF8MuiV7qG/KzpTT6Y5r6hbzbefNdNPfSigZipn6+jSzprMnLxk0MRMJysaHaZfgpBNe52iOE+8w=
X-Received: by 2002:a05:600c:314f:b0:416:88f9:f5ea with SMTP id
 h15-20020a05600c314f00b0041688f9f5eamr6455233wmo.34.1714942445499; Sun, 05
 May 2024 13:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook> <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV> <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner> <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
 <CAHk-=whrSSNYVzTHNFDNGag_xcKuv=RaQUX8+n29kkic39DRuQ@mail.gmail.com>
 <20240505194603.GH2118490@ZenIV> <CAHk-=wipanX2KYbWvO5=5Zv9O3r8kA-tqBid0g3mLTCt_wt8OA@mail.gmail.com>
 <20240505203052.GJ2118490@ZenIV>
In-Reply-To: <20240505203052.GJ2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 May 2024 13:53:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=whFg8-WyMbVUGW5c0baurGzqmRtzFLoU-gxtRXq2nVZ+w@mail.gmail.com>
Message-ID: <CAHk-=whFg8-WyMbVUGW5c0baurGzqmRtzFLoU-gxtRXq2nVZ+w@mail.gmail.com>
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, keescook@chromium.org, axboe@kernel.dk, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 May 2024 at 13:30, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> 0.      special-cased ->f_count rule for ->poll() is a wart and it's
> better to get rid of it.
>
> 1.      fs/eventpoll.c is a steaming pile of shit and I'd be glad to see
> git rm taken to it.  Short of that, by all means, let's grab reference
> in there around the call of vfs_poll() (see (0)).

Agreed on 0/1.

> 2.      having ->poll() instances grab extra references to file passed
> to them is not something that should be encouraged; there's a plenty
> of potential problems, and "caller has it pinned, so we are fine with
> grabbing extra refs" is nowhere near enough to eliminate those.

So it's not clear why you hate it so much, since those extra
references are totally normal in all the other VFS paths.

I mean, they are perhaps not the *common* case, but we have a lot of
random get_file() calls sprinkled around in various places when you
end up passing a file descriptor off to some asynchronous operation
thing.

Yeah, I think most of them tend to be special operations (eg the tty
TIOCCONS ioctl to redirect the console), but it's not like vfs_ioctl()
is *that* different from vfs_poll. Different operation, not somehow
"one is more special than the other".

cachefiles and backing-file does it for regular IO, and drop it at IO
completion - not that different from what dma-buf does. It's in
->read_iter() rather than ->poll(), but again: different operations,
but not "one of them is somehow fundamentally different".

> 3.      dma-buf uses of get_file() are probably safe (epoll shite aside),
> but they do look fishy.  That has nothing to do with epoll.

Now, what dma-buf basically seems to do is to avoid ref-counting its
own fundamental data structure, and replaces that by refcounting the
'struct file' that *points* to it instead.

And it is a bit odd, but it actually makes some amount of sense,
because then what it passes around is that file pointer (and it allows
passing it around from user space *as* that file).

And honestly, if you look at why it then needs to add its refcount to
it all, it actually makes sense.  dma-bufs have this notion of
"fences" that are basically completion points for the asynchronous
DMA. Doing a "poll()" operation will add a note to the fence to get
that wakeup when it's done.

And yes, logically it takes a ref to the "struct dma_buf", but because
of how the lifetime of the dma_buf is associated with the lifetime of
the 'struct file', that then turns into taking a ref on the file.

Unusual? Yes. But not illogical. Not obviously broken. Tying the
lifetime of the dma_buf to the lifetime of a file that is passed along
makes _sense_ for that use.

I'm sure dma-bufs could add another level of refcounting on the
'struct dma_buf' itself, and not make it be 1:1 with the file, but
it's not clear to me what the advantage would really be, or why it
would be wrong to re-use a refcount that is already there.

                 Linus

