Return-Path: <linux-media+bounces-53471-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FiCMfocoGmzfgQAu9opvQ
	(envelope-from <linux-media+bounces-53471-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:14:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8581A4176
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B160A30038ED
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5893A6404;
	Thu, 26 Feb 2026 10:14:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B319315D21
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100851; cv=none; b=cqV1H43D5JLSDOR+1C8UcfQTeIuP/itLlgDbvxCdKeJ27S0Gb8I6j8tKAOJyDQN895gjg4zwbFPysjZCnF2z6NiuvIXMqEmdRtjY1MV8DPHVBdBbxDh6hvrmkubGU4gEJ/R3zHWu/2HHDMHpqj29RZRki28392ZNH/UIwxO4qvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100851; c=relaxed/simple;
	bh=dMVtywBrglDkJITDxPNwf74BRVG5Oa8YMkJymoHGNSo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fLxSbymI0e8DNp5tY5XJCpv0/mC0PCEbKIK0POPNI7AgvfYEro/wmWa58J7ZPXRBu9incQiern2jv0ip5B0+VMwDmSaojaZ2wAnd7DLiY8knELX2nfxGUgPbnMxNSQayyc5VtzdeK3vZ3GNl+ay7Is9L63Sm5OPl/p5HydPZQ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvYND-0000dD-Tv; Thu, 26 Feb 2026 11:13:35 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvYNA-002iGa-2y;
	Thu, 26 Feb 2026 11:13:34 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvYNC-000000006wn-0ldV;
	Thu, 26 Feb 2026 11:13:34 +0100
Message-ID: <6a63b27e567d854e8459bc3a31d99e2d01cd1dd6.camel@pengutronix.de>
Subject: Re: [PATCH 3/8] media: i2c: ov08d10: add support for reset and
 power management
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Fend <matthias.fend@emfend.at>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jimmy Su
	 <jimmy.su@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Date: Thu, 26 Feb 2026 11:13:34 +0100
In-Reply-To: <20260226-ov08d10-v1-3-c3a916368123@emfend.at>
References: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
	 <20260226-ov08d10-v1-3-c3a916368123@emfend.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53471-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A8581A4176
X-Rspamd-Action: no action

On Do, 2026-02-26 at 09:56 +0100, Matthias Fend wrote:
> Add support for the required power supplies as well as the control of an
> optional sensor reset.
>=20
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  drivers/media/i2c/ov08d10.c | 104 ++++++++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 97 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
> index cfe18dcde174ddc1f198cb2aaa6b4a3b34045508..4dba264488b3e1950016deb3f=
a34732871cc34fc 100644
> --- a/drivers/media/i2c/ov08d10.c
> +++ b/drivers/media/i2c/ov08d10.c
[...]
> @@ -1379,6 +1442,7 @@ static int ov08d10_probe(struct i2c_client *client)
>  {
>  	struct ov08d10 *ov08d10;
>  	unsigned long freq;
> +	unsigned int i;
>  	int ret;
> =20
>  	ov08d10 =3D devm_kzalloc(&client->dev, sizeof(*ov08d10), GFP_KERNEL);
> @@ -1404,12 +1468,32 @@ static int ov08d10_probe(struct i2c_client *clien=
t)
>  		return ret;
>  	}
> =20
> +	ov08d10->reset =3D devm_reset_control_get_optional(ov08d10->dev, NULL);

Please use devm_reset_control_get_optional_exclusive() directly.

> +	if (IS_ERR(ov08d10->reset))
> +		return dev_err_probe(ov08d10->dev, PTR_ERR(ov08d10->reset),
> +				     "failed to get reset\n");
> +	reset_control_assert(ov08d10->reset);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ov08d10_supply_names); i++)
> +		ov08d10->supplies[i].supply =3D ov08d10_supply_names[i];
> +
> +	ret =3D devm_regulator_bulk_get(ov08d10->dev,
> +				      ARRAY_SIZE(ov08d10->supplies),
> +				      ov08d10->supplies);
> +	if (ret)
> +		return dev_err_probe(ov08d10->dev, ret,
> +				     "failed to get regulators\n");
> +
>  	v4l2_i2c_subdev_init(&ov08d10->sd, client, &ov08d10_subdev_ops);
> =20
> +	ret =3D ov08d10_power_on(ov08d10->dev);
> +	if (ret)
> +		return dev_err_probe(ov08d10->dev, ret, "failed to power on\n");
> +
>  	ret =3D ov08d10_identify_module(ov08d10);
>  	if (ret) {
>  		dev_err(ov08d10->dev, "failed to find sensor: %d", ret);
> -		return ret;
> +		goto probe_error_power_off;
>  	}
> =20
>  	mutex_init(&ov08d10->mutex);
> @@ -1430,6 +1514,9 @@ static int ov08d10_probe(struct i2c_client *client)
>  		goto probe_error_v4l2_ctrl_handler_free;
>  	}
> =20
> +	pm_runtime_set_active(ov08d10->dev);
> +	pm_runtime_enable(ov08d10->dev);
> +
>  	ret =3D v4l2_async_register_subdev_sensor(&ov08d10->sd);
>  	if (ret < 0) {
>  		dev_err(ov08d10->dev, "failed to register V4L2 subdev: %d",
> @@ -1437,26 +1524,28 @@ static int ov08d10_probe(struct i2c_client *clien=
t)
>  		goto probe_error_media_entity_cleanup;
>  	}
> =20
> -	/*
> -	 * Device is already turned on by i2c-core with ACPI domain PM.
> -	 * Enable runtime PM and turn off the device.
> -	 */

The commit message does not explain why this comment is dropped.

> -	pm_runtime_set_active(ov08d10->dev);
> -	pm_runtime_enable(ov08d10->dev);
>  	pm_runtime_idle(ov08d10->dev);
> =20
>  	return 0;
> =20
>  probe_error_media_entity_cleanup:
> +	pm_runtime_disable(ov08d10->dev);
> +	pm_runtime_set_suspended(ov08d10->dev);

Does this do the correct thing if v4l2_async_register_subdev_sensor()
returns -EPROBE_DEFER (for example via privacy led) and then it probes
a second time? It looks like the assumption pm_runtime_set_active()
doesn't hold then.

>  	media_entity_cleanup(&ov08d10->sd.entity);
> =20
>  probe_error_v4l2_ctrl_handler_free:
>  	v4l2_ctrl_handler_free(ov08d10->sd.ctrl_handler);
>  	mutex_destroy(&ov08d10->mutex);
> =20
> +probe_error_power_off:
> +	ov08d10_power_off(ov08d10->dev);
> +
>  	return ret;
>  }

regards
Philipp

