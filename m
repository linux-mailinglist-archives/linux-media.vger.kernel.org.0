Return-Path: <linux-media+bounces-41530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD788B3F8D5
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D1121A8075C
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 08:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8162EAD1B;
	Tue,  2 Sep 2025 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BGOySrfR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A182EAD13;
	Tue,  2 Sep 2025 08:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756802186; cv=none; b=cNZXPy+faYsTmwm6Kltz9EeVWgJqIccDj+bHHGmfrIrGafvvXxN45qEjKGeTl7rm6qgOT5dJne4HreSxQfnqREipEx+Nel40eTLWs/YGL4beuqOYMiT1rX9RdS+B0Cw+L8Bu0Wd+Z3U0x67wHSbrcLImoyWmJrVkKZ/ABo/gByU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756802186; c=relaxed/simple;
	bh=9b9oj9NtnjkgCqLHI/easGtUlL/TclnyNvdB1pRPJ10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1juUgQcRzWFovIT/ZSe90nwrOivxrbPWVDddMj+kPmsd8IWtxSKzVdXBASAGsGo55XdpusG2oPUjJoVRPFZyBhoCMq0JhntDaQm9Ow5OJkrr4uJFqYYk31WvX/25FNMLciWr5FstlxnZoVklNa1l5yY6QWbXtNkamWHDe14qmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BGOySrfR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ACD1BC75;
	Tue,  2 Sep 2025 10:35:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756802107;
	bh=9b9oj9NtnjkgCqLHI/easGtUlL/TclnyNvdB1pRPJ10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGOySrfRK7wpIrVW8pam0Ry99/B6YUY4pxhePRpqXmQ4bRXZFruERAo3LeGWgimon
	 o/2Wg5FRxVjaaLNOYl/+zymSodr6I2YJhJRDo+jpP6ffXxCw07kDAMnlXmAGxUC1O+
	 wIoZkgmSqEVDBzhib+eXd4wHBTQaA32pg7lKmLTk=
Date: Tue, 2 Sep 2025 10:35:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <20250902083554.GD13448@pendragon.ideasonboard.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
 <20250901154610.GB13448@pendragon.ideasonboard.com>
 <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>

On Mon, Sep 01, 2025 at 09:45:39PM -0400, Frank Li wrote:
> On Mon, Sep 01, 2025 at 05:46:10PM +0200, Laurent Pinchart wrote:
> > On Mon, Sep 01, 2025 at 02:25:29PM +0800, Guoniu Zhou wrote:
> > > The CSI-2 receiver in the i.MX8ULP is almost identical to the version
> > > present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
> > > clock as the input clock for its APB interface of Control and Status
> > > register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
> > > increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
> > > same restriction for existed compatible.
> >
> > s/existed/existing/
> >
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 46 ++++++++++++++++++++--
> > >  1 file changed, 43 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > > index 3389bab266a9adbda313c8ad795b998641df12f3..412cedddb0efee1a49d1b90b02baa7a625c797ec 100644
> > > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > > @@ -21,7 +21,9 @@ properties:
> > >            - fsl,imx8mq-mipi-csi2
> > >            - fsl,imx8qxp-mipi-csi2
> > >        - items:
> > > -          - const: fsl,imx8qm-mipi-csi2
> > > +          - enum:
> > > +              - fsl,imx8qm-mipi-csi2
> > > +              - fsl,imx8ulp-mipi-csi2
> > >            - const: fsl,imx8qxp-mipi-csi2
> >
> > According to this, the ULP version is compatible with the QXP version.
> >
> > >
> > >    reg:
> > > @@ -39,12 +41,16 @@ properties:
> > >                       clock that the RX DPHY receives.
> > >        - description: ui is the pixel clock (phy_ref up to 333Mhz).
> > >                       See the reference manual for details.
> > > +      - description: pclk is clock for csr APB interface.
> > > +    minItems: 3
> > >
> > >    clock-names:
> > >      items:
> > >        - const: core
> > >        - const: esc
> > >        - const: ui
> > > +      - const: pclk
> > > +    minItems: 3
> > >
> > >    power-domains:
> > >      maxItems: 1
> > > @@ -130,19 +136,53 @@ allOf:
> > >          compatible:
> > >            contains:
> > >              enum:
> > > -              - fsl,imx8qxp-mipi-csi2
> > > +              - fsl,imx8ulp-mipi-csi2
> > > +    then:
> > > +      properties:
> > > +        reg:
> > > +          minItems: 2
> > > +        resets:
> > > +          minItems: 2
> > > +          maxItems: 2
> > > +        clocks:
> > > +          minItems: 4
> > > +        clock-names:
> > > +          minItems: 4
> >
> > But according to this, the ULP version requires more clocks than the QXP
> > version.
> 
> If only clock number difference, generally, it is still compatible and can
> be fallback, especialy driver use devm_bulk_clk_get_all().

That's a driver-specific implementation decision, so I don't think it
should be taken into account to decide on compatibility.

> If driver have not sperated drvdata for it, we can fallback to it. It is
> quite common.
> 
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - fsl,imx8qm-mipi-csi2
> >
> > QM is compatible with the QXP, so you don't need to list it here.
> >
> >           contains:
> >             const: fsl,imx8qxp-mipi-csi2
> >
> > is enough to cover both.
> >
> > > +            const: fsl,imx8qxp-mipi-csi2
> > >      then:
> > >        properties:
> > >          reg:
> > >            minItems: 2
> > >          resets:
> > >            maxItems: 1
> > > -    else:
> > > +        clocks:
> > > +          maxItems: 3
> > > +        clock-names:
> > > +          maxItems: 3
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - fsl,imx8mq-mipi-csi2
> > > +    then:
> > >        properties:
> > >          reg:
> > >            maxItems: 1
> > >          resets:
> > >            minItems: 3
> > > +        clocks:
> > > +          maxItems: 3
> > > +        clock-names:
> > > +          maxItems: 3
> > >        required:
> > >          - fsl,mipi-phy-gpr
> > >

-- 
Regards,

Laurent Pinchart

