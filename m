Return-Path: <linux-media+bounces-67183-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +ghYJRmxT2pUmwIAu9opvQ
	(envelope-from <linux-media+bounces-67183-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 16:32:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0FF73247C
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 16:32:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=NROZ2G6A;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67183-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67183-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59A84306F96B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 14:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B310E337699;
	Thu,  9 Jul 2026 14:26:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97440233933
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 14:26:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607165; cv=none; b=VEFTalFzJgoSVItXRS4j0kUr/b203DcdrTth6Hc4XU2uAcirxgNeUM5rADTqMTumdkBmPHlb/k+kI0KBRQSxOiPCHE3g5E9JmeyNtJ1l0AfB1rJkdJKk74TykoIm5bwWEKQcj0JHnPPSEROGFNNOAXDeuGoKcG3qoQUz3tKV3bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607165; c=relaxed/simple;
	bh=GUiGSyLWB9fQsFRzV21305kjOtQfbAKgpLx4+Ei2cqQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fZ3FHjAes5SO+Q9Szm95MHGh+4+LcqgaEHq6Y5/Yqdvtenmw0VY5qJ/UbTLkYZtepvsqGFmZfzEehlwxum/CwmgipFsOWwxhRukVuhYGS8XuP+Rd2oYI0mn1Fk3jGVAYsuX7jA8VKgPBZWx3s2RBK5lR3rL+NAx1S5sZ/lwb45Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NROZ2G6A; arc=none smtp.client-ip=209.85.208.51
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698b558a792so2381498a12.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 07:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783607162; x=1784211962; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GUiGSyLWB9fQsFRzV21305kjOtQfbAKgpLx4+Ei2cqQ=;
        b=NROZ2G6Abmv3R1bxfkMXVOf0VH+ap9nBEXsB6r54FUvTOlOnsYkABPGEXlEQqgpKJ8
         71sb0JKzFnVs7r6LSXhomhXHdMQof2esVt5lVNybEhwM3aRt3O9Nx7xjUdE7wshg/1W8
         govgRZq3qn1tcFyNq8OXi5Xyq+PfcbvpCjZMPNYfQ8XqC5dX2sNcAThHM4IlnVdAvVz3
         c4VLo9DnfJWc56+F2I1KF9VK7LZoNv5xDE/+6uRVQXEDZd9vdODzpnU68yRQXVYA3Rck
         zm0WqrvyXPjZ0/MI7jckgdlmiFWmbPCvhXHvfwVmGNSP7RXmamJTcn9h3mHafKaO1kEX
         Ck/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607162; x=1784211962;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUiGSyLWB9fQsFRzV21305kjOtQfbAKgpLx4+Ei2cqQ=;
        b=kJaj0SRSD8is5iDOT+Hj1vH4xyNgVCWG+6fdbZcBerX/56erA7oD3Sa+rDILJm5fvE
         M6vZ0Zp9z47JZtaR7m66fbWweqtofgFdtD1Hkp00EVi62dThywoAosd0KtE0TxdXa2+L
         tbekYWsZo7itGZ0QFq92uyLEGS/stNgqGbykeeBv+nfZ2XN4H9sntRY6Ye137BfHxLM1
         i9+Chyf7BEa7092itV60Cn33fl9GbxE9FVodc9lU4LIbBwBvSqgne9mA19tN3WgTauDr
         B1XbTRb46ZorE9WcWLEm9qIncMO4D1BlmEs+Zi9Tx9K+8UOyXBT9ri30cIOnJG1egPU8
         ZKrg==
X-Forwarded-Encrypted: i=1; AFNElJ9UsdTwLcZ3wj3eYMjqPHLRGiu+9ATV2DIgJx+GeDl+UzbFxDMcO4fAaEWBmMfPgX/CASeP7Sc9yFarlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+ACxWshcddyNG3+6iAuXgFeK7vc2ZICxh/M6V6DxYbxStdG0
	f4aesFWq36IxBPnyXQk28oy6swV6PC3kuFUlsB0P30jLXXRhlg3kEOtOY8q7KqdZCOw=
X-Gm-Gg: AfdE7ckfcpbWBLD+BjyKTa3OUriokdFlTFUX2lTOcZSkpFIBLcdLwbfndMqTTxy6hEz
	85M3JrK86LyjzzbZpwL3FEGwRxOyMuUIgJ0N/9nYDyyUdxF4FpmkvGr3fN/OLRdUzDq/AFHnxiy
	tLfG+1DGkVqvAz2x7aKAaZTKqB4tDoxP5HnqHdFsD6ewJxhSVHVSpUAfwh8AGkLXGwFzWtaU1h1
	uYWIrSV9ZdmcFp92VUcPqHUW9K3VeLrkVSEDAneo/OvpBO4aaOHXHBCO12iRN5PrK+IgJYAiqSa
	yy48Oo++RodZCyr8Oh+0/0P2tZpXXNAskNb9jCHCHYePSqTqqSOlL9T39AQt/nQFklHr1jEe8pb
	XSuuOdXJ57s7+qPJo8TfMqFzY9OEuOS4vYKkZ6zpR/RXLUoKLHU2pjLVgNA7vFlboykA4dSS99n
	GxsLBbaCpuXP8eMgu7DtCW
X-Received: by 2002:a17:907:a286:b0:c12:696b:dd78 with SMTP id a640c23a62f3a-c15ce1440c4mr305311866b.39.1783607161945;
        Thu, 09 Jul 2026 07:26:01 -0700 (PDT)
Received: from [10.1.1.102] ([212.129.81.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ca1bd81asm303276466b.30.2026.07.09.07.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:26:01 -0700 (PDT)
Message-ID: <f3c84538b682d0889420fb7f11834636ede481ca.camel@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/drm_crtc: ensure dma_fence_ops remain valid
 during device unbind
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: phasta@kernel.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com
Date: Thu, 09 Jul 2026 15:25:59 +0100
In-Reply-To: <899942cc84af7a82a35b4ca34b486c40327fd543.camel@linaro.org>
References: <20260708-linux-drm_crtc_fix2-v2-0-cf72be75d75a@linaro.org>
			 <20260708-linux-drm_crtc_fix2-v2-1-cf72be75d75a@linaro.org>
		 <1ccfc0b5d1696a8dec4756b675294e7fb41ab5ff.camel@mailbox.org>
	 <899942cc84af7a82a35b4ca34b486c40327fd543.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67183-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,igalia.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B0FF73247C

On Thu, 2026-07-09 at 15:19 +0100, Andr=C3=A9 Draszik wrote:
>=20
> Unfortunately, this still looks like an incomplete fix -
> https://sashiko.dev/#/patchset/20260618-linux-drm_crtc_fix2-v1-1-c03e77b3=
6f34@linaro.org?part=3D1

Wrong link above,
https://sashiko.dev/#/patchset/20260708-linux-drm_crtc_fix2-v2-0-cf72be75d7=
5a%40linaro.org
is the correct one.

A.

