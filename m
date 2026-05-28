Return-Path: <linux-media+bounces-62985-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOtzLzDBGGp4nAgAu9opvQ
	(envelope-from <linux-media+bounces-62985-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:26:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB745FAEEE
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4414730A44DE
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 22:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB6F36B043;
	Thu, 28 May 2026 22:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hr6xEbzn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EE22139C9;
	Thu, 28 May 2026 22:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780007125; cv=none; b=j56u/jCtcS2Rxx4Fin8+mrIomTmpbqDhrJisTEv+xQwzuKN7yCkOvJV5iO/ptu5U+gZYQ0lhwcHN7drkrHIirlwujOgSkzTvZzf26ohPaz0iK0p+Mu25av9NepUX7Xj5EmVsS9E6cWIbzJB/32cCztY7zwgMeD4OuT2/8EaDWuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780007125; c=relaxed/simple;
	bh=5pD1xzgytOv4lRY+9SSxjmule4gFpWNYwQRPX9KkAk8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=CEYEbYt+7Ra/WZVTbgkop0zF0x3KxcFHxNTXdLqvjksVv1yrCBBdveR8+Vaemwrf2wU6d1xbu3cLOXRfgKNU8yIk3m+4o+jGA6whArYMV2vMXweUA8lkrJO1pniUfywWGmMzpo9yJ9+ZpRLm3Nro+HmgZ5vuqKlX9jn5opDyfxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hr6xEbzn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0771F000E9;
	Thu, 28 May 2026 22:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780007124;
	bh=u+S+Yw/FvBDEuMekXmuxXKfy0MCGy9lrvQ1qucBDeyA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Hr6xEbzndESUoJ2wfNwLPbtLjwjy1LSVfRxO4DenF/pVNsATiZ8N/615LpS9bRajm
	 i7+zUFSS2Eni7u8CHWGK6gnRlrfQH7m8MKlp3wr5qbnHuka1LRI98czPpq6MGKBZaS
	 j9QJRzLrDX435uGaKN58pSbBKbG0xklta7wc2k4i1UmURZwhdM1BoH0dkN+/Rt9icR
	 XhME9SEgzZOSjxNNeGR1wkqEypr9yIldL663jKKa4lCnYCjWwYBkfShxbpBuBUvKGQ
	 xrOiE7WJHxYM4TQJ6FCSZxxEn+8pyKenTysg2L64K2Q/MILUwRzSJs43ugkXiIlBgK
	 /8Vohh5YagjdA==
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
Date: Thu, 28 May 2026 23:25:16 +0100
Message-Id: <178000711657.4557.3333046681736710601.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3426; i=bod@kernel.org;
 h=from:subject:message-id; bh=5pD1xzgytOv4lRY+9SSxjmule4gFpWNYwQRPX9KkAk8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGMDOag8iXwNmyvcvGG71GFVtzTBZ8GRrnrC8i
 UEmdhIWZfCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahjAzgAKCRAicTuzoY3I
 OuMdD/9r4e3j3hYm02Do01jRKhrrRPeFv7ECVA0AYGytgWknXX2fis2ruf8UwUzBTXbBnBt0nk0
 lSfZ9m6G64/tz/FSOONzGM9wh3k+uCNTd7lRUAZc9hpQmWJ+IdUPtWkEoP4NMK2RgYNL2pYfqxB
 uvmyS3aGx1qSRcmQxwbKRn1ycIOOpfhM/cUYk3lb2LDeZxypyG+fe3ZJFfJ9w1Evux9c322PuLC
 YkhS7yz9TLEO9ARrMT9/6Xw5hOjN673rV0iCed9BvZLTcxJK33wrq3tm/PbMZ7MF98P2AeAV4Tu
 N6HYPeqea9D6vOaUjCPXvrQXpN1rlAU/jTcz8qthwPQQtI1Pu2PEp3YQjSASZYn+U25n0yEbKOV
 V7m1z3yzMbTRQSzQUnJE6lBEVUU1DUJtnwjhvU/kSaquzyjwLxosIWxmrMBpxtBG6kZPa8YmOjz
 r2r+HD28+n9Pu1kt6QDpn+7B2LW28m4u3ZEJ9tuMyfIQaqz0Sfw2PpfBRXDSbH/4S8feB2XA3lm
 b0Dcu37Vo6Q7fEwENKyQzN+IqW8Y6GsUToBIU66ZTt2nLtO4VehG7GUP+uFAWG7IXp0qBcoXQFo
 b4kRFIzzvTANgfUlai+n+FchJ/mDr/LXLInNZ+GsVOUZOFdBt5I+QBYNARXyf11yr7GVL6UuS7h
 5SmQWwQSJcEIt+g==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62985-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,linaro.org:email,0.0.0.1:email,1a:email]
X-Rspamd-Queue-Id: 1EB745FAEEE
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod


