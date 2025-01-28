Return-Path: <linux-media+bounces-25334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB56A208ED
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 11:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C540718852D1
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 10:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C345A19E826;
	Tue, 28 Jan 2025 10:48:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04F019ADB0
	for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061304; cv=none; b=g4wHqHyIwRxGhjzRmqGwhIYZ/EE+5pmoP/aUfn7sfNWlBK5x/Fc3IZ9lVAapDNa0ENwik6NG4qOtyduSfgvsWf//tENVQpVkBHw8xGh6LnbYn7Kz3Gawe0lb/QLmDUIDiUoEIQMQaD9MFU5g97tVXpGdElejbMrPsWvPNXjlVvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061304; c=relaxed/simple;
	bh=uSsnnm5lNlZcrH5cq22sF7WeNU2mBCdhSVU6yE6ZNDk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oa4xSWD1TJrIxSpXH52jj25+pCLOmMatGj9mk+jbi4ylownuFTa0J/IqYjYNuKZ5yMAsRmiBj76QxA3J+LRJAosFU/vu+BmkedQna7OkBjJ/bxQQJuGlW3XVT64NpaJDb09d0j14UtEKMmsFxY9Xn5an2FjCldpwmTMlgLaJ7Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tcj8i-0007Cn-GY; Tue, 28 Jan 2025 11:48:16 +0100
Message-ID: <6681c5a71cadaee237dc4bf47e12ffd0bfdd89b0.camel@pengutronix.de>
Subject: Re: [PATCH] dma-buf: fix timeout handling in dma_resv_wait_timeout
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	marek.olsak@amd.com, sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Date: Tue, 28 Jan 2025 11:48:15 +0100
In-Reply-To: <20250128100833.8973-1-christian.koenig@amd.com>
References: <20250128100833.8973-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Christian,

Am Dienstag, dem 28.01.2025 um 11:08 +0100 schrieb Christian K=C3=B6nig:
> Even the kerneldoc says that with a zero timeout the function should not
> wait for anything, but still return 1 to indicate that the fences are
> signaled now.
>=20
> Unfortunately that isn't what was implemented, instead of only returning
> 1 we also waited for at least one jiffies.
>=20
> Fix that by adjusting the handling to what the function is actually
> documented to do.
>=20
> Reported-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> Reported-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/dma-buf/dma-resv.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 5f8d010516f0..ae92d9d2394d 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -684,11 +684,12 @@ long dma_resv_wait_timeout(struct dma_resv *obj, en=
um dma_resv_usage usage,
>  	dma_resv_iter_begin(&cursor, obj, usage);
>  	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> =20
> -		ret =3D dma_fence_wait_timeout(fence, intr, ret);
> -		if (ret <=3D 0) {
> -			dma_resv_iter_end(&cursor);
> -			return ret;
> -		}
> +		ret =3D dma_fence_wait_timeout(fence, intr, timeout);
> +		if (ret <=3D 0)
> +			break;
> +
> +		/* Even for zero timeout the return value is 1 */
> +		timeout =3D min(timeout, ret);

This min construct and the comment confused me a bit at first. I think
it would be easier to read as

/* With a zero timeout dma_fence_wait_timeout makes up a
 * positive return value for already signaled fences.
 */
if (timeout)
	timeout =3D ret;

Also please change the initialization of ret on top of the function to
ret =3D 1 so it has the right value when no fences are present. Now that
you use the timeout variable for the fence wait, there is no point in
initializing ret to the timeout.

Regards,
Lucas

>  	}
>  	dma_resv_iter_end(&cursor);
> =20


