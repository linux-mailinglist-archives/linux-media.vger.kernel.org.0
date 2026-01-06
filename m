Return-Path: <linux-media+bounces-50060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BD0CFA932
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 20:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AD1E308533D
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 19:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBBB380142;
	Tue,  6 Jan 2026 18:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLPPreo1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6ol/unq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E123B8D72
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767722729; cv=none; b=AqxLA1HxaPZ9F/IUNJXlgw6s01BIEtuwp+3yYU6hnYd5sdQ35Ves0mh3QYTp0b5lY3IAN/zV6oQ/JG9AhpGM1wBW18JwqvnnJHmKW7VINz1dKlAN6CC+BEWmpVOypm5HQaYYoSQElJWiW6YKZ3xV/Pqt+ltSxVcGPiWn7ZJ0xUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767722729; c=relaxed/simple;
	bh=u4Ucw346p0LskE2Agd4cJRPVq6GJdLEmyHn4EWRgWi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHT7/poMB+DBN179vGYLMzcPCEmSgR57e4xFLGybY133EhmM50LfWVi05djXRkQhJ5cUG6/UAWYZrY/oWu/jKrRGYdepP30gWt0EUsr9374IXyFC42VeNZqRqOys0iG3lDxm+YEoHGKikguN9Lmr3pNfUuxE53O2unqNYQKF/N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLPPreo1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6ol/unq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606EffKO322772
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 18:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AxdnYtkQsJk/Nx0EcAu08x9Bd7auZ3nLxm9/Y46BzGo=; b=LLPPreo1Kq+ql8mD
	gM6JoQxZI4oP6sphNDmzjcS9c1t2Bhtn8vF3N72RlhkOKE42YkZsWwBcBl1UHcCc
	TWsRS/PjzFE8jDl66XcFusU7bd+8FY84RAEXW6ngcLQuupdFGzHqk//cH011f8El
	qc2lOcN5Ia4GhFX4KJJGSkB5h+/sFXJ4HPh1zqHdMv1ixFuG3GKYFj1N/pl1yqF9
	wbzFstqXR2jgoUd0dSRaUvS+t86HqdqcR7msoypInpYqpEcO3mjXKHuh9ltA6XMI
	RUHg2nWXrafh9ILhzD+4FezlBIyEnRZ6dyF7iPzOOl5nM38M/L6Gtd8pLH0XO8O5
	68nPvA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh4crgmq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 18:05:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae546fa935so2150735eec.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 10:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767722726; x=1768327526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxdnYtkQsJk/Nx0EcAu08x9Bd7auZ3nLxm9/Y46BzGo=;
        b=g6ol/unq+u6bx7yIbfBIBtkBFAic09bPPjdSAXyVqAYLEURuehBBmUzHruIKis0uuV
         8wUDoEASfEibGlQPFQoEpNXIxXQx13DWNdq2zA+SOQTrWpMdLvtEOZ9a0vPM+nqtaHnS
         74LqoSqLxuf5y5+M/ShjXx9/gJOleFaSM1pYBj3034F6zunu+g7qkb7PZUBhrVw3Jh5f
         czPDvRoDQ+F+Y25MNobb5s3wrQu2kAOc0MqEoQkKopHaqgC5G3k5JRNFUDbFTCcbO2IH
         XDdOWm6l1KWfG8oufz7jEsB8GEXUy7jH1Jx7heEQ8tTdNwu3ht3wktINelRPOPnzs6hu
         XNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767722726; x=1768327526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxdnYtkQsJk/Nx0EcAu08x9Bd7auZ3nLxm9/Y46BzGo=;
        b=A4XyHxSnLaWYPBF7sWr9/+yz/EQE7gafgklGAkXK/1d41JL7C9sjPrHmZf2W1Zwuu0
         nvcEDpsIkDTLxg4WLCtM/3tSGGNII7z+U7PQo1hbpVHxxhGaPVmakqwWoRMl+dx6jqbI
         pYJEI327QMEqm9eLJ+7PDQVaOwhVMC+F19EPifjIoCMF0dUF7HBDJ7wnyK9FaJn6//t3
         i+1f5ZIudvGaoRq1Ynu5jgaQ3Oesd6CJzAR4zzN6za9YpEWrAFvEVGfNJpvnXj13HMli
         x/NGoaQwnSaB0FpuMhooBonRZhkL4Wv5mFOI8Zi8uAdVWHL+BamI+ThkJ6FuEeR6qBvn
         x5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUCstgJELFgE7znhhhgDOLsdgppeBCYHryr4HJkO8OcyD1ljalHf2yrNlO4T8Z4QeqVLFgTzTVn7pLflw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoHyWgBz4xdbOy8axBTVrlU+OVlzWxie3oVJv5ij/e6zXcF5Xo
	JgfniCydJF80UWQVOXC2b4Gu3KyU1+AWryKNJy6B9lSfhLO/DaYYz4zaFHARGfEP9+kejN8uba2
	Vl9xSz+mnxx/NGhbnc1ofqeBUZE9FJ8zFlpHcTs+pQ32QxkcJXNYrIXXFepE9qVvzyg==
X-Gm-Gg: AY/fxX7DKCCh4ZQYnaalgtVppdLpYsDTtJyvPt++iDGFFi338DntHnkIZgktAPFGetD
	ycYqRYs98NF8H/VuptVL0pKITAOHPoHikzjPZa0DKmKR3RmHRb+OUSLhWv8B6KicDg3uWbrhZ+q
	j0fnJRfB6/d5j4zTeIOgISLu8NR2L3IKvI1hwIRy8yroHRwf/ZIqL125WYRfze+l62DA4x/nRuh
	jL/8FUItgeAolBPOYOwD9AhBTgaCCCJnHQ74Hp5G+R5iAg11Ah4brpcipDu788xiP17yShEYJYr
	vGeVyIpRQx13ULRx6C2F0kjru4DGM1qP9WOc2z+pLCi83TXEWcWo6xr6XsTv9xLAqgEEgG4etki
	lf3g7qHfiRgfwaN5XFWzqetQ4C72XN8MYpgc1r6EeGgHT
X-Received: by 2002:a05:7301:4715:b0:2a4:3593:646a with SMTP id 5a478bee46e88-2b16f906b28mr2324264eec.26.1767722725815;
        Tue, 06 Jan 2026 10:05:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPmT/G9mHw1vDU2raXA+OeKBLh9EW3Uit++Kb5XbJqJTvaJem5/JDrr8t0ZlJgydfxs/Tk0w==
X-Received: by 2002:a05:7301:4715:b0:2a4:3593:646a with SMTP id 5a478bee46e88-2b16f906b28mr2324233eec.26.1767722725225;
        Tue, 06 Jan 2026 10:05:25 -0800 (PST)
Received: from [172.20.10.12] ([172.56.240.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b0b2bsm4208772eec.23.2026.01.06.10.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 10:05:24 -0800 (PST)
Message-ID: <ece56115-12be-47f4-bb50-106a10aa5b42@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:05:22 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-4-646fee2eb720@oss.qualcomm.com>
 <20251127-terrestrial-arboreal-bird-5a6d9b@kuoka>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20251127-terrestrial-arboreal-bird-5a6d9b@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9FwEOni c=1 sm=1 tr=0 ts=695d4ee6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=J3Fo5nLEaHaPiRlpdRcYgw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pAwv9sAArZx2eUU7DzAA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 9sK3yAGD7_gDNGhS1A9aQho_Lp63U46f
X-Proofpoint-GUID: 9sK3yAGD7_gDNGhS1A9aQho_Lp63U46f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1NiBTYWx0ZWRfX23RmyvjS1Gzu
 0r5VWljpelJ0GC949Sjl5cec8NEK5RAjZvwgvnMoPZmohkonLiodDKGHKp717OafQdnAzhzcyIK
 2FaxKAAWgLmiLEIWLrP0MCbEA3bYdLVt1/8z0bfXZH81O27n1zA/AzrWaVhitDT2RuoXLwjMzIc
 v1XQ52+tOIGPQkUle9iMN7m85GI0zDTtPhRm0i0gKGOrNf2lGz77fTBEXRP3YEPNKzUG3ItaIB8
 cr8gYTpRcEvCVwoSOLqQQYsUuz3LUFrdeR+Am2O1/5JxcehJs/xMmATQPNzKdokXXjW3yEYqp2+
 t7ogjBJ5egPQNh7Oni36Ryour5VnFfCgs2Hlxfmgd6yGH5ecY6vyqC98gDQxDIoesz6PqOPyyXU
 +pDyNT0urHqXXVe8/43FnRcbVE1gJwlC6OaqQLJ6y4w+0lBbAwXp+0NT51b7Uo0Oztrx1nUPs62
 2OvPrfbg8OAiA2OK4KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060156


On 11/27/2025 12:14 AM, Krzysztof Kozlowski wrote:
> On Wed, Nov 26, 2025 at 01:38:37AM -0800, Hangxiang Ma wrote:
>> Add more detailed resource information for CSIPHY devices in the camss
>> driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
>> that is responsible for the PHY lane register configuration, module
>> reset and interrupt handling.
>>
>> Additionally, generalize the struct name for the lane configuration that
>> had been added for Kaanapali and use it for SM8750 as well as they share
>> the settings.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  11 ++-
>>   drivers/media/platform/qcom/camss/camss.c          | 107 +++++++++++++++++++++
>>   2 files changed, 114 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index f9db7e195dfe..157e946f67db 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -684,9 +684,9 @@ csiphy_lane_regs lane_regs_sm8650[] = {
>>   	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   };
>>   
>> -/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
>> +/* 3nm 2PH v 2.3.0/2.4.0 2p5Gbps 4 lane DPHY mode */
>>   static const struct
>> -csiphy_lane_regs lane_regs_kaanapali[] = {
> There is no such line in next. Your cover letter does not explain
> dependencies.
Will do. Thanks.
>
>> +csiphy_lane_regs lane_regs_v_2_3[] = {
> Best regards,
> Krzysztof
>

