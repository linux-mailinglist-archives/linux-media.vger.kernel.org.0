Return-Path: <linux-media+bounces-50904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 229C8D32AC6
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 15:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D54113012E8A
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 14:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF633933F4;
	Fri, 16 Jan 2026 14:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UC5E7Drk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZA1v2PU3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D48392C41
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 14:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768574028; cv=none; b=t4U8hi5jRMdr+++0sERyQxjhEsY1lYoWe8TTXl73g1w0vuRqLxmCHREKC6cnLp6s7h7jH5w4CWVslcf+Wkhs/iP8diV+mPBwk3+BHUTkJURGweFyV7g9++/S1UIafgVf6Cgm9/C22QA4S5qkHHzfy55M+yJpZ+JdsxtJMPFZozM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768574028; c=relaxed/simple;
	bh=DfZnrC2/XWteyHGq6Y7LKw5tSx7FDs7acTTloGgYEUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LouUOwrHDukn/Z7qw8u+I5Ls050IF9l614UTjMoQXKdI1jc3dufj3WTstyB/mzaUsqoNHXwcAccfc9d3PdGqLkDV01j72shTvFrvtbCqIUDdhvoYA9xySbcMbKS/xCTDhewnGkBebTR6qYwHmu6zNVvbjA0fMdbNcncnrkbgSW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UC5E7Drk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZA1v2PU3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G9iNqa006964
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 14:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZaHsD/0AD7lBzKkvh6XVMrU+9amfBPvv7vVc2iCwtKs=; b=UC5E7DrkZ1z5Uv+7
	FycRnXLQwY+1rTM48xRK/1J9gd975UbMQ7qofeEm5VskxtcczMF7hiwiuMVqgkeY
	8b/wVYSI+64va092l0RCPEsFiALYYQdESd4Y9DPP7MUioGHQ/2dYHI94XMdNpQJH
	/TZIUpqhnUIV0zDoZEqhfDoFclr5MM8EGfxx5I+7lTk2ykOip31lmlz6tCT+cc8Z
	dHSNqnS5rFpw60M0v4gbAfWrQN4EwMJdRMRX0TAia5dJJ1cC/zZcrgv26y6UMYjj
	4mJfQAVG0Vq34USJCP3DRvs9BhQvn+lakWgQa8MZTpQsgu8vF8E+MKM3CyVpPHLQ
	/BbdXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqjy9rset-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 14:33:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2194e266aso540940385a.3
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 06:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768574025; x=1769178825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaHsD/0AD7lBzKkvh6XVMrU+9amfBPvv7vVc2iCwtKs=;
        b=ZA1v2PU3Bb+ZYLjqcSsAapiQYTQFKQ4J0ougK56i4huyZUDhdUmP4wR0PsA1Ab/5DA
         JqoxfQ46MIhnKspzqkxJYxOC4MLI3vUA+R7ymBlp+9tehoT2jHRRlxJCL29LuNuBSofZ
         gwTjT2LCCZ+vqYVH7Hiq/nWHLIKimqEZOqris6LOyyONLFzWLjEakdxb0WDTH5BXWCku
         EGBVqklr+qzj7fERYjOh5IIbyWQnVzjpiwErdxLC+3VctT2Uo/isdd2kmKncFrZSpv0X
         ePfIX6SpNa7ogBWw0BP/vOoTzhPbQZJU+3WF41j9mwu+3fZnG4nbtSKPClmQyd3yRHJT
         RWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768574025; x=1769178825;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaHsD/0AD7lBzKkvh6XVMrU+9amfBPvv7vVc2iCwtKs=;
        b=O9/86uESpN5V/LnAd36I7qPYK6Z8umAxB/Gt02r3yc9hW0TF1r0erMVbC+GHFlxxqk
         xkyNUClRBk/yCD75ZkELMe5mxiDhXgjXpDisf+pOEhc1L2VuHEqXtYIQGcqaCZA7V66m
         sClEUBlVftXE3DxVd/NWNj2Z5hszXcP9jxquUYvmel2nllyZ7Y2vPJpIMpc9kJfPc3NL
         DXrodVOtH3T7U/NxRGPb7EvVM5aiVdFlNfu6mfNdiz8l03ItqxUlKg/osx0pgJkt7nxw
         DewdukrtFYl/yHqbrYQR3ZAxsr8CRmALTWhqzd/7f+uvkimBMRwAjqpOTVA6+qR2WRKa
         r5Fg==
X-Gm-Message-State: AOJu0YzCK6kMDa1ZQJ20ku72smXpvwUl8xeDu+jm+fUy6zicYLVTDcGi
	Gmc5M94kCINYa1LxkLObWd0lY7z/w4HrWMcBZKseRdWMeZxp4PtDFMmMx6E3F9xUZqY3NmXTiBr
	V/3+MMWlDXHh7jBv5t3EPy3FHOujftgLvaw7TQ1jt5P0bYeEc5sCJkVmnBJpVV+soXA==
X-Gm-Gg: AY/fxX5VY4MlBErV/1n0FLe9327u1B/uG//5pkqqCfq8FiflLFAynWOT8jr2MLtDVcu
	NbXMj5l9Aq3k4RYSAchkEULWHNSb6+y1M7MSnugBNHpzZgnLibXCWO3DVNavjJPnIJiqmVstSy8
	i3AFsFZvySEA6XbmmQ6lM5ra9IpgJsnTn1Zea5/YqxhzSeYy92Cm0vJedu2eQVEHrSiQxCn/l7b
	KSS9tNpsE5rzYk3ab5rVS5hN3N05ah/VU4N4+6D7O/vKJUeCUSjFjnyuMxIn83REaYgjsKs7uqw
	6Dfe5++TOHYXVed4He7ydXS+uNbEz4AvZmtT9Ag8EfVLZUBoyl1VajmZ6cV6VE8G67jkj1w57Y4
	gM0rupabt0v1rklSJUAo8OzVcGkSwTDodG+6j+Q==
X-Received: by 2002:a05:620a:28c5:b0:8c5:3045:3e7b with SMTP id af79cd13be357-8c6a66f1e53mr472488985a.26.1768574025509;
        Fri, 16 Jan 2026 06:33:45 -0800 (PST)
X-Received: by 2002:a05:620a:28c5:b0:8c5:3045:3e7b with SMTP id af79cd13be357-8c6a66f1e53mr472482485a.26.1768574025035;
        Fri, 16 Jan 2026 06:33:45 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm5623880f8f.9.2026.01.16.06.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 06:33:44 -0800 (PST)
Message-ID: <49ebb3b2-128c-4fe8-abea-51a3d47cce73@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 15:33:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
To: michael.riesch@collabora.com, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Collabora Kernel Team <kernel@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v6-0-b7ce6e68b3fa@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251114-rockchip-mipi-receiver-v6-0-b7ce6e68b3fa@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jSPUA_XiSDKeHtdfoCVxFUNf15p-yE4N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEwMiBTYWx0ZWRfX9zSnjFrOeOwY
 xCfYSCNMCt9ozfqLretGOcAmuum+0jmGMY7GR9t5t1LnW3Gne1gDJfFNEuyYisOVyCivWU/VrAi
 +cE5zRI5iZXJ0/vcpGgLv+D9B7gMjSbpDvSp4vrEXHbDrPRCEF8eKjghrEYaKryPPouv6OFwRGy
 RYPPP2jD/4TLp+tpecjnwPyTk9OW2LkKwEIlMTVADT1jBYGhg5YVVHTTJcg8IGgXF0sQi1tNZy1
 IwrZxfElNlF1r09699pYpxMlvu+WVw9GOscoxSAymezx1vlfzd/Pd+xsvWcQguo/VMcxqICajBa
 LV2ixnTBQpb2uQw1ZdLZswXG2hAWrtVt83I9Dl6R5fl9lO9VGYtddLxX+qwYsL0+70vQblG8GJz
 BQXEOCfWUYSz1fpo3ZAPNAYowgamkCFzlDSx2TRWYPWO8baWYg7JCvpGfH3c4xTmDJQ7w510gZK
 2UnhDdtF9fgI6MCJFhg==
X-Authority-Analysis: v=2.4 cv=OJIqHCaB c=1 sm=1 tr=0 ts=696a4c4a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=etG1dv-_i460GIfEFeoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: jSPUA_XiSDKeHtdfoCVxFUNf15p-yE4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_05,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160102

On 16/01/2026 14:54, Michael Riesch via B4 Relay wrote:
> Habidere,
> 
> This series adds support for the Rockchip MIPI CSI-2 Receiver that is
> integrated into recent Rockchip SoCs, such as the RK3568 and the RK3588.
> 

Please slow down and post it once per 24h or 2-3 days. Not every 50
minutes. Allow people to actually review your code.

Best regards,
Krzysztof

