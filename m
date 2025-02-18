Return-Path: <linux-media+bounces-26302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 054DCA3A322
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 17:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1939188DD06
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 16:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A4326FA47;
	Tue, 18 Feb 2025 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="RalTmpSc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573F726F46D
	for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 16:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739897218; cv=none; b=Hro8R8QWU271dGj9aKwnUuCFKitZ8fLqI4XjoexHo8iQUJBXFU3HW/i+lGjclgf/CJZJZEM7XeOpW5Ax4YTofheUeHnpCvFcp5wwDCExe72MX7KsoTVmAxQlzmOm1AlVY8eOYhB4NG/pZ840lkcNUkDpUdHWUfuKCZWHIcgNCV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739897218; c=relaxed/simple;
	bh=MZLc1vPrgmDcKl9SEwy6+fpehOypZuSO4hdHhZEBSRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+Cgjp5AyQ0D/XP2HcJGLovi2+Atd1uM0MzPVVDjWXHAt0t0wsXyyCaq84DBbeyEy2tsqlx5n6CIlfJWNfu27bEnFmHYAI9fY2NELy+2MnbRzXBrZgIsIK8rNxQc0FQXUIPIN/EezR1dfiGIhXFAZ1NK/QSYgA2kCWLGLSWBGps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=RalTmpSc; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso8214446a91.1
        for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 08:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1739897215; x=1740502015; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IOylOGK8+KXVlSKwEjhOkQ9Uo6qP5iYjwH/vqYLvpOc=;
        b=RalTmpScLjyiC+N4iXsQMNbQ8bVRya1AWIDNCCCblJTg7YBq4QFusGKatXRiZ0yShi
         m+zYz7a+DhZYh1ZDXY6VjQO1ycViTKzrqKBkH0wQfZ5meqO0RS/QAiJXoPqbysVoTWE6
         rSul2DhaVwxHgOksDsPvqGZ4fUNN7MPBHuVBXqi4p4uJlOffL1AHHU21OC8zgbKpQnpX
         3hoqhXG2clL2MVGg5ROE5KycKIHN+QjStek6O3vBppnRSE1f9MM3DSbCxajxpawVT4W1
         vEvqEvQA5cqZjR1QmCJPjlvterOyRRrUGtjjwsdSDwJB5tRGwHhPTMhCndqEwmWO2OxK
         XUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739897215; x=1740502015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOylOGK8+KXVlSKwEjhOkQ9Uo6qP5iYjwH/vqYLvpOc=;
        b=UbaA9tlrS8BRQ5rPQjaY6HtomnATuLSIBEGm0a6ANI/ZUcfzWITXMP1KX0OH1CWnyo
         Z4bcOH3rM3KRvxCXuAi+Dzt0jgwzb1rUUu0h89GvTFIU2LrwKzbGIv8Z0tX2mvf+wvds
         eVCvZBTxES/4+UkOsfGr7O9IOd0rfjzIO3hnQMOi4ArR3SGdnSPOdEzel6zR7lczD7YX
         WkFHhcFnagCuFQ4rKIk52HkS1v09Awy/Y1hmwy/WDW6z1HZI3N3qEoZR4Volyi4oyaAc
         57cz7O6WtDwtzUA+G1GHdR+HeSNnsXfZ93fvdIJfXIhwe3TzhEcxLMnHk/wxSC4rP4eq
         cvhw==
X-Forwarded-Encrypted: i=1; AJvYcCWKO9YhSGAIiwoUcYR380rT9+SE9xkbt6LBg9xSfKvTtWJS3Aczlly1sqqSoyAUOy8QX03Oge2m1dHC1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhYvSisj+DNxQAEQJiNHSIbCqumoC8pMkHoBh3ANpW9iyp5br2
	B80rjWr2WL2xkcQReFRgfFwflSG2gNGMgcskr0LXaQohPoShECWSPdMgvj0L58oSgEt+r4aS2tA
	gnVcKa8CoWxmb29e3nnDFqoH/Oz/wSVOzIj+vGg==
X-Gm-Gg: ASbGncue7UgwTztWvGBaUYYeS66pa1lUc8pFst9yn8gfKVAxNfuqkwa9oHpoxqMCR9C
	Yr5WNyOGU+y1GbmhuZdUCA5XAYG00nJtoQxJE+1M6Bsd3IFrGmmTGARPt5aFr3ccxvaSb2g==
X-Google-Smtp-Source: AGHT+IGHwzBsO/GBPkHZczfaNaO/9Fri81n9XYQ1ztlxgGE0CRA4HOyjovvD+vqgo/EOu8/IM5aMJO/ERmz9uK+U4xE=
X-Received: by 2002:a17:90b:2783:b0:2ee:b875:6d30 with SMTP id
 98e67ed59e1d1-2fcb5a17ccfmr165222a91.9.1739897215586; Tue, 18 Feb 2025
 08:46:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218143527.1236668-1-jens.wiklander@linaro.org>
In-Reply-To: <20250218143527.1236668-1-jens.wiklander@linaro.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 18 Feb 2025 16:46:41 +0000
X-Gm-Features: AWEUYZkKtmN_-KWMeq06D2l9RZUatLIu9Ka5J6k3tL8rcVyNTYGe730GhgI3bME
Message-ID: <CAPj87rN7QQ2XRa4KnaH9MZrvyRcRWWrihSKousR1j7GD+bEQtg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] TEE subsystem for restricted dma-buf allocations
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Feb 2025 at 14:35, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> This can be tested on a RockPi 4B+ with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml \
>         -b prototype/sdp-v5
> repo sync -j8
> cd build
> make toolchains -j$(nproc)
> make all -j$(nproc)
> # Copy ../out/rockpi4.img to an SD card and boot the RockPi from that
> # Connect a monitor to the RockPi
> # login and at the prompt:
> gst-launch-1.0 videotestsrc ! \
>         aesenc key=1f9423681beb9a79215820f6bda73d0f \
>                 iv=e9aa8e834d8d70b7e0d254ff670dd718 serialize-iv=true ! \
>         aesdec key=1f9423681beb9a79215820f6bda73d0f ! \
>         kmssink
>
> The aesdec module has been hacked to use an OP-TEE TA to decrypt the stream
> into restricted DMA-bufs which are consumed by the kmssink.

Thanks so very much for putting this together btw. This is the exact
thing we were just starting on, but you beat us to it by a few weeks
it seems. It's awesome to have an implementation of 'real' (if
useless) SVP, so we can actually exercise these codepaths in open
generic code.

Cheers,
Daniel

