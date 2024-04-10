Return-Path: <linux-media+bounces-9054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C548A0183
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 22:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3DAD283375
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 20:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0D6181CFE;
	Wed, 10 Apr 2024 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FhgDvUwk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8710D18E0E
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 20:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712782413; cv=none; b=VX9ye92/Z3NV1FeDBDcb5ZwM8QMs3T6JrReMEO1ZHTFTrZ0ahniIYCSEirnkvxiRsg1uBsOls15xhRDNlAKwN1CnWcAj7yz82x3jmKOjpiqZeKV/FunJf1FHp8fnN9hIvx+vHmixh10dIa9qHD5KDSaUXAbOAPgk1cjY93H/09M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712782413; c=relaxed/simple;
	bh=dN9QAFFSPnKO+kppDSwGYQaQqQZPMRvjy+igFIMMS0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDbSzcuvQzFDqAwEJ5plV7IeKb4DlwvnUk6p4vz31aO5zrJ4rpWHZbeG7rBbsd1E4vG4cfHdjPz71Sm4Wky9M6A6IiJQ9GJmRHu4HhL2NjPnXyLdeTnuppmaCAIsPJZahG9EsPFf/kH+dMGLSrgAPYnhMPSJYpWLMWmVPzs0UdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FhgDvUwk; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso4772309a12.1
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 13:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1712782409; x=1713387209; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HFiQhEOGgH7BulX7PcWOBKJwuVCh69V2zXaiyRkXXhg=;
        b=FhgDvUwkDuPFgjAM8in9yzTpwOjYYA7xNzrr/PHrqFPoGYuacUbbaLQsoVjpmCTuEh
         V7u3sSeBK/81bKTPwHxPQDIjkc1IV6wIrJkHYUi7z94uAYLeoIPN7m7s1W7ybBSVsKv9
         3uhS4SdOOOQxWLINd5JHI3vg9mjYIlXm1OH/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712782409; x=1713387209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFiQhEOGgH7BulX7PcWOBKJwuVCh69V2zXaiyRkXXhg=;
        b=FbFXrBnJZ/48voLOlcf6F5uZeJpBhDKWSbUqowluYcxmKrrdZLyg1POgE4tNOh6iFC
         DNKVmp7KTlOmoR93QTdB0ivqEtT7tA+yujliNNfvghAxYQbY3Wwcydg/423b6wUpfB+0
         JA2Shhw8hbD/f8tZH1XZbhXr2EnqRCZrj3EtiGnsmhy2wdufHIov8bkyoUjud/lkvau2
         0ptOWZv3OdCUj/gE11prjaH6NvuhDAP8+8y2oWacUp4hykasAW/w2Hhsdt7tISfAoJfV
         SuUNR8qDr+bL5FJn6rBTrbzexnEXRCIwkubcr8vm+fhSMcdERleke170IxGr+Nulzl7V
         ggtg==
X-Forwarded-Encrypted: i=1; AJvYcCXc9U0MCE7BZKVJUIveoB7UvmamIb+4iG/oujwjpRpmSWSLDmJzowY31N+6vAGqQujWUF/nblFMYc4plQiLWwc5uJ8sovjXrIhP15w=
X-Gm-Message-State: AOJu0YwUnw1eJ0+F4QBSgjQs7qHqujVVtuOte04P6+M7BgyItVyOFmYl
	jGlLrtbxxoUA2/2lQxFwc8jPZQ8wAeFOnuw4e3V083oMGfVW0sjhuUqN/f9pY35DlZXeZ6ht1Sg
	JcjnRvQ==
X-Google-Smtp-Source: AGHT+IFAcjKBC718ZtoyThdi6EiCOAZbE1C4WNMB/XXUMQgkFloAGyHqCNPxQrOVt/GbCWl1tFTDLQ==
X-Received: by 2002:a17:906:38c:b0:a51:c84b:eeae with SMTP id b12-20020a170906038c00b00a51c84beeaemr2287166eja.31.1712782409598;
        Wed, 10 Apr 2024 13:53:29 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id g17-20020a170906595100b00a521327b019sm41197ejr.197.2024.04.10.13.53.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 13:53:29 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a44f2d894b7so812737466b.1
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 13:53:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWz6wlZR+BtPa4zMNvsC94X9K2hu7/IdtTTTrgCcdqWXVImwH5GcjCk9dWf2AVbxW8Sc1VzWQeqXmzuFFGSArcP93eBUjgHmVbvbqM=
X-Received: by 2002:a17:907:c789:b0:a52:1635:9e05 with SMTP id
 tz9-20020a170907c78900b00a5216359e05mr1520228ejc.13.1712782408768; Wed, 10
 Apr 2024 13:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410183852.6df5011e@coco.lan>
In-Reply-To: <20240410183852.6df5011e@coco.lan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 10 Apr 2024 13:53:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiwn2VamMH-o2zmk0d__GtEPTjL=x3QSEC0MHEt30=g1Q@mail.gmail.com>
Message-ID: <CAHk-=wiwn2VamMH-o2zmk0d__GtEPTjL=x3QSEC0MHEt30=g1Q@mail.gmail.com>
Subject: Re: [GIT PULL for v6.9-rc4] media fixes
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Apr 2024 at 09:39, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
>   - some fixes causing oops on mediatec vcodec encoder/decoder.

Well, I certainly hope it's not the fixes that cause oopses. That
would be the opposite of a fix.

However, having fixed that, I also find some of the fixes in here
rather broken: commit d353c3c34af0 ("media: mediatek: vcodec: support
36 bits physical address") has a "fix" for a cast like this:

-       dec->bs_dma = (unsigned long)bs->dma_addr;
+       dec->bs_dma = (uint64_t)bs->dma_addr;

but the underlying problem was in fact that the cast was WRONG TO EVEN EXIST.

Both 'bs_dma' and 'dma_addr' are integers. The cast is pointless and
wrong. It makes the code look like it is doing something else than
what it's doing, and that something else would be wrong anyway (ie if
it is a cast from a pointer, it would be doubly wrong).

IOW, as far as I can tell, the fix *should* have been to just remove
the cast entirely since it was pointless.

I've pulled this, but please people - make the pull request
description make sense, and when fixing bugs, please think about the
code a bit more than just do a mindless conversion.

           Linus

