Return-Path: <linux-media+bounces-16309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A02951DA6
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 16:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B8991F241AD
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 14:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905591B3F1A;
	Wed, 14 Aug 2024 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bOwXC4O9"
X-Original-To: linux-media@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22201EF1D;
	Wed, 14 Aug 2024 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723646918; cv=none; b=gyOB11+WB0jIKUXPtM5X9wHFgIzej3OwLyitalZ+1Uuny0kZJW194sspr0e4IOXMaAO5Mzbb1/scoqgvR/hFHymor5CCtXiORdmUgyJNl/DChBaToQZWQAx6etKHGWr/xlZLg8eRwQms6KGQBYhxAwOVF7qRPm+HSG027/o99KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723646918; c=relaxed/simple;
	bh=iBH/EKGzj7vcdFzXqvNwaURrKXDvWju/7ZkBckM/1Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BvByBV6gytBmTMpm2SqXLAgbu5911KkdRTx6aazhxndhYFBQvJkS9mOwIFHWQDWXZeNHa2Avj4pyBsxTq2CAuJesp4ecUSzeXfQ5pjyHjf9h06yo996sUvbMkqvmlb+azJFDK8s2Pj0ykwWmRB0D/Hfusfn5bpLXvQRB1FyWKxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bOwXC4O9; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D42FC0003;
	Wed, 14 Aug 2024 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723646908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsvtyLqIUdSFch0aam54nIRgOyDlKRcYRX1ld/c3r+U=;
	b=bOwXC4O98tmMfIQq1u2pQCdj1qbCJxUlfYRCwaxA7rLeigiFBvaPYJcacO7Vqy9sjst+Z+
	m2OYoiIBXIe07wKjZIG4mJ3hd3VPwyiimsu8iJdVX9WFUdvV7hUTNnAUyuLE2fa9+f1Blb
	3bW+t66yPW4+znXAcPaB3l2axEr/MjtgmqG1K85/EQU+4msA6sxVlehpFZEK28PC0eVqcB
	LWCg49rd+G3Oa8enGhHnpyt2WtQYMezcqEDHRng/mi0uG+cbo53k4h1NjDJ1Cw+ezFqByM
	/ACgtMBMstUUEbpJRsiQQ1xC5RBetdOZzF/KkMrLZFWkCssqmHGP40HIfa2ZzA==
Date: Wed, 14 Aug 2024 16:48:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240814164824.5c4f18af@xps-13>
In-Reply-To: <20240814-delicate-oil-d1eef61f0eda@spud>
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
	<20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
	<20240808-backyard-unglue-3cf429ad8da5@spud>
	<CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
	<20240809-smuggler-patrol-067003f0ba9b@spud>
	<20240814091231.1d9525be@xps-13>
	<20240814-delicate-oil-d1eef61f0eda@spud>
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

Hi Conor,

conor@kernel.org wrote on Wed, 14 Aug 2024 15:23:23 +0100:

> On Wed, Aug 14, 2024 at 09:12:31AM +0200, Miquel Raynal wrote:
> > Hi,
> >  =20
> > > > > When I first read "nfc" here I thought it was a copy-paste mistak=
e, as
> > > > > "nfc" is a technology of it's own. I think it would make sense to=
 rename
> > > > > to "loongson,ls1b-nand-controller" etc to remove that sort of con=
fusion.
> > > > > These devices might not implement NFC, but what's to say that a f=
uture
> > > > > device will not? =20
> >=20
> > I believe the nfc (also, nc) abbreviation pre-dates the NFC spec. But I
> > agree, it may be misleading. Even though I don't foresee any NAND
> > controller with NFC coming, =20
>=20
> Hm, I think you misunderstood - I meant loongsoon SoCs that had nfc
> controllers and nand controllers - not nand controllers with nfc!

Ah! Well, yes, it may be even more misleading then :-)

Cheers,
Miqu=C3=A8l

