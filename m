Return-Path: <linux-media+bounces-63783-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WcccF1toIWrbFwEAu9opvQ
	(envelope-from <linux-media+bounces-63783-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 13:58:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D0063FA55
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 13:58:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=P679IZHY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63783-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63783-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC7E130F3E9F
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 11:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A38F423A79;
	Thu,  4 Jun 2026 11:49:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB02B426696
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 11:49:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573773; cv=none; b=o2OtCLo4PWHaEgT4F39nnWuxIV/0z8+0HHbF+HK9TRVlsjYr8o9jF+3qLPR20Oo3WcjZTYqHoNJyzYxa/8nO/jyVvvyQYw5erypT1EkcIDEC1CEb32t1sKlozlObQ/p3SCh74XSbSCGg+mGwPAFs4POEO6gGyczcTM42nYp6/4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573773; c=relaxed/simple;
	bh=eOJ28jQK0dMXwHg78GmVtabOBwJqVXIChB/pOF0BUW8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sl/1F0BPK5ZVUSvne8Q7zEbuiPAUjVnjF81Q9MjjfCZJR9k2ok5MQdILBYIQeNt3iow9ggoqpybvIylDWMOsfSup79szVGvpFwy6TLHaN2PavbR+L47rhmFtuvK6FrUquLwDDvexYg51YDxEv/AknwrzJP42qC0Vi3J1UfrrCfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P679IZHY; arc=none smtp.client-ip=209.85.128.73
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490b7959b9fso7141105e9.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 04:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780573770; x=1781178570; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IDsisrKoiSBYw8b45wvLvNabX1p1YR55LCjFQrLjodw=;
        b=P679IZHYZyoPKYWl3QwucXddhueKnOUJtRKPw9yUpKYxsxqTeI9HoYO9j0V/DhYHdD
         YbtKGfQoj5rQ7q6kOPCZSH9CZKobzYWfzHhKbQqv8PX6iHOYfOxWMCHgWjh8al4cG3T0
         6uNpKxxztgHlKlzyx30PRA3Zs8yOyosEpPvPa9TlXdOrY2ScQT/th02wl/EfLM65k+pt
         8vSg4hIneziuN7lCZfpHMY5ZUenVlYq6fs2j69h+Ur0jiU2g2yLTdQdWVE3EbBh6GeC6
         ToS8jYwmYS/zb4OYtPN2gGVv4xkzXAaH/7hqVyy4jUCEgOp8OkIcN5gT0uAMO4lDW/Zn
         9wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573770; x=1781178570;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDsisrKoiSBYw8b45wvLvNabX1p1YR55LCjFQrLjodw=;
        b=gYFMg4uTOue06+QlcxySpEeDOS4fvbcBjnkc1275T9/OqxxxQmo6Lf/0D0h/AgLMr8
         DErPFaoch7GgrDQaxhtElTHaAcUqccQ3SfZm3QjE76bnTa1628Y5WaVfNIrBIkdKPWiV
         6fcYSXi2ODbn0cfu63cuJM87K8cq1GJ8l+y4W492gCyexsn3pQOtt4I1L6XOSJzbKu5O
         mp6pRZGhlDwmXfw2YVyTXLB+oKUvkyHWx5a5PPzSrK/upA1e1KPeNPcS7Q2IntFJ2DA5
         5tsgIUKxAcGRxm/U1Qhfza5kvQp3pfQjvjL563vY7vV7xLlAZg3scypBjeFJEFGx3P4D
         HeIw==
X-Forwarded-Encrypted: i=1; AFNElJ+8R+VmArjtSlcx8QPflB1xGdfKv0pf7H/Lf8Fa6PUhmoA02O3eLDmEMfO65KFh57zBQCn40q3jx7uvsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeaxqBfW1wUmF3Cg8fFqUW/rAogx/uxXCd6XutcWBC1him2IDN
	U4Pf2Jdxr/cI3Ag2+tkjpePQCx+YvDYU0TtUvibfkbzufyqp34/ZY4CJQADTT68hRbBQsaEuHQH
	Di+pD4UxfDlOxuN4R1Q==
X-Received: from wmbc9.prod.google.com ([2002:a7b:c009:0:b0:48a:7f8c:a95a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d86:b0:490:6869:46c3 with SMTP id 5b1f17b1804b1-490b5fe79f8mr132548195e9.30.1780573770264;
 Thu, 04 Jun 2026 04:49:30 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:49:29 +0000
In-Reply-To: <20260603195210.693856-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260603195210.693856-1-lyude@redhat.com> <20260603195210.693856-2-lyude@redhat.com>
Message-ID: <aiFmSUi0ZHVIj5Q1@google.com>
Subject: Re: [PATCH v17 1/6] rust: drm: gem: shmem: Fix Default implementation
 for ObjectConfig
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63783-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:acourbot@nvidia.com,m:gary@garyguo.net,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:ojeda@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:tzimmermann@suse.de,m:mripard@kernel.org,m:airlied@gmail.com,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:dakr@kernel.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,ffwll.ch,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4D0063FA55

On Wed, Jun 03, 2026 at 03:42:30PM -0400, Lyude Paul wrote:
> I completely forgot when coming up with this type that #[derive(Default)]
> only works if all generics mentioned in the type implement Default (and T
> usually doesn't). This being said: We don't use `T` for anything besides
> using it for a reference type, so whether or not it implements `Default`
> shouldn't actually need to matter.
> 
> So, fix this by just manually implementing Default instead of deriving it.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

This one is so simple I went ahead and applied it to drm-rust-next right
away.

Alice

