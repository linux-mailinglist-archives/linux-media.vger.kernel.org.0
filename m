Return-Path: <linux-media+bounces-62986-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHPfKaLBGGp4nAgAu9opvQ
	(envelope-from <linux-media+bounces-62986-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:28:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 273E55FAF1E
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9564D301FA8D
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 22:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4473E369204;
	Thu, 28 May 2026 22:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ls/LjJfk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF5D2DECBA;
	Thu, 28 May 2026 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780007325; cv=none; b=Pyb2NAZ7fixT5Yp9BcwNaYo2HTZTb+9rveT8/0fEasGrW77d0G5dkSNBmvJAOztGEafgmcmDwHbs91Vkqp3f9owwx4mY45FfqKBvQlJG+I5XpFzbKNzl8gZI4UD9r1wOP6EuC9ShKc1IedfHlWOuCHGt4qXe1JI8TyaiWCrSofM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780007325; c=relaxed/simple;
	bh=Di+OD3usvgyX6rnjBSUb7kST4EupNSbpYTe/lTj/MJQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=j387LdV/80++6je6BEXrsra46fURU6R4NZAfSgSPiWRzW2bbXhGxwHCQK84oO/3eTzP5ohEpVaz6UIvl+pVs9WwvkFl0b3k9nY0UxJTZ6k2kxcpOB3sTMUz/atCO1xpdVoNz9GII+Iu6Zhaaz6uOVW2LHTXO0bWHq6m96D74UGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ls/LjJfk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEBB51F000E9;
	Thu, 28 May 2026 22:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780007324;
	bh=8zRkG4RWbLH23sLBlro2Oe0wZiV1e2ovm9LtCDLaerI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Ls/LjJfk9xOdQx8Pcfu7HU2S81bI0CWPlLgpyBTQs31isfLwgMacX51ilgQxktsyU
	 9tqfQQPjROIX+qnn23Sw/PvIcTs3DSko+dworb6ylkbj8fptVjo61C6CFjAmWvS0lj
	 /N+05viOUMn/CuWGH7+pJZFmjpsUVsb9JpbTgPR0DFTPNSUmGZh2Z0y85L2jvJLX7c
	 VwVYBRnqP48thdefg5N/G75tTqsabhttbjND/AdsID/OvxCNEbSbRJDcJgvsuhGwaP
	 1pSJMnJGa9IRyR9Eij69FBxftLLUY4CddBFhQlQR1Y5phDB/QMklnUWb9SaK+tVxl0
	 yWpGyiD6STr9A==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 7/8] arm64: dts: qcom: shikra-cqm-evk-imx577-camera:
 Add DT overlay
From: bod@kernel.org
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Suresh Vankadara <quic_svankada@quicinc.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:28:34 +0100
Message-Id: <178000731452.4557.8537369407478321842.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3539; i=bod@kernel.org;
 h=from:subject:message-id; bh=Di+OD3usvgyX6rnjBSUb7kST4EupNSbpYTe/lTj/MJQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGMGURvRRH+JDAyHt5+IyRuwrQMKhRBg3Zmujp
 PeTeiSWYqWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahjBlAAKCRAicTuzoY3I
 Oq43EACMGAbdNqBuEQM4lsxknuCMZY+IqXEAEy14jJjKMeomeUWcDtoG8YhKYGi7iqvIZjegeIi
 GOrwW9E4+SWXtz4D6I7NcLlQSFkDMlia1w3bXxCJcFzO2hdh2LfZOkiIyt8ATHPofuTPI66U4mC
 XcUBt3afisxXjIdfBWh8L2tTVSLcHEgIo3zpTuCirhkwwqJyLfNVR05BES1ulmkhLYLNJDB6A1W
 pTc1YymVOUOdAKm0PO0bpF6tLLNb3XMW9gE68CgwvbE8yHSnt3S3/Zg3g/x/BcPiFYKMruqoUp5
 /Bs6byUMvwuqixMVEqAwSUbnAp4BdWUk24EZJd536bKuxf4Y4eY2upWheepyEaW9ctRO4J0MDn+
 MIEtSZ2j5S/Xtn5H0qNTThJFpXyQ1yzZVRzJhDtUU0YJuWrOv6hLp4Wx0+PsPm6edJRFHGvyLnV
 2osJZC8gryJk7u5hC8L9gdGxsivttGrFWbWFGFdk8lxRV/bs/LK2jAzNSxSklSXxum9XxhJWeMs
 0ZWTFnJIXG5mDS5M5qiE+rN5yuWI4iyk1nFRa1JUt1eO41ImdgExpcQqX5oKn7gjWRzMnhjyxKC
 dcEhi66sQrxHjY1DrM2QCyC3Y84Ak3CeUQdCaSQ4tLJx3Pyr4DfSyL3qMOoYhUS4xYyzjnqNZEv
 KPp6CovBwHsvLTw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62986-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.1:email,1a:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 273E55FAF1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-26 22:42 +0530, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |  6 +++
>  .../dts/qcom/shikra-cqm-evk-imx577-camera.dtso     | 63 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a9e9d829fb962386b3975f345ec006504607130a..df41830e18edff82893ca24ca84d7e03065d0ef7 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +
> +shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
> +shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..aedcd164810cf687efb425da79ace7ec6453e3a5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtso
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,shikra-gcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +	vdd-csiphy-1p8-supply = <&pm4125_l13>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&mclk1_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply = <&pm4125_l15>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 
> -- 
> 2.34.1
> 
> 

If the overlay is not specific to board then the overlay should have some
kind of base name shikra-evk-imx577-camera.dtb

This seems like a minor nit-pick and, it is :)

---
bod


