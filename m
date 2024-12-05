Return-Path: <linux-media+bounces-22708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0DC9E5609
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 13:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38D81286B15
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 12:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99134218E8F;
	Thu,  5 Dec 2024 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oZMcMhai"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF3D218ACA;
	Thu,  5 Dec 2024 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733403532; cv=none; b=gE8YplaciEENrcbEBSNBBx5qFRGbNz31ZWGI9qbW3YaaPLPkJ90YAUfoZXiohbjHEC+Dj681vTOlEL+S+aM5KJT/guVNj+ILn+ENM4WSBtfCMdiPx44+XyoPUL8sM0JEysZtQmZ8Xs/p+MxGPBGl5PwpLF0f7/MkXyH2OmLBVgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733403532; c=relaxed/simple;
	bh=kSmpCKQlwXxgLW3Gn7DKNIbnNLX6Wrv+XfsTsQZ+jVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q9TlZ7EgbXc6wBwbo4leOp6II9jeWhf2cF2mKa4ZrWLApuUkbVtEGig/p5g3a/5pjVYOgrx8w/KvRyvFUXEpOjZzkNXuaOWv6tP6BEgBUElVFTkBiOkGL7ZSo+VIZYaUaHNbtcqBd8O+4a9ndAK3s1QAScCJ05Obn74xsRrPuFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oZMcMhai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5BmpwE026044;
	Thu, 5 Dec 2024 12:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wgtya74jr3fwO8Z5Wb9rXbJo7gjO4bNxMH8VWgYYMQk=; b=oZMcMhaiYn/3eFfi
	M4VsH1m2vhpcc6sPw1fAr/TB/dnAwns7i9k6+3tpNRJYm62eeyRjrF5yJCkGZ0Sn
	NQKXQpc7v20UoMAYT7Ng/8O6B6Q5ennkmHB91mg+GfsdxiYWnCgiEmW9RRsJo2y5
	Pwg7SvgfChEce2bvHB4PnpNjeYwKpp5okrWztQRbEBtKECc6XFrHuqcLXd6BW5rw
	MjIFyOQBz2zPFy2oSWDAcf+7rx8RQGVPx/Eeygcme6yCfIp9Ki5lHRp8JMFamruD
	0YfBoSY/vDAVyQOo1LWXpunjLOGeNxPrWfScc0shp299Wrp3fKOnVPTNDtFX6WlH
	mpVwtg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439yr9q232-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 12:58:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5CwaDi008832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 12:58:36 GMT
Received: from [10.204.66.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 04:58:28 -0800
Message-ID: <dbc5e54e-97ef-4d88-a2bd-a6493527c0dc@quicinc.com>
Date: Thu, 5 Dec 2024 18:28:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <rfoss@kernel.org>, <todor.too@gmail.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <akapatra@quicinc.com>, <hariramp@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-2-quic_vikramsa@quicinc.com>
 <oko5qqysmxhicqzkwhkz54wvsmt64ba3cd37zkcy55ee77owbk@5z3zetfr2ejx>
 <eaffa633-c3a4-4924-8ba7-694b18bf92ee@quicinc.com>
 <2cb5940b-3779-4450-a213-fa766df7f406@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <2cb5940b-3779-4450-a213-fa766df7f406@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FrAt9i5wYfoytjkDfEz-v4cDQJXgCMal
X-Proofpoint-GUID: FrAt9i5wYfoytjkDfEz-v4cDQJXgCMal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=650 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050094


On 12/5/2024 5:26 PM, Bryan O'Donoghue wrote:
> On 05/12/2024 10:59, Vikram Sharma wrote:
>> Hi Krzysztof,
>>
>> Thanks for your "Reviewed-by"
>>
>> +        camss@acb3000 {
>>
>> If there is going to be resend, then node name: isp
>>
>> Sure, we will change node-name from camss to isp or camera (As its a 
>> part of generic names recommendation as per the shared link.)
>> If there is a resend. or we will address this as a followup.
>>
>> So
>>
>> - camss@acb3000 {
>> + camera@acb3000 {
>>
>> Best Regards,
>> Vikram
>
> Please no top-posting.
> https://subspace.kernel.org/etiquette.html
>
> Shouldn't that be isp@0xaddress ?

ACK.

- camss@acb3000 {
+ isp@acb3000 {

In both YAML and DTS. If we post V8.

>
> If you are making this change, please remember to do it in both the 
> example and the dts.
Understood. Will avoid this.
>
> ---
> bod


Best Regards,
Vikram


