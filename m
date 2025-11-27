Return-Path: <linux-media+bounces-47827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC1C8E173
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 12:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2291F35059E
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 11:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240F532C95F;
	Thu, 27 Nov 2025 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcQ9hhOm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM16Inbk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BD33246EC
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244045; cv=none; b=J3BKZECQkfVUIkByjd5Db/WfmFQIyuSgt0hEXHQYIVHRBF8ERgRAUgZgHl8ieGJft+qgfxKsKP7n4CUfmm030Po1YZP9ln4hXnOjHz+JDaGJy5NbSVFYmTt0MSWTsJ7QwkROjNeNXXaPknDF5ad+IHtL3ntwibOpogHyKSJPJXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244045; c=relaxed/simple;
	bh=+X3+94lwOmi0u7SCPKjv9X3UO1pZjgIpwxWjWXZl0c0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfsQjIW9+UqTF0Y/AXBdqu2DZJApzVPpBQI2cRIBgCkLyPB12EiRuRyMKJyrnlbLsukhqecfujIqUW2X+4hTRqPRd4Qqx6TLrY3tDiYfBv+fuA+C1uw3UX6SJH4wOs3YsbFgSNEqbvM3F1QPiyPXdhXwb9wsjtC/bg9+34FBZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcQ9hhOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM16Inbk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9JDCO1667742
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 11:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4/RzqhvLeO73dOkNIHPYAf57nLA0gWJO5DL8nIR799E=; b=NcQ9hhOmBQZcoBBy
	GAPckl7O4+fagCfKuLGJPe+JEF93c08dak98J+ZU30OiQyApBKfWsNFxJiF/Lggh
	r4nrYJ5XHWGyjfyje7uPZj6ygtkW78Wrb4haDx4iRBqXgN0GN2b+eAntixRONw3a
	yfq57ctL9XLyBoC609Cg5mJxFYPV+Yj/u2+UlhxVP/C52kTD4rV7NgIVWBm2zPvx
	vZPSXtMnVM2I3QTFE3gP0EyjrqVfNc+yZsuOF2dMJh6c8C0l3dqQIF6kf4rjQF6L
	KHK7YGuRwpqvqHVTXWkC9Bt31a8pGXBSphAsAD+agZ81MkpKzZbzFPGyFONDX8Kd
	bx58LA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bmunx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 11:47:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaa289e0dso3395151cf.3
        for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 03:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764244042; x=1764848842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/RzqhvLeO73dOkNIHPYAf57nLA0gWJO5DL8nIR799E=;
        b=OM16Inbkm47hyhMsVmtFgmVn4tH13SDkVa6h08Ac6SfR8C1jMCxMaIec58KxNdBRa8
         j1ohL896XDYBD6ZlE2b9gEfO3RlFTqpazFadWqyW9PLHI5Z6jTyyC0mwvzYR2nuZsdpR
         svP52eL4gLw1qdqmB5lmFG5jfhaQrYfH1fYSvS7Ay8JXAVUcjhNwy65lA/3EA3AiOxgA
         cRdmPQi6ewHAJcgDX+oi9X4YVMEcZwO0EO3w/hpNMoPoCzjQwROsm0zAkzovNMf07+6K
         2bCN47Ph9VyCoMPf9xktnwHAN6Z0uG/7UkE+6Kkwjaorh5/AyqrosnVIQ3Qhtx/LnIVK
         DubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764244042; x=1764848842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/RzqhvLeO73dOkNIHPYAf57nLA0gWJO5DL8nIR799E=;
        b=h1lB097O877OQ2LgNKggdKjNsaU1d7OTe44GfjUEc7Vyt3Q0XULkbE5Qh05+gy8RGI
         CcEOejJa6719OeMe7nwKXxN1w1qaZUOdm3zG4lAeuN9ZKS9pSlwie2ocQK+FC6uKGsjk
         8W6q0hfCoLQx4W4CleT0D7IIUzWl6yacHkF+PCnv/T76fGZbuKik+gFbeTbLEHjkElC4
         QzqVdVTUK7o5iGsK5+yOSaTVKxTbZanWtEWMCFpia5xkTNTENIxR4GNY5a9DUFUwmjL/
         yZkyYbFgQxuVA4t5wrmsURLcggDT9VwP5T5qTTBSP7xxCjZRS6GQZ9k+hiVnCnZLUFtB
         RZ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNBrZB2BxWY4+mH5r11GYXT5AyxGMkgyA9EihSiP9IQOnO6/3J5E8g4fPhN8DVG9oxxa9ERwqMbIifLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEbd2/74gJs4Iz4yFXvqvYZZJh+QzUDtyrNuzB29LzHaaOygRD
	0N6LX7+RiVZfIkiBrTe25cXYtKt+Kfvw9Dvhxe9bdEthwmdiwkzcfW2lWCuQmwyjyP2iG3D5g+3
	6xWTDmLbeXMDFjIYLBkTwSfWNQrmmxPyOdQl+B6DNJGNMagrZmwwCbpeY3f4LB05Xjg==
X-Gm-Gg: ASbGncsA57G0lYEQzFlfiQk//ZnrFuAp+fHW/tPJ1NpxIAtKCj7/sKMSVhbcIqqYrF2
	Qsol12EwdHDVt31/6O/QC1mRxoXgWNmfvHXFR24XFKuTETz/SaH7BZm5E+ASRO9f2zW/9TvOHSw
	eiuRPzbYB8fDl0k36bSylBOTlBs+XjLWjshFIkFGhgrcghKTpprW+70R1ChQDWfZiUIOLmTm+X0
	8AKyUbEUAQD/j++75ElkQSJaVIHC2ogz4MIxzO8cQrJN2nZCa2plOaTLbSkJFNzdhKvi5cBnqsj
	FDwkGRpwuzpl0YJFWJhMzjYBReCVn9yMVZ0W/vOYCJPxMLBDDXY+4FfBQ2aGyEkPtcpv0aJFTwz
	nH1mws5fjw8AoRJ6YNpPP0PSyhOzAyG7SgapvW0Ft63+FTtXlMoBbwYUqeaUYAsLx0PY=
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr231591181cf.3.1764244042331;
        Thu, 27 Nov 2025 03:47:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhxaIf+g9okytCq4TlpAS+LV2z9LubN/g6fb6B3B32+bqXFcjKeoz6+qy+/7HmKg43sCJreA==
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr231591001cf.3.1764244041799;
        Thu, 27 Nov 2025 03:47:21 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d45sm1373506a12.8.2025.11.27.03.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:47:21 -0800 (PST)
Message-ID: <6eb8681d-d82e-457f-907d-3ba5b94267f2@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:47:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <249ccbbc-7990-43f0-b205-d5f33a1c9ad3@oss.qualcomm.com>
 <aSWnTE-jeHEg12N3@trex>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aSWnTE-jeHEg12N3@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=69283a4b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=g2FNSR5juNlgVfHlpaMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4NyBTYWx0ZWRfXyMI+ezhgLHl3
 Cxh4JFwBWAhdDgzpvx/bDJeGDBGHkbUgV/GJw+voFy54tMV0nfxzTlhJl7/OXs0hAcTWjhiQMhK
 Epe6EYlYiOGFPPxD0yc/Z/FvmfKb2BY/zPP00jOzAkiCp6LcVIYC5hjN9efIIj7dh37WZe2HjXG
 xgCiEEOS588GuE+ihoGHiQcZJXJygi77EA/Uxgd/AarxT9ewgmb92MjHyQlkWWwhLIhrVVSJ5je
 LtQ+ORDHnr+ftNYMjFz42LpxIM2kSqv4NPp/GQ4Hgsz10ItH3QqHW/vG6bsWV5MHWgdsyDNAW0n
 FRU1Tk1ttX7teXr2QbS6HnydEPWx3SYbWFbZJW9SDPfO295zfFnVmeCQUNSY+eYiGkgxHEKbzME
 BTsx1tompnAQWm0RYDL4+65nZ1MbvQ==
X-Proofpoint-GUID: 288HH3z8keDVe1HpKzU0sjXE5Nf20ECY
X-Proofpoint-ORIG-GUID: 288HH3z8keDVe1HpKzU0sjXE5Nf20ECY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270087

On 11/25/25 1:55 PM, Jorge Ramirez wrote:
> On 21/11/25 20:22:13, Konrad Dybcio wrote:
>> On 11/21/25 7:43 PM, Jorge Ramirez-Ortiz wrote:
>>> The Venus encoder and decoder video devices currently report the same
>>> bus_info string ("platform:qcom-venus").
>>>
>>> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
>>> parent device name. With this change v4l2-ctl will display two separate
>>> logical devices
>>>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>> ---
>>
>> Perhaps that's a stupid question, but is there a reason they're
>> separate at all?
> 
> not sure I understand, enc/dec support different APIs, v4l2 controls..is
> that what you mean?

Perhaps that shows my lack of knowledge about V4L2. I had imagined that
a single video device could implement (non-colliding) enc_xyz and dec_xyz
operations and was wondering why we need two.

Konrad

