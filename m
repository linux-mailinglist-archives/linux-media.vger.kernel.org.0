Return-Path: <linux-media+bounces-18738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FD998926B
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 03:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47E541F22D2D
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 01:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E59DF42;
	Sun, 29 Sep 2024 01:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jXi+LjSa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858EDB644;
	Sun, 29 Sep 2024 01:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727573325; cv=none; b=HkxZ3nOdztJtfzY2rBSoPFcisx/tyBZp/jeKE0MRUheoqVeVIcsPLXoV9zcs4CIunhai+UkOY9RWMk3MfV5C79v0SRGMA8Bi5oqxcr1117dQfxMH0ZORbZox3iRnGrUp2lLOYgKVyO9Cl2EDYb+ZvkIlIwyRs01u/2pPnfbwNnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727573325; c=relaxed/simple;
	bh=FPNFEZO7Vbgv/3w/V1/AEPDcPi0VNMlmFBJb4qvBuA8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=H08ZYE+Ju+XgsWrB7MgdBZVz5O9as1p2Mb64EU4cDw7+FuB8231hOZm8ZWRK8fsrwMHTdTwXwNYSA6dkxXQoGNx5ByzehfOIGXiGmZWxar4JCigQ2jNJkYRwgs0ELe04kQp0/Z8UueOk3gI47yDLyZjlnwN3RnRp3Eg4w+/1nCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jXi+LjSa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48T0SkNH027431;
	Sun, 29 Sep 2024 01:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CQu+a5I628fSPg2Q3guwDsVA1ZHeGM8a0J7SUXaizjA=; b=jXi+LjSadIbbPHCD
	51IRcErdYaU5r/NBOzRtpV2mQL8gceFtt+c4iqmiX9v6uo+BecAIFMX6NroYoie0
	wpAwJ1Jzke2hLB/ONj0qUuxUgvcyKlLYK4Xxg8Lq526z8CRQ9Vy49qIv4X29oa8q
	4k/VVHYqEDhLbff4LcXTDtlMAu3faZwgg/ouepSGXlav61wzBYCcDMKgBdXYzoEH
	64EFfItkeTvw/vv9Kb1WCY1ZiADPOjvSX7XHtwE/G3iyDh8xfJSkaljMUc/EOjMg
	l8+7rq9d/fQj7G0xShHkgouUf2oUUDb2Jv9gTZuOZ2yIANHW6ag4ug7hCYdZMjx4
	P42dzA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xb38sdbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Sep 2024 01:28:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48T1SPAU010382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Sep 2024 01:28:25 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 28 Sep
 2024 18:28:19 -0700
Message-ID: <d842a992-e04f-4a11-abaa-da50808fea77@quicinc.com>
Date: Sun, 29 Sep 2024 09:28:17 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
From: Depeng Shao <quic_depengs@quicinc.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <6ddaa41b-86cf-44e5-a671-fd70f266642b@linaro.org>
 <eb77972c-9c9a-48f9-b850-21e6c2df005a@quicinc.com>
Content-Language: en-US
In-Reply-To: <eb77972c-9c9a-48f9-b850-21e6c2df005a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wpz0-A4AWjUzkYP7sq5_5UxUQMQyiZUd
X-Proofpoint-ORIG-GUID: wpz0-A4AWjUzkYP7sq5_5UxUQMQyiZUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409290010

Hi Bryan,

On 8/15/2024 10:21 PM, Depeng Shao wrote:
> Hi Bryan,
> 
> On 8/15/2024 8:25 AM, Bryan O'Donoghue wrote:
>> On 12/08/2024 15:41, Depeng Shao wrote:
>>> +void camss_reg_update(struct camss *camss, int hw_id, int port_id, 
>>> bool is_clear)
>>> +{
>>> +    struct csid_device *csid;
>>> +
>>> +    if (hw_id < camss->res->csid_num) {
>>> +        csid = &(camss->csid[hw_id]);
>>> +
>>> +        csid->res->hw_ops->reg_update(csid, port_id, is_clear);
>>> +    }
>>> +}
>>
>> The naming here doesn't make the action clear
>>
>> hw_ops->rup_update(csid, port, clear);
>>

The register name in SWI is IFE_0_TOP_REG_UPDATE_CMD in SM8250 platform, 
and it is CSID0_RUP_AUP_CMD in SM8550, so it isn't only RUP, and AUP is 
also updated, so maybe the original name reg_update is better. This is 
what VFE 480 driver is using.

>> "is_clear" is not required since the type is a bool the "is" is 
>> implied in the the logical state so just "clear" will do.
>>
>> But re: my previous comment on having the ISR do the clear as is done 
>> in the VFE 480, I don't think this is_clear parameter is warranted.
>>
>> We want the calling function to request the rup_update() for the 
>> rup_update() function to wait on completion and the ISR() to do the 
>> clear once the RUP interrupt has been raised.
>>
>> At least I think that's how it should work - could you please 
>> experiment with your code for the flow - as it appears to match the 
>> VFE 480 logic.
>>
> 
> Thanks for catching this, I forget to add the rup irq, so this logic is 
> also missed. I have tried it just now, the logic works good, will add it 
> in next version patch.
> 

I go through the code again, and find we don't do the wait for 
completion in VFE 480 driver, this is just used in VFE gen1 driver and 
just during disabling port.

Here, what I tried is clearing rup_aup when receiving the rup irq.

Thanks,
Depeng


