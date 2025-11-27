Return-Path: <linux-media+bounces-47828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D63C8E17F
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 12:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 904B83AF30B
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 11:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8595732E121;
	Thu, 27 Nov 2025 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSFeM/s8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLy/RqyO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338503246EC
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244061; cv=none; b=YIU293+cGAkQH3IS5lSQja4/NWk8kvH1iUw6OKneXNMXkqe8T0q6GdADB9CdmEypRcMucKCKV75FKd6yi6X3ryO2nWfnoIxDJiMxOAICI5qpfKXCTaWP/z+aT7ZEtlF0Zm15okRXNEIG4WSdvH/D114VkbX6auw/gkAujHXOoNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244061; c=relaxed/simple;
	bh=+gxmd9icSYlbqAispPKwnf7BzQU8F0RGLdyHmc9XgjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCJUnGccub/9heXZe0rl5CYyWiJM5EH2BKHNz2cOJDeYl0IicPq9suDqZC/IF3UAXskmaKhUHaB6VW22RYIhlHUvk+eTvMVBKw4Y1OMcmxeOZh4nTdDPTzd1QZ5N11XFrgn7tXA+2kkdkcRq38GPgz7gfnslYFBaJHvVIrINSeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSFeM/s8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLy/RqyO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA1Vkk3840085
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 11:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lDYzsPsglBGkvA6BL4GlUtJIqxMEjx5ALvjgIXrDDkA=; b=WSFeM/s8kEQFEZex
	IaDpXgbCu9Dl0PDCNazx8eRRe7ccGuCNOEfJlytixoIF6z7OK+PtmvDoXB6lFmAC
	IepID38fGdeIw6ltcIWT88fMmJ8FpOt0j5LxbHrCaS75l0fAOsE0FhKf4IhCjwwQ
	1i/5Du6jnzTWpLlEAymPMs0HXdTaJLT+MKVyF6rhRPCxWv1TibR//6uvw3yBxhh9
	dinbGYzE/wzY9QRLytiLHPrQ1OOnbma+kPg+HysqIdHS98Lo0U3R8fZWbNkqlOG7
	WzlWEzk2lDozQt/QNzkEOk7B+FM9XGF+Rd1EsPAvXYUX2bSHep+7tWEvVFEHGylp
	tLrj8A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apdj09j2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 11:47:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340ad9349b3so1195437a91.1
        for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 03:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764244057; x=1764848857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDYzsPsglBGkvA6BL4GlUtJIqxMEjx5ALvjgIXrDDkA=;
        b=GLy/RqyOE0XTo7GpJoWMaeJ2RC5ldNYNjWRGWDE2a/0c3ZrISS1zJKsFv0X1e1eDtU
         cjBiZTzvsw2f7LPgbdI7JOa5J8rwLuoGi+EoEordWG2TG0Q4wBkWTdsP11nN4nJMRLR1
         nuw1FzxtnefNCxTmqx9UGu80mQZyLp3xxbA6l0brnGRww/JTCzw7TMAs4pUqVkyjjKEz
         kLAv9f+uhLzceYrDVyIvXKZFUXqSgWXnmFGqmgNmxqN8WT0j66baPJpZbYYnxZcA5tS9
         Ez6JF5xQRGcIoT3NtNS6nj/flim8ZS2zXUkFIPcEEcy9QJ4SbLJfU/6d8qA67eL8YPaQ
         x1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764244057; x=1764848857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDYzsPsglBGkvA6BL4GlUtJIqxMEjx5ALvjgIXrDDkA=;
        b=Cb2HFtO3gW/J/FSwh9sSVbIdQWUxvJk2oGLTFKOMDemz605G1TTqDJChyMjFQ9OI0F
         Kq2SjT/umQTaoGBYCpEV4dYMf01lSKiiuL0D/AqGGaRAUBjF3LW/MOQjOnWQBDLPx+5l
         XZJXIwttj6N3wTmAu8id2ZUr8QVoBAzVEzYuoxH7ijPNPEKPZNksk3pctZhOqTAYd2dz
         CgrT8foHSrU4WBD12gZSrGQOU+Jgdo1wEKtmhFtnI3+MXI7M8h2APs/dCIqNtDKeQAeC
         LQ1HgPBhitGuKiSDu0Wzu96Q1WWmDxhgYUhY/uy2tBdZ6+ClekcelJdZKC5uOfG2mqnE
         jwMw==
X-Gm-Message-State: AOJu0YytYxgzxbtrYJJv7o183vMoc5yvKvXW3loE5/WB7YpuN1Q1iDoH
	HE0lcsXRufQYgVclP0wTb7w90Yy0SY1LHmalqzMCknUNkQK6cZTLYMt0RBRa5LjlXGMPLwO6SIY
	bmgcW3cC4gwgy/413sc7NCL3n8xmvVZ2VlwZx5JYZXmGXhQ4PgBs/eG/y8iUU8WP6bw==
X-Gm-Gg: ASbGncuNhfSdIATVpjxxO26CV1moOdcJMRR5xYpc+dRi3M8sBqHAqMuHt50uqj27zN+
	vy59ktYeF4N03Kep5x5WmyKTbts8LSCsRlytvZrt0eARrKY4ruH67UbJl1ZF1xCBiCC0BqZB0yo
	iqRK9q2yh9NvKvnkPuL5CtfwvwjerO5IVW/dWg18y/vHbllZgSIzWqVd56Sp4exBjXB+dKZgqav
	+1RrA+04b7fATUXim09/AGtvdbCv5nVikzPXcjiHMhJ7lI+JadAwWj6UtAjMbpLCqgfnNO3mX3S
	Gx1PQZ5G4xhvhbEQodcx6Kt1Er0QoHGBP2LEqTXyZ4Rgzx4ZF6eKwSKUGwBUDASrhs06s4QJQDV
	cg717LX77KzhIP7Fa0WMOobUvi4dJR/0HDaUw5EWX8dA=
X-Received: by 2002:a17:90b:4a4f:b0:341:761c:3330 with SMTP id 98e67ed59e1d1-34733f11c1emr20609326a91.23.1764244056951;
        Thu, 27 Nov 2025 03:47:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZ7En26V9sshGmDQVwH6b1r9YcBM83RyEfzK3Y0oLSrIV6i7j1PRsKIwXoQ9UUKQcXYegrjw==
X-Received: by 2002:a17:90b:4a4f:b0:341:761c:3330 with SMTP id 98e67ed59e1d1-34733f11c1emr20609304a91.23.1764244056478;
        Thu, 27 Nov 2025 03:47:36 -0800 (PST)
Received: from [10.204.100.255] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fbb0094dsm1811586a12.10.2025.11.27.03.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:47:36 -0800 (PST)
Message-ID: <0027428e-8e0e-4efb-a953-b83dfb8102af@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 17:17:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: venus: flip the venus/iris switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4NyBTYWx0ZWRfX2n4bxusLMrq/
 45xgbDMZehdh9OEoEUpSSyMPcnRFJPr0KMUykdArIO3p3eF7RNooZ4FDDjItXu86ezBKXfzzpj3
 eVJodHqSbJdl2l/8tZUSPR41qmVIPuIvcZ0j0i9jVw7qG/V9NjYaFqbydhde/KTSD+BCXZQngD0
 6SweYVXDoc+D7hb2rVSjm9mVJAAumn4JwwYzTMML5ccJYUEKrmtHQRzOuOG5VwGpsV6y6De8C67
 UE+OEQ8jTkatrlxjn5iz/2YL+hObkQx4ljy3PtYHcIJbbKH11R7ivZvs793JvFPluGk7A2CUgjq
 QlfDC6Xr3j/K2ZWwIUOf07YTdDBPAfhewA3Cp70AajnQQqJA48031DmiGuiJIwRRdRml6D0GYIw
 ZeDrYinby33/6FJxRSK471Emzpi4mw==
X-Proofpoint-GUID: JHp86w6vhxBQpeW1GtcaJC6q5FzPqOl-
X-Proofpoint-ORIG-GUID: JHp86w6vhxBQpeW1GtcaJC6q5FzPqOl-
X-Authority-Analysis: v=2.4 cv=PJoCOPqC c=1 sm=1 tr=0 ts=69283a5a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rjoTukvE8U3cw58jYosA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270087


On 11/19/2025 8:48 PM, Dmitry Baryshkov wrote:
> With the Iris and Venus driver having more or less feature parity for
> "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> switch. Use Iris by default for SM8250 and SC7280, the platforms which
> are supported by both drivers, and use Venus only if Iris is not
> compiled at all. 

Good to see platforms moving to iris.

> Use IS_ENABLED to strip out the code and data
> structures which are used by the disabled platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note: then intention is to land this in 6.20, which might let us to
> start dropping those platforms from the Venus driver in 6.21+.
> ---
>   drivers/media/platform/qcom/iris/Makefile        |  5 +----
>   drivers/media/platform/qcom/iris/iris_probe.c    |  2 --
>   drivers/media/platform/qcom/venus/Makefile       |  5 ++++-
>   drivers/media/platform/qcom/venus/core.c         |  6 ++++++
>   drivers/media/platform/qcom/venus/core.h         | 11 +++++++++++
>   drivers/media/platform/qcom/venus/helpers.c      |  7 ++++++-
>   drivers/media/platform/qcom/venus/hfi_helper.h   | 11 +++++++++++
>   drivers/media/platform/qcom/venus/hfi_platform.c |  2 ++
>   drivers/media/platform/qcom/venus/hfi_platform.h |  2 ++
>   drivers/media/platform/qcom/venus/pm_helpers.c   |  3 +++
>   drivers/media/platform/qcom/venus/venc.c         |  3 +--
>   11 files changed, 47 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index fad3be044e5fe783db697a592b4f09de4d42d0d2..ce360c67846b1243dd9245972672591076bfdee2 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
>                iris_hfi_gen2_packet.o \
>                iris_hfi_gen2_response.o \
>                iris_hfi_queue.o \
> +             iris_platform_gen1.o \
>                iris_platform_gen2.o \
>                iris_power.o \
>                iris_probe.o \
> @@ -25,8 +26,4 @@ qcom-iris-objs += iris_buffer.o \
>                iris_vpu_buffer.o \
>                iris_vpu_common.o \
>   
> -ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
> -qcom-iris-objs += iris_platform_gen1.o
> -endif
> -
>   obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 9bc9b34c2576581635fa8d87eed1965657eb3eb3..0d5f37e51558ed1207554b3a3841096d8699c755 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -356,7 +356,6 @@ static const struct of_device_id iris_dt_match[] = {
>   		.compatible = "qcom,qcs8300-iris",
>   		.data = &qcs8300_data,
>   	},
> -#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
>   	{
>   		.compatible = "qcom,sc7280-venus",
>   		.data = &sc7280_data,
> @@ -365,7 +364,6 @@ static const struct of_device_id iris_dt_match[] = {
>   		.compatible = "qcom,sm8250-venus",
>   		.data = &sm8250_data,
>   	},
> -#endif
>   	{
>   		.compatible = "qcom,sm8550-iris",
>   		.data = &sm8550_data,
> diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
> index 91ee6be10292e0c275106f090f521f268da4c50a..60a3f948adbfaa4c6c91abdbbbe050f0bd724c9c 100644
> --- a/drivers/media/platform/qcom/venus/Makefile
> +++ b/drivers/media/platform/qcom/venus/Makefile
> @@ -5,7 +5,10 @@ venus-core-objs += core.o helpers.o firmware.o \
>   		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
>   		   hfi_parser.o pm_helpers.o dbgfs.o \
>   		   hfi_platform.o hfi_platform_v4.o \
> -		   hfi_platform_v6.o hfi_plat_bufs_v6.o \
> +
> +ifeq ($(CONFIG_VIDEO_QCOM_IRIS),)
> +venus-core-objs += hfi_platform_v6.o hfi_plat_bufs_v6.o
> +endif
>   
>   venus-dec-objs += vdec.o vdec_ctrls.o
>   venus-enc-objs += venc.o venc_ctrls.o
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 24d2b2fd0340b55ed1aa329f49ded449dc466f14..646dae3407b4d13454eedd8e926f16e7470d5d3d 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -949,6 +949,7 @@ static const struct venus_resources sc7180_res = {
>   	.enc_nodename = "video-encoder",
>   };
>   
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
>   static const struct freq_tbl sm8250_freq_table[] = {
>   	{ 0, 444000000 },
>   	{ 0, 366000000 },
> @@ -1069,6 +1070,7 @@ static const struct venus_resources sc7280_res = {
>   	.dec_nodename = "video-decoder",
>   	.enc_nodename = "video-encoder",
>   };
> +#endif

There are configs check all over the venus driver, like the one above. 
Can we do this with keeping _only_ the compat under config check ? And 
if needed to keep it inline with iris code, we can keep the makefile change.

Regards,
Vikash


