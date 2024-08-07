Return-Path: <linux-media+bounces-15907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D8F94A2FA
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 10:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D24CF1C21008
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA071C7B8C;
	Wed,  7 Aug 2024 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="UTEfrSwJ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="fLBOQRCe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE1A18D640;
	Wed,  7 Aug 2024 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019642; cv=none; b=q3jkmpHvC2eBkFYx7N4VWzjNTvvu08B7IZRlswlojcFw2c3ajXs5wtm2EOLi9gKSRo9YvxitAwtCXbheIF+v5BY1cm9BFDvmFasnmcX21LTH3BwW10sH3c18neAzqJo9pTYYbufvNW4ZC6kRS6KaqV4D+a1aXK1p03oOP/NoxSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019642; c=relaxed/simple;
	bh=CyEdy/D8wLW62xg2UpD0AnksCoz3Dydi2H1Ce8GexL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOMgDnErGt9MbeIOZVQqpcNFF52Pw2a9PlSraOzsAw1y1U5iAa5yjQCZEFOduKPlJ95f6lrBAuZwiWRgngCycm3RtWjZBGAtJJioYYgi+Jh2KTaIX3HTacw5tPC7+fGTDJO1IrsTYRuP1SfqW5fU05EOCsa03fe+XDgnHTjkGW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=UTEfrSwJ; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=fLBOQRCe reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723019639; x=1754555639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AWMANJXlVBC6SZWwPU3j9N768G6b40b4oCRoEMMg4kY=;
  b=UTEfrSwJ1a+Fm9sB76VkEBJcr++XldjNk/arJCYpJyJwIDQbLoOv6vMf
   yFwSXBXhzSpyLMWTsqS2alEPZJ57+e/HMrYWE+shNjDTqozVhzZFZxNMY
   YweFP7EIzy+MqqX6wtRUrS9fpq0/gEoFUkcd3jrxXXPfHqSA4NS5a4ddl
   18K9ixrRyCNiRcI6Igx2fgChHoA1CuM0BCX2xCymrpli6Z4szvMHpPO69
   EhZDPT4D7+LwsyLGqSSTmgMjlabS8OlVVaEPuNODigWsM5mWON3yGd/w+
   1hJTYmF449unYW95C3wtsAxqjcKCorWs34WcI+BzFt2wN4UjhR1ZzGllV
   w==;
X-CSE-ConnectionGUID: 5YMZHyCpQLiuVbp7SuNiHQ==
X-CSE-MsgGUID: Da8oU9f0Ss6BzC/5L83LWw==
X-IronPort-AV: E=Sophos;i="6.09,269,1716242400"; 
   d="scan'208";a="38286390"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Aug 2024 10:33:56 +0200
X-CheckPoint: {66B33174-E-DD19D171-FBE73682}
X-MAIL-CPID: 072D5C03455D78AFD06BCE2F4A8C33C4_5
X-Control-Analysis: str=0001.0A782F26.66B33174.00C6,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1E041668C7;
	Wed,  7 Aug 2024 10:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723019632;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AWMANJXlVBC6SZWwPU3j9N768G6b40b4oCRoEMMg4kY=;
	b=fLBOQRCewq3ME/o3JnDhq5xGh5j8T+1LP8tPT3m+Ws59HZuUxINRd4mFaHp0hF81RlQpgG
	1IFecUF663vvNKuu3zX2in5dqLcduOcI68CAhkyGso4UZG5ry6Tjzq5DkgjZsIGJeDCjbw
	K/wnoHx3VPvqVYm/r/1wUHNo74WBNVqB4ZHpprMG5vX2PL+sHZpY7wfMNOtFwUDLeCNozl
	bCDRFCWtNKuy+WBCAVZgwdv+XWhb3G7Eazl6dooME45kXU7Wpzq0LYTbsAFz1xXNvOCr+o
	UEapu/tD2X8/zPM3Ax8GXoEuyeySGG3XoD1+O9HW5+rtDPtH31HYTv/hkkwQAg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Bara <bbara93@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH 2/2] media: i2c: imx290: Check for availability in probe()
Date: Wed, 07 Aug 2024 10:33:51 +0200
Message-ID: <6072611.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240807-imx290-avail-v1-2-666c130c7601@skidata.com>
References: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com> <20240807-imx290-avail-v1-2-666c130c7601@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Benjamin,

Am Mittwoch, 7. August 2024, 10:10:28 CEST schrieb Benjamin Bara:
> Currently, the V4L2 subdevice is also created when the device is not
> available/connected. In this case, dmesg shows the following:
>=20
> [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
>=20
> which seems to come from imx290_ctrl_update() after the subdev init is
> finished. However, as the errors are ignored, the subdev is initialized
> but simply does not work. From userspace perspective, there is no
> visible difference between a working and not-working subdevice (except
> when trying it out or watching for the error message).
>=20
> This commit adds a simple availability check before starting with the
> subdev initialization to error out instead.

There is already a patch reading the ID register at [1]. This also reads the
ID register. But I don't have any documentation regarding that register,
neither address nor values definitions. If there is known information about
that I would prefer reading the ID and compare it to expected values.

Best regards,
Alexander

[1] https://gitlab.com/ideasonboard/nxp/linux/-/commit/85ce725f1de7c16133bf=
b92b2ab0d3d84efcdb47

> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  drivers/media/i2c/imx290.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 4150e6e4b9a6..a86076e42a36 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1580,6 +1580,11 @@ static int imx290_probe(struct i2c_client *client)
>  	pm_runtime_set_autosuspend_delay(dev, 1000);
>  	pm_runtime_use_autosuspend(dev);
> =20
> +	/* Make sure the sensor is available before V4L2 subdev init. */
> +	ret =3D cci_read(imx290->regmap, IMX290_STANDBY, NULL, NULL);
> +	if (ret)
> +		goto err_pm;
> +
>  	/* Initialize the V4L2 subdev. */
>  	ret =3D imx290_subdev_init(imx290);
>  	if (ret)
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



