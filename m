Return-Path: <linux-media+bounces-34943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1525AADB45C
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C8BE7A9630
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395CC207DEF;
	Mon, 16 Jun 2025 14:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CipdmOMI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C7A2BF01A;
	Mon, 16 Jun 2025 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085089; cv=none; b=p9GiHqZuW0aKMhg3MYi920FD+d5riEJUuP40y+qCHzcFUbbWPLEodrpCk0s+WhAWOasue+0xVvK08Qxl6gAWIhN3MvEfnMujfPdvjdrnnXiEvyubPbKJvNNrEzrWP8vSCGX+dVO7s9mpxnoHJyn6+JDXjIQETtyTJWaszJiU97E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085089; c=relaxed/simple;
	bh=pFAraa/RnfXJP8ItDsKMpvhWJCVNuhGxAJAg1y2jNqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C/F18RdSawxoGe6QKvs4g6CsAz6LcwcKgWLJrDspkhsKizPF9P5JGnTFPZ8QeXHZOzA8V6p9WH+d6/6uoNIGsPfPCNSiVq1zP98R/bq5nhl9sInDSEUhI9cw16mJkht9Bi21bq4qAM71JJypPCMJ2MGInK2xmwwz6sgZ2as8PAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CipdmOMI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8OiMq024156;
	Mon, 16 Jun 2025 14:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWOr8aKLyyF1UYdurrKYjXwTEh1+++Lje8uk+aetRX0=; b=CipdmOMI8Q3jbJgP
	3YVh0eHovmKFZKv9RXDgW5IWemZtBA1700cnJnP/qxa47b0AOuI8bNOo5GVMglPT
	CeeJNZhS8mYGlujLhDZFMgrXclDL/Usr3nZWWpPNCn834+CS4ZSPlE5iK1f6I5GF
	+5PKLtzWgM2dx0Lsc7M1Nyix/pZvrsRws9eaKAYjAdHEAgAcmM/jkxWzfSLWsKqH
	U+/o7OGvtRjGVqoTzososb6jhyiqykIn0qu6oysGfHA+rhJux/XxWYuj85s7+ajW
	C7Ol7ucJXQR4zpxT9wGdbr4ZHiDU8PGe3dBlcu5CfHmS4/vOJJ8Z/j3IsCKaCzxj
	kg2Uyg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsvuvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 14:44:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GEigkJ008232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 14:44:42 GMT
Received: from [10.50.31.25] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 07:44:39 -0700
Message-ID: <1bdf289b-5eec-d5de-a08b-6c7a772e15a3@quicinc.com>
Date: Mon, 16 Jun 2025 20:14:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
CC: <quic_dikshita@quicinc.com>, <bryan.odonoghue@linaro.org>,
        <loic.poulain@oss.qualcomm.com>, <mchehab@kernel.org>,
        <hans.verkuil@cisco.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
 <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com> <aFAVTvsDc8xvwBme@trex>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <aFAVTvsDc8xvwBme@trex>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5MyBTYWx0ZWRfX3so7z8JKxz5I
 0ffmcvcR7OcFBQONEOeFXq64wTR+OqzOkZZ9NNNEFvoNDn7O9zmSOpz7ekFss38aYpub9paOW6S
 +bHa7mMlZwqOuCtH6u0DljWRaJwq9JM64Dx0aRXOP4r1Nz27so1PQi6Y5QMryw+hxp3218KU5J+
 rFN7ZjMkJckPVDpp46qJe8kKsdWq1suiMiO0KC+KEa9rKvuErauBxMjPx0/5NTdxgqo4vzIDhs/
 CV92J1+LEYl3xe0wPjAVKJSWIMBmA/cLzduy7w2D8xs3bB1xZBejbQaE7OujwmEe3NWmL7+FhOe
 oKrQ7lBhayteb3hk1pXlh2eKWp9NpssUJ1JW0+jc/n8d0xAFGg5/AohZQmVX5bDNFX0Kz7SFFm3
 Hu9Bpz3wJhkjdTVYQVvCn5mmsatrnRVM+lNq5slf+WmOrM0AGauCyCyjJ74hiyAnGk37MXvI
X-Proofpoint-ORIG-GUID: 0Dt6jpOWrjAamnvawClTQMAQbO-FQxch
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=68502ddb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=4G66BWXSruKwbL_EvOUA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 0Dt6jpOWrjAamnvawClTQMAQbO-FQxch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=820 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160093

Hi Jorge,

On 6/16/2025 6:29 PM, Jorge Ramirez wrote:
> On 16/06/25 17:26:24, Vikash Garodia wrote:
>>
>> On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
>>> Ensure the IRQ is released before dismantling the ISR handler and
>>> clearing related pointers.
>>>
>>> This prevents any possibility of the interrupt triggering after the
>>> handler context has been invalidated.
>>>
>>> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
>>> index b5f2ea879950..d9d62d965bcf 100644
>>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
>>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
>>> @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
>>>  	venus_interface_queues_release(hdev);
>>>  	mutex_destroy(&hdev->lock);
>>>  	kfree(hdev);
>>> +	devm_free_irq(core->dev, core->irq, core);
>> Could you please check and add the handling here [1] as well ?
>>
>> [1]
>> https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427
> 
> hi Vikash, sorry I dont get your point - what do you mean?
IRQ need to be freed even for error cases during venus_probe().

Regards,
Vikash
> 
>>
>> Regards,
>> Vikash
>>>  	core->ops = NULL;
>>>  }
>>>  

