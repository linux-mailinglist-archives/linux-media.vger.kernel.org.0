Return-Path: <linux-media+bounces-42593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38716B58662
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 23:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 481DA2014D4
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 21:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129972C026B;
	Mon, 15 Sep 2025 21:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="uHubSila"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C019D29D27A;
	Mon, 15 Sep 2025 21:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757970550; cv=none; b=VLw1L8jfynmq5wXFF/vqO2xvjP18qWRWeC0FyvVY6jU9HvfKOa7nreEquFzvPftxQghn2JUdhchSNiA81KOyI/7mUuzBYb+LETGrZtalhLGdNaj2/er+3hn++QdEmQnNV83PQD/xm4NlmnGZ51fK375KDqp/R91vywKw5JTKSzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757970550; c=relaxed/simple;
	bh=ShGiyXLyx3jm+KuG+IC5eD9uMmaQRpPiVQwMFDqxLr4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kv3KOayrwUB+fV8rK9YPl/YNEiqW8B9iuc2O5YcQKMvVeaM+AZn/Mgt61nv+uOuueMgQskYPIDro4ZV4uRvlUFVoMNdATM8MP0etgjv2fMsLyDY7sLr9VkRepHuDKB+eDPd0YglsKqgDhph70ZFKDR5NxTDHnvMcEVT1NwKOnUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=uHubSila; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=zhS7w4nBBZscnyjH8JgikhDYqJC/dkSKTQJL0yNFz8Y=; b=uHubSilac/r1athKzfXc25awmt
	GD5yPjnn86yZU69V8cKLg/Si95RZMDQXVIz3knKr4bKrwWoQKLjC7BMUT1uoYSNqC54/7v33zi86V
	icRGP1eNRdOPI2qZHXar09/vB79fMpFh67rPSuuWVpQprvDJGe5III4Hpi5ASzmPBLcxmn+033cqP
	YotWB2ZbH6dANoJbXZ7pU7Fnd06yJz5Rg0EG+EKqbmX5Fg3FbFoB3aglO1/qTbDGf/B2zqLTFdvwH
	wiv6s7CUsvvfqwkxD3QEIZs4jmmZGrOTWAZbZ/rE7Psw8+KdOzQ7+/1HQ7qh29muVGOyHKqgm4TPo
	1kg230qA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uyG7d-000OQt-2o;
	Mon, 15 Sep 2025 22:48:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uyG7e-000FkJ-03;
	Mon, 15 Sep 2025 22:48:25 +0200
Message-ID: <550f28a9aa82a28beb35fd3490dbe08928ba9eed.camel@apitzsch.eu>
Subject: Re: [PATCH 7/7] media: i2c: dw9719: Fix power on/off sequence
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Val Packett
 <val@packett.cool>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, 	devicetree@vger.kernel.org, Daniel Scally
 <djrscally@gmail.com>, 	~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 15 Sep 2025 22:48:23 +0200
In-Reply-To: <aKLZ39IzI_azrDIu@kekkonen.localdomain>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
	 <20250817-dw9719-v1-7-426f46c69a5a@apitzsch.eu>
	 <aKLZ39IzI_azrDIu@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.9/27764/Mon Sep 15 10:26:33 2025)

Hi Sakari,

@Val, please see below.

Am Montag, dem 18.08.2025 um 07:44 +0000 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> On Sun, Aug 17, 2025 at 07:09:26PM +0200, Andr=C3=A9 Apitzsch via B4 Rela=
y
> wrote:
> > From: Val Packett <val@packett.cool>
> >=20
> > The "jiggle" code was not actually expecting failure, which it
> > should because that's what actually happens when the device wasn't
> > already woken up by the regulator power-on (i.e. in the case of a
> > shared regulator).
> >=20
> > Also, do actually enter the internal suspend mode on shutdown, to
> > save power in the case of a shared regulator.
> >=20
> > Also, wait a bit longer (2x tOPR) on waking up, 1x is not enough at
> > least on the DW9718S as found on the motorola-nora smartphone.
> >=20
> > Signed-off-by: Val Packett <val@packett.cool>
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > ---
> > =C2=A0drivers/media/i2c/dw9719.c | 23 ++++++++++++++++-------
> > =C2=A01 file changed, 16 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/dw9719.c
> > b/drivers/media/i2c/dw9719.c
> > index
> > 63c7fd4ab70a0e02518252b23b89c45df4ba273d..dd28a0223d6ac980084b1f661
> > bd029ea6b0be503 100644
> > --- a/drivers/media/i2c/dw9719.c
> > +++ b/drivers/media/i2c/dw9719.c
> > @@ -95,12 +95,19 @@ struct dw9719_device {
> > =C2=A0
> > =C2=A0static int dw9719_power_down(struct dw9719_device *dw9719)
> > =C2=A0{
> > +	u32 reg_pwr =3D (dw9719->model =3D=3D DW9718S) ? DW9718S_PD :
> > DW9719_CONTROL;
>=20
> Extra parentheses.
>=20
> > +
> > +	/*
> > +	 * Worth engaging the internal SHUTDOWN mode especially
> > due to the
> > +	 * regulator being potentially shared with other devices.
> > +	 */
> > +	cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN, NULL);
>=20
> I'd still complain if this fails as we don't return the error.
>=20
> > =C2=A0	return regulator_disable(dw9719->regulator);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int dw9719_power_up(struct dw9719_device *dw9719, bool
> > detect)
> > =C2=A0{
> > -	u32 reg_pwr;
> > +	u32 reg_pwr =3D (dw9719->model =3D=3D DW9718S) ? DW9718S_PD :
> > DW9719_CONTROL;
>=20
> Extra parentheses.
>=20
> > =C2=A0	u64 val;
> > =C2=A0	int ret;
> > =C2=A0	int err;
> > @@ -109,13 +116,15 @@ static int dw9719_power_up(struct
> > dw9719_device *dw9719, bool detect)
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > -	/* Jiggle SCL pin to wake up device */
> > -	reg_pwr =3D (dw9719->model =3D=3D DW9718S) ? DW9718S_PD :
> > DW9719_CONTROL;
> > -	cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN, &ret);
> > -	fsleep(100);
> > +	/*
> > +	 * Need 100us to transition from SHUTDOWN to STANDBY.
> > +	 * Jiggle the SCL pin to wake up the device (even when the
> > regulator
> > +	 * is shared) and wait double the time to be sure, then
> > retry the write.
>=20
> Why double? Isn't the datasheet correct when it comes to the power-on
> sequence?
>=20
I haven't noticed any problems during power-up of DW9761. However,
according to the commit message, there seems be an issue with DW9718S.
But I don't own the device and cannot test it.

Maybe Val can provided some additional information.

Best regards,
Andr=C3=A9

> > +	 */
> > +	cci_write(dw9719->regmap, reg_pwr, DW9719_STANDBY, &ret);
> > +	ret =3D 0; /* the jiggle is expected to fail, don't even log
> > that as error */
> > +	fsleep(200);
> > =C2=A0	cci_write(dw9719->regmap, reg_pwr, DW9719_STANDBY, &ret);
>=20
> Just pass NULL instead of ret as we don't check the value and the ret
> assignment above becomes redundant. Please spare the comment though.
>=20
> > -	/* Need 100us to transit from SHUTDOWN to STANDBY */
> > -	fsleep(100);
> > =C2=A0
> > =C2=A0	if (detect) {
> > =C2=A0		/* This model does not have an INFO register */
> >=20

