Return-Path: <linux-media+bounces-50638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BED3D1CC4F
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2301E3010BEB
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 07:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B147F378D88;
	Wed, 14 Jan 2026 07:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYCGXGCX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZPjFvvpj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A13C3793A6
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768374764; cv=none; b=Zvgk8bpkLZEtVB3vI5C9dd2eN/D7hZWyqEsFp/bWY/PXPZe29C91xCB/eTtC19bWzoRNNgxXy/fDXYCe1XnHdOH1YmA6MUN/NK8/hH3iyE4pQ8Rf5SOjikD3LT9wpE3xg+1ARJ8Q0S72LNte/HJ37aYovLzmMNfa/kx5x8CasJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768374764; c=relaxed/simple;
	bh=aaEOElibCQ3t/A6Z0q9Al1Bga6nizTCAT/PF0vkpmps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DHStpUxPPo9eikVQ/6XX4i6aMrwZNjQ7wesqBsG0y9MDGpLHzkSv+OdFwXpjnnwOk8AlzL9K+UxrPGsG1VdkGJ59DwnyTnyjMwYTOHM1j5SaUC9dos6gQRA7weW7Qdzxd5wY+FCv4+BUpKJRTaPGQ9kOT5GSGzS7F/AZtIS7xlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYCGXGCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZPjFvvpj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E66Bbt2579070
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fq4a38fiWnx2ftPjHIPdlFRol4VhEcllxEgvdPr2E2A=; b=CYCGXGCXwtBGAyv4
	ZbtZWa5OLlMJxC3Wmi9roBToVjfhdOnA6LlX10cPNqohCnu0wJnG+FlnMtAg6ucH
	l2alwITHDMLsxWM2hN0OHk3CM0srY6hvxXau2TJA2lWl3vzvOYzXwj8iMGjPlgHA
	EBABpf/7G7z7HytjIor/TBm18e58ekPD5DpX9cmQ3J6fzGTHnx6zXM8agkhNWP4r
	MKPLWm/sAfs4DV6UTVwz4PSewnfAAgG0Y9rU7tCE0RR6QMTlEIG7TpBl7l7DJzvf
	WIWUHB0pNIe1C7III50BqKA58bYOSvXQCqWLhJG3b870B5a4BXv8u4mlgY80doj4
	0mVb6A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7v9s50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:12:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f8e6a5de4so79993945ad.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 23:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768374757; x=1768979557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fq4a38fiWnx2ftPjHIPdlFRol4VhEcllxEgvdPr2E2A=;
        b=ZPjFvvpjtVJGkRuwtZe1aXqm5BmAR+hD/37186tCZKw5tiJxsWYmKE8zX1TAh/gqZr
         y1hH88l6ahHFXe9/jO/WfRssJVVbbV3pK4+hnrL/3SWR5snAvhTG9K9d4/13rBAdArqO
         +flEUD+cLrUhls7gXx6xNig8q0H5XSMHya+MyiY3tIFAdqelT5UZA+bGBsCWUVA1yjNz
         6HyxTTFUkXP7RRwqAegqD+TCQX0irVXCtcotDUfdnNUUFk6fIXzQilSBMXxcwiZe3pro
         yT1lkIEWPF+E3GzElrsrHp30+BSjBxWO32rpb7cnRTJh5SO+R3n6hl4TOlxOA/dqF5TE
         W9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768374757; x=1768979557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fq4a38fiWnx2ftPjHIPdlFRol4VhEcllxEgvdPr2E2A=;
        b=XZW7a28GJH7aIWhPJY4D/bER28K/UyPtgQo52zsgfEjykU8JDdvLLL04sQrjAAb4+k
         J7RbCvUAIIN5yCrZGpxPKe9PIxlgVsv4f693tUMngs+HrhvlvGozw663Y2gfZKDZEovA
         n8Ffrt25TRUKNLazk0u0+EP2O1UC5TW/wDhuggyeT8Pem8cjuSJsBGb3Ja4tB9qTjXs3
         uze3Asl978LvDm413A+xIlVTsdDkbtgQQ2Fd1pGo9YwUnhstbEwCV40B0ZhIteJHO7Q1
         GGeqVATlPU3eD0NtqctBvcX0NYFkNQ/D1DqqgCRKyJ1Kkpa9yIz7/TDUoOVtOhqrUe6A
         O8PA==
X-Forwarded-Encrypted: i=1; AJvYcCXRoIx5RfQI8cwQW6+8McsF9mqjSpdaWOqd1sUHWT/VOwD35aa4pUO+fbFs039Iq2SipjxS9L7iE9C4rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJtoIjNb6NNc5aB1/YMZbAplRhFMT0t3zl/pcOsWn0ZhY1CPJ9
	xLtN7FDEjkH6QlyPc3cB2UASt/s1yHUgn6Sprf3E4Yyhc+RTLXpJoxDuU6iPEnrC0e4qtR/bEza
	XDICOUZthUjXzIPVMkRbOl5g6zcxrxYhMb0pOaaVysJN/WA6I13A6+InnqIHKwNfxew==
X-Gm-Gg: AY/fxX5a9ABYMv/Q6FtnH5HI6nJJapSDBaODLgVwKxDneicTmht1nHn0imf64X1pnkA
	Nzw6B142vWtnuCn/SGALTqzMSS5xvwsK9OAwRIIqS38k3QzOQXj7dO5IPrW5bCH1ShdBgxte0cO
	nAcbyQs+s6w2tgR5lUcAPrjHD9l7p4OWaFSSjnjPAS/D/WIppiGd80BC37JRvkQ8fjGJqy1Fyg+
	39j0TDhNEmvzB1bTH2sTG83Eq+/L+3IxznrsQhrZGXuVW6/OUe4Ajlg+9VHMZaM4P/6SUsvrW9o
	tMfIT8nWGLQF5UYjJnZazQexxx0w33rdpgX3VbwLqPQ9R9Bkpkd61iy1WRmErQasFzmIu7pyAq+
	mgH+aUDOcsr/cfu8DsRRWo2ssW2Q108kJAyiJlGorNAnM
X-Received: by 2002:a17:903:b0f:b0:2a0:d364:983b with SMTP id d9443c01a7336-2a599e5cb87mr14570215ad.60.1768374756698;
        Tue, 13 Jan 2026 23:12:36 -0800 (PST)
X-Received: by 2002:a17:903:b0f:b0:2a0:d364:983b with SMTP id d9443c01a7336-2a599e5cb87mr14570035ad.60.1768374756186;
        Tue, 13 Jan 2026 23:12:36 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c49299sm215214325ad.42.2026.01.13.23.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:12:35 -0800 (PST)
Message-ID: <82f03ed2-bec6-01c8-8ede-d4c4c406cdd6@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:42:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 03/11] media: iris: retrieve UBWC platform
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NSBTYWx0ZWRfX/s+IzGC13So9
 gGTqM9j5klf9FXrCT6Te+JvzN4p1gAGnBkiHwE+LrzS647qETfSdk3Gp2wb6N2UQE9KY7xfEw2/
 TeJVFDX656l5j4hnOSqCRmnw+NxGdeFx5rAtdresXasl9caNf1IZ5RfskNY00SnrO0qJk1qpasO
 6yYWmOBfC+4wO2bBjbDHlEcRzUQ8U0/qYLo6eK4h+xKAQA2wYQdtCje+lfawI4k5QIyy4E699xd
 Tb05cUuZldq04eGj2gFQNO6sf53cVw9MfL031spa8mAV5xMEsoXQFshVjuZQuaG3aJ0vp4T4Dfd
 UfsVF5ezmACPNW5UQhVI/d06AD6NlVCPhTIl0HGBCtzXzytSqltQqNFGo4NtGl3UUNsBOTmojCy
 hSoGf6zLNj5M0VSW36VoHHh32SY0npqgnNWPLDKbiAwHFC1UAeunetQ5ht4J7n6c5HiJ+24kEtJ
 BTYSWCRqVuqc1AQ88FQ==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=696741e5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Hb1tMkpcLnUKv6SOSUkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wwuXG7B6GQjpVJCjNqL8AvNFQgDVtpdE
X-Proofpoint-ORIG-GUID: wwuXG7B6GQjpVJCjNqL8AvNFQgDVtpdE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140055



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> Specifying UBWC data in each driver doesn't scale and is prone to
> errors. Request UBWC data from the central database in preparation to
> using it through the rest of the driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig      | 1 +
>  drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
>  drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
>  3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 3c803a05305a..39b06de6c3e6 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
>          select V4L2_MEM2MEM_DEV
>          select QCOM_MDT_LOADER if ARCH_QCOM
>          select QCOM_SCM
> +        select QCOM_UBWC_CONFIG
>          select VIDEOBUF2_DMA_CONTIG
>          help
>            This is a V4L2 driver for Qualcomm iris video accelerator
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index fb194c967ad4..d10a03aa5685 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -30,6 +30,8 @@ enum domain_type {
>  	DECODER	= BIT(1),
>  };
>  
> +struct qcom_ubwc_cfg_data;
> +
>  /**
>   * struct iris_core - holds core parameters valid for all instances
>   *
> @@ -52,6 +54,7 @@ enum domain_type {
>   * @resets: table of iris reset clocks
>   * @controller_resets: table of controller reset clocks
>   * @iris_platform_data: a structure for platform data
> + * @ubwc_cfg: UBWC configuration for the platform
>   * @state: current state of core
>   * @iface_q_table_daddr: device address for interface queue table memory
>   * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
> @@ -95,6 +98,7 @@ struct iris_core {
>  	struct reset_control_bulk_data		*resets;
>  	struct reset_control_bulk_data		*controller_resets;
>  	const struct iris_platform_data		*iris_platform_data;
> +	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>  	enum iris_core_state			state;
>  	dma_addr_t				iface_q_table_daddr;
>  	dma_addr_t				sfr_daddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 9bc9b34c2576..85e531b35ecf 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -10,6 +10,7 @@
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> +#include <linux/soc/qcom/ubwc.h>
>  
>  #include "iris_core.h"
>  #include "iris_ctrls.h"
> @@ -248,6 +249,10 @@ static int iris_probe(struct platform_device *pdev)
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
>  
> +	core->ubwc_cfg = qcom_ubwc_config_get_data();
> +	if (IS_ERR(core->ubwc_cfg))
> +		return PTR_ERR(core->ubwc_cfg);
> +
>  	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
>  					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
>  	if (ret)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

