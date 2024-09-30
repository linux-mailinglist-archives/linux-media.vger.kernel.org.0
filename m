Return-Path: <linux-media+bounces-18753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9947F989A35
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 07:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 562F81F22901
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 05:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BEB13DB92;
	Mon, 30 Sep 2024 05:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WmtYzL0T"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF64A47;
	Mon, 30 Sep 2024 05:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727674691; cv=none; b=FqfsrMvNuX8TJpIjLOD4OuJT13CR0m7jB8yUc50mHO0JkzSPUEkOSKBI8/grSavOtRHtUlto8AvcK2UImfRMjQWSD/3/1qUB+EDtzh5sC3qfIqRWfxmiRlU1SRI+bqV7qySXCU4F+CLSAWMC1hNEqnp4GrNHuiUw2QkwiJzKj/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727674691; c=relaxed/simple;
	bh=y6BqW0adLuSNbEpDtlt1wTQwouIIcVZHMgkSlDe6AIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HZ61mahcMT+H5SsRIteDrENN1001mex4YhUaZm7vdXxqn8UEcAAzfEAnssZM0D6Ig4k56dkmDSx2iDOQzGhdFy7OarPhsIq/IvSyiXE7HAVrbni27ygFQ9sr7VQdwNE7fqdHAEMwjSaCvwntOccbSMKePywoaBrvg1vbUFLTpRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WmtYzL0T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48TMTuOm001779;
	Mon, 30 Sep 2024 05:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YltmkjNOP5VKAuTTCBOm6ghW3ZDdOOIG25kE35a0XaA=; b=WmtYzL0T5t1Vbk23
	MnVdr0LI0mOfmKi52+BlFPc0ZGq1+S/J5N+D9N3D6VvaVcg7BwPBek1BZzPKdvbO
	wLlhCRr/YDEjTIw9J/q/vQWWHp8FlpUqphmWuIURPOuYbmcIWFx5nLowiLCsyZ0S
	kPZDi6SaFoTE3s1VXYShi/wkRF0UUi3oJT4ukQdnvIYGeEzqHOo7tNjAibWnZDNs
	Hh+Zj53egUEs3yFTwNRIPykrVlq4N+V1hvr7TK5TW+y2DVrg7qrqW7m/a9cv6RgP
	S4L/OsKi/WfZRvG2U1BaNQEDvFMqOtZCcI9HkZhMD+8FWfPUJUh2TcUa4hL7/taD
	LataRQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xa12knd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 05:37:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48U5bphg028551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 05:37:51 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 29 Sep
 2024 22:37:46 -0700
Message-ID: <f31c2b15-d1ae-41fa-952b-eab806b0e15d@quicinc.com>
Date: Mon, 30 Sep 2024 13:37:43 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
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
 <d842a992-e04f-4a11-abaa-da50808fea77@quicinc.com>
 <6b702201-4418-4bbe-95b2-50039c08b4d8@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <6b702201-4418-4bbe-95b2-50039c08b4d8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iiMyueU0O6mCP_eI_8A9IKY2BvRqXltt
X-Proofpoint-GUID: iiMyueU0O6mCP_eI_8A9IKY2BvRqXltt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300039

Hi Bryan,

On 9/30/2024 7:57 AM, Bryan O'Donoghue wrote:
> On 29/09/2024 02:28, Depeng Shao wrote:
>>>>
>>>
>>> Thanks for catching this, I forget to add the rup irq, so this logic 
>>> is also missed. I have tried it just now, the logic works good, will 
>>> add it in next version patch.
>>>
>>
>> I go through the code again, and find we don't do the wait for 
>> completion in VFE 480 driver, this is just used in VFE gen1 driver and 
>> just during disabling port.
> 
> Right but, we _should_ wait for completion there, the fact we don't is a 
> bug.
> 
> One context issues a command to take an action and another context in 
> this case an ISR has to fire for that action to be complete.
> 
> Therefore we _should_ wait_for_completion() in the initiating context 
> and timeout if it exceeds a reasonable timeout.
> 
> Granted, we've "dropped the ball" in 480 you're right, it needs to be 
> fixed and will be but, please in your submission do the right thing.
> 

Qualcomm downstream camera driver use the rup to move the req to a list 
to maintenance a state machine. If we don't get rup then we will enter 
bubble state.
But we are downplaying this process now due to AUP, and the bubble 
processing has been disabled in latest code base, since we think the 
buffer must be filled to the given address if we have configured the AUP 
and got buf done irq.


And this per frame wait_for_completion flow isn't exist in whole camss 
code, and current camss driver just use buf done irq to trigger the per 
frame flow.

E.g.,
irqreturn_t vfe_irq()
{
	if (rup_irq)
		reg_update_clear();

	if (buf_done_irq) {
		vfe_wm_update();
		reg_update();    --> We can't do wait_for_completion at here in irq 
context
		vb2_buffer_done();
	}
}

Just VFE gen1 driver use this wait_for_complete in vfe_disable_output, 
and this flow has been removed in vfe gen2(camss-vfe.c), so looks like
we don't need to add this wait_for_completion support and also can 
remove below code in camss-vfe-480.c

vfe_isr_reg_update()
{
	if (output->wait_reg_update) {
		output->wait_reg_update = 0;
		complete(&output->reg_update);
	}
}

Thanks,
Depeng


