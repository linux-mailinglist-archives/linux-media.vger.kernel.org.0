Return-Path: <linux-media+bounces-60065-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOZELJ4382lgygEAu9opvQ
	(envelope-from <linux-media+bounces-60065-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 13:06:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE554A13BE
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 13:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4F793008C37
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 11:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622C83D567F;
	Thu, 30 Apr 2026 11:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XcYxx0ah"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F553BA229
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 11:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546845; cv=none; b=m70EYDMX6HaUpoLo9oVNE3UH4z8bRLnHQZGMZymJTF3riExUkCo1mPt3Gf293NXPMY5dXjdfDVQnlxxPVlbc9J5ezLWMErRBWbetuRaewpIlnrxLC/BQdkiLVyV7McECOtsfAjYSvrhM3hnJXc5vrniDfylZ+IIUbsFRXVdiaCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546845; c=relaxed/simple;
	bh=4XLAVbaZpTk3wINhLWZowaujYOwzPCe+OLMhBJ6fubQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=St2sC1N0fiKV8Gdz3aDNC9vZX63kCQje7vXUqVdhqWBZ5pBgDjYSLLbdWjluE5wlpZMbbuuHpcVDAG1vOtT34XLh/suNSFe+w5dIMl9qpPN4ec4x9UH9/imaIrcbuVrgtn7dRiSeDyILoXZuLwcHNHvdoBumqwMzwyP4Qr3k1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XcYxx0ah; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e935bd6e5so955501fa.2
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 04:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777546842; x=1778151642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqmpJe7hg5NPSfjQFL8LIdfA62WQcT26qf/cbgPS9B4=;
        b=XcYxx0ah+ixsinfwEU9AZdppurUpZvE4883kEakMJObQ294gKX9kNkNTtxpko4m5l8
         QoldGsbWHOkMJJNEVpTfn0h8/b1KLljCdN+C0SpNBqq4dsGqJD7glmL1XIj+L6fOKX0u
         +yzAxjKWAa17WNh/2EyIvUyZ4yyVdmmyOJbTPUlL4PBIgZNRUx58W5hhjHkpCnqdi7X7
         3f0ugpfRXLyPs99uZpb8QUXgdjPx2GOm5TB89Y/5NxOhSECfgBxPFJDv6Oq+FHjaRHRn
         sN5NGtlI9/w2pb8Ma3bsnJKQXMDizlmDyOSJmv/fzmy3ZH/xTfPxL1f4AShJn1kI2ySu
         dMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777546842; x=1778151642;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqmpJe7hg5NPSfjQFL8LIdfA62WQcT26qf/cbgPS9B4=;
        b=TCQ3ts+YhAoMc5OedxAptrb/GeYsDcg857rsz3CJOKg0i0ZlFBIlvIQcS/2W0G1Nya
         RZPAWlq1uDbbDF8vK/3fwDnyR7OXf9aQt64LvBA1ByuhVCavEzSJBMUONr4/VpFx7F1Q
         LaxowSIevwjJ9rI/UPPzyLdk9f+UEvqr6W0aL+zsZFaaiKzsPWCJlp6LdpIsV7MJt1mk
         PiEeAIIdyJ+4QVwS1+j6ypG4U0qj0cmwjiJ57NAw7QeXOaDXZatG4B7xZkamdo2DikM8
         lnsojBrS9uwc1fZTU4XokwtnXCHLYDj8veaHqO1pSE+H/mNGuMQXbEajRl6WAeVdygVT
         f7aA==
X-Forwarded-Encrypted: i=1; AFNElJ+d+wuHSwL5yILPSOPeeiTKaCa1ZV+C6wvL5ItF9AY4zRl2jVOpExV8LVBO3Op9nv6dtS93QsRpvD+Mkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0LVJs03JsnK1U24uzDfHTycLclkf70bGUZ6oXs4D1CcOTPK+6
	8ckejsMMY9+i5MhJpDsf05APXBxOCXrS2KnrbShe+qQYJGGx2waiMv7ed95vZ1WaINQ=
X-Gm-Gg: AeBDieudZnbup2zPX5kSMYxBbtQirnF5gM1ZEz+wbV4H0bZCe1/aCKsCyNR7gHjPE13
	SxjT7KFPX3QGFoKVn7gZaK+y+Od66gCpSFHW4wd7voT7iGoSdFXauz226SRYm/w3F5tq0gKXR6i
	MbJRoc4nz/q7eEn2PkTY4PD07+5sLQoY5KE3oKo407HhhVfKxqVWRhnBADgvSmflBkxDVAUXmsK
	fRfNX35oaRqUbSz34ZnsFCBDgOMo9NJ01QA+VehJPpeIagm1Ypb9ZwJi4h085rFIauV02jKrCE2
	B6ObxyF654yELm0ROZgieR2Ac9kqY0aQnnVzls66kTmUfi+l4+ivIyR/+2/H/ywvv3jxl2yX49u
	RWWfBpUOTvNIDUnLufupP+jHtW6lQZ8DYw4PFREjNWme7gy7vzNOj0IGguyLXnwHJvC+YTUhnja
	naYpoP6q0sEO4w2pFjS7SycUuCaSTyRIAezr2vrkfEf7IbEspWdV4HZYZgGIBlZzAVA6lKdYdBa
	5O7G714uw1jrWuf
X-Received: by 2002:a05:6512:224e:b0:5a3:ff48:f7fd with SMTP id 2adb3069b0e04-5a8522de224mr321512e87.8.1777546842144;
        Thu, 30 Apr 2026 04:00:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a6fa2b4sm1357336e87.35.2026.04.30.04.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 04:00:41 -0700 (PDT)
Message-ID: <db441eb6-195e-4018-a84d-77b2d1531243@linaro.org>
Date: Thu, 30 Apr 2026 14:00:39 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: gaokun3: describe rear
 camera module information as musch as possible
To: Pengyu Luo <mitltlatltl@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Kepplinger-Novakovic <martink@posteo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-5-mitltlatltl@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260425105300.745044-5-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3CE554A13BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60065-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,posteo.de,linux.intel.com,puri.sm];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_SPAM(0.00)[0.804];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[c6200000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On 4/25/26 13:53, Pengyu Luo wrote:
> The rear sensor is S5K3L6, describing it but dropping compatible
> string, since there is no upstream driver. A funcitonal downstream
> driver is in comment.
> 
> The VCM is dw9714, describe it.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
> Please take this patch as a RFC, I am not sure, how much I am allowed
> to add without a sensor driver.
> ---
>   .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 129 +++++++++++++++++-
>   1 file changed, 123 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> index 39e559e91289..76b1ecb3819d 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> @@ -22,12 +22,18 @@
>   #include "sc8280xp.dtsi"
>   #include "sc8280xp-pmics.dtsi"
>   
> +/* remove due to gpio pins collision, skip 2nd instance won't break things */
> +/delete-node/ &cci1_i2c1;
> +/delete-node/ &cci1_i2c1_default;
> +/delete-node/ &cci1_i2c1_sleep;

Instead of removal 'cci1_default' and 'cci1_sleep' nodes shall be rewritten
by excluding 'cci1_i2c1_default' and 'cci1_i2c1_sleep' from them.

> +
>   / {
>   	chassis-type = "tablet";
>   	model = "Matebook E Go";
>   	compatible = "huawei,gaokun3", "qcom,sc8280xp";
>   
>   	aliases {
> +		i2c1 = &cci1_i2c0;

Likely this I2C alias can be removed.

>   		i2c2 = &cci2_i2c1;
>   		i2c4 = &i2c4;
>   		i2c15 = &i2c15;
> @@ -52,9 +58,17 @@ framebuffer0: framebuffer@c6200000 {
>   	leds {
>   		compatible = "gpio-leds";
>   
> -		pinctrl-0 = <&cam_indicator_en>;
> +		pinctrl-0 = <&cam_indicator_en>, <&camera_flash_en>;
>   		pinctrl-names = "default";
>   
> +		camera_flash: led {
> +			function = LED_FUNCTION_FLASH;
> +			color = <LED_COLOR_ID_WHITE>;
> +			gpios = <&tlmm 93 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "none";
> +			default-state = "off";
> +		};
> +
>   		privacy_led: privacy-led {
>   			function = LED_FUNCTION_INDICATOR;
>   			color = <LED_COLOR_ID_WHITE>;
> @@ -129,6 +143,18 @@ vreg_camf_1p2: regulator-camf-1p2 {
>   		pinctrl-names = "default";
>   	};
>   
> +	vreg_camr: regulator-camr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camr";
> +
> +		gpio = <&tlmm 92 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&camr_reg_en>;
> +		pinctrl-names = "default";
> +	};
> +
>   	vreg_misc_3p3: regulator-misc-3p3 {
>   		compatible = "regulator-fixed";
>   
> @@ -387,8 +413,8 @@ vreg_l1b: ldo1 {
>   
>   		vreg_l2b: ldo2 {
>   			regulator-name = "vreg_l2b";
> -			regulator-min-microvolt = <1904000>;
> -			regulator-max-microvolt = <1904000>;
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2800000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> @@ -433,10 +459,9 @@ vreg_l6b: ldo6 {
>   
>   		vreg_l7b: ldo7 {
>   			regulator-name = "vreg_l7b";
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -			regulator-boot-on;
>   		};

ldo2 and ldo7 changes shall be done in separate commits.

>   
>   		vreg_l9b: ldo9 {
> @@ -622,6 +647,16 @@ &camss {
>   	status = "okay";
>   
>   	ports {
> +		port@0 {
> +			csiphy0_ep: endpoint@0 {
> +				reg = <0>;
> +
> +				clock-lanes = <7>;

Please remove 'clock-lanes' property here.

> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&s5k3l6_ep>;
> +			};
> +		};
> +
>   		port@3 {
>   			csiphy3_ep: endpoint@0 {
>   				reg = <0>;
> @@ -634,6 +669,58 @@ csiphy3_ep: endpoint@0 {
>   	};
>   };
>   
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	voice_coil_motor: vcm@c {
> +		compatible = "dongwoon,dw9714";
> +		reg = <0xc>;
> +		vcc-supply = <&vreg_l7b>; /* FIXME: require l2c on first */
> +	};
> +
> +	/*
> +	 * https://source.puri.sm/Librem5/linux/-/blob/pureos/latest/drivers/media/i2c/s5k3l6xx.c
> +	 *
> +	 * This sensor has never been detected on Goakun3(2.69GHz)
> +	 */
> +	camera_rear: camera@10 {
> +		reg = <0x10>;
> +
> +		pinctrl-0 = <&camr_rgb_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAMCC_MCLK4_CLK>;
> +		clock-names = "mclk";
> +		clock-frequency = <24000000>;
> +
> +		rstn-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
> +
> +		vddio-supply = <&vreg_camr>;
> +		vdda-supply = <&vreg_l2b>;
> +		vddd-supply = <&vreg_l2c>;
> +
> +		/* &camera_flash can't be enabled directly for now */
> +		leds = <&privacy_led>;
> +		led-names = "privacy";
> +
> +		lens-focus = <&voice_coil_motor>;
> +
> +		orientation = <1>;
> +		rotation = <180>;
> +
> +		port {
> +			s5k3l6_ep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy0_ep>;
> +			};
> +		};
> +	};
> +
> +	/* eeprom@50/51 */
> +};

I believe it is unacceptable to add device tree nodes like this one
without a compatible property. While the motivation behind it is clear,
unfortunately it has to be removed.

> +
>   &cci2 {
>   	status = "okay";
>   };
> @@ -1423,6 +1510,13 @@ cam_indicator_en: cam-indicator-en-state {
>   		bias-disable;
>   	};
>   
> +	camera_flash_en: camera-flash-en-state {
> +		pins = "gpio93";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>   	camf_1p2_reg_en: camf-1p2-reg-en-state {
>   		pins = "gpio44";
>   		function = "gpio";
> @@ -1446,6 +1540,29 @@ sc-rgb-xshut-n-pins {
>   		};
>   	};
>   
> +	camr_reg_en: camr-reg-en-state {
> +		pins = "gpio92";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	camr_rgb_default: camr-rgb-default-state {
> +		mclk-pins {
> +			pins = "gpio6";
> +			function = "cam_mclk";
> +			drive-strength = <6>;
> +			bias-disable;
> +		};

MCLK pad function shoul be a part of the change to sc8280xp.dtsi

> +
> +		sc-rgb-xshut-n-pins {
> +			pins = "gpio7";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>   	i2c4_default: i2c4-default-state {
>   		pins = "gpio171", "gpio172";
>   		function = "qup4";

-- 
Best wishes,
Vladimir

