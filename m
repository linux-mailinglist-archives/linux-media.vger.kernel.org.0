Return-Path: <linux-media+bounces-18961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8625598CD12
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 08:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D4101F2499E
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 06:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8581C84FA0;
	Wed,  2 Oct 2024 06:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dD8OP0a4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A842581;
	Wed,  2 Oct 2024 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727850135; cv=none; b=NuHWosN54/t66xnFJckE7HhSe/krps4GVWo24+2RTWW24KAKDZR85CTiFWaydez35y9gdU5aqfJcE+VugbzQCq2Zz+QVnmrEqdRerZZ3XB1SNIj5PBg8HDvZ+so2nnO47FtA0yTr7zP7ZTwJV1/eQSCnnwSRtKZvMaKnUgQ3gZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727850135; c=relaxed/simple;
	bh=PmeA3OtrjHpyLrolkdEGipGix/uilMWDBiD1mULTjO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKzJTKYfLtD+UxYunweXh1X/NufwuO0PgkMZH2tPPhx+oO+yb3vQcPboVJfG4ubH3b1SF9L8aUeZg97Xv/GKdnzTwHwk4xCM1SD0OVshhQpXKm3UG2KIa3OIK3x1HkYF3SenxexPGbDPiAFq0KYcU6ltfLO14IJkq0cBvkEPcZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dD8OP0a4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770C2C4CEC5;
	Wed,  2 Oct 2024 06:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727850134;
	bh=PmeA3OtrjHpyLrolkdEGipGix/uilMWDBiD1mULTjO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dD8OP0a4/yAFu/uvTFXRMi35CUmJM/iq5P94CvUh/jPaCyqx5RgLarkjU77zXdT8i
	 KXX6pnaW6nXTcHg8w1hNGco9fXJf+T+YOhJ2hwsPMta8oEe8DDHf21dceNsviLD1vA
	 NJecpaLzUAYuHSWZtkXeY9req4LNUoa9q2FLVNiQGpenWZ7e15vMizz3R9R+8P7E+B
	 9eMBaGgpUpDKd6DUd/tuc5C7RdwEo41V/HTonp/xp1q7trLNycZJtMSlT5sAoJjiOj
	 Xb2Lw3pdxo+z5x1ewyA9Ek55m+JSKAJYLUjBdHpb+I5LU8hr5HkKX/W+plWAXZio5S
	 Xj3IhaFbqMDRA==
Date: Wed, 2 Oct 2024 08:22:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jason Chen <jason.z.chen@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <j7kgz2lyxnler5qwd7yiazdq6fmsv77kyozdrxf33h54ydakjz@uqjhwhoyv6re>
References: <20241001-b4-master-24-11-25-ov08x40-v2-0-e478976b20c1@linaro.org>
 <20241001-b4-master-24-11-25-ov08x40-v2-2-e478976b20c1@linaro.org>
 <Zvv3kM1wWDiRCCiA@kekkonen.localdomain>
 <95d7d695-89d2-4c1d-99f6-4f9a687f7d13@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <95d7d695-89d2-4c1d-99f6-4f9a687f7d13@linaro.org>

On Tue, Oct 01, 2024 at 02:47:43PM +0100, Bryan O'Donoghue wrote:
> On 01/10/2024 14:22, Sakari Ailus wrote:
> > > +  assigned-clocks: true
> > > +  assigned-clock-parents: true
> > > +  assigned-clock-rates: true
> > As much as I'd like to see these mandatory, there seem to be cases where
> > they can't be used. Therefore I'd leave them in the example only.
> > 
> > If that turns out to be the only change to do, I can also handle that while
> > applying.
> 
> So I took Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml as
> the reference for this.
> 
> Without listing "assigned-clock*" in the required: field I believe the dts
> checkers will not require those.
> 
> So instead of saying
> assigned-clocks:
>     maxItems: 1
> 
> we write
> assigned-clocks: true
> 
> omit from "required:" and get the desired effect.
> 
> For example this passes the checker for me.
> 
> &cci1_i2c1 {
>         camera@36 {
>                 compatible = "ovti,ov08x40";
>                 reg = <0x36>;
> 
>                 reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&cam_rgb_default>;
> 
>                 clocks = <&camcc CAM_CC_MCLK4_CLK>;
>                 assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
>                 assigned-clock-rates = <19200000>;
> 
>                 orientation = <0>; /* front facing */
> 
>                 avdd-supply = <&vreg_l7b_2p8>;
>                 dvdd-supply = <&vreg_l7b_2p8>;
>                 dovdd-supply = <&vreg_l3m_1p8>;
> 
>                 port {
>                         ov08x40_ep: endpoint {
>                                 clock-lanes = <0>;
>                                 data-lanes = <1 2 3 4>;
>                                 link-frequencies = /bits/ 64 <400000000>;
>                                 remote-endpoint = <&csiphy4_ep>;
>                         };
>                 };
>         };
> };
> 
> Eh.. at least that's how I think this works.
> 
> Krzysztof/Rob ?

What is the question? You should not have assigned-* properties in the
schema. Example is fine.

Best regards,
Krzysztof


