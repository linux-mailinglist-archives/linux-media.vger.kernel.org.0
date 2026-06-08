Return-Path: <linux-media+bounces-64207-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GoIJN/rtJmrHnQIAu9opvQ
	(envelope-from <linux-media+bounces-64207-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:29:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43441658B6D
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:29:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eBzmgWtl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64207-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64207-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DA4631677BD
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CE23D1CC6;
	Mon,  8 Jun 2026 14:47:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FEC3CCA19
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:47:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930023; cv=none; b=Hr7oqVyT6xqgj8GbcP4UXyrCb4kZriuh0QIqoxKnax2CidO7LP/McJUT4jPexnpU4Wtofk1FwXJVKqZkGmE/8XJ+aE3UVy4JOmwjHS+w4Eej4nKbrlWObCz9DjI3a5DQ6V0BHUQL9ozlQxwyamgLZQMxDLNy37BqLhz/IOvgIac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930023; c=relaxed/simple;
	bh=/DoS76v2zbC/YjJxWgEE1qnEMV28L83cd39M49PnNzU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cW5Ja0KtuMBXcCFax7nEVyUkPAJCBAqXqJSKVRt7s0juSxQLjNWthnduBYB89KU5BvkhzLUeEqb9jQTomlvA6GfRmH5zxPEouvurmVamoblfJR7Bra6n42PnKGV77ZUIZQIf3pDo4Q+Umbg7l2mGKUObiXzNiZcgxpalQDFvGws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBzmgWtl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E771F00898;
	Mon,  8 Jun 2026 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930021;
	bh=+YKLvpVESCoec/N5wGsx5KlVfkUU6MS47+INIilproA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eBzmgWtlPj3Lf25chv6bVmfQO1KWsRqL7jY3oObg/G+e4VCXM4mk1hDmlLsHpD3s4
	 vXmRKIBuzkt4C/oOB0KC+NL37LL9EbDCxRJULO/iceSEfmwEx1oAdE4LTVwBPmzXnt
	 gYrDgjohzgqClp7C4tIiNv1vjhRcsvJ5VQiV7XMDNOSc7ON1t/5yB+V18vUUwBw4n6
	 jhuY0Pb7FOqvhZ7sjvBk69ezuMk/tutZGtEkAm6g2vzAttdLMyYrTcq1uiAzIe9jaT
	 6iwc5xFaqJemT3rWEXpnhR5bjm6LnHBa9QpXDtsaZsqHCeye9PaqXUZ5TOEaEn/YOW
	 efsZOMYDs3kdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] media: i2c: ds90ub960: Enable CSI TX1 port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260608142901.3971821-2-r-donadkar@ti.com>
References: <20260608142901.3971821-2-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 14:47:00 +0000
Message-Id: <20260608144701.99E771F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64207-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:r-donadkar@ti.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43441658B6D

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Hardcoded UB960_CSI_TX0 bitmask breaks I2C BCC routing for DS90UB9=
54.
- [High] BCC mapping logic fails to support simultaneous dual TX port opera=
tion (TX0 and TX1).

Pre-existing issues:
- [High] Unpropagated error code in `ub960_parse_dt_txports` causes silent =
driver probe success on invalid configurations.
--

commit 0dc01ebf1eaaaa529c104f124de26cfbe4fac4ff
Author: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

media: i2c: ds90ub960: Enable CSI TX1 port

This patch adds support for using the TX1 CSI-2 output port on the DS90UB96=
0.
It parses active ports from the device tree and configures the RX_PORT_CTL
register to route the I2C Bidirectional Control Channel appropriately.

DS90UB960 data sheet: https://www.ti.com/lit/ds/symlink/ds90ub960-q1.pdf

> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 15a9797b47ac9..653dc7a4eee53 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c

[ ... ]

> @@ -76,6 +77,8 @@
> =20
>  #define UB960_NUM_BC_GPIOS		4
> =20
> +#define UB960_CSI_TX0			BIT(4)
> +

[Severity: High]
Does hardcoding UB960_CSI_TX0 to BIT(4) break compatibility with the
DS90UB954 chip?

In ub960_parse_active_ports(), tx_mask is populated using BIT(nport), where
TX port indices start at priv->hw_data->num_rxports.

For the DS90UB954, num_rxports is 2, meaning its only TX port (TX0) is
assigned BIT(2). However, UB960_CSI_TX0 is hardcoded to BIT(4).

When ub960_init_rx_ports_ub960() checks (priv->tx_mask & UB960_CSI_TX0), it
will evaluate to 0 for the UB954, incorrectly routing the Bidirectional
Control Channel to I2C Slave Port 1 and permanently breaking I2C
communication with serializers.

>  /*
>   * Register map

[ ... ]

> @@ -2538,7 +2545,18 @@ static int ub960_init_rx_ports_ub960(struct ub960_=
data *priv)
>  	struct device *dev =3D &priv->client->dev;
>  	unsigned int port_lock_mask;
>  	unsigned int port_mask;
> -	int ret;
> +	u8 enabled_rxports_mask;
> +	u8 enabled_rxports;
> +	int ret =3D 0;
> +
> +	/* Configure I2C interface for RX ports */
> +	enabled_rxports_mask =3D FIELD_PREP(UB960_SR_RX_PORT_CTL_BCC_MAP, priv-=
>rx_mask);
> +	enabled_rxports =3D (priv->tx_mask & UB960_CSI_TX0)  ? 0x00 : enabled_r=
xports_mask;
> +

[Severity: High]
Does this routing logic fail if a system utilizes both TX0 and TX1 ports
simultaneously?

If both TX ports are active, priv->tx_mask contains both bits. The condition
(priv->tx_mask & UB960_CSI_TX0) evaluates to true, forcing enabled_rxports
to 0x00 globally.

This statically maps the BCC of all active RX ports to I2C Slave Port 0.
Any RX port logically routed to TX1 will lack a BCC mapping to Slave Port 1,
leaving the I2C controller attached to TX1 unable to communicate with those
serializers.

> +	ret =3D ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, enabled_rxports_m=
ask,
> +				enabled_rxports, &ret);
> +	if (ret)
> +		return ret;
> =20
>  	for_each_active_rxport(priv, it) {

[ ... ]

> @@ -4789,6 +4807,30 @@ static int ub960_parse_dt_txports(struct ub960_dat=
a *priv)
>  	return 0;
>  }
> =20

[Severity: High]
This isn't a bug introduced by this patch, but does ub960_parse_dt_txports()
accidentally mask initialization failures?

If ub960_parse_dt_txport() encounters an error and returns an error code, t=
he
loop breaks correctly but the function unconditionally returns 0 at the end:

drivers/media/i2c/ds90ub960.c:ub960_parse_dt_txports() {
    ...
		ret =3D ub960_parse_dt_txport(priv, ep_fwnode, nport);
		fwnode_handle_put(ep_fwnode);
		if (ret)
			break;
	}

	return 0;
}

This discards the error code in ret, falsely returning success to the driver
probe despite a TX port failing to initialize.

> +static void ub960_parse_active_ports(struct ub960_data *priv)
> +{

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608142901.3971=
821-1-r-donadkar@ti.com?part=3D1

