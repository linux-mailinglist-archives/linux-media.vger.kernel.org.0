Return-Path: <linux-media+bounces-65474-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BXwLJlWZOmr+BAgAu9opvQ
	(envelope-from <linux-media+bounces-65474-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 16:33:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC26B7EFB
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 16:33:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="ec+Fo/eq";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65474-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65474-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8AD80303E603
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 14:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0960B38886C;
	Tue, 23 Jun 2026 14:33:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A437DAB3
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 14:33:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225232; cv=none; b=RdSBwOxS/3jvkFJ6+Rpx9tcMj7JnSKVW08rwLDFGKUFX60VDQIBX/3qkJ4lSbyxo/HZKN5uMmngGMoqboKYK+9G3gkGtkFTFTJUfcjmIuua0eUMB/XTGeVyETuC1PDoRKSQK3BJvFaATS1PnSh2KCIBA/lTw1PX0Wl/balhyFt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225232; c=relaxed/simple;
	bh=ehF4t4EAD/IAoOVIU9uPF+z2dKiiXJu9e/jUG/hiyTQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M612ION2fGSG+HowY8zYPTitHJe4wRbmtPKXvxseBwaLzNqFtA02Env2JzKjT4nWM2nSfykxw66AIaqs3TnzZ9eimsxb0kIihnlRK1pJiJXrywwJ0J1lU/iN+eY/TBk1LCZu/W5edixN4dx2bDrcVZx48tjzuuKboxZrSAnuQw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ec+Fo/eq; arc=none smtp.client-ip=209.85.218.53
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c0c964d6470so428396466b.3
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782225229; x=1782830029; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ehF4t4EAD/IAoOVIU9uPF+z2dKiiXJu9e/jUG/hiyTQ=;
        b=ec+Fo/eq6PQt0LRIda7cbkEUg72U2UccvmiRWZWN9oSgUwA0z+WdcFD200ADQsUGni
         XE7eIEzq79cSkZ6rjb4NYQg6N3QRYhRLgUTuYOUI86ZbpvU21C1D7rY6SOoB7P7PVlLD
         WeuEBr5MQKCpcr+12+bbgyFjwJrc7XS6B/AoeAdRA3j9zymoAROPvvUj0IKC8QlMqPmx
         Gce+fIDmRyDyTvDJ3FZLNuZ5kbJ6XDtzKhhqawKQB9j8zB8FqJ+oyV2DH6prm5TIvd+a
         jPheFxINfju19l4eBLG2psw4MyIP7FGPg36DY3GCtc9V4m0dAb8KbRXGg0meV+m0DBCB
         o8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225229; x=1782830029;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehF4t4EAD/IAoOVIU9uPF+z2dKiiXJu9e/jUG/hiyTQ=;
        b=pf6xLiESH4t4Db7FfTwe+bRMPX1mp0s96YWRm7zaMebjJZcAFKcxcHNa62TILT8+Xe
         uMYQ7OHHopSHOUMW6I9XzgcIpgMWw9Z2Ot+gGHAFrM9maW5sXWow/tuz0Duko5hU3Ugk
         6czRsPUK5OdrPs9KzU52gmNNjaFNGzPieAhPCNs4V+uga5p9V+XzrRB1sPpWv6e2BJpu
         TkWx/JSBr9bJY8YI+EJ77xSMm4jl+XkEYaQiWkrmjJG4OunRLPsXLQXSWp7O2a/u8naZ
         jPKGX8I9MHBThifVkaDPaG/lS8a6CxM0+S8bfaRPfhG+k4G/BBKEZi+KV4wodRaWM2JO
         fyJg==
X-Forwarded-Encrypted: i=1; AFNElJ8Nf3Nczd5FkPLhDpj+WRUgKAo+IAUH/y6VsjynAflC9QU+YXYD6rhqjK28BR9Glo2n5dhixdGdMNGZJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJhDiVs0XhYJ1eAAw1HCviQaJEm9AoJ3GtdnIDW44sVcHsEfdB
	MjVzlo2+uUCfANffYhfWbCuZFiwfNJEqVUj5bAckB8KZcxUsl6pUQjXohw5rM3s18hQ=
X-Gm-Gg: AfdE7ck5Ucr669lInlws4UsfWiEoD2/6PqcNFr/Y8oJXfNxssAam35vd901D68AG4ug
	ytbsCUwGR+Tu7BM66RppRiNTPAjkkqiiuQ61irzaTn8yAyMVLC6sagaVw2oScMJCvKv33GXq3Kx
	/G3UP2YYOv483EVI52oZm0AtRgNqD4trLDpvmSJxI2x7AlpkjTswnFno8Li0S8BuLSc8sp4GEkC
	6iRCrBmbCOI8mwJMmE0zq8yeR/1BkchZybPNdIsIu27NJi4u++MLpwNGU2gfRy63TbjCZ229Bh2
	xAXlqOxTL/B8PaLHFgrk8IpAsCeXgp+nQFZjN0qJIrvRu9llWg8Wkizc2N7qFaO36E7LdltKrkx
	TmItcX+8jQaqd3uk+CWuM7Ec/nrzaFosEOgEIuWDH7wN9ECFI74siBDecp7D1zATXp+WIOYH8SG
	P+dACDSCi5uaAMpCcEOzo=
X-Received: by 2002:a17:907:9486:b0:bae:d29c:4e28 with SMTP id a640c23a62f3a-c108db17724mr165292866b.12.1782225229090;
        Tue, 23 Jun 2026 07:33:49 -0700 (PDT)
Received: from draszik.lan ([212.129.77.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e4c76sm536270666b.46.2026.06.23.07.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:33:48 -0700 (PDT)
Message-ID: <1467578694a17b2b4978a6193cf21db324daff98.camel@linaro.org>
Subject: Re: [PATCH] drm/drm_crtc: fix race with dma_fence_signal() in
 ::get_driver_name()
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
Date: Tue, 23 Jun 2026 15:33:48 +0100
In-Reply-To: <f59d6080cf31f424ebcf0e6086b4a93623813a6e.camel@mailbox.org>
References: <20260618-linux-drm_crtc_fix2-v1-1-c03e77b36f34@linaro.org>
			 <1cfd56b7f1a166e25d6588d66a621524f3d983de.camel@mailbox.org>
		 <6483098adae29787862473e39b1f9cf3c3f16625.camel@linaro.org>
	 <f59d6080cf31f424ebcf0e6086b4a93623813a6e.camel@mailbox.org>
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
	TAGGED_FROM(0.00)[bounces-65474-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BAC26B7EFB

Hi Philipp,

On Tue, 2026-06-23 at 13:58 +0200, Philipp Stanner wrote:
> On Tue, 2026-06-23 at 12:37 +0100, Andr=C3=A9 Draszik wrote:
> > On Thu, 2026-06-18 at 17:56 +0200, Philipp Stanner wrote:
> > >=20
> > > I continue to believe because of bugs like this and the ones I have
> > > quoted in the threads above the robustness of the kernel could be
> > > greatly improved if we could get dma_fence fully synchronized with it=
s
> > > lock.
> >=20
> > On top of that, sashiko highlighted=C2=A0 (via my other patch) that the=
 existing
> > code is missing some memory barriers:
> >=20
> > https://sashiko.dev/#/patchset/20260618-linux-drm_crtc_fix-v1-1-801f29c=
9853d@linaro.org?part=3D1
> >=20
> > I believe Lock synchronization would resolve that (as would adding expl=
icit
> > memory barriers).
>=20
> That is being discussed in the thread I linked, where Gary lists which
> barriers you would need for (presumably correct) lockless magic.

Having read Gary's suggestion, that aligns with what I had in mind.

> However, if my issue were to be solved with barriers, the
> test_and_set_bit() in dma_fence_signal_timestamp_locked() would have to
> be replaced with the more weakly ordered test_bit() and set_bit(),
> maybe creating other pitfalls.

For the avoidance of doubts, I'm not saying that all the issues you raised
can be solved by barriers instead of appropriate locks (I don't know enough
about the code and issues in general here).

I do think however that appropriate locks will fix the ordering issue
highlighted by sashiko (i.e. +1 for your argument). Barriers would fix this
specific issue, too, but that is not a statement about any wider issues.=
=20

> The ordering issue in the get_*_name() functions plays into that.
> Setting the bit would then be done after setting the ops-pointer to
> NULL. So one would have to try to move the NULL set, too.
>=20
> Long story short, this is painful and subtle.
>=20
> But I think what we are realizing over and over again is that dma_fence
> has many subtleties to its API contract, and the implementation's
> sparring use of spinlocks leads to workarounds where people take locks
> manually or have to do an RCU dance.
>=20
> Note that Christian is strongly opposed to guarding everything with
> locks, in part for supposedly occuring deadlocks in the fence callbacks
> when the driver needs to take its own locks.

ww_mutex could help against deadlocks, but might affect performance, in cas=
e
these are all critical code paths (IDK),

> The community discussion regarding that problem is currently in some
> sort of dead end, where none of us seems to know what the correct path
> forward is.

Please ignore if the following doesn't make sense, I'm just a bystander :-)
How about at least adding the required barriers and related changes, and
taking it from there? This would solve some immediate and easy to hit
issues on Arm64? If they turn out to be insufficient, code can still
be changed.



> > >=20
> [...]
> My understanding of the current situation is that as an issuer of
> dma_fence's you, in general, should wait for a grace period until you
> perform operations like driver unload, or, more generally, have fence-
> related resources and such being accessed through callbacks go away.

If I understand correctly, simply waiting for a grace period in the
driver's unbind should be the way to go.


> Danilo ... Maybe he's got the time to share some details with you that ar=
e
> relevant to your work.

Will wait a little :-)



BTW, thanks Philipp for all these details, much appreciated.

Cheers,
A.

