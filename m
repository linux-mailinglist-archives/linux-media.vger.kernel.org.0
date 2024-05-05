Return-Path: <linux-media+bounces-10791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B21D8BC290
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 18:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37CF4B20E5F
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 16:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C91D38F86;
	Sun,  5 May 2024 16:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Jh0m25dd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33FB1E507
	for <linux-media@vger.kernel.org>; Sun,  5 May 2024 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714927587; cv=none; b=e1b08RItA92f4sYlKwTa3h1q14b3G4Bs/UwNoy1d4ok8eVR4npreT7cqEIksqZFHYIV4j0kg0Lm+iHi1b0dMRSUct9AKjUPXKplCkben/mjbMmXpu7ruINYEXmFYmwdvDk9db2MJOOJrFQVBGl4LTkNSbbo5+bwWUIMtPKlQ8X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714927587; c=relaxed/simple;
	bh=CLhNByDrSyy3KlkeokG4swipYxw1p9LkQ6WM4wj072Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AWXaj1C0m5UW7huqL8SJpxO7pBnMo0QhC0NUuCR644mTn7azjwNkc0w91FERgEUbPf0uX4MW+QqcfzcIgE2XhujicwgfubFGLU8IF7AQje65lHWnhuHyovT/PPkyjUbou7ApCIL5zYJtsTYvcwVYxlX433ngWgTov83GlW81Hl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Jh0m25dd; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a59b81d087aso171536766b.3
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 09:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714927584; x=1715532384; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aYdtp3YANTth8Vi9S+yHKBJaPcPwhcLOgY9vMAI/QdY=;
        b=Jh0m25ddNdP2B2AMRer6g2SsW4aWlFV4wvbACB4nQ9lt2L9qHjX30wG6XAmXRJqb9b
         cnDKyodeqsI4AtByabWH8SPehOzuKTxu659W1aKn8zxvej/pit6U6xPJg7vIiRNCPxJT
         Pmhip1fNYVkrmjHVLDxwcOUHdbIpck4jh1lVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714927584; x=1715532384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYdtp3YANTth8Vi9S+yHKBJaPcPwhcLOgY9vMAI/QdY=;
        b=STXZKDU2rLPmHMQ7CKK+5lzAfAuwFYaBC6nBmYA2t5pyMH40EpHGbos/e8KjeK07ym
         BtsZGrGXFg1r9r1tge/AzwstPvMTJAGFxav/BUk0zxnKGR8L0r2LNldR1Fd/96Kr9ICv
         4SzwKxdLcT+Z5tRiq13+wCzVeUoXU8nw/3PkRKg0eRRlOEm15okDSOI0LihGqGlvkVVe
         a87nDVCeS+qbc+wyDeJrf5MMtWyIBWKVKuTi9QQtDZ1mXE4bnYma/F6cvvAHFREL//tN
         itqgFGr51Y+yM36KTywWERY7ItoQsvhc3mPhWK/X5P8K2b76x2JSNwfHQmaDw8z9PWSL
         yD6A==
X-Forwarded-Encrypted: i=1; AJvYcCWmu4EYes7SOzItdJFmN097LFOJ1pu8xGrikWmJGrpUB+MJdolQjmOK8IgZnKTkE1+u1usikP1iYyd39xKqPAoQN5mhB+BFtPY3eK0=
X-Gm-Message-State: AOJu0YzxFSGJQz/ZGhjG4OVjdhhtuT9m7tDYt1uhnuoSv7qLA+tMa2WB
	XQchN2odJzOPsKJ3cIsCwiFypMnVeQJDfCs/Xo4jvvnmfK3gzfSKDHteZNmzrn2ROVPk3qj3/k9
	IWvpqQw==
X-Google-Smtp-Source: AGHT+IFxNSPvmZEpZ5ZfnHrObDjVuJjOEYmsyost8yS6EIrcAignNvH+Bw6HwQyMjuILQtW2/DzUjg==
X-Received: by 2002:a17:906:c415:b0:a59:a977:a159 with SMTP id u21-20020a170906c41500b00a59a977a159mr3536455ejz.64.1714927584068;
        Sun, 05 May 2024 09:46:24 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id em19-20020a170907289300b00a59c2da005csm941801ejc.215.2024.05.05.09.46.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 May 2024 09:46:23 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a52223e004dso220761966b.2
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 09:46:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDdCI1UUq++Xl3ofYkToYMvs5G3iNZtLxPRo79J9h6Ve4L5I7iJVj4wtNNdqn8ub5AWuAFu0I5e1Gu+0sobFW/dtUfSw8MYQi7y8U=
X-Received: by 2002:a17:907:3f9a:b0:a59:c5c2:a31c with SMTP id
 hr26-20020a1709073f9a00b00a59c5c2a31cmr2077374ejc.33.1714927582181; Sun, 05
 May 2024 09:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook> <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV> <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner> <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com> <20240505-gelehnt-anfahren-8250b487da2c@brauner>
In-Reply-To: <20240505-gelehnt-anfahren-8250b487da2c@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 May 2024 09:46:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
Message-ID: <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, axboe@kernel.dk, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 May 2024 at 03:50, Christian Brauner <brauner@kernel.org> wrote:
>
> And I agree with you that for some instances it's valid to take another
> reference to a file from f_op->poll() but then they need to use
> get_file_active() imho and simply handle the case where f_count is zero.

I think this is

 (a) practically impossible to find (since most f_count updates are in
various random helpers)

 (b) not tenable in the first place, since *EVERYBODY* does a f_count
update as part of the bog-standard pollwait

So (b) means that the notion of "warn if somebody increments f_count
from zero" is broken to begin with - but it's doubly broken because it
wouldn't find anything *anyway*, since this never happens in any
normal situation.

And (a) means that any non-automatic finding of this is practically impossible.

> And we need to document that in Documentation/filesystems/file.rst or
> locking.rst.

WHY?

Why cannot you and Al just admit that the problem is in epoll. Always
has been, always will be.

The fact is, it's not dma-buf that is violating any rules. It's epoll.
It's calling out to random driver functions with a file pointer that
is no longer valid.

It really is that simple.

I don't see why you are arguing for "unknown number of drivers - we
know at least *one* - have to be fixed for a bug that is in epoll".

If it was *easy* to fix, and if it was *easy* to validate, then  sure.
But that just isn't the case.

In contrast, in epoll it's *trivial* to fix the one case where it does
a VFS call-out, and just say "you have to follow the rules".

So explain to me again why you want to mess up the driver interface
and everybody who has a '.poll()' function, and not just fix the ONE
clearly buggy piece of code.

Because dammit,. epoll is clearly buggy. It's not enough to say "the
file allocation isn't going away", and claim that that means that it's
not buggy - when the file IS NO LONGER VALID!

                      Linus

