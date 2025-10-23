Return-Path: <linux-media+bounces-45410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BD9C0216A
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 17:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 769523A29BF
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 15:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6EB30CD8A;
	Thu, 23 Oct 2025 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ix54ZzdF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33FC334C0F;
	Thu, 23 Oct 2025 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761232681; cv=none; b=PbjnmFdohenspzl6+Vj4KxVWZihPw7PTI27DpJnCr5FuFGT7qRs+Z226wdfyZLH7LHOYx3xY1NRIeJG7C5tVSR4ET3kDol2DQgGlyzDOcJ8PJORot9PmckFGbQQIFuMwtyqlfkMhPLIPYLvjUqrsmgs6jeEKKdinivjKQMZYQL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761232681; c=relaxed/simple;
	bh=R1WCx2SmzsY8sZqdBiLN3BTgIZdYm4JkudaKgOezh6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=is8EFKMKaqPXek7AqSUaroyDzn6YaTZbZ4WXa6LbVLasqR0koZZNbMTH745VBwDupBWNW7b9XZyLqW2nhboqfl+YMm2wOcx5SwI8+U52CxcNnT6BChTROzRb77aSXYfLVRfHcFYwvy4pOaotM3J1fzyZtdOQBOixJIwrzQ3aiZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ix54ZzdF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EB1C4CEE7;
	Thu, 23 Oct 2025 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761232681;
	bh=R1WCx2SmzsY8sZqdBiLN3BTgIZdYm4JkudaKgOezh6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ix54ZzdFJaM7TEl0WohUnVqeKNChmzJteYBERpB7nAVkfxdmPwcoCsXSVWmQbmYEG
	 w/gb3LMllaK7cSt28Oj1j2rT5eKLVTg1l/+ylVXpIzza1nfgiugWYh90+VVpSJveNc
	 GSs+213QCAm227wyC2prc+ikyJMOuZAOn3ms6lfCAuI2NVzbLs2KqbmXLdQhe0e9pq
	 eUngypAHv8xCxpcDYpzcFXFlhYUCPuiusgMclOdfYQEgBairGCDvmi9sdXPAdUUW3R
	 z2fnf+cBBZGcFPdH6fIzMpUGbx0TDtnJ9xkW/vb8m6+e5ylbE1Ncmk5LyiSmo81lCH
	 APcqA3vCiP6eA==
Message-ID: <15cb5975-6192-4104-b41f-7b887c6f17ee@kernel.org>
Date: Thu, 23 Oct 2025 16:17:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8650: Add CAMSS device tree
 node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
 <zeprC_Bvr6DKjBA2nbWUqZYDZNApjKlnFRCY88zj6hoKM-bpbNSdSYovLJW8Ilf4v4rYwzIXUISfm-Bn7PqLFg==@protonmail.internalid>
 <20251017031131.2232687-5-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251017031131.2232687-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 04:11, Vladimir Zapolskiy wrote:
> Add Qualcomm SM8650 CAMSS device tree node to the platform dtsi file,
> the SM8650 CAMSS IP contains
> * 6 x CSIPHY,
> * 3 x CSID, 2 x CSID Lite,
> * 3 x IFE, 2 x IFE Lite.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 180 +++++++++++++++++++++++++++
>   1 file changed, 180 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index ebf1971b1bfb..555305c1c70d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5343,6 +5343,186 @@ cci2_i2c1: i2c-bus@1 {
>   			};
>   		};
> 
> +		camss: isp@acb6000 {
> +			compatible = "qcom,sm8650-camss";
> +			reg = <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0acb8000 0 0x1000>,
> +			      <0 0x0acba000 0 0x1000>,
> +			      <0 0x0acbc000 0 0x1000>,
> +			      <0 0x0accb000 0 0x1000>,
> +			      <0 0x0acd0000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x2000>,
> +			      <0 0x0ace6000 0 0x2000>,
> +			      <0 0x0ace8000 0 0x2000>,
> +			      <0 0x0acea000 0 0x2000>,
> +			      <0 0x0acec000 0 0x2000>,
> +			      <0 0x0acee000 0 0x2000>,
> +			      <0 0x0ac62000 0 0xf000>,
> +			      <0 0x0ac71000 0 0xf000>,
> +			      <0 0x0ac80000 0 0xf000>,
> +			      <0 0x0accc000 0 0x2000>,
> +			      <0 0x0acd1000 0 0x2000>;
> +			reg-names = "csid_wrapper",
> +				    "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "csiphy4",
> +				    "csiphy5",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite0",
> +				    "vfe_lite1";

So I don't believe the squashing down of node - subtracting newlines is 
consistent with other entries in this dtsi.

It doesn't matter in the example but, here it should be consistent with 
other nodes already here.

Think it should be updated/changed to match the rest.

---
bod

