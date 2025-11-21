Return-Path: <linux-media+bounces-47548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F016C777CA
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 06:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id DE93A334E6
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 05:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE452F28E5;
	Fri, 21 Nov 2025 05:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="muI7o5ae"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658532DE6E6
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 05:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763704342; cv=none; b=LD8ZLQ5M78X5ByQ5RJndZIa65cSh7MmIEECO/brL1wnuUF59EFKwVYgAKb7m+IaD7iQso4lWdk3kkvzqaf/YqT3E4bKgfnbXJVgTnLzMdFwaHeNAiBRuWIQS+gJUMFk/CtTXISsWu5uzieJ/IYhS92t2HpHlcr+qFjc3UeULh5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763704342; c=relaxed/simple;
	bh=f3AJGPP8zMc+R4UOzL+aeZF1qHpaPM6Ue1kyKZrrIYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEBNdJ3bg0MchJsE21Zpb5NmL8iXXifVbODtuS9sUhxKOb7KAvfM3cJ7saTtOmWeYT/iKCVlqpoEX64lgrx3OOSFBgXcsy6WelKDXujKqNocqq8nxMvxsRHIJuZ+ootmRqgZgFderg6w0Mv4iGlCI9M0sNtvJWGvU0YeLIk1Rqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=muI7o5ae; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b73875aa527so259930166b.3
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 21:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763704338; x=1764309138; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f3AJGPP8zMc+R4UOzL+aeZF1qHpaPM6Ue1kyKZrrIYA=;
        b=muI7o5aeZYCzGdRqLe55pi4Vwzdn76IfGTbTqEINBI3anapTR99/kdRj4B1OcM5Hwp
         yl22lmuIMNyU05vmFpLPBvZ5iT67bwTF1nWWECdcRceNCP1/k14SxqY+r/6WDpAZJ36z
         N/ixWkQnbo6IHJR4sL6b8c0ixI4NDvjulR/OLCCXeWEfj2rnQHg+XUgtRlPI086ak1+x
         MhoiLLq6E2LHRM2MbZ/M7PXviQ4FcdXw2PXDaEdIQgTH4gjbFp4B33xw22VKpbnf/cFX
         HBejdsi9COTbiah95bVIy0/adPPCwOk43mr75DWcuZYHEfK2o5ruZ8x+jKSeQFxp6JB1
         PCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763704338; x=1764309138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3AJGPP8zMc+R4UOzL+aeZF1qHpaPM6Ue1kyKZrrIYA=;
        b=HwBAQLsJZ4HJQN6X4ulxNCOQfOPcmsK5iKRVlIt67i1hu0H0/R7k04KgL7WtOzNSPp
         kkh4/9BF0iVWOjb30fehYxOG/Ne3vU983o0oDr8MwpVBOvkwHoyDtZ85JRv2p1oeZ1Z2
         XI8pfF87jKHOb6BUchw+Tb6avw3u2nSeuZrECASKFSaCHyCpNAaqvrEdkLklQvRzznXB
         PPED/e0W8TJYYXsZbSlhZ/uLLRKivuyN+9ETzYiPGNcbvkrjnMxM2QPhGCRBtsBkZHms
         P2on5pTsBExYEZgUiJAmdGeQr9271+QuHBHG+PdYToX48MhZ2PU31vbqHTXk9Zf4fJ+n
         /EOw==
X-Forwarded-Encrypted: i=1; AJvYcCVxuA2X33kMBjbASg2q2/Zm1p6DjX4pU1XxXRzpSzAol4Ac4M7KPo5K+g1/i+yOSwF2A9vPneJxlOp+Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Ems2ZosrMvGLVGKEH1KvF8hNHUW6F3He8y48zI69xRCVYUwt
	5+Y41PaB9OdVJKnQN5OpFhitocGveBTU3TXT6huY8OgvepOAkD5DUwZZZ/viuLrY0zlSpwiBEtT
	NHgC2Xlx9qegN9AU+DET7Psy1lEuQIjFJYhP11Id9HjoTx0Hq4iGN
X-Gm-Gg: ASbGncs+Qqtmz64mLs8NoNGr4boXt3M+OeP32kgywFqDfTAJio5oOEUd7IKvrsiaap8
	uoOIIjcbFGPxFr9sUsjZw5s+ZxaYQZ70oDu2H8gWKapyL81XTZUKT7SDK3GXpqTkZbd2Q189SG8
	wbGUksltlqyCM2zsFQH4sM6ZLfMOSPr1H6wExEoDvvCucmukTUmalRwDsVFl+X62FWb+nxlIYth
	tW78fw04tusZITju4+RCtHpJ3rKHyfLgmEJwz300XFiPDKY5VN0zITXg5wRpm6Dy+ijiM7CrEo1
	9pY40w==
X-Google-Smtp-Source: AGHT+IH2Ft4P3PaBHYHUb9eBoowl1r0fF++S8Pm7hX7zw/Psj+ebZMqK+8HVlDkHZMDyBQFS0hAWL9JagTsIi4EtO7k=
X-Received: by 2002:a17:907:9611:b0:b73:8b79:a322 with SMTP id
 a640c23a62f3a-b7671549d5amr89779966b.11.1763704338528; Thu, 20 Nov 2025
 21:52:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021042022.47919-1-21cnbao@gmail.com> <CAGsJ_4zPrgkb37VCfY+C8Dn6dS4LmSMrHnfU7Oy4bR19yhxbAA@mail.gmail.com>
In-Reply-To: <CAGsJ_4zPrgkb37VCfY+C8Dn6dS4LmSMrHnfU7Oy4bR19yhxbAA@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 21 Nov 2025 11:22:07 +0530
X-Gm-Features: AWmQ_bkvqJFF6U-BXLQ5aYDwfQ_Tm4IRMssNoeoYXGILQhoCtvIipXPadVOiAf8
Message-ID: <CAO_48GFhmJoivvaPFFxyuA+UH9woC1JoJE4=HeKa2nmPGA53-g@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: system_heap: use larger contiguous mappings
 instead of per-page mmap
To: Barry Song <21cnbao@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Brian.Starkey@arm.com, 
	benjamin.gaignard@collabora.com, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, jstultz@google.com, tjmercier@google.com, 
	v-songbaohua@oppo.com, zhengtangquan@oppo.com, marcin.slusarz@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi Barry,

On Fri, 21 Nov 2025 at 06:54, Barry Song <21cnbao@gmail.com> wrote:
>
> Hi Sumit,
>
> >
> > Using the micro-benchmark below, we see that mmap becomes
> > 3.5X faster:
>
>
> Marcin pointed out to me off-tree that it is actually 35x faster,
> not 3.5x faster. Sorry for my poor math. I assume you can fix this
> when merging it?

Sure, I corrected this, and is merged to drm-misc-next

Thanks,
Sumit.
>
> >
> > W/ patch:
> >
> > ~ # ./a.out
> > mmap 512MB took 200266.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 198151.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 197069.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 196781.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 198102.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 195552.000 us, verify OK
> >
> > W/o patch:
> >
> > ~ # ./a.out
> > mmap 512MB took 6987470.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 6970739.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 6984383.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 6971311.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 6991680.000 us, verify OK
>
>
> Thanks
> Barry

