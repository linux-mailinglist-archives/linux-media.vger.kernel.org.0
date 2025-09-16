Return-Path: <linux-media+bounces-42599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71415B58C03
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 04:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D6401BC3B72
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 02:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A056239E9E;
	Tue, 16 Sep 2025 02:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogHSnETM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36071B7F4;
	Tue, 16 Sep 2025 02:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757990940; cv=none; b=KAZMSVzV//2PP4c4o9r00urGrOZhjWS3LPbQVbAK+r/6fCgykYubVStFmwy3j+K5/Y7pBoM66eCFkvUizbbylbmRbYQpsz/LAIKLKJd2Bq3edc089uG/rAxUNqqAA0iT1hJw6j/6KnEu5O1sLLkZUzvlUM3R56lsrg3NzHXMuKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757990940; c=relaxed/simple;
	bh=hJOD7/Gxus8N7T/NcIWI9aLJmKggbpx+22bjHzbhIMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INj+ITlbiW9EIaPG8HOSM3aEAXqOX8ffT0MRzexs4gWrP8F2V8edde8omDRb7mAf4aMC9fUTNk23aHOEUITQpD1YijEwI3sgDNIsMIEN73pnHOPxccyEjbrEKG1REee1Iox07W+wbCR+vbpgWmtQ2bc4mxhdD4eNiH/DgMHKCWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogHSnETM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644FAC4CEF1;
	Tue, 16 Sep 2025 02:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757990939;
	bh=hJOD7/Gxus8N7T/NcIWI9aLJmKggbpx+22bjHzbhIMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogHSnETMdsDLnn8+t/s/0j0+1PwtHU+wjL2SkSHN5VLKbaTKgDy23lMiWuU15HQK+
	 eyLydqI98LkI7qjq7bmexhtZuYxax/BgxLwFRs1bNkf2b46MTJVLBf3WobCAo0ZOw5
	 OzQ5sYAqRbdNGPJzdW+dTC5B+Ud4is+2xZQQ4BJ3rDp7C5ffs4E0wBlQorDmDhZRsr
	 RtYvTalyURMMmmaTr9E8OENKivW1PoQ5HV/AiCjvBd/X5MXvpepcj5qIPJThJLqiSg
	 SfBO85uuPheejlvdxauWrPjTAh1VEM+uEA8iKjrtVeEQ+OWhKV6SurLAaeDnnfis25
	 sc9VGnxqYteAg==
Date: Mon, 15 Sep 2025 21:48:58 -0500
From: Rob Herring <robh@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: vladimir.zapolskiy@linaro.org, bryan.odonoghue@linaro.org,
	mchehab@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_nihalkum@quicinc.com,
	quic_svankada@quicinc.com, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
Message-ID: <20250916024858.GA3574831-robh@kernel.org>
References: <20250912141134.2799078-1-quic_vikramsa@quicinc.com>
 <20250912141134.2799078-2-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912141134.2799078-2-quic_vikramsa@quicinc.com>

On Fri, Sep 12, 2025 at 07:41:32PM +0530, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Add device tree bindings for the CCI controller on the
> Qualcomm QCS8300 SoC.
> Introduce the "qcom,qcs8300-cci" compatible string.

Wrap commit messages at 72 chars. And explain how it's the same or 
different from existing SoCs in the commit message. Don't explain the 
diff. We can read that ourselves.

> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1687b069e032..edd2e77d717b 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - qcom,qcs8300-cci
>                - qcom,sc7280-cci
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
> @@ -223,6 +224,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,qcs8300-cci
>                - qcom,sm8550-cci
>                - qcom,sm8650-cci
>                - qcom,x1e80100-cci
> -- 
> 2.25.1
> 

