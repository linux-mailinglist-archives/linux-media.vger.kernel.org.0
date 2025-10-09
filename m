Return-Path: <linux-media+bounces-44052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DF5BC7C64
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 09:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF3274EF3B7
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 07:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD7C2C027C;
	Thu,  9 Oct 2025 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHRvISp/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB1334BA49
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759996232; cv=none; b=KwnI6pjRVxwL/8w0cZ5UfUBuhjAotpdcZEjBt0mi24ayutcpU3OK8e0gFMuqgj2KWyEnmcjx/qfLQ5DXwTHck0cEf0d0H4TDj9oUJI+4ebtVmAjjcqEv955NDGp7ppG97ljvShT04AcoauqDvtNK8dOIYV2MHrRikkXxqfuOi0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759996232; c=relaxed/simple;
	bh=B4Vj89Csg/2pPQICPMyNe8JOJW/7eU9JySvWVJZyBT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5Gt86zHy2KVa8/QWloeGjzy6ZrzKFwFT7+ihVoZeV99TPijG/O/y1lSan3fZd4RrH+TFu886n0DcowQgpAzc1K/feDtMWPNoSZrQuOKnphtkb1crz8hsRoYKHzFJ4I5zNf/goAQsVwo4GBosbiGEnT3kVHk+a4Y3buufnU7IQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHRvISp/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EOVS010849
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 07:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoM3fHf9aKLa5x5Ru3bP13mn03nmNd2yNTc3MJOCNo4=; b=HHRvISp/uGXMiW2M
	KG5py2/1LefuUQ7IEVyAizFydZKxaHy5arXkaZWHcMKUgtoBArUxasXcquLNu7pd
	FZQl0TGK6dnWDNXzdRnsY2qZf0N92YVEW1WvY29bCQPzaK66wGIrs3WsaB1AqiUm
	fnKCjMHqMzm3eYyBK2DXxROm93dEUK1wY/cvYv9lDvdE7nHn1gj25zjD4JzvM5Ej
	UXAB/FHxKN7mxxEKmIqVIC7HEZtalBdfV5jWT6/sneve0IKdZ151+6J70Y+ilnNi
	qA1uRuh8fd2dtt2fKFwa3HiunMlbPHMtU42fpPsBCBZoETr4BGB7C3tBvyVyX9Pu
	tIVE6Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv9a9xd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 07:50:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62cdd71290so2258856a12.1
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 00:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759996228; x=1760601028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoM3fHf9aKLa5x5Ru3bP13mn03nmNd2yNTc3MJOCNo4=;
        b=YPqUgPrPFXkLsV98QpnDJSC4mjbXPjzl0IEWSOdO7bcCcG9er5SUF85AXnUlQl+kzv
         xadX91zCvAvxxBBYIFWwb8tfnwAey5q4f6LIBiURYBIy5icPnXLnCEwdvPccjyHqlNxg
         yEValKAzlj1BdRhT8rZkzqFDHLoQJ8iWHs9XTvGQMXg9ASLZawP7ndeAUjCE6XOgWQZR
         atTqICXB2d6DcGTrHGudYwU1MIccFzXWaQOp543YG8QNy7Mcjp1bQTcoLuzAXF2Vq20i
         PNmj6yTbUxVQr/qBgtIculzzULPp0E43nalvlRqCGE7tkm2xfaV5+DKgQ1vRqKzwS8RW
         +3kQ==
X-Gm-Message-State: AOJu0Yw66eSdcD6GHeeDezSVHEoZ9vqcqiXZpT7TgWAenwoFKNQ04SrE
	+1OY1cEmQOCi5Lv7nuI8UUfl484cYDOYruggxr3ARqkJjkS1g6LjNCxdTxw9p3oVm5nTpp3VLQ8
	W64/ls0Vg1H4pYVRJ8YRMY4OlvEz27HE0WRnNisUI1ZufH/0SEZGuuHgHQX0K5qzYoQ==
X-Gm-Gg: ASbGnct7+3G+4338MSUzAYrSY+3idW6xOVyWxw2okWqbqL7wU/549DOR0BaWL2lp4XZ
	VKu12/Ek37KlGeLChjOZj6iVJczoYjE6pDVpOLgHrTdHkYPQ9w1OS5unwozUQP/4dKKzF7RFsNy
	987p/97bKsCf/rrud9bUGm+Y4NpIwfRraxuRF77m7WoAygVdY6x7gMumExT4nAtsdZAdle8Z3Sa
	SpFSczF5VFyLVYhoH8JGoqzMtqeJ6O8eXrCKFcry9O5de64dGcaO3mXLbBNBO41x/+ALMw3JIRL
	pa+Z5c2ZHOTSpgNNjeJy+lnY6VW89qNBCDiZfBw9GZxB9/fgwe63BBy19KeDN3txGR/7st4KpSF
	XPA==
X-Received: by 2002:a17:902:ce0a:b0:26b:3cb5:a906 with SMTP id d9443c01a7336-28ec9c97565mr122962075ad.16.1759996227721;
        Thu, 09 Oct 2025 00:50:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRCIIEFNL9PxfVqSmk3+kqmgoJIsJR45HHjyjsfNgmlte+wJI3PPCLMHzRAxBj2NQ2sHRABQ==
X-Received: by 2002:a17:902:ce0a:b0:26b:3cb5:a906 with SMTP id d9443c01a7336-28ec9c97565mr122961665ad.16.1759996227124;
        Thu, 09 Oct 2025 00:50:27 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de56desm20060245ad.19.2025.10.09.00.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 00:50:26 -0700 (PDT)
Message-ID: <c11dec36-a477-26f2-4081-fb0dc8188cec@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 13:20:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] media: iris: rename sm8250 platform file to gen1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-6-def050ba5e1f@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-6-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfXwCAlHdt0wo5R
 Nttu3ic28rwUlU0KbyUxDZmE39wZHFkl2smQ1PgGDUBUbG8kYmiHAClJyLoF+gKVDmBkmf+gQJ+
 qCZsUGm3x1XGzLSmip76apVMwIs2q7xE8dtXTxNQ0cDbSILHR3SvXwIrPg+MiWawsJmV14beVc8
 muHaRzhgG9ssoT7EQanavBovrhgfcaYDzicGUrSEdRO/uHRPIP8oPgc8U5yGcue0tKo9o5kXw/5
 2QWM5WmlDT+hLtBOse4XriL8Im/e6EvbYQB6qZLVzcqldeDFP20WHCbUFm5c28+SE+neR/U0uwE
 +kYJK+SKUcBB3j7tdxruhxii9SXHeclzmBD8htnlEwf3R6IfCTkBywnObiwyrP5HkXL5xq7Ysk/
 2tZt+JEPJ9y0JhlP6jtx2rRN3SpuWQ==
X-Proofpoint-GUID: zg-60kTsbzI4HI7AUslrwHFKYEcBJeFY
X-Proofpoint-ORIG-GUID: zg-60kTsbzI4HI7AUslrwHFKYEcBJeFY
X-Authority-Analysis: v=2.4 cv=JPk2csKb c=1 sm=1 tr=0 ts=68e76944 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=6XGvkFmkmJ0ZWo89MKgA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080122



On 10/8/2025 10:03 AM, Dmitry Baryshkov wrote:
> In preparation to adding more Gen1 platforms, which will share a
> significant amount of data, rename the SM8250 platform file to
> iris_platform_gen1.c.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile                               | 2 +-
>  .../platform/qcom/iris/{iris_platform_sm8250.c => iris_platform_gen1.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 13270cd6d899852dded675b33d37f5919b81ccba..fad3be044e5fe783db697a592b4f09de4d42d0d2 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -26,7 +26,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_vpu_common.o \
>  
>  ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
> -qcom-iris-objs += iris_platform_sm8250.o
> +qcom-iris-objs += iris_platform_gen1.o
>  endif
>  
>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> similarity index 100%
> rename from drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> rename to drivers/media/platform/qcom/iris/iris_platform_gen1.c
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

