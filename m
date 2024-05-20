Return-Path: <linux-media+bounces-11657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FE28C9DBC
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 14:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 443421C2294C
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 12:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375EA134407;
	Mon, 20 May 2024 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="NvDy0I0d"
X-Original-To: linux-media@vger.kernel.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF34367;
	Mon, 20 May 2024 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716209739; cv=none; b=cKFwHkIk+Z6aHCWLpDb8z40whcAVXPj7hetEfg0N3/g3WF7W0n9DTjFCpwPBdyV6DT39jll91dlQtjkH1E8vJa1seyABXDY0mGukl7L/XQ01KIgj5EHNL6dKfWOKF+YzKYbalTn18yUSS3vB0Q3NCkW9XcOn4jJa1uWgq0+nTjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716209739; c=relaxed/simple;
	bh=RkEW/qbThbxloaQdnfCPOuT+HvXWKt7cGTbZ0e4p5Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfNwKEGnlCYjLomy6/TpGtV3IwTAI3OcDdj3gZD6BqEw24q3tKJGfxO4/P8h803ot5XG3y/+7o3NhlMi//ekjyCIDbAYzUD7pKFBAuI/smooSaiqx1xSpqgSbVRBMguFUTITrAcJQvg2sid5JKGuzN+4Sxv3JzfwD35ZBAmgdnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=NvDy0I0d; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1716209728; bh=RkEW/qbThbxloaQdnfCPOuT+HvXWKt7cGTbZ0e4p5Es=;
	h=Date:From:To:Cc:Subject:References:From;
	b=NvDy0I0dmTuWkDCWHhVKBamMN6q/XI8ucdAAQJIAvZ39M4cAmV4cIls6DnzFC2Ic7
	 3ENO7rd6b18r8UZIEug4Z4v2lstWLksnrSVYEmTjFd2v84m8lC3GktbA2DG/+pzwYo
	 S3QDAx+RbbWkBDAwbNSbbqNiKIadwjQZjTbDVGnU=
Date: Mon, 20 May 2024 14:55:26 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: git@luigi311.com, linux-media@vger.kernel.org, 
	dave.stevenson@raspberrypi.com, jacopo.mondi@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, 
	phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 21/25] dt-bindings: media: imx258: Add binding for
 powerdown-gpio
Message-ID: <q5nbk3qcxsjsqp4mdyx5nlrn4oie6oynunwodm7r2nwtywc2ey@kxsgcatwt5b2>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, git@luigi311.com, linux-media@vger.kernel.org, 
	dave.stevenson@raspberrypi.com, jacopo.mondi@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, 
	phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240501152442.1072627-1-git@luigi311.com>
 <20240501152442.1072627-22-git@luigi311.com>
 <ZkcV5xWZz2jCszxA@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZkcV5xWZz2jCszxA@kekkonen.localdomain>

On Fri, May 17, 2024 at 08:31:35AM GMT, Sakari Ailus wrote:
> Hi Luis,
> 
> On Wed, May 01, 2024 at 09:24:38AM -0600, git@luigi311.com wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> > 
> > Add powerdown-gpio binding as it is required for some boards.
> 
> I thought the conclusion was that this wasn't a property of the sensor? If
> it needs to be controlled, then this should take place somewhere else than
> in the sensor driver.

It's a property of the sensor modules. It's just optional on
some, eg. (pin 8):

  https://assets-global.website-files.com/63b65bd4974577341e1fe194/654290d4d0fb173e87f754ed_IMX_258_FF_drawing.png

Where else should it be so that the module is described properly in the 
DT and the powerdown signal can be used as part of powerup/down sequence
of the sensor?

regards,
	o.

> > 
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > Signed-off-by: Luis Garcia <git@luigi311.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Pavel Machek <pavel@ucw.cz>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > index c978abc0cdb3..33338139e6e8 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > @@ -36,6 +36,10 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  powerdown-gpios:
> > +    description:
> > +      Reference to the GPIO connected to the PWDN pin, if any.
> > +
> >    reset-gpios:
> >      description: |-
> >        Reference to the GPIO connected to the XCLR pin, if any.
> 
> -- 
> Regards,
> 
> Sakari Ailus

