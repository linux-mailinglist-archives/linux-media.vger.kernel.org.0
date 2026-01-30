Return-Path: <linux-media+bounces-51845-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHvgKyevfGmPOQIAu9opvQ
	(envelope-from <linux-media+bounces-51845-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:16:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CB3BAE6F
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56843300B44E
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6F329B8E8;
	Fri, 30 Jan 2026 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6gcwo6k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrw0rVS7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBBA42A80
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769778974; cv=none; b=apA6qec8btJ/zgbElAfZCXn9j/Tp6+MnQUe8xTOLybaD1S6dJkqOTVp6zGcTIYXW18Rb15gYX3bfJ+1Fqje7Wigp0DPapa13cq+EyPfKVK2iEOhX3hm+Q6Jy7Cp/UUtL1AidBH7wnEGChTLub/dvXzyuezrMw4Ab455hy+EnYf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769778974; c=relaxed/simple;
	bh=vhwY5XruRuEDyW/2TsSKdeRmpkI+kWwgAODxEujg3Dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0+vBl539GkSOTY++1CPoIL2Q2HVXlBKr9Grr+Yi0ow8BShIvU2D3Hz9oQeAHJNZ/5t9Gldla/HmAKdrnNHqNj5XgauzrvrBOQhR3gFR6Vsho4Dh/3QlN8iS0ZMUsHPzNKzppkYBxfyo6iVz3CbiNGXNfjEtMAqU2jccWhBup/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6gcwo6k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrw0rVS7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U9VFHu2675693
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VXF453gbssyoEkQiSKvuRsYKrHyVX27FC/n38uidpM=; b=V6gcwo6kJBOEJ8U7
	nQHkz9RymZOwJ5LjLkB4qcncpISQVusocHHe9X9mZZHynxR+BZEKup8nISfRTBag
	OaCxIscq/zSm5YBmWeHmT+MUVlcR8XaT0n8DGbJXJqJLq9L22cDMThvpbeUpsXak
	Ay1kASdhPhg7lr5qHR4s7o2aCmD/B9R069KhwX6Ie/epqC2dtnJnwNaABkzz9TdZ
	wY5nnMqCSVdLqu9XOVbG7wwh1orBOtMbJPS9wnfo4K4K88dvcUVLYPX/Qb+2AfyW
	BhwQmcuLi9ScJyAXoi4xIkJQDxaobppihBzQUeqL4AEqTO6XM7vBcTSBp+6zOuL8
	+dEbEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0t340m1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:16:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a377e15716so51838945ad.3
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 05:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769778972; x=1770383772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8VXF453gbssyoEkQiSKvuRsYKrHyVX27FC/n38uidpM=;
        b=hrw0rVS7tQijZPtrDQj2GOJCIYinfUCeQQVTssnvTySSni8eIO92VvZsP1vR9MVjX9
         jJGZR4ZVeJKsblqOJKYHA+/yKAwYzF06jd5PezydGegZ+/AdORBHH7j/GY7OvzZpiJNX
         iMgRrCx6BgcSZCaq5tTsJ3Yka80AgF0PNXSJgjjTaPZ/roZayf3fIrte2F58hvkE0sBf
         C+DWaIhcrv49LItpvxJb9h7mGoTgezoN0rB4fnrICpIlR5M5GFX6SR7wpVwCWJgGAiID
         Me9dhNxxmW59EkUhIC2aUBUbrQfwDTRBgvGnYvG7yJsqOGwG2H7kao8ooQRWSphTpcMW
         R3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769778972; x=1770383772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VXF453gbssyoEkQiSKvuRsYKrHyVX27FC/n38uidpM=;
        b=xN+5E3kBM6O6Pbz5shTbON2oelCXvmfPnhXyHlfLRbyHG+ybZ4QTS9+j0ihlOpMIIE
         WmM8j2sa0u91KTi30b5+lrx/VqfWRsMpM38y9NJUDuRwikL4Oti30x8U19GmrTqVDvJ+
         Eu7+E/Q6/UWJRmv6x0ynrO1DugCr9gHJI8co18rqywKRLbcPmD0nb4+zG5rxiBKVu4dX
         RRS0Hk23Q9mEoLDo/YBZ2Oyf1T4RU8GQh0l5VSgxHqg1B8FNKZjSMdqhOff0/P25fX0M
         16m5+tSF4iGs9qiwYz0GVmi/mnNIfy/HsivnG6d2GQZWYCWl+gHGDFq4U9xWifl9cNpt
         Z57w==
X-Gm-Message-State: AOJu0YyjPXd8DYk4Jqr3NrYCZRY9kSD3rr45i78ITP97D/TDWXhPDM6h
	+REvucw9LBicvObOGPCfNWS6huijJTUYUFlawvRxYqGfMH/0HzcXWLXEFq353b0be9g567y/zkJ
	BVovo+DPTf1NGizsWEXEryjj0w/xhcVWS+VmyEDNtXz3sPaGpxE9gfhUqNTQuZ/Z9ig==
X-Gm-Gg: AZuq6aIBAWJbUXTLFHYMDlrt/l/ELhADErX0f/407IiA0Yi2rpWRpcvFwqozzNaRHZJ
	XxlOkR/6HFNgCFnu/pQYVEmZWqotGpKJQ9eE2YlAMSWlOzVpZ9PNUeyPCVXzd1MxjFJyEu+FB5M
	EJyq1Kqn+VhPUBKNTlpEjpmAytP/yZzyvMWvLT0IcbO2QbVKT6fbRBWj2jjbjooPqMPMuBgOpzM
	S9fbWxGZoykCF5dDY7vrdML4W1DSy2z65rMqUwq6t5O+o6ZFl2kdqvVpoYBZ+Zf995lBHaZokBA
	O1kWycTo2PiuMggPtKet8pjGrA/1TabrKaVCLtiS5Fo2xkD02QZsBck3fT3g/bb1doeeaWH8T0W
	O39wwwPltn67Gtx2qtoLzelF9zk/cqrGPyyQE838=
X-Received: by 2002:a17:903:3204:b0:2a0:d6d5:b342 with SMTP id d9443c01a7336-2a8d9912e35mr29345735ad.37.1769778971537;
        Fri, 30 Jan 2026 05:16:11 -0800 (PST)
X-Received: by 2002:a17:903:3204:b0:2a0:d6d5:b342 with SMTP id d9443c01a7336-2a8d9912e35mr29345475ad.37.1769778970947;
        Fri, 30 Jan 2026 05:16:10 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm78288295ad.32.2026.01.30.05.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:16:10 -0800 (PST)
Message-ID: <8c5cd9ff-e549-00ab-60c6-814b52f50949@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 18:46:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwOCBTYWx0ZWRfX7GSwyxy+yn2A
 1pLA79iF+eape7iA0iO+PYLuoFuRlrQeNkG0oN8/+yOZQeUfJ8JepCRHcJqQLsAMDz0CL5cRKs7
 7uMg94t8xIj41Pjo9CM+Lqgv/rdDt5v6EWlFfJq7B4HW7EyYKKCY0MjRZ8FR8HpwDcc0uCT+FlT
 iagDV5jLCBwqpGxoyWU/X9alTgJKPsJOwKW5pfzsolGBvin+pw1OWjaOC56AvJ2tLumovHtvdAl
 MZ7cPWLzuZsquEAGL5GCiKnDkTeNuGH3Hdrv7rfxh7dCw3T7OQ4/9IYM8iYcYo+OtpqOcFwxQzO
 pvk7rqCQvIj76zGTTFmJ6C5qyHr1yMZpTuIKe/090Xc8Oia93hei1PIk3PlnJlKlYC8CypmFoZ5
 tePdKuZEHYiliwZu8+bmqHRCpH5Syscfvltd8oKXZqagdGorJnfE62gdE2GGIzkR3LyHkH6sbk4
 mlUE2CdAsxjxiNB5poQ==
X-Proofpoint-ORIG-GUID: lh43k7nk8P1u2Ogw9Oq_MOGPV8R_mILc
X-Authority-Analysis: v=2.4 cv=QfFrf8bv c=1 sm=1 tr=0 ts=697caf1c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QVgFpZlzPVjKh7SGavcA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: lh43k7nk8P1u2Ogw9Oq_MOGPV8R_mILc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51845-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54CB3BAE6F
X-Rspamd-Action: no action



On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
> SM8350 and SC8280XP have an updated version of the Iris2 core also
> present on the SM8250 and SC7280 platforms. Add necessary platform data
> to utilize the core on those two platforms.
> 
> The iris_platform_gen1.c is now compiled unconditionally, even if Venus
> driver is enabled, but SM8250 and SC7280 are still disabled in
> iris_dt_match.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   5 +-
>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 111 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_sm8350.h      |  20 ++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  10 ++
>  5 files changed, 144 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 2abbd3aeb4af..2fde45f81727 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_hfi_gen2_packet.o \
>               iris_hfi_gen2_response.o \
>               iris_hfi_queue.o \
> +             iris_platform_gen1.o \
>               iris_platform_gen2.o \
>               iris_power.o \
>               iris_probe.o \
> @@ -26,8 +27,4 @@ qcom-iris-objs += iris_buffer.o \
>               iris_vpu_buffer.o \
>               iris_vpu_common.o \
>  
> -ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
> -qcom-iris-objs += iris_platform_gen1.o
> -endif
> -
>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o

This change is not needed in this patch, pls remove.

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580e..49dba0f50988 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -43,7 +43,9 @@ enum pipe_type {
>  
>  extern const struct iris_platform_data qcs8300_data;
>  extern const struct iris_platform_data sc7280_data;
> +extern const struct iris_platform_data sc8280xp_data;
>  extern const struct iris_platform_data sm8250_data;
> +extern const struct iris_platform_data sm8350_data;
>  extern const struct iris_platform_data sm8550_data;
>  extern const struct iris_platform_data sm8650_data;
>  extern const struct iris_platform_data sm8750_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index df8e6bf9430e..c99ff4d4644d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -14,6 +14,7 @@
>  #include "iris_instance.h"
>  
>  #include "iris_platform_sc7280.h"
> +#include "iris_platform_sm8350.h"
>  
>  #define BITRATE_MIN		32000
>  #define BITRATE_MAX		160000000
> @@ -392,6 +393,61 @@ const struct iris_platform_data sm8250_data = {
>  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>  };
>  
> +const struct iris_platform_data sm8350_data = {
> +	.get_instance = iris_hfi_gen1_get_instance,
> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.set_preset_registers = iris_set_sm8350_preset_registers,
> +	.icc_tbl = sm8250_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> +	.clk_rst_tbl = sm8350_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
> +	.bw_tbl_dec = sm8250_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> +	.pmdomain_tbl = sm8250_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> +	.opp_pd_tbl = sm8250_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
> +	.clk_tbl = sm8250_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> +	.opp_clk_tbl = sm8250_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_p4.mbn",

This firmware is not compatible with SM8350.
SM8350 firmware is not released to linux-firmware yet.

> +	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8250_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> +	.inst_caps = &platform_inst_cap_sm8250,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
> +	.tz_cp_config_data = tz_cp_config_sm8250,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +	.dec_input_config_params_default =
> +		sm8250_vdec_input_config_param_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> +	.enc_input_config_params = sm8250_venc_input_config_param,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8250_venc_input_config_param),
> +
> +	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> +};
> +
>  const struct iris_platform_data sc7280_data = {
>  	.get_instance = iris_hfi_gen1_get_instance,
>  	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> @@ -446,3 +502,58 @@ const struct iris_platform_data sc7280_data = {
>  	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>  };
> +
> +const struct iris_platform_data sc8280xp_data = {
> +	.get_instance = iris_hfi_gen1_get_instance,
> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.set_preset_registers = iris_set_sm8350_preset_registers,
> +	.icc_tbl = sm8250_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> +	.clk_rst_tbl = sm8350_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
> +	.bw_tbl_dec = sm8250_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> +	.pmdomain_tbl = sm8250_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> +	.opp_pd_tbl = sm8250_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
> +	.clk_tbl = sm8250_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> +	.opp_clk_tbl = sm8250_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_p2.mbn",

this firmware doesn't exist on linux-firmware.

> +	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8250_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> +	.inst_caps = &platform_inst_cap_sm8250,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
> +	.tz_cp_config_data = tz_cp_config_sm8250,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 2,

sc8280xp is IRIS2 4 Pipe.

> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +	.dec_input_config_params_default =
> +		sm8250_vdec_input_config_param_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> +	.enc_input_config_params = sm8250_venc_input_config_param,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8250_venc_input_config_param),
> +
> +	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8350.h b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
> new file mode 100644
> index 000000000000..74cf5ea2359a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __IRIS_PLATFORM_SM8350_H__
> +#define __IRIS_PLATFORM_SM8350_H__
> +
> +static void iris_set_sm8350_preset_registers(struct iris_core *core)
> +{
> +	u32 val;
> +
> +	val = readl(core->reg_base + 0xb0088);
> +	val &= ~0x11;
> +	writel(val, core->reg_base + 0xb0088);
> +}

you can reuse this from SM8250. That would work.

Thanks,
Dikshita

> +
> +static const char * const sm8350_clk_reset_table[] = { "core" };
> +
> +#endif

