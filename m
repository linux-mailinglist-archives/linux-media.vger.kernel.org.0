Return-Path: <linux-media+bounces-10751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C49B8BB815
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 01:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB92BB22875
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 23:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D0684A4F;
	Fri,  3 May 2024 23:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SkbmRUnH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D9F839F5
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 23:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714778196; cv=none; b=pl5G4PodnfRMXs2HpWVX/ZaHgonc4iQRQfw/dLpwc3+nmnENYspq4Xg2zzOpmXolOOv8QL+y1gg9Mx2xJQN+5aU95uhjUUCrTOBZ+FsNgLIh2XMY6u4OuCHnbZ73oP+eI5NpKc9ZAHwbn1E8vXSbI4ubyED+p2yk+6seTlLaCKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714778196; c=relaxed/simple;
	bh=10Im6Ev0hm6GCexrKsrsuAqt7UP5HFJ90hGsgvNShJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpzbZ/trUjir9le3I7Rayu7OZ0KZ2nSTnE3jxMO+80SOA1eePuI9gIOB9ZocMGBDNkpd7XgjzQJr6Wxi6ZoYOt/CxmQVJDmAbCJ1HqFuEHdjLotGdxx6x52YxKeskW/en0+iad5rXSQt1cQtdKdJoUdKpSFd42eS/QYepqC2/kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SkbmRUnH; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51fb14816f6so211576e87.0
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 16:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714778192; x=1715382992; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cGG/rn4AzL6EAyTxraRF01dNEmbt6QApJhVwyWVeemo=;
        b=SkbmRUnHnf5SNIXEFlHD03edue6CNKGc7IAHBcHf8wyW6hBzbqutO4DOFiCZt4+UNm
         ZswFDydX3YZATn5j8RwngOhdnozLfRn32BHbz/pYxwrTozR/D4r99Z0uTj9Yl4zHIkdd
         4lFgMwWo6FNQkPxz8z/QgHwsAO8mA07RWNy54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714778192; x=1715382992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGG/rn4AzL6EAyTxraRF01dNEmbt6QApJhVwyWVeemo=;
        b=IZZbzYF7YeW2bFacU/bqn35lNGXEe8UiVQXB56SB2abF6a/C6jeQZHyMIYTHm3Q3xX
         rKkM+Z9ZW4+V3zTKOLgGye65jB/WBWTtUigah0Adq7Xs4+GF6vlpIIS+8zIDYlZ5CGgq
         fOZLj7tTuHDgavoffjazjytJhruDci56hLEqP43ccagsHkStZWOaKyzMRsZcQPCkRiA5
         dioewRVbO+R+2b8pcbBljJ0Pi3nA/SV9psg37naI6CeG1sLibjNMJEXtOqhwXpirp1tj
         d3YgghEG7OfrH2zkvA5ULP1Gsv3J33k219gy1i5yJR4wLknRL9rce75j2yFtIFpwtVTi
         GquA==
X-Forwarded-Encrypted: i=1; AJvYcCUyRCiMpBRnIvePhByOu0JRkVke1t8EwdvUKWLB5MGI4i5+AlqhlDCZhpzpyoX8Hum2AIBk1KMBwLvaUfu/yMQrYKYEAmzsLaebAQM=
X-Gm-Message-State: AOJu0Yy8BAz8B+f9BZwzeNZasTEmNprdhFe8UX4JA7W4cFclZMQ/112l
	IKHYpdWOZAFCCHt892LrB2FYnX5uc0Bw9+9x63gtTtsWweOW96GVTiL2sOBuQHvblU5cxF9YKgs
	4l4X5Hg==
X-Google-Smtp-Source: AGHT+IGRKk27S45shd4ndFM1Knnn+mJAZ8lcRMtQcdXAsumizlFXBjZViZs87y6/1RXGACVvFOzFrQ==
X-Received: by 2002:ac2:528b:0:b0:51d:21fb:4012 with SMTP id q11-20020ac2528b000000b0051d21fb4012mr2547812lfm.56.1714778192513;
        Fri, 03 May 2024 16:16:32 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id s13-20020a170906bc4d00b00a587cfd7a37sm2216250ejv.84.2024.05.03.16.16.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 16:16:32 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a598e483ad1so26421966b.1
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 16:16:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyu9DztXRm3p28peUWOQrrMW5RmpjHAknlkcQqbmKLbVfSnqXuv2G/V2OPizWw4t6JKQj9qEgmDcZha1ixFlA6xanVpZG3YIpFs+Q=
X-Received: by 2002:a17:906:52c1:b0:a59:2e45:f528 with SMTP id
 w1-20020a17090652c100b00a592e45f528mr2851931ejn.38.1714778191864; Fri, 03 May
 2024 16:16:31 -0700 (PDT)
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
In-Reply-To: <20240503220744.GE2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 16:16:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whULchE1i5LA2Fa=ZndSAzPXGWh_e5+a=YV3qT1BEST7w@mail.gmail.com>
Message-ID: <CAHk-=whULchE1i5LA2Fa=ZndSAzPXGWh_e5+a=YV3qT1BEST7w@mail.gmail.com>
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

On Fri, 3 May 2024 at 15:07, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Suppose your program calls select() on a pipe and dmabuf, sees data to be read
> from pipe, reads it, closes both pipe and dmabuf and exits.
>
> Would you expect that dmabuf file would stick around for hell knows how long
> after that?  I would certainly be very surprised by running into that...

Why?

That's the _point_ of refcounts. They make the thing they refcount
stay around until it's no longer referenced.

Now, I agree that dmabuf's are a bit odd in how they use a 'struct
file' *as* their refcount, but hey, it's a specialty use. Unusual
perhaps, but not exactly wrong.

I suspect that if you saw a dmabuf just have its own 'refcount_t' and
stay around until it was done, you wouldn't bat an eye at it, and it's
really just the "it uses a struct file for counting" that you are
reacting to.

                Linus

