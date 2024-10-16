Return-Path: <linux-media+bounces-19748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7F79A0771
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76B822869F1
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF4C206E73;
	Wed, 16 Oct 2024 10:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XuTX012g"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D81206E66;
	Wed, 16 Oct 2024 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074617; cv=none; b=scLSU6kO6tUcodZOP8a/hw53yhG41ipYS3+/dpHTpZjAMo71c6OScENr2tWyYAVXz2j5X+RtOjI34haVaiRAzSSWOINsQHK8brsNEBWCw73Go4iwuxJ65tj/BpFXUrzR7EaYmKTBYQWne6metwqcLQXjX6BMF//Bx/uhcVtGbfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074617; c=relaxed/simple;
	bh=cRAgtSIsyIr9GAtElLAGSrRFE8VIKMnNg9VaP5MYO2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QQT5j52/pl8yUbaMUC58HF0MyCnBNautrDIogK15wcZcWc/hvxVNOSvuaFOr2wH/CpzB1Oyk3UTyR0uw2G/WYvs3zmo7KZLmPsQglIPyUdIUBYkYOPYccfMsXwKJv5gxj16Z9ARb3VHpZ6q8rBV3qz50O4HLuQb5ryQjrwG13YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XuTX012g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8Q8ck026699;
	Wed, 16 Oct 2024 10:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8OUigvW89v160sjD6OuJdUfPjC11GaxwgQ6XpOluJw=; b=XuTX012gytkC8CDK
	s++23YnplGId90xyQ+hz8EVNjN5xU5F0MymIHMxEIppcGEfQKvscoEWVEfsx1vq1
	mlOQezC+wyQ97iexRdyhmgedpKAadPwgrb/z7ixABZ6nR4iWYFLMywddEylbaXmG
	XvWHXH8mztX+8bKGn+HlqXSLa30Ht1+oYBxqYAi0b/68B5zJRlGxgBu9f1NVKTOq
	C//6MTAyREetIlBHK7ba+LocTw2WzMoRfr146H/p4JLukdwnkLz2WmPOw044L13o
	hQ9dc+Ty2VACkNAOx0kU71NDhqOfGxoqc6w2sYzM162dxIhyUtHFKeY+BLz82w74
	Bv+N7w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8w6gmvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 10:30:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GAU4Fo009153
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 10:30:04 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 03:30:00 -0700
Message-ID: <66cf771e-1663-e85c-02e8-524427ab40ec@quicinc.com>
Date: Wed, 16 Oct 2024 15:59:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 02/28] media: iris: add platform driver for iris video
 device
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@baylibre.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Hans
 Verkuil" <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-2-c5eaa4e9ab9e@quicinc.com>
 <r7p4glfxjkcecm7fi4qkl3utn3damrun6lfzkmn5wddcd7pxq7@fpav7mavmckn>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <r7p4glfxjkcecm7fi4qkl3utn3damrun6lfzkmn5wddcd7pxq7@fpav7mavmckn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9Tf6QqAziIYesTm4yMc4U2jZAa81b_Ki
X-Proofpoint-ORIG-GUID: 9Tf6QqAziIYesTm4yMc4U2jZAa81b_Ki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160065



On 10/16/2024 3:08 PM, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Oct 14, 2024 at 02:37:23PM +0530, Dikshita Agarwal wrote:
>> +static struct platform_driver qcom_iris_driver = {
>> +	.probe = iris_probe,
>> +	.remove_new = iris_remove,
>> +	.driver = {
>> +		.name = "qcom-iris",
>> +		.of_match_table = iris_dt_match,
>> +	},
>> +};
> 
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers. Please just drop "_new".
> 
Noted, Thanks!

Regards,
Dikshita
> Best regards
> Uwe

