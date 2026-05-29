Return-Path: <linux-media+bounces-63049-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK7gJuWtGWpyyQgAu9opvQ
	(envelope-from <linux-media+bounces-63049-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:16:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 371A3604732
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADCAF321CF48
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 15:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671173F0750;
	Fri, 29 May 2026 15:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xvtg33A3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMXSLN4m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69463EFD2D
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066876; cv=none; b=fUT0x5p2UbV7FQHKQ3gqlTKfh6MGuOdV6nDalNd0FjSKv5lU1XJjsW5reaxXB7ju7zYKWAgJEg8ZxhIjSl11JBoUTpjQS0OKZn64UCdj2Y3tKwe/Vg74enn4HUq6PvJTD8HiYP8hujRegO5EHHTQ11b5RMvaksERNgA5TSmkYf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066876; c=relaxed/simple;
	bh=ekH8jL5GTEUDGVAvOS2ZIaVQwCZnxE8ZwtzE7+yiA7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=narUBWbR+lPN0so/ee1RW1MeT7UOGxMzbXB+PwoXsD9QTuc4E62i5WU8v8yx8Wurlwls6HppVTMOIQyMsRSlxqAfwE2Jd7hDhXCBDDxlPbNuLMKoCkcslh0XFxJt/Eo2dI0yGZFkKQ2V7eJGVkCeAizT7qpi3OAle9BNE3ugi+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xvtg33A3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMXSLN4m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLEt74050805
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 15:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0DBIjTIgaaXjiGvnFuMwPeT2jOYan/1jCVFnVrf0W20=; b=Xvtg33A3ig+6aYFG
	oL8rJMr/IQKZvLMoyLnn0zZXciu8R5PCNt+FJ4h8h7q+e19LGgNKQfYe289MgRmy
	DFggJITACwYZqw/KacpmhoJ1jy15LK/X3G/BXim6nF8FddZA/9eJP/N/oINCoVyM
	oeWxrLL9qpCKke5Od+xGjJDKap2oeqZ4vFCteFxZA8XayB5vCSA9LMVGUL1G+seo
	4g3+3faCQM44ek8O7ZxNGGKSEgdz7TQRflOJpbfZD2zSGBd8c63tbps7IlwGQwNk
	w6V5S4timf1fGU7BMDTIyA5BVwsbIX/Kuv0vREq2sT4fas/QvGdopxIBX/CnBYVF
	FN1dIA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety54msn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 15:01:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83ef22f8e8bso9490422b3a.0
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780066868; x=1780671668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0DBIjTIgaaXjiGvnFuMwPeT2jOYan/1jCVFnVrf0W20=;
        b=iMXSLN4mzYaO3olUhJ9wk/KQWwPzt4xhlENn3BzCfbcyknZwu+V+tfFBrGMUq8ihqD
         lEUpoe0zByVojMURq3yTEMpHpuloZenCyycF7HZKJaHraL0v8hw/jHUj0lbSVVw2iYSK
         7QKw421j/hT8eg1snaMHmZDL3rmeJzDNH4Ld6e5r9oZcfhmV+/mq2VsFZZT+yZtmBEJw
         Oh9wJWyzeX5Iu/x0c5OxKPOHhp8s3Xl6+CxKb/5nxZpSK9ohHOUw3yOwH5ujEJ38Du/R
         YTf3ohbtYh0s73hcg9ufpYYx4WYzPoDd3dHbXRAmv4N0dJaqKPKFVcRTxAlWCAYNNDCk
         M7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066868; x=1780671668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DBIjTIgaaXjiGvnFuMwPeT2jOYan/1jCVFnVrf0W20=;
        b=mkMc+uHbQLBzpQLWnHG9VoonQWu/UsIgzK3nVqvclon8P0s43PGq8F7W2mrBuYnImc
         cNBhVf5HO8IPaKByPFhmNQ5Zv6eAL7bbtdLFEM2We8EqonpLNNEO1HIGl7Umy5gSH6gh
         FyHYLdy1McmyNC/3lIo4wq0xtE67UeTuNf7BRdb3X1WQgUjI3iUnBBVCvCyH65RvjSR4
         IRJaQHuR64zm2/aTDeMd7weuaJ57MfA9W5gctbg6LsNZmnPYpLpXbvwc1hpNO8QMxG7U
         aXn27hzfHyBYeK6ZvEz3NKPaaFnx/IZOoRpC0pFjUv7QknHc4NuBVhJLAYBuMtxXDLJI
         3QXA==
X-Forwarded-Encrypted: i=1; AFNElJ/i7E+EO13q6T6bHUOcvDlTFV17BvBNU6HWRWiXyKIQEe8hA/iPlbdNAXv4/rR9mQaOFg/pzCeGUnezhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdl6/PO6iiBWLJXzYAv7O2c0BhX64l1HHV+SYIdUp230HnTY/Y
	jMBGRl0aj+X0029m/zhuvg/UUdq0EgPPIiTfUggCenPNskjLQCPwXGPOLJPnYfjMG+LeEcy8LwG
	NBYgbXMncGT18nqQmxVdwNUN0nIjTe1tEqYiz4NSpJLBb5RctGJVCTOxxYqxOudmdRw==
X-Gm-Gg: Acq92OF5ZhPAqdzQHiSxTcVZcLvBqdZPjY6OhvaYg3PVNZv760TafCWON3YN6zhOv+9
	i3YKFoqul7kXRLDOgU5i4GQfDis0Z8QFCWojOUIo4S7AGB8RbCJ1Zv0vjPHVXSLqszLVfigjKJD
	UzGnG/YJUEhR6X7DOdP8LYeMEnFsKaytQ8JPwMCn8c1CNOIJtgr3L6QoGu37J7/Im+knh1l3o2S
	gRngDMYXuve4gsvs3CgM/47Yneajh6tx64bZqJvrs9XBqeBKcK8M1IwkIIQIjJ2omJCpq2RKplK
	zM8QRU+Hdgv3Vv7F/Vxn00jxZtc5puq/ktKIFRaGFw5g32iBmy6DZwwNrnA+4CqdtFzy1VaSBZX
	numUKvaRHZkmxHvaLVkLC8rMCQOrk0iJXyW72lTle+rwtGXhN0TbdF4vER9oooxc=
X-Received: by 2002:a05:6a00:440e:b0:82c:daa4:ce29 with SMTP id d2e1a72fcca58-84212c2fd94mr3681692b3a.47.1780066867476;
        Fri, 29 May 2026 08:01:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:440e:b0:82c:daa4:ce29 with SMTP id d2e1a72fcca58-84212c2fd94mr3681595b3a.47.1780066866769;
        Fri, 29 May 2026 08:01:06 -0700 (PDT)
Received: from [10.204.67.150] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm2739983b3a.26.2026.05.29.08.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 08:01:06 -0700 (PDT)
Message-ID: <21c17cac-2a1e-4b19-ab6d-ddca9132d725@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:30:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
 <CAFEp6-1VAW-S2d3q3uN2n1weMOoSPXtX_k_6msQ-K_5A5mZVLQ@mail.gmail.com>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1VAW-S2d3q3uN2n1weMOoSPXtX_k_6msQ-K_5A5mZVLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0OSBTYWx0ZWRfX/Z4Zk2Jsw8P3
 JZZWOxIDuEX0aOZarH/DH8wGqpHqN9zwTuxrc10eLvGA1jU2kN8Pd12k/+6WMm9XJfjZbuVjpH5
 0Afyzq+B4NIWC+W4l6r7ltC07z/hvBhIosrYs72t/RUH4WgVmEF/8bkfIYHm/2kFl3HN6OTf1Ii
 +iz/4FRLszIMl1Vq6/O4PvmQQH8BkTjQczZVwLqqAaDPROCsFmQ9A0ZCNn6cYgnBcR1ew2/Zmtc
 4hHsvudAYKrb3PLZSA9LJ/WVCy1Zt9Az4zWU+1CtA9QaTAlAPNo23btAul4okwJYX4LkWwXc2EQ
 B9JTW+krJyPmMoY89o9JANN2Orik7jE2WK+WT8hKQPM3sciRQyg0yUf6iF8tbaF1H581gFYPgOH
 ypJ04pbhTyn0LL+cMY04j+vaUipGvQ==
X-Proofpoint-GUID: FhiirCrZPuAvD9eJ2x5BpRXH51ZLZiBO
X-Authority-Analysis: v=2.4 cv=WaM8rUhX c=1 sm=1 tr=0 ts=6a19aa34 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iLf03rxdIeEfhWbO6WcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: FhiirCrZPuAvD9eJ2x5BpRXH51ZLZiBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com,qti.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-63049-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 371A3604732
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/28/2026 5:55 PM, Loic Poulain wrote:
> On Tue, May 26, 2026 at 7:13 PM Nihal Kumar Gupta
> <nihal.gupta@oss.qualcomm.com> wrote:
>> From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
>>
>> Add CAMSS driver support for Shikra SoC. Add high level
>> resource definitions for 2 CSIPHY, 2 CSID and 2 VFE instances along
>> with the interconnect bandwidth votes for AHB, HF and SF MNOC paths.
>>
>> Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c |  2 ++
>>  drivers/media/platform/qcom/camss/camss-vfe.c            |  1 +
>>  drivers/media/platform/qcom/camss/camss.c                | 13 +++++++++++++
>>  drivers/media/platform/qcom/camss/camss.h                |  1 +
>>  4 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index dac8d2ecf79957dc05c5524dc439791ce097c785..62208f5c4f17bd6c9a8fe5613649920e6ee1a1f2 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -1130,6 +1130,7 @@ static bool csiphy_is_gen2(u32 version)
>>
>>         switch (version) {
>>         case CAMSS_2290:
>> +       case CAMSS_2390:
>>         case CAMSS_6150:
>>         case CAMSS_6350:
>>         case CAMSS_7280:
>> @@ -1222,6 +1223,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
>>                 regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>>                 break;
>>         case CAMSS_2290:
>> +       case CAMSS_2390:
>>         case CAMSS_6150:
>>                 regs->lane_regs = &lane_regs_qcm2290[0];
>>                 regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 319d191589884777bced456867e5a2a4211a2770..b152f8d48e003d8eeb0cf19ad57419b25cdec087 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -342,6 +342,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>>                 break;
>>         case CAMSS_660:
>>         case CAMSS_2290:
>> +       case CAMSS_2390:
>>         case CAMSS_6150:
>>         case CAMSS_6350:
>>         case CAMSS_7280:
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..f67ecff53f15bd213dc7736d4e5fe880007d1ee7 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5565,6 +5565,18 @@ static const struct camss_resources qcm2290_resources = {
>>         .vfe_num = ARRAY_SIZE(vfe_res_2290),
>>  };
>>
>> +static const struct camss_resources qcm2390_resources = {
>> +       .version = CAMSS_2390,
>> +       .csiphy_res = csiphy_res_2290,
>> +       .csid_res = csid_res_2290,
>> +       .vfe_res = vfe_res_2290,
>> +       .icc_res = icc_res_2290,
>> +       .icc_path_num = ARRAY_SIZE(icc_res_2290),
>> +       .csiphy_num = ARRAY_SIZE(csiphy_res_2290),
>> +       .csid_num = ARRAY_SIZE(csid_res_2290),
>> +       .vfe_num = ARRAY_SIZE(vfe_res_2290),
> So isn't it exactly the same as 2290? wouldn't it be easier to have
> the shikra simply fallback to qcm220 (via compatible string)?

ACK, We will simply add fallback to 2290 in dts.

>> +};
>> +
>>  static const struct camss_resources qcs8300_resources = {
>>         .version = CAMSS_8300,
>>         .pd_name = "top",
>> @@ -5752,6 +5764,7 @@ static const struct of_device_id camss_dt_match[] = {
>>         { .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
>>         { .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
>>         { .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>> +       { .compatible = "qcom,shikra-camss", .data = &qcm2390_resources },
>>         { .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
>>         { .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
>>         { .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
>> index 93d691c8ac63b2a47dbb234856b627d8911a1851..8ba8a38113dfc15849fa333d05b2c3853f3a7714 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -82,6 +82,7 @@ enum pm_domain {
>>  enum camss_version {
>>         CAMSS_660,
>>         CAMSS_2290,
>> +       CAMSS_2390,
>>         CAMSS_6150,
>>         CAMSS_6350,
>>         CAMSS_7280,
>>
>> --
>> 2.34.1
>>

