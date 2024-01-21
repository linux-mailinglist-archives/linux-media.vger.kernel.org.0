Return-Path: <linux-media+bounces-3952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 948DC8357A1
	for <lists+linux-media@lfdr.de>; Sun, 21 Jan 2024 20:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEF9D1C20BAE
	for <lists+linux-media@lfdr.de>; Sun, 21 Jan 2024 19:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9A1383AC;
	Sun, 21 Jan 2024 19:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="epdDM4ab"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A499A381D6
	for <linux-media@vger.kernel.org>; Sun, 21 Jan 2024 19:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705867048; cv=none; b=gNq3Ps9y0Svxe1yJwe1nwKPPSDFxJWc8bTnaNZakOc+mYWooUo/Ta0wjaUrahJLU2JJzd8gtjvP8ja+4LL6gcduxgwxJXRk65QdHMB3YzzHeuBkHGVF2+mU8RTmxDVOECwAVni2tG1cBhbLE1Yuac9w5QSAxRj/5U0tntuIh+EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705867048; c=relaxed/simple;
	bh=JoonGw9vQNXaHQmMN+LL9oyTK5rcSC4rZUk0sfhe/Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4n/5JVmOyYsffTQVhAullSyg+KdG2o8hGiFuJoKrSEf+M2HpMEpzLk6GbfXwt/bTzFFFbbOPAu45SkOwdrfhs61HmsT2zsvwFrmaNa+GH+YQO1cBIS9uf9p93URkoht2dp4/b7ZEdxThMP0LvKIRJF/v9in5KTxW0Sb3Zc1C9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=epdDM4ab; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a26fa294e56so243569066b.0
        for <linux-media@vger.kernel.org>; Sun, 21 Jan 2024 11:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1705867045; x=1706471845; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J0/ycZHO2LVW1a2k1bwDkHHCW1t09pgf1oyaA+mSkcw=;
        b=epdDM4abrwA6KWJq3aWm5KQbnlF7cBXEbzDdCto3xWctJYv6xNaOgCn0WqZnH62bFc
         uOnZDIG7fHWZzDWX3mOz490YzkiTN4LatU52ogy43B5SBd0XSxxSgylIRVt16sBRHFDe
         O3qK6ZcwdGavVuQGgdh8PjIe94uegDUOTFBVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705867045; x=1706471845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0/ycZHO2LVW1a2k1bwDkHHCW1t09pgf1oyaA+mSkcw=;
        b=dxKTfWPly+aLh4TP8fVOd8wVd1i1AjyOQi14krPodBvxe9r8h88YyVpvWKyM9epDh5
         KcwmjeAPiT9EzUIRVF0dNGdY1ec9T9mK/wlHozLN6PcR7EZGB6vukW9il+O8mFp7o4g5
         rP+Nr5ouo/7uu4A2v+SUA56AXFk0AcRM7fsLIhsdbauJpHWWwFjJWkZSSZqXcwLwuhTe
         0BpDPy9yOm34WgMqVRge938ivIqHyBf1G/Hxh2VKInUjeip1y6TKxOKZ/yQHcW0ACw4F
         Ka//HW2r08KK08ZKcj/lx3fwLjJdOi0CqE30pyhjWDjFcptMZ2khmCGvtCUOfDWnG+yf
         09hQ==
X-Gm-Message-State: AOJu0YwZzolV9I/OE3MET/SSFljspPrHMDHE1HJXj4tQgvHwfsPy01aO
	ZqoT06eJYRoWr0Bsx42gNuniciK4LwMOUL0LiVon4wueAlvDjXRwzTxVPjU492pvxCP7shWy1VI
	PeTsMsw==
X-Google-Smtp-Source: AGHT+IF2C39i9UQP+mIrTj3sGj9KPZd3vypSE2nlDQnalfWmh3UxvvNR61fqN/ntx4gqMCYPgG6P0Q==
X-Received: by 2002:a17:906:9c58:b0:a26:84d8:9411 with SMTP id fg24-20020a1709069c5800b00a2684d89411mr1648814ejc.128.1705867044428;
        Sun, 21 Jan 2024 11:57:24 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id a5-20020a1709063e8500b00a28badcf367sm12626134ejj.54.2024.01.21.11.57.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 11:57:24 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e8fec0968so33303215e9.1
        for <linux-media@vger.kernel.org>; Sun, 21 Jan 2024 11:57:24 -0800 (PST)
X-Received: by 2002:a05:600c:56c5:b0:40d:8794:8535 with SMTP id
 ju5-20020a05600c56c500b0040d87948535mr1754394wmb.160.1705867043768; Sun, 21
 Jan 2024 11:57:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113183334.1690740-1-aurelien@aurel32.net> <fd143cf8-5e3d-4d80-8b53-b05980558e45@xs4all.nl>
In-Reply-To: <fd143cf8-5e3d-4d80-8b53-b05980558e45@xs4all.nl>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 21 Jan 2024 11:57:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgDh18QD_Z6V96J8_gjbSo-7CvGZb9VLRLSL-JD2F8WqQ@mail.gmail.com>
Message-ID: <CAHk-=wgDh18QD_Z6V96J8_gjbSo-7CvGZb9VLRLSL-JD2F8WqQ@mail.gmail.com>
Subject: Re: [PATCH] media: solo6x10: replace max(a, min(b, c)) by clamp(b, a, c)
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, 
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
	Anton Sviridenko <anton@corp.bluecherry.net>, Andrey Utkin <andrey_utkin@fastmail.com>, 
	Ismael Luceno <ismael@iodev.co.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"open list:SOFTLOGIC 6x10 MPEG CODEC" <linux-media@vger.kernel.org>, 
	"Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>, 
	"Andrew Morton'" <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	"Christoph Hellwig'" <hch@infradead.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Jiri Slaby <jirislaby@gmail.com>, 
	stable@vger.kernel.org, David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 14 Jan 2024 at 03:04, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> I'll pick this up as a fix for v6.8.
>
> Linus, if you prefer to pick this up directly, then that's fine as well.

Bah, missed this email, and so a belated note that I picked the patch
up as commit 31e97d7c9ae3.

It even got your Reviewed-by thanks to b4 picking that up automatically.

               Linus

