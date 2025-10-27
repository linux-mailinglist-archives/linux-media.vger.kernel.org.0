Return-Path: <linux-media+bounces-45719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8657C11706
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 21:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1A245664C0
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 20:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B014315789;
	Mon, 27 Oct 2025 20:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="LKPxbNso"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0592D8377;
	Mon, 27 Oct 2025 20:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761598289; cv=pass; b=G7leLNArcyK9UiZUP3H9hVpjIF4ygXaxrBsFbySHGQBfWCsOHV5RrqlChE9SLSlZDTN2oTb6VrRsapIfTqBT8Chzov/nqSUgOpSfHwwLh86K4pA1Ay/7BNFZ8LVTdKBZiUH1w8dwek974Rhc/9ABq2/qGVvRCmZJabqAwMWzDVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761598289; c=relaxed/simple;
	bh=lhAHUj5bxXShVg5mBPT4K+s1waC5K/onTf9I+kANIjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgF3up66gC6lozUoHdUDlwLv2OHqM/C9M0FbfIUAqdNVckk0Oq6lE9/xJDTrZlfCY3s9frZagzrVmCac8w2v4qXGn9qwdHmrM0QcNd7drqS71mvAdcDkbsedpyFzLEYpdB8Vi79/t9ofXPtS6fVeYcshl5f/fl+DyqgtEefo4JM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=LKPxbNso; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cwQf25Mg0zyRb;
	Mon, 27 Oct 2025 22:51:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1761598283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0UzmCaPVoiS1w/FUaOytewjvTtIauYLev6TJBsSgl38=;
	b=LKPxbNsoEvumyCTzXvaXlwgGq7tpa8L6cRk3TshEApKiWUUsZkFYI/+VQenMjQqJOdm7Bk
	PtVOG5iOsJT+7gFJk9fGny3dcD89o6QQf2ZDypYDlOs2JyGN1Zn6p4yLr8WHbRBjKfseu0
	AITo0O6gJ1Yv1ew1ARkHQ/SDbJhc2Og=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1761598283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0UzmCaPVoiS1w/FUaOytewjvTtIauYLev6TJBsSgl38=;
	b=yrFxCASLbHlVMhaVYYeTZrnnylCerNggsiAtDRErJ8QL/KVVJot4XfqITy0TMSlwsFhfeU
	HoyMvf5HSVu6SwAbEpA176RblHLEe/y9HDCoygdUUNiftb24i+RYb843ONWvBOgZX80iuB
	a4Pl4QDq78Hk6LjgaKmF3GiyuPpzRyk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1761598283; a=rsa-sha256; cv=none;
	b=LjaE/ud729xDvyU4alpwesfOqW8/XoXctkMEPWaona1Io78nhyPB7/ACsEOOXsMT+Nqdz1
	SmR/ML3OGn/P18BkwFNPCHE+MXzs66/09La6yPfZMOI1G/2WSUKpdLRDgi1zKMdSlBraMr
	v7r0bJcB3NFx5Y+Bv0dSOyidef24giI=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AF27B634C51;
	Mon, 27 Oct 2025 22:51:21 +0200 (EET)
Date: Mon, 27 Oct 2025 22:51:21 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev, Luis Oliveira <lolivei@synopsys.com>
Subject: Re: [PATCH v3 01/31] dt-bindings: media: add DW MIPI CSI-2 Host
 support
Message-ID: <aP_bSQUIle_9-L-7@valkosipuli.retiisi.eu>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
 <aP8t3YClrZxOnHea@valkosipuli.retiisi.eu>
 <aP+enPOHPkvZAkzS@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP+enPOHPkvZAkzS@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Oct 27, 2025 at 12:32:28PM -0400, Frank Li wrote:
> On Mon, Oct 27, 2025 at 10:31:25AM +0200, Sakari Ailus wrote:
> > Hei Eugen,
> >
> > On Thu, Aug 21, 2025 at 04:15:36PM -0400, Frank Li wrote:
> > > From: Eugen Hristev <eugen.hristev@linaro.org>
> > >
> > > Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
> > > and i.MX95 platform.
> > >
> > > Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> > > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Change in v3
> > > - drop remote-endpoint: true
> > > - drop clock-lanes
> > >
> > > Change in v2
> > > - remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
> > > - update ugen Hristev's s-o-b tag to align original author's email address
> > > - remove single snps,dw-mipi-csi2-v150 compatible string
> > > - move additionalProperties after required
> > > ---
> > >  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 151 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   1 +
> > >  2 files changed, 152 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..d950daa4ee9cfd504ef84b83271b2a1b710ffd6b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> > > @@ -0,0 +1,151 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/snps,dw-mipi-csi2-v150.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Synopsys DesignWare CSI-2 Host controller (csi2host)
> > > +
> > > +maintainers:
> > > +  - Frank Li <Frank.Li@nxp.com>
> > > +
> > > +description:
> > > +  CSI2HOST is used to receive image coming from an MIPI CSI-2 compatible
> > > +  camera. It will convert the incoming CSI-2 stream into a dedicated
> > > +  interface called the Synopsys IDI (Image Data Interface).
> > > +  This interface is a 32-bit SoC internal only, and can be assimilated
> > > +  with a CSI-2 interface.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - fsl,imx93-mipi-csi2
> > > +      - const: snps,dw-mipi-csi2-v150
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: MIPI CSI-2 core register
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: core
> > > +
> > > +  clocks:
> > > +    maxItems: 2
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: per
> > > +      - const: pixel
> > > +
> > > +  phys:
> > > +    maxItems: 1
> > > +    description: MIPI D-PHY
> > > +
> > > +  phy-names:
> > > +    items:
> > > +      - const: rx
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          Input port node, single endpoint describing the input port.
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +            description: Endpoint connected to input device
> > > +
> > > +            properties:
> > > +              bus-type:
> > > +                const: 4
> >
> > If 4 is the only value supported, you can drop the property altogether.
> 
> Sorry, What's your means here? There are more options in video-interfaces.yaml.
> here just add restriction for bus-type. otherwise other value can be
> provide in dts file.

It could, but wouldn't any other value be incorrect?

In other words, this property is redundant and should be dropped.

> 
> >
> > > +
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +                items:
> > > +                  maximum: 4
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          Output port node, single endpoint describing the output port.
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            unevaluatedProperties: false
> > > +            $ref: video-interfaces.yaml#
> > > +            description: Endpoint connected to output device
> > > +
> > > +            properties:
> > > +              bus-type:
> > > +                const: 4
> >
> > Are both input and output of this block CSI-2 with D-PHY?
> 
> Yes, input from camera sensor, output to others image processors to do data
> transfer or format convert.

The description appears to be saying this is "Synopsys IDI", not CSI-2 with
D-PHY. We don't have a bus-type for IDI. Couldn't you simply drop it?

-- 
Regards,

Sakari Ailus

