Return-Path: <linux-media+bounces-12487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 811CA8D886B
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 20:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F9C81C2247E
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 18:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4A41384B3;
	Mon,  3 Jun 2024 18:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zJ6pXOre"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CC1137C47
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 18:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717438027; cv=none; b=lx83TbhLGqZu5JCXwrSe2iKUj4QNealLPkwXshto0keFfbUqu0QnU2CiGFubv8k4LjDWrvs2a5JeWoyZk3N7SQ5VgzdfbiuJZF0y1bTsjGC3uBMpWOgu54D5+VtaV81BsKDWyr3VGqQyLk0wuArYPY+wZF4iOdphEICny8iS0Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717438027; c=relaxed/simple;
	bh=TaXhlRDjNJLhHW4iws7eb0uy7NSOvaguvsnI7PxZ9U0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ma1eWS3Rmqr8StVLy4Bof8JLynS2w7nHhrQw52tzESb6fxok7+kk0z5DrWaz/sNwE1CP5m8TQvUY42agDorpMyWNaLSUNzp65WFTbYkftAjJ0P2FuRgPQOgwsNnZ+pRly/5UAJbEAYkyXsCB86oxFBpCWiEEANgwzkNwLdPaVXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zJ6pXOre; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso1527a12.0
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2024 11:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717438024; x=1718042824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxEtH6ksqOT/HFLTQs72uRkOcc2agItJ6FV9YxsG9ic=;
        b=zJ6pXOreDlBGkhJHkY1qeKJ2L0Liuz3+u0WtJe52qgVVScAUEd+Y0kpFBDVIhz89oY
         7CIYEumlPhJBrcL0yi3lm5/Ck9VaVQQiDD6xiVsqWbsg1qS1ef0TJyI0eFFppLF0fjAa
         wouoNsJCLSa5R7+3wuLM2tMBOSaZNSb+bcrkb47yRJm2QdPRQq0RuFMUmziEnWg3lxG4
         XnU8KW4Lfeemp3VHTcQ8A+APMtVYNFIFulprkQQK5vnOSY02YlQ4Av5MnXaYPMbzQ8oi
         izZe7tY5MI4xnZ9K7xCJOTouXm6aHS1ncKVv21wxXefpRqqESlauuwToBHk4AsfYLZrW
         Cg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717438024; x=1718042824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxEtH6ksqOT/HFLTQs72uRkOcc2agItJ6FV9YxsG9ic=;
        b=tIyFX2UWw8DH8x52lMjYE9GmvrjI7PLspzZ+QjaAa21Eb85IDj/NPdSm4wnH1+aVAU
         UVIzyMgPe+C03b+ClY0wtjbA+PL6V6ophFENvHdJhuxDshlmLwnn5LDLwtR35ol9y9gQ
         337mX4jUzxFz4sLW5+/MPL9ZD+DcwZ67nkvqxCjuAK2kt048cVStAntB224hqck1sScg
         ere31CtGYZthWwxihzwXhVNQK/M/rkt/d5lFZdWuuMg1nCMO0msuwTuqEB7V35+tbQaQ
         3063EElzATN2g3Jd7Xvm+CAV9iGq9r415E0iDjd+V4GF93jI72gpIyFh10rnpZ7i10GI
         pWIA==
X-Forwarded-Encrypted: i=1; AJvYcCVvgWikXi07705DqcmXjLVSGpo+/OJVonTlcbHxJx3h4JZJHkMe8oLI/FHBQa+6z0THn0Kk3vgYUch22bkESaGmnSNVI1/xOsfASvM=
X-Gm-Message-State: AOJu0YyY4Lbx1wj9sblvmyAJPR/vpeajBiWegGeCKgGG5GeLycACTktr
	Osv+ZsGvAcPCn6y1n8qWK7/llVYL+xCGubQ8/4U+ZB9EmocIFPsDFPwESVn1wZXbKhW1JQoQqr3
	crj0Jt8WOO30oqM3yQ9ZLMbKDkEy87a/lSpA=
X-Google-Smtp-Source: AGHT+IHh/FTn18V927nX7mLu4AOxZc/5TfIty1nDwy6MfFqeiSDSbjo6v1NtdviT15GPtNUFxHU2jnhiN9DQRoaPf/Q=
X-Received: by 2002:a05:6402:12ca:b0:57a:2276:2a86 with SMTP id
 4fb4d7f45d1cf-57a7dad73dbmr6429a12.4.1717438023960; Mon, 03 Jun 2024 11:07:03
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603114008.16235-1-hailong.liu@oppo.com> <CANDhNCq50zPB+TS+_Oo0HY0aUuBAdik2KrC8eJRTygbis293sw@mail.gmail.com>
 <20240603172148.gb7txpg2ya43jyxn@oppo.com>
In-Reply-To: <20240603172148.gb7txpg2ya43jyxn@oppo.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 3 Jun 2024 11:06:51 -0700
Message-ID: <CANDhNCrwgce7G5_-4tNfgTHcdL12zt3JKBg=o3bHrzMmfFMctg@mail.gmail.com>
Subject: Re: [RFC PATCH v1] dma-buf: heaps: move the verification of
 heap_flags to the corresponding heap
To: Hailong Liu <hailong.liu@oppo.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	21cnbao@gmail.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 10:21=E2=80=AFAM Hailong Liu <hailong.liu@oppo.com> =
wrote:
> On Mon, 03. Jun 09:01, John Stultz wrote:
> > On Mon, Jun 3, 2024 at 4:40=E2=80=AFAM <hailong.liu@oppo.com> wrote:
> > >
> > > From: "Hailong.Liu" <hailong.liu@oppo.com>
> > >
> > > This help module use heap_flags to determine the type of dma-buf,
> > > so that some mechanisms can be used to speed up allocation, such as
> > > memory_pool, to optimize the allocation time of dma-buf.
> >
> > This feels like it's trying to introduce heap specific flags, but
> > doesn't introduce any details about what those flags might be?
> >
> > This seems like it would re-allow the old opaque vendor specific heap
> > flags that we saw in the ION days, which was problematic as different
> > userspaces would use the same interface with potentially colliding
> > heap flags with different meanings. Resulting in no way to properly
> > move to an upstream solution.
> >
> > With the dma-heaps interface, we're trying to make sure it is well
> > defined. One can register a number of heaps with different behaviors,
> > and the heap name is used to differentiate the behavior. Any flags
> > introduced will need to be well defined and behaviorally consistent
> > between heaps. That way when an upstream solution lands, if necessary
> > we can provide backwards compatibility via symlinks.
> >
> > So I don't think this is a good direction to go for dma-heaps.
> >
> > It would be better if you were able to clarify what flag requirements
> > you need, so we can better understand how they might apply to other
> > heaps, and see if it was something we would want to define as a flag
> > (see the discussion here for similar thoughts:
> > https://lore.kernel.org/lkml/CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPW=
TyciVXMXQ@mail.gmail.com/
> > )
> >
> > But if your vendor heap really needs some sort of flags argument that
> > you can't generalize, you can always implement your own dmabuf
> > exporter driver with whatever ioctl interface you'd prefer.
>
> Thanks for your reply. Let=E2=80=99s continue our discussion here instead
> of on android-review. We aim to enhance memory allocation on each
> all heaps. Your pointer towards heap_flags used in /dev/ion for heap
> identification was helpful.
>
> We now aim to improve priority dma-buf allocation. Consider android
> animations scene:
>
> when device is in low memory, Allocating dma-buf as animation
> buffers enter direct_reclaimation, longer allocation time result in a
> laggy UI. But if we know the usage of the dma-buf, we can use some
> mechanisms to boost, e.g. animation-memory-pool.

Can you generalize this a bit further? When would userland know to use
this new flag?
If it is aware, would it make sense to just use a separate heap name instea=
d?

(Also: These other mechanisms you mention should probably also be
submitted upstream, however for upstream there's also the requirement
that we have open users and are not just enabling proprietary blob
userspace, which makes any changes to dma-buf heaps for out of tree
code quite difficult)

> However, dma-buf usage identification becomes a challenge. A potential
> solution could be heap_flags. the use of heap_flags seems ugly and
> contrary to the intended design as you said, How aboult extending
> dma_heap_allocation_data as follows?
>
> struct dma_heap_allocation_data {
>         __u64 len;
>         __u32 fd;
>         __u32 fd_flags;
>         __u64 heap_flags;
>         __u64 buf_flags: // buf usage
> };

This would affect the ABI (forcing a new ioctl number).  And it's
unclear what flags you envision as buffer specific (rather than heap
specific as this patch suggested).

I think we need more details about the specific problem you're seeing
and trying to resolve.

thanks
-john

