Return-Path: <linux-media+bounces-34391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3FAAD2FD2
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 10:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C233D3B4BF3
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 08:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00D9283FC3;
	Tue, 10 Jun 2025 08:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FsuNlTXP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0C283141;
	Tue, 10 Jun 2025 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543526; cv=none; b=RyqiFzziX8S+IR87zUFTr8vVcy74WTt2pTijDJ1fsM1kIYDNkKLfg9vSI11sihpDHDFLPgaISnKCBKIjWpBAJ+T1aLae6T2gNqEWtrEH2dSWEdcbAbAfVAKWTnWhFF4HDQebZ/9mzthi8IHtvEBlbsrPHlPe6mp0HgV3kpO832o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543526; c=relaxed/simple;
	bh=UtUb1iQXrY/a1g4NHyi1atjiccmilNz0yGxCMNeqNKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3KMngQ6SZjq2jVue/7ZtEy9Rr6XHvMe1yGfF7JqVr6kf9O2o/5LMmyKBa9ujYoBVe6r3aOzxvn7WS9iXo+ZRwjRD/7U/HbKpIBdAcq8TvwV+z1CILCGlCwcwAQxjfWLxGK5tDPi0x6S42nlfBaj+kHxNTcAh/LT40SbQFpTUTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FsuNlTXP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EF1B564;
	Tue, 10 Jun 2025 10:18:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749543515;
	bh=UtUb1iQXrY/a1g4NHyi1atjiccmilNz0yGxCMNeqNKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsuNlTXPi/Sg4moEI1TKklrd0QuQm1Xt3GsYEPQHfIAmkCPDy/RF5sh/5/9zAxS6b
	 xzD5+xBFvpzel4jhSA8pEi1zaAqh/cdRqwK41jk1ao4LnesQMfCeeTxYqGkFcLmtck
	 wInQyyRIjOc4Ze92p2+GWQk0mdNbwlujWdx5DHeM=
Date: Tue, 10 Jun 2025 11:18:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add
 fsl,num-channels property
Message-ID: <20250610081829.GC11428@pendragon.ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
 <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
 <CAHCN7xJjR1zZXeJAvkXmdNYroP6Jm6TLjHjnPUOF4z7yaL7EFw@mail.gmail.com>
 <20250609182033.GA11428@pendragon.ideasonboard.com>
 <aEcxN7xClLfp0STx@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEcxN7xClLfp0STx@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Jun 09, 2025 at 03:08:39PM -0400, Frank Li wrote:
> On Mon, Jun 09, 2025 at 09:20:33PM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 09, 2025 at 12:53:48PM -0500, Adam Ford wrote:
> > > On Mon, Jun 9, 2025 at 10:32 AM Frank Li wrote:
> > > > On Mon, Jun 09, 2025 at 02:58:38AM +0300, Laurent Pinchart wrote:
> > > > > The CSI-2 receiver can be instantiated with up to four output channels.
> > > > > This is an integration-specific property, specify the number of
> > > > > instantiated channels through a new fsl,num-channels property. The
> > > > > property is optional, and defaults to 1 as only one channel is currently
> > > > > supported by drivers.
> > > > >
> > > > > The only known SoC to have more than one channel is the i.MX8MP. As the
> > > > > binding examples do not cover that SoC, don't update them.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> > > > >  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
> > > > >  1 file changed, 7 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > index db4889bf881e..41ad5b84eaeb 100644
> > > > > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > @@ -68,6 +68,13 @@ properties:
> > > > >      default: 166000000
> > > > >      deprecated: true
> > > > >
> > > > > +  fsl,num-channels:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    description: Number of output channels
> > > > > +    minimum: 1
> > > > > +    maximum: 4
> > > > > +    default: 1
> > > > > +
> > > >
> > > > Look like it is fixed value for each compabiable string, So it is not
> > > > suitable for adding new property. It should be in driver data of each
> > > > compatible strings.
> > > >
> > > > I met similar case before. DT team generally don't agree on add such
> > > > property, unless there are two instances in the same chip, which have
> > > > difference channel number.
> > >
> > > If the DT changes are rejected, can the number of channels be added to
> > > the data structure inside mipi_csis_of_match?  We have compatibles for
> > > 8mm and imx7.  If we add an imx8mp compatible we could add a reference
> > > to the number of channels.
> >
> > I thought about it, and decided to add a new property because the number
> > of channels is really a synthesis time configuration parameter, and
> > could differ between different CSIS instances in the same SoC.
> 
> Need add such information at binding doc's commit message,

I'll update the commit message.

> ideally provide an example for it.

That I can't provide because the few SoCs I'm working with do not
integrate multiple CSIS instances with different parameters.

> > > > >    ports:
> > > > >      $ref: /schemas/graph.yaml#/properties/ports
> > > > >

-- 
Regards,

Laurent Pinchart

