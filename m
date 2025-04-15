Return-Path: <linux-media+bounces-30246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E974EA89EA6
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6D76167AA2
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 12:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3FE2973A0;
	Tue, 15 Apr 2025 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XCrIF9p3"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5A828E61D;
	Tue, 15 Apr 2025 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721686; cv=none; b=dWffxiNf1rZxrjtRBIvRjc+nGLMXoVS+ITg7lPri5qf0+OaP92llF/RIqMmEkbnyDAkmkw3PkCR1n5+tWymjH3D1QPt2oKdTm2TLMV0dHa5NYefm2etAPygzQuKbkROGdGAPAWmzqb0ag/44eU2Z/LZyiHF2qqEOT8FRkulYfg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721686; c=relaxed/simple;
	bh=K/FjfTvH1QRy7+t7pKsVPI8IS+WdkLH8SmEYGjRagwA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LC9YJBBVsclhF1ROoJTih43Q5NCOiCtaD3cfYS4NKgv6KkAKxhgbFPBrNgo54hBxqEbTMqKjVuqo2BlXM61m/HrHFkmtOOuvWPqVxyotse8nhhSe213ZmhNXfiRIb9As+FlnqdyKxT3WjDHSov9kH3Gh4RRejPlN5BKN2Xk3cAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XCrIF9p3; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZcPJ012q5z9sWs;
	Tue, 15 Apr 2025 14:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1744721680; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/FjfTvH1QRy7+t7pKsVPI8IS+WdkLH8SmEYGjRagwA=;
	b=XCrIF9p3qYjPKTa32Gt7lp4HeMkDbm5dXf4RLEonFk06uMtAbMgwWXkjqIR46XbE713xqz
	fE+SUU+xAn8sk/b6kuU1QEsyKqCPGFGcf6BTCFUdf8HSZp+Mp9hdtWimDXXroOW1Mq2AjZ
	6jpgBk+8cNhNmmeUcj389vv5NY/mtZS/M49hR3sJDMwWdOajQ1vJgMQMIfi7puukA2q1fk
	5oE+49W2M17Uw4RWT+8aoaPjxvUsqm1RjXc1dXF84SCY/AYVTESxoXiWFzmNmy0ti3MLW2
	eUDUqZCbc4KMM3sxTi53SRCABrFe7asAgwL0ryWhoWQ3NNP7zA++k90ukumh0A==
Message-ID: <573a616a5270d97f421a380e2e41c7e35d2f03e3.camel@mailbox.org>
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>, phasta@kernel.org
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>, Sumit
 Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Date: Tue, 15 Apr 2025 14:54:36 +0200
In-Reply-To: <2dba3077-a770-4e00-9a7a-c744096ae876@amd.com>
References: <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
	 <c737c89c7ce9174e349c61ab4e5712eee8946f13.camel@mailbox.org>
	 <50c9530d-e274-4f89-8620-16afe0981239@amd.com>
	 <1a73e5fe4350d6ee4b7d807612264eb637c4f2a9.camel@mailbox.org>
	 <d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org>
	 <81a70ba6-94b1-4bb3-a0b2-9e8890f90b33@amd.com>
	 <aca00cb25b813da4fd2f215829f02337f05642f3.camel@mailbox.org>
	 <45d66ca4-5390-42e9-869a-f5f9125d05b6@amd.com>
	 <1127db242503055b2e5e8d07db3aeae46cfb7a24.camel@mailbox.org>
	 <6e4628c3cfc7e0d1e4ea9af510ce0b09b34a8cf8.camel@mailbox.org>
	 <Z_0bOgTBkkRH9jib@cassiopeiae>
	 <2dba3077-a770-4e00-9a7a-c744096ae876@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 8it8cuy3unipa6fs4gcxd9fju5nkgkz1
X-MBO-RS-ID: 9a0b51d9a94caabfc13

On Tue, 2025-04-15 at 11:56 +0200, Christian K=C3=B6nig wrote:
> Am 14.04.25 um 16:27 schrieb Danilo Krummrich:
> > On Mon, Apr 14, 2025 at 10:54:25AM +0200, Philipp Stanner wrote:
> > > @Danilo:
> > > We have now 2 possible solutions for the firing WARN_ON floating.
> > >=20
> > > Version A (Christian)
> > > Check in nouveau_fence_context_kill() whether a fence is already
> > > signaled before setting an error.
> > >=20
> > > Version B (Me)
> > > This patch series here. Make sure that in Nouveau, only
> > > nouveau_fence_signal() signals fences.
> > >=20
> > >=20
> > > Both should do the trick. Please share a maintainer-preference so
> > > I can
> > > move on here.
> > Thanks for working on this Philipp.
> >=20
> > If you don't want to rework things entirely, A seems to be
> > superior, since it
> > also catches the case when someone else would call
> > dma_fence_is_signaled() on a
> > nouveau fence (which could happen at any time). This doesn't seem
> > to be caught
> > by B, right?
>=20
> Correct, yes. I would also keep it as simple as possible for
> backporting this bug fix.
>=20
> On the other hand a rework is certainly appropriate including both
> nouveau as well as the DMA-fence calling rules. Especially that the
> DMA-fence framework calls the signaled callback with inconsistent
> locking is something we should fix.

Do you have a suggestion where to start?

I btw would still be interested in adding some sort of centralized
mechanism in dma_fence that the driver could use to do some cleanup
stuff once a fence gets signaled ^_^

P.

>=20
> Regards,
> Christian.


