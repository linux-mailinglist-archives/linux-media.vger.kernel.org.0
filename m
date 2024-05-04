Return-Path: <linux-media+bounces-10767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2388BBCD9
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 17:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6C9BB203A9
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 15:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91AAB51037;
	Sat,  4 May 2024 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HWYpKkor"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5375341A80
	for <linux-media@vger.kernel.org>; Sat,  4 May 2024 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714837247; cv=none; b=r9tM27KWKFP1LLxAhhEkxYIZ4bQ9Czq1NCbswULxOtjpkfAQb0JUm9CPbRIr6bC00fNmB02FqUW3T4z34i2xOrOoE/VME60Xb52U/wQqFI2TEeYJZgGj9dn/fcfAS/il4NySKQfJdiOULHn/lP4bBZLRXNVS2x+nGpnDWY1ClNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714837247; c=relaxed/simple;
	bh=+wl7Si+XKc7WGkikTFO8826D1qbowNHEhUrycKotHDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BTu6Ijb6NMXCECu4M4rYlIo5CYw3/QOmurFi7YMDkkzsgkbKLGr+FcvZlb/YwWMp09PYuh0wQxikHPgSIzdA+vM2ihT/omPdqZtKE61MjXDOXD+4q1g5ZCVBSPLmGH2BSkHsY6jHgjyIali4iokCGq+11oFRVigcWL2ff1vpMf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HWYpKkor; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f2ebbd8a7so696636e87.2
        for <linux-media@vger.kernel.org>; Sat, 04 May 2024 08:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714837243; x=1715442043; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PFxw8P3AYgeC7IB6rTn+68WOAU10n6cRPv/6X7o+SOY=;
        b=HWYpKkor+X0OlBZ+pN69qc1p+9D286NR/kjb9Eut9WyLQcVKAOVM+kjWJolAyRIjnb
         EleZB/FacFvDmPO7B6sIPd5rt4NS4hLPAbwx/r0yyPImDmy+aY8X2i+CokrQrNVi9S9s
         PrkfUJUNyE7Febc1tcRFEVT+pa1I32u++fKWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714837243; x=1715442043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFxw8P3AYgeC7IB6rTn+68WOAU10n6cRPv/6X7o+SOY=;
        b=GOTBpUQAi1ntDGpg9DH1rRHA3ttReRY+oSsTyXbZJq6TqWZymKooEr4pklqJHdgjdM
         jUNsaHO3e9MJS6QIwUhuj+lZED6XuvkCHhp1SjZHqjkv716NhQFm7J23PDzoplXW2GdM
         XlbJXm7uUYHkW0qPylFQdTCC2K0KlwZDJ6RKV/bjx9rcRArbH167kegckXoRFwHFwsBR
         eeRI3Z+XK/M725+y/OxOyVjNliyfeUSvhJVQIQbGMrKu3ykiqikYtNEZ+4d2hg6La5EI
         QP+IFdyh9z01FBB199XQUnwaXbfN/+2WK+v1xTi2pIon7UpG4z6uSAzH/m8tfqpVaPRq
         mbGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq+DxL1FYu16zmPlYl2hLw2QsLY7LbIFSnYdiQON8ViOnShUg9FZ8yLPUtpcW6SJz3MdFGjD0DOl8IhuQ/05vRMocnpg/UacoiV0w=
X-Gm-Message-State: AOJu0Ywi/UEVTXEf7y9nkaH5tUu9iqE76i+Uxa459fsNONw/VkQARuuf
	ytJV18butcRyt3KxrRE7vOOlMBbjvBHGG30JmL9zVJ/pLVfDXQFsRNxW/yK/6AktZB4zmehxTSO
	mx7vdlg==
X-Google-Smtp-Source: AGHT+IGwlW0i5ubshc40IM4U9EWFKx4xdH++CjQRTy8CKgnvb1J/NG921XoYcaL2c6CEIpx6a+bayA==
X-Received: by 2002:ac2:5322:0:b0:51a:f362:ab30 with SMTP id f2-20020ac25322000000b0051af362ab30mr3486539lfh.7.1714837243331;
        Sat, 04 May 2024 08:40:43 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id j1-20020a170906474100b00a55892e840bsm2975774ejs.205.2024.05.04.08.40.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 May 2024 08:40:42 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59a9d66a51so91468066b.2
        for <linux-media@vger.kernel.org>; Sat, 04 May 2024 08:40:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbnfIGzeApxy/Krrh2dkptwe5nKphv/Wf2O/fzfIh+0N/Gx37URaEcCnZf6FhAynYYlKkV3oNRzTnw5hvvAjG8p4AY8cb/Hk/2xwg=
X-Received: by 2002:a17:906:cf83:b0:a55:75f6:ce0f with SMTP id
 um3-20020a170906cf8300b00a5575f6ce0fmr3540131ejb.13.1714837242162; Sat, 04
 May 2024 08:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook> <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV> <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner> <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
In-Reply-To: <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 4 May 2024 08:40:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
Message-ID: <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
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

On Sat, 4 May 2024 at 08:32, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Now, during this TOTALLY INNOCENT sock_poll(), in another thread, the
> file closing completes, eventpoll_release() finishes [..]

Actually, Al is right that ep_item_poll() should be holding the
ep->mtx, so eventpoll_release() -> eventpoll_release_file_file() ->
mutex_lock(&ep->mtx) should block and the file doesn't actually get
released.

So I guess the sock_poll() issue cannot happen. It does need some
poll() function that does 'fget()', and believes that it works.

But because the f_count has already gone down to zero, fget() doesn't
work, and doesn't keep the file around, and you have the bug.

The cases that do fget() in poll() are probably race, but they aren't
buggy. epoll is buggy.

So my example wasn't going to work, but the argument isn't really any
different, it's just a much more limited case that breaks.

And maybe it's even *only* dma-buf that does that fget() in its
->poll() function. Even *then* it's not a dma-buf.c bug.

               Linus

