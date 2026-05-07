Return-Path: <linux-media+bounces-60799-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPRlAVyR/Gn3RQAAu9opvQ
	(envelope-from <linux-media+bounces-60799-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:19:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EAA4E91FD
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 41C42301F376
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5721F3EC2CF;
	Thu,  7 May 2026 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaFb/BRj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F325HGPl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8532F315D3B
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159326; cv=none; b=d5dDBzADfH23u0uYiWk3+42VGwwU5aEPXApdPMRa3a2KAk20UDv0xsha5S+Mep1lD2ojXA+fybiYZqIzWoo5doAjrOxMLnoGiIIl9YZpBBtmfCBdte7X402LWJ9q1h0CYXoiE2VH78hQ0kRyz6nHPGmYMRm7I997QIMOFOcPftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159326; c=relaxed/simple;
	bh=z1P5WsyXK6IhfDSWv0FPs0A/+0AfVva7UCu27PBtqpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUARkSOvahltwAOPire1KZ3GtHA4HW92YiolqBJYQ9ZXPTv9wZGZx/7dBJUU3f9GfFnzAubgSvUT5ftk92gdzuVLJeiSR0MO1obUpjKMpOVEcPWqAlHpfzvFtHDkzCZHLXRah8X95TbXbh4S4E5drEw3Z9kWBTSB5h+xLPcu4Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaFb/BRj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F325HGPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BDiSv3157534
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 13:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcP2ZZDfQiOaQsuc7xY2K3paWmpBq3v90eSrcpSFHHM=; b=gaFb/BRj2AgHG5au
	7YG/MuLJ+Hydf4rkgKkafbnOv/ItWnWGrV35tuOpvnyTkiDXkRogiSBsb6taHbwg
	cilXcEjwlA5Ot0s3qq7TmReROKiGJydiZZtZG18pZ/vGMnc0cmVnBRF//qJm55EY
	Xiv8R/NprSeESrWBJhIfx/XMKrEN7zL12cOlZ7fIPZlizu3WTXKPLCNW0NGvWEOJ
	AXi1I6Gx0dvl0gc3BmvDf8zTPDGr843lDQAycWAzTsRhOeMBWFihpuN/AIk9uoLr
	3wdBGOT4Hkib5L187wxYWy+jiPR8KU5S5vfSfxFq1jf1BqX5TLp/8BLxvdGu3Rag
	sMUzew==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf1nxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:08:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2d83e7461so15847765ad.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159321; x=1778764121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcP2ZZDfQiOaQsuc7xY2K3paWmpBq3v90eSrcpSFHHM=;
        b=F325HGPlUBeK69Ybf20ncipOXpZUNXKMHiMctA8Hhs9MYEwOXIv2WuFzbWfIPCAmuK
         7FME6tjDDmU3FsqGWnqOEGoGslbnu+NizBTvFMLq2rm0YcC9xYv5p7bUT1Ozb5v9Q03W
         lF6wg+OLtTVwD70+idgcWADTurxdzIMa0mQw7S/3+7maOkt/WP1l7pJd/QVvTqpo7eCd
         D38zAUAprf2sCNEZ5dvfX+IeWOX/WMvHCxIZsRngGJnHpMq+zuigdoo7mB0z+bCJJvPe
         xhnPdUxeAKWgsNLXTk58BmTr0ZK/ny1yMflqvXOUnNN5uPZ9DoX/vofFHarEDbmiOf+Q
         FiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159321; x=1778764121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcP2ZZDfQiOaQsuc7xY2K3paWmpBq3v90eSrcpSFHHM=;
        b=X05f0hk+zPZsUBOvU5c7m0jF33YL7qDI0KrBAPvCY2W8Uikt2w4+yBMGqe5ymk9mML
         s75KydGsRQ5xMm9MbNmbyNZLWZ+YDS5cwXmh4zJI5W5nTCDpQc6eiac/HID7fRmOebiI
         XXM/sDmqgXmR+1FUCbPyRG4lSNvXSEevxulF8tNWPL4oOl3jwMvuQDC0ghPAU1ZpfDgI
         5iAk5BrJiiLCeRxOTjp2yGAH2NEmPx1KA/k1tSexkg39EICKm/c8EYznAUwWwbi/CBXn
         V5LoaVPCHJbw9OgZ6C+mvvrGYDNrQgHv1+M3/Qv7AeEXt1zGKg1+sz/MVosPkI3x4An8
         sCkA==
X-Gm-Message-State: AOJu0YwgDLCRxwXUNjmdY/ZwqNKK2+MG0dT4QGae2yh4a++aI/8i9aOT
	jfqJXNK53CUYv9PgEhP2bKPjVtZPg6C0w1KtfcZ1UE96sxzPXvMyrizSVWfzzWCOlzy+OWHaq+q
	ztTTOCyN8S7QxyTtv2hJC2LtiE7SglrZqlXrBVTWdFdmqPs0TY/cl6Qpl1yUCHxLUJQ==
X-Gm-Gg: AeBDietatt7G/wJlF1a/kTmuLkuvmDSd/CYl1wSC3U2fFcCpO+B6xazJd9ygVyS7C+t
	rw/diuZcPU5Cd3AXsOosfyzV6SRTrJN6n22Cki58MGj3xXzgqE3FQkrI6ZkLd/rC/mVqRNNbJYL
	BzzViMiMO82hq+41G0EBAUgNsm1qAueU3qz3/i0zRlYE9XGUa+Q7ddDpM7aPWYuIq3Tbwfix2b9
	l7tmAWJtpuHvw47UWFcMHP1FmVRZ++MhETA9BMrdVfvz1LfGQpIHPx5aWA20v4Jdl0GtyPUHzNz
	jAseb5exBrzpHMviJ++nVCeyGTiMU0dBTiC/kYw1PvKrHLOfCl4WHRNdFQoTHE71vtlERCtpKl+
	TpmRQ6DKeBBZ+4A3n70j1FCYM1gYSmUR/GN5AMysjAP7VswOLsAIo7EgsGJqZHZiJYMg=
X-Received: by 2002:a17:903:3850:b0:2ba:b738:bc2 with SMTP id d9443c01a7336-2bab7381ebdmr38993095ad.27.1778159321007;
        Thu, 07 May 2026 06:08:41 -0700 (PDT)
X-Received: by 2002:a17:903:3850:b0:2ba:b738:bc2 with SMTP id d9443c01a7336-2bab7381ebdmr38992545ad.27.1778159320449;
        Thu, 07 May 2026 06:08:40 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadef91fsm26732425ad.65.2026.05.07.06.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:08:39 -0700 (PDT)
Message-ID: <51c9cecc-4724-4d00-8112-175997916bc3@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:38:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] media: iris: Introduce interrupt_init as a vpu_op
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
 <20260507-iris-ar50lt-v1-4-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-4-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMSBTYWx0ZWRfX6dc8u/ANlxqD
 KNu71Bggg5CiKXbyGxHTgGST1DveDLeojHUW6UvlWblP4i7nVFvZxIbDgrz0yQIrSMCoZHrD7it
 6JtsD6lKGHNG7Or3WiOi3df0KjBXTkHGJfElMwVyck/WFa+q7YMrwz0OW+K4jMJXXSnMepUUVHH
 N4rRq1N9Tm8CKBPNFl6pUeUk1HKf2ujNd46l10idd7WPv38YuLEYXXP76crq8w52vLH+k0oZh/F
 dDmpJVpdD/MfeouZ786Nz6XhDjCHWmCBBsrSQNFpx2+JjoexLOtMDKbAjV4kWwj8cA4SbarcjwV
 Ly0a/5HMT27dzfHe6KcFXHfh9WEw8aTGI7JfYS/KJdrO9uLFIxlNx9cYkkbVekbaoOSZGaJ3yxC
 T+yzJ9C6n1cF2a1lLFUS6C+wbGJHLn2KkUejXkk7LiMPZtxXV7Uv4v6SLVD7rDkm3Dh+aiDGNln
 V9MihSvkq52P/p88BaQ==
X-Proofpoint-ORIG-GUID: mWeCs9E4V_Nga7mMMuRtBsIubnN4Evui
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc8ed9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7rbqPpcrvv9w7tgh1RYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: mWeCs9E4V_Nga7mMMuRtBsIubnN4Evui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070131
X-Rspamd-Queue-Id: C2EAA4E91FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60799-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> The interrupt_init sequence is currently shared across all supported
> devices. Starting with Qualcomm QCM2290 (AR50LT), the register
> programming would differ.
> 
> Move interrupt_init into a vpu_op to allow per-device customization.
> 
> This change prepares the driver for upcoming hardware variants.
> No functional change so far for existing devices.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
>   drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
>   5 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

