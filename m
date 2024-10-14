Return-Path: <linux-media+bounces-19594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2994F99C70A
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 12:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C86CC1F230E3
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 10:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97FA15C136;
	Mon, 14 Oct 2024 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvC4t6/f"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E1E156676;
	Mon, 14 Oct 2024 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728901263; cv=none; b=dihIDf7A+Ep9liEJCWXlxqbXSfLdM7+VX/X88eB1KTHocBLl8bPmphHXfm+xlFybWWLb9JaN91GenpRGs8LoTYTzyQXaPpRg3Pvoyn18kFeRsbGLa986ujHfH8IvBhI1P4tdW8yb1HZ8N2OgI37wq1CIPLPjKW3+2haSf523aAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728901263; c=relaxed/simple;
	bh=NX1n+qdicUkZyC+SXzciZ/SjHBzSBusQnlPixrangjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEYs934QsPAbh+1YrYqOB23KATHBVBCdBIEE0kOQsM4VMtcYd2PDvbjtBwXiPlXTOJQSOTYGdpcBdIkkF3qDxiy2sNvZHFUpGl6n6Pfjk6fHZ+wy7C4vzE3wT9IcqeaKJPAZDBfZlCr2a5RhbKgTgCCPlUm/S3HNGVCMZe64bmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VvC4t6/f; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728901262; x=1760437262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NX1n+qdicUkZyC+SXzciZ/SjHBzSBusQnlPixrangjA=;
  b=VvC4t6/fh3AOz9bkWW6vqCi5ZNfCf3hpyNB40Cm80GeOWX7rxU/i05xB
   +biKjwe8miJgpG8dpOwU5mSjIm0wQjDMMIJklrzHsiK/fl0gIdknkqWg/
   HBjkcDHP4BoAWEEowq55Y+0MbyUd7bli8nUu2td+rnCpehDnl+UKykRvq
   ngp9E45y8EBBDNwow7FDubVC645QUHAssRl12ZbG0n2dAO/d6OVeAElqY
   u+xb8f7VyctBTzmGRuOBYqRmiXf/IZVx1h5AJNvPBwzshAad4ZlzhILp4
   KZQ3s6lrBoC4TMV0basmC5ARKJUDGAKHCoURaXQG79HH+TXvpfGxLNYop
   w==;
X-CSE-ConnectionGUID: ocB+DX1HQsWmHzkSsYvjNg==
X-CSE-MsgGUID: MHNs0dQrTISu+tjM8lXvtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53661531"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="53661531"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 03:21:01 -0700
X-CSE-ConnectionGUID: eWs8iXt7TmS7DLowp/iWqg==
X-CSE-MsgGUID: 7kHTV7WwStekEMnHdALu/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77461389"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 03:20:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9F82011F855;
	Mon, 14 Oct 2024 13:20:50 +0300 (EEST)
Date: Mon, 14 Oct 2024 10:20:50 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
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
	Todor Tomov <todor.too@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] media: dt-bindings: Remove assigned-clock-* from
 various schema
Message-ID: <ZwzwgkBQzUZJWMvi@kekkonen.localdomain>
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-1-a2bb12a1796d@linaro.org>
 <w4ta26svh34gojqpakrgp5cpsempedkewkmbllyvs5z5fm274z@jqs3tvunxq2s>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w4ta26svh34gojqpakrgp5cpsempedkewkmbllyvs5z5fm274z@jqs3tvunxq2s>

Hi Krzysztof,

On Mon, Oct 14, 2024 at 09:43:07AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Oct 12, 2024 at 04:02:50PM +0100, Bryan O'Donoghue wrote:
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
> 
> File should rather stay as is.

...

> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > index c978abc0cdb35cfe2b85069946cf1be435a58cb8..f0f9726a2add89492b8c56e17ed607841baa3a0d 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > @@ -24,10 +24,6 @@ properties:
> >        - sony,imx258
> >        - sony,imx258-pdaf
> >  
> > -  assigned-clocks: true
> > -  assigned-clock-parents: true
> > -  assigned-clock-rates: true
> > -
> 
> This is ok.

Basically the clock related requirements for these devices are the same:
they all need a clock configured at a board specific frequency. Shouldn't
we treat them the same way?

-- 
Kind regards,

Sakari Ailus

