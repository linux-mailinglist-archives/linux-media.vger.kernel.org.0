Return-Path: <linux-media+bounces-47982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5433C98185
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 16:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0FC294E1B86
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 15:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79F4332EA2;
	Mon,  1 Dec 2025 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hv0AKTGB"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80067248898;
	Mon,  1 Dec 2025 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764604153; cv=none; b=HkKxZ8nN4RJXeuz1Mu5Eb1WkC4VPz2LsbLgf+2Y77wVfW+mAnrN0ZbShlqY0bRq0uF716QRpLA0tMLmUBmlij9ocpVe4sWatq3Xadnv0E8RnzQ5U6OIoEU6V+9Cev9zqhuq2XnGijRcQ9eh4Qr2ZLWkelJrJgKVBkaniEggp6m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764604153; c=relaxed/simple;
	bh=sTtvKJBWHuvEKaldP+XKT8j+leGXOSYDDD4ZkqGgcCk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=njsB0Ij6QMjDxtZBv+PvsJzln0tGkCGsEKxJdUhrJSUfhSPoKFn/a1ol7FZRMPhkYijib+9QrAj8LSOMSMYq2QbCIokLvyFTeBCDz9wDPhS/ivPo8lL8CRib6rnrkvMddtM5NeNP18ULb85b+Lia3pKL475IFzr4Sht3N5rOzTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hv0AKTGB; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dKpH24B8yz9sn0;
	Mon,  1 Dec 2025 16:49:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764604142; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hruJaujoQmZgouv4eWn1NVs1FLCVSTsn8oYJm+4wmRw=;
	b=hv0AKTGBE6vMtT3AIP7sWa36gEGP84YzlBx1OYwsomPLfHKixDy7mGf1WSXMZgjQLjTMeG
	GGtRdczS0N1zMlUl7PaDGz3GDGnib8cD0bhzbx4CoxCkulj7z+7U2s5NGm1PTcwt6fgzSm
	7cyCwvbubXZ5WC8zMECJCDbTr2uv2LTuVSlBjjcyMKr+t/Vy9FTSSjvMRCw5OfeyhDo17r
	Yqu+YgNoUr9TbudfknYzrpX6CjTZGBnNPUTRwGlh3YllDvUHz2QxQ1Ren6uCMobWNXEHI3
	OrKdg/JJ4nQUz+v6jxpUzK5obLUEPKWUjC/uoFYDNbfwEC8oUr/2Ggfh4LHpKQ==
Message-ID: <671926034e54072cb096c22e72cc826a19c84862.camel@mailbox.org>
Subject: Re: [PATCH 1/2] dma-buf: Add __dma_fence_is_signaled()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Steven Price <steven.price@arm.com>, Philipp Stanner
 <phasta@kernel.org>,  Sumit Semwal <sumit.semwal@linaro.org>, Gustavo
 Padovan <gustavo@padovan.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Mon, 01 Dec 2025 16:48:59 +0100
In-Reply-To: <1d9cef1f-3b51-42a9-b1e8-794d67f8e328@arm.com>
References: <20251125104443.82974-2-phasta@kernel.org>
	 <1d9cef1f-3b51-42a9-b1e8-794d67f8e328@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: f2a28e08b6326e83409
X-MBO-RS-META: fkmz7mmxhsgp4z47bgpsm5g8z8jq5izu

On Mon, 2025-12-01 at 15:46 +0000, Steven Price wrote:
> On 25/11/2025 10:44, Philipp Stanner wrote:
> > The dma_fence framework checks at many places whether the signaled bit
> > of a fence is already set. The code can be simplified and made more
> > readable by providing a helper function for that.
> >=20
> > Add __dma_fence_is_signaled(), which _only_ checks whether a fence is
> > signaled. Use it internally.
> >=20
> > Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0drivers/dma-buf/dma-fence.c | 19 +++++++++----------
> > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 | 24 ++++++++++++++++++++++=
--
> > =C2=A02 files changed, 31 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 39e6f93dc310..3a48896ded62 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fe=
nce *fence,
> > =C2=A0
> > =C2=A0	lockdep_assert_held(fence->lock);
> > =C2=A0
> > -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags)))
> > +	if (unlikely(__dma_fence_is_signaled(fence)))
>=20
> Here you are replacing test_and_set_bit(), but the helper just does
> test_bit() - so this is changing the behaviour (and I suspect is wrong).
>=20
> Thanks,
> Steve
>=20
>=20

Yes, that is a bug and has already been caught by various parties =E2=80=93=
 but
it's good that you're paying attention :)

We're currently in this revision, where the bug is fixed:
https://lore.kernel.org/dri-devel/20251201105011.19386-2-phasta@kernel.org/


P.

