Return-Path: <linux-media+bounces-24546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 660B8A07F3F
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 18:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5544616953B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 17:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7746199235;
	Thu,  9 Jan 2025 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hhn91vB7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE02192B85;
	Thu,  9 Jan 2025 17:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736444934; cv=none; b=TMjKgULdAueyPNR5ddhCiqcONWYSYbfZMsyiGrloWbXlVNcDztmryckB7uzlPXRnjB9tYUrBOfAIJ60qm7St58yZ6E/IP2FXigLLkCNM6S1fgyCA1g5TmTHvBeLf8HRo5oeM5Jiwxg0iUuxhwcOgQgRfMdBqwHij/z0qHfXWYjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736444934; c=relaxed/simple;
	bh=8QqYbCt6WatfmiIAot7P7MYKDIQi4GbdHhEb5n9ofwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h9Gyoaf5YLPUVu3W0LdtOWyl+hrXQ/FqZZYDzlDXXO98/ErxjpbOKVTohja4dS4rzEbv53RMc1wHG41sGrpEyx+imchCRKduv//vItmZY8kfS9OoajGY8mnurLvaxMimPamDtBy/aPtUeFLaHrEmqr3ieS/UhEi97zbFViUHo/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hhn91vB7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509D7h0L009940;
	Thu, 9 Jan 2025 17:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOJcTVlMeEO28eOXItiv/fjqlqGkaT07u2vxtTbwYts=; b=Hhn91vB7NfS9w/K0
	k5ANtPHdkMUYFQ9NyZP+DhvnJScCmyK+6KMc+XmELB97vfr4CXd1qf4YV+VzAoat
	DeL487tB6GvyeSfQ7wB94r3fHLjx5qJ/Yknds3CsniUJM/Kro3OdDAD4yGLshWgl
	qf2la9LnAWoY65fD+KoqvJ2psYac3k9v1F7o8W4WFgsFHMj9lPD703emEiTY+Xwi
	4hlnajcnJDMEH/9ezGDCe14S8OYOyy9E75OlY41Fg+DPdT7iyl2Dusl4RwMmtcKi
	khF1tHiezFkiKAW/XHgULXGDjkLh1K05Fr+QoqQ3FlFJp8WOvzcOBWo+S4C2Nu4i
	mLHWMw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442f2krnq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 17:48:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509HmdC0018354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 17:48:39 GMT
Received: from [10.216.48.143] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 09:48:32 -0800
Message-ID: <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>
Date: Thu, 9 Jan 2025 23:18:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <Z3_nCPk_g8znto4A@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2QMg_BoYsf6-JkouaDwtAnat4Towmysy
X-Proofpoint-ORIG-GUID: 2QMg_BoYsf6-JkouaDwtAnat4Towmysy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1011 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090142

Hi Johan,

On 1/9/2025 8:41 PM, Johan Hovold wrote:
> On Thu, Dec 12, 2024 at 05:21:49PM +0530, Dikshita Agarwal wrote:
>> Initialize the platform data and enable video driver probe of SM8250
>> SoC. Add a kernel param to select between venus and iris drivers for
>> platforms supported by both drivers, for ex: SM8250.
> 
> Why do you want to use a module parameter for this? What would be the
> default configuration? (Module parameters should generally be avoided.)
This was discussed during v4 [1] and implemented as per suggestion

[1]
https://lore.kernel.org/linux-media/eea14133-2152-37bb-e2ff-fcc7ed4c47f5@quicinc.com/

> 
> Why not simply switch to the new driver (and make sure that the new
> driver is selected if the old one was enabled in the kernel config)?
Its about the platform in migration i.e sm8250. Since new driver is not yet
feature parity with old driver, choice is provided to client if it wants to use
the new driver (default being old driver for sm8250)

Regards,
Vikash
>> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell
> 
> Looks like something is missing from Stefan's Tested-by tag throughout
> the series ("Dell XPS13"?)
> 
>> Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>  
>> +static bool prefer_venus = true;
>> +MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
>> +module_param(prefer_venus, bool, 0444);
>> +
>> +/* list all platforms supported by only iris driver */
>> +static const char *const iris_only_platforms[] = {
>> +	"qcom,sm8550-iris",
>> +	NULL,
>> +};
> 
> Surely you don't want to have to add every new platform to two tables
> (i.e. the id table and again here).
> 
>> +
>> +/* list all platforms supported by both venus and iris drivers */
>> +static const char *const venus_to_iris_migration[] = {
>> +	"qcom,sm8250-venus",
>> +	NULL,
>> +};
>> +
>> +static bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
>> +{
>> +	if (of_device_compatible_match(dev->of_node, iris_only_platforms))
>> +		return is_iris_driver;
>> +
>> +	/* If it is not in the migration list, use venus */
>> +	if (!of_device_compatible_match(dev->of_node, venus_to_iris_migration))
>> +		return !is_iris_driver;
>> +
>> +	return prefer_venus ? !is_iris_driver : is_iris_driver;
>> +}
>> +
>>  static int iris_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> @@ -196,6 +224,9 @@ static int iris_probe(struct platform_device *pdev)
>>  	u64 dma_mask;
>>  	int ret;
>>  
>> +	if (!video_drv_should_bind(&pdev->dev, true))
>> +		return -ENODEV;
> 
> AFAICT nothing is preventing venus from binding even when 'prefer_venus'
> is false.
> 
>> +
>>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>>  	if (!core)
>>  		return -ENOMEM;
>> @@ -324,6 +355,10 @@ static const struct of_device_id iris_dt_match[] = {
>>  		.compatible = "qcom,sm8550-iris",
>>  		.data = &sm8550_data,
>>  	},
>> +	{
>> +		.compatible = "qcom,sm8250-venus",
>> +		.data = &sm8250_data,
>> +	},
>>  	{ },
>>  };
>>  MODULE_DEVICE_TABLE(of, iris_dt_match);
> 
> Johan

