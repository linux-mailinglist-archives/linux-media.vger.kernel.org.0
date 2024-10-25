Return-Path: <linux-media+bounces-20292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08BE9AFA91
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 09:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 383A0B21206
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 07:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F2F1B219F;
	Fri, 25 Oct 2024 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n+hPA2Mx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138E418C03C;
	Fri, 25 Oct 2024 07:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729839841; cv=none; b=geMysVVkuvhIZKjBKV3W8163CpgbXZpz0G7Kx+wV9P2MekkO6bXHj28Qe06q0cwOaL24rcADILl4MRQ3YvDG35Fe707qRBw5Uc2IK6PtbjimrClKMsJTvGkezJrRp0G4LSYEDfeocEYFBPIg0d5IdSyu19Trc8GwZ7XRqZhCxq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729839841; c=relaxed/simple;
	bh=RrmpoaeNC3dVKZ/DC1etAOhpvrdxvQQqG9ApIPiFbsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iHIl/Amd/ZS1BJaOryfsTEqAixWOIlQ8akcHHF3wdI0iAPd06rV9J/s4j0ehgH7PDaoP52RY2rwS6kc1czI/9fp15fsr5Yrhg0JcP5n1B2Etp8Zftxv77cE5WYlj5s0MGWbinW75RedDTf5kTUy9KHRJ30vSg3nOwzuaOy0hxeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n+hPA2Mx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OKJAZS007584;
	Fri, 25 Oct 2024 07:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H12WWhv8FOUiCDonwvBI5Fi7D35TFw0MNbyE7M+cQHk=; b=n+hPA2MxIW6MtoN+
	MIcl2Nxt2t6p+Kab953270P43CODnZP5iOZVvghm90Va7dMn2aGxFtCrzZQ9xKGa
	9eIhLAsyskyD1NXdCWxj3bppfjPd5bWCxcSxFkYu7Rgfu0mBmNqOSCIUNGHn9C7v
	yhCv89kvMYbe1eHbcnZMuFSiDN16zI2nSzd0Sf9h3sk8bL+vWLh65rAepuGZY+tr
	qHo4X68a/EgBQiyfkANzDF70Mzz9SaGiaHmPnRqc+udT/AICq+/eUMyHrkWHVUYE
	nVyQVPk8zx43ZX2EhC5ZhA6EbTxJfHfNUkKVQp913l/7uzV/7Qywk2AzzZwyOsau
	VWWgdQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fk52jyqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 07:03:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P73m5n020709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 07:03:48 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 00:03:44 -0700
Message-ID: <eea14133-2152-37bb-e2ff-fcc7ed4c47f5@quicinc.com>
Date: Fri, 25 Oct 2024 12:33:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 27/28] media: iris: enable video driver probe of SM8250
 SoC
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Jianhua Lu <lujianhua000@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-27-c5eaa4e9ab9e@quicinc.com>
 <Zw0j9UeJmC1MZ3Xt@localhost.localdomain>
 <7vmxx5qtbvhyfcdeariqiult27j5rmykxrefl2qmkhqnrw5wi5@6ugxtx643bmq>
 <48f0e7a1-f5d4-62ec-ec4b-f5bf2ca9caa5@quicinc.com>
 <CAA8EJpq6Q80fcUZfP-DRmo8LHLHrwnkFd5FQ4Mrs0hiwPUyuSw@mail.gmail.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <CAA8EJpq6Q80fcUZfP-DRmo8LHLHrwnkFd5FQ4Mrs0hiwPUyuSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mgVQ5jytlnL7Pjmgy3TST1KJezn3i6Bc
X-Proofpoint-ORIG-GUID: mgVQ5jytlnL7Pjmgy3TST1KJezn3i6Bc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250053

Hi Dmitry,

On 10/15/2024 5:56 PM, Dmitry Baryshkov wrote:
> On Tue, 15 Oct 2024 at 12:22, Dikshita Agarwal
> <quic_dikshita@quicinc.com> wrote:
>>
>>
>>
>> On 10/14/2024 7:38 PM, Dmitry Baryshkov wrote:
>>> On Mon, Oct 14, 2024 at 10:00:21PM +0800, Jianhua Lu wrote:
>>>> On Mon, Oct 14, 2024 at 02:37:48PM +0530, Dikshita Agarwal wrote:
>>>>> Initialize the platform data and enable video driver
>>>>> probe of SM8250 SoC.
>>>>>
>>>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>>> ---
>>>> [..]
>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>>>> index 86ef2e5c488e..a2aadd48926f 100644
>>>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>>>> @@ -325,6 +325,10 @@ static const struct of_device_id iris_dt_match[] = {
>>>>>             .compatible = "qcom,sm8550-iris",
>>>>>             .data = &sm8550_data,
>>>>>     },
>>>>> +   {
>>>>> +           .compatible = "qcom,sm8250-venus",
>>>>> +           .data = &sm8250_data,
>>>>> +   },
>>>>>     { },
>>>>>  };
>>>>>  MODULE_DEVICE_TABLE(of, iris_dt_match);
>>>>
>>>> qcom-venus driver has already supported sm8250 soc, I think you should add
>>>> an extra patch to drop sm8250 releated code from qcom-venus driver if you
>>>> tend to add support for sm8250 in qcom-iris driver.
>>>
>>> Iris driver did not feature parity with the venus driver, so it is
>>> expected that two drivers will exist side by side for some time.
>>> Nevertheless ideally we should have a way to specify which driver should
>>> be used for sm8250 (and other platforms being migrated).
>>>
>> Agree, we should have a way to specify this. Any suggestions to achieve
>> this are welcomed.
> 
> See how this is handled for the drm/msm/mdp5 vs dpu drivers.
> 

We are also thinking to handle this as combination of compatible + module
param similar to display driver, like below:

static bool prefer_venus = true;
MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should
be preferred");
module_param(prefer_venus, bool, 0444);

/* list all platforms supported by only iris driver */
static const char *const iris_only_platforms[] = {
	"qcom,sm8550-iris",
	NULL,
};

/* list all platforms supported by both venus and iris drivers */
static const char *const venus_to_iris_migration[] = {
	"qcom,sm8250-venus",
	NULL,
};

static bool video_drv_should_bind(struct device *dev, bool iris_driver)
{
	if (of_device_compatible_match(dev->of_node, iris_only_platforms))
		return iris_driver;

	/* If it is not in the migration list, use venus */
	if (!of_device_compatible_match(dev->of_node, venus_to_iris_migration))
		return !iris_driver;

	return prefer_venus ? !iris_driver : iris_driver;
}

And invoke "video_drv_should_bind" API in iris driver probe.
Please see if this approach looks good to you.

Thanks,
Dikshita

