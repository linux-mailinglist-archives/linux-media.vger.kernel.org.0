Return-Path: <linux-media+bounces-49322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A157FCD5571
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23920300F95A
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A364A31196C;
	Mon, 22 Dec 2025 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3qn92Sl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cN01eo0m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88481E5018
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396119; cv=none; b=ca1tjvVotUUYKbqnwpnd4hoACF6K6hsA7Z/cChWlUMr1WvPkDGreArX8n2QNTewLw0hF+Agoz6gBsrdhJETzTTvOrsY3hYayTBoQ40kOEl1kI21rMBCiw17e8YEa316BGo93EZQiZQiT/+P0xtMsuSWWeszIU6frEGW7//9Ue3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396119; c=relaxed/simple;
	bh=eTQ3gnqDL/C453V2H0i3B/aeI22bJkpb7Cf5/j+Td9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ib/guUo0UT54wwmwQksVZtkF3qDECxdTSZ96C5NBMuvUYWEQNgEyGZJLPoqnPuM9XmZ25h53YLUwf7zkwopEhK6rlfsKyPsz4edEMqiYrskAf5rzzgyESTyNwN3i8y6nBJ4R8iFy/s5sYCXb6FKSls+YUIQ+Txybh5I2JPfi67o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3qn92Sl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cN01eo0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7fUfs4014012
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 09:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmpiDxql7K1n1hm0treKFgrc+um/Slsa8u/kVttg3uo=; b=K3qn92SlNZOxPV0X
	9uZB3/OQ/PcHN/Ayeoa4mdo37x8hNRtYCfybE9QZAlaCjSpm/B4tibHCaK+CMAio
	nKmBMAZY0tXA0q30lSJMkctcVzf+WXOvLjcYgBqr6lckjaZXPDJyk3p+I2uI8Ic3
	5k+J3x3k9RRfj9+yeS4aVq6GlfEl4wYMyxgu0Hw7YiPPm1kruIT+7HwrKbh4dU37
	MLc5zYEB3DgFoEIIie1i15tlDRznuV+te4O9m4uannmLJZXVCTBnSYNYx1UVZP4K
	KCmAw2sybHrySq5O6+lUK2AGlbgdC+OpfGT7FWULf+jpGe5nf4I5p5qUXHRTfjVo
	/dBH1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfmg5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 09:35:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e2342803so961067485a.3
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 01:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766396116; x=1767000916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmpiDxql7K1n1hm0treKFgrc+um/Slsa8u/kVttg3uo=;
        b=cN01eo0mwrcsuzLWwjreTrcfEyQJhK2Frh67FVJAlhEIBAONdqXfKXYNA3k9YwNlrT
         S1XnutQMCcj/+SWOjzdBYSSq1BM7dSbU5ocRitDhrhGtcvtGW8XZX2uAlPgpxaoV+8u4
         3Wf6IVFPu0xROwTKzwQ/D+KHEVGyHr/vVVjWt/45mDnteBHTjrAgt9ZOJj7JM1Qmw08q
         oqA5zV8ABU8Bv6LRpR+8nmEO8B0xfe2yte1ZOL3UcLS4YGkpTw/cZiRHsk6nK5EDLU8c
         jQnw0oD6PBNphTVOapebieFe3lCgIF9bzI+WI5CfClhgCb+B9NDLvRupUmvJxWuxIumW
         Z43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766396116; x=1767000916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmpiDxql7K1n1hm0treKFgrc+um/Slsa8u/kVttg3uo=;
        b=XDlv5vJyNUqPyNup8R0pSPCN00UCWDhCZIWrjiJwINfyjYCsnH4OilVH5AJxfHd/ha
         Z2NaRXYW2j0A65ntz1c70Ad6nEG7moj3JD/9GN1s5YnVzD9QfYIW1Q4jMwOFkEFNtwlH
         Nf43EZffLRRo7G2scc2Rj4xUKoa1qQsTlE29j3rxR1euNozxoLHcYgNs0+HpGLfdCSC3
         Mbb7hAm3cv6Q5paEmIfiZREPVUp8VI79AzOkh2G3+ysF1TcP11WXJRkxuTZtlLBvQM4f
         WwlxCDUlNBWDmyF35iN8BH0m6JgnWBBJfzVr5QLtlKJJ2EEuzgZKTXzUQwe7n4q6EAQu
         h9gA==
X-Forwarded-Encrypted: i=1; AJvYcCX4xbNeQjfO5GLZOrIDL89cyoAF0CGFjmPUOwanFUTjIHa4sm27xpxHgWNdB/6DMmPaxCxDWxjyaoV/YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy29wcksUpVGyo04GeBtWjibOfnFZyF6KXcBiDq93wimfRNuc9C
	WOFnBU7UXGfM5puTNyZka523yjSzeeYJYjA/6dHnEXz82yvL2lRpDe6xdKG5/Rs3fbsB6578LIf
	+6ePsjfA9ffIIs83Zd+i8MYug9PWLQclJdVbrvxdBHCaVRsREkU8aF7EfqZ3IfwOz9Q==
X-Gm-Gg: AY/fxX4zd5nQf3BzoZaz9uxJW2S+R6JgGxkhtwuxKX9l5A0FqD/uzXrlfpNcsG021lY
	es/wbGmFuyhkqR6VX1mTfPcXXYWCi9v7TW1Yg0X0l0hOHDGtDKT/KAnyPGrtkn1Wcg9OVU3T26F
	5R/zJk+8RyZi14MuUAxTHHSadsdC+REy8aZjC3WitlrqzpphFyrUCq6Szh2C47dHSBAuR3LZGKd
	sb+sQAXiaZmb0RlfGjKzmHEuQftproLw6HlUdSb47f7d5Ik2XIgty1+4FGGYnAwURMQdarHTDur
	wOMCeVqV8jhlW7IuS5enGi9VcXVJANH1LcLLmYzKNDfCdWEqt2F/YoiqOFn28fN421RjAqpnIIi
	seRaAZkJ1P23AU9v4EYufAnQlKToTeO+f37Hk7/0KE7aSkZH3EKOF9XcebWFptq5iIlNAEsoy
X-Received: by 2002:a05:6214:d0b:b0:88f:a4a0:2ddf with SMTP id 6a1803df08f44-88fa4a02e88mr86832116d6.46.1766396115889;
        Mon, 22 Dec 2025 01:35:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVTi+WZjnPcS1RXrN/kORrLsbJHUklWnVIPhnPw2oqb8VpSx2D91+O9MKjjxYr4g8/A0cQfA==
X-Received: by 2002:a05:6214:d0b:b0:88f:a4a0:2ddf with SMTP id 6a1803df08f44-88fa4a02e88mr86831956d6.46.1766396115480;
        Mon, 22 Dec 2025 01:35:15 -0800 (PST)
Received: from [10.38.247.176] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a83f6f3sm79332736d6.55.2025.12.22.01.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:35:15 -0800 (PST)
Message-ID: <bbf6dbc9-42b5-4dd6-9346-c8f38e460709@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 17:35:11 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx412: Extend the power-on waiting time
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wenmeng Liu <quic_wenmliu@quicinc.com>
References: <20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com>
 <aUkLKECix4vohyTB@kekkonen.localdomain>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <aUkLKECix4vohyTB@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=694910d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=WGNJK96LXhltHBCSghUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: xRcg_ajy4OtbNLgP0uLsC2NB7NldKz_J
X-Proofpoint-GUID: xRcg_ajy4OtbNLgP0uLsC2NB7NldKz_J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NiBTYWx0ZWRfX503jrHXzWft9
 +q835uHkkvSsZEK4/ZpIB7AriIalzmTDJ5EYCLN8N8FiCQ21xg6+ENgMlQuOPlJmFYBl4pbMV73
 soXxITn6HQJO7cqcTZg6jo4rEOTEOGZpGMSGGmGOATntFEfTIx9WO9p79ECDL+EFtMlTscRHFsw
 vFW7MtKkI9NRI1V2helOYx2NOHbLDiybDbkd+nOM+qpLBf/F6MGlApSOlR3J3hiFuXFuzjZkSWw
 9fu6kSRe3dewvO1ArlkL8iMA9HVwrc2emKGDBjYq1NLEuHlWX06gketfWjSBRIHtxjROco3l8mW
 A0N3UwdiNj3med2imR/bkAoWWNsoaSpxOvVTkYQG/HWdcDLqwrpUft4OLe8oeZmzKVRxWgIRDLW
 s72UauKIrA7NvS0f8gD1PtRiipDGWyF/IZTqNxg6keHDPKOS1ypbgP4imgrjjHRmbF6sNcvqgbb
 xpNg2VWYcDZ/tHOgrqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220086




>>
>> The Arducam IMX577 module requires a longer reset time than the 1000µs
>> configured in the current driver. Increase the wait time after power-on
>> to ensure proper initialization.
> 
> Is this somehow specific to the Arducam module? If so, what's there in the
> module that requires this?
> 


Yes, This issue occurred on the Arducam 22-pin IMX577 module.
I have tried changing the sequence of regulator, reset, and clock, and 
found that this module must wait a sufficient amount of time after reset 
before registers can be written (10 ms is a safe duration). This issue 
did not occur when using other IMX577 modules.

Thanks,
Wenmeng

