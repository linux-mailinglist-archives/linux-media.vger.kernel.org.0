Return-Path: <linux-media+bounces-21928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF719D7C26
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 08:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93EE2B2237B
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 07:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32357188CA9;
	Mon, 25 Nov 2024 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZSoNzB2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210C2500AE;
	Mon, 25 Nov 2024 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732521009; cv=none; b=B+i7dvKmuE07y5FXMdUAP5Jd7pNa3xaFUZ3ptKzvFlpTF+fd4D4hMoZq+etMwWrGnvQFuUk6QLJpUu3pBF/CY6ZeXMmx8/UvQ+JLmaPPNB3JPsX3rfBTBQnXw5oXjce1rRiSMcfwswMpaQzUh9FpSwjW831znJkgrEb0RHiCErM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732521009; c=relaxed/simple;
	bh=IFztWVAF65de6cRpCdLQxb+SIYrWJTKez/F93l2L0uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8TdVkcRqYtmnRxAMmpj1cZ84efgbStEJy8tffDiKgDQ9rs24VHlQt7Ps+/9TZn2QsufW6zARbsd8EJ10tB2rH6fmH++LpxESn1JYrtXB5iGgiiE8RkFLeDCFfoQOe6PfU4jMuOFCl4T7SiYBvKaKe188FUIfLFl2D0Auh2xI6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZSoNzB2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2972AC4CED6;
	Mon, 25 Nov 2024 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732521009;
	bh=IFztWVAF65de6cRpCdLQxb+SIYrWJTKez/F93l2L0uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZSoNzB2nuYXNnrLIyXxsPCTaC55j8dSpIlgtEjqRKpNmLMbzBYDQU0L5jsbXxoNr
	 /mZuSWuzK5TegeqSlb1P9lg8Glh8xjbVFPCUxr0utO9154AfxN9eiKbETcBw59urAb
	 i3w54SU28ZCp7zJBI8fQlB/I6jLGJ8RihaJEjnz9tRZSN34GM3wu3FyHVzcNcTBIlf
	 LmNhuwryKzqvNikrRWZmCRWTIx9jISUG8xcThiClH2M858izyetfWujYEZPh6nGrRt
	 wn85TUo6iTRtDFkaKeti9XzquLfptioxxypVmcN06k9TDkFNplCiT0jqtLeEh9OJch
	 m8bXXI/5E9Rjg==
Date: Mon, 25 Nov 2024 08:50:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware
Message-ID: <jovwobfcbc344eqrcgxeaxlz2mzgolxqaldvxzmvp5p3rxj3se@fudhzbx5hf2e>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>

On Mon, Nov 25, 2024 at 11:04:49AM +0530, Renjiang Han wrote:
> Add support for Qualcomm video acceleration hardware used for video
> stream decoding and encoding on QCOM QCS615.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs615-venus.yaml          | 182 +++++++++++++++++++++
>  1 file changed, 182 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml

Dependency for this patch must be mentioned here.

Amount of dependencies make it unmergeable and untesteable. I suggest
decoupling dependencies by removing clock constants.


> new file mode 100644
> index 0000000000000000000000000000000000000000..7a3a01ff06d8b62bc2424a0a24857c86c6865f89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,qcs615-venus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCS615 Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> +
> +description:
> +  The Venus IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,qcs615-venus
> +
> +  power-domains:
> +    minItems: 2
> +    maxItems: 3
> +
> +  power-domain-names:
> +    minItems: 2
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: cx
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +      - const: vcodec0_core
> +      - const: vcodec0_bus
> +
> +  iommus:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: video-mem
> +      - const: cpu-cfg
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +  video-decoder:
> +    type: object
> +
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: venus-decoder
> +
> +    required:
> +      - compatible
> +
> +  video-encoder:
> +    type: object

Both nodes are useless - no resources here, nothing to control. Do not
add nodes just to instantiate Linux drivers. Drop them.

Best regards,
Krzysztof


