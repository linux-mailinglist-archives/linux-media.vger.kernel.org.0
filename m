Return-Path: <linux-media+bounces-55601-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aABeBxPHs2kqawAAu9opvQ
	(envelope-from <linux-media+bounces-55601-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:13:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D15127F623
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A243305E5FE
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE389371869;
	Fri, 13 Mar 2026 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1TePaAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjcD+hDL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C2037105A
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389273; cv=none; b=vBweCrlXsPATjiYBIvrvCr6WeOzDfoYROyZ8gtbFG8dxCQ0GdJoZ3uugNzSrawcMH9uhrHe5B9DXS2kN14k2rk7zz3Ys4+R/InThg5B1imPOJqxRnVAawtplF+2vB9ziPtWDoqKty7sR7a0O5SYEclR6MLhywtV3hP9JaVCre2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389273; c=relaxed/simple;
	bh=h7vt4HEFPtt4HYLnHafB3or9kK6ibN8Nk5f/7Gx7n08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E3RdYGzcXAYOp9C1jLN6wJlfUMS08gQczc85DG6uA5kcwkR9+VPpJYiI0NHb0YoOVm69tFObP1rLgVyDrSBnAOYerL7hSa0jK+9w5KCGIaZx6xnx1/LBlemaY8zufi1utmzkwbGA/Wm6AJyP2TEqq25piog9FQLQkfosiSYj7jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1TePaAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjcD+hDL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iLYd2262549
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q0guHfdJBbVHxMiLUAf9b+0obNsiKCJZnUdbSGWJXXU=; b=l1TePaAHk3/+0pCg
	qtGbRChXRdpIVdmiRfKo0R749hWcMCVt2f9w67SjPOiXfvAVszRTG/HKd6rcA3Rx
	2+/eKAt/nNx/+DHvgJF04zmLYwbeRplInHKRrMrrORhktQGx2Zy+WtNjujPu+vue
	gKF8CXgIdOaZU+XJ3ENepyxRoDWcGSkuoG4uDoN0PDigBW372z8UUojTD5FbZ4tP
	0GzvcokI78oZEBu7TcViKc46Q2oDxFm/LZU4L9QzLOr95DPi4XOZfC6qXBE0qA/y
	KaGVrGdwUW/2CEQ3Uu0q5Paln+7KykLPPqYrflPPF429IiR1XbJ2aaoxTqGJo0As
	AEcElw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4r3df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:07:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35449510446so1545115a91.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773389268; x=1773994068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q0guHfdJBbVHxMiLUAf9b+0obNsiKCJZnUdbSGWJXXU=;
        b=PjcD+hDLQ/xL/eExwNc301yJlwJsQF5Cv5hBa5ZnF/rzXSGim5fQ1Iq71kkswCYnZ6
         IUOU2RiqPuXQcOyJOl/z24R1glatpk0w4gdlqF8wF4xhI0e6voAMK7YBx7ZnLDbNlFUD
         px7GbhAPnbnAuUaJj4ZW14qOXJ2m72WvRmHC1tFE3p27AQCVeuMkW/kMSXbfgyT4VzXa
         VML0kRVaSriKoIFFhBrYHloGzadAoR4zuOpdnSGOsWnloH2mG6mwJMMi7MsPPhORYNZN
         e+7oxFAGKk9O+nkkVsHH1nMX90pWjHTOvFZBSOnx21G7Dnt2g5n37mWOi7WqkICkm4xs
         NBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773389268; x=1773994068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0guHfdJBbVHxMiLUAf9b+0obNsiKCJZnUdbSGWJXXU=;
        b=MhLwQ0uXLzJtS+UJyVQXiGs7eZak03Y9eO+bleV7rJQoJOwhUamgJ8YOBF7R4je3PJ
         jqZSS6fDKtKS9fKXdEsHST6ZlLeflI5eJfyDeBjQfP4I1x1hOcQ3T0suWxLnas6mCp4N
         qNOxMRVO9uETkbZjrKLGVW1xUEaqV0alF26OcOG8cHV+pvLOLdvscuYuqyXayO5cC1sQ
         a+qVWNmwURXlIphi91qBEaqPW0FMh/r5gPPk0ifVCHuwkRxEEEzGjJHLM0+BDkv2235W
         UogBhvo+/yxnJEeXNzCWJonyErU4bS2TaxHNYLVKbt671aYZOA/Bx+kSEbG2YbOyalsX
         sUBg==
X-Gm-Message-State: AOJu0YzXBRd3tPEa1C+FMGKEcd2fhdX0+HtrUnOPFmR1wgIEGbE+XVmB
	2ITwa7YFurKH6T62VubgdmRfKjxl6me+vnnk6UzTNZpRyug6N3H0nNs5S1iDE4Y6O/Rb/+ZG4RH
	BfZCOE5ni0b4kB3aI0C8L/uZWAFe6VRnl7bh+WTo6r5jtYf03S08hxg4um/Uv8ckqUQ==
X-Gm-Gg: ATEYQzwGCT3zj7r1qknQzn/8IOH+0TNJUIAUaIwSuPg5ebXTUO+RlFznakAPy/LJygb
	hoFxFyhnyUcvRDnkVv4XvaNzN48sWV+D8odQ1+9rs/CWy5tXcaZa41DtEEiqXnL6ij8JzOiEU1f
	QlQl+MksR2JgrfgedcHxJhG8m8Ap2CeYDExqmHJWhvZy4JB6pssZRVUMV0iaMVcqgom771HAD7h
	kXKLwLDBKdE88zXoOw2QASKU7C3llDS5ICUFQ7WHvKjU4QHCgMYiRQMf7WDudelVFkFZh2ftgq+
	/Oeq022MFXEnkbnw16lPvPJ1QPzB+B0w7AHwnW6tSIAhEVnCZQBl9mi+6BDqImBtmfuvz+d8krI
	uLmc3XmFQZHuenbOyQpMGyi0UKr0KQTIKpD+4dsdycPijLO3v7IS2
X-Received: by 2002:a17:90b:2e45:b0:359:f0e1:f8b7 with SMTP id 98e67ed59e1d1-35a21ed3887mr2150312a91.10.1773389267702;
        Fri, 13 Mar 2026 01:07:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2e45:b0:359:f0e1:f8b7 with SMTP id 98e67ed59e1d1-35a21ed3887mr2150280a91.10.1773389267194;
        Fri, 13 Mar 2026 01:07:47 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e660dcsm7801204a91.5.2026.03.13.01.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:07:46 -0700 (PDT)
Message-ID: <2f233008-cdf6-5999-d703-73f58cc0f5ed@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:37:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 8/8] media: qcom: iris: split platform data from
 firmware data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-8-14927df4906d@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-8-14927df4906d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QqueIASOuynSQaNyTjmjuJ9BSEzQJjm4
X-Proofpoint-GUID: QqueIASOuynSQaNyTjmjuJ9BSEzQJjm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MyBTYWx0ZWRfX1z6GKSiTdSfA
 EB05h+O5AxcYBy/SmaiDUNo3btlzh3h30B57paFIMTlzNSslPuLu2KbpF/d1rY9mFj0ME1MZRs3
 ehQzqSugb07hP6tT7v/kXh5tIkVw/sc6F7CqY3gkqkdzXm3JtaPhNp7F6lQM87hrZTaXAM6LS4k
 suFNKxMA69UQFUY1QUUKETWEMGEZKsE2p1bE54yoO+DZt7jlnkRFhpMvTrnh74GhpDMNDh+LIJi
 d9Y5l+OG2mAJfoI0f/BqzQgAtSekj1Vt1LAZi3AuJbNPuLHnmOtJboLTXoEMtwJhQQbXAax1rY7
 XAupN/CpPS5wNVyWikZXypVneKeu3iugYwwjPhwTzSdR0TEmEFJrgkbmufW99w7FD24fmmvHqot
 hvB52Qt17danuh2AV1T89ASENivWJk6bv008JZqQLxt5TWzQobgiz2s+0jtSxhzJM/N6xlLJoFF
 XaKkXxCli4Ti8huzfuw==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b3c5d4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ndT/fs+coltRyMHftQWjTw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ijYXavbH0mQpeC2t6NUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130063
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,60fps:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55601-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D15127F623
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
> Finalize the logical separation of the software and hardware interface
> descriptions by moving hardware properties to the files specific to the
> particular VPU version.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   6 +-
>  .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 133 -------------
>  .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 218 ---------------------
>  .../platform/qcom/iris/iris_platform_common.h      |   4 +
>  .../platform/qcom/iris/iris_platform_sm8250.h      |  29 +++
>  .../platform/qcom/iris/iris_platform_sm8550.h      |  31 +++
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 124 ++++++++++++
>  .../media/platform/qcom/iris/iris_platform_vpu3.c  | 210 ++++++++++++++++++++
>  8 files changed, 402 insertions(+), 353 deletions(-)
> 

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> new file mode 100644
> index 000000000000..74c8f38e849b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_ctrls.h"
> +#include "iris_platform_common.h"
> +#include "iris_resources.h"
> +#include "iris_hfi_gen1.h"
> +#include "iris_hfi_gen1_defines.h"
> +#include "iris_vpu_buffer.h"
> +#include "iris_vpu_common.h"
> +#include "iris_instance.h"
> +
> +#include "iris_platform_sc7280.h"
> +#include "iris_platform_sm8250.h"
> +
> +static struct iris_fmt platform_fmts_sm8250_dec[] = {

How about naming this as platform_fmts_vpu2_dec ?

> +	[IRIS_FMT_H264] = {
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_HEVC] = {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_VP9] = {
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +};
> +
> +static struct platform_inst_caps platform_inst_cap_sm8250 = {

platform_inst_cap_vpu2 ?

> +	.min_frame_width = 128,
> +	.max_frame_width = 8192,
> +	.min_frame_height = 128,
> +	.max_frame_height = 8192,
> +	.max_mbpf = 138240,
> +	.mb_cycles_vsp = 25,
> +	.mb_cycles_vpp = 200,
> +	.max_frame_rate = MAXIMUM_FPS,
> +	.max_operating_rate = MAXIMUM_FPS,
> +};
> +
> +static const struct icc_info sm8250_icc_table[] = {

icc_table_vpu2 ?

> +	{ "cpu-cfg",    1000, 1000     },
> +	{ "video-mem",  1000, 15000000 },
> +};
> +
> +static const char * const sm8250_clk_reset_table[] = { "bus", "core" };

clk_reset_table_vpu2 ? and so on.

> +
> +static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> +
> +static const struct tz_cp_config tz_cp_config_sm8250[] = {
> +	{
> +		.cp_start = 0,
> +		.cp_size = 0x25800000,
> +		.cp_nonpixel_start = 0x01000000,
> +		.cp_nonpixel_size = 0x24800000,
> +	},
> +};
> +
> +const struct iris_platform_data sc7280_data = {
> +	.firmware_data = &iris_hfi_gen1_data,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.icc_tbl = sm8250_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> +	.bw_tbl_dec = sc7280_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
> +	.pmdomain_tbl = sm8250_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> +	.opp_pd_tbl = sc7280_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
> +	.clk_tbl = sc7280_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
> +	.opp_clk_tbl = sc7280_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_p1.mbn",
> +	.inst_iris_fmts = platform_fmts_sm8250_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> +	.inst_caps = &platform_inst_cap_sm8250,
> +	.tz_cp_config_data = tz_cp_config_sm8250,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 1,
> +	.no_aon = true,
> +	.max_session_count = 16,
> +	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
> +	/* max spec for SC7280 is 4096x2176@60fps */
> +	.max_core_mbps = 4096 * 2176 / 256 * 60,
> +};
> +
> +const struct iris_platform_data sm8250_data = {
> +	.firmware_data = &iris_hfi_gen1_data,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.icc_tbl = sm8250_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> +	.clk_rst_tbl = sm8250_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8250_clk_reset_table),
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
> +	.fwname = "qcom/vpu-1.0/venus.mbn",
> +	.inst_iris_fmts = platform_fmts_sm8250_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> +	.inst_caps = &platform_inst_cap_sm8250,
> +	.tz_cp_config_data = tz_cp_config_sm8250,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3.c
> new file mode 100644
> index 000000000000..2c0e5be72920
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3.c

iris_platform_vpu3x.c ?

> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Linaro Ltd
> + */
> +
> +#include "iris_core.h"
> +#include "iris_ctrls.h"
> +#include "iris_hfi_gen2.h"
> +#include "iris_hfi_gen2_defines.h"
> +#include "iris_platform_common.h"
> +#include "iris_vpu_buffer.h"
> +#include "iris_vpu_common.h"
> +
> +#include "iris_platform_qcs8300.h"
> +#include "iris_platform_sm8550.h"
> +#include "iris_platform_sm8650.h"
> +#include "iris_platform_sm8750.h"
> +
> +#define VIDEO_ARCH_LX 1
> +
> +static struct iris_fmt platform_fmts_sm8550_dec[] = {

platform_fmts_vpu3x_dec ?

> +	[IRIS_FMT_H264] = {
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_HEVC] = {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_VP9] = {
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_AV1] = {
> +		.pixfmt = V4L2_PIX_FMT_AV1,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +};
> +
> +static const struct icc_info sm8550_icc_table[] = {

icc_table_vpu3x ? and so on.

Thanks,
Dikshita

> +	{ "cpu-cfg",    1000, 1000     },
> +	{ "video-mem",  1000, 15000000 },
> +};
> +
> +static const struct bw_info sm8550_bw_table_dec[] = {
> +	{ ((4096 * 2160) / 256) * 60, 1608000 },
> +	{ ((4096 * 2160) / 256) * 30,  826000 },
> +	{ ((1920 * 1080) / 256) * 60,  567000 },
> +	{ ((1920 * 1080) / 256) * 30,  294000 },
> +};
> +
> +static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
> +
> +static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
> +
> +static const char * const sm8550_opp_clk_table[] = {
> +	"vcodec0_core",
> +	NULL,
> +};
> +
> +static const struct tz_cp_config tz_cp_config_sm8550[] = {
> +	{
> +		.cp_start = 0,
> +		.cp_size = 0x25800000,
> +		.cp_nonpixel_start = 0x01000000,
> +		.cp_nonpixel_size = 0x24800000,
> +	},
> +};


