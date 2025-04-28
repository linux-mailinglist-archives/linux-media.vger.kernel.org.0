Return-Path: <linux-media+bounces-31141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D55A9E8F6
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07576189851C
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 07:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D251DB356;
	Mon, 28 Apr 2025 07:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qD/IzE5B"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1196D1D63EF;
	Mon, 28 Apr 2025 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824453; cv=none; b=NecM4ccn9y1SQcomQKj5SK9YWa906X736jQU+RMZHybBoRn+7khZPWKPCsyJ7ReYxAkYgCn/FgEg6CyxiwKag4C3R1zTIil97+RtTPtyVk03mjHshKKS5dVhT4Ms6fZU4lB5vKAAPbLEIlqkCIu8VYDw/86R/5ekU+INrvTTn0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824453; c=relaxed/simple;
	bh=mCUt9fkBf8zZ7IpdC7td2+clNz0tsoKFKyFgL2XiRuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1wHm6RtfjGh+vh2j61b3EIuC9szgwF9B8XjS5Mhv1fnl6LIDEs8KIeO6QxC+AlGmdHZpSmUjqNHcniR4MrECVoLxOPsHAvcIAFz5IEliR4c/CQrIQWoh0oQPC4hs8YdWkEjnGv0wCXZnp2fti8h4eiPhQ5oKFNsIQ5cljbeu4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qD/IzE5B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7645C4CEE4;
	Mon, 28 Apr 2025 07:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745824452;
	bh=mCUt9fkBf8zZ7IpdC7td2+clNz0tsoKFKyFgL2XiRuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qD/IzE5BBaoMQ6h+9XjVfhvokauEWt3uYy76zSnc5zoJ9ACzirtmdKXAkSF4KqseK
	 HLdXwfXFg4Q3Y2gfuVYM5bVIlFXHdhyPOocJl4MsnNPnPvexV6MpFdtKsw6lC6qEDg
	 TLPkmU8R9tGnYk9l0q1C3/um9hXS0XO6IDkqwa+w/SevVuG04XtctWb4BOO3RmYCAV
	 qckaiyOG+hKbVGLbPAlLRkDZeI+7nbPDjbh5xzQN+q5zQSllKC1OXSG30FKIFEix2Z
	 I0GFYnuHxYuJcmL4sef0FFDFT31r5JMGUJD8svlpkZ0P0grwI6MW9FRdMu/l2MswwD
	 wsdFN7saeJVnA==
Date: Mon, 28 Apr 2025 09:14:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dmitry.baryshkov@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, vladimir.zapolskiy@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: qcom,x1e80100-camss: Fixup
 csiphy supply names
Message-ID: <20250428-lovely-flawless-grasshopper-bacbfa@kuoka>
References: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-0-19e5e72ffc3e@linaro.org>
 <20250426-b4-media-committers-25-04-25-camss-supplies-v3-1-19e5e72ffc3e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-1-19e5e72ffc3e@linaro.org>

On Sat, Apr 26, 2025 at 11:52:48PM GMT, Bryan O'Donoghue wrote:
> Declare a CSIPHY regulator pair 0p8 and 1p2 for each CSIPHY.
> 
> Name the inputs based on the voltage so as to have a consistent naming of
> these rails across SoCs and PCBs.
> 
> There are no upstream users of this yaml definition yet so this change is
> safe to make.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 52 +++++++++++++++++-----
>  1 file changed, 40 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 113565cf2a991a8dcbc20889090e177e8bcadaac..dc7c1a9394c3b547f5e0885bf501ed42dfbeba88 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -118,14 +118,6 @@ properties:
>        - const: ife1
>        - const: top
>  
> -  vdd-csiphy-0p8-supply:
> -    description:
> -      Phandle to a 0.8V regulator supply to a PHY.
> -
> -  vdd-csiphy-1p2-supply:
> -    description:
> -      Phandle to 1.8V regulator supply to a PHY.
> -
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -157,6 +149,30 @@ properties:
>                - clock-lanes
>                - data-lanes
>  
> +  vdd-csiphy0-0p8-supply:
> +    description: Phandle to a 0.8V regulator supply to csiphy0.
> +
> +  vdd-csiphy0-1p2-supply:
> +    description: Phandle to a 1.2V regulator supply to csiphy0.

Block has VDD_A_CSI_0_1_1P2 input, not separate one for CSI0 and CS1.
I don't get what is the benefit of this and commit msg does not help me
to understand such choice.

On IRC I clarified you could have less supplies in the binding than
number of actual pins, to make things simpler and more consistent, but
you did here reverse: more supplies which do not exist.

Best regards,
Krzysztof


