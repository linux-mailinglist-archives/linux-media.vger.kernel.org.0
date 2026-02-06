Return-Path: <linux-media+bounces-52311-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK4yHrIWhmk1JgQAu9opvQ
	(envelope-from <linux-media+bounces-52311-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 17:28:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0B8100419
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 17:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A886306F009
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 16:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A891329E64;
	Fri,  6 Feb 2026 16:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w35VbR9o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EFD2D59E8
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395152; cv=none; b=sWrnvACyDlWnLl8FzVz8vTn3aCdduXnwh/KTZq+PVeAKz5Ohx51/eYiqLxi+UeX5Zt0xyUxZFiuNgYkOrbzHfjIwGZ/5RoMGkRZLQILyPjDkc3y3TA+d8KriyQWXnmQzWvmFeQeCVMqFaN8bB2H7BY+hAag6l/S5xgJ76kDVSVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395152; c=relaxed/simple;
	bh=kkIsEzWW3sArWoc9saj9rYNsVs8MtIvVRU0xQyiN1e0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSDDXsr0VyZaV50yi7f+TP7KR5hzIOMUsARxWveMMVs9pTAzCdR6jMAlzW6vIZ2zsd7bshPXxfpwi7Pk/7dXOLw197EGNNX0xyE/MIznktKKwnYPyuB+X02VV3pCT2CwPpb5Ox5EpgQQjFMMUq8DK86GRMZc6R6yvtL3GENWrhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w35VbR9o; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-385d8f3d20cso1135271fa.0
        for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 08:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770395150; x=1770999950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLftybbN8ivPeyXwk8NLfhAbzG7sAr9RazdOdi/8IEo=;
        b=w35VbR9onlYYMy2J3u65j8zFHUzDRlVSRi4exxD/hccPl0YkO16ilQyU1hHl3n4qUE
         zu/vy3Y5Oeh0t+h6X4viqnpWC5H4uC7QO+uhD1EMK2xWgyhUWi/+jzN3fpbPJyVamYDJ
         gNW4uBB8zIFe7ITpL2He37AW+OtswXBEVPfuC/mgO74UBq3cuIIDJPX3Qgi/7KapzUBk
         mB2Dr8vMjEEaOPywHiiFn1p+Ah7WY9aNW4eoTJFs7kXwxey1HRDgk07EKX5Gy/RSdkst
         IVpNK926LCuXmHRNs4OITrbPWvwiY0/ObcuLdF/9wwX3R4L17yaNAypzCOuULreh3gPy
         vgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395150; x=1770999950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLftybbN8ivPeyXwk8NLfhAbzG7sAr9RazdOdi/8IEo=;
        b=Xy44I44dct6Mh6HGo3ztEVjCbNKd8D3BjPfEcyfb0HIZMk4Qc7IEz8y+VYuVcWSsP+
         3dc6LIbXUEWIBq5YrG555eXaXh+cUbaulSnZLdMlKL3XlT51kWZTCrfy5xFLYtH8IqyA
         0UGo9gs9sdG4XXFpdD6Nx99s1DW1Ct1PQRvUAqQ8OVAput4ZDcDL0dKc3ZH7VTN0JRHi
         PcPL7L0GqSafUhGDUi3HNZnzBo3lHKiwq0LENL2Zt7VjoAg1rhFHbk2jEC9KvWc4aSz7
         rUoBxlvdfI+Wpi15uvWw5qL8fZ4sreerSeR5PM+vT+FYObmvXe5NO5TEQuQ4Ac1WrCe2
         2aqg==
X-Forwarded-Encrypted: i=1; AJvYcCVKVxQevzvnO7ee4Kq+MZtLT5XhrMBUkiQ+FeahY5WPCgxnHuOJDhsXp8jimjb3zccvHlObShP1/ZREiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbbt7xtpBruppoar+zmEji+YuN0/4sSrpfaOTPk/FZF9AJ2jZD
	7/0o2uUSABTajVltSOPQELTM/jrQ64tHA4zgFM5n7qr8WgcRPxTVYUw4P72NFPyvMRI=
X-Gm-Gg: AZuq6aIiEKqgBIYq9jrz2++24olt+Wp8bF9MTdYKfA8scp3dtoTuY55V35Pr2t3eVHz
	z7Hx2/DvBFE37skj/a0K/lHH6QKnMopIy0Ql/58mYJZDINOsIA9yc+d9nbx+n2kV8+0VB4Wlrjb
	U5Rs/WWi/rJ8OXCaYX9SHJa01yYVOpYlAjUed/Zs2VEGEqOId3nZZe+ULdMklyTOGh1mbI50qSx
	uusmNnB2O3o5/MBZ1ZiLLO1x7hBY3/cEdDMXmS6AUAidBUI/+kOATSiyASRR1FzRL7iI4VLf2fX
	mhNpTyngZTsRIoMWyR00cxhkR6Qwij5SjgEItO1LZiFcR+3DvIPp1pEUPx9mVUsqXMAZBeESlnE
	w5byCMCHQOUzhpgEDIo4s9fTVYCAA217jlbjQyKt7uUmqQIiWEwcIOhAoVSXvCHWXMel7WTggYy
	sY1msbw48lOLmKX5oQfE4QIspNzKJfEkE2CWNICAPZSk782dXApIMEcffbwyQWYzoMNA==
X-Received: by 2002:a05:651c:154c:b0:37a:7a9c:5c0f with SMTP id 38308e7fff4ca-386b51d93cemr7758311fa.3.1770395150443;
        Fri, 06 Feb 2026 08:25:50 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm6346741fa.3.2026.02.06.08.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 08:25:49 -0800 (PST)
Message-ID: <e0969b37-8a7b-416a-9789-8662ce7f3307@linaro.org>
Date: Fri, 6 Feb 2026 18:25:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52311-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,qualcomm.com:email,1a:email,linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD0B8100419
X-Rspamd-Action: no action

On 1/22/26 12:48, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.

Typo, s/Taloss/Talos/

> 
> The Talos EVK board does not include a camera sensor
> by default, this DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a2e48b58323c10735c8b98996cee6669e4f918e7..b505b5b1aa2feaaae691977b35a2d872751c4a46 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -349,8 +349,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
> +talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
>   talos-evk-lvds-auo,g133han01-dtbs	:= \
>   	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>   x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&vreg_l11a>;
> +	vdd-csiphy-1p8-supply = <&vreg_l12a>;
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
> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_s4a>;
> +
> +		port {
> +			imx577_ep1: endpoint {

I'd suggest to rename "imx577_ep1" label by dropping the '1' at the end,
it brings more confusion than meaning, at least in 'csiphy1_ep' name it
means the CSIPHY id, but here "imx577_ep" would be better.

> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 

-- 
Best wishes,
Vladimir

