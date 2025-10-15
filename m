Return-Path: <linux-media+bounces-44515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D7BDCA49
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA4111927F1B
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 05:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE67302CC8;
	Wed, 15 Oct 2025 05:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1y43XQg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C025392A
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 05:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760507593; cv=none; b=E5Bgg1qH33rg3k7Wjgey6giE9BT8gRDI3WhGUVkJVl/rp2SGx2CSyPJ+lAt3V0od77Zwg0YtxtsmjoFnOsIoXo2UqUsb9dsLt4Hyrz0x5xpYBnB4+hHx2f3v9OssrlxuMoJfzyr927lhRFdSfOh5ZHM207zMUS660YXGRUR706g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760507593; c=relaxed/simple;
	bh=O1fcHkwOsLK9Va+WIry1KaLb0cCpP3mI3c2QtZQNth8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NgHDKHW8UZgK2lnd4zT3Wti+kqP1eN/FWbFDAvUgkQ95JZMtiRagDrbef9xcYfmda4sRuL64ykPiOaCPLCtI0VAk5vBnnxfRgnzGzUU5WSGg3JA4GxTpeRAwT4voF375PCCz/C3lt/M/O9Kh1cEPpLog3MNLUGP/nhPunv608+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1y43XQg; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3777b4660d1so63891fa.1
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 22:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760507590; x=1761112390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFLT62ixVQldJQ7fYkTdCMI80L5ybOIFkFHbPj9dyUI=;
        b=G1y43XQgSaLWvI0iXecqFqsYQW/5izDiKcltzFTErNOVx/P4fQyjAofHhIop/xy6YR
         goVW4x5btV9huEhf4pKkGzEradeZ7pKaeyn9WRPb/4kv/Cc6B+8P+1jDRvImUIj4Q1Rd
         qMPapvFbgh26IHAK90879cuRdUHbBQFi3uqNnv0fiHc2RgX2/QYiBIx1Kp0X2HXSb2Kg
         khYcI19su8307MteAtwgLwvv1zX8yz5vUxcPUEt4MFSZnBLdWvlK/mjI9kysY6qm6rMA
         QJxwZgnjerw2SOJ2rlubsNxPjNU0YDbFlNtdPScP/+hktT99XpWE0zBKdrTjc9UmKSpi
         e2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760507590; x=1761112390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFLT62ixVQldJQ7fYkTdCMI80L5ybOIFkFHbPj9dyUI=;
        b=A1ptbjA5ye57bb5lo1t80DRWoGK20oVCLBsvda0rWvgSG6trqf8emzBCtYtycoOYRM
         4nYVuPrmQUAYcaZd5D0cTxi44Xytj4WPWM6MajQcs0iAyA+ev6cM3JfCl3XYdyB3slFi
         5P3cHgu6ckpOHoSlKmBewvkNlADumijnXnYmXXeSbIbyOmAUIHd4MRCNhdwJC85OpkdL
         tE8lkLL4X800C8XPqZ1Y1dqRAkAC+U+hbOrSAmPrRUEzntjIz8FhnHdnAaPf+ngz8296
         sD4sYLbKvxSLvxRh9+itI46a4Xp8mMh7yxkAA05Duc89W+o1tjG0BiRz6WbPA0hmQ7nQ
         Engg==
X-Forwarded-Encrypted: i=1; AJvYcCWw1ilHrazE4BVSyRRH90AIoNokQqLLPxkUgRA7P4WPsJs2DslkuK80DG3QQ8abWu3NM5dZUwEyXGBSyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPWV3OMEZWmwco+zrfEag0027JT65p3g/Q1xfrBV+xZ8E3msBK
	VsdFdtDt7qcLc+xuE0txNZI2kVLKZUvO0yZlOckrARh+bGjhi/Q5UPHACZNcYAen5GiyPwluqtY
	P/WOMvrUlUQ5xqBcpuQ/VW1l91BJkJXs=
X-Gm-Gg: ASbGnctG/Lz+roJGmMpHWJtBm/ZszrvejS+EXC5prPuNpvLKi/Q3O4f43DJN2I6PpRg
	GX+G9nsLlzypljHn2W63K2TRULjVv+z+LNbNNmNNpL7V8I0WHqMLjCIjjb6kqnUaGgkoigye/qQ
	n6Lkj38SEvXJ+QVuZHE7/VisZ/7KZky8jxSvOP6aCH9lUXicrol7D4qAdggtchgsmftrQEMqimc
	08C4urLjqJH1k3S8vW+ZBo7xUY=
X-Google-Smtp-Source: AGHT+IFLUphpgOZG5QCNUsC60fCVIMlNWQyaFYF7MclW2rvaBp7nodjf6JgXjXmvHO9NPEejKXvxuliDGWMWkHx4m3I=
X-Received: by 2002:a2e:bea4:0:b0:36d:501:76bc with SMTP id
 38308e7fff4ca-37609c975f0mr40445141fa.2.1760507589531; Tue, 14 Oct 2025
 22:53:09 -0700 (PDT)
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
 <aO8TKQN6ifOSMRSC@casper.infradead.org>
In-Reply-To: <aO8TKQN6ifOSMRSC@casper.infradead.org>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Wed, 15 Oct 2025 13:52:57 +0800
X-Gm-Features: AS18NWBOWQWzhWDzp18HSEEZyxB5KfY1PDfoAz_DuZJ3dbHjn7xlZV-pDkl9jw0
Message-ID: <CAGWkznFG2_WGmLRmHnjV-49iTX0mrt9jxQBzZYK=K9U7eKJD0g@mail.gmail.com>
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
To: Matthew Wilcox <willy@infradead.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Suren Baghdasaryan <surenb@google.com>, Petr Tesarik <ptesarik@suse.com>, 
	"zhaoyang.huang" <zhaoyang.huang@unisoc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Mel Gorman <mgorman@techsingularity.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 11:21=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Wed, Oct 15, 2025 at 09:12:07AM +0800, Zhaoyang Huang wrote:
> > > Could be that we need to make this behavior conditional, but somebody=
 would need to come up with some really good arguments to justify the compl=
exity.
> > ok, should we use CONFIG_DMA_BUF_BULK_ALLOCATION or a variable
> > controlled by sysfs interface?
>
> No.  Explain what you're trying to solve, because you haven't yet.
Dma-buf works as a memory allocation backend could loop thousands of
times alloc_pages for allocating order-0 pages to fulfill the dozens
MB demand, this commit would like to replace the loop by once
alloc_pages_bulk. Whereas, alloc_pages_bulk_array perhaps introduces
extra memory allocation along with direct-reclaim which could be more
expensive than iterating the list. so call back the API
alloc_pages_bulk_list as well

