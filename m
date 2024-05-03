Return-Path: <linux-media+bounces-10755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E4F8BB88B
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 01:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD980B21908
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 23:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B34985267;
	Fri,  3 May 2024 23:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZGjV9bOJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A467A2E65B
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 23:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714780506; cv=none; b=gIKFH2UhYCwUEHFgOB8r/0DwkQ6Cj8DicOniBWFp13wBX9hUUf7x8ZUZVVE2xQnlSd4EawEbUXY+eq/tC9KhjCyQsmzYvn1T1D/4qVr9qOxp32liFT4ZdxOff773tPh4M76RF+uQJZlKWwxKCHf7b0Pvg1bOSTFj98Y2q99+ovg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714780506; c=relaxed/simple;
	bh=tf8gPRKnHuj1S8RN72oCYha0zRiI+Zqb52T37Eym2SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0NqODA3tS9RS8eIsy7/vRgcUS3hB6xulrCuduglM+4rOOjdmV0HJZ/LgOZfmMTYcNo0xKfNnNsrIWAZHLef7ljM17VZmmOUjxml7rtmjbozTkzofQGk/+cgAIh7y7W0M8hMDMxyKHKtRuOBXqS6fMAJyUENTmO3y46h3Df5vaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZGjV9bOJ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59a387fbc9so29682966b.1
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 16:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714780503; x=1715385303; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NxPhlO3npeMKaw71dXY38r1VkXmdKnYRPE7+RntnY6E=;
        b=ZGjV9bOJtsx4vpIPOC+jl/xOHEhJ7ml4JgIzgS1AsIh9S5KtVKfqLKs5lLGdXsqdqf
         rWkxV9dUaT0DUgXtI/DlRGk7Nc6D3XFWtZVWDF3oll1MHPi3o8BiJMn9wp/AQUXXjouJ
         RyC5Ror5S88Byqw9QIUO/60WEA9J8Zz0r3ca4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714780503; x=1715385303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxPhlO3npeMKaw71dXY38r1VkXmdKnYRPE7+RntnY6E=;
        b=Grondmhuz2vjprUaw9B4agDo/FJYnrgpn1AgNicTTq4ww9f4WgP5oZwm7dQa0eLIjc
         a4O96O9BjQib2/aou2/eFCpU0E3K7YRk6XsPTyptk5OgVw+JlBWh0v2IQvsGEwEei8Tn
         ZPiIQwra0GDHG8UKieXIDWToc7tUAjDhQRpXOG+oXOrBcmqVOuvKAMaJ35/C3arSrvkc
         hCPbEVo82Cr2+Jo/StPKc4rs6tx9yRbzXiwHJknfpPnbSNzi1v993Q2CCalRS8QDbLIP
         iyoatsKTCeh+ufCHy3D14ZujrAkBHc0Qe1iv/y6Q+Df8NhUY6fcb91GaULSoQCx9InaV
         VonA==
X-Forwarded-Encrypted: i=1; AJvYcCUtnQIp5n/lOHyg9x5P8QdzU1o3475XURYawtgpRTC8ysxsExD2/wuSNCw0vHkODKOP5sGzw5d4nzTvTcJ3gMcLyv7Njngy2HZYtiY=
X-Gm-Message-State: AOJu0YxvskybLgLtnQR6YS9zEbgSHnc3DKv171yqpYBhSJHDalEQh82C
	J1fwE7wGc2K8zsUrp2SU45cAoK3s5HpyI5iT/tXplAG60EHWwA6RWFe16w+WLhalnsBSq6nNanO
	VYasgmQ==
X-Google-Smtp-Source: AGHT+IGY2FHQNi3fgewh4xvsjzGp5cHhsixl9G9OQWRaK5eakZ9BGpE28CesBDLFgiEM1JmyfWpQig==
X-Received: by 2002:a17:907:9511:b0:a59:9bf1:408b with SMTP id ew17-20020a170907951100b00a599bf1408bmr1284727ejc.16.1714780502770;
        Fri, 03 May 2024 16:55:02 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id q6-20020a1709060e4600b00a5875dd74c2sm2287969eji.131.2024.05.03.16.55.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 16:55:02 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a51addddbd4so30370266b.0
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 16:55:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfHj6aHCQTQPLB1jnbKlXvdM9LXt2vg2a2xpJuGYxgygveGlBe6nE8V4pnj+kGXa99A71XgxhBZUuOD+EvXvPFBOFfMfJGBMWGIdk=
X-Received: by 2002:a17:906:3e4e:b0:a59:a64c:9a26 with SMTP id
 t14-20020a1709063e4e00b00a59a64c9a26mr202788eji.23.1714780501707; Fri, 03 May
 2024 16:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook> <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV> <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV> <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
 <20240503220145.GD2118490@ZenIV> <20240503220744.GE2118490@ZenIV>
 <CAHk-=whULchE1i5LA2Fa=ZndSAzPXGWh_e5+a=YV3qT1BEST7w@mail.gmail.com> <20240503233900.GG2118490@ZenIV>
In-Reply-To: <20240503233900.GG2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 16:54:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjjjsm=f+ZJRe3dXebBQS8PzpYmHjAJnk-9-2FAj3-QoQ@mail.gmail.com>
Message-ID: <CAHk-=wjjjsm=f+ZJRe3dXebBQS8PzpYmHjAJnk-9-2FAj3-QoQ@mail.gmail.com>
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: keescook@chromium.org, axboe@kernel.dk, brauner@kernel.org, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 May 2024 at 16:39, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> *IF* those files are on purely internal filesystem, that's probably
> OK; do that with something on something mountable (char device,
> sysfs file, etc.) and you have a problem with filesystem staying
> busy.

Yeah, I agree, it's a bit annoying in general. That said, it's easy to
do: stash a file descriptor in a unix domain socket, and that's
basically exactly what you have: a random reference to a 'struct file'
that will stay around for as long as you just keep that socket around,
long after the "real" file descriptor has been closed, and entirely
separately from it.

And yes, that's exactly why unix domain socket transfers have caused
so many problems over the years, with both refcount overflows and
nasty garbage collection issues.

So randomly taking references to file descriptors certainly isn't new.

In fact, it's so common that I find the epoll pattern annoying, in
that it does something special and *not* taking a ref - and it does
that special thing to *other* ("innocent") file descriptors. Yes,
dma-buf is a bit like those unix domain sockets in that it can keep
random references alive for random times, but at least it does it just
to its own file descriptors, not random other targets.

So the dmabuf thing is very much a "I'm a special file that describes
a dma buffer", and shouldn't really affect anything outside of active
dmabuf uses (which admittedly is a large portion of the GPU drivers,
and has been expanding from there...). I

So the reason I'm annoyed at epoll in this case is that I think epoll
triggered the bug in some entirely innocent subsystem. dma-buf is
doing something differently odd, yes, but at least it's odd in a "I'm
a specialized thing" sense, not in some "I screw over others" sense.

             Linus

