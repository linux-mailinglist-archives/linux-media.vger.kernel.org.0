Return-Path: <linux-media+bounces-44589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E1FBDEC42
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 15:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 545324F45BC
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6B42253E4;
	Wed, 15 Oct 2025 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6ci1stX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15886221DB6;
	Wed, 15 Oct 2025 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535023; cv=none; b=CJp39Kv9ff/4ZIq7/g3XJ23kWwR1GmjUU6fdGqFbyGMWG+UMa85sRznuemzDujFM4kh1z7SVEca91/NA5V8nQV1G1bHqhx8umTjN5AGevOMpfcj17rPe4V8FDPsDtf5LQiTX8xOsVsovoniF0S7ibPMEcmonlvia/emBn9R4Jo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535023; c=relaxed/simple;
	bh=A4j7EyyUEQAH/++sFjjOscr7TYVqFzYtv6RZBE5pQNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cP1a2R9THZC3ASwBTIfBZy1coV9hF2YcmzHOYdtW5KX57kclrWm+96qDC4xkF8cbFn1HSlI04rGq2gKZlYW7vjt3/xH07RfZMkRcNGePaNBMMYz2s4d6mf7MTQjHIGl0qbe7KUaniIqhxt3uRCSXzKk+CR/+VAlKVtH9lgqTsEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6ci1stX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B283CC4CEFE;
	Wed, 15 Oct 2025 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760535022;
	bh=A4j7EyyUEQAH/++sFjjOscr7TYVqFzYtv6RZBE5pQNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b6ci1stXqNKhV16bQZUz2RKyXZlZu/XYFYpCzaE+LYx/QRiRt9Jy59YuGmxqUoF/i
	 sZQjJcJaIvwIy+xtYGruCM2hrR7Yzju5OJqzfVb/Q62yi6S5kJXs2GmmxDsPicrq80
	 z78Vm4Ikoezi+QIy4EMXK/VXJxVqC/p8oDMGG6sdPBDrbS8AEelVtc8aPNJoNgEy5x
	 srfEllTzNfWkG8OB/UFi7ZlQwxeoD+KdQUhR/rDUMaIBvEZhRfYKbEH6G/DWBmMl+w
	 SO98xbxHlaLZk4RMMSiNRAoHeYExrixS5LTfTnnMvizdwz6Qa9nAaMBFTz1VKDXMbv
	 fEhG9pPWVdb1g==
Message-ID: <9adec627-e3f5-4664-881c-9e93f029e189@kernel.org>
Date: Wed, 15 Oct 2025 14:30:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 14:01, Vikram Sharma wrote:
> Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
> CAMSS binding to reflect camera sensor hardware requirements.
> 
> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> index 80a4540a22dc..dce0a1fcb10c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> @@ -120,6 +120,14 @@ properties:
>       items:
>         - const: top
>   
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -160,6 +168,8 @@ required:
>     - power-domains
>     - power-domain-names
>     - ports
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>   
>   additionalProperties: false
>   
> @@ -328,6 +338,9 @@ examples:
>               power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>               power-domain-names = "top";
>   
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
>               ports {
>                   #address-cells = <1>;
>                   #size-cells = <0>;

This needs a Fixes: tag

---
bod

