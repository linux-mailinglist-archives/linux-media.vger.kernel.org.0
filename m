Return-Path: <linux-media+bounces-24033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D48D69FBBEF
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 11:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66A81188A5B5
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 10:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644E81B2191;
	Tue, 24 Dec 2024 10:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ly9eWRCe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0252319D062
	for <linux-media@vger.kernel.org>; Tue, 24 Dec 2024 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735034437; cv=none; b=T8iHZBNPO0qR5J9C49aw037qm8+9WwxS4ai0pMi94+jAcrz3JaV4xV6OrfE6Tli34+2qFiHBjc6ouLUYgrxS6L1NXgKZ5wx6cQoi7JUev/RSq8qmuWb4Nk5GAMT2Ydfl+ZodLB5SVjR8h1xbsjFiWRInYkhsbmoNZca5+UNbNeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735034437; c=relaxed/simple;
	bh=8XQU4AFQ99JIlnWm7jQY5/c5EUKQEK88Ogp7v8PxkQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgEojOpckaU1OqjFuRaf4Onmv6kl702Gr4qVD/IjUcpebvtJyARhsC0n2DxDeFwmt4lcf26Y8AaPvst0xYAPPrilbNciTlDjkJZ8zIjM1RCm6DZWnH4G9tmGtm4beYsgbPbj8jnKnDiKlCmPHblCRmiinDwixZQnczuzQVqcuYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ly9eWRCe; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30219437e63so62677821fa.1
        for <linux-media@vger.kernel.org>; Tue, 24 Dec 2024 02:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735034434; x=1735639234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CaXLFhyvddY8J2ykAWjPDBthPNDj/QrO8YN8626lces=;
        b=Ly9eWRCeaUz2cFmuduBai2ZejszCa0s8mM4BFr079c7+a/gQrscWMdOSqnwHmHDZyT
         r6gVhCOyAV2VBvS+XysWz/r3CrNvNDt8Q1BJXPzHhQ1WVrgRE7udM8l9TpErwA85rqR+
         1TovOT3FvwsKl7M2o/NWBAQdkigSBIz5ifexm1vpQy+TG1XL/UxJwK9/CacQTWngcKuB
         n91gEsVvmZcHuHNGEyFDc6sAOL+ixbjIIkH8BENNtNR/T0QVqP7P5ngCWX3S6jOxTfaK
         Rw8jCtS6ieavLYQkriSFAQ4hPfOR1XlBYAR8lUqEwjZpWb1xwMWqgRS2MgQOLO1jC00z
         6TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735034434; x=1735639234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaXLFhyvddY8J2ykAWjPDBthPNDj/QrO8YN8626lces=;
        b=DxWVeIBOtXR7jI5ivJQaBnozzRCl7xP/B0EsLoU0flsmyqTSfzRhpuSGYqc+t62Urw
         +Jh6S3rfay8bmGWX1/cHNb8EmFsy49ELyhEJSizSvvisRnArvG8icz4sGJsuamXjHAHK
         h+ST8KXSNm1GIzvQ2LlabOfishXHPk1PPyq/4oi0zGsj7z1M9bAOqsxbjD7hQ+AA2ctF
         aRU4761/BCfQwTzTJwQ9+qx8o4XGY3UHtY8mvhC/AJq8YRo3SyyR8CHgr2E2t3MKr91V
         LveY6Yq5imYJKIlHYdwTDKfoclwgjlqLWJQl6fJwxtqNdnxEICghU2KxPVFODl4YOSwh
         /taw==
X-Forwarded-Encrypted: i=1; AJvYcCVOka8q2UMqEUHsEXMwKX2PWtZIyqx0wSwfE2ip+OHfjZ2LJcfNNpEacMtZTgl6MeOS0szNNK7ykIzYMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq4vDRJYxhfzGhJewx8hf6YePxgrIgdoqoHC1hLWACP6XXOdLP
	CRCX5GAgW5gETJdodR7sHYN3VbygecFZeQ6+csCLX3H3xOE4pQPX6/ve6oZdqFE=
X-Gm-Gg: ASbGncvwDiYizldOMavhzxebOyLnz7Kas7fQAKmxKQUe0csX8O3A7FrNH6Fyv4bDfFW
	Sv+D/PsSPS9jmDjsM8pQq9nBbxKeF7Mb1bP6jQzb0/hUnza09hFnHtGnvPLrSYNPyXEiFiCeDJH
	OBoTBNZMacih2T0sdMsXGLMdO+EbNIfjQ50EIn6Vto4Mels4vPSpPYHh9K5vNfJCSan6TOxHc2Z
	B2qsF7c9ECTBBtBEaJPplFFZrnbjb3DX43pItIE9xIuAz1DYqyCXYRP8774TRHcP4bm+TPS9yAT
	6I0/1VYtEPuOHZ13V04KHOX5Efg5hb+gnp+E
X-Google-Smtp-Source: AGHT+IEtJ2E9FABbPtAZzZbxNdp+y65cylCWsCGjfOG/8r7Qoah/U7UWd9bnkQBDUU5mmh+x9lgJYA==
X-Received: by 2002:a05:6512:6cc:b0:542:28af:814 with SMTP id 2adb3069b0e04-54228af083cmr5136432e87.19.1735034434112;
        Tue, 24 Dec 2024 02:00:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813882sm1556243e87.168.2024.12.24.02.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:00:32 -0800 (PST)
Date: Tue, 24 Dec 2024 12:00:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Sumit Garg <sumit.garg@linaro.org>, simona.vetter@ffwll.ch, 
	Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <omjfxg4gftxubikx5ynu6if6fupby3nulcilw6dhwtuetpgl7i@2gwiupvg2coh>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z2p-v-xjhzhPso6u@wunner.de>
 <Z2p_ucfNOyKcbWhH@wunner.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2p_ucfNOyKcbWhH@wunner.de>

On Tue, Dec 24, 2024 at 10:32:41AM +0100, Lukas Wunner wrote:
> On Tue, Dec 24, 2024 at 10:28:31AM +0100, Lukas Wunner wrote:
> > I did raise a concern about this to the maintainer, but to no avail:
> > https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/
> 
> Sorry, wrong link.  This is the one I meant to copy-paste... :(
> 
> https://lore.kernel.org/r/Z0rPxCGdD7r8HFKb@wunner.de/

Herbert asked a logical question, which got no response from your side.

-- 
With best wishes
Dmitry

