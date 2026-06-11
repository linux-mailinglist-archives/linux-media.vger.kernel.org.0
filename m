Return-Path: <linux-media+bounces-64574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sQTtGZuVKmoEtAMAu9opvQ
	(envelope-from <linux-media+bounces-64574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 13:01:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDB46711EB
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 13:01:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=RgpBsX1h;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64574-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64574-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 377F1306A9B6
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364CF3DBD64;
	Thu, 11 Jun 2026 11:00:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0573BCD37
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 11:00:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175648; cv=none; b=Bwh2yDEfmfytc3h8Dg3qDoEj9P97W5vNpiqWzk87Z9Of/qtu0NPSWxfc+FuJIo/uB9K7GevdlMCpUpjGdrw7HqEfy7neyB/EeWp6IE+UUU3Gu+jiypnArnh2kjevrrWi2JBRksLBFKDtmfwFAuwRAUg+fh7/pI6/0Os/9cn2P8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175648; c=relaxed/simple;
	bh=tnZOY1RXHofhJOvGXyC8+UwuNkCrbyxj5bN8ndN8t2o=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=o9tDyq22R5NfAH4p8Zvl24TZLVF5Q2UePy2cx0TCIsUbEuCDI1IjVUt4oHKMigbP+JQFyAfnQkPZS+JKzFmn4Ppu7meuotFPxZqbzD+xAGasHaRNzD5yRm+d2LmaB18UX0CRL0C8srfdEH+Gqmot0he6SKIgMNE2Lkm7xTOfDnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RgpBsX1h; arc=none smtp.client-ip=213.167.242.64
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9A109D1;
	Thu, 11 Jun 2026 13:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781175615;
	bh=tnZOY1RXHofhJOvGXyC8+UwuNkCrbyxj5bN8ndN8t2o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RgpBsX1htHXEcQeu8fqZAd5X7bLLlETmxkn0JXesXzPxZmRmfBKbAUWhtt/B6vXnZ
	 YQrwxEj3Tmu5SZWrsROTY6WZr6X/N7K3VvfoCKiEdB/lkHiBUcRazy1UjGGADDSxjX
	 /eo7USk4kOrCSIMK1+HkQ5Rh6nC3L5aVHd5aOp/I=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260611095046.2665272-1-serin.yeh@intel.com>
References: <20260611095046.2665272-1-serin.yeh@intel.com>
Subject: Re: [PATCH v1 2/2] media: i2c: ov8856: fix debug message to report actual CSI-2 lane count
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: serin.yeh@intel.com, sakari.ailus@linux.intel.com, jimmy.su@intel.com, sarang.sapre@intel.com
To: Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org
Date: Thu, 11 Jun 2026 12:00:43 +0100
Message-ID: <178117564309.3890308.14729161396189411788@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:serin.yeh@intel.com,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:sarang.sapre@intel.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[ideasonboard.com:query timed out,intel.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64574-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,ping.linuxembedded.co.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEDB46711EB

Quoting Serin Yeh (2026-06-11 10:50:46)
> The driver currently prints the number of data lanes using
> ov8856->cur_mode->data_lanes in ov8856_get_hwcfg(). However,
> the ov8856->cur_mode structure is not assigned to a clearly
> supported mode at that point. Due to the missing pointer,
> enabling dynamic debug may lead to a kernel panic.
>=20
> Instead, the correct number of CSI-2 data lanes should be taken
> from bus_cfg.bus.mipi_csi2.num_data_lanes, which represents the
> real hardware configuration determined at runtime.
>=20
> Signed-off-by: Serin Yeh <serin.yeh@intel.com>

Perhaps:

Fixes: c492ec9ae9ed ("media: ov8856: Add support for 2 data lanes")

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  drivers/media/i2c/ov8856.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index 9d2b0469a576..6011233a218d 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -2318,7 +2318,8 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856)
>                 goto check_hwcfg_error;
>         }
> =20
> -       dev_dbg(dev, "Using %u data lanes\n", ov8856->cur_mode->data_lane=
s);
> +       dev_dbg(dev, "Using %u data lanes\n",
> +               bus_cfg.bus.mipi_csi2.num_data_lanes);
> =20
>         if (bus_cfg.bus.mipi_csi2.num_data_lanes =3D=3D 2)
>                 ov8856->priv_lane =3D &lane_cfg_2;
> --=20
> 2.25.1
>

