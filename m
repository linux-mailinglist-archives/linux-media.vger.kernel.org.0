Return-Path: <linux-media+bounces-32439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE56AB63C7
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 09:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CA63189C790
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 07:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5922054E4;
	Wed, 14 May 2025 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="sL5dV/9F"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22C41F4297;
	Wed, 14 May 2025 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206478; cv=none; b=NsE9xQlDsfijz5bSQuaDvNRQsiJIfu0267phe3ioNEoclndvBd6RKykV8WTJymOMNPMKquH7EDKXZu4qpDZTchGjGe+s0gqfCKdFzdDciqXXDY9IjP5Uld+ZZsjcwOWcfWoG8YxYfU3Uu864SC9nTEbrJuVR5YH93x9lTq/YRxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206478; c=relaxed/simple;
	bh=uupTZbALMk3yttvJTX5G36GcIjhVqzlvhfKBHvxb0lw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g0mBqOVXwxEp8daS93ZZ2Z57ZxBkh6XM9JX0/nyyQTL5dktj4hqV12X2M9a77jCL6+7QTVh6dRzi94tAjlrvHDvpXu9MmvKQSUGFyLAkExAlvJT6v82wXNxqAuLOQpNjpl6pODoCWpFTdt5hSa8g11axM4H7v/S6cD0pHFVb4zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=sL5dV/9F; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xquf9GW/CPgN5hAwZauqU2lgQdp+6IfMQtz1ecIpvm4=; b=sL5dV/9FNGNXrT2WgjsgDg/CaO
	/1vFwyOZQvFaMfVMYoBAmGSc2NTtiBaelaD7lS0nAjkhfk4O00opOXkiC5H0bO90TdFnm5aFTh7v3
	sKCsVMw8TKB/7cYRf/ydvWfIJsKnk+qTz85Eyo0AgMZ2oV8n8wpzFo85mzfrNnoEoVpAG6U2fHmmo
	EGo8gAJ5HxJ7GzB1xA08MppmKrgnLX19giC2XCwDkRGXkWX1W/41kPlD0x84jMnj8D/TrTvEnZ7zs
	RrCqg7Vdd1tcnZgoY6vCQ9n+5EcXVYOk7drmh94uTy2B74JW79TkjbiYQUfvM13dwtpahkEI/VPFA
	LK5Zvf8Q==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uF5tC-000PUh-2G;
	Wed, 14 May 2025 08:46:50 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uF5tC-000D3j-1E;
	Wed, 14 May 2025 08:46:50 +0200
Message-ID: <ed4c877531a87d89141b115bcddd2ec7c95b8e2a.camel@apitzsch.eu>
Subject: Re: [PATCH v2 4/4] media: i2c: imx214: Remove hard-coded external
 clock frequency
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com
Date: Wed, 14 May 2025 08:46:48 +0200
In-Reply-To: <aBnHI1APgjfcj2xG@kekkonen.localdomain>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
	 <20250505-imx214_ccs_pll-v2-4-f50452061ff1@apitzsch.eu>
	 <aBnHI1APgjfcj2xG@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27636/Tue May 13 10:40:46 2025)

Hello Sakari,

Am Dienstag, dem 06.05.2025 um 08:24 +0000 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> On Mon, May 05, 2025 at 11:05:56PM +0200, Andr=C3=A9 Apitzsch via B4 Rela=
y
> wrote:
> > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> >=20
> > Instead rely on the rate set on the clock (using assigned-clock-
> > rates
> > etc.)
> >=20
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > ---
> > =C2=A0drivers/media/i2c/imx214.c | 6 ------
> > =C2=A01 file changed, 6 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/imx214.c
> > b/drivers/media/i2c/imx214.c
> > index
> > 9e9be47394ec768a5b34d44b06b5bbb0988da5a1..c12996e294dccebb18c608254
> > f1e0d14dc064423 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -32,7 +32,6 @@
> > =C2=A0
> > =C2=A0#define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
> > =C2=A0
> > -#define IMX214_DEFAULT_CLK_FREQ	24000000
> > =C2=A0#define IMX214_DEFAULT_LINK_FREQ	600000000
> > =C2=A0/* Keep wrong link frequency for backward compatibility */
> > =C2=A0#define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> > @@ -1405,11 +1404,6 @@ static int imx214_probe(struct i2c_client
> > *client)
> > =C2=A0		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get xclk\n");
> > =C2=A0
> > -	ret =3D clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
> > -	if (ret)
> > -		return dev_err_probe(dev, ret,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to set xclk
> > frequency\n");
> > -
>=20
> Oops. I missed this is what the driver was doing already. Indeed,
> this is one of the historic sensor drivers that do set the frequency
> in DT systems.
>=20
> The driver never used the clock-frequency property and instead used a
> fixed frequency. Changing the behaviour now could be problematic.
>=20
> There are options here that I think we could do:
>=20
> 1) use your v1 patch (4) which uses "clock-frequency" if it exists
> and otherwise uses the default, fixed frequency or
>=20
> 2) set the frequency only if the "clock-frequency" property exists.
> The DT currently requires clock-frequency and the YAML conversion was
> done in 2020 whereas the driver is from 2018. If we do this, the
> clock-frequency should be deprecated (or even removed from bingings).
>=20
> I wonder what others think. Cc'd Laurent in any case.

I would go with option 2 and add a patch which updates the bindings,
i.e. which deprecates 'clock-frequency',  to this series.

Best regards,
Andr=C3=A9
>=20
> > =C2=A0	ret =3D imx214_get_regulators(dev, imx214);
> > =C2=A0	if (ret < 0)
> > =C2=A0		return dev_err_probe(dev, ret, "failed to get
> > regulators\n");
> >=20

