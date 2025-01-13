Return-Path: <linux-media+bounces-24681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B7DA0B27B
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 10:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1E42167322
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 09:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E5C23499F;
	Mon, 13 Jan 2025 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fk0alyLe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E282232360;
	Mon, 13 Jan 2025 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736759745; cv=none; b=fudI6D9FnGiPLAZgBIjYRKYUIsZ+qikiw2FXSQG+67HZHg3rbxt1UuXWHHj206Ng5KfICccs/dHpc4AlkhXLqq297bG7cu1MKXl17f2XalvDVw5VlLo6TyRkhelT33Kif6FwOiB4Ml14NCG03xssG8PsvDCvAiXuo8L0in4wz8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736759745; c=relaxed/simple;
	bh=HpMFTNlT/QUlGyCRFBh6FBH578TFJxnl+vREEjEhiOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgdoB06E+pfO3mJqeVKJ2OGjxRjr6pJyNUyPtERY8dPJclXi/uA8knz8WV+mPU/zt3HNRAnS4MJOch0y2ESUecF5YyFoEz0JThapBqkKXgpNHoSBvQRDA3fP5ZudF7ph2OZbbTBmF55E2n77lvSbXdt21yxiAvnR7PbG+RZQMSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fk0alyLe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0874C4CED6;
	Mon, 13 Jan 2025 09:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736759744;
	bh=HpMFTNlT/QUlGyCRFBh6FBH578TFJxnl+vREEjEhiOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fk0alyLeYSyG/VCKfNi7UcVTK4E22zLwr4XS29oQ6jQiD2smCUeVZNbPrWDX2NClG
	 45ZvgPmcf31j0Dr5bg3tzSNX6M14W49tGlSw8pAkwYar1zPDFr1bu+0C6QwY8X9OeJ
	 VL48J5Ui6ddph1Y6JJu166zLWHle0HzTTlqEgx8oCFx38cdmIytv+AvgDS0l9a981H
	 GL/n3apcVmUyv+0st9mNb89KvoaxisInBe5XFzAXoj9IQpNN8fjSqLPkQ9xz9B1YiR
	 D/1lXp9UxPUTqNmRsrZpeufYMaILLQH5QKqA5rqv2az7/6dSYjXgnWW1q0OPCyeroU
	 VHzts5GoGS0Gw==
Date: Mon, 13 Jan 2025 10:15:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, lars@metafoo.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2] media: dt-bindings: adv7180: Document the
 'interrupts' property
Message-ID: <houf43cunqcvrd5laraakbzyc5p74gdgdqqoe6hm3hcymstb67@ovhwvvk5qjqu>
References: <20250110185026.590049-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110185026.590049-1-festevam@gmail.com>

On Fri, Jan 10, 2025 at 03:50:26PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The ADV7180 family of chips have an INTRQ pin that can be connected
> to a SoC GPIO.
> 
> Allow the 'interrupts' property to be described to fix the following
> dt-schema warning:
> 
> 'interrupt-parent', 'interrupts' do not match any of the
> regexes: 'pinctrl-[0-9]+'

Please don't wrap the warning message, unless it would be really, really
long. Wrapping makes grepping difficult.

> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Detail the interrupt description.
> 
>  Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> index 4371a0ef2761..ede774dff4a8 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> @@ -49,6 +49,12 @@ properties:
>        Indicates that the output is a BT.656-4 compatible stream.
>      type: boolean
>  
> +  interrupts:
> +    description:
> +      The ADV7180 chips can generate interrupt in the INTRQ pin.

That's the same what is said in "items" with description, so no need for
above description. Longer schema for no benefits makes it less readable.

> +    items:
> +      - description: INTRQ pin interrupt.
> +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


