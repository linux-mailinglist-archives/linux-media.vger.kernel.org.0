Return-Path: <linux-media+bounces-27328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCADA4C16A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 14:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 024D83A9DA6
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 13:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D18D211A2B;
	Mon,  3 Mar 2025 13:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="be79Ceip"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9E31CAA71;
	Mon,  3 Mar 2025 13:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007569; cv=none; b=X5Up04KHrq1fQTX/zkG9u76tQ6pWHL5mQtkEfYTDfaU5A+IoIjr1fL92nuiaBRcg3P1DstKfT9QwL4YHyrInFNx1Ur9KJU4zu1hEiDnf4k74XQ2Ey7IfURB9MVsZxETsUrqLlgtNcQQf1tbhzP4wyXYziNh/XJd66Qvi9+pZQpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007569; c=relaxed/simple;
	bh=rRzYE95dsqN15rv7okacsGJpSNtv6A5QyDSxOsXYKB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qpHbVJ6WimfCaUwF0FcF5aNcX4+HKiJFzvZghx/W/O6nRgENd8z4tLoAEKrKW+1DdN8fEHugr+QjYWKOHow2rx9T9/F+nBMgO/eink+Xx3nLHWXztdbrXejDQkMqbx1lUSfgLxXIszERrm+MKiXGAsqXgsIbq/ZrIUhiSkjRVco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=be79Ceip; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523A9uuO031419;
	Mon, 3 Mar 2025 13:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/A5hTENiBu6HWH+Nll002NAkm5mg5aAMGPNhwCyq8Wg=; b=be79CeipphQnuti0
	eEXAx7YntFPSRO4+IT7A83BccjaLdhFGYNLUS3AO2lwGlM0QrNZrO4p7eR1oVsop
	TDWNCJwNmLRxbNn3B1mai8Sy88mvEdfn+wKGYcKQD5N51jE9+jD1512YqdXgyFfU
	JxHGBIa2+vooUO079egA/rZCWwxrFE2nToxBc32NC4nzI6Ti4KIKWaguR+v24tUP
	PheOyAd4SUV2haqVRgK2+iG1xwTZfMKCEDsG0Eqh4rl8K7ZFk3wJIHu3g7mFQovR
	XOMVXaydVcoEy1iaQPsQ2S8R/vFs9a/G4cktu7RuzmJymfonl83f4tOPu7DJ95N3
	jIwGtA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453uh74q41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 13:12:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 523DCgWI007733
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 13:12:42 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Mar 2025
 05:12:39 -0800
Message-ID: <ba1e7a20-2f68-15e0-bc4a-fe52bc4036cc@quicinc.com>
Date: Mon, 3 Mar 2025 18:42:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 0/2] venus driver fixes to avoid possible OOB read
 access
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
 <c3b27e55-f627-417c-bb62-3189f248fb99@linaro.org>
 <7bf1aeaa-e1bd-412b-90fc-eda30b5f5b37@quicinc.com>
 <19109672-2856-457f-b1f6-305abc6c4434@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <19109672-2856-457f-b1f6-305abc6c4434@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IZoZLtLgfR3WMfodOcgW0ONGMJVU3Ybc
X-Proofpoint-ORIG-GUID: IZoZLtLgfR3WMfodOcgW0ONGMJVU3Ybc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030101


On 3/2/2025 9:26 PM, Bryan O'Donoghue wrote:
> On 02/03/2025 11:58, Vedang Nagar wrote:
>>>
>>> The basic question : what is the lifetime of the data from RX interrupt to
>>> consumption by another system agent, DSP, userspace, whatever ?
>> As mentioned in [1], With the regular firmware, after RX interrupt the data
>> can be considered as valid until next interrupt is raised, but with the rouge
>> firmware, data can get invalid during the second read and our intention is to
>> avoid out of bound access read because of such issues.
> 
> This is definitely the part I don't compute.
> 
> 1. RX interrupt
> 2. Frame#0 Some amount of time data is always valid
This is not correct. Its not the amount of time which determines the validity of
the data, its the possibility of rogue firmware which, if incase, puts up the
date in shared queue, would always be invalid, irrespective of time.

> 3. RX interrupt - new data
> 4. Frame#1 new data delivered into a buffer
> 
> Are you describing a case between RX interrupts 1-3 or a case after 1-4?
> 
> Why do we need to write code for rouge firmware anyway ?
It is a way to prevent any possibility of OOB, similar to how any API does check
for validity of any arguments passed to it, prior to processing.
> 
> And the real question - if the data can be invalidated in the 1-3 window above
> when is the safe time to snapshot that data ?
> 
> We seem to have alot of submissions to deal with 'rouge' firmware without I
> think properly describing the problem of the _expected_ data lifetime.
> 
> So
> 
> a) What is the expected data lifetime of an RX buffer between one
>    RX IRQ and the next ?
>    I hope the answer to this is - APSS owns the buffer.
>    This is BTW usually the case in these types of asymmetric setups
>    with a flag or some other kind of semaphore that indicates which
>    side of the data-exchange owns the buffer.
> 
> b) In this rouge - buggy - firmware case what is the scope of the
>    potential race condition ?
> 
>    What I'd really like to know here is why we have to seemingly
>    memcpy() again and again in seemingly incongrous and not
>    immediately obvious places in the code.
> 
>    Would we not be better advised to do a memcpy() of the entire
>    RX frame in the RX IRQ handler path if as you appear to me
>    suggesting - the firmware can "race" with the APSS
>    i.e. the data-buffer ownership flag either doesn't work
>    or isn't respected by one side in the data-exchange.
> 
> Can we please have a detailed description of the race condition here ?
Below is the report which the reporter reported leading to OOB, let me know if
you are unable to deduce the trail leading to OOB here.

OOB read issue is in function event_seq_changed, please reference below code
snippet:

Buggy code snippet:

static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
        struct hfi_msg_event_notify_pkt *pkt)
...
num_properties_changed = pkt->event_data2; //num_properties_changed is from
message and is not validated.
...
data_ptr = (u8 *)&pkt->ext_event_data[0];
do {
 ptype = *((u32 *)data_ptr);
 switch (ptype) {
 case HFI_PROPERTY_PARAM_FRAME_SIZE:
  data_ptr += sizeof(u32);
  frame_sz = (struct hfi_framesize *)data_ptr;
  event.width = frame_sz->width;
...
 }
 num_properties_changed--;
} while (num_properties_changed > 0);
```
There is no validation against `num_properties_changed = pkt->event_data2`, so
OOB read occurs.
> 
> I don't doubt the new memcpy() makes sense to you but without this detailed
> understanding of the underlying problem its virtually impossible to debate the
> appropriate remediation - perhaps this patch you've submitted - or some other
> solution.
> 
> Sorry to dig into my trench here but, way more detail is needed.
> 
>> [1]: https://lore.kernel.org/lkml/4cfc1fe1-2fab-4256-9ce2-
>> b4a0aad1069e@linaro.org/T/#m5f1737b16e68f8b8fc1d75517356b6566d0ec619
>>>
>>> Why is it in this small specific window that the data can change but not
>>> later ? What is the mechanism the data can change and how do the changes you
>>> propose here address the data lifetime problem ?
>> Currently this issue has been discovered by external researchers at this
>> point, but if any such OOB issue is discovered at later point as well then we
>> shall fix them as well.
> 
> Right but, I'm looking for a detailed description of the problem.
> 
> Can you describe from RX interrupt again what the expected data lifetime of the
> RX frame is, which I hope we agree is until the next RX interrupt associated
> with a given buffer with an ownership flag shared between firmware and APSS -
> and then under what circumstances that "software contract" is being violated.
> 
>> Also, with rougue firmware we cannot fix the data lifetime problem in my
>> opinion, but atleast we can fix the out of bound issues.
>>>
>>> Without that context, I don't believe it is really possible to validate an
>>> additional memcpy() here and there in the code as fixing anything.
>> There is no additional memcpy() now in the v2 patch, but as part of the fix,
>> we are just trying to retain the length of the packet which was being read in
>> the first memcpy() to avoid the OOB read access.
> 
> I can't make a suggestion because - personally speaking I still don't quite
> understand the data-race you are describing.
Go through the reports from the reporter, it was quite evident in leading upto
OOB case.
Putting up the sequence for you to go over the interrupt handling and message
queue parsing of the packets from firmware
1.
https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/media/platform/qcom/venus/hfi_venus.c#L1082
2.
https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/media/platform/qcom/venus/hfi_msgs.c#L816
3. event handling (this particular case)
https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/media/platform/qcom/venus/hfi_msgs.c#L658
4.
https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/media/platform/qcom/venus/hfi_msgs.c#L22

the "struct hfi_msg_event_notify_pkt *pkt" pkt here is having the data read from
shared queue.

> 
> I get that you say the firmware is breaking the contract but, without more
> detail on _how_ it breaks that contract I don't think it's really possible to
> validate your fix here, fixes anything.
> 
> ---
> bod

Regards,
Vikash

