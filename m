Return-Path: <linux-media+bounces-59945-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD57HFu/8WkbkQEAu9opvQ
	(envelope-from <linux-media+bounces-59945-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:20:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95D4911D6
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01F4530209E6
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BED43B27C8;
	Wed, 29 Apr 2026 08:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ci+O2VoK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6333AF640
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 08:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450785; cv=none; b=uSt3gryJS2T1t/Htaa/iZkKE++NEMk37N706Bc8YR5h18hSa18M+xFl8X5jfnyCdykQxGicYrL1p3vRlUBHuoZPz2WkH6Hox7lgI33lUilWUddKA9pzpCHCzvaSgAa/csUf2wYC/6U7gNplwr458lx8OrAvevPt1evs6Pc40VUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450785; c=relaxed/simple;
	bh=LKuJpN2pB2b18H9F7deuXynJaKf97/KH2/2YaImR7qI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uda9Hmh7XbeHCVHNcAhRcgL3MKZx8GdmhkDhZmMIhQSYOMuYtTq16g5bMb81PFmSUf1mp5Mdm2+ryYactgKwH6+7uuaGXq8QiTi9Coo2kiMMGwJG2jLzW35cnki7YbVzfuaI0LH+zyZb+gpx6ZOPiv2+WgRMov5UwK3aL9bp5Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ci+O2VoK; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43d7d0947aeso7499303f8f.3
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 01:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777450782; x=1778055582; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UnWFkQyHgeOIkEs/wIKBFV9O4AMa1adBSTGrokeVPN0=;
        b=Ci+O2VoK2jGzPgGvfJ6aDZjwjXW1WdoBX8qfbSULAjO22b+Cwc7x12Rho4Clfkn9bZ
         mvW9AP7/TWXu9OLyFCPY6+9KyLglvR6LTr4y8LFJly+q9WsKu1h+y3LtfTJFqfamE8I6
         iviSR4Y/78bpqF0tACTfrX13VLy3IMaG77JYxuCltGMXrafIEz0JuYdb5tAP4YMoKJgO
         vxiuMmz2NjnxUyusCJSHWOOrqJezTWp870bd3PDY6sFP0AbtrP42yAKP+sxW3ewxfFS3
         OhpNMbcfmm7q1P0q1PxVITJPm9FflJMfGir/+JX5TqJzxOtzZ1MqwJJAuHTgQ2Vhx4Ey
         OMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450782; x=1778055582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnWFkQyHgeOIkEs/wIKBFV9O4AMa1adBSTGrokeVPN0=;
        b=J/ccgH0wxVLbkWQc58ngLhSc7fnqaS4/5rD0WNJJFRyUtlpF2poKdG5ryTYrw9Npa8
         7Vslre4UqqoB+0XzOCPQ4jizzEJHp/fwzQywDBOveanWJcKIM+PizsFnZVXMCUum5vir
         NjNAVdi3y255vCo6Py6JSRWmpMtQtLVrK3csoa2gsNDqfl5UGqGxxQJ9ZIdXKqrT8Toc
         rqo2FGZz5o1AO/Z4SlL+VkxBopBscxOhEEOkCf1LgsV9OK67dyRFM+5au6ujxwtu9jOf
         j583sTLWCDBd/6hyEbfuNHGLRwmEL3Ajku7kw+iM0PfoovdD+c6dU8S55/vaadh6qjJG
         PApw==
X-Forwarded-Encrypted: i=1; AFNElJ+T3ecINZ68RDtJJ3hqa0Yh2DtpHNhDAyzlFjhhY5ZGPUIIbdM7syOPutSFjo+xoZRZgBi89n5UvarQtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0MvmGokjKW5d2TO9a4LCcMev6G8DSJjEmEEGAOy/fK2fqQTHs
	nlVh0V6p8/A6e7utPM/X1A3w2HWznj/3q04DqR3otUsD10r8//FD/HOUthcWG90amKTrb4RUOIV
	29Giru6HE4/lLgptgrw==
X-Received: from wrve6.prod.google.com ([2002:a5d:5306:0:b0:43c:f94d:a0b5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:616:b0:43f:e43a:d85d with SMTP id ffacd0b85a97d-44648f28d2amr11438300f8f.3.1777450782265;
 Wed, 29 Apr 2026 01:19:42 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:19:41 +0000
In-Reply-To: <20260428190605.3355690-5-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260428190605.3355690-1-lyude@redhat.com> <20260428190605.3355690-5-lyude@redhat.com>
Message-ID: <afG_HUjCMH2qKjPS@google.com>
Subject: Re: [PATCH v13 4/5] rust: drm: gem: Introduce shmem::SGTable
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
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org, 
	Asahi Lina <lina+kernel@asahilina.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: CD95D4911D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59945-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 03:03:44PM -0400, Lyude Paul wrote:
> In order to do this, we need to be careful to ensure that any interface we
> expose for scatterlists ensures that any mappings created from one are
> destroyed on driver-unbind. To do this, we introduce a Devres resource into
> shmem::Object that we use in order to ensure that we release any SGTable
> mappings on driver-unbind. We store this in an UnsafeCell and protect

Outdated? No longer UnsafeCell.

> access to it using the dma_resv lock that we already have from the shmem
> gem object, which is the same lock that currently protects
> drm_gem_object_shmem->sgt.
> 
> We also provide two different methods for acquiring an sg table:
> self.sg_table(), and self.owned_sg_table(). The first function is for
> short-term uses of mapped SGTables, the second is for callers that need to
> hold onto the mapped SGTable for an extended period of time. The second
> variant uses Devres of course, whereas the first simply relies on rust's
> borrow checker to prevent driver-unbind when using the mapped SGTable.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

>      obj: Opaque<bindings::drm_gem_shmem_object>,
>      /// Parent object that owns this object's DMA reservation object.
>      parent_resv_obj: Option<ARef<Object<T>>>,
> +    /// Devres object for unmapping any SGTable on driver-unbind.
> +    /// TODO: Drop the mutex once we can use Init with SetOnce.
> +    #[pin]
> +    sgt_res: Mutex<SetOnce<Devres<SGTableMap<T>>>>,

As far as I can tell, you don't need this Mutex. Also, it causes
problems like requiring the reference transmute below.

Alice

