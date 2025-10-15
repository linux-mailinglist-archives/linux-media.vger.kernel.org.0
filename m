Return-Path: <linux-media+bounces-44552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FE0BDD749
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 10:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21AE74E9F84
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 08:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AA1306B2D;
	Wed, 15 Oct 2025 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DDxOLxeZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2D722A4DA
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760517617; cv=none; b=UktIMnlSAId/ifbW9laHgr9R/FUu/stU+EF4jv7DL+KOEhSXq1y53HNHyZXKIIYmHBaFmwV7RTdrJstvIFFsDQ3JZW25OZP82jVLdBIDIjGNKWkushl4qCsSvmBBtMsFiYKl8venPB2Ray564s3WVXF/sFiaB0KD0hTEZUAKUdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760517617; c=relaxed/simple;
	bh=atwZOq1j1feOvsNxhiRkgPJgq/K2dricxUqMHWxDuxM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cf7A3QVhzTmw8JnAn7xInUPexcTj5Dz5qa7aBEdbD0r7zPSIiL++3+jbsCrqaN8SJfc2StxKM5v2kiQ47AU8pwS7QoU8cN8pzIXQaz/iQl0vRsE1iH/W9o1I+V3ZKACD1avNcj330Vimku4bBnATDfrBlDRY9gxn90+y9GZD2wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DDxOLxeZ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3c76f3703cso88321866b.3
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760517613; x=1761122413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDsY2VBapz+UptqvTnMcZt7pORUL703BjZYmcP5YKY0=;
        b=DDxOLxeZRQ4l2R76x4i/LvUOTJeZnItZVxWXbwoJCnXvUcj+F4TqtD3JBKFQMzoPgt
         5Vqnkx+8Bdj/o66ae+zetGk0VaVHeZ2qmZU12lDbgNj3dRGga827E8LctAtrMHjtlTcM
         ZXiGsfl6FNRDI5GN0tuJ2HWNoxwitiLldSCUlP3BxhlBX0d3+1Lx1ARPQCEDAmNnmTf9
         551L5et4cvT7akw2d4fStZqoZSRvbEJn1f3JJnNrSFMBz9oHWsGPfUGDDoLIouw8A/UL
         6q95n2OwLal3rV9oZO2XpeuysPweYknFLIBp8PjbNWCktfoAjDwcs2kWWk82kIxxFl97
         B1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760517613; x=1761122413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDsY2VBapz+UptqvTnMcZt7pORUL703BjZYmcP5YKY0=;
        b=Q6aJc3ArdhWDCSO3u3S+n7LQnNrMfjCu+iwr9qqu68pFiarLK0TmYrCXTeCRjHlmot
         1vzG3Sc0cJrhYJPy/GlrUllYYQ5pJ0GFTf6rUYq+1jEi9qYmV8ArDWbFtn7SZN2ZYpKE
         UQJuWu69UaUkwsec5tHQUwlpj/SeXMpMkbMbL2Z9V46/rjtsRn8xNXyC2vyHwf06OF07
         N/ypOCG8zXv9OhsQahOdine4Kn8o855j4sl7H2an1FIt9spS9ZoWTErnz2BiY5SyIyM/
         PhQkIapdklQuUe61sLiNp3E02Y+jW0spG38GPs97d0VuTtazz9CXzjqPdyrI9/TL3Bsb
         Ikxg==
X-Forwarded-Encrypted: i=1; AJvYcCVdypKSp5Sqon2d4TOu+oyJytgD1etgZmI21M0OkTspT6mz/Zq8BENwo+mfAvSTHsml+yyc5d6sDFUKTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgYc1QSAaAjafpPS+vukG3V+lA+VIC2ucfLXxNDi4zGGn1EIg+
	lzbluEibu0BVpr2mKRWbOSeNjlMZTd+OaS8QcRr6Gng9PZ8w3gny/MX5Cu1/f0ugXXc=
X-Gm-Gg: ASbGncvRo73NGYckHgFlDMdLMWzDmrEq0LnxGIdK1fCriI7uY3fbF5/+Yr+xWAim5rJ
	VldYrg0mN16Eq5NtK3dqN+MTnnkOJ6kTAaIAxbfl1FW6sdJA7FdBlXpWHLOrdfx/KgZoyI/qLUM
	zjpeMr5MKU/J6ewOXy5K8U6X+IV+UBkWHt3an54fL2XZ8skxBIZbNU6fgIhjn06waqaRiAbcVnr
	CcrMSmF8UMm51rHyk3IYCbrGx2aQv/A3S5CswQ8HANXtKZiH99PvXR5FVokhks48nDtapMwLjOk
	/iOGYobU/gWgeeuobuDWxNwMfa8aAy4C8VlPI+utN+pWkVRn/XQIYltZoPBwW0VG6ubXg1weQCF
	XcKPWDoqy//ncv7mWe93qp3bEcyUl/y4WB0ibydaZoyxpDxdgzyFp2ee6xKNxAT4fRa1ZtV9lgw
	GeY4+oKsIEawCe2gnAZarM/2Rpv/8nfV/JyhoMI5I4crVjzsbsF5sF1JOlEw==
X-Google-Smtp-Source: AGHT+IELGd1QIrFF53QcX+I76rx+ZG0TLeQwEgYCUqwVFMJIjoxdZrhJJkMTqEZ8KN0QoxSWe07NSA==
X-Received: by 2002:a17:907:e8f:b0:b44:fb0c:5c37 with SMTP id a640c23a62f3a-b50ac1c480dmr1491862066b.6.1760517613246;
        Wed, 15 Oct 2025 01:40:13 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba45afc5sm170229166b.37.2025.10.15.01.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 01:40:12 -0700 (PDT)
Date: Wed, 15 Oct 2025 10:40:08 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Zhaoyang Huang <huangzhaoyang@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Suren Baghdasaryan <surenb@google.com>,
 "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Mel
 Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
Message-ID: <20251015104008.4bcd99e7@mordecai.tesarici.cz>
In-Reply-To: <CAGWkznFG2_WGmLRmHnjV-49iTX0mrt9jxQBzZYK=K9U7eKJD0g@mail.gmail.com>
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
	<20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
	<87953097-a105-4775-88a5-9b3a676ff139@amd.com>
	<CAGWkznGN7W-txq_G+xpZ6DtH_1DNorYc=CxqUjebo7qfB4Sxsw@mail.gmail.com>
	<ecba7133-699c-4f3e-927c-bad5bd4c36a3@amd.com>
	<20251014171003.57bbfd63@mordecai.tesarici.cz>
	<97da9924-9489-4d30-a858-8ee5c87bc031@amd.com>
	<CAGWkznGnmb=8GgcrfDvY2REHdRZYVXZy=F3thXhK0FaSoiK7tw@mail.gmail.com>
	<aO8TKQN6ifOSMRSC@casper.infradead.org>
	<CAGWkznFG2_WGmLRmHnjV-49iTX0mrt9jxQBzZYK=K9U7eKJD0g@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Oct 2025 13:52:57 +0800
Zhaoyang Huang <huangzhaoyang@gmail.com> wrote:

> On Wed, Oct 15, 2025 at 11:21=E2=80=AFAM Matthew Wilcox <willy@infradead.=
org> wrote:
> >
> > On Wed, Oct 15, 2025 at 09:12:07AM +0800, Zhaoyang Huang wrote: =20
> > > > Could be that we need to make this behavior conditional, but somebo=
dy would need to come up with some really good arguments to justify the com=
plexity. =20
> > > ok, should we use CONFIG_DMA_BUF_BULK_ALLOCATION or a variable
> > > controlled by sysfs interface? =20
> >
> > No.  Explain what you're trying to solve, because you haven't yet. =20
> Dma-buf works as a memory allocation backend could loop thousands of
> times alloc_pages for allocating order-0 pages to fulfill the dozens
> MB demand, this commit would like to replace the loop by once
> alloc_pages_bulk. Whereas, alloc_pages_bulk_array perhaps introduces
> extra memory allocation along with direct-reclaim which could be more
> expensive than iterating the list. so call back the API
> alloc_pages_bulk_list as well

This does not quite explain it. IIRC you mentioned allocating 18M as an
example. The ideal outcome in that case is:

- 16 order-8 compound pages
- 32 order-4 compound pages
-> total 48 calls to alloc_pages()

But presumably, that's not what happens, because fragmentation makes
(some of) those order-8 allocations fail. Since you talk about
thousands of loop iterations, it looks like even order-4 allocation
fail in your case. Then I agree there's not much value in trying to
avoid further fragmentation, and after so many order-0 allocations,
it's probably also pointless to do memory reclaim.

OTOH I can see why the opposite approach is a bad idea in situations
where fragmentation can be avoided. To make things even worse,
alloc_pages_bulk() will rather split pages in the preferred zone than
try allocating from the next best zone.

To sum it up, Zhaoyang, can you please describe in more detail what
happens in your scenario and what you believe should happen instead?

Petr T

