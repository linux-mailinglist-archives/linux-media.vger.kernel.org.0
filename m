Return-Path: <linux-media+bounces-65566-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XMFMCijrO2plfQgAu9opvQ
	(envelope-from <linux-media+bounces-65566-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 16:35:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF846BF29B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 16:35:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lul7uDuJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jENzmWib;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65566-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65566-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A7C83043502
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB4C3C8C43;
	Wed, 24 Jun 2026 14:30:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCD2346E56
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 14:30:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311429; cv=none; b=b+hYFs4KwrpUIglYmuuOk/iEV9rbCz4b2l52467OWvo9HgYxXWc/7LT2iCPcNxuHjbbj4nttokQ4betG7oFvuhtBcKZznr9ai+Rmr3p4Y+cm38OHAaAWGEX1OjeB9SbJLICXLkKIEWsVFNFJ7fFM5ng74IwALJ5CLiUdKe0ZWVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311429; c=relaxed/simple;
	bh=jXv0pTSEmNFbM8ekGb88NGF9lNs5tNx/gJo+58GQa3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzWr+aVsq3Ed0o0CPMiQCNop5jsNU79+doXomOocDQy4F4tA1TJmDMI9XLYXO3HAJ1RBcccY8M5ah8tSWrf9H1R/UnG8nHGL6xEfRnu1AGBpQW3xLsCJSpP9V7KF86L6DcboNZ9vBhLn/78gCq0L4eUf5H6LHfJR4tjEm5F5MSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lul7uDuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jENzmWib; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANb7n1148170
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 14:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bJXOcydpNHnaGs81rbyZLCVSzov2xbjvTQOme0ii2Ko=; b=Lul7uDuJrI4R08lA
	oajLQeA/bJR6WsC6oxAKUB7JpeLy1eDw0DyNwgYYW5eUxIIlBlwv1RISjv/esQcr
	jgIPWWkPXtKoTCjdaT6ab2Om4fg2BBog9iOoMgqnLuMnoEvcMe5TA5AunnVtR25j
	+tn9oozY3ejp4d+vyx9oOsCpflx6oag7Xbf8JjXzR05+OuaeonsOj2/ccPs+0oSI
	OYO5Og2nphOI1vOMHJGd2xALzKfKirIbZhGLHs0ur81YwdKT/NVKDG0w/Z77ctQf
	HzqBw8LMY/Ij85/wi5nPi+JkysY4hE6RHmxO776TR5jUqM7v55WJM0lRgPWuG1/G
	47njjg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r32g34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 14:30:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so1518998a91.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 07:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782311426; x=1782916226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bJXOcydpNHnaGs81rbyZLCVSzov2xbjvTQOme0ii2Ko=;
        b=jENzmWibQYcc6bqVPLmegLPAhwK58RTtgALAPZJlHBcDIzwmxZtPPm+6y20aPOd7St
         oN1+OtDvJceV16olwBDumfllSOW9KvtJE0dRsk4Xj4F2svTkdLPAOkXTQTLZGhjRiKaV
         XJUa8ETVWsmV8q3QnTQLnS5pLLXSghJ7HJiIgTL+S/c4VWrkaY6fwjMpqbQ8C3/bKRcw
         DP2EM2ACZW5480l4ugM+cFlGkyRIPVqgGwBRxWRt9sfAviovf/v0aaYvsQiwiseEWyyD
         CGy39IwFKheEflcnlO1sGOflt50kknKFUgohrSeo5jO6mSuO99//M6mAP0kTjhpGNsFV
         8nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311426; x=1782916226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJXOcydpNHnaGs81rbyZLCVSzov2xbjvTQOme0ii2Ko=;
        b=RkfCpAWnwRWKe/MqAD+1/a90+JIu87z4kgK2qX7k5+9zhkt4dzJ71Lz0xZDGtMnQDG
         Jxa58t2SdLWqQBJ2OYxXgwFlBONDhBNr0KrUabw6RD24qClGwwNmOWOyHgVeAna7qNuc
         4/W9myjykSx4X66hvYaKr0LkjZJ+zDs/wMi7mOnXddHf1xANMvQVkOy8mV0Zp9zniBuD
         MgqVfjHKMrX02ctnEvLdS1zi9UPW0lJIe273lNdKuK0VSsBq98hVRLhQzZEgR8Hcj7lU
         PAJIMILyHTeCJBjBjSBJPdOcPhMqx67o1Vg68bV7E8KMJBYhAlcrR39zmuhDk/cb3khZ
         nz+Q==
X-Gm-Message-State: AOJu0Yz2o0a8Bdo5uzBgZxVFbEuvJFqvKwJKxMCPi99gZDK2DKYRBVzt
	PxQa3lYmR0idLBAqPFvoq1ctqlcFzRvHhE+u7WCdDIpgJGrE7exOTSV6211AhQiY9GLdohnUEjm
	EIwGmQdh+F2p13oOlt0DtFIHlVacvaLzFH+1/gzK5rSL5/xvC+1ouTP7sd+sWQBqvLA==
X-Gm-Gg: AfdE7cnO7XL1P34GlYMfzuKniSboK/vs05pN4dgSLv5sDOBbfbr2bnAIiXsBUuQxi6G
	aoXV73hobfs3nou6mZANrhBgxflb1fCEA56XIjo34vmxp7le4ldOzxNH3EPmnFv1e/ShacYxjbl
	S46Uo3g4K/mezZ4u1aQGemcp4J73qpZXwGWkNPWOtaPrcuYZoB5XsXyWeukkZqPcIarj9DRqVgE
	B9Cvszpo+40fl9ohi01e4uh72ml10uQPZiP5cPF3iWaUuFxQT7Yh5rlsFElIR5HOOidWyZT7dvk
	I0sK+cz9b02fhwWbrd/zdzA9c/aDFOd16BACRvxTv+lOuNfn6fDkt0VNF05x2FPVj6U85Fc6TMy
	DmJf0I1GgvhP2RIQwI8SyWgkPObzJSsfTmtRwUCCLkTaj
X-Received: by 2002:a17:90b:1805:b0:36d:ae6a:22f0 with SMTP id 98e67ed59e1d1-37dd0db4070mr7924148a91.14.1782311425603;
        Wed, 24 Jun 2026 07:30:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1805:b0:36d:ae6a:22f0 with SMTP id 98e67ed59e1d1-37dd0db4070mr7924022a91.14.1782311424721;
        Wed, 24 Jun 2026 07:30:24 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3ce55dfsm3162887a91.10.2026.06.24.07.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 07:30:24 -0700 (PDT)
Message-ID: <bdae4575-f5cb-4c74-bd96-ec8c1b0c540f@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:00:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/16] media: iris: implement support for the Agatti
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-12-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-12-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfX3h4aTz3PYVqM
 h7Ic5PGtcvTUtphGXNEA2S+eOs9yNlxZQYuSa+BiGQD0ZiNUOeaB3ksxNd9hHw/ysLgA0r6F+na
 zJ/519y9fsC1dnW4f3DYl3Hj1pVjKkz0hZmi1zoeqjJTDRZWdAJedUIhkCSBy0D6SD46Nwj5kEq
 At6EuiBuAJbMz71Rb+evmYJnUWJ39GH+B9OdsxGmhQAqDsoqB4/yBR3WnayMMZ5rNqZQbjrltl7
 tuJYs+ijIYuEnJy3cNnzwOBF8BCiXvAlGD6atj5JvgtEgNiUSD8YazsjdJm/Nt6sisdA4RMGlUO
 7+UmxVNPBoLZ9rTc7zYY6pbFQW1GTyhhA4jjl6ROKBQO9sHWTy+prluCacS9c/Qzj6JgOMYT2bm
 NYhCy43Iobtkf78FhTH7wOpKibOiFQ==
X-Proofpoint-ORIG-GUID: ImT-5Ik3ygaiDe40zhCtwjsxbNocWxwW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfX+C8Y1wyuH7KG
 FmUyMC24P/81pXXM1ZxqNMIpm3WJTFHiVZbU7dzHVJiD7KUaC5dj5eM+H8NaC2AMerCr01n2wEv
 1ipRiJvOOGz+hwRKUz6H8PhStuRSwg8=
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3bea02 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=S-oV5pMvw9Cc1cVx9MoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: ImT-5Ik3ygaiDe40zhCtwjsxbNocWxwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65566-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BF846BF29B



On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> Port support for the AR50Lt video codec core (present for example on the
> Agatti platform) to the Iris driver. Unlike more recent cores this
> generation doesn't have the PIPE property (as it always has only one
> pipe). Also, unlike newer platforms, buffer sizes are requested from the
> firmware instead of being calculated by the driver.
> 
> Co-developed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 227 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +
>   .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 110 ++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  13 ++
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
>   7 files changed, 362 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index f1b204b95694..bbd1f724963e 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
>                iris_hfi_queue.o \
>                iris_platform_vpu2.o \
>                iris_platform_vpu3x.o \
> +             iris_platform_vpu_ar50lt.o \
>                iris_power.o \
>                iris_probe.o \
>                iris_resources.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index ca1545d28b53..f57af31dbd9f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -443,3 +443,230 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
>   	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>   	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>   };
> +
> +static const struct platform_inst_fw_cap iris_inst_fw_cap_gen1_ar50lt_dec[] = {
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
> +		.set = iris_set_stage,
> +	},
> +};
> +

<snip>

> +
> +static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {

gen1...

> +	BUF_BIN,
> +	BUF_SCRATCH_1,
> +};
> +
> +const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
> +	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
> +
> +	.inst_fw_caps_dec = iris_inst_fw_cap_gen1_ar50lt_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(iris_inst_fw_cap_gen1_ar50lt_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
> +
> +	.dec_input_config_params_default =
> +		sm8250_vdec_input_config_param_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> +	.enc_input_config_params = sm8250_venc_input_config_param,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8250_venc_input_config_param),
> +
> +	.dec_ip_int_buf_tbl = iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl),

same here

> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +

Regards,
Vikash


