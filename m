Return-Path: <linux-media+bounces-41249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 949DFB39EC0
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 15:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B5713AB66C
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 13:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EF83126C4;
	Thu, 28 Aug 2025 13:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bAZTLsHO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F213115B2
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387510; cv=none; b=rSZV58ZzcGzsWWGfavy2DbemyHouyXxYzTBOyUsLRWHDT1C68yCYUhoTqReey4ColQbr4aPNn6qcHauna6xTWoU+6hCeYv29an+TqahPeT4L37T/PTkviu07JVDOk31fsJkrY9Iuasw1+3w5QYhtdX2KaFN1FeVZ7sIIurdzlvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387510; c=relaxed/simple;
	bh=Hx62hC2efafCdbQDxHi2B7OiIdyW02BYTfvtgOt7YqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kr9zpyNB9mY2prstr0z1X85g3D4LPob8QxxF/WStfl5tq23PkTnKxVbgwTWBa+ucuaR4n9lINl9cGdk4l5DuXAsdUPZebD240OZWI831hEP3A41fYI6N9Bjlr6G6wBWZX7cSEhsCFmSMDRnpiUuAvAI3FavM8xupxW0E94H/cRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bAZTLsHO; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb72d5409so152589466b.0
        for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756387506; x=1756992306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KP6GeI4QNlyVzRWNe4PL6HeP+siA3vt2wqk6FJm5c6M=;
        b=bAZTLsHO/Ek0iJUlU9+BwBvPmcc66TMQHGAezBrvw612q33DXdmoSIsAgzm4j3dlkm
         p7HtmNg6Lupz32URTUJBZSODp/eWybdEK3dIAHP+PkhxCRPGqZaxLRyDcOfC8/CWTNFK
         I35rFlORfP8G4dYCd+i+oo6L7MDidxJcbJrj8aj1YfWyUODCRgbqh1Swmj94DUmhEcGa
         OeSrPfiNxZ4Bg6pJJpW1OB8F+e2dWeoQCJGqjJlKSOcKFF8wuU07AoHV0zh50ufGqSIw
         /9r9no2ATg2pudkbron5FcNnVhwF2WH0EPB9v8xo9cFvX7Sskm8+x1UrtHdR3yQ5k2fI
         Yoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756387506; x=1756992306;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KP6GeI4QNlyVzRWNe4PL6HeP+siA3vt2wqk6FJm5c6M=;
        b=n1LvJURrgnf7/s2zG72LqD2up7B/r/y3DVjNwzuSJxrtYAEcP6/Ks/qTjWUXd5scoM
         NpfBvfKICyBXtiIOvoX/LfR2EZ1kVP37lyz0ufgCsRwsyfBcZAbAI8jatjKPhcep3tGI
         2/N/3DKDrHP9d5y9k6XUZ7pKiaCZhi7fnP89gJyvYRyOrR3lfzpBzD4CyLycQ0nq+tkP
         aQzbaDhfGOmba4iQQ4eQ+O1+5ghjqNF+yPxuQ3Iy1Pyty0hymMkASGY3kGvQHo58zlSF
         Bx1z7SDMP4tEpP3P9LijdJe8GyPRqxYcJQK8keuyENpxFb1JTLy+ADUIY8688O2UPdJz
         YsqA==
X-Gm-Message-State: AOJu0YwhYWzs7IRD1DRhSfISWzPESVZ1srQbCCSW0NDZWVJBb0xRApbG
	jgJAhPuYBFa7v0WESTdSbaSVhZlcvOskOIfoRafVEMPIvIxMAdvlXU8idSJ/4QhESI4=
X-Gm-Gg: ASbGncvoZmlv28/rOW8VJGdj1nN4N/fg64uh13mIWHAFOMnpAwD1gbjPSQ/GooLJl+k
	m4wxe4+y20vQCwkv7+L3FqqmYmZ1MzRjSYLyEZC5TqMEJW3WWGiJiN9NxOhPiImknnQ2rVN9CTV
	jhy9qKgGCzZ9lDwTAnmcn4e1J6jzXeW0JmcA/8cABJiIO4EDNl58E6DtN5Xov/1DbVio3pxPxfv
	fIA6J/l5um0CJeyJinEKsXOokqQX1AstaiDNah/1xI1yJmPSuLChQYjQDcW7eAF3R79z+simgxR
	yYvtHwk49/eAvpH+nYQg4/BB5ljPAuyLOY6OnwCtM7ktskeJsgwAe5k3f8/ABEMFxYP+fNSYaU/
	GtywC+BIF2pUyP16dW23kge2sIjkhgnP24oysHBx4Je+jImrV74aUqga7lNMZF/v2xgtUVEEBTF
	2HJg==
X-Google-Smtp-Source: AGHT+IHnstlza8K9C5w6vOWcSWmYNQEhQr+qMHGXGhuf3pnVngAd6eVaQO3IZGsyPfF2zyp3aTQhtA==
X-Received: by 2002:a17:907:968c:b0:afd:d9e4:51e7 with SMTP id a640c23a62f3a-afe296bceabmr2217290166b.63.1756387505863;
        Thu, 28 Aug 2025 06:25:05 -0700 (PDT)
Received: from [10.41.150.230] ([77.241.232.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe79fba62dsm926560266b.100.2025.08.28.06.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 06:25:04 -0700 (PDT)
Message-ID: <ecbde2de-d08a-4951-82a4-fb73760de73e@linaro.org>
Date: Thu, 28 Aug 2025 15:25:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 10/13] arm64: dts: rockchip: add the vip node to px30
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-10-62d8a7b209b4@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v10-10-62d8a7b209b4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2025 01:26, Michael Riesch via B4 Relay wrote:
> From: Mehdi Djait <mehdi.djait@bootlin.com>
> 
> Add the device tree node for the PX30 Video Input Processor (VIP).
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> [added cosmetic changes]
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> index 46f64cd33b9b..ef52879d6a73 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -1280,6 +1280,18 @@ isp_mmu: iommu@ff4a8000 {
>   		#iommu-cells = <0>;
>   	};
>   
> +	cif: video-capture@ff490000 {
> +		compatible = "rockchip,px30-vip";
> +		reg = <0x0 0xff490000 0x0 0x200>;
> +		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
> +		clock-names = "aclk", "hclk", "pclk";
> +		power-domains = <&power PX30_PD_VI>;
> +		resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
> +		reset-names = "axi", "ahb", "pclkin";
> +		status = "disabled";
> +	};
> +
>   	qos_gmac: qos@ff518000 {
>   		compatible = "rockchip,px30-qos", "syscon";
>   		reg = <0x0 0xff518000 0x0 0x20>;
> 

Now that I look at the rockchip dtsi it appears newline scarcity is the 
norm, you can disregard my suggestion for your example in the previous 
patch so.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

