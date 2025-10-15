Return-Path: <linux-media+bounces-44579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ECABDE7DF
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 14:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB094188C46A
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 12:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF281B0439;
	Wed, 15 Oct 2025 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6vp++bD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C581E515
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760531771; cv=none; b=sy3JEvHWBKyCa0LgfsjFQJOOfsOQqDVSvGLYBYOCd1MjEGpuxIM8E54CyPABgCDSwIFNi1ok+UzXknnozQkwdSpNk57Jkgv1s4jz/BpCWmbQmP/DiuGI7ENXOVK5HjyDf8vdBVLwDL0+IkXOxQjBrLdlP9Irb9198EthMeSHhCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760531771; c=relaxed/simple;
	bh=mXqZCy2SyArQfSZB6+/vhy8c6RWAc9H5KTcnkJHJQFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mrJCro7GIBaLLVJkCMoFidZFqPgnbBtcK4PUPgTtNDzRxmB+5TnDs1GxdpZDOnOlrZwUINl0+0FPaYFy1ZALc+EK0PiXP/tCPdJ9oe7C+ohmaO1eiSy5fYcyDRzt/TxNSmtQ97VA0qkTZTUf/g00a3LwPxeFBdITjxj9Ayr3PjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6vp++bD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57a8b00108fso1197883e87.3
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760531766; x=1761136566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXqZCy2SyArQfSZB6+/vhy8c6RWAc9H5KTcnkJHJQFY=;
        b=F6vp++bDYCNsRMkMommyXSVSNneZmtEPQ0FMknIosza7m6Jb/ZkaEjOE6Pj6PuFQov
         6Jl52lZFsEJfxugvGD7f1D3tLdDHuyN+RPMr2dvU+ZneB24AVRCiOeSKvQVbNZ/6jGKz
         Ha6duc1BktlVjgN3vsqjiozf0/EtgqXcTVs2LxZbSyTBlo0tmOpcMAQ6OPIte2z9cC5M
         /Ww3z6hVWfjvADl3kUVwGvwr6Il2fb6hMBjE08wxf8YYtYAgf2PQyEKht65Rnt67OFtg
         UQamiRmFmHUFTjZXo5kdyiHhYvoUcpXYtGjcche+zW/PxXS6c3IaST+mn/w8/tKpcHr7
         tbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760531766; x=1761136566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXqZCy2SyArQfSZB6+/vhy8c6RWAc9H5KTcnkJHJQFY=;
        b=C6OJGuXKefDJ7hKoUMYDXsYns22M8jAwTH1muXbXHHQzQgotMqgj0kCkX+IkIjoZ6+
         eoRXU/8PwyS25oRCtq92HJc5emers+i0PFwUVvCFlXpUH6cZp3jbfftjmR7tJ7PCp0C4
         3Ysa3AsMYk5QOLj1bAs5BfK0ZraGgcKmiU+BXSgRuZedtQV3Y3fRqXp0Cv5TasSNhon0
         Sx7fPvc29lDhfHtAdY7t+s0dKiq1BBEvLboRoPR+s84VoYw/NmkNO5aRDu20hCI68LW4
         /OCAk6UTnuY5VgUi4bCJloYGlViIMOmVema2YqkETKh/Dpb/5yIPKneImzMWU+0a+er+
         ydGg==
X-Forwarded-Encrypted: i=1; AJvYcCXL35Lv885KFff/zhoLyGVnZ3SOqI/VJbKfyFMTPbwuXW7gQQxiUvNEabFHU40sKxnRdgQqYRqW02LIXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGBqhDUYfvTdDYakOhCkazG5rfRnFFsQrahBrHVSP1dbQXhjQl
	1ZHW/T6S14fVzgU/9DnzPgv1Mj01IwYKcxcnzyq717k5YQGah0yvbWdDb07EBqjNFBpkbRdAV7y
	pQXB/xB9Wm+AAiuNyVKnCeS0XGwtq7nvpIg==
X-Gm-Gg: ASbGncvcwYEas7zXz38rtRQEmw0nMoOv579b5t5YX8PtA6LlrpCi1sJQPBGmM5jGsLR
	3t+z1oxJI/r6G1kDmNi0CwhVHQI+nyG6Geoqk4q5kdnSkZozncoZNjYTfBlAtw/kptloN1RecOQ
	tZt9yq9yXbBEZYcuOTdALCCi0K42Yo41waDJuetTc9+ISBklUF/4FsQpW3/OGHwebXBJReARKCK
	+WzuzVi9CE43lWuNFPHauOGolxHrq3QMrZ+7Eu9kYTQn7N2
X-Google-Smtp-Source: AGHT+IHpJJ3i4VE7K63V7qp2FsxwGna5n/UOWX+WqUQGecNnl4cdq5PAcjc23PWmzxHfk1E5P7xRzKbuz8NuSN92NCQ=
X-Received: by 2002:a05:651c:f1c:b0:36d:54b3:9f75 with SMTP id
 38308e7fff4ca-377795d5fe4mr5645081fa.2.1760531765871; Wed, 15 Oct 2025
 05:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-2-zhaoyang.huang@unisoc.com> <f807f3bf-a05d-4e0f-af4c-bb0167dde51c@redhat.com>
In-Reply-To: <f807f3bf-a05d-4e0f-af4c-bb0167dde51c@redhat.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Wed, 15 Oct 2025 20:35:54 +0800
X-Gm-Features: AS18NWBHy47J7vqNuZdMWmFiioMnHOdN9PsD8vuUcKjXC1NTUEoBMVAQrHP3CgE
Message-ID: <CAGWkznG=DAXz5s1gAcs9=OKJC0v0KwB=FK=mKL-c1DSw3jGqfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: call back alloc_pages_bulk_list since it is useful
To: David Hildenbrand <david@redhat.com>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@techsingularity.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 8:16=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 14.10.25 10:32, zhaoyang.huang wrote:
> > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>
> Probably the subject should be "mm: reintroduce alloc_pages_bulk_list()"
ok
>
> >
> > commit c8b979530f27 ("mm: alloc_pages_bulk_noprof: drop page_list
> > argument") drops alloc_pages_bulk_list. This commit would like to call =
back
> > it since it is proved to be helpful to the drivers which allocate a bul=
k of
> > pages(see patch of 2 in this series ).
>
> "Let's reintroduce it so we can us for bulk allocation in the context of
> XXX next."
>
> > I do notice that Matthew's comment of the time cost of iterating a list=
.
> > However, I also observed in our test that the extra page_array's alloca=
tion
> > could be more expensive than cpu iteration when direct reclaiming happe=
ns
> > when ram is low[1]. IMHO, could we leave the API here to have the users
> > choose between the array or list according to their scenarios.
>
> I'd prefer if we avoid reintroducing this interface.
>
> How many pages are you intending to allocate? Wouldn't a smaller array
> on the stack be sufficient?
Actually, dma-buf is the main consumer in android which could occupy
half of the system RAM(mainly by multimedia which passes the memory
between GPU and display, camera driver, NPU driver etc). Dozens MB is
quite common or maybe more. This commit is proved to be helpful in the
scenario of camera APP cold start which allocate around 300MB memory
in an 6GB RAM ANDROID system
IMHO, page_list could be more efficient than page_array in memory
perspective which is an uncertain factor than iterating the list
>
>
> --
> Cheers
>
> David / dhildenb
>

