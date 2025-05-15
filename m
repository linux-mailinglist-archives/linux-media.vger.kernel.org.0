Return-Path: <linux-media+bounces-32617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFC0AB91BC
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 23:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADBA64E793C
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 21:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B18284662;
	Thu, 15 May 2025 21:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="AMa8qTqF"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBB7171C9;
	Thu, 15 May 2025 21:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747344118; cv=none; b=LVb0o+Bo6gl/PWjMZhGciQVXzC1pmbPukYczTKppkjo5KpTjMz+/mm2ohwvUGhHQNoIXyKYYwCMUQj0mQZ2EgbfKnzZ/0iT74M5ksTdqhaysilZ4dBcJvJnINCg/iLm1GKs173EIiLJFvD/1Yql9uxefE7lalXqWQ48zWyTM6+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747344118; c=relaxed/simple;
	bh=xt3t2zCy2rbwmCE3z2RJVblyMEfL0A/VWx0xyaHd7aU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GDc2mL/477DGx6nYUV+kIjTiL3LeHLN5VZx2nqSsuX7zjHLIarLwipzCeVpGBdC2M33iB+pPGAiYEJ6NU3WguzfQR72uhKwvtnBjY7eCVV/eGJl6pnh729PbA6GRQ+NndOewQgSRel8WalrJdZ3Vvh000/CyE2lxplnm9/IqUjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=AMa8qTqF; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DtyhCMdgGFayCf64QkOsFNDpi9zrn2dltmKT58BWfNE=; b=AMa8qTqFCQDf2tkSKrh/yhpr4Z
	bd0xc/jKnEYbF+skfZoWd/cegUyHus3VGyXluieMOBaKkA3Kx5gp1nuP7Gngn1TVj/K6bhKlhgff+
	CNOD0x2DcmBtv1LgS11Vy+A9Kc/770lOi7EBmOLG+t7gOepHGm3ABibms9Z54Gf9oPTMPlymPQCEf
	ntgnQSVbvo44WIeHzIbDzr0OMxNPJythVPF/lo6s6cZWdwu0N1QzqmouA2cbgPi8TwZkcB0H569eT
	9t7k3hifkgn4MktDC2z9iBtSS3qQOnRuNQ0oqPCvDDZSgV9g2jvLRrcm/fYR4blA4tp6ghLqB37AB
	N2JPtv5w==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uFg1Q-000Crw-1g;
	Thu, 15 May 2025 23:21:44 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uFg1Q-0006IK-0f;
	Thu, 15 May 2025 23:21:44 +0200
Message-ID: <7d2d4c3bc5e8d49fbcd4763487f82db634b06205.camel@apitzsch.eu>
Subject: Re: [PATCH v2 4/4] media: i2c: imx214: Remove hard-coded external
 clock frequency
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 15 May 2025 23:21:42 +0200
In-Reply-To: <aCZWV6xj4vap5PFZ@svinhufvud>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
	 <20250505-imx214_ccs_pll-v2-4-f50452061ff1@apitzsch.eu>
	 <aBnHI1APgjfcj2xG@kekkonen.localdomain>
	 <20250515085846.GR23592@pendragon.ideasonboard.com>
	 <aCXWDnZhffjlt+8i@svinhufvud>
	 <20250515130340.GC12492@pendragon.ideasonboard.com>
	 <aCZWV6xj4vap5PFZ@svinhufvud>
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
X-Virus-Scanned: Clear (ClamAV 1.0.7/27638/Thu May 15 10:41:10 2025)

Hi Sakari, Hi Laurent,

Am Freitag, dem 16.05.2025 um 00:02 +0300 schrieb Sakari Ailus:
> Hi Laurent,
>=20
> On Thu, May 15, 2025 at 03:03:40PM +0200, Laurent Pinchart wrote:
> > On Thu, May 15, 2025 at 02:54:54PM +0300, Sakari Ailus wrote:
> > > On Thu, May 15, 2025 at 10:58:46AM +0200, Laurent Pinchart wrote:
> > > > On Tue, May 06, 2025 at 08:24:03AM +0000, Sakari Ailus wrote:
> > > > > On Mon, May 05, 2025 at 11:05:56PM +0200, Andr=C3=A9 Apitzsch via
> > > > > B4 Relay wrote:
> > > > > > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > > > >=20
> > > > > > Instead rely on the rate set on the clock (using assigned-
> > > > > > clock-rates
> > > > > > etc.)
> > > > > >=20
> > > > > > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > > > > ---
> > > > > > =C2=A0drivers/media/i2c/imx214.c | 6 ------
> > > > > > =C2=A01 file changed, 6 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/media/i2c/imx214.c
> > > > > > b/drivers/media/i2c/imx214.c
> > > > > > index
> > > > > > 9e9be47394ec768a5b34d44b06b5bbb0988da5a1..c12996e294dccebb1
> > > > > > 8c608254f1e0d14dc064423 100644
> > > > > > --- a/drivers/media/i2c/imx214.c
> > > > > > +++ b/drivers/media/i2c/imx214.c
> > > > > > @@ -32,7 +32,6 @@
> > > > > > =C2=A0
> > > > > > =C2=A0#define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
> > > > > > =C2=A0
> > > > > > -#define IMX214_DEFAULT_CLK_FREQ	24000000
> > > > > > =C2=A0#define IMX214_DEFAULT_LINK_FREQ	600000000
> > > > > > =C2=A0/* Keep wrong link frequency for backward compatibility *=
/
> > > > > > =C2=A0#define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> > > > > > @@ -1405,11 +1404,6 @@ static int imx214_probe(struct
> > > > > > i2c_client *client)
> > > > > > =C2=A0		return dev_err_probe(dev, PTR_ERR(imx214-
> > > > > > >xclk),
> > > > > > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get
> > > > > > xclk\n");
> > > > > > =C2=A0
> > > > > > -	ret =3D clk_set_rate(imx214->xclk,
> > > > > > IMX214_DEFAULT_CLK_FREQ);
> > > > > > -	if (ret)
> > > > > > -		return dev_err_probe(dev, ret,
> > > > > > -				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to set xclk
> > > > > > frequency\n");
> > > > > > -
> > > > >=20
> > > > > Oops. I missed this is what the driver was doing already.
> > > > > Indeed, this is one of the historic sensor drivers that do
> > > > > set the frequency in DT systems.
> > > > >=20
> > > > > The driver never used the clock-frequency property and
> > > > > instead used a fixed frequency. Changing the behaviour now
> > > > > could be problematic.
> > > > >=20
> > > > > There are options here that I think we could do:
> > > > >=20
> > > > > 1) use your v1 patch (4) which uses "clock-frequency" if it
> > > > > exists and otherwise uses the default, fixed frequency or
> > > > >=20
> > > > > 2) set the frequency only if the "clock-frequency" property
> > > > > exists. The DT currently requires clock-frequency and the
> > > > > YAML conversion was done in 2020 whereas the driver is from
> > > > > 2018. If we do this, the clock-frequency should
> > > > > be deprecated (or even removed from bingings).
> > > > >=20
> > > > > I wonder what others think. Cc'd Laurent in any case.
> > > >=20
> > > > Maybe I'm missing something, but I don't really see the issue
> > > > here. The clock-frequency DT property is currently ignored, and
> > > > this patch doesn't change that situation, does it ?
> > > >=20
> > > > The change of behaviour here is related to the assigned-clock-
> > > > rates property. If that property is specified today, it will
> > > > set the clock rate, and the driver will override it to 24MHz
> > > > right after.
> > > > With this patch, the clock rate won't be overridden. I think
> > > > the risk of regression is very low here, as I don't expect
> > > > systems to set assigned-clock-rates in DT to a value different
> > > > than 24MHz and expect the driver to override it.
> > >=20
> > > If the DTS had assigned-clock-rates set correctly, then yes. How
> > > much can we trust the older DTS did have that?
> >=20
> > I am relatively confident that DT-based systems wouldn't have an
> > assigned-clock-rates property with a frequency that doesn't match
> > IMX214_DEFAULT_CLK_FREQ. The real question is whether or not I'm
> > over-confident :-)
>=20
> The assigned-clock stuff wasn't always there. But nowadays I guess a
> lot of things in practice depends on it.
>=20
> So I guess doing this should be fine then.

Just to be clear, this patch is fine and no changes are needed?

Should the bindings be updated in this series or can that be done
later?

Best regards,
Andr=C3=A9

