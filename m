Return-Path: <linux-media+bounces-26294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47F0A3A107
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 16:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66AB83AB42A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 15:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935CC26D5B8;
	Tue, 18 Feb 2025 15:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eqd0Hy/M"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A426D5AC;
	Tue, 18 Feb 2025 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739892102; cv=none; b=bG51o3vWE1HZ1raPmL16jzqxLiEsk2FxZ5RTBwZxPMPpKOhTTNFDss/1vh2i6TWhHJYKeFJCc0Rli/T6UtIzH0GVCNx67Ic4gFRZLZ0gIEHcBJUec1iP+rTyG1WhwKFpmYZbhsCoFTmg4a81H60BfRgz1IrgnCA1zrj5CR6huBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739892102; c=relaxed/simple;
	bh=ECrwL2cTJut4ba+trl7Tn8NzD0+rnPSgWfEHaRNEcUo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nJHd5LBduNkHkjC4Fd8SCfzFku5AY2VV7sD4yVzEaF3/2x4HsY4EltLOWx9afIlJvDnNrfuDkMU+frz6af0JBEcRSsUWQ/DkQ1aLQ+UN3h8QK/xS/rfSNm2+GDe0kZgT3TAKSFtKCCGNA55x7ks91KbIhzhcp8Mpek4Yq76ZR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eqd0Hy/M; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739892098;
	bh=ECrwL2cTJut4ba+trl7Tn8NzD0+rnPSgWfEHaRNEcUo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eqd0Hy/M1DnuHyb0EiTZdxwTcv6awdEf5B5DJ4r0wBB3OqAIusQtMOxHY3hREmKM5
	 L5mvIseTwH568qpf6vMRL9GMZdU7SrIntsG/5djAqhmqvWYo8Q9xKFDPkOQ5H69hG5
	 g58RtC4rKlPLL8Pxu/toWLfTL/FE9BRwzuJxzNsLMh/dEB/+9NnMvu12E161akjdtv
	 4AscjpCXuIIQpAvmeiQ6oHwa/7Yc0f7sCu/0Du4bGxWsOFup+k3x7yj1bh67tvTSIu
	 vqbhgI6jAtbfVJ6ooGjzj7sDSeI9OhsGA09SF+O2wTwPOYXC0COBtXaT8LeF/878fV
	 DpV3G14vaq5XA==
Received: from apertis-1.home (2a01cb088cca73006086f5f072C6a07a.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CB7A417E0657;
	Tue, 18 Feb 2025 16:21:37 +0100 (CET)
Message-ID: <3c46bbb64e6e9c7b836c3ca82d678e550d1b2ddf.camel@collabora.com>
Subject: Re: [PATCH 5/5] media/i2c: max96717: allow user to override
 operation mode from DT
From: Julien Massot <julien.massot@collabora.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Tue, 18 Feb 2025 16:21:36 +0100
In-Reply-To: <20250207112958.2571600-6-laurentiu.palcu@oss.nxp.com>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
	 <20250207112958.2571600-6-laurentiu.palcu@oss.nxp.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Laurentiu,

On Fri, 2025-02-07 at 13:29 +0200, Laurentiu Palcu wrote:
> There are situations when the CFG pins set the chip up for a certain
> mode of operation (ie: pixel mode or tunneling mode), because the HW
> designers decided this way, and we, the users, want to change that. For
> that, add an optional DT property that would allow toggling the
> operation mode from the configured one to the other one.
>=20
> The driver still only supports tunneling mode, that didn't change.
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
> =C2=A0drivers/media/i2c/max96717.c | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> index 47a3be195a971..a591ca5d5f44f 100644
> --- a/drivers/media/i2c/max96717.c
> +++ b/drivers/media/i2c/max96717.c


enum gmsl2_mode {
  GMSL2_PIXEL_MODE,
  GMSL2_MODE_TUNNEL,
};

> @@ -161,6 +161,7 @@ struct max96717_priv {
> =C2=A0	struct clk_hw=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_h=
w;
> =C2=A0	struct gpio_chip=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio_chip;
> =C2=A0	enum max96717_vpg_mode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pattern;
> +	bool				=C2=A0 mode_override;
	enum gmsl2_mode                   mode;
I would prefer to set the mode in an explicit way instead of toggling
the bit in the register.

> =C2=A0	struct max96717_fsync_desc	=C2=A0 fsync;
> =C2=A0};
> =C2=A0
> @@ -1066,6 +1067,14 @@ static int max96717_hw_init(struct max96717_priv *=
priv)
> =C2=A0		return dev_err_probe(dev, ret,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "Fail to read mipi rx extension");
> =C2=A0
> +	if (priv->mode_override) {
        if (priv->mode_override && priv->mode =3D=3D GMSL2_MODE_TUNNEL) {
> +	=09
> +
> +		ret =3D cci_write(priv->regmap, MAX96717_MIPI_RX_EXT11, val, NULL);
		ret =3D cci_update_bits(priv->regmap, MAX96717_MIPI_RX_EXT11, MAX96717_TU=
N_MODE,
					MAX96717_TUN_MODE, NULL);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Unable to update operation mode\n");
> +	}
> +
In case we are overwriting the mode to tunnel mode then no need to read the=
 EXT11 register.

> =C2=A0	if (!(val & MAX96717_TUN_MODE))
> =C2=A0		return dev_err_probe(dev, -EOPNOTSUPP,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "Only supporting tunnel mode");

In fact the driver can works in pixel mode, but since we don't set the "str=
eam id" the
deserializer have to configured with the right one :)

> @@ -1101,6 +1110,9 @@ static int max96717_parse_dt(struct max96717_priv *=
priv)
> =C2=A0
> =C2=A0	priv->mipi_csi2 =3D vep.bus.mipi_csi2;
> =C2=A0
> +	if (fwnode_property_present(dev_fwnode(dev), "maxim,cfg-mode-override")=
)
> +		priv->mode_override =3D true;
> +
	source_fwnode =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
							MAX96717_PAD_SOURCE, 0, 0);
	if (fwnode_property_present(source_fwnode, "maxim,tunnel-mode")) {
		priv->mode_override =3D true;
		priv->mode =3D GMSL2_MODE_TUNNEL;
	}
So we can parse the tunnel property from the GMSL port.

> =C2=A0	priv->fsync.pin =3D -1;
> =C2=A0	count =3D fwnode_property_present(dev_fwnode(dev), "maxim,fsync-co=
nfig");
> =C2=A0	if (count > 0) {

Best Regards,

--=20
Julien

