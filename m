Return-Path: <linux-media+bounces-44555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F55BDDB84
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 695245036B8
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDB831987A;
	Wed, 15 Oct 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtuBcMqN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B8030BF4B
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519665; cv=none; b=Cad1idzabbsB0OkaRj1jaDJE9JhbtrbRxSgAwNL4aw4EnT+w0qheId0SkhJVs9zKJGL1rVqFyp1NBRk3t2CSPNwDeWBi8DIEzouCu7+CZtim4Xs/OnjqPsD+fvbdzS77gN/xcsLtV8eNWrWEMkoYiEFkOIr88Gwtnbp3EnhVbeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519665; c=relaxed/simple;
	bh=Qo85cpAcxd1oyT2wxP7RRUqLYROiON865+d7IkM/010=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNbaWSKDD+oUN4R2DdNdbTY5ED4U9B700cWX/jOpOuk6vH2LerjT6s8smJnGNhs+WkV4+1ZbjdPZYthFPByKQbV3xX1Qwy+L4HYjQGXIIBcQnZe8wuoyJYjavc3VjLSNWrqf3wz4gYDRFOLFKZhvYbVXDk/B4Iu6Lppjg/RfjQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtuBcMqN; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3776999686dso1617781fa.1
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760519662; x=1761124462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNter1wl1oLLlJYevVTo4vpc2F0Z/0nnhZY0eR5fUuY=;
        b=AtuBcMqNcUG+WI1oRnPTWDUXwPrtWwwm8lZ7pci+irdpcTj27ufgKleADvjMk3d+V8
         IGhLFR30Ac8m5he5qZmJiaYR0EuQgbU9fkWEUYWqe9cLLWddWzVCpsIyAj327cJhZU+z
         MDRRoNG+8y2rkSmOIDQw6w/LAs4CDwRR9lcr5912gFewG3aTcQaKUFy8Mt41HSS+FpN+
         RhiksK1EOdjIo5ZXI0DtjTV3gxEE9Y7xbiEldxareeHl+yQqKNDytPWjKNpmccTjltBz
         DhaT985iA3HEkXd5z5ULforaB5Wsm2tVO8G5HWr3+CM60cdItnEiIKcwyRtoWUgMi2WS
         FflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760519662; x=1761124462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNter1wl1oLLlJYevVTo4vpc2F0Z/0nnhZY0eR5fUuY=;
        b=YK44XZpi/Ibgar00Gff8+aLoZrmjgossGMsWf0enDO+WmrGBZmxeUZ+X/hS7GMVmu0
         fAMHPDA5Lyo9gi9Gws9s3qLS3KUd/RgskuTVmPXB3rm9yaNrahVce4EBhGOP2BoMTr9W
         bhLlMB5xrxI2zH/K5UaT21raM3FH0gFS6VrYoIxBdBKKc4EGNXTXCF7MizvlI4GnELEY
         +G8TxAlaDRMPBgAidtVb+7Tgvmt6UGZMqsbbHvtoNOlYyqsiiCvtuoSQk8QHQE6oxWMD
         pzMv7FmuGUWbwigSGRj9lAAvD7RGL5tkJdOySeZvKTqX3aV9praWyIwICBcPjvU+xjM3
         /unA==
X-Forwarded-Encrypted: i=1; AJvYcCVvpROrFh60Sjiw/MInKV8uiiNV5fQ0Kpw4o8KAbW+njLJZBO69QMoq4rTWvtqDP3pl6pjDnIFclGv3GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysJ3/xGVZzkKaL6NqtHp8Hi+hk3NCm9Uv9x/H119ALiRdkcAD6
	D7+dN8f9bX10T0G8OdEd+C0ziFuNgP76Bok+oxSPWYzXUjRUDc7ExiHWCn3OSEgkQeIqXjhasLS
	ZHWKgj0KjR7jwDq++WoevL1uXQvuMTKc=
X-Gm-Gg: ASbGncvONJytGjyfqVv3pr1ZcthtIY9TY/WdSbq5Ra6VAEIZhjyuFQ+BPZcwGm/tNAC
	XyiKHasmZsO3KtL0Yss7cj53MNV+tbx9vwnCYn4CI4UzNt/zEkLMrjhOsmB7Uy8Fcffg5X+XvxL
	Mx+TFhaozfsEI0i8wggQ0gmBTwLe8jNN5dwCNhnu7RS4nuRkAfvYaW7PSgRkjmwR5OX8LvLxh0N
	G8eObcPEHkdJQcFIIiQ48L8jjiRHbkTB6HqsQ==
X-Google-Smtp-Source: AGHT+IHIzIhf1YNCI5C8onxDXaNTHHoiFmiOUpxt66KIf78orh4sRuZHDUQFOMD42XgkZiDlsjMqDxaFdaNS5QPVDow=
X-Received: by 2002:a05:651c:19a2:b0:371:ef15:f19e with SMTP id
 38308e7fff4ca-37609f1b402mr41581191fa.5.1760519661576; Wed, 15 Oct 2025
 02:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-3-zhaoyang.huang@unisoc.com> <87953097-a105-4775-88a5-9b3a676ff139@amd.com>
 <CAGWkznGN7W-txq_G+xpZ6DtH_1DNorYc=CxqUjebo7qfB4Sxsw@mail.gmail.com>
 <ecba7133-699c-4f3e-927c-bad5bd4c36a3@amd.com> <20251014171003.57bbfd63@mordecai.tesarici.cz>
 <97da9924-9489-4d30-a858-8ee5c87bc031@amd.com> <CAGWkznGnmb=8GgcrfDvY2REHdRZYVXZy=F3thXhK0FaSoiK7tw@mail.gmail.com>
 <aO8TKQN6ifOSMRSC@casper.infradead.org> <CAGWkznFG2_WGmLRmHnjV-49iTX0mrt9jxQBzZYK=K9U7eKJD0g@mail.gmail.com>
 <20251015104008.4bcd99e7@mordecai.tesarici.cz>
In-Reply-To: <20251015104008.4bcd99e7@mordecai.tesarici.cz>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Wed, 15 Oct 2025 17:14:10 +0800
X-Gm-Features: AS18NWBFNrpCd7vYazsrAzxjhFltbgGwOyCb8rBQZuWBjfGrYICxBoM7m6ifLQ8
Message-ID: <CAGWkznEkVz8p=Gbc8JC01SLkUHdTPW126z-fsJCZhoOLDSF5vA@mail.gmail.com>
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
To: Petr Tesarik <ptesarik@suse.com>
Cc: Matthew Wilcox <willy@infradead.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Suren Baghdasaryan <surenb@google.com>, "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 4:40=E2=80=AFPM Petr Tesarik <ptesarik@suse.com> wr=
ote:
>
> On Wed, 15 Oct 2025 13:52:57 +0800
> Zhaoyang Huang <huangzhaoyang@gmail.com> wrote:
>
> > On Wed, Oct 15, 2025 at 11:21=E2=80=AFAM Matthew Wilcox <willy@infradea=
d.org> wrote:
> > >
> > > On Wed, Oct 15, 2025 at 09:12:07AM +0800, Zhaoyang Huang wrote:
> > > > > Could be that we need to make this behavior conditional, but some=
body would need to come up with some really good arguments to justify the c=
omplexity.
> > > > ok, should we use CONFIG_DMA_BUF_BULK_ALLOCATION or a variable
> > > > controlled by sysfs interface?
> > >
> > > No.  Explain what you're trying to solve, because you haven't yet.
> > Dma-buf works as a memory allocation backend could loop thousands of
> > times alloc_pages for allocating order-0 pages to fulfill the dozens
> > MB demand, this commit would like to replace the loop by once
> > alloc_pages_bulk. Whereas, alloc_pages_bulk_array perhaps introduces
> > extra memory allocation along with direct-reclaim which could be more
> > expensive than iterating the list. so call back the API
> > alloc_pages_bulk_list as well
>
> This does not quite explain it. IIRC you mentioned allocating 18M as an
> example. The ideal outcome in that case is:
>
> - 16 order-8 compound pages
> - 32 order-4 compound pages
> -> total 48 calls to alloc_pages()
>
> But presumably, that's not what happens, because fragmentation makes
> (some of) those order-8 allocations fail. Since you talk about
> thousands of loop iterations, it looks like even order-4 allocation
> fail in your case. Then I agree there's not much value in trying to
> avoid further fragmentation, and after so many order-0 allocations,
> it's probably also pointless to do memory reclaim.

Thanks for the words

>
> OTOH I can see why the opposite approach is a bad idea in situations
> where fragmentation can be avoided. To make things even worse,
> alloc_pages_bulk() will rather split pages in the preferred zone than
> try allocating from the next best zone.

but the loop of alloc_pages(order-0) could also split high-order pages
one by one on the prefered-zone, right?

>
> To sum it up, Zhaoyang, can you please describe in more detail what
> happens in your scenario and what you believe should happen instead?

My goal is as simple as eliminating the loop of alloc_pages to get
some performance gains.

>
> Petr T

