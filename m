Return-Path: <linux-media+bounces-16991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D82659621BC
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 09:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1610D1C2328C
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 07:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EA315C151;
	Wed, 28 Aug 2024 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m+IuM1tT"
X-Original-To: linux-media@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A169915B0E8;
	Wed, 28 Aug 2024 07:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724831340; cv=none; b=g+hl6gHaAW8ZT/HvTzPebyDzZTnjzZfDTA0Kwv2F2OYuBrYwWgY7Qxe3ULlpm8yv9c6nqbyClUEjn7pTNh4WW7pNa5xHbnBum/UK/6e3FseC15+1cJ79eiJZ5t14hIUx2rZxCIx7UbvGi9CDvgJ3Ta7GPvESJMFKqZRqS6bpX2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724831340; c=relaxed/simple;
	bh=brMbuJxBR0YP5Q4chxmLNPrjSwAwAUfc5DbpP3BC/EE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HM5Krj2hqvCZkR9bzHZLh7XBWuqcdNhMM1XgbfS/nXfrtGOOgzT2Gumv5/hg/+tb8F3CvVoKCfv0AlYwIuOEPZUUnp3lbSS4Qto5i7zrBpW8UWy1Q4KN9TYhuT0eSgtKuXs2afNpX4PC9D73Mm6uvmvmJgwHqYNOV2fFQjCmMk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m+IuM1tT; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62B78FF808;
	Wed, 28 Aug 2024 07:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724831329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y5zLZsHecvlr5wSYFNatvZpgULQ6Qmig03QDSQmQd4Y=;
	b=m+IuM1tTx5x1LLw++vJv+fVKTLfoYsQe486sDQqOB4JvPo0i/JIlUYXEqpBcD7ew+lG8B5
	ubnACfagbmX36TbQzavKFAA1nP2nJ5ZwxCZGhsqN7mUYMGwrGChsrNnlfh7Al2nn234Vw6
	Qnc4toma/uSIkeZ1OdF1EdVuicT2P1hY9CIe8yxDpCuOR76KOtIv1DHColUWaqmuiJ3bIs
	0GrAY77FOYA2mQdSs6dYdUZHwrkSlhieu3DRPo3qY2QJPwYsg1S8TfExbKa/a6fFAA4i+3
	ZLDUWtxAjoEyXiq2awP9FrIKW+GiEySKt/VFt0QRGEtxj52f7nxEMphy/vnEPw==
Date: Wed, 28 Aug 2024 09:48:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
Message-ID: <20240828094846.166c7de6@xps-13>
In-Reply-To: <fd0d73cf-6bce-4f7b-9513-5f434ab9ae00@gmail.com>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
	<20240821071132.281018-2-hpchen0nvt@gmail.com>
	<20240823182616.5a85e1ae@xps-13>
	<fd0d73cf-6bce-4f7b-9513-5f434ab9ae00@gmail.com>
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

Hi Hui-Ping,

hpchen0nvt@gmail.com wrote on Wed, 28 Aug 2024 10:47:17 +0800:

> Dear Miqu=C3=A8l,
>=20
> Thank you for your reply.
>=20
>=20
>=20
> On 2024/8/24 =E4=B8=8A=E5=8D=88 12:26, Miquel Raynal wrote:
> > Hi,
> >
> > hpchen0nvt@gmail.com wrote on Wed, 21 Aug 2024 07:11:31 +0000:
> > =20
> >> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
> >>
> >> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>   .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++=
++
> >>   1 file changed, 93 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma3=
5d1-nand.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand=
.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> >> new file mode 100644
> >> index 000000000000..152784e73263
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> >> @@ -0,0 +1,93 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
> >> +
> >> +maintainers:
> >> +  - Hui-Ping Chen <hpchen0nvt@gmail.com>
> >> +
> >> +allOf:
> >> +  - $ref: nand-controller.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - nuvoton,ma35d1-nand =20
> > Can we please use the -nand-controller suffix. A NAND is a the common
> > name for a chip with storage inside. You are describing a host
> > controller that can be connected to in order to talk to a NAND. =20
>=20
>=20
> Okay, I will change it to nuvoton,ma35d1-nfi.
>=20
> Because in our platform, it is the NAND Flash Interface.

nfi is not an acronym that is understandable by everyone. Please use
-nand-controller. Don't be worried by the size of the string.

You can use the acronym as prefix for your NAND controller functions
though.

Thanks,
Miqu=C3=A8l

