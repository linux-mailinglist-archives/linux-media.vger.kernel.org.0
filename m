Return-Path: <linux-media+bounces-16675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C795D33C
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 18:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6A4B1F23094
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 16:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30E918BB80;
	Fri, 23 Aug 2024 16:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JpFgaCA3"
X-Original-To: linux-media@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6262F1586D3;
	Fri, 23 Aug 2024 16:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724430382; cv=none; b=XhTrfuyK+pZ8WlbXsuo5lfsMXAUXWFCYyMny67l0DUs4kLgE8krOu0CLo8Z8FMrVpmM6QqGC16+zGWxzDi3o7Ws9FryjCjHNdxaVm9igSvWwDxHuP/v7MPKe4/7g+3OiUZgpzlomB76RwbTo+bK6U4ZmoRR3N8J6wI+IjcPZgvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724430382; c=relaxed/simple;
	bh=jQO3BUCwwd7loSkWxfYR+E/d+c3DO7vteMbYJziMD0w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H3R9xTD6ddylUKJm9qrBw0ttbHzDqT/Nc7Yl5eFiGq1XVqBpBKIHbQAz3oh4GhpQhMvxN1+wu2VOGp/gwdvnrS9OWbL3VhPbXmSv+YGHS6YYlmIEaPZyt9ZdKBTEyMEzRGeJWTy/CVc5c5QIwFX73msNpiSJ7qJDTD2VPBF5Bkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JpFgaCA3; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C6E820008;
	Fri, 23 Aug 2024 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724430378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZSZ4ZWkj6nN5cffjKGJ15MFqfbm3AdMyv45FOgL9lo=;
	b=JpFgaCA32WqOAE3V0avi6VMRNuexZVaIWTSYeFl+0wgVveqM/f8XnfTjdFcSomsT3BDCKi
	0Hh30CESmpUDky3nmmbKHKTd3/FYNC67cupzeYCQdrWMXHbHlZvNHTbCX8xOXRv3G92xhv
	FmfEpg24mUCZNK/Nkb7CGqfpHDEAZEbbkVH5Hy2LtG7rd9/wPbnLHDPLGwy0ZUTj1l4VEZ
	2ppZ3j7o66upZ+wP+dGi41RfTvb5TavNh/t8/NvDOcVij0SEDtRzMIvQE2Pr7fKRvgS78e
	rDoh1VviE+kBhlSbxDgHf7B4cE11WmrgL3suG9gviol32opZCBDPI0VXULmqkQ==
Date: Fri, 23 Aug 2024 18:26:16 +0200
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
Message-ID: <20240823182616.5a85e1ae@xps-13>
In-Reply-To: <20240821071132.281018-2-hpchen0nvt@gmail.com>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
	<20240821071132.281018-2-hpchen0nvt@gmail.com>
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

hpchen0nvt@gmail.com wrote on Wed, 21 Aug 2024 07:11:31 +0000:

> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
>=20
> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-=
nand.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.ya=
ml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> new file mode 100644
> index 000000000000..152784e73263
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
> +
> +maintainers:
> +  - Hui-Ping Chen <hpchen0nvt@gmail.com>
> +
> +allOf:
> +  - $ref: nand-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,ma35d1-nand

Can we please use the -nand-controller suffix. A NAND is a the common
name for a chip with storage inside. You are describing a host
controller that can be connected to in order to talk to a NAND.

Thanks,
Miqu=C3=A8l

