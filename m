Return-Path: <linux-media+bounces-38584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E30CB13E5B
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 17:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E4D5188458B
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 15:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526502741C0;
	Mon, 28 Jul 2025 15:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPmRA33q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6F7273D82
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753716528; cv=none; b=JVWJgt1R8LvQMsjfm4udB0DcPWuJ7YXfySo8Aryczh+q4BETAg9cEUg9W9wVeg8h4f1OH+XaLffF66tmJpJLb8A4w1Xv2DWToDdCdtg0b8BUV+39bRPVV9awHn13dsHQ4u6NzDPJX0wU1vpoZCqir3QQGbc5wFFf9B31mxqXpSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753716528; c=relaxed/simple;
	bh=msmFyZu9Jsscab5hbY3+ICHeJzThMjfhq7769qRrgUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Evu1wEvQllatvN2r59nK84rHl9czTMf8NXa3i6xv7vA+ULaZQMvdVC83+ezvP9/LXdveoCOnUf6ULWsYYXbqzQdKEBbkyT91ZldXjPRr3yCMXl8y879aT2sh5mHYCgMsSwTOVEs7jZpHo2UJVDv1xBjL3izX1Z4Rxchh/557trM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPmRA33q; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so48416925e9.3
        for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753716524; x=1754321324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0KYH5uOnsVIwXthd6jLacA3vCzPCBFlvs/tLtNeIbio=;
        b=tPmRA33q3CapE9h7+Ham7OJQYqBwtLBoHWTeZcNU9Sgtli37+2u4XRzgGgP3Ppawt6
         vdrFKIpGn8gUPyHCdQmWKASyPTIIHi3Jwmc0MopkU1TNt3Hw8zTi+E1zxXzgedxojcPZ
         gcN7qWDU+fC0F0Eox43YR+QT0z48qvMupBTyx5ddFJqwd0/PhvLLh4OzDujjjduM2U2U
         jhuujXwga7ZApJ93mLCjAM/arxzHfjkr7vaEMGAw94FoeCvQcFS7ppyG/mh3XJcX3y6/
         JDYIidbUmGUnbFw7dx9gmiD2gpc8equ9JYyJV80NtG+IzE4YfTYf1ZShPecon4rdbIvt
         210w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753716524; x=1754321324;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0KYH5uOnsVIwXthd6jLacA3vCzPCBFlvs/tLtNeIbio=;
        b=WcLV4XqTCugF2qtPX+eZ0+PB0bEaSzbQoopKcarkq+de+uFjSl4JAgkwNRFtWAe+dy
         eq3/+ywyJ/q+6BimiVERFfF9naXsrhh9bSip1oQaOxKDLXlTQU0NLI9cytxjH191op6h
         zaxy5ZCUsZHMV5VlldoBbG09N05GbzkzoPNBrzvdqmrWHPqsJBD9MmWSyfjQSObAZcwb
         7di/t58c7XWG8f0/2zD2KyhqmXfQMDCPgVPfk7aPKvWrq0TpV8y4M7s7Apsz94B3S3Sq
         QZMik+zp4CvD0W3WlXyeHWZdGnsGDDs8FB6ntXjT/2feBDf0b1W8lBEzn8JZInYqGnSD
         SHBw==
X-Gm-Message-State: AOJu0YxldU7FM4OumqVT2vtxFYpKpkT4zWyaVYSotaiMy25bDGBJ0es4
	Fsz704lGOSZKittjv8t1hPs/HBtTgyx9OPRPualrCm/PMu5irZt38BLvw6KY5gHNFbg=
X-Gm-Gg: ASbGncuf0AWwZxslYvf92Lv4EsdDnt+pC//vbYWF+vM5HIrNJ6vHk75bKcPrKi9giAR
	ylQyrVmA8LVk+mUsn8D39PrMfb1Laxuq3ordIq4PRIjoqJk7fDtr0fhI9xV6wiyTi+ZkPxhRQeu
	DBx/IpTXxZTYmFIHpnWSvejrtkMaj6ZhJDUbHsBQGRY4YpSW7xEzGNstuGM5n3WPJs4bIpvTerP
	qE6rxLOtgxr0Mn2Sp+I0SXblQEujCqEvPA4ZNZBu4uhSZkwllhCFe+LgjvDx9Yn5ofOWC9bV9yQ
	FGiYtBPAKFL/Ndd6JcNU1V3jz8C1byWGLO/hybiPJ6fChSX9nRveX6PlTdatNv08UJLd5b1ukNa
	+FG9Zs8COCoUmRCH2dPPT56M5Hj5WZA6d7HYq9N1psYgZ3XFTHZDoYkd+3BP7/uY=
X-Google-Smtp-Source: AGHT+IHCDJPO3DmwE+R871rYbqW/w7f3xvgvCsRTeXZDv1pGjX0zdXjJHcF/PKQqWaeVJiDXV9MS7w==
X-Received: by 2002:a05:600c:1992:b0:453:6ca:16b1 with SMTP id 5b1f17b1804b1-4587655b2f6mr92024565e9.26.1753716523805;
        Mon, 28 Jul 2025 08:28:43 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45870555065sm163572625e9.15.2025.07.28.08.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 08:28:43 -0700 (PDT)
Message-ID: <a49b6b55-0482-4287-8001-e6e87381227f@linaro.org>
Date: Mon, 28 Jul 2025 16:28:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: tpg: Add tpg support for qcs8300
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250717-qcs8300_tpg-v2-1-0946c69c2c8b@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250717-qcs8300_tpg-v2-1-0946c69c2c8b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2025 05:18, Wenmeng Liu wrote:
> Add support for TPG found on QCS8300.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
> QCS8300 is a Qualcomm SoC. This series adds driver changes to
> bring up TPG in QCS8300.
> 
> Tested with following commands:
> - media-ctl --reset
> - v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=0
> - media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - v4l2-ctl -d /dev/v4l-subdev3 -c test_pattern=9
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
>    --capture=7
> 
> Dependencies:
> https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/
> 
> Changes in v2:
> - rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
> - Link to v1: https://lore.kernel.org/all/20250217-qcs8300_tpg-v1-1-6e0f4dd3ad1f@quicinc.com/
> ---
>   drivers/media/platform/qcom/camss/camss.c | 52 ++++++++++++++++++++++++++++++-
>   1 file changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index ced31e3655a52a7b2e55b109085cf24a9e230f1d..68411e4a5c55b394145ba907f18cb03e235dcc23 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2548,6 +2548,53 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources tpg_res_8300[] = {
> +	/* TPG0 */
> +	{
> +		.regulators = {  },

you can drop the explicit empty set.

> +		.clock = { "csiphy_rx" },
> +		.clock_rate = { { 400000000 } },
> +		.reg = { "tpg0" },
> +		.interrupt = { "tpg0" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.vc_cnt = 1,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +
> +	/* TPG1 */
> +	{
> +		.regulators = {  },
> +		.clock = { "csiphy_rx" },
> +		.clock_rate = { { 400000000 } },
> +		.reg = { "tpg1" },
> +		.interrupt = { "tpg1" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.vc_cnt = 1,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +
> +	/* TPG2 */
> +	{
> +		.regulators = {  },
> +		.clock = { "csiphy_rx" },
> +		.clock_rate = { { 400000000 } },
> +		.reg = { "tpg2" },
> +		.interrupt = { "tpg2" },

Does the TPG interrupt do something ? AFIAK it does not.

Drop dead array entries and unused ISRs.

> +		.tpg = {
> +			.lane_cnt = 4,
> +			.vc_cnt = 1,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +};

> +
>   static const struct camss_subdev_resources csid_res_8300[] = {
>   	/* CSID0 */
>   	{
> @@ -4492,7 +4539,8 @@ static int camss_probe(struct platform_device *pdev)
>   	if (!camss->csiphy)
>   		return -ENOMEM;
>   
> -	if (camss->res->version == CAMSS_8775P) {
> +	if (camss->res->version == CAMSS_8775P ||
> +	    camss->res->version == CAMSS_8300) {
>   		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,

You already know the number of tpgs so there's no sense in pivoting on 
version number.

if (res->tpg_num) {
	devm_kzalloc()
}

>   					  sizeof(*camss->tpg), GFP_KERNEL);
>   		if (!camss->tpg)
> @@ -4677,11 +4725,13 @@ static const struct camss_resources qcs8300_resources = {
>   	.version = CAMSS_8300,
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_8300,
> +	.tpg_res = tpg_res_8300,
>   	.csid_res = csid_res_8300,
>   	.csid_wrapper_res = &csid_wrapper_res_qcs8300,
>   	.vfe_res = vfe_res_8300,
>   	.icc_res = icc_res_qcs8300,
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
> +	.tpg_num = ARRAY_SIZE(tpg_res_8300),
>   	.csid_num = ARRAY_SIZE(csid_res_8300),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8300),
>   	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
> 
> ---
> base-commit: dc3d6ecbfebec02791feea0b08062540badcb5a2
> change-id: 20250717-qcs8300_tpg-f7735e998310
> 
> Best regards,
---
bod

