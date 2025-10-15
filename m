Return-Path: <linux-media+bounces-44486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CEFBDBF61
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 03:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CECA03C17B9
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 01:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05D52F659C;
	Wed, 15 Oct 2025 01:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN9cCPHj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7E267B94
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 01:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760490745; cv=none; b=EJEscj/1XINd2bRs9asJiery1cLDegV4IBsWS2ZLyDyr6JAT9VhAWomI8864rBDMVhQkxMyq1+O7qr2hAgs4gkn6aPHurRtlxY7J4/69fWH51GXbdtYNTJ1ZeLiYlgBjNSIXARUoVxt8sRXZurWArOKaadk9O8I99I64Gp2wqmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760490745; c=relaxed/simple;
	bh=VRM97CWlsOT8ZJdTMoTW/+GjecPCqzJ3uGuQi6pJdPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WiSrTixWe/6qLgtRcacrnx/DRMwlsXA0efnzZobz5xGK9DlHIg/lK5DG4f8cJz/Daxq4aP1dj2HBD8Yyg6hHtsH48/gcGakbTkZn5XS0N0pE2WmjtHh/2b1GtmF5ZyvUHSAJZParvpA5xEh7QE8EZyyy9YrKyVx0/WxpvmdMssE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN9cCPHj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57e7aae5af9so1012991e87.0
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 18:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760490740; x=1761095540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRM97CWlsOT8ZJdTMoTW/+GjecPCqzJ3uGuQi6pJdPs=;
        b=DN9cCPHj7kPBJpIkbatm1S2JVDRD4nGArTozt6OK5J+u9sR0iMRLj0NlSmnfOnFPq5
         sH0jXDX7CuxD+KlZ0pSYi2H6CjEC3i6lVcGvuQBEJyQvXSeqqTjWv9EaOUCRt9aGaDNX
         zCkRW80rB8zpvPUMBpP6TYDGQdjTgsgj3YqEqC81NG4hjivbq38MQnbsWi08yC0GXbw9
         DWsY5LsqgC8GJRMFsm2Ac0fVZJ7S1xG0JJqfFagTg9Myvk0X3frarEtGG88mq1oMbrL4
         jO5RCqSblUvNUgWTfEv23VihZkUE7KcR1Up3MOll9zG7UWRqIwtztft73eXxNC8SnyZI
         nGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760490740; x=1761095540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRM97CWlsOT8ZJdTMoTW/+GjecPCqzJ3uGuQi6pJdPs=;
        b=kN2lebqSABOb/CPuHgm5JUP055nDBtTJCkMWa7qzHRFClWGDMLF562aG5s79PPb6R8
         KDShaT4IofLhFEv9tNoqS5k832KoaO4O2NA1nhNYbdiQBDE4HcfPnfVKqbjRd+SC7Hlq
         RUP8MbTqik1utEhfOEdPxJhn3CnwW5tLLFLJ3+KtkgiJ0wi3UpxetKdgyvK6riDi3lhc
         xqu5qZLY2aZjsqwN9R7gj2RYGPU3KdRQ6h4tVRb1WBXPygILkmHqoim+LJtbZ/TooIbh
         muvu5VfT5ZJsJbGiL9nKU48HIoArtNOgLSj+xZUTlq7sPPHjIPo+gNxEt5QUXsgRPCRn
         aoqw==
X-Forwarded-Encrypted: i=1; AJvYcCWgbCxudpr0tGyfBLljHR/prCwEllzSOeP+5oNwJQaKCSogFVWoFK9InbDiZPNACfUyAtQcWW7mzjNg3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCp7mKp5PwNitZVEJLK90oingJsb2yKLLPK0/ziJlTHYDYZ+Mf
	RR0hWwgjBX4xavEG6cvwklPchcObIo/icJOiOEAvf5XbxXI+frqTX4EF5dEG+on35rBbC4vabtZ
	bsmLki/1v5j91XxGhlXYAG6SO33XOXdo=
X-Gm-Gg: ASbGncvF/qYY9qoI4DMVHjvGHj5lkaS+FpC4zytMdDqYXHJEFp9D07Ym10UlmKVOjiJ
	yHS3JkfCyLtxIY7su3CE1a8UnhtErj/m0aOs8JigEdQDgp7Z8gdqw1Ks4ABAyFLKvH2ZsaVZuk6
	knENr0BpghxefrfSW3CVoGsnTgz8lUsBfabRa9N043GZKLyHKBdXyv5tcvGmP4NO+tw2t5HI9pu
	l21RKYI+B2elj/u5VU8wKjUzd0gClI8u27ZHA==
X-Google-Smtp-Source: AGHT+IH/YU1kpB0Wn/4zP9l5pqChZfQXv1sm3d4LmsjcWXKZ0Ktc3UNXw8IIJzlfWpkxIJ+KKbvjrd6UrdDNej2f8Fk=
X-Received: by 2002:a05:6512:23e9:b0:586:15ea:53c8 with SMTP id
 2adb3069b0e04-591c8faf0b0mr151534e87.2.1760490739902; Tue, 14 Oct 2025
 18:12:19 -0700 (PDT)
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
 <97da9924-9489-4d30-a858-8ee5c87bc031@amd.com>
In-Reply-To: <97da9924-9489-4d30-a858-8ee5c87bc031@amd.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Wed, 15 Oct 2025 09:12:07 +0800
X-Gm-Features: AS18NWDwKUa99eX_upbZCKKbzQIUyuG-r_RZ364dCpA2z_s2W1WiiM3YMGbpa3o
Message-ID: <CAGWkznGnmb=8GgcrfDvY2REHdRZYVXZy=F3thXhK0FaSoiK7tw@mail.gmail.com>
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Suren Baghdasaryan <surenb@google.com>
Cc: Petr Tesarik <ptesarik@suse.com>, "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@techsingularity.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 11:52=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 14.10.25 17:10, Petr Tesarik wrote:
> > On Tue, 14 Oct 2025 15:04:14 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >
> >> On 14.10.25 14:44, Zhaoyang Huang wrote:
> >>> On Tue, Oct 14, 2025 at 7:59=E2=80=AFPM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>>
> >>>> On 14.10.25 10:32, zhaoyang.huang wrote:
> >>>>> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >>>>>
> >>>>> The size of once dma-buf allocation could be dozens MB or much more
> >>>>> which introduce a loop of allocating several thousands of order-0 p=
ages.
> >>>>> Furthermore, the concurrent allocation could have dma-buf allocatio=
n enter
> >>>>> direct-reclaim during the loop. This commit would like to eliminate=
 the
> >>>>> above two affections by introducing alloc_pages_bulk_list in dma-bu=
f's
> >>>>> order-0 allocation. This patch is proved to be conditionally helpfu=
l
> >>>>> in 18MB allocation as decreasing the time from 24604us to 6555us an=
d no
> >>>>> harm when bulk allocation can't be done(fallback to single page
> >>>>> allocation)
> >>>>
> >>>> Well that sounds like an absolutely horrible idea.
> >>>>
> >>>> See the handling of allocating only from specific order is *exactly*=
 there to avoid the behavior of bulk allocation.
> >>>>
> >>>> What you seem to do with this patch here is to add on top of the beh=
avior to avoid allocating large chunks from the buddy the behavior to alloc=
ate large chunks from the buddy because that is faster.
> >>> emm, this patch doesn't change order-8 and order-4's allocation
> >>> behaviour but just to replace the loop of order-0 allocations into
> >>> once bulk allocation in the fallback way. What is your concern about
> >>> this?
> >>
> >> As far as I know the bulk allocation favors splitting large pages into=
 smaller ones instead of allocating smaller pages first. That's where the p=
erformance benefit comes from.
> >>
> >> But that is exactly what we try to avoid here by allocating only certa=
in order of pages.
> >
> > This is a good question, actually. Yes, bulk alloc will split large
> > pages if there are insufficient pages on the pcp free list. But islates=
t
> > dma-buf indeed trying to avoid it, or is it merely using an inefficient
> > API? And does it need the extra speed? Even if it leads to increased
> > fragmentation?
>
> DMA-buf-heaps is completly intentionally trying rather hard to avoid spli=
tting large pages. That's why you have the distinction between HIGH_ORDER_G=
FP and LOW_ORDER_GFP as well.
Could you please check the alloc_pages_bulk_noprof in the patch 1/2 of
this series. According to my understanding, it try to get the order-0
page from pcplist firstly and then fallback to normal
alloc_pages(order-0) as same as what current dma-buf do. That is to
say no extra large pages splitting introduced by this commit.
>
> Keep in mind that this is mostly used on embedded system with only small =
amounts of memory.
Actually, dma-buf is the main consumer for driver's memory allocation
in the android world(multimedia, camera, npu etc) which could use even
half of the system RAM with dozens MB for once allocation.
>
> Not entering direct reclaim and instead preferring to split large pages u=
ntil they are used up is an absolutely no-go for most use cases as far as I=
 can see.
Yes. This behaviour would NOT be changed under this commit.
>
> Could be that we need to make this behavior conditional, but somebody wou=
ld need to come up with some really good arguments to justify the complexit=
y.
ok, should we use CONFIG_DMA_BUF_BULK_ALLOCATION or a variable
controlled by sysfs interface?
>
> Regards,
> Christian.
>
> >
> > Petr T
>

