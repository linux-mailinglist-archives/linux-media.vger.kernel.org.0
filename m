Return-Path: <linux-media+bounces-16947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B0496194E
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 23:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD6E42852C5
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 21:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C8A1D1F59;
	Tue, 27 Aug 2024 21:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L7qIrfat"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F7876056;
	Tue, 27 Aug 2024 21:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724794489; cv=none; b=WWdxmty1jPyMRiSsZ7y30Ksl5V3kz8SBnorIornayOh0RwNfcmbDJ1BIx2igkLGhakOuw6RM2y6K/N7B5uYdZvzekmiMt3khLTx/vuv1xXV/hhqWW+ZY0SIlS3AgsCsbW/cDm7q8A1PvdQRTih45p7TQYjrqlZP0TyrPNZw8SEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724794489; c=relaxed/simple;
	bh=ir4QV+tGBPZRd093w4QuLzQaIVhiXZOJklJB07kYoJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DM80uF2eWEw6ujlNAlCDSJXfJt/kPXlDB4niOxH8iWT5CUPAjPxU/TOjJju/5VspA5PSv/Benn2xsU6X/bulT3S2FJ7xUMkiVLsfWL3mcN7Pny2RrCaFG159yD2nEAXt+dDfYfAkZdE2lUxM01osMramkK7THdwS/iIRS20diTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L7qIrfat; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADA404C9;
	Tue, 27 Aug 2024 23:33:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724794418;
	bh=ir4QV+tGBPZRd093w4QuLzQaIVhiXZOJklJB07kYoJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7qIrfatxuAYtbYR7Vb5F+TuCMMJ9tujmaEJ2vm8TBo7SwkeU8slUgXEFSwEDxypZ
	 gukG2GSqVEIR7/mJxpiN2jFsrBIFMQ/X0Bz5G+wZLTlOhjOYelKcznNsWMa9Kc8St0
	 FjccKtCtt6mw33FKsOjHTftSb9ZC49yYv2JS3hfU=
Date: Wed, 28 Aug 2024 00:34:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: media: renesas,isp: Add Gen4 family
 fallback
Message-ID: <20240827213441.GA30398@pendragon.ideasonboard.com>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-2-niklas.soderlund+renesas@ragnatech.se>
 <cnca2gdh6c3kg5ybb4dxzlca5c7jsvz4tomibpkf746syejvmf@ndbq4qkykume>
 <20240827081233.GE2636928@fsdn.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827081233.GE2636928@fsdn.se>

On Tue, Aug 27, 2024 at 10:12:33AM +0200, Niklas Söderlund wrote:
> On 2024-08-27 08:31:22 +0200, Krzysztof Kozlowski wrote:
> > On Mon, Aug 26, 2024 at 04:43:47PM +0200, Niklas Söderlund wrote:
> > > The ISP Channel Selector IP is the same for all current Gen4 devices.
> > > This was not known when adding support for V3U and V4H and a single SoC
> > > specific compatible was used.
> > > 
> > > Before adding more SoC specific bindings for V4M add a family compatible
> > > fallback for Gen4. That way the driver only needs to be updated once for
> > > Gen4, and we still have the option to fix any problems in the driver if
> > > any testable differences between the SoCs are found.
> > > 
> > > There are already DTS files using the V3U and V4H compatibles which
> > > needs to be updated to not produce a warning for DTS checks. The driver
> > > also needs to kept the compatible values to be backward compatible , but
> > > for new Gen4 SoCs such as V4M we can avoid this.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > > * Changes since v1
> > > - New in v2.
> > > ---
> > >  Documentation/devicetree/bindings/media/renesas,isp.yaml | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > > index 33650a1ea034..730c86f2d7b1 100644
> > > --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > > @@ -22,6 +22,7 @@ properties:
> > >        - enum:
> > >            - renesas,r8a779a0-isp # V3U
> > >            - renesas,r8a779g0-isp # V4H
> > > +      - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
> > 
> > Adding generic fallback post-factum is odd, does not feel reliable.
> > Instead use specific compatibles as fallbacks.
> 
> I agree, it feels a bit odd. But this was the road we hammered out at 
> great pain for how to be able to move forward with this issue for the 
> other IP block involved in video capture for R-Car Gen4, VIN [1]. This 
> just mirrors that long discussion decision for the R-Car CSISP.
> 
> I would hate to have different solutions for the two.
> 
> 1. [PATCH v5 0/6] rcar-vin: Add support for R-Car V4M
>    https://lore.kernel.org/all/20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se/

The compatible fallback for VIN has been added following a request from
Conor and Rob, so it would be nice if the three of you could agree to
achieve consistency in the bindings :-)

-- 
Regards,

Laurent Pinchart

