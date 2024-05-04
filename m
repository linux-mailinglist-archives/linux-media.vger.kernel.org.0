Return-Path: <linux-media+bounces-10766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FD38BBCBB
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 17:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDA89B215AE
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 15:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A2C4502E;
	Sat,  4 May 2024 15:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f/fJiU4L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE523FE2A
	for <linux-media@vger.kernel.org>; Sat,  4 May 2024 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714836748; cv=none; b=sHtb2MW35WAufaQzb45Rxd8Uo1TI0jYbZ+ettyVyll2VaGvQB3c4OpQmUoRn2ixMa8gUgTR5vmvC+YHFgjCIGjLFAeQs0CxLpx5lYrsAFbknhqWrFJyhvxGVPQDJ8an9671nAAKmruxKDFWGDHo5YjpGMPLIv8ywm4sBJ0PEPcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714836748; c=relaxed/simple;
	bh=dmLzNSiqTCKSgtEtdi4RT/LW9OkahTnAY3Pn0EDC+4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cr/xBdaFU8BMaQjE+88261iRTjUE/vGQpctep7uSWuxkmu1CMSHvjAwQl8v/W/v9+U3Ov4+JnwqNHu6JXtkqmuufa6r/PugUHocBhy2Zx5PdvFrHmnPlljKZ2Qhr21Ch9eYPxZSg6BfXnOxRdp3C6455Ol3Hdyj/AvNFNercBpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f/fJiU4L; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59b58fe083so31426566b.0
        for <linux-media@vger.kernel.org>; Sat, 04 May 2024 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714836744; x=1715441544; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BF+X0IVed+h7jlJZMJqRgUDnAGAy0IxXXOyqwBdkEc0=;
        b=f/fJiU4LHyGtFV9UlcTICC2xvhZyDCOnV/Vg/WOk1CZ5uhcQWKlMvgV4f4kTCXyOQf
         +tEGGQ/zAIjkNPJMJqfOPAjXaJ70kf/vgQ98zRoFH5swOwszOALS2IHCt2lm3wPzC9c2
         aXvqbmkbnHCwpnjfddbYX5hW4Gz6nlabdy6Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714836744; x=1715441544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BF+X0IVed+h7jlJZMJqRgUDnAGAy0IxXXOyqwBdkEc0=;
        b=PkjnctNWKarBa9VIFiU6znxXJ+FJOdgnehWSxWe2lXBfuc+VBg3iklqtL+dE8HHAfx
         muZRN6+MweLDjWk428qsWn3LupIW5z842iVuuFAB9JOaCwPT6sYN4RqUzvGbaQ3IZLaP
         vO7umJpH7GebZx0lGbGhBJXCtdFmKlBs8DreRGWB37uLvjI9i6TTCvKw3TeG0GKmWFx7
         zAMNanWhbCrk+XS9kxGqO6016obDe0UMOfcuCbdM+01OuPd3IgTLGsaEvvSWDlurPzQ4
         9wSELh+Q5AzMKP8cVfEjRCdgZaJEU4T7nTKdOI3HQL20AazHQgQzA1Y2IeMwcJShRDlV
         6prQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMovOvZUD0e4F+bJAY9J5E12bfcOBYhAOA+BdAWpKsmIZWMzN5Q3ZaMT2e3UODO+5OX+WQMTn7f7VQC1wGYNK3SgY+2CZnRZi9MUY=
X-Gm-Message-State: AOJu0Yw+xvys5EZO2nk6/pDa++o13wV3i1V/RaU7uKhrNSpB11QJg6p9
	eAEmrWtfWc0cYYg/ZCTW7G6tWw9+lwM+UG4iwB81fUA2qKL3hUHUnd/3tHiBDymbsv04wUsQ2UA
	yKUqhiQ==
X-Google-Smtp-Source: AGHT+IGkPB2c4OZfh3KtxGpWwE7/kQ73dh1Y8dkTMWtHBm1HlpgXQAXYvqSNb0Bfu/JJdXGK7EGyUQ==
X-Received: by 2002:a17:906:b3a0:b0:a59:9b52:cfc3 with SMTP id uh32-20020a170906b3a000b00a599b52cfc3mr2169765ejc.29.1714836744544;
        Sat, 04 May 2024 08:32:24 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id sa36-20020a1709076d2400b00a598524f8f8sm2433522ejc.12.2024.05.04.08.32.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 May 2024 08:32:23 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59a8f0d941so104215866b.2
        for <linux-media@vger.kernel.org>; Sat, 04 May 2024 08:32:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxgm+rFeqPCwWsYgCFD4UQusvCxSINvy9TOBxvHsJPoOueUrioLQGRAAGlc86kxCi2LtGp2A2cH+Ykqph80Z2iQdaV5Cg/39uBRV4=
X-Received: by 2002:a17:906:5fd5:b0:a59:9e55:748d with SMTP id
 k21-20020a1709065fd500b00a599e55748dmr2287623ejv.35.1714836742417; Sat, 04
 May 2024 08:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook> <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV> <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
In-Reply-To: <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 4 May 2024 08:32:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
Message-ID: <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
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

On Sat, 4 May 2024 at 02:37, Christian Brauner <brauner@kernel.org> wrote:
>
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -244,13 +244,18 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>         if (!dmabuf || !dmabuf->resv)
>                 return EPOLLERR;
>
> +       if (!get_file_active(&dmabuf->file))
> +               return EPOLLERR;
[...]

I *really* don't think anything that touches dma-buf.c can possibly be right.

This is not a dma-buf.c bug.

This is purely an epoll bug.

Lookie here, the fundamental issue is that epoll can call '->poll()'
on a file descriptor that is being closed concurrently.

That means that *ANY* driver that relies on *any* data structure that
is managed by the lifetime of the 'struct file' will have problems.

Look, here's sock_poll():

    static __poll_t sock_poll(struct file *file, poll_table *wait)
    {
        struct socket *sock = file->private_data;

and that first line looks about as innocent as it possibly can, right?

Now, imagine that this is called from 'epoll' concurrently with the
file being closed for the last time (but it just hasn't _quite_
reached eventpoll_release() yet).

Now, imagine that the kernel is built with preemption, and the epoll
thread gets preempted _just_ before it loads 'file->private_data'.

Furthermore, the machine is under heavy load, and it just stays off
its CPU a long time.

Now, during this TOTALLY INNOCENT sock_poll(), in another thread, the
file closing completes, eventpoll_release() finishes, and the
preemption of the poll() thing just takes so long that you go through
an RCU period too, so that the actual file has been released too.

So now that totally innoced file->private_data load in the poll() is
probably going to get random data.

Yes, the file is allocated as SLAB_TYPESAFE_BY_RCU, so it's probably
still a file. Not guaranteed, even the slab will get fully free'd in
some situations. And yes, the above case is impossible to hit in
practice. You have to hit quite the small race window with an
operation that practically never happens in the first place.

But my point is that the fact that the problem with file->f_count
lifetimes happens for that dmabuf driver is not the fault of the
dmabuf code. Not at all.

It is *ENTIRELY* a bug in epoll, and the dmabuf code is probably just
easier to hit because it has a poll() function that does things that
have longer lifetimes than most things, and interacts more directly
with that f_count.

So I really don't understand why Al thinks this is "dmabuf does bad
things with f_count". It damn well does not. dma-buf is the GOOD GUY
here. It's doing things *PROPERLY*. It's taking refcounts like it damn
well should.

The fact that it takes ref-counts on something that the epoll code has
messed up is *NOT* its fault.

                Linus

