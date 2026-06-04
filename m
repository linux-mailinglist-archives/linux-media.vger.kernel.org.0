Return-Path: <linux-media+bounces-63784-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id feCkJaFqIWp1GAEAu9opvQ
	(envelope-from <linux-media+bounces-63784-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 14:08:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA1A63FB69
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 14:08:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=KpP0bCD2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63784-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63784-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2338F302A7C0
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 11:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69328421F10;
	Thu,  4 Jun 2026 11:58:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AF9425CC9
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 11:58:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574294; cv=none; b=Jtwn16BH7Ve/HqXvQJJJNpJhsQhzMDHeME2epTzklUHu66DiUa2svAgDqR9BV6G2kCHCAD3/Sg/TSPqcYBZ5uYugHx8KGVlMP7d3JkEHHYsCa5MYVp4gfGOC3YG082SPPZls19SxFnsJ1+4X3fJo//iRYksOfGPzAp9p6SxPwEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574294; c=relaxed/simple;
	bh=UVIqVMclZDr4qxCyNWMZ/qWloEXWIhQNsmxjFg/How8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ftSIXn0rXzNbCLhADKORHveWz7zJr9u4eDMowiciSQ0o1fEUMnlN7OuMTgf5swu2YEAeQy4XEGLeqrG0eyozMKX9cYte0YLJUBIhsoXPn9W6yrCOj/cZhTCQBML6EoeJf70+tVWmTwqc9lcPZdSq+T0nAXJJed1mEb4PRDjrQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KpP0bCD2; arc=none smtp.client-ip=209.85.208.73
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-68ae236d5fcso746180a12.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 04:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780574291; x=1781179091; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tsDBf51o8QHp6SAQ5/8ziLKktk7y3LjUQBohqdmyxqM=;
        b=KpP0bCD2b/xDSQtHVikC8bBAVEkCDL8VxDlAKFX+lHSFzR0z81IFlJ+4uzRY/2Hgdh
         2inHTu+MDyzjmAaaTOzIWGTkU1fXI5fI3HBEuaXTBUMwvIRRJ+4ekBhknPlqKD37mxGx
         Le3XPZ5kcn1uVcxkXfDzMhg8LvjCM3c+7p6Bly6Pt3MpzHjj0wmaJYDbLkEkS2vWU2bV
         7i+QERjYZPVCQkqgiRkLy7ucx6Ln5Ss9F2TY5VL2t4eTx4j2/W9qzKt64/tmrN69UK/w
         6YD296c1YccmGZ3pvIeyU9oeaLG2h1YIlDzmbZfWfati3tijexUr+megDrQB24YwjofU
         y0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574291; x=1781179091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsDBf51o8QHp6SAQ5/8ziLKktk7y3LjUQBohqdmyxqM=;
        b=mdSxYK8yuPPmP3+jMd3aQetNWDyPp1pf8FuXzSe/UzVdIa9tSA3wVAGHv0VaArKIwc
         GBHQGaH4qAeUp/xgU+muMRksiUA2tZrHIkZMo0v3MR8Zmj4f2Z8/M1j2vmg7Cm8fFcvU
         e1H79ejsG8FAJkBrUNx3yP1XlReeGsj10z9ka2Hm16ZaJ2kMfVpRbogMm4PagLP9gdAo
         pGQ4a6eHJzJb5cLByBnymTiL5qVIsldiL5Pjsgzcc6DqdSQBzAoWPbClsSgjTkhqUWWm
         FO6XJ+gicLrLg+p/As2cN6lLc6xFh21agkqp9hoIPqDte7jnHVTtUUiNGHulAtkNm1TI
         lxkg==
X-Forwarded-Encrypted: i=1; AFNElJ+XaT/oMfvlQUYaJbefXCEE5AkluBI+SuFXmUiSogv2v/cH+SYgRckdorsRZaLEyjF0VPfxUAI1yb0saw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypwksVm/6eHmob0Kqkx56193yq2h9FQTken3hMi6RAoguME+Gx
	TnP5Sntp1rjsPm4wrH4WpMPpPbezLPQw1e1bYyp2bYmGVHVbBH3qLV7psPD2PLgi4nNpNSM1Gth
	1I1hPqbfRKZcjknteBA==
X-Received: from edrm6.prod.google.com ([2002:aa7:d346:0:b0:68b:163d:99f3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:27cf:b0:688:1d5:44c5 with SMTP id 4fb4d7f45d1cf-68e6f79352amr4016032a12.2.1780574290900;
 Thu, 04 Jun 2026 04:58:10 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:58:09 +0000
In-Reply-To: <20260603195210.693856-6-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260603195210.693856-1-lyude@redhat.com> <20260603195210.693856-6-lyude@redhat.com>
Message-ID: <aiFoUauWYLz-Oyrx@google.com>
Subject: Re: [PATCH v17 5/6] rust: sync: Add SetOnce::reset()
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63784-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:acourbot@nvidia.com,m:gary@garyguo.net,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:ojeda@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:mripard@kernel.org,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:dakr@kernel.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,ffwll.ch,linaro.org,lists.linaro.org,gmail.com,asahilina.net,collabora.com,linuxfoundation.org];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FA1A63FB69

On Wed, Jun 03, 2026 at 03:42:34PM -0400, Lyude Paul wrote:
> This function simply drops the contents of the SetOnce, given a mutable
> reference - since that proves we have exclusive access to the SetOnce.
> Additionally, update the invariants for SetOnce to make it clear as to why
> this is safe.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

This isn't needed, you can just do:

unsafe { (*this).sgt_res = SetOnce::new() };


