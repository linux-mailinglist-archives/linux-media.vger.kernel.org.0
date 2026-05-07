Return-Path: <linux-media+bounces-60801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIVCI7+R/Gn3RQAAu9opvQ
	(envelope-from <linux-media+bounces-60801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:21:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F41884E9225
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 343EB30A501B
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302AF3EE1E2;
	Thu,  7 May 2026 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/3ZyBMW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="keZfJyB6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9593F20EB
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159815; cv=none; b=og9hbpiXd51OPMgPIgMwI43Dq0C8Ql/ApT8qAjqB7tGB0Bpo9U4xgSFm0kxgAQmYfripxBKW801uu5F4uGIWPtM7cFLnI2NHT+0WQ3flGtDIbXX+wY+G+mHhiunmkpRXIk+8NfCgTP9mrUNQytbHBzKv4Mo2mhN/PeL+jITvFZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159815; c=relaxed/simple;
	bh=6mFJIFXsdza4XEXxwuib24eKPzJVv86TyeYu8FjwOyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTklnhp8/R/DFJoEs1NxLrKM/IpUKA/SjI7ypqwPcj/1cOl5QQW8PcE+BGr4xaYNIQnr3rQTnG4vsWsv+aS8h3IC+veVIULUIN+dwVuNZqhOj2AHXo8KTf4fVdciyx+TVhiQHK69KIQR2FYC7ihR7phzkGAP+tre0iZ++biFFdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/3ZyBMW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keZfJyB6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AYYs1026592
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 13:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L//Y102LyJw6sAUPlrP+tV4oMg5X5ISA2KjCfHXjWGQ=; b=H/3ZyBMWduB0LGom
	1UmNjfwYoi4T5mUNutGsh2/2dzhaHF4AN+vCC/OF3YVd+ERinOtXByJdPfZEmP8k
	TXdJY93jKM4EzjJY4f0XLqBIgkHFTwSow+u8tkN9aw/emr8ZYUEPrMOZgkkJmpa9
	4ZsSuLh9dzHH6b0Xaicv3BVi0PCVTittdQW6UU0B4T8GAuuB940FqQudY9gQBqET
	7QUZYPvAT7p8Vb0ZYOgAFdpB9rl7HjhMlYX9OoVAnpK3r/PMHw0krMMAGdf/ChXQ
	BEXjUuSij5t7KuFFecy4adKMrFU/7z1clLAnShw3jwna7W0Sg+zZ/AJuLkMSBiT6
	xTjoNA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t21kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:16:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2d83e7461so15951315ad.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159812; x=1778764612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L//Y102LyJw6sAUPlrP+tV4oMg5X5ISA2KjCfHXjWGQ=;
        b=keZfJyB6Oqap75J0WHGfbzyxD0/UWbOLtC1w+X28TEbHwl9PRGK8UFnbrPEQVZdltb
         bO/OF935+9XU2UsKuE/0uF+dRPiBjYdm9x8K4P6iK98y3G5uCKqlvCW1oj5wll6C8tvP
         mkez1WFysOOtDGO469WLxGp/6JSNKcz5iDP84Z16wyI7cmSnyxPZJLdYoEDEZPz99J3Z
         0xt7+amyCCgsOhK1x78VtTK4bXCZdmgdjqPdWIEko3rIfUUh6G7kXm2myqkkmU+tVBZD
         vhLp5wDQd2heb9TY9ZstDwG5WDENZ+7aZGvOH7PsKRDSiq7TLLP6b9l62WxFBfocp/JH
         DBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159812; x=1778764612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L//Y102LyJw6sAUPlrP+tV4oMg5X5ISA2KjCfHXjWGQ=;
        b=USpRNbksKbieNY2rsO2fXo7nndQqZgOuBGMaWuNlJ96mH3wZ7VHqc+pHrAzFasJyUs
         qo2u+G/6k3/DRhU0W9g5YWGjmFjkfwJmITYkkb2Snb8EZndzO8Qt6kJovwyrsINLVoPn
         W0ik1XzHjXRY9JocRKWgyUbnWPlaY1/YKkWWOAqPgQiyPFx+6j26GxKsDYd3UZCCh1g9
         gE1yUialTxOEogPLs1X8lQN4SzC2PtYoUIyelkFRDzLvppXmXRyvF8QzC/4GTlWqaLWL
         LA9M7zv56CgT0YwIFqn7pn3D7+S7epnxAB7bepRbROLMbY+czIjvRcBpIVLL/HIkkaK9
         6/uQ==
X-Gm-Message-State: AOJu0YwvZaE+MZj31MCoeqVgi14AKHuiaat3UMti69rgW8GX6FtuR6nM
	t2Dp+nvExVLZHRJTiT8MISGtq96R4nqgIuPs4wg9KOTT3DByfq6iIVHuKH8NQavIznYVQMasGo0
	tHFgxWpYhRTcZvB9mvvbe3gBfk8K58d2UkdSj7RxrucYXEudyX3oWns7r9NDHM7I15g==
X-Gm-Gg: AeBDietPoGX1n9Rdb1Ingu3zotDzPaB5Tc/blJzqXo8mfo7raZs66IbJ28L4dEC4M76
	F4m97hcEIiepCCEl2rm9pO8wABKfU9uyOFIdEcJmYoW87Woik9MLwOPf8n3VlNx+h8C87i4VEXf
	F3sS7tngfBwBx+Vnk5YAXvUbJq13H/Q7gCdujnmup0BFvKpMz9HFi9lL9sKbUFyIr1O/FEB/faE
	gxw8q9BQ5mthmhsn/LWKZX2nltr3c8JwCxlxPikx+8j05cP6/SIrslt4DadMyfqZYpf79gsXlYO
	UpGFRdUCPcYCZrsZqOhkc9fkqFVuKDiaR3VxqEpiJ3M8M3jfr9LgQDJto251mI5xgggZKFEB+Dr
	Z8TVaq9FrfDwiMYj0wnU/k6moMFcyZmpfWnslTPjicvKGg2c7NT5mLNPNkJZwEt2jhpw=
X-Received: by 2002:a05:6a21:6d8b:b0:3a2:c685:f9af with SMTP id adf61e73a8af0-3aa5ac432aemr8576057637.50.1778159812177;
        Thu, 07 May 2026 06:16:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d8b:b0:3a2:c685:f9af with SMTP id adf61e73a8af0-3aa5ac432aemr8576009637.50.1778159811692;
        Thu, 07 May 2026 06:16:51 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253582a6bsm2164561a12.5.2026.05.07.06.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:16:50 -0700 (PDT)
Message-ID: <9e93df45-557b-4ac5-b762-0d7437df4e52@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:46:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
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
 <20260507-iris-ar50lt-v1-6-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-6-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc90c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sQl9ibgnB-ql-ZCiWtgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: azQqQQHBDJJUZn6pmwemUB6RdSBir0uW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMiBTYWx0ZWRfX8QLldvxQNFR2
 I0swDAoUzk7boPXYLEaqx/DYG12vuyKEUO0gCyHU9ez8q1khWvzp3AhjvLJzu5+FWgzqrw+qkKG
 885evwPVqysOmvYTciSB0MGwhKyaO/CR8N22i5wcgmjO5eUekqpa+l4tMLUm6pGohurQDskZsrZ
 J9Ds30RmSweRMu4ERL5FZR05eIMH7WzlnLXKX8Gvj8AB1x+GybPW55rdwph8bcVYo9W8MSj2623
 e0oigwjOpA4jKayjDD4SazMs7HpqKm8mwztsPq9bCXoLPC2PuFq2p9NK8UMa0EP9gTm7e3CBP10
 B1k/8mR31WB+ZiIwFQTWaahVx5/RVxqydDdpFysYTqZgKBrPQabEhGqvdlrZNQppqV13AfJTlw6
 48O7QSS/uzfmA3bpyFDlDRtcMA632fFTIYjnJ/FW8z3dyt2qMeqyFisBVZSJqOg6TEpinuSjJjk
 jcn7ETz7ks1L1gdwe9w==
X-Proofpoint-GUID: azQqQQHBDJJUZn6pmwemUB6RdSBir0uW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070132
X-Rspamd-Queue-Id: F41884E9225
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60801-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
> from the currently supported VPUs. In preparation for adding AR50LT
> support in subsequent patches, introduce a platform data field,
> wd_intr_mask, to capture the watchdog interrupt bitmask per platform.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
>   drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
>   drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 6 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
>   drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
>   5 files changed, 16 insertions(+), 4 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

