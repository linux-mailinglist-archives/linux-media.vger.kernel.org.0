Return-Path: <linux-media+bounces-25405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965A7A21D8E
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 14:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 652CC7A1E13
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 13:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E828713FFC;
	Wed, 29 Jan 2025 13:08:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC1DDDA9
	for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738156139; cv=none; b=CzQdcyCRlFGeCHaNp077csKuh+lWBY56R8mTjFLKkxbJE3TeXhcYXRjCrL1jdkl7kc0ELn7jCzAdkjxlEgK1b9rotK6YONESIGOsRoQNaj82A6RA8sPyrg9uWn++ZJOhVE2auoAAqL5AHMLmrF3qrr0QKfQKzsO7JYba0QsKtXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738156139; c=relaxed/simple;
	bh=LFHuwcgrlaaerl2BWugG0Fzl4nCuPEejq02SEtx3v/I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sFADUP91U47JYoDdSFmUPjQrv7Xo8xaKIhjyTsBqzffZ8kK3AtFEtcQk0rIoqEi5/dbFidPyF+aK2KWhHBWIb6cNPOqVJS/h/uSb3w5UICfYDzL9BFDSkWQZwqVQb0pHRaQ7xu7SpMg23XHfTgOxdNOhYnWlnqY8tAxK9Aw+R3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1td7oL-0006hM-05; Wed, 29 Jan 2025 14:08:53 +0100
Message-ID: <5323c8d6d906fe1724eac606c94588d815580a40.camel@pengutronix.de>
Subject: Re: [PATCH] dma-buf: fix timeout handling in dma_resv_wait_timeout
 v2
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	marek.olsak@amd.com, sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Date: Wed, 29 Jan 2025 14:08:51 +0100
In-Reply-To: <20250129105841.1806-1-christian.koenig@amd.com>
References: <20250129105841.1806-1-christian.koenig@amd.com>
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

Am Mittwoch, dem 29.01.2025 um 11:58 +0100 schrieb Christian K=C3=B6nig:
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
> v2: improve code readability
>=20
> Reported-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> Reported-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: <stable@vger.kernel.org>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/dma-buf/dma-resv.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 5f8d010516f0..c78cdae3deaf 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -684,11 +684,13 @@ long dma_resv_wait_timeout(struct dma_resv *obj, en=
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
> +		if (timeout)
> +			timeout =3D ret;
>  	}
>  	dma_resv_iter_end(&cursor);
> =20


