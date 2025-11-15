Return-Path: <linux-media+bounces-47163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE69C6048A
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 13:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 679CD4E324E
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 12:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D30229D266;
	Sat, 15 Nov 2025 12:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0HCznZg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QdSQct0a"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14725298CAF
	for <linux-media@vger.kernel.org>; Sat, 15 Nov 2025 12:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763208135; cv=none; b=VYa1tj2RDAUOsKY48bP/dQADoBYXAR7pRgyfSyTV3Eh0+46ZcpflQuY8I9Xl12ToUFJDQPCuR5cb392GQt6v0GNqbXEUE/4Wbh3BOoaSxwt1d+EhPw45J2W990pSQr/3GczPSRuL3bWA8PTXdW2FlFBQV8kZAYO3eR+wQnEHrzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763208135; c=relaxed/simple;
	bh=HwQsPkARwbE8ccmNwdigeGyfb4Xb1tjlsGXg/4I1eOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GrGeddMWs3TJ2YL6VytqlzTL06gXYcZaG8RO/qzgZ/tKvXuiwRhPyMIfzDjYPStiE1HC9RKWr+yq+iU/gw5/PDlW6EJZKG+QCfAtuYRM8S8OfiLgFnnWwi+Re+deqV/cwO8pyrg4vJncH6jWnvhN5C+C1RlwlEcS9tfhZRZVwAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0HCznZg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QdSQct0a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AFB022O2065214
	for <linux-media@vger.kernel.org>; Sat, 15 Nov 2025 12:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgNpePqNkrGdvbxFAVaJZLoBIIfUIJU4MKl/OmY0CbM=; b=i0HCznZgZWQr8cVX
	PosGjCDdi3KjhH32ktPUJMxdT4u/JaODRYB91EeEZiLuZAPwzh6FqLEzT2xmh8kb
	wuE3HCYez0V34FiqCrRF+WM/CH2n2TCTy3CWANrinh3f2lT5ZRRQafevKdZanJiF
	1JW4tY0hrc7lGz5K30czD82DpyERPiaz28TOa/N2W4C06tv1tXYY9QvCdfg//iUa
	5MzlYcHDmWt5IC/+ruZhzUcBui5tDNJe8jQKYbBh+YsGxPtuK90DdwrdfHvWcH4O
	7KA/LeU3dz6HFwliYeJLBIybS50ihWCNQrnu5WL6i55r0qwCbV0TuIFxi+8QVNwu
	Z/VhCw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejmyrgph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 15 Nov 2025 12:02:12 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55b188806faso1650949e0c.2
        for <linux-media@vger.kernel.org>; Sat, 15 Nov 2025 04:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763208132; x=1763812932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sgNpePqNkrGdvbxFAVaJZLoBIIfUIJU4MKl/OmY0CbM=;
        b=QdSQct0autGh0+VrDxYXJKCwbECU9nIm89dlafp1oMQGt27m5DT0HXfchVrsX8ndRx
         XUTTMvI6Z9ek/mQoABaPoL8lRMeve3CiUUJMLj/HDE3xeQRIiV2Zotg1Wmz7q82xfBiV
         7g5pvXwlqV9laQ9fgSiyzWM0GpR609ENu3T3anWS0+SJfjlYi313iBxfk+k3qdmiTrGY
         PGy+f5zJiZhs639imfYsu54aPx2MDu8EDWn/huK8HDEoeBY/Dhv9scMbTwMqvQ7hyLEe
         s35r7ZcesZGcD82HKYTg6wFngel7E1fUgOue6+r3mIJkH2CQv7cSE7aHBmVZ6LIs9sfW
         imJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763208132; x=1763812932;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgNpePqNkrGdvbxFAVaJZLoBIIfUIJU4MKl/OmY0CbM=;
        b=TMtyokz/gT56SZziUdlLCwcU01KBsZrRmIMW+tuwWS3TVDU1CP6ASpsY4syyi6SARN
         4yBRvzWZxqav4zOcUz4CbvaWoke4bXot2asXXuoIYxBubexlZfnyODzpFsUMJZvfFSp4
         6vblVJkyUVNDFcRoz5Jn0pFDxrml8try+4CvBCGUiCuIL6e0UrjbC/RszUDXr7UpVoCS
         Uygd7NXOTAa/3WGmzNIdl88HxWc1AugcgbtnsCNjA8v9cqW3bemZhWupRiCFa+sJOukV
         rdwM+bFuEGARnQTBZrXImDwYsjX0Yopr8HUYyvYX/kLiNQ5V4z6qnO9vB+ZruTQwo1fe
         CRaA==
X-Forwarded-Encrypted: i=1; AJvYcCX8eS+bXOsIf9ATumeXoAaUmmuqRXxrbI3GRQv9kXfAotIWeAsRr/mzv+Mn3Qm4DDKM1uXGTqeWpca1rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfLpbJBR/oOxa3sNnXBdzCfc5b0AgQgNUPs8OknOj5qHA2Lcrg
	WO/eESQe+9/zrP8bLl/MS3mzg44mbEAo9LtzrvX6j8K6koVk2pEd60DblI3f4Im8YmVtBfC81W0
	GXPW24UHAb7hgly4lTzuj3Dk8b1sVudIAegXkfHKQsKlT2j1kGe3mjEtzeNVfl/JVSw==
X-Gm-Gg: ASbGncsN/7kKxGR2eLVCLC6k6OLaywsZ46vxUpnUrcqRtSTfHGe55UYKwU+he/USh84
	X6+HE3cVx175y5uxqWN5TnzAKkgeDgNfftvq+nVHRwmkcz9sLv9RxLMbanEiyz9PPtIqkOuwpBW
	rqaWnrb0JBqPKembDRPOhHwffpsUbsb60a74p1tXa9js91HnwRQV3HT48hAZz59YXl46ps95f1P
	MSHA41BI4Xx5HKqcIlQD7Wr/pmS/Z6LYBx9qEGNUipI3IPW6hwMThILVo/mYyxhh0cyI/9E3xNR
	Vv/z2TP+r6zGYyrr2G3jU+Kr+xgX2xwLoioWi2tNiiFzke+J+8tYU0N6KTeGYc9gtkkbI74C3MX
	s1pY9dDRlw511D2nwvYWzQpuxHje2R/UDCkX++HvFwH54T/9Ko4Bpwjs+VcBKGPXQVLhZ7S2Oam
	Waqh7KiDeZtU/V3oWnsaVI9KU3sZjUCoCa14oMXXEsSE92cD193jfBXEOdkFt358olcg==
X-Received: by 2002:a05:6122:8114:b0:55b:305b:4e3f with SMTP id 71dfb90a1353d-55b305b726amr226392e0c.21.1763208131771;
        Sat, 15 Nov 2025 04:02:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAP4ygIrDfpHbXS/pbACjE+GJET/ZPFd0WwWgIb692WyVtbPatbyH8QaBepY7KPQ1X7sBtvQ==
X-Received: by 2002:a05:6122:8114:b0:55b:305b:4e3f with SMTP id 71dfb90a1353d-55b305b726amr226381e0c.21.1763208131370;
        Sat, 15 Nov 2025 04:02:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b2615sm5583740a12.32.2025.11.15.04.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Nov 2025 04:02:10 -0800 (PST)
Message-ID: <c2a1e48f-2ba3-4754-85ed-ccf6399d0791@oss.qualcomm.com>
Date: Sat, 15 Nov 2025 13:02:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Media Summit 2026: co-locate again with Embedded Recipes?
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <0fa3fccd-c619-4a98-b50c-41fd513a847c@kernel.org>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <0fa3fccd-c619-4a98-b50c-41fd513a847c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDA5OCBTYWx0ZWRfX4lBwi1+8NlpX
 aTtltnYVslZIbzsOBXOpw53EfVf/NhFHaiUEa1z924NCvRnbPablIDz28iK2LAz3ohNLN4hlzHL
 Ny1X1g38GccjLTk/o8paFpoOR+C3H2vaYTdMxkJ7t6g4Xz5BNMEhyUQUpt+3VoCLXXYygRo9yXQ
 9W9MezNysvXFILcSlBIurpPcmJi1TnR17r7Npt+ZuoT51mp6rCZEOcpWIsPKtylb8q4fmo90pE7
 aVB/1VJNJfglyKwHK4CAaC8Qd0tYMcNI/GJGDU481sgF5o1d4smXwLnU6G2YgZGONyDaCEITAAb
 loVo2RIl+HQoe3XWvFYZ8vj3KvGdcs9u+5J5hATV6wJbRMQF2tfLUbSjAKBI/IIP1sLM14oPKU0
 vwTv0jyziUe9iDLLmduWtICHs8LSpg==
X-Authority-Analysis: v=2.4 cv=BPK+bVQG c=1 sm=1 tr=0 ts=69186bc4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ujZUX0x9v-1goGDpkj0A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: vYtXf5TnOdUVm8otLAxxDPSvpm8iArmv
X-Proofpoint-GUID: vYtXf5TnOdUVm8otLAxxDPSvpm8iArmv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150098

Hi,

On 15-Oct-25 11:08 AM, Hans Verkuil wrote:
> Hi all,
> 
> The Embedded Recipes conference 2026 will be May 27 and 28, again in Nice, same venue
> as this year (flamingos!).
> 
> We co-located with ER this year, and I thought that was quite successful. I also liked
> the meeting room we had, so I plan to be early for once and see if we can get the same
> meeting room for (hopefully) Tuesday May 26 2026.
> 
> But that assumes that there are no objections. The alternative would be to co-locate with
> the Embedded Linux Conference Europe in Prague on October 7-9 2026.
> 
> Let me know if co-locating with the ER 2026 conference is a problem, or if you really
> prefer the ELCE, or have an alternative.
> 
> If I don't hear any objections by the end of the month, then I'll see if I can get the
> meeting room organized.

I'm a bit late with replying, but it looks like this thread can use
a bump anyways.

I think that co-locating this with ER in Nice again and doing it the day before ER
would be a great idea, so +1 from me on that.

Regards,

Hans




