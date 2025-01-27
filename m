Return-Path: <linux-media+bounces-25302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E64ADA1D196
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 08:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F63F3A1CEC
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 07:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB2F1FC11E;
	Mon, 27 Jan 2025 07:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lV3RnbLe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF55C18D;
	Mon, 27 Jan 2025 07:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737963457; cv=none; b=ohuwY1ifMJxQLpFpeWbOMAfycK4FXgKyti/YcNKlKKCgRL+d2x2CsKBtmCHUJsQ9hww3g8X08QvtRcdpgxiEx6WRyF+ecv3p5u3gbd/ULsFd+r4OCdZCVN8dmqo0xyBAEnA4mDaQWLrj2KaxISvsG+iNTOUWiTFYizHnAJ8yrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737963457; c=relaxed/simple;
	bh=5eb2rU3BF+D0RBJuXDQEOE41vu4w7shDYZUOwzVVpow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfuxhDFUnkr3ZX4j3m5HehxyXc4PfaI6Y9gPEMTJxCO13dGQnwbIiYQIb3QoYZdXJkhr5sgE/rZQOKDJRudVxFXhMLpsmX0FhRiX5tcRQ58pBtie0+LhPWtHwQR1whVi9liuVzcbfw+vsQ9FXpMo4XLNXwJE7naC2niBVesK0Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lV3RnbLe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A50FC4CEE9;
	Mon, 27 Jan 2025 07:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737963456;
	bh=5eb2rU3BF+D0RBJuXDQEOE41vu4w7shDYZUOwzVVpow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lV3RnbLeaUOWGQK4HsADgHp9gFT21H/I88uErXlhYiJuf7yXEafWE61sZ883LEZpL
	 LrPw/4QczreFVat08H4rnaBiiBm5wzjzergbeogpzy+yFOOb2tVD0rLprDMI0yxZZA
	 oU6r+ICgnnsTbhZTbxpBXtOcOAJqZysNL74FJTIJl0edjtPOvKIKu6eSzyoCalr0r1
	 qHN7Oe6KLnPwapMMiv0o5ioamyLvz/6i9ricjY9HAQMayx61asJFc7aB5s1PfkdUh3
	 EylOIPbB3IK8Lcf0yBEL2DtqT2gtPlKbr41FlpRLTKQ5VGnGgYNC4WUHkf+qIRJ+my
	 GOopDo4/pp00A==
Date: Mon, 27 Jan 2025 08:37:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 17/22] media: dt-bindings: ti,ds90ub960: Add
 ti,enable-sscg property
Message-ID: <20250127-neon-sandy-perch-5291e7@krzk-bin>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
 <20250124-ub9xx-improvements-v2-17-f7075c99ea20@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250124-ub9xx-improvements-v2-17-f7075c99ea20@ideasonboard.com>

On Fri, Jan 24, 2025 at 05:17:54PM +0200, Tomi Valkeinen wrote:
> From: Jai Luthra <jai.luthra@ideasonboard.com>
> 
> Spread-spectrum clock generation is supported by UB9702, but only
> optionally required depending upon the hardware. Add a device-tree

What does "optionally required" mean? Either it is required or it is
optional.

> property for enabling SSCG.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> index 0b71e6f911a8..970f0f36449a 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> @@ -43,6 +43,11 @@ properties:
>      minItems: 1
>      maxItems: 32
>  
> +  ti,enable-sscg:
> +    type: boolean
> +    description:
> +      Enable Spread-Spectrum Clock Generator for the BC clock for all ports.

And the SSC values are not configurable?

I don't want three bindings for the same (see IMX8, STM32 and pull
request in dtschema), so be sure all your cases fit Dario's and Peng's
work.

Best regards,
Krzysztof


