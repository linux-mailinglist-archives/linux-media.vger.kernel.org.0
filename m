Return-Path: <linux-media+bounces-53025-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO2UAAUqlWm2MQIAu9opvQ
	(envelope-from <linux-media+bounces-53025-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 03:55:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE06152BF5
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 03:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F7EC304520C
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 02:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAB92DF6E9;
	Wed, 18 Feb 2026 02:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sRfkBMWT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026FD72631;
	Wed, 18 Feb 2026 02:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771383287; cv=none; b=PLyAhwPEiqkLkeykZSsiNeMjpln5SgfNhy3ji5Kh18EuH8IbaH1DHV0Qx9Kj0kUb1Qrjt6ODWq99qb5gpNbYoPLWxgdb20McWr2tHUTMvjOyXujWGTSS3N2L2pTX5EpyPTBKd0zqY6Sk6S9CSx89yDN/YcvM/8amVlB5elKilt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771383287; c=relaxed/simple;
	bh=tUAWp2kXb7nKs705e+REMwmQUKWD1H5m05HAOvz39C0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qsE24lN22x2oZDOhp7LrgGWS2wjupk9eWzTQw2wS51g2xZg6u1Nbot2Et2/sC24KwXMyU/vp8VqBrB7VTDcFcwkyDYbahe9v796A2Ts3SiQo0wDpayWABKEH1F6VpDdayXbZ2fQiKfvarWCkD+HA5e124TfcI0GtqQZjAaOcvjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sRfkBMWT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from neptunite.rasen.tech (unknown [IPv6:2404:7a81:160:2100:e39a:e0d4:739a:978])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 457AC55C;
	Wed, 18 Feb 2026 03:53:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771383231;
	bh=tUAWp2kXb7nKs705e+REMwmQUKWD1H5m05HAOvz39C0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sRfkBMWTJmduEcr8fSHCHPPPZ9ohmPRqOb+weJ5rB5AL5I2BeOTT/qQcyM1qh0a7V
	 P1HpM1QF9FjceIVpNJ2+TR5M54agiMSQ7IG/o+wXG/dGbo9tkF6qogRYolcs4DHqcx
	 U+uT+2bpe8lYJBwvEDRIW9skGbut/QZth4RBTKC0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260216-rkcif-fixes-v1-1-b16db20b6d68@collabora.com>
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com> <20260216-rkcif-fixes-v1-1-b16db20b6d68@collabora.com>
Subject: Re: [PATCH 1/2] media: rockchip: rkcif: fix off by one bugs
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Michael Riesch <michael.riesch@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 18 Feb 2026 11:54:35 +0900
Message-ID: <177138327574.607498.2921551745951217715@neptunite.rasen.tech>
User-Agent: alot/0.0.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,ideasonboard.com:email,ideasonboard.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53025-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+]
X-Rspamd-Queue-Id: 9DE06152BF5
X-Rspamd-Action: no action

Quoting Michael Riesch (2026-02-16 22:49:56)
> From: Dan Carpenter <dan.carpenter@linaro.org>
>=20
> Change these comparisons from > vs >=3D to avoid accessing one element
> beyond the end of the arrays.
>=20
> Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vica=
p mipi capture")
> Cc: stable@kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 +++++---=
--
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b=
/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index 1b81bcc067ef..a933df682acc 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -489,8 +489,8 @@ static inline unsigned int rkcif_mipi_get_reg(struct =
rkcif_interface *interface,
> =20
>         block =3D interface->index - RKCIF_MIPI_BASE;
> =20
> -       if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> -           WARN_ON_ONCE(index > RKCIF_MIPI_REGISTER_MAX))
> +       if (WARN_ON_ONCE(block >=3D RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> +           WARN_ON_ONCE(index >=3D RKCIF_MIPI_REGISTER_MAX))
>                 return RKCIF_REGISTER_NOTSUPPORTED;
> =20
>         offset =3D rkcif->match_data->mipi->blocks[block].offset;
> @@ -510,9 +510,9 @@ static inline unsigned int rkcif_mipi_id_get_reg(stru=
ct rkcif_stream *stream,
>         block =3D stream->interface->index - RKCIF_MIPI_BASE;
>         id =3D stream->id;
> =20
> -       if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> -           WARN_ON_ONCE(id > RKCIF_ID_MAX) ||
> -           WARN_ON_ONCE(index > RKCIF_MIPI_ID_REGISTER_MAX))
> +       if (WARN_ON_ONCE(block >=3D RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> +           WARN_ON_ONCE(id >=3D RKCIF_ID_MAX) ||
> +           WARN_ON_ONCE(index >=3D RKCIF_MIPI_ID_REGISTER_MAX))
>                 return RKCIF_REGISTER_NOTSUPPORTED;
> =20
>         offset =3D rkcif->match_data->mipi->blocks[block].offset;
>=20
> --=20
> 2.39.5
>=20
>

