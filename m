Return-Path: <linux-media+bounces-18525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A49984D48
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 00:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 581C81F24586
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 22:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25D2146A93;
	Tue, 24 Sep 2024 22:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="djbVBHLr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BB413D25E
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 22:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727215389; cv=none; b=sChi7x5uIsLsj0dimf8cHAnb5uTLj5Jj5Y9+xJUi6PWxKV6YWjKYLe58txCH+jno5cYz0Y9inhmZSFDwZa/NltVh6/xjabe3fRxCVN5v0UQg5/KRtcnSb0Il+dRYv9wQUYIjlq5XaeXfgyv3Dd5iv8j3wf49k9Zp+/2u9JKekhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727215389; c=relaxed/simple;
	bh=NsZrdsG+uwrLVvS5FWIhBRuHHog4+l/Yf5EAxQLtzhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVYlZ9j0JkzdFu8797qrJtDB+KgNqcfF54t1ax24uqxoqrD9Ww8/ozCG9ZdSvBQQTxyCDe9ASdzEeBlmP7ZKq0djFQyV0StZtn1KKf0rxkU7F5/WjqSo/AEmncpF/3idcu68t3yjW3s/rWloqm7KyiysG9Vl8TSN8+So7Gd9rHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=djbVBHLr; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a99a46af10so627244685a.0
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 15:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1727215386; x=1727820186; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NsZrdsG+uwrLVvS5FWIhBRuHHog4+l/Yf5EAxQLtzhs=;
        b=djbVBHLrcuojBXGYJbM/DhCPfqFxPFaWJW7Bq8aGqE0nekN5bf/AH5bvrMb80X0vMi
         jPV23fsa3AdGutjCpwkvGnOhl94/LlXfRN7JdCn6LpvE0sEw6pCHr2M8ZZesOOXMxsS3
         nl7ZbdJgxlYhh16lOjd1NUokMbgEOqWhXNikdCbKpN64zyCBkk64G4kW5zcf55nAJrsK
         57YNvHPmZP/GWLmEQDtx4Co2smjvuZjjS/mY5xYkxM0tbuqG/G86Qvpje6OWF3C6Kxop
         xIpsJMnBt1jiyaySttZFx5YeY61nIsE5poxNyRhwg9Dze+Mlk8ggciBnkJMOjku6gozp
         kPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727215386; x=1727820186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsZrdsG+uwrLVvS5FWIhBRuHHog4+l/Yf5EAxQLtzhs=;
        b=EZ6yrG2gGUgzThbgxQzzZkqN4x2tg+ZwX47MzNDY87hf8Md6a0btiBhwdMsIQaOU9o
         9GZmRAtRragz97KG0V52j9+tGjaCMyzfFc6kq1GzD+PCVmyFPAo/lxJ2kcoOB7QkQfcW
         VH2/I+Wluic+aQuA/8b/CS1C7UJS3KBhJzaxbXif+u0gorsJN0AT90BH76NLf/hAzjY3
         Wpdw1Iqhl3OU4NW1ZWhAIimBmRJ/R44aW5oCoYf1X5oxevAZIUFNNP1rwGN6Wj++OevX
         AujeYI3TEf2EOCM+29Q0aqxCChLD7ZUWx7wKLMFsCvGPw8m5HH4juirKBEvBpQ+UMaqo
         azoA==
X-Forwarded-Encrypted: i=1; AJvYcCV3/sY1m2EpcXMA51kXJCX1f6Jaqd3FCxy2rdmDSUXl0EEoOzRWiKjyZzEJPRgTejUVo/kmZaG/L/qSsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Jkl2P9CfRGz9Ylk/mss7Ox7yOuU5O23PHWA/wy8Jk2u0PT/B
	nyCKyismUAtg5ZXUZ9efIWN+k76fU2z0OBILLuHDhlPSjuM1gXufJXhUd2j12jOLEhe0mrycDeI
	Brlu4Yu8zStEHdsTOGAor5yQ9klkQ4l9TXeJGDw==
X-Google-Smtp-Source: AGHT+IElqfXPuPng8AojlDDF2C6GLMgjgq9uYfkfDW9uAzUUN373GhIZBRXCnSZ4eftp7Scr+RM/AU3bO+2aPn4itIQ=
X-Received: by 2002:a05:620a:179e:b0:7a9:be7a:9220 with SMTP id
 af79cd13be357-7ace745d94emr87761585a.60.1727215386507; Tue, 24 Sep 2024
 15:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
In-Reply-To: <20240830070351.2855919-1-jens.wiklander@linaro.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Sep 2024 23:02:54 +0100
Message-ID: <CAPj87rM5LSBEdMECyh0WTkjWWySDv2_eyqj7ew_qU7xQ5LEdgA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jens,

On Fri, 30 Aug 2024 at 08:04, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> This patch set is based on top of Yong Wu's restricted heap patch set [1].
> It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
>
> The Linaro restricted heap uses genalloc in the kernel to manage the heap
> carvout. This is a difference from the Mediatek restricted heap which
> relies on the secure world to manage the carveout.

Calling this the 'genalloc heap' would be much more clear.

Cheers,
Daniel

