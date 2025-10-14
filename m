Return-Path: <linux-media+bounces-44443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EE5BDA47A
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2F2B24FFD50
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 15:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0C02D29D0;
	Tue, 14 Oct 2025 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T0p9r5jB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D76224244
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454613; cv=none; b=tJIKCMWjmtPQz7baeK7vDGt+wLHeqR8UZqW0Iyt9DI7m32348NrNk4mBop+kq09B++WKCz1DBSD2d4ES9vsqressZT8KL1xIu3ULc0ZWGOPyvC0AH7wMGGpES61oZ8DmOl/1nygU+FTgHVmOb1YRIFwd038kif76guZb+o6yrnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454613; c=relaxed/simple;
	bh=+9sQqZFGj6pjO2HmOLKtnRlFSVSp+ASbakb0jxv6v+E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GqqwnnSJ16s/048l6eNYpxikZOg+uFO6o79mHYvItOWgoavwoMWRcg2RUneBD72DX7RbcwHrFE1fuBsLMtZgo44spvD9H3qRqA0AMR/2Uu0JyuKhS88yAl0e6O/oAjl92AB3/kDy1nSwsS3znBWjmvomVx1PaEySKO/O+zFn8YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T0p9r5jB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e32139ef7so8713585e9.1
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760454610; x=1761059410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9sQqZFGj6pjO2HmOLKtnRlFSVSp+ASbakb0jxv6v+E=;
        b=T0p9r5jBQg5JXq08Q+XBRrtiI/r2VoweFjuZsy73GRkwFH5Ouzm2qK3t/9bV5A93g5
         XlkljYlPrDtgMk+CwpK+9DXgorSbaA8QE16rIHIz5zrtZCx2etQcCum9T+boiJKrmv4H
         qe4+55uzRQeaFraZP3rP2dC6Q+03bRKBj+Fj0iIe6anEtOItOWi8BBfnee3vQKucUBoD
         jBsLlkMtdHpzDcivNOzVdf+jNkv9xF9gZqemJLWoZ665zYrZoMj7U1PRp7M0nhexeGJD
         8gWL5FYaUjKp0XsrdLu+CC3RRzApd3cZ4iV8FDZHZOf9jx0pGXeGojLFEtCIwvKiYAIV
         yDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454610; x=1761059410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9sQqZFGj6pjO2HmOLKtnRlFSVSp+ASbakb0jxv6v+E=;
        b=MLR0Q782x5TIC5meZm8jqXWV9c2n9xKSQ9j9cKE8NEhqTcxe9obQIPlLaygsFdyWd1
         Mb5MPV1t3eddO7/bEWfn4/6HZdk12mpgTscKLJholtsadCcQ+PKY1mK2uZ1Hy+xQZEgL
         iVImb4uq8S9AlxcuOu5oGvEYKVjSuv5x2dQ19T+VmOBEd6fbS1l87SIxKio+33JwTf4C
         yw+DaZwDhBYqmW5Mo/0kgXYpRqjwooVVZk9c0J0j+4J2v7TpR+KS2JW1vQjU5XsYbBnA
         842J35AbBjs80y9kfZPWcwNuX50WEbl7LbG9xCHhvAXtGEZPy7jUaWAbHRa4N1Xm0Ebg
         rlVw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5cbEv6YQQvnG2gBULv6YyvJYZB897L4RArcY+gIUHceTzRdTJdAIzEsJGQpPrhnwZMFvqvuDVedD3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrcfZgdVC0SRbHXL8gWBFOAr9rVfJDzQGhSC5cK3Q19Z4QkPP8
	12aWhb3xbuyscTuSijicRHpeuWagG3t+biWZeYv6cVEePvsyCIsIqO9YS1KXRNE3sL0=
X-Gm-Gg: ASbGncs6eBLXVmT8yw10D684RsqRIyPeLdg0gKU+SaKay3XoIEAs1f8mJom/LShNL8z
	NnrG6YULDqKg/AQ6zi1e8Iq8wUvo96WfmMFgfN1mhr3BruKlp0zz8krITYCBgiJ0V8kAVXxDTh3
	jbYEIk8mhE15LEjpFuwpff6PSVcrMXVfJi6yBZffz7kF8CD/ixkmHwy3Ds1ralFWUuEog0XfDlb
	nu+/AcdDp46JBqGdPzWGe692BlQGTi227vFHdETwJo9yMJpUmIesp48+coZfRdI1aFEsDuOgvE7
	/jKuHyXg5TqBfZs6FZy+dVIgVMb+dH7BKcDM/48NSk3sZKVHiAP/oYigbb7R5DTGAp6tXhI0qJ1
	LL3j3enYsF7rG99VliduLi0Y=
X-Google-Smtp-Source: AGHT+IGAXLObLFqWvdrlT8jNvhDt4TeOuL5i0Y/T3RwGkmTWxiheZJLoRR4en+J0WUHha4o/PPCBLQ==
X-Received: by 2002:a05:600c:4e93:b0:45f:2919:5e9c with SMTP id 5b1f17b1804b1-46fa9a8ae60mr100424145e9.2.1760454609668;
        Tue, 14 Oct 2025 08:10:09 -0700 (PDT)
Received: from mordecai.tesarici.cz ([213.235.133.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489194dsm244369755e9.12.2025.10.14.08.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:10:09 -0700 (PDT)
Date: Tue, 14 Oct 2025 17:10:03 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Zhaoyang Huang <huangzhaoyang@gmail.com>, "zhaoyang.huang"
 <zhaoyang.huang@unisoc.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
Message-ID: <20251014171003.57bbfd63@mordecai.tesarici.cz>
In-Reply-To: <ecba7133-699c-4f3e-927c-bad5bd4c36a3@amd.com>
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
	<20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
	<87953097-a105-4775-88a5-9b3a676ff139@amd.com>
	<CAGWkznGN7W-txq_G+xpZ6DtH_1DNorYc=CxqUjebo7qfB4Sxsw@mail.gmail.com>
	<ecba7133-699c-4f3e-927c-bad5bd4c36a3@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Oct 2025 15:04:14 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 14.10.25 14:44, Zhaoyang Huang wrote:
> > On Tue, Oct 14, 2025 at 7:59=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote: =20
> >>
> >> On 14.10.25 10:32, zhaoyang.huang wrote: =20
> >>> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >>>
> >>> The size of once dma-buf allocation could be dozens MB or much more
> >>> which introduce a loop of allocating several thousands of order-0 pag=
es.
> >>> Furthermore, the concurrent allocation could have dma-buf allocation =
enter
> >>> direct-reclaim during the loop. This commit would like to eliminate t=
he
> >>> above two affections by introducing alloc_pages_bulk_list in dma-buf's
> >>> order-0 allocation. This patch is proved to be conditionally helpful
> >>> in 18MB allocation as decreasing the time from 24604us to 6555us and =
no
> >>> harm when bulk allocation can't be done(fallback to single page
> >>> allocation) =20
> >>
> >> Well that sounds like an absolutely horrible idea.
> >>
> >> See the handling of allocating only from specific order is *exactly* t=
here to avoid the behavior of bulk allocation.
> >>
> >> What you seem to do with this patch here is to add on top of the behav=
ior to avoid allocating large chunks from the buddy the behavior to allocat=
e large chunks from the buddy because that is faster. =20
> > emm, this patch doesn't change order-8 and order-4's allocation
> > behaviour but just to replace the loop of order-0 allocations into
> > once bulk allocation in the fallback way. What is your concern about
> > this? =20
>=20
> As far as I know the bulk allocation favors splitting large pages into sm=
aller ones instead of allocating smaller pages first. That's where the perf=
ormance benefit comes from.
>=20
> But that is exactly what we try to avoid here by allocating only certain =
order of pages.

This is a good question, actually. Yes, bulk alloc will split large
pages if there are insufficient pages on the pcp free list. But is
dma-buf indeed trying to avoid it, or is it merely using an inefficient
API? And does it need the extra speed? Even if it leads to increased
fragmentation?

Petr T

