Return-Path: <linux-media+bounces-64578-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ew83ALKYKmr9tAMAu9opvQ
	(envelope-from <linux-media+bounces-64578-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 13:14:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4380367134D
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 13:14:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=AMtgwrNv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64578-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64578-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4805342453F
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1FB3DD843;
	Thu, 11 Jun 2026 11:10:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDAF3DB334
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 11:10:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176209; cv=none; b=F4OYu4AH9pn6aIRXRSqTgL/cYkyKNocfvQClJ9mdTmaxuYucOTs2L8vx4TtGUS7O4he4E6fBD8YGQAXipOgTSrjhLtkoAmbIwKGSs9cad1SVOz+0C7woj3aNVAg3/YvJT5Uhxa4BW/HBGvBp6PWwySSi/oCb4m1dzb/GGHmlmi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176209; c=relaxed/simple;
	bh=TEOPeQRDcTO8ZT8oB50G4bbjCXtdEl0gblwbnGjfT1A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hMWcr/Tjfbl2Ut3oPI17CMeE66WUtIAKoSYrvEAWTIvAPcjZAt/Fm7RVnco3QN2hQX5uutXGRuHa+6VFz9Dlm3WHbpyuc3WlV3OqUvEkg1yHV5PjgA6GpDLXpT99vOF+ggULnUK1iY5nt+por1aDt36FSEBN8e/4Z7m5Pq1gbko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AMtgwrNv; arc=none smtp.client-ip=209.85.128.74
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490e547f3cfso5217335e9.3
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 04:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781176206; x=1781781006; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YpGjHsDNrecPmydKZbz+npt4P/d2PQgzeW5pneBmX4A=;
        b=AMtgwrNvOy8NQbNMuY4JuWKsOzKBrE0K2E47go40gdE4ci3xMnu7z0AnKLVHnpV8RI
         /UDizTt/ni/+fPk3B+eQiCixKyVZYw8Y+/762G74AvPCDotyPS8sBkz2MUZTzXO6NBts
         q6541BAmHawAyGFLsjf/vpNZK9PddPhuN9r9fDOs7VHZjACq8m/p7HgacXDkPQ3o7v6W
         LpNnEd95uE4BZoDF/mp5M+yZLq7rfTeE4XOeifpAtzgaqlQVrBxg0X8Q5IZPNbCM7YHw
         W7EQPl02j4LYgannHqXkxgeFePoTQQzzeKsCkxahN6usxGTGoWcuQRrka8LArhaCbu4/
         9WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176206; x=1781781006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpGjHsDNrecPmydKZbz+npt4P/d2PQgzeW5pneBmX4A=;
        b=EBD2wfyPdie13nPwdbDfXngHRMV4I7Gsf38SfdA9EYnA6mf+H96IWlZpWaWKDCezQq
         YuL0zuE1kr49hqsDHulF6ugI/y1dlBNADRPlARXD2XiTOFjOH/SNx5rgaPwtFuaite+P
         wu/FYuUVBuk3OX3B8UisrKDm2IgCEMIRv9vATti7BiQ3bDwXHr7y+UPxLs/sv1Xon5kB
         hc0PpN8Fk8EkSepKVd5MtSjXaqsXqGRuO+HL+wm4N8qBADFO5+aBget5lDCUM8wYuXOU
         7yrlOufTAuht7JQQ0U2qlCTN1j48zFm08tnS65zjM4yIG2tQcpwEh75MUk9X9FRejHlB
         E/3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/daJvIv6BF3JOduxpl3nAks7WdT7SEnKbCPx9VCB3wIAdeuUahch9/9PvDhMufIf6Wic2Vfb+86SmQVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC51h7edjjPAmdENGEabo2S3YzZWEpfRMr/OZrE0S4Tu4qUguL
	DFbtsu44X+fUoYSAYzpIbHOBdAp52mgGCbeUWv6wDKqUwrUD5j5olDf6p2gLosBy9AQ93vtwbik
	0cuXzU2gCATHQKDPzow==
X-Received: from wmqe21.prod.google.com ([2002:a05:600c:4e55:b0:490:b058:c623])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:ca59:0:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490e561ee97mr20621955e9.25.1781176205567;
 Thu, 11 Jun 2026 04:10:05 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:10:04 +0000
In-Reply-To: <20260610162433.923550-3-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com> <20260610162433.923550-3-lyude@redhat.com>
Message-ID: <aiqXjAPQCQ7POxWS@google.com>
Subject: Re: [PATCH v20 2/4] rust: drm: gem: shmem: Add vmap functions
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64578-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4380367134D

On Wed, Jun 10, 2026 at 12:21:29PM -0400, Lyude Paul wrote:
> One of the more obvious use cases for gem shmem objects is the ability to
> create mappings into their contents. So, let's hook this up in our rust
> bindings.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

