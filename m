Return-Path: <linux-media+bounces-19690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B8D99F317
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 18:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C41C31C213F2
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 16:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409DB1F9EA0;
	Tue, 15 Oct 2024 16:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCsBMBtc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915961D5169;
	Tue, 15 Oct 2024 16:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729010771; cv=none; b=PaIkHJ46uMXqyAn8HfJKwiryxl61JNXda65VC5/MD9p2tNv1TcR97z60DP1ZTUo/ffZ30+tawZUveEQT7RxOIR/8K0YNN08+Q+NiXAb0ujASqe+LLrM8DOubjP0hMD+q4eTUOxFS3z08CpkxuG75iwLlCGpMNTuRRoCWFpBRylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729010771; c=relaxed/simple;
	bh=ty485hgQRf36tvCdf7hLCpqH8wPJP/ov3etpcqFjYBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A55+WbkrObhGcxpWS9TXBHU/l6BgCg0SLECN0RuErtsBgNE7UlPNDhVwZr3yFae26RVMYpuEXxnw01NKS88Tfs5uwP/pWl7PFOc3mCuAO6MwkLHeOw/LacyFTGNYhNuPT8kJsAzE7ZJ7p6tetaX3m9Tb2R5sfL8Cp0gY4bqBClw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCsBMBtc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9660C4CEC6;
	Tue, 15 Oct 2024 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729010771;
	bh=ty485hgQRf36tvCdf7hLCpqH8wPJP/ov3etpcqFjYBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCsBMBtcCWJ6BusDVYweMMvwHStKIq9JHRukZj/8ReMVp/piTWhlQAiNOCUn00IDT
	 KW9tfaN4Op8u0JikMfXBgS8HaSOBo1FDnUsHzFJb8e2UKdW5s8G8zg6taztjhTeWe/
	 G+THbdgIw4Nuezq2itQRuQJsHwJe71+7nQOsgS/XVanPnTEIUAgIgBsb+jU2qut9iz
	 NwIRhfqgXLwcaEABQk4e3E0zK/8Y7JpwEB2RMc5napn7msbHYyNRA5oN8zEXA/+fcB
	 MthVhQ4oWpMs9mJZXhusjDSHsRhA6yIuTYJkhI9l4CvKuLDbKKg67vLo/JKFzjWw0x
	 q1MKryp1rv7vw==
Date: Tue, 15 Oct 2024 11:46:09 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Message-ID: <20241015164609.GA1235530-robh@kernel.org>
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-1-a2bb12a1796d@linaro.org>
 <w4ta26svh34gojqpakrgp5cpsempedkewkmbllyvs5z5fm274z@jqs3tvunxq2s>
 <20241014203441.GF5522@pendragon.ideasonboard.com>
 <b0154e75-370e-4a5f-9309-6a3ae5d85b5c@kernel.org>
 <20241015112922.GB2712@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015112922.GB2712@pendragon.ideasonboard.com>

On Tue, Oct 15, 2024 at 02:29:22PM +0300, Laurent Pinchart wrote:
> On Tue, Oct 15, 2024 at 08:13:19AM +0200, Krzysztof Kozlowski wrote:
> > On 14/10/2024 22:34, Laurent Pinchart wrote:
> > > On Mon, Oct 14, 2024 at 09:43:07AM +0200, Krzysztof Kozlowski wrote:
> > >> On Sat, Oct 12, 2024 at 04:02:50PM +0100, Bryan O'Donoghue wrote:
> > >>> Remove extraneous assigned-clock* from media/i2c/* schemas, retain in the
> > >>> relevant examples.
> > >>>
> > >>> Link: https://lore.kernel.org/linux-media/j7kgz2lyxnler5qwd7yiazdq6fmsv77kyozdrxf33h54ydakjz@uqjhwhoyv6re
> > >>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > >>> ---
> > >>>  Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml | 8 --------
> > >>>  Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml | 8 --------
> > >>>  Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml | 8 --------
> > >>>  Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml | 4 ----
> > >>>  Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 ----
> > >>>  Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml | 4 ----
> > >>>  Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 4 ----
> > >>>  Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 4 ----
> > >>>  8 files changed, 44 deletions(-)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > >>> index 60f19e1152b33128cf3baa15b8c70a874ca6d52e..d18ead8f7fc43bfacc291aed85b5ca9166c46edb 100644
> > >>> --- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > >>> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > >>> @@ -28,12 +28,6 @@ properties:
> > >>>      items:
> > >>>        - description: Reference to the mclk clock.
> > >>>  
> > >>> -  assigned-clocks:
> > >>> -    maxItems: 1
> > >>> -
> > >>> -  assigned-clock-rates:
> > >>> -    maxItems: 1
> > >>> -
> > >>>    reset-gpios:
> > >>>      description: Reference to the GPIO connected to the RESETB pin. Active low.
> > >>>      maxItems: 1
> > >>> @@ -82,8 +76,6 @@ required:
> > >>>    - compatible
> > >>>    - reg
> > >>>    - clocks
> > >>> -  - assigned-clocks
> > >>> -  - assigned-clock-rates
> > >>
> > >> That's not extraneous, but has a meaning that without assigned-clocks
> > >> this device or driver will not operate.
> > > 
> > > How so ? Even if we assume that the device requires a specific clock
> > > frequency (which is often not the case for camera sensors, the
> > > limitation usually comes from drivers, so the constraint shouldn't be
> > > expressed in the bindings in that case), there is no overall requirement
> > > to assign a clock rate as in many cases the clock will come from a
> > > fixed-frequency oscillator. This seems to be a constraint that is
> > > outside of the scope of DT bindings. It is similar to regulators, where
> > > the regulator consumer doesn't have a way to express supported voltages
> > > in its DT bindings.
> > 
> > This property does not say it comes from a fixed-frequency oscillator,
> > so I do not understand why you think it is unreasonable constraint. I
> > have no clue what the author wanted to say here, so I just explained
> > that there is a meaning behind requiring such properties. If you claim
> > device or implementations do not have such requirement, after
> > investigating each case, feel free to drop this. I think I also stated
> > this already in other reply.
> 
> For camera sensor drivers I'm pretty sure we can drop those properties
> when they're marked as required, as there's no intrinsic characteristics
> of camera sensors that would require assigned-clock*.

I tend to agree, and would take it one step further to say that applies 
everywhere. Whatever clock setup needed is outside the scope of a 
binding. The simplest case is all input clocks are fixed. The next 
simplest case is firmware did all clock setup needed for a specific 
board and the boot time default works.

Rob

