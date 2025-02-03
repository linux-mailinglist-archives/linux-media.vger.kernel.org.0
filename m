Return-Path: <linux-media+bounces-25609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA65DA26675
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 23:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FCBB7A1DDF
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 22:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CEF20FAB9;
	Mon,  3 Feb 2025 22:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnWSwFKL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783BE1F92A;
	Mon,  3 Feb 2025 22:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738621220; cv=none; b=udVyPaa1PREV0a7F4t/urrFx3dIBmmDWyinLnsP/qsKn6Sg/JIzobZ5V1LFTxpkOnP5OrOSfzxsRtgetibk2sWYZy6Zprqq3ScTmKMShkD+7WMPjQhCvdrb51q4MAAyI8W7CkX64zIq1Wo/+SKwI+uWwVwdyPyBqJxaNyx28bZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738621220; c=relaxed/simple;
	bh=YHnhH8TGTVwn5M7n1rEBKbWfWUvHH1qfDMRyCsjzgVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQcnyVDbZP9Nx0rxz6FXiqA/3z4IsDzzdvq4q5Q1MmF5XSziJuVlmYp8n1vhjuSfUko64XM3pohae/dmRznGchIIupBsvhl98hQ6AF7ChTwFfDEGQ+aXFYXm/N9cNIxGm6vZnrzlGsSEX2J5uLmPLP9OXyrfG5ufIyaT7QSS3qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnWSwFKL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976C1C4CED2;
	Mon,  3 Feb 2025 22:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738621219;
	bh=YHnhH8TGTVwn5M7n1rEBKbWfWUvHH1qfDMRyCsjzgVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnWSwFKLxV/bQd8Pu43Oh88t0R1YK305mRti99NklxLCDM0Lm6X4CobKomvMce48o
	 CJATxa7dNjXBRUU1KZFnCV8ixqVdgVzC87ccgl7Sq1Bi0+Q/H1rHXLx2RjeP4Wj4qu
	 OWalL9BWbFK1TyGzAK1hwJI6yXhG7v/m/Hworcp/EhC+IH+Hvt9a3ELy9rzH7cn9D1
	 vSJbfqK9y80/BMpPk/HjMOsbrg2dc5Ep+DtlZ33gqlvI06JOy3id8tMXJgKbzZhVsz
	 t8i3JCc/m7Me1D4zc4VSNpUOLsMiYzgwesxFK482/eyNHr4d5FORsSPtW+OJ2ety47
	 nTXAg33bTK6FA==
Date: Mon, 3 Feb 2025 16:20:18 -0600
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
	Robert Chiras <robert.chiras@nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH 08/14] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8QM compatible strings
Message-ID: <20250203222018.GA226659-robh@kernel.org>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
 <20250131-8qxp_camera-v1-8-319402ab606a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-8qxp_camera-v1-8-319402ab606a@nxp.com>

On Fri, Jan 31, 2025 at 04:33:53PM -0500, Frank Li wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> Add compatible strings for i.MX8QM platform. Remove fsl,mipi-phy-gpr from
> required properties and add 'phys', since i.MX8QM use standard phy
> interface.
> 
> Keep the same restriction for other compatible strings.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Reviewed-by: Robby Cai <robby.cai@nxp.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 30 ++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 2a14e3b0e0040..91c4d8fbb1f8c 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -18,6 +18,8 @@ properties:
>    compatible:
>      enum:
>        - fsl,imx8mq-mipi-csi2
> +      - fsl,imx8qm-mipi-csi2
> +      - fsl,imx8ulp-mipi-csi2
>  
>    reg:
>      maxItems: 1
> @@ -39,13 +41,18 @@ properties:
>        - const: ui
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    resets:
>      items:
>        - description: CORE_RESET reset register bit definition
>        - description: PHY_REF_RESET reset register bit definition
>        - description: ESC_RESET reset register bit definition
> +    minItems: 1
> +
> +  phys:
> +    maxItems: 1
>  
>    fsl,mipi-phy-gpr:
>      description: |
> @@ -113,9 +120,28 @@ required:
>    - clock-names
>    - power-domains
>    - resets
> -  - fsl,mipi-phy-gpr
>    - ports
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qm-mipi-csi2
> +              - fsl,imx8ulp-mipi-csi2
> +    then:
> +      required:
> +        - phys
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1

The max is already 1.

> +        resets:
> +          minItems: 3

1, 2, or 3 resets is valid for imx8qm and imx8ulp?

2 power-domains are also now valid?

> +      required:
> +        - fsl,mipi-phy-gpr
> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> 2.34.1
> 

