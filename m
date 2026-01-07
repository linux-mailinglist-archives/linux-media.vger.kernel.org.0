Return-Path: <linux-media+bounces-50137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21024CFE0C9
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 14:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 444723173AFB
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 13:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBF333C518;
	Wed,  7 Jan 2026 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTXF5jde"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FE533AD81;
	Wed,  7 Jan 2026 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792982; cv=none; b=ub3SRXQxp5i8kqy6iw8Zmac84PK0s0cbA8sTYTCYyJONYk/HssVlMs2g65ku81fJg48Bj4zcmoGC7tcR9710VDyIR7Z8GZG26flOQznRHEtehCm3CEODGsgvgaUCVV9HzgCfGiv+CT9I71FgbGUkJtoG38F9sd8ZmRr2yy1SsEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792982; c=relaxed/simple;
	bh=mI811ysUftQcMtpeo5RrxFJYgCXdBmBHwvEGT1q3MvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRhv2TPJo9jkWkhXOq0pwyTh1cedZAmfCWoHK6rHk6wuDI0N42pRNtHpb49XDMW5SM0r+Riop8KZ+FLa8rcCznHKEQNXlbd11bpn1PSF6QSHefWs9lpgE62O9sz1zBAIdiOLbfHpY1qNZzDKC7kLYEyIlyQYcEH2QIwVBfjwqxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTXF5jde; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B50C4CEF7;
	Wed,  7 Jan 2026 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767792981;
	bh=mI811ysUftQcMtpeo5RrxFJYgCXdBmBHwvEGT1q3MvQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uTXF5jdetqfJ3xOWyEnQR88EVRGddmFTzeVG9zevtKjaLhCTW8u87GHmskaU/sKdb
	 e1jLB78Gf2RIE4hFAQRdtnigt6X5kHJpXiox6Z9vG9o/RD6drxWkgjJnPJMyeBVSEV
	 9UQN5fWeVw0U3uPvFUFuL5kZeDVh6htNfODxPyAgJC1Ch/3YI+SLQ96vZ30tX522HL
	 ZcRYODAYCcDw69gl2ErLu7HsvIvK9FP484rytrNhaBjfsiSMo2aiT36TjoawfhUT7I
	 tQF7RzKH/FOIfnnweq9dIHUiq7SbXS9d/M8p7Wv1EgYRomXb4eNB0iD1ZyeF44VD7g
	 KdWheSSjeqPJw==
Message-ID: <504ff36c-c94d-4f8b-8256-7957b65220ea@kernel.org>
Date: Wed, 7 Jan 2026 13:36:16 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: sdm670: label the camss ports
 instead of endpoints
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Robert Mader <robert.mader@collabora.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <28CgF9YCOaN5FtWGxctJJCrmISao7MbyK7VAR52q-4dLe3QCWkEA2er5PzLxV9c1Wi8KEHlRKE3bjR1J5hkxLQ==@protonmail.internalid>
 <20260107043044.92485-4-mailingradian@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260107043044.92485-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/01/2026 04:30, Richard Acayan wrote:
> Endpoints cannot be pre-defined since dcf6fb89e6f7 ("media: qcom: camss:
> remove a check for unavailable CAMSS endpoint") was applied, probing all
> endpoint nodes and requiring them to have a remote. There is no sensible
> remote in the SoC devicetree because camera sensors are board-specific.
> 
> The ports are meant to be extended by a board devicetree in order to
> define fully configured endpoints and connect the ports to camera
> sensors. For nodes that are only meaningful if extended, labels are
> usually assigned. Label these ports so they can be extended directly.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
>   1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index b8a8dcbdfbe3..3eb4eaf7b8d7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1776,28 +1776,16 @@ ports {
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> 
> -				port@0 {
> +				camss_port0: port@0 {
>   					reg = <0>;
> -
> -					camss_endpoint0: endpoint {
> -						status = "disabled";
> -					};
>   				};
> 
> -				port@1 {
> +				camss_port1: port@1 {
>   					reg = <1>;
> -
> -					camss_endpoint1: endpoint {
> -						status = "disabled";
> -					};
>   				};
> 
> -				port@2 {
> +				camss_port2: port@2 {
>   					reg = <2>;
> -
> -					camss_endpoint2: endpoint {
> -						status = "disabled";
> -					};
>   				};
>   			};
>   		};
> --
> 2.52.0
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

