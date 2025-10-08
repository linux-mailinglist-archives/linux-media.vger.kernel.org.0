Return-Path: <linux-media+bounces-43936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04919BC3D10
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 10:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 199DA1886769
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 08:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9EE2ECEAB;
	Wed,  8 Oct 2025 08:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Et1yirwh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253B62EC559
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 08:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759911971; cv=none; b=Z9Yt3YlfPukpAZtTqRgR0SI3ERo91phSXbjmNFz3QFCwwD/owJlNCPf+Hd2OUmbGmtVoxGtCCXhrdlEirF8OfOHBmCmWDNzlytxD8JFvlpz9Jauz9suWQEUkFp5eEcz5vkoIza7rOCxJFyTjILVNKGljC4cYucV//QkDsttAINU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759911971; c=relaxed/simple;
	bh=RQQz6gD6jkUfEsyMDktDwFYO/gAk14u/fR2P+lyiYhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNoLW1DeVsKNNG/eyBXrVhEziKqU6yz6aWEemVkFjpeQlZtWPQh04KSs6EoV580wtihOlQhfmAPlsrCD8G13go7DJAD1fXYBdA5+ZP2D9AZuEesfO1eLPmWrqOZFhF9FW3ckksYn9iDDcweOUef1JgNNCC/W2oU/8V4MERvEEXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Et1yirwh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987agE2015669
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 08:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	53dlOd9NZ/agGEGJTr5I49jgU3gY6VcWx+OSG0tx7Xs=; b=Et1yirwh55V6Iwk1
	xyv10jihz1ffcDxLfCa0Ys3pUAi4BpGvooXF6oRPL+e9Wi+Scm8Bql+JNakrWfC5
	9sEHvMFK2KE5QhBvSe5lWpnQgB0ldGnxMEZjTPg8ddR5Y94Aetl2KWQZAcHJV93v
	W5wL3sVyFFBip5hR/oIwMvPp7/ozK5jTZ+D92qJqLeaTQsfBV98c4tXpjfa0DXTx
	VYfN0pO/EzSQ3z8lIuwdgVs3ELoV0itllbRHyR6fzy0WgrAub0czmv2SDbAa8TSq
	KhjPIL7g4BVA3R5e3mfKlFyRbXh8RE1NOV5DBoLWaEBp3ax1lOe+HfCb/BIT1AAc
	FAgtrA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0nhbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 08:26:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e4b4e6f75fso21006271cf.1
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 01:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759911966; x=1760516766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=53dlOd9NZ/agGEGJTr5I49jgU3gY6VcWx+OSG0tx7Xs=;
        b=xMdZCtxtTGtkubnriAgVNyet82n+/UCTTIofGwFbjaN4bvfnYUrO1TqrGjCWF3RPd3
         t6N7ZiTF/68P8Tg6Smbwc6ZAEnyWi0L6WF07xr0hN1P6+rYTU+49BL0MBAIgAczae2Vt
         CdeSbxLTeF+VrZtF2sVrlQCxyJywg/Bz538WUQuPWz44J1UFyuHjchiO+zLB2wGgXX8A
         ZhCmR7EwlDTNdVy8ZkBu9wI2lcHDgmc7d4eR/A6Rt2YdI6f9d+PUWCEtDtYpxarncFtt
         Yu+POc2UeHbGpJtZ8gFo8ue0TVhPAAdb8hcq55dyIJN392clHeBxoiboepP586ZifkS4
         KS4w==
X-Gm-Message-State: AOJu0Yyg3I2dDDnhiP38t1HdhXQoVOSEwUM8E6GI2jjlhjGPdbHcyMmy
	MuhLTWQ4aK677LDC0gh+ZOx149HRIW9hrbMOqB1rLA68ioTyuYIoTXCtbuD+834krgJs3VUzsYM
	wpmSqlFg69V3qL2+rcU88ZH9qrPO3Lx+gwWe5Biddo5X6QmBUfi5ld71lPiLxK8fJfw==
X-Gm-Gg: ASbGncvdD4FVYtr+/c8FKSmV8hq2KczZh+nQScviB5GNmeHK2W/EDLH0xwCaquXq4AC
	UPoOzxmctpRWKR8r3DLDn7RlZmbq1Cm5StDAI04ewDomncomqCIcNDOoFz7ESVpW2y1vutuza0G
	Vq/kwRbnlEthl+w72m1hR7Cl9fTY5Jt1olKuJnYPA6Pgrfe84UbQMoLp0VKb5EwpuUlAf3Wsms2
	gfIMRu/XxZT3pWRNiJVMUDwg1OwEztxmMlJGRvg9BE8N32Rh/9woKQoIZFS7u113uNAjy8lVWXQ
	cYOyhBmcHbXJ4CeK832EMbJm6gpyIjgPVzNsVK2+c3tEVGYUT5W5D+HH6poghpgpYbUz2RWTeib
	J8xg+RMv/iv9bzwN6GAp/X1OrxZY=
X-Received: by 2002:ac8:58d2:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4e6eacd4f8cmr22760791cf.2.1759911965937;
        Wed, 08 Oct 2025 01:26:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRmlkTLXnDeFKjuXAj+nAZgfp3XEota8uGT19bdbXw/d2N3FbwbUJmqTziYryrjb8SIWhx+g==
X-Received: by 2002:ac8:58d2:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4e6eacd4f8cmr22760541cf.2.1759911965444;
        Wed, 08 Oct 2025 01:26:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788111f1fsm14431758a12.36.2025.10.08.01.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:26:04 -0700 (PDT)
Message-ID: <3f1979d4-1438-4c9d-99db-d97a09c5c35b@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:26:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] media: iris: enable support for SC7280 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-8-def050ba5e1f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-8-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _IIIP76uayo27cBSwvGG3wOySJBd0r3d
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e6201e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=j50RDpsK6yXKt_5VL_0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: _IIIP76uayo27cBSwvGG3wOySJBd0r3d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX1F/5ukW3vW6t
 qkwMUWrhtVDM5NlI7UYcFxhhRVlX6hEKmTE60WAJ5R1upVGMbI27dfhHXXi9ep3qVjEoDr/8qo6
 IwMBBjRSf5WIo7EobKzSurxXbIsOOoT3zdXz9Fqy5XEjZxWYR2k58cByzUsVIQAEjyxWgWAy9Vn
 /lNPzhhBzab1l7ku4mR3kMYYWM3Sn+EJCcYyHSTIbNafQB18kdvcfGycYp3fsLcNREJDfmUkhae
 8CXc+JfiKMgDj/2ovQdfqNTDk9c4inKIrHffh86xAiP1YcDwZGtw9mfCmPCia4UERl6OUBgTACF
 Go5/KyO7EhDZIXqmbMghusltXaXcA3Xg1FNiMWqCP6gCiwdHVnrynATKEMTHgZh+Oce1D4C1OpA
 MPafnpDMtMPepWLTaWQUJho1HbtOaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> As a part of migrating code from the old Venus driver to the new Iris
> one, add support for the SC7280 platform. It is very similar to SM8250,
> but it (currently) uses no reset controls (there is an optional
> GCC-generated reset, it will be added later) and no AON registers
> region. The Venus driver names this platform "IRIS2_1", so the ops in

Which we've learnt in the past is "IRIS2, 1-pipe"

> the driver are also now called iris_vpu21_ops.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |   3 +
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  66 +++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  drivers/media/platform/qcom/iris/iris_vpu2.c       | 130 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  5 files changed, 204 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 104ff38219e30e6d52476d44b54338c55ef2ca7b..36e33eb05a6918de590feca37b41c07a92e9c434 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -42,6 +42,7 @@ enum pipe_type {
>  };
>  
>  extern const struct iris_platform_data qcs8300_data;
> +extern const struct iris_platform_data sc7280_data;
>  extern const struct iris_platform_data sm8250_data;
>  extern const struct iris_platform_data sm8550_data;
>  extern const struct iris_platform_data sm8650_data;
> @@ -50,7 +51,9 @@ extern const struct iris_platform_data sm8750_data;
>  enum platform_clk_type {
>  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>  	IRIS_CTRL_CLK,
> +	IRIS_AHB_CLK,

Interestingly, 8250 also has an AHB clock, but the clock driver keeps it
always-on..

>  	IRIS_HW_CLK,
> +	IRIS_HW_AXI_CLK,

This exists on SC7280 and SM6350, perhaps as a result of the bus topology

>  	IRIS_AXI1_CLK,
>  	IRIS_CTRL_FREERUN_CLK,
>  	IRIS_HW_FREERUN_CLK,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index 2b3b8bd00a6096acaae928318d9231847ec89855..d5288a71a6a8289e5ecf69b6f38231500f2bf8b4 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -364,3 +364,69 @@ const struct iris_platform_data sm8250_data = {
>  	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>  };
> +
> +static const struct bw_info sc7280_bw_table_dec[] = {
> +	{ ((3840 * 2160) / 256) * 60, 1896000, },
> +	{ ((3840 * 2160) / 256) * 30,  968000, },
> +	{ ((1920 * 1080) / 256) * 60,  618000, },
> +	{ ((1920 * 1080) / 256) * 30,  318000, },
> +};
> +
> +static const char * const sc7280_opp_pd_table[] = { "cx" };

Wonder why this is different..

Oh, I can bet good money SM8250's Venus isn't fed off of MX alone..

Let's check the sauce..

It was always supposed to be M*MC*X with MX just for the VIDEO_CC
PLLs..

[...]

> +/*
> + * This is the same as iris_vpu_power_off_controller except
> + * AON_WRAPPER_MVP_NOC_LPI_CONTROL / AON_WRAPPER_MVP_NOC_LPI_STATUS programming
> + * and with added IRIS_AHB_CLK handling
> + */
> +static int iris_vpu21_power_off_controller(struct iris_core *core)

This is 1 : 1 the existing sm8250 code except...> +{
> +	u32 val = 0;
> +	int ret;
> +
> +	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
> +
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> +
> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
> +				 val, val & BIT(0), 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
> +
> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
> +				 val, val == 0, 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
> +	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> +	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> +	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> +	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> +
> +disable_power:
> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);

..for this line

but this could be added to that one instead, since both clk APIs and the
Iris wrappers around it are happy to consume a null pointer (funnily
enough this one returns !void and is never checked)

similar story for other func additions

Konrad

