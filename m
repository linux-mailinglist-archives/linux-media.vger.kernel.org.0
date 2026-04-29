Return-Path: <linux-media+bounces-59943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOpzHfG78Wl1kAEAu9opvQ
	(envelope-from <linux-media+bounces-59943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:06:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE83490F70
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3232300E14D
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33E33A7F6B;
	Wed, 29 Apr 2026 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p1Wsr0XN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55A43A7F7A
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 08:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449960; cv=none; b=eMwO7qBaaR4guQB/9jY2P54VBy+C6XJAxWuHP2VI9jJCcB/6h7avpP2e32Z3QZCejw/WhHVFcL89yfgBDUJspX9hpY/eQQZlusr/cNUWL2+Uo+4BgaBYNlaGfvIlGohAPgsa2NBBJ60aYEXay5HPn1kCwo3lgVirCeIoNNZ7XgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449960; c=relaxed/simple;
	bh=7PKamtfmq5JClsXy15li/SjWhFAvdUqut66TbU8qjjc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cf33wLKECL6Hj+P12hzoCnTIg9J0ln8M5Lhz/r+hhuJ5rymEPW3cF9ePpr3fR1VRZvZIysH9BdezYYKGd34vxR4qDhizdigX4iQaFZtHRuNaHJ1zdOW+kv9mh5/CaqNsLD002d36AcA1EKBq61t6uILC/9BllIFXPbehczFLzAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p1Wsr0XN; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43d7757463eso328272f8f.0
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777449956; x=1778054756; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6Sri/DxWYhekkoJhKaFCAGZ5nRi8N5LN4MWLa1I+oA=;
        b=p1Wsr0XN9r8hw6Xc3Tc73Ouyx6KJzolyn+dIRO8DR9s2G35Zs+4fhY803DnC/gAfGm
         VhGkYrYyPYjP29V3gR+ADRsaLKVo+dxShewfuOVC0pe9c4EmD6Xj3LDAPtOg2iuDEoh6
         F3w/Rxgs/FKIdc+KiSNw2xb5mgmLAuXNHgT5ji649O3VFiELCNhZaa48wAvLx3HhwYeN
         zeGDCwE4Tet76hCbjSWRD06Ys5sIOJy+zI3bpttBAAR20xkghWfvLkyYYhvkLJO5+u/Y
         CBXl1715Y6/wdXBS6/RIxff2o6ceCBiBWI0/X5Xy8aejhq4BAt2IWQ/IigBXYd4NzFI+
         +YVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449956; x=1778054756;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6Sri/DxWYhekkoJhKaFCAGZ5nRi8N5LN4MWLa1I+oA=;
        b=NjUO812eoSzjnO1ia6Ry1DOsuRXgIKaRpd7oUQZY34dgj8VKENw7JadRowe0G97ipe
         8zvRR179Odh9V1fkQWiCe+YPB4UZ2nW+ZadV1rnuVMfSdUFLlUIK9XpTNiJsV5hWzRiT
         3Ejb7ch8vCDtFQFWjM+N1sXzSRybwO8KDPppOsEoHPvFU8LA+xdDrkM20ivYFMJTrN1m
         cXU4VLVYqqHmdqfr6YfyVP8S4dg1mG7KY93HPtLkMRNPviTWGD9ish+RxERwpCjrb5dr
         tv9kFBHJQonGRjz4oVY/hXncP7kYZWRpBZVMAAdPcagnupFi5FsPCMnxawh5c7zQ6bEW
         FEQg==
X-Forwarded-Encrypted: i=1; AFNElJ8sF5VdJYxsbH2knQoB5KBWuGGa3+IFPvFeDDk++G0Xxa3j4PSLpG9CSQV5YwpGh0GiUEzSsFNMJA17lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAhudTwE4SW9D6ySyS88yxfOVZQ9o5xLvJLXf/jQPeiiJ+NG86
	oUkyrALbPbSOu+z5dD/SmR2ooxUqwnApYca+FidxtAlqNxhb2TLzG6fjH79PBzk3k8TzPXNPzBy
	DT2KT+b5OmzrEhPk4BA==
X-Received: from wmkz21.prod.google.com ([2002:a7b:c7d5:0:b0:48a:5351:7e80])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8012:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48a7bfb4564mr34552015e9.10.1777449956055;
 Wed, 29 Apr 2026 01:05:56 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:05:55 +0000
In-Reply-To: <20260428190605.3355690-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260428190605.3355690-1-lyude@redhat.com> <20260428190605.3355690-2-lyude@redhat.com>
Message-ID: <afG744xkGUZBgNth@google.com>
Subject: Re: [PATCH v13 1/5] rust: drm: gem: s/device::Device/Device/ for shmem.rs
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
X-Rspamd-Queue-Id: 0EE83490F70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59943-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 03:03:41PM -0400, Lyude Paul wrote:
> We're about to start explicitly mentioning kernel devices as well in this
> file, so this makes it easier to differentiate the two by allowing us to
> import `device` as `kernel::device`.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

