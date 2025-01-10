Return-Path: <linux-media+bounces-24626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C212EA0988F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 18:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F8117A184D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 17:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57394213E90;
	Fri, 10 Jan 2025 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="De+Jd7sX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA282F3E;
	Fri, 10 Jan 2025 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736530266; cv=none; b=ea6kgMNNYdZIUdsa0uSyO2sSbZcZcExTWcB9L/sPeD2+InAY0c8eRidy++xqXrVHPyhZ7md50zkjsHNueiLMdEeNu/DKor0tWSad99VBr3bJWU68aUICXQw6s28IHFEtxFAv26CHw3h/963Osnz371UnSIWo60/MjZJLQzgQ5jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736530266; c=relaxed/simple;
	bh=7wOoi5BL4PGqLi6xxs/yRouAop1bhN6SW6OEDPgLT1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rr+3pZIlO/xiqPMZYrd7KKl7ea8enEl13S843fEF/mM5yHj0zUBjHoROhMqPepwVxfcjcy7B6TYaBTkJpg1dI9RdTu694buiolf3AMYkV9SZOnzh2VV3PquqpafPrDNi4MXJsMn85Mdq1bPeKHnDfhOs0varL+9d+QUdHgtWd6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=De+Jd7sX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ACLZ0H004159;
	Fri, 10 Jan 2025 17:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+kWxiIhP4hu1teMb6i3Fkujoch1HtnRL/3mOiQeN1w=; b=De+Jd7sXD2Gdkoyv
	9yIoZPtIL3hV0kukSgE5ytjoiqQhuu37Et6KKaBXLO2wwIvgIevd1tp2mbVq+Blk
	AhxVzsMn77QcI+1OPmUfvYbEGgLFUhjabKFeMbBvIy+FqdFB5KcbEfIsqrG3x1pA
	NemOxhJW5HjsbOqJzKzWad9yiv6fGGITNI4FGhxIH+5AwJ4GZcUaMtCFklmrJe50
	FQhuJzImFI8O2NSjHTMTuXCQz6XS3er9A9OdKVPbHIlBJZ3iHB1i59RLg8K4dPfw
	h4W5QgP0VdeYUgp/TTgh42E47utnewzKxv4PFUD2bttuHFTGHOJPUktIJFWRfq4f
	XLtawg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4433g0rtmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 17:30:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50AHUntn029605
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 17:30:49 GMT
Received: from [10.50.21.116] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 09:30:42 -0800
Message-ID: <24334fb8-4d83-eb06-aee3-dfe1f8e4937b@quicinc.com>
Date: Fri, 10 Jan 2025 23:00:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
To: Johan Hovold <johan@kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
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
 <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>
 <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: n8QyieWjDtJJz8Dl3kmrUHQzsCIfPxak
X-Proofpoint-ORIG-GUID: n8QyieWjDtJJz8Dl3kmrUHQzsCIfPxak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 clxscore=1011 malwarescore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501100135



On 1/10/2025 7:58 PM, Johan Hovold wrote:
> On Thu, Jan 09, 2025 at 11:18:29PM +0530, Vikash Garodia wrote:
>> On 1/9/2025 8:41 PM, Johan Hovold wrote:
>>> On Thu, Dec 12, 2024 at 05:21:49PM +0530, Dikshita Agarwal wrote:
>>>> Initialize the platform data and enable video driver probe of SM8250
>>>> SoC. Add a kernel param to select between venus and iris drivers for
>>>> platforms supported by both drivers, for ex: SM8250.
>>>
>>> Why do you want to use a module parameter for this? What would be the
>>> default configuration? (Module parameters should generally be avoided.)
> 
>> This was discussed during v4 [1] and implemented as per suggestion
>>
>> [1]
>> https://lore.kernel.org/linux-media/eea14133-2152-37bb-e2ff-fcc7ed4c47f5@quicinc.com/
> 
> First, the background and motivation for this still needs to go in the
> commit message (and be mentioned in the cover letter).
> 
> Second, what you implemented here is not even equivalent to what was
> done in the mdm drm driver since that module parameter is honoured by
> both drivers so that at most one driver tries to bind to the platform
> device.
> 
> With this patch as it stands, which driver ends up binding depends on
> things like link order and what driver has been built a module, etc. (as
> I pointed out below).
> 
>>> Why not simply switch to the new driver (and make sure that the new
>>> driver is selected if the old one was enabled in the kernel config)?
> 
>> Its about the platform in migration i.e sm8250. Since new driver is not yet
>> feature parity with old driver, choice is provided to client if it wants to use
>> the new driver (default being old driver for sm8250)
> 
> This should be described in the commit message, along with details on
> what the delta is so that the reasoning can be evaluated.
> 
> And I'm still not sure using a module parameter for this is the right
> thing to do as it is generally something that should be avoided.
> 
I understand your concern of using module params.
I will modify it to rely on Kconfig to select the driver (suggested by
Hans) instead of module param.
something like:
config VIDEO_QCOM_IRIS
        tristate "Qualcomm iris V4L2 decoder driver"
       ...
        depends on VIDEO_QCOM_VENUS=n || COMPILE_TEST

Thanks,
Dikshita
>>>>  static int iris_probe(struct platform_device *pdev)
>>>>  {
>>>>  	struct device *dev = &pdev->dev;
>>>> @@ -196,6 +224,9 @@ static int iris_probe(struct platform_device *pdev)
>>>>  	u64 dma_mask;
>>>>  	int ret;
>>>>  
>>>> +	if (!video_drv_should_bind(&pdev->dev, true))
>>>> +		return -ENODEV;
>>>
>>> AFAICT nothing is preventing venus from binding even when 'prefer_venus'
>>> is false.
>>>
>>>> +
>>>>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>>>>  	if (!core)
>>>>  		return -ENOMEM;
> 
> Johan

