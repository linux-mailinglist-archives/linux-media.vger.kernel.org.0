Return-Path: <linux-media+bounces-50107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC842CFC913
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 09:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 004353079416
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 08:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6F829BDA0;
	Wed,  7 Jan 2026 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aul2oRo7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ey14xgLU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFDA275861
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 08:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773836; cv=none; b=czfw0bJsivMqeMcd1q+0+Oig0CM9vywR6XyZKCJUlnwnrZAA1OhQX5hn21SCzOXrGhytz+5p8ftUXFIt8NVSm1FfEJjONs4lQ3SfYDu/Zo7Pytmu1cO1pRsBVWD3LNfExbQcp7y8OcTmva2iqiY1ywsUt5g1d2G7rS8+1dVXxfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773836; c=relaxed/simple;
	bh=ldXPkGLNn3RJg18xZxfZG7HSQHf0UxCv71TUKV6kLoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndXfViqjqlgQlRpl+eMW55qdVTpsHNUvdooj1yCCObe4undCLx2YK/lcjNYmoPhc74LoRvTK74jL1T+2N58rGWD9K1HUTfXws2L4boSFHlpKwwxAtZ/aGvosdZPbH7pLryPfk9ESCUX0M4EruHApyGsg8oJTc6E+ofKQbZKiJqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aul2oRo7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ey14xgLU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tX2q2379374
	for <linux-media@vger.kernel.org>; Wed, 7 Jan 2026 08:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U2iE+15PNQebJJTmVX478oR3/nqce794ugguGlPvuY4=; b=Aul2oRo7WPYlZIMS
	rgkpkGBuC54TiaQM3AFEU/gzPpcRCPfeWtC+NSdej51HsExYTlUvx6KLrmvi9/H7
	FtTKTD2WhSaZed3PaiywkECAyVRFah1alXzdWzHLBkxM7fOIc0ng4aiipcWhqCIf
	qJtuF+QQP5zylpYiSmSmLtPfERWSdcJVsRxKZMDIcufL/p76uhxHqOTfchRHR4VD
	mlpPddY20c6N4Mb4T9Jb8vMQdBUHVq4Lj9PJ5vbJ4iVloWa47aYN5+5mebVaKJao
	tRXd6jEV2ajXxS6oFe+naK7q01cwn1YJBRaIf7EAdaegmb1HGultSznYJYbNnuaY
	sP992A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4r850-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 08:17:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-890586c53e0so41888656d6.2
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 00:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767773833; x=1768378633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U2iE+15PNQebJJTmVX478oR3/nqce794ugguGlPvuY4=;
        b=Ey14xgLUa5ryI+wNAY+urR8dZhfmaYAVdl5adVhaleZEIZD4+GgXrEJUvBgO8RnDJX
         sx7FQw7SStn/c+33Ql+Fishs9wZCT7bqB99PT/94Gs5yIOyMAKU2AnelOLsfEahXIbXB
         U8MRwUeOCBm+hjt51bmg4Poopza/uhzEs0JOq0tTTLVwO1VFiTiy0g8CHHdBzbWyqaLV
         OKd0iNCLohgZ4ILD4RySvU07aV+86qJMNHxuhnzo04ZmIR9Rn/b9qjjTYVXv1FfG9OiE
         pE5JeOpm7k6CSotSctqPrpwLpN1lphS6JErwRpp0zBTsH6IZXLpktxfRi+VwmtbvDLzJ
         31nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773833; x=1768378633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2iE+15PNQebJJTmVX478oR3/nqce794ugguGlPvuY4=;
        b=dSGV9+iDpWqc5tUI40+aCraYArzJtSOqxcn/TS2wZr1SeMjY/REz12YEBabFqsdMLr
         yswp59UclgB3Dw/Jb9DLFs/u7xeVMXhkks7WVOxyJ2Xnk+xb/Gh53IqU1DyFycOM9cqO
         umGhviSH9F4pPkbTTbQYFmogsaPXUytDfD+K3hAJmhczu7O8plGRfg5bcPmHSL1KfkeQ
         WuntKawpe9BaCCNhna2P7X6srIUKLdD20THqNkEtiLmK3VhkXxx4n/gVDh92hIYJxM0t
         CgpNM9xb2Fs1jMFnvQyvtDYrt8G8INm9BjdjmRrMTH1+i0UX1FWZAKjMeb20oFJIjOBk
         Kn5g==
X-Forwarded-Encrypted: i=1; AJvYcCV4BiPIS83Go8ErlNOiZIwNmCVWWpBGlBzSipkxutrPZw2lPOU0VeeDP/mXG6Hb1ggGk9koLB++QShemg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypnBNhG/zyxPb0ZnJ7QEkoDFZBdREP/bEdYjr9GnFsqK/asNvF
	pF6UgXpFKOMiXIEn0ANB985QzrOwasOkcmISPkJwAjB3fCtLPEC4kKuFKrW4RfFdE9QFwzNG7JX
	VNyrEYt/7mjcnEdwVprgHbgirVDpo+BYTesDJR/pOvgJEzwr2q49OarklQZ5s5gJdYBalX06TXx
	41
X-Gm-Gg: AY/fxX5lKCuOo7pYyn1c2w85m6jVk598POitjKA6IcnphlylFD4w4c5bL+14eQBVfuR
	TbNtUEbN/FUBFY45qfko4FcU5b20gLjQQ5HwngvHpyFb7Itf/BF5L7i49gouxypdftoyh/pvQtW
	WLDh8F9C8fpWFEW0yeyjaSsyi66fe7ywK4DBIyxNgqIFuuT68U8M3FQbGMKNfINycg9fLzx8qxN
	NZfMy3WRyADfXy+6GpwxsOP9wnk4lzdWNSW5UZja/jCRdw1D7CenIBLrTPtsgd/eSumrES23eFr
	XZUpOS/sUGiYV4+Be7Ser/eCHEMVhAhx3jE1rQrirTJS5bAHPwqDEfie5Nu+oOeu2Hp1okGU5i0
	YFeSeepRNMJ09PUvAe/6M3hyIDL2tyzQq73XlvR+96RfHKAA7cVnLXOHQ5oCcG4sIrvz+H+En
X-Received: by 2002:a05:6214:5906:b0:880:4dd2:1d15 with SMTP id 6a1803df08f44-89084234e9fmr20476216d6.44.1767773833007;
        Wed, 07 Jan 2026 00:17:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgI2M46l1hZz0zobajaGBNbSLWEqTTf+RNOEJNRuWYa5RNpyEqJHelvJSG2u3yIkeg2cdpxQ==
X-Received: by 2002:a05:6214:5906:b0:880:4dd2:1d15 with SMTP id 6a1803df08f44-89084234e9fmr20476096d6.44.1767773832565;
        Wed, 07 Jan 2026 00:17:12 -0800 (PST)
Received: from [10.38.247.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077268016sm28921426d6.46.2026.01.07.00.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 00:17:12 -0800 (PST)
Message-ID: <6a74e675-b011-4e1d-860c-4c3232beb2a2@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 16:17:04 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>
 <20260107-tungsten-barracuda-of-management-5edb0b@quoll>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260107-tungsten-barracuda-of-management-5edb0b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e168a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BatDUjzfUMZcbphu-t4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NiBTYWx0ZWRfXwBTwj7qjwQsv
 DoFIMDUX1oXkz8UqXqbA1SOZUDayfc1+SYvQUShmrY8+epoB1rx5JfaKtLmKkGAOv/6jZ4iQNXZ
 x+2qUXGP3jblupIzlwjxm+G0VRSOHSpAL6sqK1JE9ESPfOqD5U87M12M5pzacvALD1xwMABfiP6
 NnU6kTLifmMLfhA8ivIZYteJ9hrm9ofQSDKs1LRvHkgxa2qcZKnZU8nGqdj0CS0fYZnWhSilqCz
 VPlIRHed8FEu6UrlBu6USXA8lsCUSCXTuh/npYrzmGZFxxbkSTn37nfX5eLEnhJT9aHpimrAYbb
 pru3988yTQXau9e4KDJAYUj0m6X4NX2FAXzH7A99CaoUkplrMlmhYR/KsEJoMIFv6xeUSpnLqo6
 cQCpVmnFRWydBqJLtoxel8/vHLAguyqkrl33tRnfglMBrdNnsq43x3UnWigZORmUbiPuoOu1sXW
 DSNjXBaDlXUGRXS22Wg==
X-Proofpoint-GUID: QbvrmgC3l7UbCf1nizdPDZJg_5sJLzKV
X-Proofpoint-ORIG-GUID: QbvrmgC3l7UbCf1nizdPDZJg_5sJLzKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070066



On 1/7/2026 4:00 PM, Krzysztof Kozlowski wrote:
> On Tue, Jan 06, 2026 at 05:39:53PM +0800, Wenmeng Liu wrote:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm6150-cci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +          maxItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: soc_ahb
> 
> Same question as before. I did not see any resolution of this in
> changelog or commit msg.
> 
Will update commit msg in next version:

For this platform, it uses soc_ahb instead of camnoc_axi.



How about this?

Thanks,
Wenmeng



