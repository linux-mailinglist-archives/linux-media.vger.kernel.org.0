Return-Path: <linux-media+bounces-37963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85929B0899E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 11:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DA15A41612
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D639828A727;
	Thu, 17 Jul 2025 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bJJ64sE7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB4124293F
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752745559; cv=none; b=Y2rgSa6gAD2HBgeA10f5TpkRe6W9AXJztollxK0Vzb4ooMfQe6SsjX0t+T1UhWXmwC6H4XvmPt/e82HEqfuHGZhnLTYJ0EZBPuaAjhTSCd1S80AYnzaYeT0Aj06/2jBg1LOVJKKA80VNh3BJUriymQHOFlZaIboxb0sB3dvYlic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752745559; c=relaxed/simple;
	bh=icvA0K1RPNBcWvfLGCmVKRBjbcIiYHmiy0ARHjx5WsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eNl+gknp+zpg0hbx5PKB0AmnnVyf1gcD9NafXUaoX1u3CChbIiPBkUnlSjKL3O44MXjyjOaaCqYewmjRxT6DmyCk70sZXXiod5LXf4eLkuP8w+9wwVtdbPtv2e/zZzeGT2++QfcjKKkaCGJBmAzzKdoJE1htt5yYuZZvuOwz8Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bJJ64sE7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so407313f8f.2
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 02:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752745554; x=1753350354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4UUb+eCCVRH9h09fVkojxVw36lrz4Ml2/6BK0w+a3Nk=;
        b=bJJ64sE7ElzZf0LGDF+KQU5J3rGT2qjQAZdFWW9zG8CoP4+aKDavgcMdVyKYlV56eR
         Zco96hfKijdjLHY4z65V0XgOZbN2/1NQ1hn9ajJchvY27cMY8Kr2gTRRUUc10dquiwWH
         EIy529hfKMPAeAy9L9i7GLmU2R7MSAqkMV0pmRm/SV43lL14jxoYBb4O2IMgHDciSya7
         +75L3aQS9nuyVIdF9rz/LHQ3+E631Lg4QloQfF0BHD+djy2Yrm4ATaP44c5jFb4rDMLY
         wYMxHDpCZCOpInAJVrzfMN5ru10QWz/H9mGaPUiyouvTiTgF3B8QHIDW161yH7mARoQZ
         XxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752745554; x=1753350354;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UUb+eCCVRH9h09fVkojxVw36lrz4Ml2/6BK0w+a3Nk=;
        b=iYh8CT16/gTfgl2lM08oEQhKovjw245ms5DII5y6rbN6XDdmGmw0cJpq+ASUkdATRz
         Fd/2XqKWFkMX0+Cq7Vq4q8fw9OCVoCGulKuPd/K7S/ayBnH5r2Jm2eTbg3RFzcMa4is5
         y3T/n1H6wEU1KZMTVyqWkU4wFY4kxzo6JhIljEKW2UZOoZE7J1eK+2ZLlAkdfXLYKJl8
         ml6NGzJVju2CR/J6nWMuewsxrSx/1g1r5AjLCl3edc0CUdAxmHlhikYb19TOGeCF4MWY
         oBsg+EQMNbWTwUkbJ/Zu0xzVq0zbgtgbWA2T+rpj+9Lkh3klfxqeyD33ObyMhyAAJ8MO
         pTEA==
X-Gm-Message-State: AOJu0Yw7U4JI86Dlt1W2oHO50T9he43TH0ejLDlz0b6s18agrZknfC2M
	WmGDohpOJ2Op0U//KLahEAT6g7/u5zd7nC/VHuGMHx95n7he89MXdioOAXf0KfrlHZc=
X-Gm-Gg: ASbGncuQic93rvHKsfMHz2YSYl2r54zDo2wKN204vByU50xiHs1YZUQxVBxoewxFBaY
	IrtQfNxAOFvXQ/YOU81uKbcCzn4Qs9IeJ99uXObxiSn4JaeXxQohjLH2LRXbQ0a9u6LXf4iAmTT
	VksugoJwiP8cpkWNRrwKpHPqIW2mdhFsX3qlv/mOpRyZv7JF6CLbUXnVsge5JD04CkPAClefBj3
	YegdFLDZ9sv4SyOwWv+ZkqvuIsZ/b9jvHFTrjAhXsR91VUkJThTfwu2DDSFgZ51/RXLz4X2if6s
	g2tBBNGJgdTfg4YczKjWEU3ZB9Y3vqlOc2BCw+WnqD0XHKF7xQ8KNG7IoLgfHH4xg10BSOhbY7P
	erzQtJXIXqeIbBDJJKNPbDIEO6ZgbRBpD4Skx27BtrqmuyGbO4rLryjwfe123lXk=
X-Google-Smtp-Source: AGHT+IHP2SvnCCzI3J6cTXMGXPD2s7F8PxV92aFEphVYbHWG+syxiVGQMy54GQ/w+kIwvVDzdKb1dw==
X-Received: by 2002:a05:6000:4a06:b0:3a4:dc32:6cbc with SMTP id ffacd0b85a97d-3b60dd53fe5mr5975700f8f.20.1752745553877;
        Thu, 17 Jul 2025 02:45:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1de0sm20112044f8f.24.2025.07.17.02.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 02:45:53 -0700 (PDT)
Message-ID: <00be65fd-2a25-4b6d-8fb8-7a40f8ca846c@linaro.org>
Date: Thu, 17 Jul 2025 10:45:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] arm64: dts: qcom: qrb2210-rb1: Enable Venus
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, mchehab@kernel.org, andersson@kernel.org,
 conor+dt@kernel.org, amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-8-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250715204749.2189875-8-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> Enable Venus on the QRB2210 RB1 development board.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index b2e0fc5501c1..8ccc217d2a80 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -711,3 +711,7 @@ &wifi {
>   &xo_board {
>   	clock-frequency = <38400000>;
>   };
> +
> +&venus {
> +	status = "okay";
> +};


goes here

&venus {
	status = "okay";
};

&wifi {
         vdd-0.8-cx-mx-supply = <&pm4125_l7>;
         vdd-1.8-xo-supply = <&pm4125_l13>;
         vdd-1.3-rfa-supply = <&pm4125_l10>;
         vdd-3.3-ch0-supply = <&pm4125_l22>;
         qcom,calibration-variant = "Thundercomm_RB1";
         firmware-name = "qcm2290";
         status = "okay";
};

&xo_board {
         clock-frequency = <38400000>;
};

---
bod

