Return-Path: <linux-media+bounces-46207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C134C2BA68
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 13:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69DE618957AC
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 12:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736DB30CDAB;
	Mon,  3 Nov 2025 12:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="APEaBeGR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931B52D0C92;
	Mon,  3 Nov 2025 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172617; cv=none; b=RexqJGkzFRigtmDdXRNunGMIg1BLlwy3a+NJ7BsFbH9+/6IB1J5x++VH5w3wdLn1Vbp04sPSsjuL9zwHkESf7zNIv01r0HvvrK45+ttp2FdqCIOxf5ko6Q0/lGOpP7stc1BnIRQ617GsQouQfku77IbCVlOed/8mjVPK7L1umbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172617; c=relaxed/simple;
	bh=HEShMzZKAsuD2pJQ1j+0chm5T3Nli1m/xpt2pjx+ejY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6+nXcJ5gTe+r2CLoiRbZwtXGNvAQQlPs5JVoZxLwlC/vFebG52W903G8SAkWbO6u/En+mKHNPdy8roEKogOYL916U5wUW4n+qarbUCRqmmlzH0jzL0KHwfe8+GD5UFKnh7zQVuPtQSH0oA3p9t7CpMUsDxP9FWyjArEscZAozQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=APEaBeGR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E5E7F99F;
	Mon,  3 Nov 2025 13:21:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762172501;
	bh=HEShMzZKAsuD2pJQ1j+0chm5T3Nli1m/xpt2pjx+ejY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APEaBeGRxHqPYPNuEVrAcHNep/jjdgFLhbG9UWla37ARJU0RUb2V20wikG9Y5WtAc
	 Jb4OimaCU+KfrW35gTqmK6nrnaMqy7Fc2sdC9dX8JXa9q5w610E5Tw1iy8FiYPCvLl
	 5s+Pl1rwsehi3cDP7nFSXLUHRSe9QB8r3+d+yUkc=
Date: Mon, 3 Nov 2025 14:23:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI
 compatible string
Message-ID: <20251103122320.GT27255@pendragon.ideasonboard.com>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
 <20251024-isi_imx95-v1-1-3ad1af7c3d61@nxp.com>
 <aPuAVqVUHjrPCbIH@lizhi-Precision-Tower-5810>
 <20251026220438.GG13023@pendragon.ideasonboard.com>
 <aP/F3joJ0RnL0G1z@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP/F3joJ0RnL0G1z@lizhi-Precision-Tower-5810>

On Mon, Oct 27, 2025 at 03:19:58PM -0400, Frank Li wrote:
> On Mon, Oct 27, 2025 at 12:04:38AM +0200, Laurent Pinchart wrote:
> > On Fri, Oct 24, 2025 at 09:34:14AM -0400, Frank Li wrote:
> > > On Fri, Oct 24, 2025 at 05:46:52PM +0800, Guoniu Zhou wrote:
> > > > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > >
> > > > The ISI module on i.MX95 supports up to eight channels and four link
> > > > sources to obtain the image data for processing in its pipelines. It
> > > > can process up to eight image sources at the same time.
> > > >
> > > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > > ---
> > > >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 26 +++++++++++++++++++++-
> > > >  1 file changed, 25 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..eaab98ecf343a2cd3620f7469c016c3955d37406 100644
> > > > --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > @@ -23,6 +23,7 @@ properties:
> > > >        - fsl,imx8mp-isi
> > > >        - fsl,imx8ulp-isi
> > > >        - fsl,imx93-isi
> > > > +      - fsl,imx95-isi
> > > >
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -49,7 +50,7 @@ properties:
> > > >    interrupts:
> > > >      description: Processing pipeline interrupts, one per pipeline
> > > >      minItems: 1
> > > > -    maxItems: 2
> > > > +    maxItems: 8
> > > >
> > > >    power-domains:
> > > >      maxItems: 1
> > > > @@ -109,6 +110,29 @@ allOf:
> > > >              - port@0
> > > >              - port@1
> > > >
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: fsl,imx95-isi
> > > > +    then:
> > > > +      properties:
> > > > +        interrupts:
> > > > +          maxItems: 8
> > >
> > > should minItems: 8 because you already limit maxItems at top;
> >
> > As far as I understand, when no "items" are specified, minItems defaults
> > to 1, and maxItems defaults to minItems (if specified) or 0 (if minItems
> > is not specified). This is implemented in dtschema/lib.py of
> > https://github.com/devicetree-org/dt-schema.git.
> >
> > Then, in dtschema/fixups.py, if only one of minItems or maxItems is
> > specified, the other one is set to the same value. I believe relying on
> > this is frowned upon by the DT maintainers.
> >
> > We could specify minItems only here, as the top-level constraint will
> > ensure we don't go over 8. That's not very future-proof though, so I
> > think specifying both minItems and maxItems would be best. Confirmation
> > from a DT maintainer would be appreciated.
> 
> I pretty sure I am correct. please below thread, I met many similar cases
> before.
> https://lore.kernel.org/imx/72c29785-eb7a-4cc8-a74c-3aad50129a23@kernel.org/

I discussed this with Krzysztof on IRC last week. He said that in
conditional statements, both minItems and maxItems should be set, except
when one of them is a border constraint (being the same as the top-level
constraint). In that case it can be omitted.

So in this particular case you're right, we should specify minItems
here, not maxItems.

> > The fsl,imx8mp-isi block above should then be fixed. It currently only
> > has maxItems set, minItems should be set to 2 as well.

The fsl,imx8mp-isi conditional block should specify both minItems and
maxItems, and set both to 2.

> >
> > > > +        ports:
> > > > +          properties:
> > > > +            port@0:
> > > > +              description: Pixel Link Slave 0
> > > > +            port@1:
> > > > +              description: Pixel Link Slave 1
> > > > +            port@2:
> > > > +              description: MIPI CSI-2 RX 0
> > > > +            port@3:
> > > > +              description: MIPI CSI-2 RX 1
> > > > +          required:
> > > > +            - port@2
> > > > +            - port@3
> > > > +
> > >
> > >      else
> > >        properties:
> > >          interrupts:
> > >            maxItem: 2
> > >
> > > to keep the same restriction for existed compatible string.
> >
> > We already specify the number of interrupts in two separate conditional
> > blocks above, with any else statement (for all but fsl,imx8mp-isi first,
> > and then for fsl,imx8mp-isi). Both specify maxItems, so I think we're
> > fine.
> >
> > > >  additionalProperties: false
> > > >
> > > >  examples:

-- 
Regards,

Laurent Pinchart

