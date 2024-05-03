Return-Path: <linux-media+bounces-10737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 085908BB5C1
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 23:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0DC21F21DC6
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 21:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6AB53E16;
	Fri,  3 May 2024 21:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UfrckP5J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371A246441
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 21:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714771916; cv=none; b=pNtEKphz8mOTB2+s8sYykSP4vCnTpPoAxI5SmQHYYF6qiI7iKF2GHb41gzO0C96osCSwtoG37aw6Kr/d5RWXhRR8UfzXYe0/p8533pgZx8T/76Jtp/m0Iuf8Q/AsUzVd6906SHbvgj3pyJ1YQVHe86EXwtC+er9E/YZb29AaEoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714771916; c=relaxed/simple;
	bh=N4MV6W6kLCjF7hioiCGBWf5TZPj+wehXzH5NmRppkU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHe6tsYnQu8BOgN7UN3oVIornx8KcGDPGbSMTwHfLNNeIhxMUpEautQ+N0BNkjkB96ufEMaemDBwWmih791Czkz6AgwWqJ4EfHS94jgRIejNDRnIGM8QzBQoRwQl+qZOrSCi/L6pz+1vHHFJGcOGZNC6QptzaU3Xrgbc8WFuAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UfrckP5J; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59a0168c75so12579266b.1
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714771912; x=1715376712; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fhxz4aHpmXZJ6K0C5hNTESMtOJDx3oTLGnKkbndye9Q=;
        b=UfrckP5JjTxKYCViu4uF5IDvBlxcNMQD/yhYnEFbfbSmI8UIjftuWKaecOCsKINrNo
         rzf3tJODEyLjcd0GvvQP2VK9Xyrj+TNwUSPXRZSY+pTXULRTyM9Gr0LsjRv7DBg05Wdq
         T6LbRri0hRZ1WSz2b8U85V9xAQbr3TZrWeZe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714771912; x=1715376712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhxz4aHpmXZJ6K0C5hNTESMtOJDx3oTLGnKkbndye9Q=;
        b=dxsIYG0eunzlO5Tux2UGQWZRWCOgFlIcT2cMkLQ6fVa3sAv/awwW25S87Dewv23K4h
         UqKid5d28wo3OynxC6+7v8AhiS9Q+GdlUdt6Y6b/BO5axRotHj6XOZTUv1Vk0/o/Cv2H
         Suz4LHMJZRwuoCt8kGwB85rWinx1ond1IigeIgfWQzYqe7EkdeRYF8w+1Xcfl18cWS5X
         d8CD4vOUvbD8NeqyTUDhWP5hxj2q5L+y+dFPLYEh8yRSBjHCEixWRsdPrCBxuvjMV1Dw
         r7cEAGJnw0ncnBa8R2xaLU40ahzS0uS/cB7DDxp3QSXWC7lUpL7XS+hMKMcSURwwpVEP
         qm4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWj+Qo0cYZdt1ioi3qrvsDthAYRV0lnW4AYDqwt5GBc2IAN7c1IJREOCm5z7WRli12bRAzNtlMw8ijaXxiycs8I+O2wp1mI/70QD5w=
X-Gm-Message-State: AOJu0YxUEj9cH4Mi4cDy98ZQjrr50YSl9hr2iy2SDi3QBgQ86rX7cbsa
	psv+i0ns8Ozx4Ag7pfdCI/FcQn5be9Mmlm/MKNibmwhhAS2MpKcuq50RcGevNt/WO5kNY2AHHiq
	MxAdHKw==
X-Google-Smtp-Source: AGHT+IG8MPDlUW9qy58FJuCLzEA86eZsSt63bd2RU5np4fx/7N5jKVQ4cu9vMuO9JGNGXn3YVXSsnw==
X-Received: by 2002:a17:906:27d3:b0:a59:62f5:e81d with SMTP id k19-20020a17090627d300b00a5962f5e81dmr2689401ejc.48.1714771912285;
        Fri, 03 May 2024 14:31:52 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id l5-20020a1709061c4500b00a589ce6803asm2130130ejg.110.2024.05.03.14.31.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 14:31:51 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59a0168c75so12576366b.1
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 14:31:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWz8RZ2q1LKDZDBmACzkC0rsRiuMs9xDhZ4WjYog07xTtJ7T8PGO5CjnnHUBWLinVrIzNqtP6La9aD0eTpYVsJ0zlA48FfS1IGrNwc=
X-Received: by 2002:a19:381a:0:b0:51c:68a3:6f8e with SMTP id
 f26-20020a19381a000000b0051c68a36f8emr2449065lfa.31.1714771502428; Fri, 03
 May 2024 14:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0000000000002d631f0615918f1e@google.com> <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook> <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook> <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
 <202405031237.B6B8379@keescook> <202405031325.B8979870B@keescook> <20240503211109.GX2118490@ZenIV>
In-Reply-To: <20240503211109.GX2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 14:24:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0de-P2Q=Gz2uyrWBHagT25arLbN0Lyg=U6fT7psKnQA@mail.gmail.com>
Message-ID: <CAHk-=wj0de-P2Q=Gz2uyrWBHagT25arLbN0Lyg=U6fT7psKnQA@mail.gmail.com>
Subject: Re: get_file() unsafe under epoll (was Re: [syzbot] [fs?] [io-uring?]
 general protection fault in __ep_remove)
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Kees Cook <keescook@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
	Bui Quang Minh <minhquangbui99@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>, 
	io-uring@vger.kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, Laura Abbott <laura@labbott.name>
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 May 2024 at 14:11, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> What we need is
>         * promise that ep_item_poll() won't happen after eventpoll_release_file().
> AFAICS, we do have that.
>         * ->poll() not playing silly buggers.

No. That is not enough at all.

Because even with perfectly normal "->poll()", and even with the
ep_item_poll() happening *before* eventpoll_release_file(), you have
this trivial race:

  ep_item_poll()
     ->poll()

and *between* those two operations, another CPU does "close()", and
that causes eventpoll_release_file() to be called, and now f_count
goes down to zero while ->poll() is running.

So you do need to increment the file count around the ->poll() call, I feel.

Or, alternatively, you'd need to serialize with
eventpoll_release_file(), but that would need to be some sleeping lock
held over the ->poll() call.

> As it is, dma_buf ->poll() is very suspicious regardless of that
> mess - it can grab reference to file for unspecified interval.

I think that's actually much preferable to what epoll does, which is
to keep using files without having reference counts to them (and then
relying on magically not racing with eventpoll_release_file().

                Linus

