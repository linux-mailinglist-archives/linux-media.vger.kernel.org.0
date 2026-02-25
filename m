Return-Path: <linux-media+bounces-53404-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDwZONA3n2m5ZQQAu9opvQ
	(envelope-from <linux-media+bounces-53404-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 18:56:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4624719BD90
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 18:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C861430F95D0
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 17:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992313ECBE8;
	Wed, 25 Feb 2026 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PliSx9FY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3883A1D1C
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 17:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042126; cv=pass; b=FrHPYE+JF3MlofpFDnyu/6+ZJe+/BMX4xbIN6Tii5GG+z8x973pJf4EhbTonX5gf4AIV7G73xbJntLjJRz9aT4gHJH4FNJLmrZp5aiqa/d+cVzY+YKk0iPb+wHJ32jLoPMjxkJL8RhBZAjytrwQYl2DPcJIrKZBgVGgAHLMJGuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042126; c=relaxed/simple;
	bh=i8gRH0YBs8R4dCXzko++9eZOKgk9GpolaSr9eR7PWeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRYd4lBAiZM598P7cDo6t+IzH/pkLXyOYpX8S7dHI6Jvw6Nhexu5R1dchvewq0YpNSWmHb+u1How1pnkfItr2JaP1eo6qmAZ96tgy/zQU+r6qheAt5mm8aKBNA2wY1IV4QkGaOVlFWG+AuJBdNuIzvKLZyAarRq2Hz0hPidl75w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PliSx9FY; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48318d08ec2so1705e9.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 09:55:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772042123; cv=none;
        d=google.com; s=arc-20240605;
        b=B3vlmI34nyl/bfHVIb+b5SwoATuL/1aVDFuJLCssfG/TqdujhdmAt5fzUxcTAVeebY
         dqfqxPJ2hEE0S4JbQOWaQRakEEqjV/H4u83VtrAewh1tsAJc4NXlPlS0r0+8I0tLUcvg
         h+e5eUhYrQxhosz1jvIJMnBwnlzNYJL/vtYsYHIWOESXZQHpBxbrJGLJuhP6tfgHBtFi
         1TVEWdV+3EhqrWq6hWhIOWRYF7HmwCqotLrGktwp0/2X/Iaat6uDzDsMrvm62huZh8qH
         99m1bF+QrhanbDX7Rx5U0Pq2kjQZbsDZqxYpCjgtStEqZCW3TciFcBZBDY3re94KK8UH
         PO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i8gRH0YBs8R4dCXzko++9eZOKgk9GpolaSr9eR7PWeg=;
        fh=HfaWGt5CkdM6idCbF1DKk44J2UHZGhI9h4bRKeCcVoE=;
        b=Z5JS5aSg1UQCyT6PzUrv8d4rCIkOdZcRFmqw7vzpm8NRPUZN3vSut6rVL23AC4k3Nq
         7xQfKgWpLf17VcW0cGxNl63IWZv96uo3LUb5bTAd+vUETV/ZPs8TSzy1ZohGvQZUT2Yc
         ItW5IwA+7ZIXeSq3+IlbxOIq2jFkX7OxW9qXk2qlV6LW6TZaKFRLjsti5DaXNc8hekcA
         Y5ZWC1clS39PZMFVTX1UDcLsuU3Ic6tKOztC3lGl4Ix87M3c5qij4K6yQrNXMjq7yhby
         cihC398no7JqNuG6iOW86o9xVuGpMnIZV6kIO9aZzT31EMhZi1dT87oXsOFHzZ88f9iw
         1VsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772042123; x=1772646923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8gRH0YBs8R4dCXzko++9eZOKgk9GpolaSr9eR7PWeg=;
        b=PliSx9FYQyYa+WtxE1kT7bPIlZTd5H3fXJXgvv6b502tzprFhBI0HlhzrV6YTjshki
         31rMc7AZ0KhoZRKyjSRYKTs03B2JgMl63s8pjmPF+oHyAoWI3FUSQXTErU/l1ANvPUPB
         va0B78KmKti2cgDGR1OXJN+74DUN1/DEy80zNujT3/o8Sp87Ol+uOUjRvqNxpHWaL/zO
         iuZQOmn7wZ6qY+cacxshZU5lYJXwPfPNbIxumL0/+ojZJWCn4FfaRy0OAEq51iqCgEvN
         zgDAAa0IINTKX3kUIRzbusu+egO9ECENiaHTv5KGbtYjzpHILs/dLV/f7u0MRjVhsFJY
         FazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772042123; x=1772646923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i8gRH0YBs8R4dCXzko++9eZOKgk9GpolaSr9eR7PWeg=;
        b=GgDJkUfbUGiHt1TMQvW8RbUvejkMNOXYZhjeUq638QopXE7gk36QQ/wregK6jpg6KQ
         QZ7aDOp/XiR5Xm7M3lBIibfyX5CP/EyTXVddhxYpqIYzOhTayLEwjyME4ZN7cGRPzSn1
         0VYQb8LrhAnTvI06WspaAqitEP7EHOh7+o2WuA6+/+MCQKrb3/ZfmKhPTubTrUp5SCQU
         4Bd0vAkpaW8wVdnRojkTv3JIHrgCYtfWzldvmH/39J/suYMv5+/iwoAnH3/AkMSwlfvM
         3uDyjvDQCJpTGTgAlmw5GmHFRTQCnzGagKSUOrxOrleuvFXh5vjL30+uzUoFwYnBhxu9
         83FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKCXRuv8QrX176Fv0MKtqQJprVsCNno2p7wbEkT2ytGBxW9Huay9TNT4PPlOzlZvpZKTs+I4FQ9/1KxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9lm9pAbl7JLlMlCyt2T1qVnFcZe2TmYpAZ5diJYj56CKzeHYI
	5txsULFrwMKtzXcajuX+ygY9sw7z4pe/Cqa3Z36wVv132mwqsP3zMILv765lxXui8P4RwKTaw7w
	syOaogHrAw5TRful8cKq9iqURjTKNBFNL+q06HbGV
X-Gm-Gg: ATEYQzxCRMnqIYjy6DUW5Cy5FOcTYZxni0tCnxwnGV3iI023Hikdg8jF/tJF5jLLrNO
	V0aEteRix2HWnzGLlX2nROgzkzKVl+COruSWB7NMImYu49IIxGG4LOGVxTcPY2mF6q9DQR4gyjW
	5umBTpJAyoxjuOLIcWwvz2nGHFAtZY6AvdkRiau4c0gKM1l0yCJLHRLsEfjjqbNbQrAtLWL9bpn
	noq/zHM46XnRrWzd9myYL0xw7IvgU+LKHgH2Sik+rDjBjualtym5S2AgKGMvt+BYSuOC5RxbTFX
	EBv0HTRYGv8wYD1L7Kow6TvhB3+/GkHRX6U1VOcIWg8svluv//7S8jBIz/oDMU1OijsHu9E/BDZ
	wfWmB
X-Received: by 2002:a05:600c:8611:b0:47e:d9e7:1c12 with SMTP id
 5b1f17b1804b1-483bebec818mr726105e9.6.1772042122791; Wed, 25 Feb 2026
 09:55:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com> <20260224-terrestrial-jaguarundi-of-influence-e3ccf1@houat>
In-Reply-To: <20260224-terrestrial-jaguarundi-of-influence-e3ccf1@houat>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 09:55:10 -0800
X-Gm-Features: AaiRm52tUhgFoM5nopMxGR-oiwd-4ooH-ZyIViR4nk0fPe7YzI5THkHnLy4-ths
Message-ID: <CABdmKX1-SdLGR4=3q2dNAztA-2qz_AktVB9Pbs7kEZGQ3xLT_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
To: Maxime Ripard <mripard@redhat.com>
Cc: Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Albert Esteve <aesteve@redhat.com>, linux-mm@kvack.org, 
	Yosry Ahmed <yosryahmed@google.com>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53404-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4624719BD90
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 1:42=E2=80=AFAM Maxime Ripard <mripard@redhat.com> =
wrote:
>
> Hi TJ,
>
> On Thu, Feb 19, 2026 at 05:14:42PM -0800, T.J. Mercier wrote:
> > On Wed, Feb 18, 2026 at 9:15=E2=80=AFAM Eric Chanudet <echanude@redhat.=
com> wrote:
> > > An earlier series[1] from Maxime introduced dmem to the cma allocator=
 in
> > > an attempt to use it generally for dma-buf. Restart from there and ap=
ply
> > > the charge in the narrower context of the CMA dma-buf heap instead.
> > >
> > > In line with introducing cgroup to the system heap[2], this behavior =
is
> > > enabled based on dma_heap.mem_accounting, disabled by default.
> > >
> > > dmem is chosen for CMA heaps as it allows limits to be set for each
> > > region backing each heap. The charge is only put in the dma-buf heap =
for
> > > now as it guaranties it can be accounted against a userspace process
> > > that requested the allocation.
> >
> > But CMA memory is system memory, and regular (non-CMA) movable
> > allocations can occur out of these CMA areas. So this splits system
> > memory accounting between memcg (from [2]) and dmem. If I want to put
> > a limit on system memory use I have to adjust multiple limits (memcg +
> > dmems) and know how to divide the total between them all.
> >
> > How do you envision using this combination of different controllers?
>
> I feel like it can be argued either way, and I don't really see a way
> out of supporting both.
>
> Like you pointed out, CMA can indeed be seen as system memory, but it's
> also a limited pool that you might want to place arbitrary limits on
> since, unlike system memory, it can't be reclaimed, will not trigger the
> OOM killer, and more generally is a much more sparse resource.

Ok thanks. Yeah I guess we'll just have to add the accounting
complexity as needed to satisfy everyone's different needs.

