Return-Path: <linux-media+bounces-59944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFT9Eve98WkbkQEAu9opvQ
	(envelope-from <linux-media+bounces-59944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:14:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B232649112C
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47370305DEC0
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D3A3A873B;
	Wed, 29 Apr 2026 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iJ3g9kL1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62A03A6B68
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450294; cv=none; b=tywCuBns8az5bIu29IUSx4q5+u4LFx66hFQIKXEHI/w5CapP0OqFXhOLeb8Qho8CNYRCdMZbBtfJCzsot0n/IZ/FFbO0+5Zts+vKAOvYHjHf1+5ZAPGVkEbKiGR569cr9s4w8XJx+OXQuIq0y6hQbY0g1ylh5Hn5t6Wq8YX5EJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450294; c=relaxed/simple;
	bh=ko3LtTan+YBnb5IBwV2Fax/nNK6MsboBYeqY18CuzuM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HBusq6L6zW/nDE9TM/2BYYcZoELTsUgNVcyTezLZdnSSjXebiU/IVbRU8a3/NAqmdDVCX2aR2QcDfq5oFjB+ryBWZ1snWz1LcELomqsZ56eNkEHDZabgZFNxtc86WVsmofmVooo2ScqFg7VASt6oowWEox9GM/y1UHoJpejVqDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iJ3g9kL1; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4411a215f17so8497582f8f.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777450291; x=1778055091; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lr17Jge9GgkiGKrAiGt8x+/cqgjgJIF0Kac8aOzuZk=;
        b=iJ3g9kL12Z0L4R5lqmoMKyi4LFow6eWuSU44OG15aQ5C5eSKJR4enpXyDqExypXVRq
         JJxmyIQZNPtMJHPHxx7x2d8/jWH16OiLJJVaOff3weMoY8Ol3evQb1+Avc7hRK7hz22s
         QQs0BZsNaNLb52T46eo0iX4VtQOMIDjbW5MB84YDncap3Jt9H0rHFfVNEU2rtKQSY01F
         A87BmDmLk+JTRFX40xU7xxxxrSBK2PpM+xVMOh8RJTEP6P/2PXiO/OwI0cJCPKMi4auo
         3FF0e/xaxO0XuFeu+PcRv7c86keNK9EoZS/vrllp5/GzdvzaiGJNjR0nZrmVVP3FH/ZX
         qNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450291; x=1778055091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lr17Jge9GgkiGKrAiGt8x+/cqgjgJIF0Kac8aOzuZk=;
        b=rP3FKPSi/9mnzgvr1Oe+A0z0mXD7d1ge7cmlzCnK4BGWsLQlXm739yE2lD6zL5hfnV
         r3x6K3Ddmm9UtEH1IxE2UO3VH1Yr8I75rIu+wClG0ZvcbWz4/Ea9iNxBoPAV+HiUA8d4
         44m2rPiA1tWePZzecbxXOZihzYBbk5JK9JRjtNXG1sikncf3O1m8KR8usRDn4Dmq6Rub
         qz5cRAZoLWmdxdT3dzrx8wpona7Pa3+6wIf5TrKSWWcT9YWCZXcJaPDwhsRA/6T85AwZ
         ZQ43HeUnywBC6GKwWLw8w705rJbgqCX/t13cf2EFaOXN4WYggfwi6kZHeTqcjK3I7Hap
         C6Og==
X-Forwarded-Encrypted: i=1; AFNElJ/a9nIw24K43fCQgLURqyw2WKw2UNeH6C/NvI0cbuOEFt5cx1RJ+SlvvMtudBXtZ7tKItWVYFS4+sq9dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkgDGiX50Qsf3s+W7bQMraWQhZ7yBz65nrtlfzLA8/S9GpIdSl
	rEiFJPb0njthkym2N7tWec+gvF3aY0WilHpzErPOw+G+PcmRyITMHTnL3NmrrMv+77pC35pIgLz
	EQ8XOlhzXnBCf2xm0Kg==
X-Received: from wrhm3.prod.google.com ([2002:a05:6000:1803:b0:43f:e56f:629b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:186d:b0:43b:3d02:7806 with SMTP id ffacd0b85a97d-446494ea007mr11517494f8f.28.1777450290684;
 Wed, 29 Apr 2026 01:11:30 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:11:29 +0000
In-Reply-To: <20260428190605.3355690-4-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260428190605.3355690-1-lyude@redhat.com> <20260428190605.3355690-4-lyude@redhat.com>
Message-ID: <afG9MTFxCbKE8OOZ@google.com>
Subject: Re: [PATCH v13 3/5] rust: drm: gem/shmem: Add DmaResvGuard helper
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, 
	Matthew Maurer <mmaurer@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com, 
	Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	linux-media@vger.kernel.org, Shankari Anand <shankari.ak0208@gmail.com>, 
	Benno Lossin <lossin@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: B232649112C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59944-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 03:03:43PM -0400, Lyude Paul wrote:
> Just a temporary holdover to make locking/unlocking the dma_resv lock much
> easier.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>

Needs Alexandre's SoB.

> +/// Private helper-type for holding the `dma_resv` object for a GEM shmem object.
> +///
> +/// When this is dropped, the `dma_resv` lock is dropped as well.
> +///
> +// TODO: This should be replace with a WwMutex equivalent once we have such bindings in the kernel.
> +struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>);

We will also need this in GPUVM, so I don't think it needs to be private
to shmem.

Alice

