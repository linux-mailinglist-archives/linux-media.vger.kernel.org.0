Return-Path: <linux-media+bounces-49852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDADCEF365
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 19:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA3BA301673E
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 18:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1203191D8;
	Fri,  2 Jan 2026 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gD9ZmPSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lv5XODNZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EEE315D27
	for <linux-media@vger.kernel.org>; Fri,  2 Jan 2026 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767380354; cv=none; b=YBdQKm+KgqPWEVA5bUheOhFneRTy69gNBbwpO9kmNwYylv5kVbHQhOO+SIMHGGNK7zFHdz/wNO86kWCGNimPB4cP9+zK064C67FpV7ZGRAUswGHmd1G8sp2v+b8T+SRCoe/mtmlofuegagOeRb8WueywaYH8UqWnCt/ZIwHhJJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767380354; c=relaxed/simple;
	bh=Ikc5b75X2N/nN0ui7rHA46nMICE6Qo6nBKXUrVF2glc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQCNXNoMhe7SVYPue+yA5aKsGgrJSzS56D//fD/FTpDBJ5ysMbg9eSYyH+sv/+Fqq8uwBB2uG/vUQ+ArS+H7zwIFqc/BzTmjIpp+mnwM3YVjTBzV/tddVpq4aNwT4bDr5ID8GXET7/pdE0aIZGwJv4auS2D6uJK0FHx1gA9Uqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gD9ZmPSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lv5XODNZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602C0CQF315144
	for <linux-media@vger.kernel.org>; Fri, 2 Jan 2026 18:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkRgZRZXo+1YGbUUFJLarrQeT+vjwljFVTblp9cfZoo=; b=gD9ZmPSjBXnwCWoA
	NTDaIbA8U1MPQwztsl+mcp0jx34lJFZZOf5+pQQugOOwSXmQcMLM+i5y2UuNDaC4
	VeKRUYcSUIoGqtAKksKQP65bqe7AUnEV2IQrk4mPLTNmo6sQG9bOHJA1UKVb4PgS
	7wgyY1jPzI+SFheLVe2VXBqUZ/R53qSREzPontEi2AiCO6X1uuP0fmN/Q3t/oAfl
	fBvC6hSE14STyfq1N167Is6VLgMy4+JhZ3msHKWoMPQeD3oiDhQYE6fndXlEtfJe
	zAioFaPm+OHNQ/Fox89YHKhRQCsoVawh3tECduFHSIhttWyDhpkYErmHZQIlzp3T
	vrOnRA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedmxrspw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 02 Jan 2026 18:59:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c16eda1a75cso734567a12.3
        for <linux-media@vger.kernel.org>; Fri, 02 Jan 2026 10:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767380351; x=1767985151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZkRgZRZXo+1YGbUUFJLarrQeT+vjwljFVTblp9cfZoo=;
        b=Lv5XODNZ7FDXpzxIWkAy5ZfSORS7U0Mc+7b9o3y2biuWwRpRAsxyHxLtXDW7kVroG5
         Op5AT2JeKyBzwNLH9LB0gb+uhSgAZO3kJhV0gJpb4K4MU0EEXqE/zerdkNXhslLnIMsJ
         Br/8Fpz1wkURH3RVpH+nXKvlRyX6WFyw5OjPwwSSc7Zq/BjvC49EByH4L/gLF3JXV3Eu
         YChHp0Ga4U+AuBO1ES9a2ZuAFrM25Cr1FFgku1KR6JwtqmzxsOpd8yxE9X7xhDzWZgBL
         eUYM0lXDMcetyCKzQoLtgJ4dSgO4k706ESgk046sYnt01qKTPikcgs3ZOLpTiH2bfPsT
         eFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767380351; x=1767985151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkRgZRZXo+1YGbUUFJLarrQeT+vjwljFVTblp9cfZoo=;
        b=Sh2qZlGJzuLjxoh8woCgTru+F5wBJgumNqg6XPJTHk8L3v2669foxLNSrwbXhcC2an
         zPtqn3byZv2kIyTrc+qp3yEF1q8pdKLZhU3WEMH/MdR1dOY9oAagZsPlzEb+0UVWwCDE
         2RQZhJACwXBFcRof/aXo90MIorQ8B9/+s7UXjlHY+vQoS4ISia3EN0b97HxDz0XNAX+b
         CPDkgA/vFFBAHMMJCRzTMUOJref/RoGZnaRSVqD4bu+Gdet7/clWYAtrttIPluIXyH9u
         TqirmbHbQDvJUgrzhArLG9BbXyfndejxlX7HQBVyjoMGXFVOce1Jlo7+sOw0uSkS9YDQ
         YRsg==
X-Gm-Message-State: AOJu0YwcZEeSU9FOMUCVYPnbZE6SSaTtLAKDPFR87P2G+yuVdmEUI3Ft
	tVYKd1vurof4PfMwwibpDdiZvzSa0cKdBDb7LxrSuJYP2IcE+p0L+LSobn/lJBF2Z9bArswJGY0
	dQax/Jko6zVEweUIOWR01zEdgb29xPwq8Zb+T9w7QDuXvCJN6A1oTc+ac8c2ZTSGwgw==
X-Gm-Gg: AY/fxX4WdiF4Utf4RMoj+jCi02sqxPSNULiwi/sKF3GdFVpE4izwZmtd+0l9a08fsaY
	rCBntUnWL/gzvl2OBVhlW4GDJ2RKa5SeeCQNpLEQ4MCDfTBpNUSf5+pUljV6yE+XvMARGCa61tE
	WoK/9MoGzh8GaEbvfMCgmdHa+lPaOn3g2PHcJXmIZ0qBTFu6NHGtfD7zvTQhpVof92XI8d2/SX3
	U6Efcmhys5E6u2yKcJ4GGflQFjMwcm+1+lmWwMwPNSByceX3S1W+T7STrlHxOp4VGe2zC0WpToC
	PRyTQc5yv5QxHcCNDW0Ia2E3Fu1hiOoYEfmpgoXByZrbJynQpPQoiLgSdOZc1POu+6diQozSfdm
	Es3J7CmVBXbFFN+kq+tV3KwmMDGmtdUksjowFbEfh26FH6pCoYpsZ614BUu7bjJ1iOeWz2ozc
X-Received: by 2002:a05:693c:8399:20b0:2ae:5715:88ba with SMTP id 5a478bee46e88-2b05ec6fedbmr16873138eec.8.1767380351022;
        Fri, 02 Jan 2026 10:59:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3muKC3i4/PTRcy5wULqmj0X4FCmJIJuF6ICO9XbcUaLwHjYUX6/SJGQ8GKwIqi/uOGdkVOw==
X-Received: by 2002:a05:693c:8399:20b0:2ae:5715:88ba with SMTP id 5a478bee46e88-2b05ec6fedbmr16873126eec.8.1767380350474;
        Fri, 02 Jan 2026 10:59:10 -0800 (PST)
Received: from [10.110.26.180] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b140c42d8asm1635426eec.13.2026.01.02.10.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 10:59:10 -0800 (PST)
Message-ID: <a8af1513-fda6-4809-80ae-bb07d2ed0db3@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 10:59:08 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/5] Enable support for AV1 stateful decoder
To: Val Packett <val@packett.cool>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
References: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
 <DjKkpb96k7gGFmmmqsmLvO6sKcd02WwZq67n9hY4c75sajI_hENGebzfUBW3Xs3WGJ_oXdeYkNcV-T7UkXO6Xw==@protonmail.internalid>
 <ae5531fa-a3a4-4fc5-8580-3a790bec4961@packett.cool>
 <de8fe895-79ae-4540-9879-64d6f8f9e239@kernel.org>
 <f86a904e-110e-448f-96e0-22bc6b3e4b38@packett.cool>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <f86a904e-110e-448f-96e0-22bc6b3e4b38@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GupPO01C c=1 sm=1 tr=0 ts=6958157f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=MPIAtpv2AAAA:8
 a=qc00Ym10deOxJbe-hpEA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=bpVTN0Ih95UoZ5Wyh9qI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDE3MCBTYWx0ZWRfX6teEKFp519vq
 TUqlNokUDHBBYgUV1Bdape+fw9A9RJxHw57ybmGeDVQCir4C5DDTGqFiVKgatDeo7l/PRGqQcwr
 9bNuE6u/sSkfvDc+omXzk3mKw7QGVExC6d0M19ccASLpCVGFxmxLsSlUzi6q6ky/2tdNRdxozmj
 4pvoDrF28hsq9oTpPK6O8RxqUrtgY5p2JcGAX4iqZSKSAMoCAvmiSeXQQjpe84WbDu5gggNaTuG
 1gk83s3E0V4BmmTCCOebnbMOQdIz5vpanDJs6X7aARSm9xEQ6apy4r8UyBNU8vIQwBabx1CriZS
 q2tM6AIvZ4AFTd3wwTPFc8Ct4B5UzZvBjFBdYrWbPqBiacBtRU+21CeV5u7V3nO5L6MT87IIYz7
 aDlhjlJLhVa+KHphiPCWWzY59yq1khNRnErI0WC0uOiqskgxusEyZG/hPLE40n/lc8ZBZtTtnMN
 YypXfYcgD0+TOIraYdw==
X-Proofpoint-GUID: 9Z8dfjnRLO1zOwol3uFrPBZFz5Fk_l_B
X-Proofpoint-ORIG-GUID: 9Z8dfjnRLO1zOwol3uFrPBZFz5Fk_l_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020170


On 1/2/2026 3:01 AM, Val Packett wrote:
>
> On 1/2/26 7:44 AM, Bryan O'Donoghue wrote:
>> On 02/01/2026 10:43, Val Packett wrote:
>>>
>>> On 12/10/25 3:59 PM, Deepa Guthyappa Madivalara wrote:
>>>> Hi all,
>>>>
>>>> This patch series adds initial support for the AV1 stateful decoder
>>>> codecs in iris decoder. Also it adds support for AV1 stateful decoder
>>>> in V4l2. The objective of this work is to extend the Iris decoder's
>>>> capabilities to handle AV1 format codec streams, including necessary
>>>> format handling and buffer management.
>>>
>>> This is awesome, thanks!
>>>
>>> I've tested it with rpi-ffmpeg as well, and it works great (only
>>> required one interesting logic change..
>>> https://github.com/jc-kynesim/rpi-ffmpeg/pull/108) \o/
>>>
>>>> unsupported content with bitdepth 10 (66 tests)
>>>> Iris decoder supports only 8bit NV12
>>>
>>> Any chance we could get 10-bit support soon as well?
>>>
>>> 10-bit is massively popular with AV1, especially with home encodes (see
>>> e.g. https://wiki.x266.mov/docs/encoders/SVT-AV1#encoder-optimization
>>> and the ab-av1 tool's defaults)
>>>
>>>
>>> Thanks,
>>> ~val
>>>
>>
>> Can you give a Tested-by so ? 
>
> Sure, if that's helpful..
>
> Tested-by: Val Packett <val@packett.cool>
>
> for the series
Thank you! We do have plan to enable 10bit as well.

