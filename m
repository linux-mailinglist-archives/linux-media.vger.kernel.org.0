Return-Path: <linux-media+bounces-37484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D32DB01C58
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 14:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58A5F3A4D33
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 12:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4172C0323;
	Fri, 11 Jul 2025 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n5KOLYYp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B31D5258;
	Fri, 11 Jul 2025 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752237987; cv=none; b=A3SKAhC9RG/MN8XHe5aqEGtF7yY9ekt1qDw8Klac9kf1tkXrtvAmGBZHIE8RIaDY7qc/wzLKR8KaPDuG/AU2vXkXgm8feFP2jQWNqj3wEKsvxJ6DPIa8i9bGvcF6MhAt2ZBUCa8O4MajDP+VHq5ynqwyQBjs2VNOOpxU4ebVHio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752237987; c=relaxed/simple;
	bh=jLpXDghepsTlK5wzLEoUadXKueNi53GY9yrnjfOnwKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orneov+SJmBf28nXc/jY+LKbIUr/ROCVpcrnlqnv3ALzrkqxq94KtukSFdm13TaF4cWY7mJjIRe8dVHTcDrfPRnlkKibjAoYWLnOJLTA9cw5QJls5C/3z8DRhoE4rY+e8sHmNiw2cSpksYRi7YUjJZrndVv8GObtbZ0kuqoaaAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n5KOLYYp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5AF06D77;
	Fri, 11 Jul 2025 14:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752237954;
	bh=jLpXDghepsTlK5wzLEoUadXKueNi53GY9yrnjfOnwKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n5KOLYYpkBVwivq56jSYrxvVFTgyRCyVL6yNKtvY5p90zFcMp9WTWzx/Cw2nKs333
	 8nOtzJ2ODQBYfuTZEfFTpEbAdEA4HMRcOJ2g4bnW+MlOR0pk49ura4oDdspT7m1hJC
	 GCo0GhcBRjomeOsWeYycVKGWgZPkXGbcGLktvb8Y=
Date: Fri, 11 Jul 2025 15:45:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 12/72] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor
 node
Message-ID: <20250711124553.GG27674@pendragon.ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-13-laurent.pinchart@ideasonboard.com>
 <214c3d98-d0ee-4806-8c0e-81c1766dd1f0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <214c3d98-d0ee-4806-8c0e-81c1766dd1f0@oss.qualcomm.com>

Hi Konrad,

On Fri, Jul 11, 2025 at 02:25:14PM +0200, Konrad Dybcio wrote:
> On 7/10/25 7:47 PM, Laurent Pinchart wrote:
> > The clock-frequency for camera sensors has been deprecated in favour of
> > the assigned-clocks and assigned-clock-rates properties. Replace it in
> > the device tree.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso      | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> > index 51f1a4883ab8..dbe1911d8e47 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> > @@ -44,7 +44,8 @@ camera@10 {
> >  
> >  		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
> >  		clock-names = "xvclk";
> > -		clock-frequency = <19200000>;
> > +		assigned-clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
> > +		assigned-clock-rates = <19200000>;
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> (although your patches still seem to leave clk_set_rate in
> ov8856.c anyway?)

The call gets removed in patch 69/72 ([1]). It gets replaced by
devm_v4l2_sensor_clk_get_legacy(), which internally calls
clk_set_rate(), so the behaviour is preserved to avoid breaking backward
compatibility with old DTs.

[1] https://lore.kernel.org/linux-media/20250710174808.5361-70-laurent.pinchart@ideasonboard.com

-- 
Regards,

Laurent Pinchart

