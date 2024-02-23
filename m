Return-Path: <linux-media+bounces-5802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 192238613D3
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 15:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A6E11C2289B
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 14:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AAE80BE3;
	Fri, 23 Feb 2024 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bs1ZSc9e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64077F7D0;
	Fri, 23 Feb 2024 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708697851; cv=none; b=bWr2NMeeFwh+AI06sATH9ubNZNTRybn1pBDCVNjhxS5VjzEAGyPBbeU6Rh+K9gxRopTSXH7iHaQVpqjnXAiGb6/zPPxRZKWgQfT+fKYRO5Q7sDsA7kOLaKC4EsrSAlyf7lj8dZwzyQtik9Fmjo59QSm1PqeYh/uM4qtHh/3OntA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708697851; c=relaxed/simple;
	bh=qTSb8BoFyUBcgMEpFbXgOKysTONG/bgaNnkHx8c8d2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sI420yDT7UgJP9Baq2qGS7Dl9LCrjtIFGuj8nDei31B+hL1jPdG8Ox568mNzwwQgy9NzbZSiGVnbVSQTO39u7ZtBtCUQGlT9uy7QythYntpAOFAKpTZgUUfvZ2290WlAcEIqYBKwDAK8v4qbe7p3zDKuWfWPtMk5rrQUh5y7eSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Bs1ZSc9e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDBEE9B6;
	Fri, 23 Feb 2024 15:17:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708697839;
	bh=qTSb8BoFyUBcgMEpFbXgOKysTONG/bgaNnkHx8c8d2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bs1ZSc9eJYd86bVbGvGEMgUIuI11pVzRaHxnF/ys+VUE8ET/hMsmu9FPEMSgbDlOi
	 9aH9X5uTOKwJMKr88btC2/wmv3u9i9ZnzI3rnSB3mWvanlc0bZiib61Hq9+Z/ThD9W
	 suSeJdlmsmznCDOh6P/8bm8COv1FgDBdBP7hpoiQ=
Date: Fri, 23 Feb 2024 16:17:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: dt-bindings: nxp,imx8-isi: Allow single port
 for single pipeline models
Message-ID: <20240223141731.GB1313@pendragon.ideasonboard.com>
References: <20240223140445.1885083-1-alexander.stein@ew.tq-group.com>
 <20240223140445.1885083-3-alexander.stein@ew.tq-group.com>
 <20240223141630.GA1313@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240223141630.GA1313@pendragon.ideasonboard.com>

On Fri, Feb 23, 2024 at 04:16:31PM +0200, Laurent Pinchart wrote:
> Hi Alexander,
> 
> Thank you for the patch.
> 
> On Fri, Feb 23, 2024 at 03:04:44PM +0100, Alexander Stein wrote:
> > In case the hardware only supports just one pipeline, allow using a
> > single port node as well.
> 
> This is frowned upon in DT bindings, as it makes them more complicated
> for little gain. The recommendation is to always use a ports node if a
> device can have multiple ports for at least one of its compatibles.

And reading the cover letter, I see this causes warnings. I think we
need guidance from Rob on this.

> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > index 4d5348d456a1f..f855f3cc91fea 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > @@ -53,6 +53,12 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >  
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: |
> > +      Port representing the Pixel Link input to the ISI. Used for
> > +      single-pipeline models. The port shall have a single endpoint.
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      description: |
> > @@ -66,7 +72,6 @@ required:
> >    - clocks
> >    - clock-names
> >    - fsl,blk-ctrl
> > -  - ports
> >  
> >  allOf:
> >    - if:
> > @@ -87,6 +92,11 @@ allOf:
> >              port@1: false
> >            required:
> >              - port@0
> > +      oneOf:
> > +        - required:
> > +            - port
> > +        - required:
> > +            - ports
> >  
> >    - if:
> >        properties:
> > @@ -106,6 +116,8 @@ allOf:
> >            required:
> >              - port@0
> >              - port@1
> > +      required:
> > +        - ports
> >  
> >  additionalProperties: false
> >  

-- 
Regards,

Laurent Pinchart

