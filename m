Return-Path: <linux-media+bounces-25971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 157B6A2FB7B
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5438D18830D7
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFED324C693;
	Mon, 10 Feb 2025 21:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uLZwKAqL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D8158874;
	Mon, 10 Feb 2025 21:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221834; cv=none; b=PzTmqu+NxQ+nrCB49/4Z1DN0BreJ1aD4bt2OqexxcrmF1QI2DqRYn7pgPFr5STryGXxR0GGeVrdzeFdMxJHqHWQNbwOxpbUKdEemOVT/G63WqBPJUjEx589Z12zi/l/GsLAYdh1eB6E9hhbqZ/gYBT358juMbkPu3RVnpDLEs6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221834; c=relaxed/simple;
	bh=Xw/n/fhvGJtKoKxwkCvpi9wRhgHCNTm2ytQqwLDJyPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nN0KjxmYH9Tj9/iEs+IwcIx3J5wlsfo5xUZsQklPyo9mju8zmoA8sLuOz+AbikZBMuEe83NH9c4CCih2NGifJ0l5K/lYwDzg6EsiGsv9pJ7aLsSlgKnAeM58RQOm5uby69qzw0972cPq2LtsVd9LjDjZqt6dc0zYZYT6sT71Shc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uLZwKAqL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 708D38D4;
	Mon, 10 Feb 2025 22:09:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739221747;
	bh=Xw/n/fhvGJtKoKxwkCvpi9wRhgHCNTm2ytQqwLDJyPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLZwKAqLznzE4O+j5HJaOCx4n7eS6kxE1QMhPgmpU044zFRG372VM+A9TrfMW41DL
	 Nt+83SQrHjdFKUWhNOV40ps3d9zB0H3UuSEHdwFPI6/SxYNRR5M1lzLewd4YLrRYoK
	 b0dbvz9QlVA5qN0wz0QPw+ocKLcdzHMgxMkomjs8=
Date: Mon, 10 Feb 2025 23:10:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Robby Cai <robby.cai@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
Message-ID: <20250210211013.GC8531@pendragon.ideasonboard.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
 <20250205-8qxp_camera-v2-1-731a3edf2744@nxp.com>
 <20250206211808.GA24886@pendragon.ideasonboard.com>
 <Z6UuR9mHhQUdnBEc@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z6UuR9mHhQUdnBEc@lizhi-Precision-Tower-5810>

On Thu, Feb 06, 2025 at 04:48:55PM -0500, Frank Li wrote:
> On Thu, Feb 06, 2025 at 11:18:08PM +0200, Laurent Pinchart wrote:
> > On Wed, Feb 05, 2025 at 12:18:10PM -0500, Frank Li wrote:
> > > Add MIPI CSI phy binding doc for i.MX8QXP, i.MX8QM and i.MX8ULP.
> >
> > s/CSI/CSI-2/ in the subject line, here and below.
> > s/phy/PHY/
> >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > change from v1 to v2
> > > - Add missed fsl,imx8qm-mipi-cphy, which failback to fsl,imx8qxp-mipi-cphy
> > > - Move reg to required. Previous 8ulp use fsl,offset in downstream version.
> > > which should be reg. So move it to required
> > > ---
> > >  .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        | 57 ++++++++++++++++++++++
> > >  1 file changed, 57 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> > > new file mode 100644
> > > index 0000000000000..7335b9262d0e7
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> > > @@ -0,0 +1,57 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/fsl,imx8qxp-mipi-cphy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Freescale i.MX8 SoC MIPI CSI PHY
> > > +
> > > +maintainers:
> > > +  - Frank Li <Frank.Li@nxp.com>
> > > +
> > > +properties:
> > > +  "#phy-cells":
> > > +    const: 0
> > > +
> > > +  compatible:
> > > +    oneOf:
> > > +      - enum:
> > > +          - fsl,imx8qxp-mipi-cphy
> > > +          - fsl,imx8ulp-mipi-cphy
> > > +      - items:
> > > +          - const: fsl,imx8qm-mipi-cphy
> > > +          - const: fsl,imx8qxp-mipi-cphy
> >
> > Why are those called cphy when, as far as I can tell from the
> > documentation, they are D-PHYs ? Does that stand for *C*SI PHY ?
> 
> There are already have D-PHYS for MIPI display phy binding. cphy just means
> for camera PHY.

Ah OK. I would probably have gone for *-mipi-dphy-rx then, but I'm OK
with the proposed "cphy". Explaining this in the description would be
useful.

> > I find
> > it slightly confusing, but not so much that I'd ask for a change. It's
> > just a name at the end of the day.
> >
> > Apart from that the binding looks fairly OK. Except maybe from the fact
> > that this device is not a PHY :-( It has two PHY control registers, but
> > the rest seems related to the glue logic at the output of the CSI-2
> > receiver. I wonder if we should go the syscon route.
> 
> Do you means use phandle to syscon node in csi-2 driver? Actually this
> ways is not perferred by device tree team because it should be exported
> as what actual function, such as PHY or RESET by use standard interface.
> 
> We met similar case at other substream.

I don't like syscon much either, but in this specific case I'm not sure
what else we could do. This device really aggregates some control over
the PHY and over the glue logic at the output of the CSI-2 controller.
Modelling it as "just a PHY" will cause problem as soon as you'll want
to configure the other parameters.

> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - "#phy-cells"
> > > +  - compatible
> > > +  - reg
> > > +
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - fsl,imx8qxp-mipi-cphy
> > > +    then:
> > > +      required:
> > > +        - power-domains
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    phy@58221000 {
> > > +            compatible = "fsl,imx8qxp-mipi-cphy";
> > > +            reg = <0x58221000 0x10000>;
> > > +            #phy-cells = <0>;
> > > +            power-domains = <&pd 0>;
> > > +    };
> > > +

-- 
Regards,

Laurent Pinchart

