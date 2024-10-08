Return-Path: <linux-media+bounces-19280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5019953F7
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 18:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A7912878E6
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 16:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35651E0B68;
	Tue,  8 Oct 2024 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NQwqnK72"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6CA16E87D;
	Tue,  8 Oct 2024 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728403267; cv=none; b=WREVZzUcHJya+NHqMQk3taG3KK7pMnr3nXJltfA5aXxZG8Nb8gF+QxURZLBVxL7lZLwbl7jumSDCLoWtl2HCBPr2IE36XUoAZuSFzr6+cPXLtUDTt4vHOvgkjRZ07fWJNHsOH0hMVE3RcErx2fWFzyDXnuR9IenrMT01BmxnKk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728403267; c=relaxed/simple;
	bh=yzrxY6Wd96iwmixzEnfdt2wWXy+51AdrpXcVcKQNeB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iVL0EhMsFEGhfRxia09l2xLKrfC9qeFGPxLVF3NxBlMNa96iba5/QP7n27tC7e+a0amMxRu3vTxcDY00mOfUh2WSQevyAwfovoF3kNRTQCt0IN8dRRVqwWaJJzYqkVm3UTzQQ3XXOYoYL6fEayRavU6K/DHANqM4c2vPIpq330Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NQwqnK72; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498E6NiT022378;
	Tue, 8 Oct 2024 16:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USOu18QWEspNqDGzIHEpSdF2TzL5vQHN61XXINEHAfs=; b=NQwqnK722IPoPIOP
	/6WLJ+QUpSmHFLdrEUdF5ZxlOKUsGDKmw3UTWm3lnCJ45FX3TI9PdbPBVl1UInkh
	Nv7ZmU66phzDTBTqhV5+n+GCRcB55iagKIvepqrXbm6rGyMb/FPaz6kaQjbBShPM
	JoFBEHSwbcdyAr4XnSfv8fjbtGuZT/isKISdfm+5oqHn/Ri7bkxOA0JWQ7eH2aUh
	17fWefWvHiDWBz/pg/re/abpF2Gg1O4nB7/ulkJ/TNUn43vnh1ntled+a4wKxMKd
	5a16t8MftNAk+FIo3wx9B7YW/FPgAXHF8VRjH0FldALj1pyZJfCq6PJyJX3FY2Ed
	Y3wWEg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424kaeu7ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 16:01:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498G0xs8027566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 16:00:59 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 09:00:57 -0700
Message-ID: <a37b5f2a-6cdb-4584-89b2-a1ca1cdc42e6@quicinc.com>
Date: Wed, 9 Oct 2024 00:00:54 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: qcom: camss: add management of supply
 regulators to CSIPHY
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss
	<rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20240926211957.4108692-1-vladimir.zapolskiy@linaro.org>
 <20240926211957.4108692-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <20240926211957.4108692-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gFCNFRykvxZRYGKcBgAWSEhP_1waJQwq
X-Proofpoint-GUID: gFCNFRykvxZRYGKcBgAWSEhP_1waJQwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080101

Hi Vladimir,

On 9/27/2024 5:19 AM, Vladimir Zapolskiy wrote:
> This change allows to properly assign and manage supply regulator
> resources by CSIPHY subdevices of CAMSS, this is needed to fine tune
> description of supply regulators on newer platforms, conversion of
> old platforms to the new scheme is also anticipated.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../media/platform/qcom/camss/camss-csiphy.c  | 35 ++++++++++++++++++-
>   .../media/platform/qcom/camss/camss-csiphy.h  |  2 ++
>   2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 2f7361dfd461..68a3ea1ba2a5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -212,14 +212,25 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>   		if (ret < 0)
>   			return ret;
>   
> +		ret = regulator_bulk_enable(csiphy->num_supplies,
> +					    csiphy->supplies);
> +		if (ret < 0) {
> +			pm_runtime_put_sync(dev);
> +			return ret;
> +		}
> +
>   		ret = csiphy_set_clock_rates(csiphy);
>   		if (ret < 0) {
> +			regulator_bulk_disable(csiphy->num_supplies,
> +					       csiphy->supplies);
>   			pm_runtime_put_sync(dev);
>   			return ret;
>   		}
>   
>   		ret = camss_enable_clocks(csiphy->nclocks, csiphy->clock, dev);
>   		if (ret < 0) {
> +			regulator_bulk_disable(csiphy->num_supplies,
> +					       csiphy->supplies);
>   			pm_runtime_put_sync(dev);
>   			return ret;
>   		}
> @@ -234,6 +245,8 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>   
>   		camss_disable_clocks(csiphy->nclocks, csiphy->clock);
>   
> +		regulator_bulk_disable(csiphy->num_supplies, csiphy->supplies);
> +
>   		pm_runtime_put_sync(dev);
>   	}
>   
> @@ -676,7 +689,27 @@ int msm_csiphy_subdev_init(struct camss *camss,
>   		}
>   	}
>   
> -	return 0;
> +	/* CSIPHY supplies */
> +	for (i = 0; i < ARRAY_SIZE(res->regulators); i++) {
> +		if (res->regulators[i])
> +			csiphy->num_supplies++;
> +	}
> +
> +	if (csiphy->num_supplies) {
> +		csiphy->supplies = devm_kmalloc_array(camss->dev,
> +						      csiphy->num_supplies,
> +						      sizeof(*csiphy->supplies),
> +						      GFP_KERNEL);
> +		if (!csiphy->supplies)
> +			return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < csiphy->num_supplies; i++)
> +		csiphy->supplies[i].supply = res->regulators[i];
> +
> +	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
> +				      csiphy->supplies);
> +	return ret;
>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 47f0b6b09eba..eebc1ff1cfab 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -91,6 +91,8 @@ struct csiphy_device {
>   	bool *rate_set;
>   	int nclocks;
>   	u32 timer_clk_rate;
> +	struct regulator_bulk_data *supplies;
> +	int num_supplies;
>   	struct csiphy_config cfg;
>   	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
>   	const struct csiphy_subdev_resources *res;

I have verified this change on SM8550 board.

Tested-by: Depeng Shao <quic_depengs@quicinc.com> # SM8550

Thanks,
Depeng

