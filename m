Return-Path: <linux-media+bounces-19631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2250799D848
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 22:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1F6E1F234E8
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 20:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8F31D0E05;
	Mon, 14 Oct 2024 20:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QyxhfCJh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9004C7C;
	Mon, 14 Oct 2024 20:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728938095; cv=none; b=ptatjZtpefUgAUELeHLk6G7WJo8wlVRxVAkRiiWBA6ytSGfqhhRec96RPmlPpdrfK+z3mLeGNu+kS3U97Ge1I4LgoOkTfh5R3aEm6inIBTDyI7noMKuhE/yNnkqQdzoSk2b/dU1oGgOhM+uVnvoHXDzUpDA57NliiDSDy9Xlx1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728938095; c=relaxed/simple;
	bh=Lk4I6UURrH3IQswz39h4iub5KOG09WnFz6iqw+Qh2c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqgl0GPbZEH6G7Y4hpciWaAF5ococCNx8PyhxUb/pxdabL41jzRxnWOuf1SiPud+HFO0q1Ryc1vaiuJZfUbF6OaJjfpUEhyuhbg/x/ctC7CpqIaRp7lZLo7cAH15R382V5AT7QBJZ6TOsp5Zj3Ynl9Z4Npjotek8ciNTIz9ym0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QyxhfCJh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [23.233.251.139])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F24A71A7D;
	Mon, 14 Oct 2024 22:33:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728937990;
	bh=Lk4I6UURrH3IQswz39h4iub5KOG09WnFz6iqw+Qh2c4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QyxhfCJhunR/Xb9ItJfdPZNAZ6mYdQj27QWwv2Du955G5zLoPClW+Vk055gwMLbTi
	 fFxioz/SvtwVJsDt148PYGPeAPMjhnWXBogFCM0Kte8uo6nL3dRfr7nsDOfTIFVTle
	 /xpqnFB1CLB37dhtKZGLKaJAwXG1jVYD6vo1j8I4=
Date: Mon, 14 Oct 2024 23:34:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Todor Tomov <todor.too@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] media: dt-bindings: Remove assigned-clock-* from
 various schema
Message-ID: <20241014203441.GF5522@pendragon.ideasonboard.com>
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-1-a2bb12a1796d@linaro.org>
 <w4ta26svh34gojqpakrgp5cpsempedkewkmbllyvs5z5fm274z@jqs3tvunxq2s>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <w4ta26svh34gojqpakrgp5cpsempedkewkmbllyvs5z5fm274z@jqs3tvunxq2s>

On Mon, Oct 14, 2024 at 09:43:07AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Oct 12, 2024 at 04:02:50PM +0100, Bryan O'Donoghue wrote:
> > Remove extraneous assigned-clock* from media/i2c/* schemas, retain in the
> > relevant examples.
> > 
> > Link: https://lore.kernel.org/linux-media/j7kgz2lyxnler5qwd7yiazdq6fmsv77kyozdrxf33h54ydakjz@uqjhwhoyv6re
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml | 8 --------
> >  Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml | 8 --------
> >  Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml | 8 --------
> >  Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml | 4 ----
> >  Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 ----
> >  Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml | 4 ----
> >  Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 4 ----
> >  Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 4 ----
> >  8 files changed, 44 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > index 60f19e1152b33128cf3baa15b8c70a874ca6d52e..d18ead8f7fc43bfacc291aed85b5ca9166c46edb 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > @@ -28,12 +28,6 @@ properties:
> >      items:
> >        - description: Reference to the mclk clock.
> >  
> > -  assigned-clocks:
> > -    maxItems: 1
> > -
> > -  assigned-clock-rates:
> > -    maxItems: 1
> > -
> >    reset-gpios:
> >      description: Reference to the GPIO connected to the RESETB pin. Active low.
> >      maxItems: 1
> > @@ -82,8 +76,6 @@ required:
> >    - compatible
> >    - reg
> >    - clocks
> > -  - assigned-clocks
> > -  - assigned-clock-rates
> 
> That's not extraneous, but has a meaning that without assigned-clocks
> this device or driver will not operate.

How so ? Even if we assume that the device requires a specific clock
frequency (which is often not the case for camera sensors, the
limitation usually comes from drivers, so the constraint shouldn't be
expressed in the bindings in that case), there is no overall requirement
to assign a clock rate as in many cases the clock will come from a
fixed-frequency oscillator. This seems to be a constraint that is
outside of the scope of DT bindings. It is similar to regulators, where
the regulator consumer doesn't have a way to express supported voltages
in its DT bindings.

> File should rather stay as is.
> 
> >    - vddio-supply
> >    - vdda-supply
> >    - vddd-supply

[snip]

-- 
Regards,

Laurent Pinchart

