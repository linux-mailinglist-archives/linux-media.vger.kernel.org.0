Return-Path: <linux-media+bounces-19758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D24929A08F4
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 14:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A3F31F260D1
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B5A20820E;
	Wed, 16 Oct 2024 12:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GiHCUWum"
X-Original-To: linux-media@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA57207A23;
	Wed, 16 Oct 2024 12:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729080073; cv=none; b=slLFEVWWgdTnjDla7VkcsOHGThzRNXBllUGb//3g7xFbxiNFHAL9RgEMkQicq+0ZM6WyU+zF8dr7KhhhnNyM7IoXw2dfVe7lUsXlSwl8QwhviYwaAHgrpbyjtc2sbUvrH/sXWUFH+DfKs9Aigz4Ah99ncdxOIuyJ+iQjKKgfGR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729080073; c=relaxed/simple;
	bh=oCRosoj8nbgeHNC1GlrQd/Tc8gWDhFi2n75m7T/lzLU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+S65aXuDmX3MqG6MU5owoPwza/tFN3QyHBBaKKwsenTy+RTrnhcpWCiz2ipGz+bARcKSHhMvDyzUwe5C2uDagUmmltehgjMbfg/xvxDL7L8mcCymAM85gzxQykj5QuihXBzmEHxt4uq2UOx8fQcpGcJb6WLuKzZIx4Ya8oFRMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GiHCUWum; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E19181C000E;
	Wed, 16 Oct 2024 12:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729080069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8krP1VYwxBLXUznJQJXAi4O+kQ5+/JlOE4x1ZUEOX5Q=;
	b=GiHCUWumFVs/jO1YMHSG7rA16gQjs6pbBAiCcd4D2BnG68yciTjh4sr3vI4BbD9wRFLIXZ
	ywhlWbF+mgFQwXe8c1SIWmQNHhsrjT6sGcDurP5aun4v/ivL8cPFVvZyLItnCUQ7XewBtN
	c5gqEnGoTBWStvdi7oiwdUi14SRLV2TW6k4UiWI+VFbCQB27jBALEMzf4IiFcy4PnGkkXV
	GDfhB1mXcf04qYRnZXW28xbwqJU7EJy070PC6YGk4VKniMql09sBrx5GtrSLl51wXLInSc
	w/j8sZE2guTIgfjVs1SL84HeOdp94leXtZtxTRIu5hSOOecqNhrnL139Ra9YRA==
Date: Wed, 16 Oct 2024 14:01:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 1/2] dt-bindings: mtd: Add Loongson-1 NAND
 Controller
Message-ID: <20241016140108.00273712@xps-13>
In-Reply-To: <CAJhJPsW+cRY13in41NpTrEB4VP7jYLFdgrt8+9EJSwgkvXZR=g@mail.gmail.com>
References: <20241002-loongson1-nand-v10-0-17162eff80e2@gmail.com>
	<20241002-loongson1-nand-v10-1-17162eff80e2@gmail.com>
	<20241007161027.386e7409@xps-13>
	<CAJhJPsW+cRY13in41NpTrEB4VP7jYLFdgrt8+9EJSwgkvXZR=g@mail.gmail.com>
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

Hi Keguang,

keguang.zhang@gmail.com wrote on Wed, 16 Oct 2024 16:06:09 +0800:

> On Mon, Oct 7, 2024 at 10:10=E2=80=AFPM Miquel Raynal <miquel.raynal@boot=
lin.com> wrote:
> >
> > Hi Keguang,
> > =20
> > > +patternProperties:
> > > +  "^nand@[0-3]$":
> > > +    type: object
> > > +    $ref: raw-nand-chip.yaml
> > > +
> > > +    required:
> > > +      - nand-use-soft-ecc-engine
> > > +      - nand-ecc-algo =20
> >
> > Actually I told you a mistake. The no-ecc-engine case should remain
> > valid, so we cannot require these properties in the bindings.
> > =20
> Then, remove this section, right?

Yes, please.

Thanks,
Miqu=C3=A8l

