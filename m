Return-Path: <linux-media+bounces-56213-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPP0KeOvumnkagIAu9opvQ
	(envelope-from <linux-media+bounces-56213-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 15:00:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA42BC830
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 15:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABD53304E9F6
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5863DC4DF;
	Wed, 18 Mar 2026 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guGJS6aZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DgR1VYqy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44193D9DA1
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 13:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841938; cv=none; b=X14u//wtltBjwjcDytNByJ6RqewNvaEbexhLMkc5pAFNYfXxnw2gYrYxBIejuAHbM4+j7uPAQDWCbqHUONaDntWZM9NugdTRhX/brxY5lqBj21UrzOr+godUF4S2FLYU/Ct5+ryv051cSO1JPpgDIe2XtVjTLU54vtQBh6vSKOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841938; c=relaxed/simple;
	bh=1RlgzLp5SW+ICl5p5DrXEGY9p6ID8I2Pzbdjvkx+HmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m85jiLklgBY7WldFQESnmVm9/H5ffehwl/4Z26MfImuikvd9lZXGePZDkfj/wFWEy050vShFdaJYwPL8DLMvtMZ8+nBIW8Qo5EJwNESAv4zOqNAXs1fNiOqF7FwcdmDe7AgU/rTJKwB0AMvn+SCOqpkmKTkdMe+mz4VZwzLo4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guGJS6aZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DgR1VYqy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I976Pb1145979
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 13:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K09W5cRQKh+ST8g4DXzvv+55soghUxhrAcpYvLnmrXE=; b=guGJS6aZ5p04seBz
	d5P9S/xPoyDDxvHqnT4YLJAd2AXufUF/3hCGXsbEKy7+wpzXoK/62A8RRGSjum4u
	U63Si5gFZcP/wrdrpi9s4olUOOrJQqZvEjB3nXKgFkKCs0qQd2xoqhzzEs75OwfZ
	c+se2DMpaHq27I9wBCeRtr4daM44NWZqBiSeF0OqMjUxHM9Zxm2poDyfQcKeWFrS
	GBfpyI9ICRAi0q/QDViO+ADP7T2y/FNmXwy3axc4iiBMcezMzxnTT3swjnVfnDu5
	ACcdoqHvknJFjIBnMiyR2Lu2C0ywgHXirbu7BPui//9YyDt24dHj1/I0MJarvITQ
	9Eaj6w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3vfjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 13:52:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso5292535a12.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841936; x=1774446736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K09W5cRQKh+ST8g4DXzvv+55soghUxhrAcpYvLnmrXE=;
        b=DgR1VYqyCFywVwxs6jNeVoGgC39P80ckCf5CvKg7b0yed3RaThW1PKb3M9E4VJ+9XC
         mwzaJekWPI0p+ItLdhHqn6CYkkfTPbgkR+N1gwNMvmFHiTHbtg3I/ZARNoAYPZbGELhQ
         i4ihaRR97mEaFjpqTK+9g1usjDewZHEUUB3KzdO3rYqN5oJ6GCdlTxZ51uFtuFs0nzbs
         VL+/uzGnqBR7vM/FR+c1AUhGmIZDzD+Nim2ERKRdMPAEcL+Xqd0tqfPUOTjtrKn8cGt3
         3wKCKwnP3KJKLn0DlhAkFSsK0FtDlYVUhmAw6vnRGLEmuGu6n9ptAocff//YqVEGa0My
         yv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841936; x=1774446736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K09W5cRQKh+ST8g4DXzvv+55soghUxhrAcpYvLnmrXE=;
        b=FkPWcmd0VuBYWj3CwKLh+Y75KY1TqsMwK2ybRgwzDfq8TjyxhGy+YlrJSWKjZxaSmH
         Y5ZLWaF5NK7+qOSdHRq/9wWy+2BYivNyN/F5YzC8jRAZrJiBsfJ98DefBv/fUr1UYtgT
         1fyrn8skWF8W1Xtf0VHXRPXG4lZQZB4+lxwxzjV/Nent+bE8pjktxx/nVZ9OVM1dOoG6
         HgoiboNcLk7fY2p+30c9wMZpzDDHAaJisueVcYj0mm3k9ELX1xpLSQPD3DqZpRT2qrv0
         +9LDlotQV1FLEezRokVPv19zgBM8E1F7p9nC3AL+yUo8Z90bg+PI6Z7RJDdXoRFRAmOv
         4EYw==
X-Gm-Message-State: AOJu0YwdV0hPCKhSJeP0Oi0fZdZbQTUo/Rn0jb/uQ7IV3nsbjryQpJoz
	8zmiX+q4BAwf+kWrNpvOnF75TaRX2/qDLSW7GiDWxW+ZiRDqaVP2blsNcuLoILOcRuug+L3NgRS
	G6I6vt/bW5g0y2Aj/2OQVEDblhAT1H8kvDH1+ppvaO2MTZnaMwU3t15fwXMX0p5B2lw==
X-Gm-Gg: ATEYQzwvKUsq42LGmWd7RSOx4nTTXxHrW+HdFjTKVn0BGxrJX4w1AgQiDKdWTJSKJRx
	P/u9i49gPrxHFUJKrf5KGUj1/a9vafpDQW/0gNXHb3f5/tAc8NoQKGT6HfwjdI/fcQIJysnvfdh
	J/mqqTvY5iQwOHNm1tYfGFloPk1Au/4CT2w/qzUyB+Y5GkNgU2GjzkBuephANjse3ey0u3OrSuZ
	PNjY71yBwiI5wSmldCBb7mqMbC4vmyPq4uIqYWO+X6UgS8htcx84HWBv29oiiuF8nHhFTyJCjID
	4LcQSxkJwRRfV9av2jufk0nbsWBAHVjmXTwD4FyI4T3G4xuaOtvEto1vTP+3MvdS0oLXTykHOoP
	/Kx3D5+yPLKuglYwBoSlvR4ZadtvzncECT3UVrt6xuNe1sFoVHOsijw==
X-Received: by 2002:a05:6a00:91de:b0:82a:6dc5:4e0c with SMTP id d2e1a72fcca58-82a6dc55684mr2255284b3a.27.1773841936164;
        Wed, 18 Mar 2026 06:52:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:91de:b0:82a:6dc5:4e0c with SMTP id d2e1a72fcca58-82a6dc55684mr2255260b3a.27.1773841935652;
        Wed, 18 Mar 2026 06:52:15 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b52e671sm3458388b3a.3.2026.03.18.06.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:52:15 -0700 (PDT)
Message-ID: <f2c0b3b0-5a27-424a-8280-576e1521b196@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 19:22:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/8] media: qcom: iris: split platform data from
 firmware data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-8-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-8-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69baae10 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=z6a4xJ1L6jmUStEIqdYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: eUPtQ64x3PrqNzV0zHwYiEnse72DQGCH
X-Proofpoint-ORIG-GUID: eUPtQ64x3PrqNzV0zHwYiEnse72DQGCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExOCBTYWx0ZWRfX266ksDGRQQIC
 1GTg0vO+QRdUv9oHn9GP2RdGwVSXew9My8N+lWDMPcv/mNLKkOx+r8CU7/dvNrYP1ZsVn79kz6t
 j49BiwmwDmIqzno3+C8+dBlHWwlaWP9EH/aFf/ufH+NlBe0NI76vKycHaAwt0tRnI77d39Lt+dv
 MDhimorsF+4GK0RArtwPDFMbXAYUjEX1FwwVn880amr481R25RdbLZlzuTxJmwqk48sBQk4vSJB
 PGR08qE5cYiL9ZCuoDcQaRP8PM9I4fH5SA9lARReka5kzOPdEG7PQmLz4enGQXZl7Fd6TEkHpnf
 8IXPvCtfFrw90YyrUO86mdWzTN4W87ZxCh7hlpAiwggTkCgKIBMYfbtcuSKZdmkv3YkPaG2cevp
 9Kg7oasNlHXyD1yY0rx3ZqC4eurqhL33gSIe7x3dZv4dICjh6ix9H4+KJVjMRaIJ79VoqJXnPRc
 Pd/Hpj65qqylZdBDW+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180118
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56213-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5AEA42BC830
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> Finalize the logical separation of the software and hardware interface
> descriptions by moving hardware properties to the files specific to the
> particular VPU version.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |   6 +-
>   .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 136 -------------
>   .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 223 ---------------------
>   .../platform/qcom/iris/iris_platform_common.h      |   3 +
>   .../platform/qcom/iris/iris_platform_sm8250.h      |  29 +++
>   .../platform/qcom/iris/iris_platform_sm8550.h      |  31 +++
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  | 126 ++++++++++++
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c | 214 ++++++++++++++++++++
>   8 files changed, 407 insertions(+), 361 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 2fde45f81727..48e415cbc439 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -4,14 +4,16 @@ qcom-iris-objs += iris_buffer.o \
>                iris_ctrls.o \
>                iris_firmware.o \
>                iris_hfi_common.o \
> +             iris_hfi_gen1.o \
>                iris_hfi_gen1_command.o \
>                iris_hfi_gen1_response.o \
> +             iris_hfi_gen2.o \
>                iris_hfi_gen2_command.o \
>                iris_hfi_gen2_packet.o \
>                iris_hfi_gen2_response.o \
>                iris_hfi_queue.o \
> -             iris_platform_gen1.o \
> -             iris_platform_gen2.o \
> +             iris_platform_vpu2.o \
> +             iris_platform_vpu3x.o \
>                iris_power.o \
>                iris_probe.o \
>                iris_resources.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> similarity index 67%
> rename from drivers/media/platform/qcom/iris/iris_platform_gen1.c
> rename to drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index b2d18459a811..60f51a1ba941 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -3,38 +3,16 @@
>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
> -#include "iris_core.h"
>   #include "iris_ctrls.h"
>   #include "iris_platform_common.h"
> -#include "iris_resources.h"
>   #include "iris_hfi_gen1.h"
>   #include "iris_hfi_gen1_defines.h"
>   #include "iris_vpu_buffer.h"
> -#include "iris_vpu_common.h"
> -#include "iris_instance.h"
> -
> -#include "iris_platform_sc7280.h"
>   
>   #define BITRATE_MIN		32000
>   #define BITRATE_MAX		160000000
> -#define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
>   #define BITRATE_STEP		100
>   
> -static struct iris_fmt platform_fmts_sm8250_dec[] = {
> -	[IRIS_FMT_H264] = {
> -		.pixfmt = V4L2_PIX_FMT_H264,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_HEVC] = {
> -		.pixfmt = V4L2_PIX_FMT_HEVC,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_VP9] = {
> -		.pixfmt = V4L2_PIX_FMT_VP9,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -};
> -
>   static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>   	{
>   		.cap_id = PIPE,
> @@ -248,56 +226,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>   	},
>   };
>   

<snip>

> +
> +const struct iris_platform_data sc7280_data = {
> +	.firmware_data = &iris_hfi_gen1_data,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.icc_tbl = iris_icc_info_vpu2,
> +	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> +	.bw_tbl_dec = sc7280_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
> +	.pmdomain_tbl = iris_pmdomain_table_vpu2,
> +	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
> +	.opp_pd_tbl = sc7280_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
> +	.clk_tbl = sc7280_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
> +	.opp_clk_tbl = sc7280_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_p1.mbn",
> +	.inst_iris_fmts = iris_fmts_vpu2_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
> +	.inst_caps = &platform_inst_cap_vpu2,
> +	.tz_cp_config_data = tz_cp_config_vpu2,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,

Drop this from platform data as well, its not platform specific and do 
not see it changing in future too.

Regards,
Vikash

