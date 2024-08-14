Return-Path: <linux-media+bounces-16273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3395150B
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 09:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4000D1F222DC
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 07:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E68113AA32;
	Wed, 14 Aug 2024 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WLDyz8AV"
X-Original-To: linux-media@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670AD139D12;
	Wed, 14 Aug 2024 07:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723619561; cv=none; b=dttutUbZ/Rs+Bjvao8Bl3DRZc4uj/UotiH39J71CgFCHBIRqTDPnZl8sf4DYqh+UynYVX8qE9EHYPWW52o/izKvWUjTUWV13qTjOyZXAFne7uVsEP9ILcor8AnAT9FrtWkmHmuHGuEwapuNGcsfBquG/DyC94KdxorbRA//TYR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723619561; c=relaxed/simple;
	bh=16gfSaJyvSElILzmaEHedrernnbdYU+elxoghkD0Kvo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ao/RVwBNcvT/qAubw/dSy+kVodxsb1I3epUYyZDPVv7k0dn3UC8UujJM/SMMYik68qGF2UoWq9sOftg83I0D/B+wwiV/qy6pNHuXUXdXTs+JhJVmEY8zuYqer5UET40YLrto5BiZIU5zDWEKQvwt3DAxdRba4oXnnCYhdMx6wWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WLDyz8AV; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02A6C20004;
	Wed, 14 Aug 2024 07:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723619555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=16gfSaJyvSElILzmaEHedrernnbdYU+elxoghkD0Kvo=;
	b=WLDyz8AVmcmRVLH4/IFsyuHIwRxU+xykoppb2BwV7B7lBpBhCDg6niv6GEEBULDECJeRnn
	+Lq4gnSdHq9W0+CmCfedfQeJ67NQaQDMCd5GB2Adce4o/MOSiHdFVJB8DjPaWz/0VVHCRM
	Q3lq3I4s7wGcu4ckj1cjdz5MgiHqNpQYJoRkqsRZPkd4K5rvEfNJxJLykx+VOYQy45Z6mc
	Vh4eBxUDrINY7YOH+IaMfku6iStV3DhFIQVv5c/1Uam1ldukxmeOaIgo99AxLCc41usAva
	gGE2OuYkynLz96PJpm+mZmp2Ezrqrf/vDV284Ktlz4Xr8ELtNZOJCh2SgbYkEA==
Date: Wed, 14 Aug 2024 09:12:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240814091231.1d9525be@xps-13>
In-Reply-To: <20240809-smuggler-patrol-067003f0ba9b@spud>
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
	<20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
	<20240808-backyard-unglue-3cf429ad8da5@spud>
	<CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
	<20240809-smuggler-patrol-067003f0ba9b@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi,

> > > When I first read "nfc" here I thought it was a copy-paste mistake, as
> > > "nfc" is a technology of it's own. I think it would make sense to ren=
ame
> > > to "loongson,ls1b-nand-controller" etc to remove that sort of confusi=
on.
> > > These devices might not implement NFC, but what's to say that a future
> > > device will not?

I believe the nfc (also, nc) abbreviation pre-dates the NFC spec. But I
agree, it may be misleading. Even though I don't foresee any NAND
controller with NFC coming, it's probably bad for newcomers/people who
are not already deeply into the mtd details to use these confusing
letters, especially in a binding.

So, Ack.

> > Sorry for the confusion.
> > The string "loongson,ls1b-nand-controller" might be too long. =20
>=20
> It "might"? Why do you think it is too long?

Yeah, why would it be too long? Let's call a cat a cat. This is a
compatible for a NAND controller. So I expect the string to mention
it's a NAND controller because it's clearer. For quite some time there
has been a confusion between the NAND controller and the NAND
flash/chip, but these are two different hardware components.

> > May I rename it to "loongson,ls1b-nand"? =20

For the above reason, no :)

Thanks,
Miqu=C3=A8l

