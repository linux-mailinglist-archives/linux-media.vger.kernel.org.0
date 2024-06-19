Return-Path: <linux-media+bounces-13673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6D890E7C9
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 12:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71D131F21D92
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 10:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D5A824BB;
	Wed, 19 Jun 2024 10:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="xqFCQkCs"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD8A7EF10;
	Wed, 19 Jun 2024 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718791446; cv=none; b=d4X/d7Aqdr5Phz5ln1I0YaywuvBmJt00uWEBRiY+olExANE0K0w8UTCLxPx0Q93du1JsDv8Rdm7X4E2Iih8q7WP25nRdGz+LPv6ifD0Je0tYvien+xSONy3wIwjqGsQu0zareEcPIyYsgMA3/Pa2l5pBWoRP4lmggPusJYwgSoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718791446; c=relaxed/simple;
	bh=1jy39YZMTY/xo2Xcx2D3ihcV+xB/O1q/kuNvRc7QFu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PthwazUsWw5tD1guel1fxVgF50gvrd7qDBjjwv2qIOdpXLrYRPoMO9YM5rNPeHrpCcSCqIc5H+9YcZ9yPRCQJ3Y3g0ockbE8yoKiyVjDJ4FXjSAn0+GLvDIA+ZPKkgMCgqlJ/cDeQx7QdH2wtzrm4r5GYvZgYPe6HKIEveU+4Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=xqFCQkCs; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718791443;
	bh=1jy39YZMTY/xo2Xcx2D3ihcV+xB/O1q/kuNvRc7QFu8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xqFCQkCsIpMrEzpcF0IxEbzd6OHXGJq3FH9PM/lyvWAa2BStAnwwHgQmXIb641aDk
	 zU3es9+UcmQOVru0Sf7mM5JNtcr94qWID1O6UKMzlU4ijhqUJWzwuE5IbuNhxH1tF7
	 8reazt1X/m+XtFs2r1lRuDRhjDtlvdq7dTY0w2Pj6iWe1COkKqsyk1tephTMv+gdyW
	 OpPLfR4oEiDeUOQQHDVxukgwpZyMTqS37b72UZZq0OodI/FSfazpuE1+JNIeTYIQS1
	 5+CeO5IL0kChUJoNPf5yfGmyzab3CBwBKA5O5lrc40UTg8G0U66jjDLUbqxP+pugx/
	 RzkEwjiazlkow==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E95213782163;
	Wed, 19 Jun 2024 10:04:01 +0000 (UTC)
Message-ID: <d09deba3-1687-4062-b8ad-7610a18a270e@collabora.com>
Date: Wed, 19 Jun 2024 12:04:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 16/16] arm64: dts: mediatek: add audio support
 for mt8365-evk
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-16-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-16-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add the sound node which is linked to the MT8365 SoC AFE and
> the MT6357 audio codec.
> 
> Update the file header.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 89 +++++++++++++++++++++++++++++
>   1 file changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 50cbaefa1a99..1d5457f9a4c2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -4,6 +4,7 @@
>    * Authors:
>    * Fabien Parent <fparent@baylibre.com>
>    * Bernhard Rosenkränzer <bero@baylibre.com>
> + * Alexandre Mergnat <amergnat@baylibre.com>
>    */
>   
>   /dts-v1/;
> @@ -86,6 +87,28 @@ optee_reserved: optee@43200000 {
>   			reg = <0 0x43200000 0 0x00c00000>;
>   		};
>   	};
> +
> +	sound: sound {
> +		compatible = "mediatek,mt8365-mt6357";
> +		pinctrl-names = "default",
> +				"dmic",
> +				"miso_off",
> +				"miso_on",
> +				"mosi_off",
> +				"mosi_on";
> +		pinctrl-0 = <&aud_default_pins>;
> +		pinctrl-1 = <&aud_dmic_pins>;
> +		pinctrl-2 = <&aud_miso_off_pins>;
> +		pinctrl-3 = <&aud_miso_on_pins>;
> +		pinctrl-4 = <&aud_mosi_off_pins>;
> +		pinctrl-5 = <&aud_mosi_on_pins>;
> +		mediatek,platform = <&afe>;
> +	};
> +};
> +
> +&afe {
> +	mediatek,dmic-mode = <1>;
> +	status = "okay";
>   };
>   
>   &cpu0 {
> @@ -178,9 +201,75 @@ &mt6357_pmic {
>   	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
>   	interrupt-controller;
>   	#interrupt-cells = <2>;
> +	vaud28-supply = <&mt6357_vaud28_reg>;
> +	audio-codec {
> +		mediatek,micbias0-microvolt = <1900000>;
> +		mediatek,micbias1-microvolt = <1700000>;
> +	};
>   };
>   
>   &pio {
> +	aud_default_pins: audiodefault-pins {
> +		pins {

clk-dat-pins

> +			pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
> +				 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
> +				 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
> +				 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
> +		};
> +	};
> +
> +	aud_dmic_pins: audiodmic-pins {
> +		pins {

clk-dat-pins

> +			pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
> +				 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
> +				 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
> +		};
> +	};
> +
> +	aud_miso_off_pins: misooff-pins {
> +		pins {

clk-dat-pins

and same for all the others.

> +			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
> +				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
> +				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
> +				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
> +			input-enable;
> +			bias-pull-down;
> +			drive-strength = <MTK_DRIVE_2mA>;
drive-strength = <2>;

> +		};
> +	};
> +
> +	aud_miso_on_pins: misoon-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
> +				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
> +				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
> +				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
> +			drive-strength = <MTK_DRIVE_6mA>;

= <6>;

> +		};
> +	};
> +
> +	aud_mosi_off_pins: mosioff-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
> +				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
> +				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
> +				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
> +			input-enable;
> +			bias-pull-down;
> +			drive-strength = <MTK_DRIVE_2mA>;

= <2>;

> +		};
> +	};
> +
> +	aud_mosi_on_pins: mosion-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
> +				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
> +				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
> +				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
> +			drive-strength = <MTK_DRIVE_6mA>;

= <6>;

Cheers,
Angelo

