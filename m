Return-Path: <linux-media+bounces-29087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EE1A76F8F
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 22:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FA931888ADF
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 20:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A9221C168;
	Mon, 31 Mar 2025 20:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCvfUcBP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F021B91F;
	Mon, 31 Mar 2025 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743453839; cv=none; b=ko9SItwlDLqeH/hc3wCGtPxttgJvWduRM0mL1WySrmeweI/wbYeKdMEJPQ/98UFUeP/iYo2btK0/jhUu6gKBIEbTBmY/gzUGTe64gIWHzUiOXdcD5oSOc4aJ5Nzm3W10fRuIpBc/BdXs6qi1+tbiFx8sKLoxs+/Zw9tsB0GzHGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743453839; c=relaxed/simple;
	bh=NhmnlMAAlfE+UJZ4bK8dEFy6Cahb9IglOuPC0RLUf2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6bafgWBoKqtPJFaNJRxaT2giGnEfQb/PX+w++RU5DjciQeHbLYBAuASYml/EZc2vpUDqPk7Es9ZUZ87flWkhUeBiDd6OgjMX1Dc/NI0n0VwHumzBACWuZPgr1ymk26bOB90Chem4qoOMb1VEbDsA5g8Bqbs+KFN2+ZeWROS3gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCvfUcBP; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2963dc379so778336166b.2;
        Mon, 31 Mar 2025 13:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743453835; x=1744058635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhmnlMAAlfE+UJZ4bK8dEFy6Cahb9IglOuPC0RLUf2U=;
        b=RCvfUcBP4AD8NsE1S6hj+Pt3al6ZG1ik3PC4wwtG/JFwKrgCXkGBrVx6I4UUgGz12B
         07n0dASkbjPrSjcw2fNC8HG97hMWxscptVcbyOrseJMgNVp/jT4UpuB/dKs/SkdKcQSa
         9ma6oSYGZ9vLGm4T6R0+np+SQDPSdDrwdp6DXIkqtg38efHjzaBxOAAhxc11lJxCHFKr
         iliJ8taQ5oIiEE5mBBzTuaQ+pekFp4EFPBdAvOInAWitzMHdWpI0vRg2CwpJYKKu7Xyj
         X2+EKE4qNqz/nc7V8DiMvVzC06/T6I02VbRkRr9lyQEvd74ODlLA2fySntd1YCNA06Xd
         XDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743453835; x=1744058635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhmnlMAAlfE+UJZ4bK8dEFy6Cahb9IglOuPC0RLUf2U=;
        b=ulmM848ajabIDQcnyA2L4JG4SHIHobFzJLazPvmYTsT1hJI1IatuvVBuxs3k11A856
         04/wg36Si1bbwjQA1XisZNcGtO5/ieptSuYBGvdVvVjxKiVVGAcoIIOCoWE6VR3ViFMV
         JYv1eTWpXCu6vLm71P+oydST9bEOCCiYaw4ogKb+QdN6KnjzjI/wnSRR5JI/PqMI1wKi
         x1Nz+1peB88Z65658at2D2PCJhln1J0x7uMirvTVqTdzR3RjwZQnTAvG6Z/8a0s1PZ+H
         u8vStq6cv1ukIv5tpDy078HP2GlUEKMoY+p7nazwsA9PWY7NSWpvHO9kpD+YksoYQo1D
         jEuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIhWDRwTz3L6R+YWTYp6HvXx2sVmrSNZBuJcnxV4Et0Jxa27hlv5chz25wzXohet5vTefRgOxHtYr1neQ=@vger.kernel.org, AJvYcCWOMl804kKy7R9bXnzBIVnjzKxAtoBi//z+O6Ad+zHp0IMEvWJOf4JJZ+7Agi4N8DxvwDbbcsnii6d56aQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxoISbzETILXc8FlUodpUl4J7K8gSuurO52eQHIbAXTSSGmKHe
	nMdGOLf4wzMGvTwV+tgviV7mx+QjupBUBmhR+dSE6l4fsNiBRV08QiDfftXn7RhmqwGgrRxl7By
	azuEnKoO14X2J/VSAdG+Sgm7NpV0=
X-Gm-Gg: ASbGncv6xCOkCq3rgTVoZWXYKUI9WhSXCikKnQ5SDbv3//hPootKoh02g0JFepma1Bf
	zi6HvjQETQMa0yKBln6v3cr/r9oIJ03WheioJ2pdKU6Hr+ASs+fVnmCDBL1zwg2PV46C5EOk7iX
	5vltgI+ZHgLLOGFao91hBIGdYx
X-Google-Smtp-Source: AGHT+IGa2ATWEnPtBZKrovC/2tQXOIHQaYNh/KXGz4WWHKDhRqKyDzgdS0ONK7AXu9tKvknpMnQpqfeFIU5BV3Y+5xU=
X-Received: by 2002:a17:906:1718:b0:ac7:391b:e684 with SMTP id
 a640c23a62f3a-ac7391beac4mr794735366b.58.1743453835197; Mon, 31 Mar 2025
 13:43:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com> <20250310-eccentric-wonderful-puffin-ddbb26@houat>
In-Reply-To: <20250310-eccentric-wonderful-puffin-ddbb26@houat>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 1 Apr 2025 06:43:43 +1000
X-Gm-Features: AQ5f1Jo63dx6IuKsG5SoyFqmX486Pcaveqb15lGzyp5QvSc5pKKZ1U2dlNV04bE
Message-ID: <CAPM=9tzkLXOz=-3eujUbbjMHunR+_5JZ4oQaqNmbrWWF9WZJ0w@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
To: Maxime Ripard <mripard@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Mar 2025 at 00:26, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Mon, Mar 10, 2025 at 03:16:53PM +0100, Christian K=C3=B6nig wrote:
> > [Adding Ben since we are currently in the middle of a discussion
> > regarding exactly that problem]
> >
> > Just for my understanding before I deep dive into the code: This uses
> > a separate dmem cgroup and does not account against memcg, don't it?
>
> Yes. The main rationale being that it doesn't always make sense to
> register against memcg: a lot of devices are going to allocate from
> dedicated chunks of memory that are either carved out from the main
> memory allocator, or not under Linux supervision at all.
>
> And if there's no way to make it consistent across drivers, it's not the
> right tool.
>

While I agree on that, if a user can cause a device driver to allocate
memory that is also memory that memcg accounts, then we have to
interface with memcg to account that memory.

The pathological case would be a single application wanting to use 90%
of RAM for device allocations, freeing it all, then using 90% of RAM
for normal usage. How to create a policy that would allow that with
dmem and memcg is difficult, since if you say you can do 90% on both
then the user can easily OOM the system.

Dave.
> Maxime

