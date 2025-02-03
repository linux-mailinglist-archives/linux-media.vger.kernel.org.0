Return-Path: <linux-media+bounces-25607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE0FA26662
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 23:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1B453A3A9A
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 22:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0598520FAB2;
	Mon,  3 Feb 2025 22:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+hxIZm6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51395182B4;
	Mon,  3 Feb 2025 22:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738620417; cv=none; b=riLSMeQ6qPLzvVVJT2riwOhVkt8JCeMGE2A9uYVyHVwZPFgGu2Xg9KQ3WGfA1P4ak67LCUeK0OMdnarY4FSfwI1q9w9CGUih8M7qXivzAoUI48MvwMpmxbUTcY9YA0CL/bEE24PEUxthFjnt2OegNGfBZZjRNvqLYrfQiv6WGBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738620417; c=relaxed/simple;
	bh=OPQj1Abt3xsx43s9Y7uZoXay8fLRxRNIDzNqC0JHfuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5V31gBKvBJnu8bOHZM/T703XhOdhjTGeQ4N8AKAFqhcIQ/1LTq56MAlEJL0GUToLFsQwsgCyJvtWrudvaL8XMOoKqFq9oB2BTbO5rIiHuo73xIGrJsrd+SEiIypmeojflHYrpIs2Xih7B9i9jMxLI5Mv6GG/+bE+GVsBZ3VBes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+hxIZm6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C982C4CED2;
	Mon,  3 Feb 2025 22:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738620416;
	bh=OPQj1Abt3xsx43s9Y7uZoXay8fLRxRNIDzNqC0JHfuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+hxIZm69ec87/kixoCd7sjM5/QXCqZOvZubHEi9QPXScZMTZ73pCrWL6DBEKZEA0
	 M0vThFr4EA0C1QmAK6oshEBEuNR4VKhqb5cn6tr+z8ViUlGaUVZa/7EZmP3ljnQ5Al
	 PxP8pkQnMguBWsQpLERdnpHB3yLFOPRmSQ+ntL8j3JxE+VRzyKGfAfV4/Jz91c9X60
	 nnvtOvjWLXnZH+k26K5p3FwqFYKfG/v87rpSW7Wtiy14YMl09x380kiBhr93acWWGH
	 ceQnfBYSe8by5T/CoXXRxE+yLxDxgysHiuKwHCb3z8FyPQyro3HoHa52w9pMaFCCQ1
	 3YyJ2+kAmEhYw==
Date: Mon, 3 Feb 2025 16:06:55 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Robby Cai <robby.cai@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH 03/14] dt-bindings: reset: Add reset controller for
 i.MX8QM and i.MX8QXP
Message-ID: <20250203220655.GA123074-robh@kernel.org>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
 <20250131-8qxp_camera-v1-3-319402ab606a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-8qxp_camera-v1-3-319402ab606a@nxp.com>

On Fri, Jan 31, 2025 at 04:33:48PM -0500, Frank Li wrote:
> Add binding doc for reset controller of i.MX8QM and i.MX8QXP, which use
> System Controller Firmware(SCU) reset some peripherals, such as CSI.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/reset/fsl,imx-scu.yaml     | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/fsl,imx-scu.yaml b/Documentation/devicetree/bindings/reset/fsl,imx-scu.yaml
> new file mode 100644
> index 0000000000000..6046df8723262
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/fsl,imx-scu.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/fsl,imx-scu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8 SCU Reset
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:
> +  i.MX8QM and i.MX8QXP System Controller Firmware(SCU) provide reset for
> +  some peripheral.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx-scu-reset
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reset-controller {
> +        compatible = "fsl,imx-scu-reset";
> +        #reset-cells = <1>;

This should just be a property in the parent SCU node. You don't need a 
node for every provider.

We need a binding for the SCU as a whole.

Rob

