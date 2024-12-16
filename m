Return-Path: <linux-media+bounces-23452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5839F2B2C
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 08:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0083C16611A
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 07:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742A51FF7AE;
	Mon, 16 Dec 2024 07:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2kIXF88"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C661AAA24;
	Mon, 16 Dec 2024 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734335524; cv=none; b=rZ7fl8r090YcYjvoQ5iVjOgSjt6SVLTZInQs/QaePG0xQS/U0AqpGnhhj7f9dGpDTvAklq0ofPamfqNR9/y9/K2S5w7EHzel176MKBy+zKBhv76be1rJYZ2vZZsIevjSPeyCs2xNA+qSHikZxvC+Ln33T9hf/y/z4pODY1PrmrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734335524; c=relaxed/simple;
	bh=EomTQ1B519UFMgo6M3dwDNyIr7vgD2r6fL9iIIRzp7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kojRLqarmVpnBJV2hlcakqEme8btdMtF1AxqOeRTrEqn4c06ak3G0OJQR43kORVjkXlXOlWK0CUyXWN8VxX2BZmQr0K+HuQahm8kv51GY6u1+I2WAGpk6gcrbdjPBITDYU7R3TBp1DyqLo0az/vZYwwPmucYXtkPnEY7nuRCYgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2kIXF88; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AACC4CED0;
	Mon, 16 Dec 2024 07:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734335524;
	bh=EomTQ1B519UFMgo6M3dwDNyIr7vgD2r6fL9iIIRzp7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2kIXF88XrDXLH8pk/aSpIm9BKfuQ36KSdBTDEgHHs7uj395RxLEV0CRoVPp0nSta
	 /bgRi7xdxfxrfOQfdgG51E3wq8ikYS76N4Lbv+PqqxwLSPpicpJcTTK/uK74eJm34w
	 xfU2i5mnd4xQyih55JAWzcTuT/P2C8K8lfx/pkZBfRqrmco2oPvWDuQQToouvsPR1v
	 dOEUEgvLR1s4e1TaM726K+G8Xh7Sk+7g//gknWjif9vdvETC45XnAV30MHmhu+UgnQ
	 PGsyAp6GziauQppMLVI/HAnng42wHQW8Xmjv29tVIv5lx+zRvlmuvfDvV7voFX9VS1
	 doHRymDnK+cxA==
Date: Mon, 16 Dec 2024 08:52:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: media: add support for video hardware
Message-ID: <avsiopdobpukz4ngqfakvghvswwrwopr4cn764mnuc76q4m3wh@axpup5fypxsu>
References: <20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com>
 <20241213-add-venus-for-qcs615-v4-1-7e2c9a72d309@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-add-venus-for-qcs615-v4-1-7e2c9a72d309@quicinc.com>

On Fri, Dec 13, 2024 at 03:26:46PM +0530, Renjiang Han wrote:
> Add qcom,qcs615-venus compatible into qcom,sc7180-venus.yaml for the
> video, and let qcom,qcs615-venus fallback to qcom,sc7180-venus on
> QCS615 platform.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> index 5cec1d077cda77817f6d876109defcb0abbfeb2c..6dee45b7366578e51319b575e5dd2587dc84baeb 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> @@ -18,7 +18,13 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: qcom,sc7180-venus
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,qcs615-venus
> +          - const: qcom,sc7180-venus
> +

Drop blank line.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


