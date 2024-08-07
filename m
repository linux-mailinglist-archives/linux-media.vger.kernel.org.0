Return-Path: <linux-media+bounces-15922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AF994A7D7
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 14:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 134741F22356
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 12:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59701E6743;
	Wed,  7 Aug 2024 12:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ZAPFHHys";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="h94tFw22"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CA71E673F;
	Wed,  7 Aug 2024 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034353; cv=none; b=NG93Xlg+S0Ab4hnkXbf48z9TjCvoRsNSjszqwrXmiPOFXmHL2s31YarH9KP6vgO3xiIx0OTMbBN7gl8ZT0b2qyfarQZ1fAeeQ/yR2JjA0Te3fQTiuhMB0lG0lOIgByYcvt+yshyAgWDZG1r8Ysb0oEAUbgqtdAbhhA0g2YYzj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034353; c=relaxed/simple;
	bh=oeYaFXKlapO8ygfh0JSq77rp6rW1KZ7DCTVykw4h2Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YJjSONzZQ7C4dm+DuoFh/Zl7vD5ntj9QkZVf6znIP77X8pyv2UoeKNnRo7TVJl1ZAA3osY3dDIRGnBMRik7viX6Tc8XbmSHMcJxTH/gapAmawFEEn76sdSAhocWaDrMx2HU8U/Wf9F5yviQVXxuDGkQ2bSr9QNg2z2KwTnv6zoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ZAPFHHys; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=h94tFw22 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723034349; x=1754570349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YQ3YUqkpwK5U0SyvLqvXM55I7yw9TX23AIALEa+MDvM=;
  b=ZAPFHHysRzd0T0Bs7d8SsAXsqhpMwINTye5weBa64HGEloou9awKirWG
   0xv2iheBQGjX44jOFBGnYtZpL17/LHmOHoj3leVw3Vms2Dfc9LsN8dm81
   2yWboy/xGEjTdvXSu3TUvkdkDxPtbGrWj2YM32WGEcnUq58IvV7E8zxU1
   sK/+TmA/cdqqsYwL0aHGvauniBXUVwyx1qygqe5x7yIu80Gb1Bv1EBp82
   br8ysaTgCqqtVGBAxUU0kX55s4uOwsFUVT7JLTI2ECxrsd8E0UwrvSpus
   BmvPEB/u2zJQVhBIgFkkZnlEqEyUpXpHH7TMWcEtdnFA5v4QENfG+B+HY
   Q==;
X-CSE-ConnectionGUID: XnTgZGzjQLqiIwtE8ET2jw==
X-CSE-MsgGUID: GwrbUDtOSBOhrftv3TnowQ==
X-IronPort-AV: E=Sophos;i="6.09,269,1716242400"; 
   d="scan'208";a="38293262"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Aug 2024 14:39:06 +0200
X-CheckPoint: {66B36AEA-7-CFE9415D-C7159436}
X-MAIL-CPID: A524EC2C33611979AD910978938D5D39_1
X-Control-Analysis: str=0001.0A782F1E.66B36AEA.00D2,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8ECF1674EB;
	Wed,  7 Aug 2024 14:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723034342;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YQ3YUqkpwK5U0SyvLqvXM55I7yw9TX23AIALEa+MDvM=;
	b=h94tFw22dVLav1klb+jWwUlpPfMTevTVRLQj3jP04BtfHiBHmITtdEVUt6Xj5ZfHT5ylwc
	GNhJ1R1trcNPezTXhqjMVRlJxTPrceo10qSbvLSBiwh55GKGLolVqeRtkJA0quTPhSslOR
	TdvRjKdy0/eeHWflPHQoBjz864idb1ZKBaxc2rYfTqCQJ2FxPgf8wmYt0630gvUzfWxbIJ
	woq7/sWyRsEe4XCDFiXZRuv0AXqvv0UHv/klZJjXEH3VnDWDo2DID2b9mFz/j9xUns8c6x
	NzPuvLtCGas/ejASTmTn1KrdbNTlLOuA98vOBSwxqfzpVhh1ob85NbvbJYcoQw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Benjamin Bara <bbara93@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>, arne.caspari@theimagingsource.com
Subject: Re: [PATCH 2/2] media: i2c: imx290: Check for availability in probe()
Date: Wed, 07 Aug 2024 14:39:01 +0200
Message-ID: <1897006.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240807121648.GC8166@pendragon.ideasonboard.com>
References: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com> <4588174.LvFx2qVVIh@steina-w> <20240807121648.GC8166@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Mittwoch, 7. August 2024, 14:16:48 CEST schrieb Laurent Pinchart:
> ********************
> Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie wi=
ssen, dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten =
Sie die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know tha=
t they are from a secure source and are safe. In doubt forward the email to=
 the IT-Helpdesk to check it.
> ********************
>=20
> On Wed, Aug 07, 2024 at 02:12:04PM +0200, Alexander Stein wrote:
> > Am Mittwoch, 7. August 2024, 13:07:24 CEST schrieb Benjamin Bara:
> > > On Wed, 7 Aug 2024 at 11:50, Laurent Pinchart wrote:
> > > > On Wed, Aug 07, 2024 at 10:47:39AM +0200, Benjamin Bara wrote:
> > > > > On Wed, 7 Aug 2024 at 10:33, Alexander Stein wrote:
> > > > > > Am Mittwoch, 7. August 2024, 10:10:28 CEST schrieb Benjamin Bar=
a:
> > > > > > > Currently, the V4L2 subdevice is also created when the device=
 is not
> > > > > > > available/connected. In this case, dmesg shows the following:
> > > > > > >
> > > > > > > [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> > > > > > > [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> > > > > > > [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> > > > > > > [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
> > > > > > >
> > > > > > > which seems to come from imx290_ctrl_update() after the subde=
v init is
> > > > > > > finished. However, as the errors are ignored, the subdev is i=
nitialized
> > > > > > > but simply does not work. From userspace perspective, there i=
s no
> > > > > > > visible difference between a working and not-working subdevic=
e (except
> > > > > > > when trying it out or watching for the error message).
> > > > > > >
> > > > > > > This commit adds a simple availability check before starting =
with the
> > > > > > > subdev initialization to error out instead.
> > > > > >
> > > > > > There is already a patch reading the ID register at [1]. This a=
lso reads the
> > > > > > ID register. But I don't have any documentation regarding that =
register,
> > > > > > neither address nor values definitions. If there is known infor=
mation about
> > > > > > that I would prefer reading the ID and compare it to expected v=
alues.
> > > > >
> > > > > Thanks for the link - it seems like Laurent has dropped the patch=
 for
> > > > > the more recent kernel versions on their GitLab.
> > > >
> > > > It was a patch that I wrote as a test, and I decided not to upstrea=
m it
> > > > as it had limited value to me. The downside with reading registers =
at
> > > > probe time is that you have to power up the sensor. This can have
> > > > undesired side effects, such as flashing a privacy LED on at boot t=
ime
> > > > in devices that have one. There's also the increase in boot time du=
e to
> > > > the power up sequence, which one may want to avoid.
> > > >
> > > > The imx290 driver already powers up the device unconditionally at p=
robe
> > > > time, so reading the version register wouldn't be much of an issue I
> > > > suppose. I would be fine merging that patch.
> > > >
> > > > > This was also my initial intention, but similar to you, I don't h=
ave a
> > > > > docu describing this register, so I am not sure where the info is=
 coming
> > > > > from and if it really contains the identification/type info. Prob=
ably
> > > > > Laurent has more infos on that.
> > > >
> > > > That's a good question. I don't see a mention of that register in t=
he
> > > > IMX290 datasheet I've found online
> > > > (https://static6.arrow.com/aropdfconversion/c0c7efde6571c768020a72f=
59b226308b9669e45/sony_imx290lqr-c_datasheet.pdf).
> > > > Looking at the git history, the IMX290_CHIP_ID register macro was
> > > > introduced in an unrelated commit, without an explanation. I don't
> > > > recall where it comes from, but I don't think I've added it randoml=
y. It
> > > > may have come from an out-of-tree driver.
> > >=20
> > > Thanks for the info!
> > >=20
> > > > I don't have an IMX290 plugged in at the moment, what's the value o=
f the
> > > > register ?
> > >=20
> > > I currently have an imx462 available, which is not "officially suppor=
ted" yet,
> > > but basically an imx290 derivative. With your patch applied:
> > >=20
> > > [   10.424187] imx290 7-001a: chip ID 0x07d0
> >=20
> > Okay, this is from a imx327lqr:
> >=20
> > [   15.265086] imx290 3-001a: chip ID 0x07d0
> >=20
> > Doesn't look like an ID register to me.
>=20
> Indeed, it's quite suspicious.
>=20
> I wonder if we could find a more applicable register. Chip ID registers
> are usually located at the beginning or end of the register space, we
> could have a look there.

Dumping all registers (8-Bit reads) from 0x3001 till 0x3480 only has a few
non-zero registers:
> # cat /sys/kernel/debug/regmap/3-001a/range
> 3000-3480
> # cat /sys/kernel/debug/regmap/3-001a/registers  | grep -v ": 00"
> 3000: 01
> 3020: 01
> 303c: 08
> 303e: 38
> 303f: 04
> 3040: 08
> 3042: 80
> 3043: 07
> 319a: d0
> 319b: 07
> 3418: 38
> 3419: 04
> 3472: 80
> 3473: 07

Note I am on a Vision Components imx327, which might block some reads.
Laurent is also aware of that behaviour. But maybe this list gives an
indicator.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



