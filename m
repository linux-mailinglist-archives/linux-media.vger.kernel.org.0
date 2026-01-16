Return-Path: <linux-media+bounces-50852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AB6D2EE4B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 10:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D5FE30B0ECD
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 09:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1420A357A54;
	Fri, 16 Jan 2026 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9Uouf7W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ar3QrhID"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37559357A29
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556305; cv=none; b=tWvsTBvfHnqB2zF5FAL7LFwrIT45smWFAgK9hO5GCG6YYCQov5OAkrhcDopyvoY154ljY6qveK4OUgeHpm1srL30RMyR1jt3GTSpzFyixz9DpFTAEUt/l1ivQX3D9dZAvaETqTZStX5sTUvcjs9LlwaCLdvWwy72LHKDnGAe0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556305; c=relaxed/simple;
	bh=DfVisQf62urS+nfEn1q9WIOlgdP6bHa0HeM9G1pZL0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiz8PJBrHQUsudXT78BDv4XG1WTT79WGF8Fznxyr23YZ78Cg8WBxHOt+FtHWuLkiKCZa1AtXMgxqqlGMjGN0rmsG2/BsK8MaDTO3/Ya2n5ad9bjL5NfM18O1l9RmN6Pn4XBafDRtGRhdidG6oaNVIZ/vfC4Qz42Td6B09XWSK5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9Uouf7W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ar3QrhID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8D6Gp3714139
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qMa62W+p8IOSew9lvV0PO8b3C+Nq25+zTXf+BFVYDgE=; b=j9Uouf7WRl6PoZQ/
	qlWxaJZkc1/jRlDt7QbjkMCU61RydoMrys7TtqZYWUgIAekM3EHWB6pN4tatv+z8
	Rhj7MZ378gVypliuH3raaW9SvwcZ6O92m3lXZ/Zd4UxQcjfPr5dZIgDiS1746kv2
	EOJ2C0cIi3bBZ76YuIv5pNw4bU9sddrQ3zH7Bbod2zWHElFw3QN0SxjlreKiMDi3
	jKkoMnXh2HLkTW5zbvPUgpgMXbZHsapj85JmD4nBTU5pYVRVvO2DM3HZ3mnk2HQ9
	lNwkn140CmCpdTWf6U9sG9GW369pTVJjwiZRK4VMm19o4giQhqi+WC4diog8f7+H
	tkxwlw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96p9n3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:38:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c52ff723c86so1114259a12.0
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 01:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768556303; x=1769161103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMa62W+p8IOSew9lvV0PO8b3C+Nq25+zTXf+BFVYDgE=;
        b=Ar3QrhIDWC+Pt4PyfvaHfJKvBrKc0Bp3tqhb3XaMmR5YtJ7BpECGwUtrJa3zD4w6e8
         5pRa8UUKsXwhky/foRnslGtl8QYjRi1ugmMc3mBZa5yvPbrCe7fm4xqk20srnfudmxMX
         1RtAgoR7maH02HTHfXr/4u0JOUVPapgaoNaaUwlV8hH0WE/GbTsGzpoHzn3j9hliV+aS
         0FjZxevIxGmlp2bm4yKB0qAw7jiDU/QtW3WeRoSzbHNdFHIyLymkC2wVMqs18MrpcVS9
         y6gTRszIv3Sd8HEcm4Gy4uLUSlq2q5Cz0kct2b39FujKieDK5ed5PysyFE4R/SjTOjIw
         E5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556303; x=1769161103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMa62W+p8IOSew9lvV0PO8b3C+Nq25+zTXf+BFVYDgE=;
        b=UsVSbV7SeVDy1VA7Rz5DSZcvKsDVsA4e+4TLq6Iw392mGmSEwtAB9d0P2g681s+fMS
         APwMAGNjA1TJ6eUi20E4jr4LcW6bt4c78GkoReCoTfFlc2sd+nlfijLQpNQ+NvkUNHwR
         teXTPyFEZySwrll0El+zkZXIgchZ+VGVJRERiI66keCNLYg/Y+TJXVlkruSqguPDOWwm
         Rbf1n+QsMgInhQLOlIIgtWBGQM0muCWgKT2HvTrqyJdQ9drwPixM1128x+OHVznGySvI
         ayCVrqzUwG0vCkPdTIz09K8HGZvK3VOJoZ5AQPiayznqao/ToGnZ4Tcdaks8C/SOmZoe
         lTIw==
X-Forwarded-Encrypted: i=1; AJvYcCXTJYSH8PoU/regOFSZ1NiTZXzAizn6eEGR2cT2btNcyzdhR8IGht00T7NSGh2jej/T1NKVN+Mr4JYRAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhgOEmGhsWa8LaKxrRoB1m0lCZhUhxMnISIqT8hmdJevIChaiA
	Ug+au2HC3XBMgpy76/ldF9r17W1lNSwy/81DYuNgrzxWfyykfvspmFUTE/TmOznDdwiPEab9W/N
	jHaUw/5CbsDa9Ujm7sQeJuJYYDta237JUC1kHU7dnKG4/dR5+g3VarE6lG+9RBwjI2cCl7UW2kg
	==
X-Gm-Gg: AY/fxX4IfMAAZqgiDaT3g8XafAUtDQf6+7goTZ+8x05nQ7rzU2A1cel1oFjkGN6WGHx
	vSZSVP96zE2V7QrMbDpb0KB0/PR/+wSbzseIXWN4w6jF5GWFRd1BltlZs/ns/PM+a1rIhHSkRxO
	Jt5FqWHtEnlMQtROZwqKDr1Zt8TutnwB47ebMYPLPYkCydH6U1OnTeMikqIis0OVwtAmBi4ymck
	piA+t61ud8UcQV3Xew/6q1bs9fTj7K0xfz6DRvrbw7Fucxfq6hM7g+zMk845OrAnelHyLKvVe/4
	L2W1D++ReSBxp/joYu+S/d8hJK5sT5kjwB6M07TGKbCeEaD/ZwkKYMLXICUEJETDj/jciG7OgJ2
	E03Xm7CxwyqWIUsg4LgYfEHWrbBrRs0IncWafoFFLWA==
X-Received: by 2002:a17:903:2f4c:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a7188fd7admr18393255ad.37.1768556302642;
        Fri, 16 Jan 2026 01:38:22 -0800 (PST)
X-Received: by 2002:a17:903:2f4c:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a7188fd7admr18393015ad.37.1768556302181;
        Fri, 16 Jan 2026 01:38:22 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9e85sm16315735ad.26.2026.01.16.01.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:38:21 -0800 (PST)
Message-ID: <6c1377d1-1a0f-77c8-3257-6fae1d5de3de@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 15:08:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/6] media: iris: Add support for multiple clock
 sources
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-1-8d11d840358a@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251210-knp_video-v4-1-8d11d840358a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MCBTYWx0ZWRfX6fACpR2KRu2/
 SD0RUJ+iEFofXCC+KEBKxm2OsfIM+0D+cr+fr6jYTeyWOowAWIhPb0e0NC8dAsKNJ5Di4j6SpyA
 rNo9qfjeqTvP9YY/CP6Lk4BWDTsZ31yrI1abEnmag7lkd7jG93qUaNeyyhDOJt2qijfFtIAh3wf
 37LFDXuWWGm7Z2cr+VEzoE4MMUvvEmbYGZ7EAx2xv+DI6kSpuJ2daESJn33KNlo/1day9jF4VZD
 wdddvEK4S7YjVjzL4lsS6BTgh9ti2tNxbeO9dzV+FOrYcU+KjjTUl8IqCFIFl70JrVMuzB/5/xz
 QZbLpTBtfdzzGS875LmxvtePMur8TlKEU1wTyYwkC0oGwThf1KyLS0u/OdM/aGiuydgmSZSUbDd
 SWbYfsOUYpg+pBAY6wQkvqsp0hCxeC13vI71juTvyXs7xKOBx3lpK/2bnLC/Ip4sQGkKZMnr7CP
 /u1JGUiYT3ZN4LdEv9g==
X-Authority-Analysis: v=2.4 cv=M7ZA6iws c=1 sm=1 tr=0 ts=696a070f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=blWSk0AuXjsE0o78ys1YMg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=PpCmD9vaob51LmojhM0A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0uzI2yFg_sM_lJ2llnaa3PN20K46m0Ka
X-Proofpoint-ORIG-GUID: 0uzI2yFg_sM_lJ2llnaa3PN20K46m0Ka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160070



On 12/10/2025 6:05 PM, Vikash Garodia wrote:
> vpu4 depends on more than one clock source. Thus far hardware versions
> up to vpu3x have been clocked by a single source.
> This adds support for multiple clocks by,
> - Adding a lookup table
> - Configuring OPP table for video device with different video clocks
> - Setting OPP for multiple clocks during dev_pm_opp_set_opp()
> 
> This patch extends the support for multiple clocks in driver, which
> would be used in subsequent patch for kaanapali, when the platform data
> is prepared.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/iris/iris_platform_common.h  |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen1.c    |  7 +++++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c    |  9 +++++++++
>  .../media/platform/qcom/iris/iris_platform_sc7280.h  |  5 +++++
>  drivers/media/platform/qcom/iris/iris_power.c        |  2 +-
>  drivers/media/platform/qcom/iris/iris_probe.c        | 20 ++++++++------------
>  drivers/media/platform/qcom/iris/iris_resources.c    | 16 ++++++++++++++--
>  drivers/media/platform/qcom/iris/iris_resources.h    |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu_common.c   |  4 ++--
>  9 files changed, 48 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

