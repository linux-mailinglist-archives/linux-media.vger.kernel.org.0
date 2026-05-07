Return-Path: <linux-media+bounces-60797-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAwqC56P/GnDRQAAu9opvQ
	(envelope-from <linux-media+bounces-60797-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:11:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 158784E8FAA
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EA1B3041C61
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333B4395DBE;
	Thu,  7 May 2026 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GAyfpSzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JY84uva7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636533F54BC
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159093; cv=none; b=Lx1JGgYPcElsGXEA/R5VOyMnChsrbLooRhB31sK9jd/E6tC1rrklClzcKR3RH+v3O8s1MW8mNF3ogIXBktxS9LEPXr4y25nPMH6VNak/780vcLC9F4uLeWs44xoIxzzoGjzk8LHCxmUlI43mJHo3Vz5lrYbrf0IeZ1hAIKbJjCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159093; c=relaxed/simple;
	bh=IJnRaCCRGFSqqcN39JLCOYVUIk6OKKS2XdQzkMVtaI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWcjZUlSHEjbI5pZnbHBv90eckSoIgxMBJX6oiuLo3CLwxKG3/ezoKIAJSf7Ix/U0ZCIUx3dMEFi1KcWLuWHXNargDM5XQ2giDpjeWnf29PkxedSgMZw3j76Ife6Y5MaaPT09Jfvc8J1F5/sRhe3M/Z1EqSy3lQFcYCkI59UI8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GAyfpSzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JY84uva7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BGBtE682852
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 13:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEkLRSZuxa15Rr2SajLmdLXU1nO4MBhTedwZPt5xFCo=; b=GAyfpSzpUbrNQ7FP
	s6rlCu4KwSQiyy8o39Xwe+1CFPsFsoDrV3TjVnMnuV/m8k1bgHP/n1H8HNZF9Dyz
	LcUujS3e7AQvFjV6TC4PQApadwPl3OU/O5j/0w3poixSU+pLMJoV6w8k/ZVT2mdZ
	Uwp1HClRlDDnIqyVPBaVGoIjyAai/HZeFflsJiku69JHXUmYdKjlMX9B1i98hjNx
	NCSZL21nXkVC2rlYrlP+65smU7zAaQ2lo3gH3KLzCC4VoylUTyvudi4GYbJZzgEp
	zrugHEMl6TtTy2XPiO0PdtTjgi7uPBb5MEIUykfGgxUwgA47lpSJaGu8nxm9hb6z
	rs1aRA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhasn34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:04:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3662e7756f0so191256a91.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159091; x=1778763891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEkLRSZuxa15Rr2SajLmdLXU1nO4MBhTedwZPt5xFCo=;
        b=JY84uva78SCCKEyy2vz7CyjHpROahi4YbYyLDRWoWxO45jZY8AicIoq29aeFZUE0wx
         3KvgH76gFBdYtumrL2ZYQe5PdNXCevnp45admc82JE12GzMAUk1iiwz0NMn89kjk4ldM
         NPaUXJjXmQXhbvQE8QKXpUpBmGKKxRSgajnxgXZ+0GCcKPzqrV0qri557rgZ9ictK3EV
         Oy+zQ8KmHlEbA2/TC4J1OiRd9ENQ7KydUNkyq3DEArKbDHcoKiochWE2lDP+DG4LJ99X
         Ugx8Pk0VD1XolPwRSr/Cwy0W62iQzPtJAQNBOfL1UVJws8VLkANpOwGvPwQqSiaqQz8S
         ZgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159091; x=1778763891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEkLRSZuxa15Rr2SajLmdLXU1nO4MBhTedwZPt5xFCo=;
        b=bkt+5GDxucmMA2Lgam6mjeu/8KYPx0e8Itr+ue0w9OcDxxFx6EzQDzEDu75FBgUxQG
         ATKPUnp4PY92+BbgUbX/+lvfZJ/94QBL4zHx/HWXmj79S9hlMXmQtEtZms5X2z8gF4RE
         s+EaxN7D9i98PT06ahnzqo/L1u1IZhLlhwzI33+KyVVlSFYPjbv7UvjAcfCrOgk0WSyv
         nAsRoBP2L5KBWgsmREWddgaNb6+hYuzKxxPxoURYLYy9kT+0Y4dL9HfAGDOeyRAySneI
         S1vu51Zo1wb/dxaJ84N43G+plgq0K1mrddfkaOATALyV5TrrHiDyfZR5YXF52sDWJWE0
         LJDQ==
X-Gm-Message-State: AOJu0YwXkC+jH6CHIHmO8NpSp32LwBydLKMXo8tW0IRwh1rXhViXiFEZ
	V5dfhT0Cz4MWN6yTj8W68Lfg+s1zJ3b3DfWWhwiiIJpsvDm19B+VsSUBhaHKTPBbD6zenvcR4rC
	Ac2slzBovZ7NPqsyA1lFrt0rsMVVNDogucdioB+UMj6lNJj3XNk0WFv576+BRwlPKLg==
X-Gm-Gg: AeBDietzhF+uechBMuhSiCMaU8gSZibri7yK3L+9c2MbLNBeS6fC6OZx+PF/kk/vALf
	N8rsXyoOdeSQ6fvThM7ZFNuU5F+IjsG2BvKbCjgYCnjiiHMrP90zt9VaMbKM7UPGSBzxzJWlQfN
	0tyU/wElKQPBLrRm52IhCohId9ISRUa+yhqEyvtejlNwvxJT++jYOvLU/UHt/RM0Nyi+E9/vykS
	7N3PlExhW/xr+vJJWJHZl1qPvrSvkGUSChbFC47l3AliM7xmwK7rQy0n0zzJ9X4SstWG/JBVTG6
	Ez0uUjC3+pszVwkKPt/M6jwUHOTAe5V3srINdvICE7+YRkCBKxr4D6z4l0d5kbPhbLIcN4roD/S
	iOG2AzCmvuePEHRTzNKvrG3Zmtp5ncRKU38ROsRhKqDEY7be6+yNYwBuPsDxCX9Q8ckg=
X-Received: by 2002:a17:90a:110f:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-3661c9e9b87mr1075280a91.25.1778159090876;
        Thu, 07 May 2026 06:04:50 -0700 (PDT)
X-Received: by 2002:a17:90a:110f:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-3661c9e9b87mr1075122a91.25.1778159088839;
        Thu, 07 May 2026 06:04:48 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4cba340sm7857065a91.17.2026.05.07.06.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:04:48 -0700 (PDT)
Message-ID: <25ff90bb-a5af-4ca3-a5a4-60550a8f73bf@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:34:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-2-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-2-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX+Q2rw469DoRl
 8FWBJsWln5Dj02omwrw9UD37S2hel4l3L++09e+zQzbFU8tltZ+7DHAGqmyA/E0SbXR4+rLspKA
 ISSi+z9vYikOijSz4fFgsx1Y3m6IkrtWeP7ueCo/jQScQXjXBECQmQRoU4xN8MVkEy6PNtFCiiR
 nHjKDSat5RsA9W3NeyOzUnRaaPgehn2QNtlj27IXQb/pTtxZdqVmwqtELBeT3y3FGENsg6haqEl
 6RPi925WDe1+3J3ca5h7C51NNIm2KLbTC3BVenOoyAhBmZYsfp8R/Ku6WALPMDR8u03CoD091vw
 IDQ4tVUu27zC5zRR8w8Q5AxLwPSE/X8OTuK10mZLkJNl4+MNrLhuds5KNG3Ow6iP8htVUlDAd20
 HipZ3p2y8qSsqpzUzyg0NftTIPLyyTbGRVGl34HrvENDGW1OUSOKl18ANNYekbGjeMuGIxg8sML
 cSnEYZwV4YcSDER6TwA==
X-Proofpoint-ORIG-GUID: 0tPY8fhwjWb825eohyL0lrULkWFqE57Z
X-Proofpoint-GUID: 0tPY8fhwjWb825eohyL0lrULkWFqE57Z
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc8df3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=h2Wfa9npekS_yxA4jjUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: 158784E8FAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60797-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> The raw formats supported by Iris were previously advertised
> unconditionally, assuming UBWC support on all platforms. However, some
> platforms do not support UBWC which results in incorrect format
> capability exposure.
> 
> Use the UBWC configuration provided by the platform to dynamically
> filter raw formats at runtime. If UBWC is not supported, UBWC-based
> formats are omitted from the advertised capability list, while linear
> formats remain available.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vdec.c | 9 +++++++++
>   drivers/media/platform/qcom/iris/iris_venc.c | 9 +++++++++
>   2 files changed, 18 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

