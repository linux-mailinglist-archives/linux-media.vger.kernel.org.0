Return-Path: <linux-media+bounces-41827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071E7B45474
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158195A5D2A
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353092D63E5;
	Fri,  5 Sep 2025 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhf1vyfz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2210425C81B
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067699; cv=none; b=flj5VKYXTMojeLwESGdl0ASo/olSSzoaD838mSIe0LPCPqhH5QunlC767pq8YeEsO1GhblNyj1a+wEXLKrQr3uXtnMNYMbSVEP6e1zYfKYSQXboJaSFahUAeVuheqJOeGhme0yIQkdG5yJZrtMydkwuMSNnxxb+VLjH5avm+tus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067699; c=relaxed/simple;
	bh=qCppbG+eQP46tSiZEY0crGxJVA1nNjzZ4wk6qR9CveA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cx8EPKB0a8EaMpfdFZvnl38O8Zi97b90xBn8lSqXQKdWiXvgxIs4sxa3vvp0VMfjnI3BKW8zoeOfVLTH6EEsBZOsYtLgjDa92C6i0gTy5V5czUtfmpuWlkmxxoP0LQ2p6OkPPySoI+dM/ScCOcUbprMJwmtn5pCM1KTZEQraJaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhf1vyfz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856OmDH013660
	for <linux-media@vger.kernel.org>; Fri, 5 Sep 2025 10:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhX9I5xQxAo+v+fO6pOEhRjl3CA+K4fHzStrCxl2ggk=; b=hhf1vyfzR3s0A5fM
	DAhvWijlnL9vn8hTAJrsAS/QJdRIOzhUHe4DNHvnBAM8c6AlYh6iIUH7pJtEFPQ8
	0W8Qs4oByESPGxBuOwNPJhtOEGmpRK2+H5KNJf/n+NNGQBqGnz6ex49pvHYybjXH
	kxSnv/O2nXS8q3iEocuDlNoyLETuVmh7SPehXjajgThSuYwgnk8O61mLDSz7CqQm
	hkI71xkbjw9EObY1O7inRyc3U/U9yYF6yfqqFgu2yUATzP3N0/ZgjkdL8xOc8vOZ
	c6D3WLQXrPYKgFRfHQ79XI5Pnt3JOGEOoFrLASo8OVKMl1/74j9dkudyDdA8hRzz
	0pa5ew==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyeqad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 05 Sep 2025 10:21:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-715c9cad6f8so2372086d6.3
        for <linux-media@vger.kernel.org>; Fri, 05 Sep 2025 03:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757067696; x=1757672496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YhX9I5xQxAo+v+fO6pOEhRjl3CA+K4fHzStrCxl2ggk=;
        b=VPyfugSfvDbc1WY3sVf4gE+GmlsWdE6YHbd8UQAzhmeMfbXY79xTGAdPH00lbTzg1j
         PqPbdBq1BlUNpjpef8tUDlxY+923D2xGyB9IJQ038HXPEBnO4ug8jGcDPV3B5wGHp0BY
         V2MjR9sDuBNOHzhFxEKA304z8mUq+r847gIt2a50ip3gtT00aX62d0HxptFCLFTHCYWS
         u29EkaYeIDgVFfD70QtmKxfisox38hXFoNDKoiY9rbKsP4Jwi/Nu7SxQo/rbgjkc4XyO
         TbclFf+9B8c/ugBcsRpVak5tyLiDbr9GMOr+YEqO0zK8M9NUGZBlqx7xj49DhG2JzkcG
         1OYw==
X-Forwarded-Encrypted: i=1; AJvYcCX1hE0s13l39GHU4IzxmjAUquTXbYrbW/xmszDL+FfMULWEUlYGhJnhQxDpB/LTk5fk7o5Rv6cBJb/fSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPLtedWIAg89BPgvi9+4MjGl7y9/4P4UQdb+i8S+2iDqXvdZTx
	hWFFPTgw3QwTez0oEKZl5cv/OP6yj2rVOHEImjlDTcfQaxvU/T/S5P3HWZvRybLasYif8EUXdzx
	1XtjQZGuX5NpefQtE9KOX9hgJ9XlwfOfSFAHGIs8+wzY5B3WCoGT22HWbXo2XYEisXQ==
X-Gm-Gg: ASbGncvY6SqN/GBCeCJhQD32H4rBHy9PepxDffqBscpg4LmwgwwUaWHAXjW9DfkqFuC
	Oq0kCF6MYWe1q90z9orbHzR3LsqI+bsce83Q9a5t9vOWpXldTBmA1b3+38uUeZYsxDqpOHJ5scV
	WhxbBrEK0U8RYw7gVWxZaz9PDiC7nbrc8XOBF14JZsm98HUAjQHmhAsKDUKO6lCIV3gI01m/98b
	Xs57UJqjR8V/LbPzxhI4oVH7vhQaL/2cKrSbCqtQkKL2vuTrFWwp0VaTc/9J6pkpnY+Y9VejmUs
	i1uMKn4CUHUpr7byU26ekFhZtnWilDC6KxxjWfvZbj3WjLRT+HNSMPRlA5InN8N147vl2Eap8v/
	r11dtDM+6wzxJuhVN5lW+pg==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b495d11860mr62588631cf.1.1757067696139;
        Fri, 05 Sep 2025 03:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsI15M5gOFq5piSlzss18AHTX4GYCxGcCIZkv13DSKshZ+1CACZN6exOPR+BcJ3u0qTjcFRQ==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b495d11860mr62588541cf.1.1757067695509;
        Fri, 05 Sep 2025 03:21:35 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0424cc1698sm1249620566b.21.2025.09.05.03.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:21:35 -0700 (PDT)
Message-ID: <2408b467-f1b2-491f-a701-4e45e1a1e823@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 12:21:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-4-ed8f66f56da8@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905-leds-v2-4-ed8f66f56da8@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bab9b1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=QE2y9RwVZUYpaLmqgykA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: wOz1COHUXAkX7CTUEGudHfz88oAdkgJj
X-Proofpoint-ORIG-GUID: wOz1COHUXAkX7CTUEGudHfz88oAdkgJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX81l9OuZE2MPa
 nRff9pFnKUv/DCNaqFWw5/SBcg/XWDB/1YcMQWm7g3h/55CF8YOBvn9v1u1WoowqDPH9hPebbEs
 BOqMNy2qRl5uQbZGs9SDq7NtQTfaPDmwAaxdhCOsqhrkac1EdQBGkjkEyML/sOBMwH1b6elRjSy
 jEA/2A9ewCMIYilMbBpJcRL1GJn7i/ftWzwxYCJMcppPJ38Rvk4ogVbIJNG+nboPS0AeyyZcC6y
 yu42KzPnRjjT3zkcKn/9WazvlZVd71EQEZrbQ91EXs6NIQDCMVq8omhskoOigSaXllPdu2xgoE7
 AsoFa6uN34C9xdb2zrhDt8Ov6nX51ztrRLYq9mG6ImYWxvCWUSkWD9Ml2pZ6u90BV6SvY5iRJSY
 1QFZ9jG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On 9/5/25 9:59 AM, Aleksandrs Vinarskis wrote:
> Leverage newly introduced 'leds' and 'led-names' properties to pass
> indicator's phandle and function to v4l2 subnode. The latter supports
> privacy led since couple of years ago under 'privacy-led' designation.
> Unlike initially proposed trigger-source based approach, this solution
> cannot be easily bypassed from userspace, thus reducing privacy
> concerns.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..03801b174713cb9962c10072a73e9516abc45930 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -83,15 +83,11 @@ leds {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cam_indicator_en>;
>  
> -		led-camera-indicator {
> -			label = "white:camera-indicator";
> +		privacy_led: privacy-led {
>  			function = LED_FUNCTION_INDICATOR;
>  			color = <LED_COLOR_ID_WHITE>;
>  			gpios = <&tlmm 28 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "none";
>  			default-state = "off";
> -			/* Reuse as a panic indicator until we get a "camera on" trigger */
> -			panic-indicator;

I think panic-indicator may stay, as it's useful and mostly mutually
exclusive (bar some multi-OS use cases) with the camera being on,
with the comment above it obviously being removed as you did

Konrad

