Return-Path: <linux-media+bounces-53116-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DucHJ+1l2kf6wIAu9opvQ
	(envelope-from <linux-media+bounces-53116-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 02:15:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB241641C8
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 02:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3D1D301A70A
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 01:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFD42222B2;
	Fri, 20 Feb 2026 01:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GNgPSX1z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F5B1DED63
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 01:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771550100; cv=pass; b=VjQlIOXxnlnnHDdDW0LFyj4iiXbzTzORrJNZcP3fte+Sa1eFVTI3NaMI6YaFgdpTDphtkSQxtGs2guS0yGaIGDmP8xNM9AauE4FMKdX+hnGwCLq7L7XXpo78EDkZ6WDAutXp1D8OxtiDsCgWI07cF1yB9/HTxJwEAf40C9lZCCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771550100; c=relaxed/simple;
	bh=Euel4yQBIOk0xKSQpfoEpS6OErkxVXjZD9w8QY1ZOxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ti22Owwmg51thedOCLeSw3pC9GTjniLLcCgC/ds88pmUPB7o+/QkZZzL6SWRZ8BDbqzJ6WibG2yasErqJRcwCSD+LGjeiGWExX3igExUrgvrsZH/8ssOrCKkH6aFPEhiiSt8OTn55abdA5R5Lrmxsqtopv0otmcH+rtkJHTLu/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GNgPSX1z; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48371d2f661so18735e9.1
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 17:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771550097; cv=none;
        d=google.com; s=arc-20240605;
        b=EkuI+iz3UC5MUOGy42S34P8xOagb+gyZWbYKmj6ivMrg9R7VHwripzVB1T8ae5CaVx
         KO2LZbbktaBxUhP9g+Qhn80Fnc/Lr2csioDtxW4HRnXKtzr3def7on5N7l97fzksHExc
         GaHkUkAnTC3G6y0Uyik9Sp5e1rzYhGdRkoE571ugSPX03izD8qHzD6DIpHW56JM+/kfD
         Vo91DdOgBy9X6gIQM1GbM6SJL60WdngGzqLCykxNS6U+OERpccK+w0zkReiLURG0ZejG
         gnq+lhPICTQLiIoUltXIzuzoKbUvptC0x+HWd0iE9clKcKZCuKsmnJmbfOrfVm+PotiF
         JRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nmKdALZJb5FBSVFY2g/62lb/+tq0bPSvdEv6SUxXw5M=;
        fh=uvVFCKG3S4XUmCkk9zn2Dv6n/p40nhfqPLs3E7DgKYs=;
        b=ZxZlqDTK+R0yDq7ozei8MH/4XFjFrHyNpLKuVeew3mcsjM0nszdH+5wuDl0e7aKCNw
         1I2ZbbouS8POeFthDFHNDE2b8z+q5Zb0F3pI3yESdUatZbER1aAwDDhTuOquKIEI/82i
         WD3Yzyidjeu3+ptCzZtCuYzABkC9ZeGGcr66xa9LtQBXJ7hUvWUnbdd8fLx0yb7a3dMk
         fkS6enCE9upKjZ8xfikT90WE+vohCmvaJZdf1Iir30BpJrxY5DRc9iH1ZXJuujazwb3s
         uHUyIi7LwxDz0LLcmRyaSYMs96SdHH+HbNnxPJ/aOpb524MPcd1aRufS9fOC+vOJSqGk
         Ib0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771550097; x=1772154897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmKdALZJb5FBSVFY2g/62lb/+tq0bPSvdEv6SUxXw5M=;
        b=GNgPSX1zFnnVRAztGeVbbOI+R370ydixI44VC5c2+qqc6Thg9LnFdq/jLV+zmFSwco
         hZKfkw+ZSvUg/GMyMU1LLF9ZgwfIcFIoZEnXvv3Xfxx23OrX8yhkBV8kIfGCItwZyNuw
         lpoORIgm7mxvclJgryKEVMQoDemOypG4HMKAXyp2fmzrW7vQIWeC5Nqb2En20mvEtkZD
         qWUh3LaSmWue3MkBhCnC7jqF2qUDU0gQzK1i32bbhQZO5yuWUUmLITp349Y9p48qqG04
         e7FKHrm0H8bKrS3CSNGg6sxbVopGuk+OM5Hb7Hv40vclyuN5jS+Koiu23g3Rw2DWVkGT
         HsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771550097; x=1772154897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmKdALZJb5FBSVFY2g/62lb/+tq0bPSvdEv6SUxXw5M=;
        b=qCJUn6QtcGq/nZQC7YbkHU+fhOlsURP5ZlqRkk4a9rAEQBFTgeJfWWq9o5WNtGVeaK
         64f8tdcQpdNBozhflYZkBTJl7OcD0HFe0lBfMnGpybIyx+Sk3GKN1ncBbqCAtP2bVZ7z
         bDVwHSJRqVZIwfqm6E4tENdakFo3wOGIumtJCAq+KIXmKi38lLBjMxo46xduvfdwL7hg
         XGcSfyM4m/yr23U4zh0A0DTWcr84CyBw6bDoOqvntsq0IpxdTq68qk2jvtucEObZQ6mZ
         JRP9vittn3tRE0yaD8rqCPxyLrWHlyb2dLjOm5MUd1u168xtkFLbwkviqe6qnvidUP26
         PwBg==
X-Forwarded-Encrypted: i=1; AJvYcCUmzlhG9UFGqOvEUI8plRM3+eNJp4Kj0vBeigCLG0SrBWxJGjpexSJiOLxXmZg0U/+KOLHQmEPDj0SYKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJqXvSwyEW+Ah7TFx/x18SOsuZB69Y2/0bt3H7wEWzh0teCqXl
	HACW1RYigBqWpVRx5b6a9KgpiseL5AmkuXBQK5HLDkHlf/od0tCzcSbO0gd3v9P/K+m8S/EJ40l
	2wvUKFSny+7/rQPgrhH5dpBiQXyFl8CCiiCzvPnRy
X-Gm-Gg: AZuq6aJM/c2OEmXDm1tQIfFFimZYFM8CaRDspilnbXc2UHM/+8EBvtYtjNsC3DPzqBb
	NoGgJ8XUqtxkP1QHl+bxXGLLO+zjJIH3A1nOiWrGpzPUB2vVczo9DvRGugJP0PUs/f0e/RtPuxi
	79KAs/zVZL61DoUC2KIgRLo9lSe93UyNDLLBT2y0Ul1VW0RTyi6U67o9trD4cTlD1qv43YqB6JN
	IVCPcEFr4Ly4+1YicyJC27CSpVpFpRVxf35/uXp1RLAoNzZo5FPlHFZ3XZ2bW0XBg/oflxIfGd8
	TkQWik8trOJgaJJ86AWNXPcrgUOdqT7X6JmK1xQpRSlY5V93Yaq38BBGSBubl771p0Q2GIQO1No
	fTiNM
X-Received: by 2002:a05:600d:108:20b0:483:7f52:162b with SMTP id
 5b1f17b1804b1-483a3e452bcmr287525e9.0.1771550096636; Thu, 19 Feb 2026
 17:14:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
In-Reply-To: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 19 Feb 2026 17:14:42 -0800
X-Gm-Features: AaiRm51VY-6IMlt-ihglkgENMjUfEiHWPo38nPxJvuL5b9iXSTZyagxYxax_pqI
Message-ID: <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, 
	Albert Esteve <aesteve@redhat.com>, linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>, 
	Yosry Ahmed <yosryahmed@google.com>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53116-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1DB241641C8
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 9:15=E2=80=AFAM Eric Chanudet <echanude@redhat.com>=
 wrote:

Hi Eric,

> An earlier series[1] from Maxime introduced dmem to the cma allocator in
> an attempt to use it generally for dma-buf. Restart from there and apply
> the charge in the narrower context of the CMA dma-buf heap instead.
>
> In line with introducing cgroup to the system heap[2], this behavior is
> enabled based on dma_heap.mem_accounting, disabled by default.
>
> dmem is chosen for CMA heaps as it allows limits to be set for each
> region backing each heap. The charge is only put in the dma-buf heap for
> now as it guaranties it can be accounted against a userspace process
> that requested the allocation.

But CMA memory is system memory, and regular (non-CMA) movable
allocations can occur out of these CMA areas. So this splits system
memory accounting between memcg (from [2]) and dmem. If I want to put
a limit on system memory use I have to adjust multiple limits (memcg +
dmems) and know how to divide the total between them all.

How do you envision using this combination of different controllers?

Thanks,
T.J.

> [1] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@k=
ernel.org/
> [2] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ec=
c6b62cc446@redhat.com/
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
> Changes in v2:
> - Rebase on Maxime's introduction of dmem to the cma allocator:
>   https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@ker=
nel.org/
> - Remove the dmem region registration from the cma dma-buf heap
> - Remove the misplaced logic for the default region.
> - Link to v1: https://lore.kernel.org/r/20260130-dmabuf-heap-cma-dmem-v1-=
1-3647ea993e99@redhat.com
>
> ---
> Eric Chanudet (1):
>       dma-buf: heaps: cma: charge each cma heap's dmem
>
> Maxime Ripard (2):
>       cma: Register dmem region for each cma region
>       cma: Provide accessor to cma dmem region
>
>  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
>  include/linux/cma.h              |  9 +++++++++
>  mm/cma.c                         | 20 +++++++++++++++++++-
>  mm/cma.h                         |  3 +++
>  4 files changed, 45 insertions(+), 2 deletions(-)
> ---
> base-commit: 948e195dfaa56e48eabda591f97630502ff7e27e
> change-id: 20260128-dmabuf-heap-cma-dmem-f4120a2df4a8
>
> Best regards,
> --
> Eric Chanudet <echanude@redhat.com>
>

