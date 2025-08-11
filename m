Return-Path: <linux-media+bounces-39441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 630C7B20C4E
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 16:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5218D1703C6
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 14:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285432D3A65;
	Mon, 11 Aug 2025 14:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="erg8R9/+"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083042D3228;
	Mon, 11 Aug 2025 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754923059; cv=none; b=grhtn0YEjxkbEeaMM1m55RmSkSZozOVt3mux+DY0Vl4GhaEkUaqFzE4Ps1ZJ+bBHNRBvLjZPdn+rEVfJai6+zp50Od3U5EcGPNtdd6iq6nGjBYHABFOhgjMWICtYxepBu9pCkFX7bdxG+ucZmdxkdPTiaTkHgHvQvfc5+zLojXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754923059; c=relaxed/simple;
	bh=I/F/dYBajC74Nt2UsFC9R8lYl1X/ITY2zVe1qGmEoxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gkM6X73v/ELcoCWEUCoI3I6aaZGZzRCZFDoyA3X/0/WZ1oS45eIDDUQz9LDT1A7BGOenbMhqMOdyoeN9dOWNL/vWAVDfi/psggXNrBY8sfaSKWhhJXayF6vQhxDmiWUK+GVNj77nqShpD0QfplymwPL1rwq2IB7CkKod1oEmpB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=erg8R9/+; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=NoSRkGb0dSVui2kGtJMRO3df9aT4TuXtCWAU8XI+je0=; b=erg8R9/+VSQSatTiLHhlebP75P
	U+NhF7oAUdwhPfCtIOo9zP96Ns4yIcNv80x8QnpCQmd3H6PE96YtSC1SZvyNSLCXUK7lLi2U6W5yu
	zXniKGWtaKm9dUAAejJ7MXv0vJn4OtjekveU4VvOdsJJg0gi5/UyGW9SOyX+XInkgQA/lxI0yJ2jO
	y25aa/Vi2p+y5pPzz+uV4a1iRPr9af6zlaJhCVlYW91KF3eX8LDeG0A6//kW1T4WZ5y/2FMAQ+nwZ
	fUl/Q4kU4F9lTPurUJ3hN2PZxgQi8SVln0eVK7xa89KNcL2zarlBmYSbUfnfGuS9CAKRN4whudZIr
	xQjJOQpA==;
Received: from i53875a0c.versanet.de ([83.135.90.12] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulTeS-00021w-Ed; Mon, 11 Aug 2025 16:37:28 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v2] media: rkvdec: Remove redundant
Date: Mon, 11 Aug 2025 16:37:27 +0200
Message-ID: <1894144.QZUTf85G27@diego>
In-Reply-To:
 <20250811-rkvdec-redundant-pm-rebase-v2-1-90c47213fbbe@collabora.com>
References:
 <20250811-rkvdec-redundant-pm-rebase-v2-1-90c47213fbbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 11. August 2025, 16:03:45 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Nicolas Dufresne:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>=20
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

verif=C3=ADed the (new) definition of  pm_runtime_put_autosuspend()
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

But the subject could use some work, I only got
	"[PATCH v2] media: rkvdec: Remove redundant"

so maybe make that
"media: rkvdec: Remove redundant pm_runtime_mark_last_busy"


Heiko

> ---
> Changes since V1:
>   - Re-applied since the driver have been moved out of staging
> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index d707088ec0dc1f6a18b2d168ebdf20b443f2240e..445f7c92eee34f7d6f885bb51=
9d9eb24313da548 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -765,7 +765,6 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
>  {
>  	struct rkvdec_dev *rkvdec =3D ctx->dev;
> =20
> -	pm_runtime_mark_last_busy(rkvdec->dev);
>  	pm_runtime_put_autosuspend(rkvdec->dev);
>  	rkvdec_job_finish_no_pm(ctx, result);
>  }
>=20
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250811-rkvdec-redundant-pm-rebase-ed9b885eeadd
>=20
> Best regards,
>=20





