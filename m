Return-Path: <linux-media+bounces-57965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CQ8C5JxzmnxngYAu9opvQ
	(envelope-from <linux-media+bounces-57965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:39:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AF7389DFC
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EEA38308B635
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 13:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272B230FC39;
	Thu,  2 Apr 2026 13:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cf03oiU6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DA03019DC
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136769; cv=pass; b=GurFRi9IgQoy37G0LQ+b4depLitTp+l73Q6bICob/LtCww52yYD+7z+qu9tdIn5VzOM4S6VbH023do6zC1b011oRZSiJ7yF6kn8eyO2FXRLQQ43KVlgAja9ngE+nOEvzQz9vG9XENObkoJ4D5OtPzW7lQPgF6xHkAHfIZtZn9u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136769; c=relaxed/simple;
	bh=nsx2hYjw+sV8/0qohJ1DlKPwBoo2zkp1J5PdzUN8MV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R83C4AYAaaEapif6uQbKmPPX9SNggIIiGjSJgv/QArDOaVYteMwcDuBnKkrkzVidgW7MAol3q/KrdDqkMo24W8RNJlIG4ZSpRNuVs1e++gXzs1wJg7UDyQM97xStlmH7O+IU61JUpfHB2MPFlSu3Ccixv9VupJa6PZz5TVCc1i0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cf03oiU6; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9358dd7f79so168686466b.1
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 06:32:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775136766; cv=none;
        d=google.com; s=arc-20240605;
        b=TitEFoBE+5jfrEDJ+fyQRHgonOdfPWpXa/ufRphcClgNXdNvdDSqBKmVloo6vtb9RE
         mP6W4SZRquLNmJF/fVF9II4EVhH8W1cuy//crHF9FWkAAgJHHYBsR/psvLvDBl/5L6Fa
         2qlRJ6O1YnPrz9pcuf3Q6djoh5Ygnr9Utqt76DN+zwZEBDSpMdAGOGImk7zIf52r9QId
         jjLlOqQRDx5KuDY824QnXxe4e5ifxnt47ZkDeMkQSBqJyUp+7Aa+0KQIxrrPjq1LHfLB
         NFDka1zQ5197SHBjgOu4V+wnv8Dkf0RqMfLi4GcU5+AwK768i6zNQzyXCpPas+g0ItVS
         GY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nsx2hYjw+sV8/0qohJ1DlKPwBoo2zkp1J5PdzUN8MV4=;
        fh=IMTzFnw/EA4YL5GqVK3U9tWhZbbunoYEIpVUY37zeJU=;
        b=Wu/t5BUgl6O0IbuKRHNIpP6NYNm4aMkOcUKykBgMyzZNMOCVb94W4xL4Y6WC44mD/h
         sKBVh7DpBRy297Qwn8JFpO54NldavCeTV0ljG5CnPuMJx0ynC4T/rawjbIxElovYV1A6
         +OZLycxqmL/KDaa3t42PDCo6Kl5wQEmx9rrySSSDvoHFsn3rISlK+dHMr4NIPFUmj+Zp
         xS6VuwVKIcqPacssZNPXQSQwyWkFp8QWO0njDT7G0Y4nQ5Knp1aLK13/hyp3ZZwX17JM
         nph2b4og1EY1N1wHqldxmCQn7WKzV8/LWrBwLf6C9AOntgE4bVaaYek7XZ2mRNtcI+9W
         F46w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775136766; x=1775741566; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nsx2hYjw+sV8/0qohJ1DlKPwBoo2zkp1J5PdzUN8MV4=;
        b=cf03oiU61hLq1UK9tuKTedhb1Wa5zTzmpuVz6o8Pp1udVLoS99Q3feG2Fs5cQ3QO3t
         JDPexsQQCdx+dMlDmvg10Hq2zvU6ziaKjQPxJQTbMBu4GxiDL4YNhAeIbjMjwW2XHI5q
         kdV007NdQjYg2PkWJUyMmy+mL0cFufkq6/P12aVnnrAvHwJgzOYP2xE3A8sX9d8LPFXy
         8p8xinlRa8rDNlezlfYthCnpoTwf/Rbz2K6oHlFdF0jS1db0zrGNKvghO+ttpbAPkkFG
         S046LAL5TXAPOsQdL5ANE3AeKvryjM7pSMQXAEM3J5agZpj1yC1P9EjiaxsPF8wHXGb2
         XTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136766; x=1775741566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsx2hYjw+sV8/0qohJ1DlKPwBoo2zkp1J5PdzUN8MV4=;
        b=j0L62h1syNjguyqfHMYiwyX0HH3SNJ+MgcYYYHfDyngSETWbDKezPsTF8f7vzt5Q+o
         V4dcjBwNzi9Bc/udqVLyVcQoNdSe9gLJAQvITBhjVdDmDNgf9iRCApHJ9ms9za2QG+mk
         DZw107LRJLj+tVBSS8AWCxiNZHC+QJX+eCiQRBmqr0oTwtUZr/ztCup9A1QByq5Yqa32
         w9H+G/HqzbtokJK8664Ebk3ECxmm+p1RYZeoo7+GOGKA150NP1LH/Kbhe5zH5649VjIZ
         zbePAUDjX3dzLZOm44XRoVSD7Qhc4aDeq5/ZS07DlXp0+4khYUEJfMUBLp83ejT/TsHN
         5YeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoEDHEKpNttisd3FoOOo3V2ITBRkdQJCiDtK4FZBDKDys6qaD/9D/fnkdtnLxm5GWYyNQtrex6E9NGjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLgKLdcxsJxLk5tMzsyQnIPMo35KOx6b69NnbkwYz7JlGxR4mi
	maKM3qbqjZTg1qXEXgR8EkpU5x7gZNcMaeOv3DpJhAd7KfQn2jqx2Cq661mxVYb8IOeWzMHCAje
	wrhBUozMsgVPDW9E4UcZKNHlEWGJJTEUkP5iV7MVRkQ==
X-Gm-Gg: ATEYQzxEL3Sm4L9zD20/imae1h2rupmDkrMYuOC1WZfZOPoIGUOg1mui5LeuyN3InEG
	wC31aKt5WRzPr8yramrXAvPtDzv4y0Qi7TAwvx4GmbZNNANs6H9EWaQTjAbarAufiZkO/UH2ve6
	FgNwIIDM9khDCQ4vA305d97tuz1jOAC/72sQrOTmH5/r4hy83Kb8+NnAaU3EiwG4aQF3fTMAqfG
	yznnmaqCWrc9sfjh8uxVyPSeC/6CQrKCkXMX9wtqwuT2zJzg6kiuH+JKypZ5+ZlFpku/PihXC8Y
	BZR/gkI=
X-Received: by 2002:a17:906:4912:b0:b98:695:ec53 with SMTP id
 a640c23a62f3a-b9c138c110amr392586266b.18.1775136766273; Thu, 02 Apr 2026
 06:32:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260331100026eucas1p19bdc2aaca4c9a48c6f6ac8fec71478d8@eucas1p1.samsung.com>
 <20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org>
 <46397de2-eedf-4e09-a83a-3b683d154fe7@samsung.com> <CAO_48GEFQE_FJjuq1UqP=DC6LJE8jjE3C+4FdAyB4uEZDsnFJw@mail.gmail.com>
 <20260402-burrowing-fine-bloodhound-afcebc@houat>
In-Reply-To: <20260402-burrowing-fine-bloodhound-afcebc@houat>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 2 Apr 2026 19:02:34 +0530
X-Gm-Features: AQROBzBU7_o7IRQH6mzOKTP-KDFv7IkPoqq1yaLRTD3AfvGaKguQAkczWk5rypY
Message-ID: <CAO_48GHzMpKHQxmS9ADd_Z9G56uWOPfJ-qhNek7ubgkk_yjGDg@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] dma-buf: heaps: Turn heaps into modules
To: Maxime Ripard <mripard@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Albert Esteve <aesteve@redhat.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57965-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:dkim,samsung.com:email]
X-Rspamd-Queue-Id: 19AF7389DFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Maxime,

On Thu, 2 Apr 2026 at 18:42, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, Apr 02, 2026 at 10:36:48AM +0530, Sumit Semwal wrote:
> > Hello Maxime,
> >
> > On Tue, 31 Mar 2026 at 18:24, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > >
> > > On 31.03.2026 12:00, Maxime Ripard wrote:
> > > > The recent introduction of heaps in the optee driver [1] made possible
> > > > the creation of heaps as modules.
> > > >
> > > > It's generally a good idea if possible, including for the already
> > > > existing system and CMA heaps.
> > > >
> > > > The system one is pretty trivial, the CMA one is a bit more involved,
> > > > especially since we have a call from kernel/dma/contiguous.c to the CMA
> > > > heap code. This was solved by turning the logic around and making the
> > > > CMA heap call into the contiguous DMA code.
> > > >
> > > > Let me know what you think,
> > > > Maxime
> > > >
> > > > 1: https://lore.kernel.org/dri-devel/20250911135007.1275833-4-jens.wiklander@linaro.org/
> > > >
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> >
> > Thank you for this patch series; now that it is needed by more folks,
> > I think we can merge this.
> >
> > Marek, I'll coordinate with you on this - thank you!
>
> If Marek plans on sending it during the next merge window, maybe the
> best thing to do for us is just to wait for -rc1 and apply the rest of
> the patches. Otherwise, we can merge the branch in drm-misc.

We could do that. Are we ok to wait till -rc1?
>
> Maxime

Best,
Sumit

