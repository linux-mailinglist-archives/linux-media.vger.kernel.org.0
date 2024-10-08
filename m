Return-Path: <linux-media+bounces-19263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F361995077
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9F84B230AE
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776921DF278;
	Tue,  8 Oct 2024 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8BWrc0H"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDD31D362B;
	Tue,  8 Oct 2024 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394922; cv=none; b=gSDVz4IIZxlmE5MGQ5Y2QvNdkr/yrKQlCZ6dclcszCNzuhu8y5oGzl5oxNdj5uG6m1k505P1GwCfenV+00qxI6rjCBbXbwh9H0Sc3FG4bF0Vp6p9I2Cy+hw7pMfJTBZFBaVw8AmH/CTpvTxpD9etU8P6T1zYq13xc/RTJMJd3E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394922; c=relaxed/simple;
	bh=PLTW4wEi44inD24SGOxcygZQ8NsHLs+KSu6NJQ0Niyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bv8u3WT7HcNvOCxTHAnaM1ZoHPBtKpYDfMYSVB3fJOF6RLEPTHtQoMjUHkqTqlRTb07EzBkREStU5FZBFQSySqeNiI4bHp1xM9HmvZV+ba/ioTJYf7G2ejJ9Q2RN6tx4K3Om+QkOq6DXqKctvMCbO13FFCP1GoW756GskHVGXAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8BWrc0H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46B5C4CEC7;
	Tue,  8 Oct 2024 13:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728394922;
	bh=PLTW4wEi44inD24SGOxcygZQ8NsHLs+KSu6NJQ0Niyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B8BWrc0HIy0mUEVmvruHx9Wg4rdjAjooMw9gKa0BsYGeyQPy5nVG/mJO19OAeqUTr
	 RZvlalK+CCdOUrzeF2LVsqGJPps2pF7umzScMSogqyAoM0EPgrgRCbLooKirBI9dA+
	 WUp/WqunEg2rmMr+l96oVjppKcokvacmlF5oGdm97YycsNq9uW5JZ2ji6VDRoEOmgl
	 Gr6mo9tJmksNFGKD3Ip4xD9gEeuOuhJPa+WOlsKgC6pR+o2tXGw5UMSz+wW9TkNqgQ
	 eb67xO/bt1HeuBx3rqMtsbVhVw+3yWpZxs2qGW0Z9ZctlAjM3oFjWTv898DG7Ha0f/
	 YAbv5AFYnQ29g==
Date: Tue, 8 Oct 2024 15:41:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 12/15] dt-bindings: media: addition of stm32mp25
 compatible of DCMIPP
Message-ID: <lu252oltrh6bftg2e4hpthazd4r3lwbd75mboezhz7f4bbfdip@w5k4jx6oyyzx>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
 <20241008-csi_dcmipp_mp25-v1-12-e3fd0ed54b31@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-12-e3fd0ed54b31@foss.st.com>

On Tue, Oct 08, 2024 at 01:18:14PM +0200, Alain Volmat wrote:
> Addition of the stm32mp25 compatible for the DCMIPP.

"Add"
See submitting patches.

> The stm32mp25 distinguish with the stm32mp13 by the fact that:
>  - supports also csi inputs in addition to parallel inputs
>  - requires an addition csi clock to be present
> 
> The commit also adds access-controllers, an optional property that

"Add", see submitting patches.

> allows a peripheral to refer to one or more domain access controller(s).
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../devicetree/bindings/media/st,stm32-dcmipp.yaml | 53 +++++++++++++++++++---
>  1 file changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> index 87731f3ce7bd..bda28fef0b78 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> @@ -10,9 +10,40 @@ maintainers:
>    - Hugues Fruchet <hugues.fruchet@foss.st.com>
>    - Alain Volmat <alain.volmat@foss.st.com>
>  
> +allOf:

Please put allOf: like in example schema, so after required:.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:

Best regards,
Krzysztof


