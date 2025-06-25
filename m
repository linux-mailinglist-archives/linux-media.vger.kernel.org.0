Return-Path: <linux-media+bounces-35909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F976AE8EAF
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 21:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AF7F1C22695
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 19:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040BD2E0B62;
	Wed, 25 Jun 2025 19:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLMMs/1H"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB5D2DCC07;
	Wed, 25 Jun 2025 19:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750879650; cv=none; b=lzv8wcgXhgG+sqV6PG39YzxvrzDnEH9jZg9bLt0UP/7Im5oMLyqFCtVtDVJtUPMA6FK+hjZtTeXxZXcSMzr3mQvzBUS6NgJpBhmUHOocIHS5C5pQw2J6E28VxD9CjJto7QWYuVG95by6cEymc3fi/wH72DmfbgisLFSXHQUCKaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750879650; c=relaxed/simple;
	bh=3+KxWYSRYr+i2rrsePfYRIGA1+vuieUTUyp4a4VljZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdfQcgtic7e290iOfbn3slD2rRaD0/JTW7HPY+G3Jl6pZj8n8CpHJJ1shbE1XuFKmvG2YJ3bo22jK49OUnGsT+TS2wzWpZqUrk46yFppAnNV2Mf60v93jh5j5cYhV/LL9IdvzExzK4K+GjimNszUjX/nHnA+j3yG8RwtF8aBdWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLMMs/1H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960A4C4CEEA;
	Wed, 25 Jun 2025 19:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750879649;
	bh=3+KxWYSRYr+i2rrsePfYRIGA1+vuieUTUyp4a4VljZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLMMs/1H+ZNmKkXWFEstI/NVo87FvFXK4/w7DwKqunRn63z0YvdKyox2jG/7ESXU7
	 HXWYHGS3wLcWBjhG/hOAKbRMKSPv+a6HPksQI48LIug3pYpwSlApoiB1zn6lUv+7Zu
	 Q+SlhSRK7gLrv0sEx6JJg70mJxRZHaOy6zHUVPJHlNucMh7f+kRz7zrseBvsna6gCB
	 rmkEyDq3gqFPlNyAeE9PLPLPFswKIc9pIwcAIAwbQpPIY8BTCkfW5KusOCe0bJ4XAf
	 V1zC+zEt9FaBLGnZamKQoD86+yuKoH3S8zmmKDnIpjtBOkvQfyOyRUkPODp3jlJust
	 Vu7Rv/017I3vQ==
Date: Wed, 25 Jun 2025 14:27:28 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Adam Ford <aford173@gmail.com>,
	Frank Li <Frank.li@nxp.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Purism Kernel Team <kernel@puri.sm>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add
 fsl,num-channels property
Message-ID: <20250625192728.GA2072001-robh@kernel.org>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
 <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
 <CAHCN7xJjR1zZXeJAvkXmdNYroP6Jm6TLjHjnPUOF4z7yaL7EFw@mail.gmail.com>
 <20250609182033.GA11428@pendragon.ideasonboard.com>
 <aEcxN7xClLfp0STx@lizhi-Precision-Tower-5810>
 <20250610081829.GC11428@pendragon.ideasonboard.com>
 <20250619210237.GA21935@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619210237.GA21935@pendragon.ideasonboard.com>

On Fri, Jun 20, 2025 at 12:02:37AM +0300, Laurent Pinchart wrote:
> On Tue, Jun 10, 2025 at 11:18:29AM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 09, 2025 at 03:08:39PM -0400, Frank Li wrote:
> > > On Mon, Jun 09, 2025 at 09:20:33PM +0300, Laurent Pinchart wrote:
> > > > On Mon, Jun 09, 2025 at 12:53:48PM -0500, Adam Ford wrote:
> > > > > On Mon, Jun 9, 2025 at 10:32 AM Frank Li wrote:
> > > > > > On Mon, Jun 09, 2025 at 02:58:38AM +0300, Laurent Pinchart wrote:
> > > > > > > The CSI-2 receiver can be instantiated with up to four output channels.
> > > > > > > This is an integration-specific property, specify the number of
> > > > > > > instantiated channels through a new fsl,num-channels property. The
> > > > > > > property is optional, and defaults to 1 as only one channel is currently
> > > > > > > supported by drivers.
> > > > > > >
> > > > > > > The only known SoC to have more than one channel is the i.MX8MP. As the
> > > > > > > binding examples do not cover that SoC, don't update them.
> > > > > > >
> > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
> > > > > > >  1 file changed, 7 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > > > index db4889bf881e..41ad5b84eaeb 100644
> > > > > > > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > > > @@ -68,6 +68,13 @@ properties:
> > > > > > >      default: 166000000
> > > > > > >      deprecated: true
> > > > > > >
> > > > > > > +  fsl,num-channels:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > +    description: Number of output channels
> > > > > > > +    minimum: 1
> > > > > > > +    maximum: 4
> > > > > > > +    default: 1
> > > > > > > +
> > > > > >
> > > > > > Look like it is fixed value for each compabiable string, So it is not
> > > > > > suitable for adding new property. It should be in driver data of each
> > > > > > compatible strings.
> > > > > >
> > > > > > I met similar case before. DT team generally don't agree on add such
> > > > > > property, unless there are two instances in the same chip, which have
> > > > > > difference channel number.
> > > > >
> > > > > If the DT changes are rejected, can the number of channels be added to
> > > > > the data structure inside mipi_csis_of_match?  We have compatibles for
> > > > > 8mm and imx7.  If we add an imx8mp compatible we could add a reference
> > > > > to the number of channels.
> > > >
> > > > I thought about it, and decided to add a new property because the number
> > > > of channels is really a synthesis time configuration parameter, and
> > > > could differ between different CSIS instances in the same SoC.
> > > 
> > > Need add such information at binding doc's commit message,
> > 
> > I'll update the commit message.
> 
> The commit message in v2 will state
> 
>     dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
> 
>     The CSI-2 receiver can be instantiated with up to four output channels.
>     This is an integration-specific property, specify the number of
>     instantiated channels through a new fsl,num-channels property. The
>     property is optional, and defaults to 1 as only one channel is currently
>     supported by drivers.
> 
>     Using the compatible string to infer the number of channels has been
>     considered, but multiple instances of the same CSIS in the same SoC
>     could conceptually be synthesized with a different number of channels.
>     An explicit property is therefore more appropriate.
> 
>     The only known SoC to have more than one channel is the i.MX8MP. As the
>     binding examples do not cover that SoC, don't update them.

So how many channels does i.MX8MP have in a DT without this property? 
It's either 1 or the driver overrides it to 2.

> Rob, Krzysztof, Conor, are you fine with adding this property ?

Yes, but seems a little late.

Rob

