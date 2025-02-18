Return-Path: <linux-media+bounces-26280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF185A39D3B
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 14:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EBC13A7461
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 13:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0DD26770D;
	Tue, 18 Feb 2025 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NxQ+4c0u"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4735246353;
	Tue, 18 Feb 2025 13:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739884502; cv=none; b=Tc8ivNNsWp+inWU/0gMpncvbtnIeFvUrPKGEUb9Ld4QTwo+0VagAtYOVHJdN71FWxiJqxFLyuvUiOCUwYUuNx1uhDtpnfg1XT/yeWQ2r4+yo8PHsmuncQzrNt9ZgwP5N4RAnIkaa+t7aYzZzHdK2TZFLhdKWcVmP2BjFkFh7hQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739884502; c=relaxed/simple;
	bh=HslCh7Yi9Oxd0khtG36sq9O9ylN7f2mDOCU/ATdQjTA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=owGVAp+hymPfycUFvTXsLIJp5BRo5vjhFZgLUiFj6wq9PtSDI7PbhNJINUjQMuM0xXn4I7Z0EGNKxry5yyMycOfR31g9ueqktJ4zKgYSKcShS23emdN7cUZgSt5FiG2dUqzOBmaroCUm29iZzb7tKt0/tnLVy3kAbS8CNq9TohA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NxQ+4c0u; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739884499;
	bh=HslCh7Yi9Oxd0khtG36sq9O9ylN7f2mDOCU/ATdQjTA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NxQ+4c0uJ14I5xLXSoG7Xhs936wDeMLovMOS/aUW2g6i/S+LrZ9D0tilK3Qgip7PI
	 PkzGFBuBcl68hBY5mPU13E9TipHRF0bIpBK3qFBIxAMWJVzONawFFLNIZov+WIgQ2f
	 6hByNrWzWHKeHK6NnqCXaXAFeQ5bA5Jcai+YQcASJID+NooUWgjKBh9lA5vAr/BKqm
	 U5sS6sl9771XJ7E31xTS3ErBsCQ2Fy15v8nGEQQL8j8fX3nEvVWNQfEtaBrO45Vyw4
	 NZTXQ88s55trld3Ad19SKrlFfB6LMocixhX7FMMMAMz1NfLIc8WS7pOUb520gs6L5G
	 6i1lDPLyoKMLw==
Received: from apertis-1.home (2a01cb088cCa73006086f5f072C6A07A.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B541117E1559;
	Tue, 18 Feb 2025 14:14:58 +0100 (CET)
Message-ID: <57262be8baee2e5c08ed7ba88cfa2716ef0138bb.camel@collabora.com>
Subject: Re: [PATCH 1/5] media/i2c: max96717: change internal regulator
 voltage
From: Julien Massot <julien.massot@collabora.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Tue, 18 Feb 2025 14:14:57 +0100
In-Reply-To: <20250207112958.2571600-2-laurentiu.palcu@oss.nxp.com>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
	 <20250207112958.2571600-2-laurentiu.palcu@oss.nxp.com>
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

Thanks for your patch,
On Fri, 2025-02-07 at 13:29 +0200, Laurentiu Palcu wrote:
> The Programming Notes section of the specifications states:
>=20
> """
> MANDATORY REGISTER PROGRAMMING
> Make the following register writes to ensure proper operation of the
> MAX96717F. Without these writes, the operation of the device specified
> in the data sheet cannot be guaranteed.
> Set bits [6:4] =3D 3'b001 in register 0x302
> """
>=20
> Set this register before going on with the chip initialization.
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
> =C2=A0drivers/media/i2c/max96717.c | 17 +++++++++++++++++
> =C2=A01 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> index 9259d58ba734e..b1116aade0687 100644
> --- a/drivers/media/i2c/max96717.c
> +++ b/drivers/media/i2c/max96717.c
> @@ -78,6 +78,15 @@
> =C2=A0#define MAX96717_GPIO_TX_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT=
(1)
> =C2=A0#define MAX96717_GPIO_OUT_DIS=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
> =C2=A0
> +/* CMU */
> +#define MAX96717_CMU_CMU2		CCI_REG8(0x0302)
> +#define MAX96717_PFDDIV_RSHORT_MASK	GENMASK(6, 4)
> +#define MAX96717_PFDDIV_RSHORT_SHIFT	4
> +#define MAX96717_PFDDIV_VREG_1V0	0
> +#define MAX96717_PFDDIV_VREG_1V1	1
> +#define MAX96717_PFDDIV_VREG_0V875	2
> +#define MAX96717_PFDDIV_VREG_0V94	3
> +
> =C2=A0/* FRONTTOP */
> =C2=A0/* MAX96717 only have CSI port 'B' */
> =C2=A0#define MAX96717_FRONTOP0=C2=A0=C2=A0=C2=A0=C2=A0 CCI_REG8(0x308)
> @@ -981,6 +990,14 @@ static int max96717_hw_init(struct max96717_priv *pr=
iv)
> =C2=A0	dev_dbg(dev, "Found %x (rev %lx)\n", (u8)dev_id,
> =C2=A0		(u8)val & MAX96717_DEV_REV_MASK);
> =C2=A0
> +	/*
> +	 * According to specs, in the Programming Notes section, there's a mand=
atory register
> +	 * programming notice that advises to enable the 1.1V internal regulato=
r to guarantee
> proper
> +	 * device operation. Let's do this before any other operations.
> +	 */
Latest MAX96717{,K,F} revision 6 seems not affected by this issue. Can you =
please make this write
conditional to rev < 6 ? Register 0xe.

> +	cci_write(priv->regmap, MAX96717_CMU_CMU2,
> +		=C2=A0 MAX96717_PFDDIV_VREG_1V1 << MAX96717_PFDDIV_RSHORT_SHIFT, NULL)=
;
> +
> =C2=A0	ret =3D cci_read(priv->regmap, MAX96717_MIPI_RX_EXT11, &val, NULL)=
;
> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(dev, ret,
Regards,
--=20
Julien

