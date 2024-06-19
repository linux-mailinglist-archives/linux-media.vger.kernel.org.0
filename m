Return-Path: <linux-media+bounces-13748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D4590F4E8
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 19:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A491F21D09
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 17:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77920156237;
	Wed, 19 Jun 2024 17:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfVB5J3b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33AD14EC56;
	Wed, 19 Jun 2024 17:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718817587; cv=none; b=bfZgayBqy+429FHrxu2GS76FH9FLUrYXdY2TT0ZGMpE3bmjuUMbmnmflAVsF/6F4XXw4mIxntcykrNH8hl2EuypFCmXRbvCmMnMIROrZKOnjQZtut7HJg8TFyV/ogZKqJv1B4alRjLV93QomK3VtbibPl9wvRJ5JmwqXNGJqHY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718817587; c=relaxed/simple;
	bh=mm1hylyXkmDHuJt81ydCZkHXptOfO14tJz3vZpematc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTrh3nYEtpVznwiomLT3ih74inLLJtCXHDMH3KubiKSQlg2CLW05v7v2rE6ajTiOhqjupvt816ttBgKeiBd6FLMbY96jQuMJaH9nLU4qb2P1lV3E7Ca4o/OlRIB5WVwYi9fmTC9+SUt/+6G+BocsaOcg1knH0LmebFgShqji3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfVB5J3b; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57d046f4afdso1179108a12.1;
        Wed, 19 Jun 2024 10:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718817583; x=1719422383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukRvnNcVX5voue1fTgUH3KmAmzHRKYHvwwI9CKvpFMY=;
        b=IfVB5J3bEMYyqhsXBwFLORISgb73Lz6EDWILStcr8sj+Dyw4ie5zIkYHQDfP1LRpko
         xETRZeLkBDhlcrlDoWGoqA7Etrx6+THobQRbANaWmK7Ae79+McfiQ6uOjDned37o6MOZ
         As7t9ZuJ+xb5bKN7nftavvKrNHKfLshS4on7VGMxa3Rq+y3JwnVU5A+9rZ0DBNXw836R
         1KOZYdTSOUUXSgOjBt6RAYJ2n3Q4dH+X9kkMfiUTd/M8I5PQKpmFUfQpE7ic7IYkvaGg
         eKqBRQHy9VBxtjYttwu4jM5UfC4xN4GHUv7U1RWyQ//tzV8VoQ8F7fORXnVcHlW93JRG
         8PpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718817583; x=1719422383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukRvnNcVX5voue1fTgUH3KmAmzHRKYHvwwI9CKvpFMY=;
        b=U+tOcZrBD8IC4zMjT6vCaE6YmexqltSDziR570HC9tzTyxSMT2Ld8ZKcAncqOtVABT
         2oPRwZYeZGn59/rqGOlI/ud/wc8MlFFknKghw5XCnLnK6zLwxxs44MjewhBttyTuGy3m
         wk18rmivmEcKO4rNhwJsrdTbPmcfpKrQRscB2UgoTZhvjpmfsg/1rDLHFYQ/x/vDmvLo
         DuP/MZrT0+rclDlVdLn53xJc/+q/0vgPkmH/VhMndcClk+wYl11n95gqnu6ByIAFdkAJ
         sf143dI+hp8Z2It7wJkUgdJYd3Zb/uGXovOSacRRswt4cmKbC3Byxq4G3PWVyG43xSB5
         phag==
X-Forwarded-Encrypted: i=1; AJvYcCVgAh5syl8CcXg/yCQoOfFFBY07a9pAb/vRnCaX4jXBDvR8prV7UUxn87+g6SdnURWyn6Aj2s77wtvypbwikUBtcecBlKxWk7eBlnxmzvSY3gR0m0yQsyPY8I0I5VxvHi/R3BCwOIWlwUhOLb+L08EAHxJT7IEZ8XDe2IdS9jPb9TWhNGGR
X-Gm-Message-State: AOJu0Yz3yd0wyHnItLuh3y9VVZYR26ZLdOEWne/hZ/f07j95Mrz6fO6b
	x+ugKnYN/puCTJuXK2OUWykH16cvZy0OIUch5MMsCnePwJsvc+g=
X-Google-Smtp-Source: AGHT+IFNzK6QeAtlQ+ZgmOEcPV0B9TECO0/iPeztr7u31qsK3JvkUB2iuN22u9S27LK6ks8S/XPQqQ==
X-Received: by 2002:a50:96cf:0:b0:57c:5874:4f5c with SMTP id 4fb4d7f45d1cf-57d07ea857fmr2350044a12.32.1718817582346;
        Wed, 19 Jun 2024 10:19:42 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:a583:e39c:f68e:e81f? ([2a02:810b:f40:4600:a583:e39c:f68e:e81f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da371sm8529513a12.24.2024.06.19.10.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 10:19:42 -0700 (PDT)
Message-ID: <052f2ea7-2ded-4d39-a513-3a47fee1bf02@gmail.com>
Date: Wed, 19 Jun 2024 19:19:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
To: Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240619150029.59730-1-detlev.casanova@collabora.com>
 <20240619150029.59730-5-detlev.casanova@collabora.com>
 <6e5ddd5c-340d-4474-a490-427a82db4a97@kwiboo.se>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <6e5ddd5c-340d-4474-a490-427a82db4a97@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 19.06.24 um 17:28 schrieb Jonas Karlman:
> Hi Detlev,
>
> On 2024-06-19 16:57, Detlev Casanova wrote:
>> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
>>
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 50 +++++++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>> index 6ac5ac8b48ab..7690632f57f1 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>> @@ -2596,6 +2596,16 @@ system_sram2: sram@ff001000 {
>>   		ranges = <0x0 0x0 0xff001000 0xef000>;
>>   		#address-cells = <1>;
>>   		#size-cells = <1>;
>> +
>> +		vdec0_sram: rkvdec-sram@0 {
>> +			reg = <0x0 0x78000>;
>> +			pool;
>> +		};
>> +
>> +		vdec1_sram: rkvdec-sram@1 {
>> +			reg = <0x78000 0x77000>;
>> +			pool;
>> +		};
>>   	};
>>   
>>   	pinctrl: pinctrl {
>> @@ -2665,6 +2675,46 @@ gpio4: gpio@fec50000 {
>>   			#interrupt-cells = <2>;
>>   		};
>>   	};
>> +
>> +	vdec0: video-decoder@fdc38100 {
>> +		compatible = "rockchip,rk3588-vdec";
>> +		reg = <0x0 0xfdc38100 0x0 0x500>;
>> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
>> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CA>,
>> +			 <&cru CLK_RKVDEC0_CORE>, <&cru CLK_RKVDEC0_HEVC_CA>;
>> +		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
>> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
>> +				  <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
>> +		assigned-clock-rates = <800000000>, <600000000>,
>> +				       <600000000>, <1000000000>;
>> +		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, <&cru SRST_RKVDEC0_CA>,
>> +			 <&cru SRST_RKVDEC0_CORE>, <&cru SRST_RKVDEC0_HEVC_CA>;
>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
>> +			      "rst_core", "rst_hevc_cabac";
>> +		power-domains = <&power RK3588_PD_RKVDEC0>;
>> +		sram = <&vdec0_sram>;
>> +		status = "okay";
>> +	};
>> +
>> +	vdec1: video-decoder@fdc40100 {
>> +		compatible = "rockchip,rk3588-vdec";
>> +		reg = <0x0 0xfdc40100 0x0 0x500>;
>> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
>> +		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, <&cru CLK_RKVDEC1_CA>,
>> +			 <&cru CLK_RKVDEC1_CORE>, <&cru CLK_RKVDEC1_HEVC_CA>;
>> +		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
>> +		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru CLK_RKVDEC1_CORE>,
>> +				  <&cru CLK_RKVDEC1_CA>, <&cru CLK_RKVDEC1_HEVC_CA>;
>> +		assigned-clock-rates = <800000000>, <600000000>,
>> +				       <600000000>, <1000000000>;
>> +		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>, <&cru SRST_RKVDEC1_CA>,
>> +			 <&cru SRST_RKVDEC1_CORE>, <&cru SRST_RKVDEC1_HEVC_CA>;
>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
>> +			      "rst_core", "rst_hevc_cabac";
>> +		power-domains = <&power RK3588_PD_RKVDEC1>;
>> +		sram = <&vdec1_sram>;
>> +		status = "okay";
>> +	};
> This is still missing the iommus, please add the iommus, they should be
> supported/same as the one used for e.g. VOP2:
>
>    compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
>
> The VOP2 MMUs does have one extra mmu_cfg_mode flag in AUTO_GATING,
> compared to the VDPU381 MMUs, however only the AV1D MMU should be
> special on RK3588.
>
> Please add the iommus :-)
When looking add the vendor DT/iommu driver I'm seeing serval quirks
applied for vdec's iommus. Since it's rightly frowned upon adding such
boolean-quirk-properties to upstream devicetrees, we'd at least need
additional (fallback-) compatibles, even if it works with the iommu driver
as is (what I doubt, but haven't tested). We need to be able to apply those
quirks later without changing the devicetree (as usual) and I'm sure RK
devs haven't added these quirks for the personal amusement. If Detlev says
iommu is out of scope for this series (which is valid), I'd say it's fine
to leave them out for now (as no binding exists) and the HW works
(obviously) fine without them.

> Regards,
> Jonas
>
>>   };
>>   
>>   #include "rk3588s-pinctrl.dtsi"

