Return-Path: <linux-media+bounces-54395-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC4UGdk0p2k9fwAAu9opvQ
	(envelope-from <linux-media+bounces-54395-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 20:22:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BBF1F5EAD
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 20:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 044EE31C903A
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 19:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3279E396598;
	Tue,  3 Mar 2026 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMV6qzmv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8oWBThu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA50F396575
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 19:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772565401; cv=none; b=Qw05e7kYrdfVcCo9fUxffAJ0xELETET82Qd0iFYg+M3BfcoKjVmELutoAdr01GeQU5x1RIDt24V/2/gXQX8YpRkaxknaJsInLuXvhssD7WRltqCxGu5URa69ecTRBHsE1pd5Y0t6loNPL92sKHnNh9tbKaWNIjNEhuH/rL7+tTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772565401; c=relaxed/simple;
	bh=UBT35nY6GKDuTiVu0BhklVZrCznrQJ6RhL3ZL2qeeC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8Oyumm29hF0ZPquYhRwapZsm+SETKfq3BO28v+k/Cjxtnp1U76o7+drO+aWupkpju5JkwUi+m7W+cuXTLt6g6a5caM5lQNq58oFSOBd3l/LLGGV7KLfMMtrEGnPd/aBJXhE/qsrCDmqT1kDEfUDzLC3VBUZZzIzrzijyYEYawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMV6qzmv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8oWBThu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0jUM087572
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 19:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7nDgycG81om+0Zg7sH3cMCeC5SiOTz3dDIdtVP2WdE=; b=jMV6qzmv88L4Gclk
	Z0mXv+HV8iC6NeCTEmk8swqIFfwdsbXZsolgxP30irqEM7mMgTPJDC6RMPQiv1jX
	YJJ3cTfKBc1gMXic8P17HCmv0sjUs0V0Nr+Scejq4sOWxo8ggZwZe8GLkiIT+F6H
	4BcgdH4ngc8Uv5ONrcj9w7h5FDtnb89Ng/2r5yLZ45Eaa3mO2ArTnEZPGCGn+kup
	+CnxnQXLRzM0PGN1z3QF7v3MrPpt4cXNQuiv1DLrC8Z2aJXh/GXqitmaSpYG2qhh
	H9rH8g4TkAbpvDap0aSDaesc5tYeDVk59bSJ/RxaRbcCe8YVOIUdkK4VvwmLGQFk
	X+IHfQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsc5jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 19:16:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82740181631so2424153b3a.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 11:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772565397; x=1773170197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7nDgycG81om+0Zg7sH3cMCeC5SiOTz3dDIdtVP2WdE=;
        b=X8oWBThuDvdYeOIwwRWkC6M0NLkcZqdEmK6rf6Bi7lkuJBP81zt7pqlLBQiNNCM27w
         rXqDn+6lKku7TzmWO2uhx+KpkT0q1PeMzPxFzq4ooPCtUwr9Tp3j1fhv3I1ruKboKpIP
         F5CuQoae0OMMpR6Me782/V29i1HUeVPQKNBcYD+cb1oli9S9LFHGfP9FHVRnQFboMv6G
         XmuHllto6pYJHawNIu4yzyyDdO/Rr/Pqnhe6OVO2h7wL5ATRVEizAQj1GnZjmlNucgIv
         /IDjn3XTRnH8r/RGroJDYcY+HQ6IYsfUXbrwfai/ZmZp6UQJHud5xakT2KZbk6TAyxCk
         /ClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772565397; x=1773170197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7nDgycG81om+0Zg7sH3cMCeC5SiOTz3dDIdtVP2WdE=;
        b=j0ECA/vRY2IPK4Rz6HMAbL0S8YCojocSSHT2Sus0KsoJlwwsMHci6uJiCMnVGl7wSD
         r2UEjBPoWTEIQxI1ENykGTNCjjW6mZf6mCEqKgGjNGY84rFNnxzV2tBo9e898MMLkFtH
         AHB9MY5DFfSYIPljqGAf6HZeqTeUN/cMze5xF3s28g81iv+R3blE5/2ZB1GiDeHpQYMY
         yAjomOTzPpXvRb1fuJiIQdNyF7EPx/YhsRtHfxIDpIzQ7gdAU7kmLQbz0NCH07W/bt+e
         HCSy6ozZJRKPi70GOBpITWDaCBh8yRsdTtUeNjxEPCkX4aKLSYA1wBQU9yXPLfjkNmQW
         vWOg==
X-Forwarded-Encrypted: i=1; AJvYcCVCPoSK7hX+kIwJDruYkBiWvnTP6lalZqtaaJIvcP/Nkwi6cT6rXuq3MX2CHaRirkWGxVfvF1QXjcm4+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsr9zoNc2VYA2ZTNoFI+obiAw71VCTUfWTcAy3arsuMrOwW7ZT
	oAffkIeF4C/OjNQfM277ng/caFI1jgGpqZ8aa5DTYIrp7zR4WTjXaDgWPW9flSQlT1bir/YGGI1
	k4N+zeugfNFfip3sWkNMB/X61a0jKaDWdn2eN6q6cXG7R1XeOetHSz6FS1MPjk7lCCA==
X-Gm-Gg: ATEYQzyXJHD1HenuMuLzP+pYqr8Shpi7VZxKyJA+KB7UZ3HjdToqDwsMHzSL6J5zrUI
	rxG0B0b6qDmSfMGtXxqfTfuxQO0S0zS3lixD2Xjc0edO/wQdO6klQ4gDtkwnwytWSNbrtkbBhuc
	Q/nTZB61vhTHdDd16EBI+gmPjrudT0okMwMqz/8skBV+TWAy5OahifdWM9vD5En38BCQLCV5nsa
	4rNxB7wNTTqecHXqeCNXgnzqm5umDdA1yXWn7vvqNQYv2IEQKK1kLI0MoBpMIYorunvznt6/G8s
	bxvx5AXCQdU9p7KcrRKAj3FWIW0j3PCBjXvwmex+Oz3OsZEWmez6oI8J5ZVlhp5OwNQwKpLubE5
	jLaad8Kbjmcgt8ieWcFNEGYb1jbV+wrr1Rym5xPVWeX2Mm1Mmbjnx5Hg=
X-Received: by 2002:a05:6a00:4214:b0:81f:4675:c2a6 with SMTP id d2e1a72fcca58-8274d93b0a7mr15489761b3a.2.1772565397219;
        Tue, 03 Mar 2026 11:16:37 -0800 (PST)
X-Received: by 2002:a05:6a00:4214:b0:81f:4675:c2a6 with SMTP id d2e1a72fcca58-8274d93b0a7mr15489736b3a.2.1772565396593;
        Tue, 03 Mar 2026 11:16:36 -0800 (PST)
Received: from [192.168.0.172] ([49.205.248.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01aa09sm19638827b3a.48.2026.03.03.11.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 11:16:36 -0800 (PST)
Message-ID: <1dc86b00-9a18-482c-94b1-96692c1dd530@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 00:46:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] media: iris: add helper to select context bank
 device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-5-850043ac3933@oss.qualcomm.com>
 <bi3i37ho3ppzlgdx264ohxpcem3nwumjelzckf4x5uzdj5rt7a@2y2jrilmfimj>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <bi3i37ho3ppzlgdx264ohxpcem3nwumjelzckf4x5uzdj5rt7a@2y2jrilmfimj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: th92jpgoa1X9nw5QO9hWa8G3mJ_9_SV1
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a73396 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=KPiuay1jFzAquJblYynD6w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zVNvaYjD9Rq9sQCc3cMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: th92jpgoa1X9nw5QO9hWa8G3mJ_9_SV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE1NiBTYWx0ZWRfX1YXaSI2O/wzr
 ctz/SKmokCPp/wT+112XuoU73hJocWwyPVO0B5Bpp8gmkzpR7SUVWXpTRZ+Bw9XX2FnsbnRJWrb
 0Tad8NjcNAOXmcBNklLsysmoGxHGYys7P2PAJzAxwguytjggf8NEa/M++jIM8BjbKZ2KIOpCLQQ
 XdEF3KmUNj51GP44w9xyvmidYzVc1eQZ0a54d1tjTPUNQq0Zi7oqlXexDjQ66TdeWNk7Dlhg5FA
 c4rGACUIj2fGj7TKElroNJFJWFX4FoC1d5ytNWM8WW9KrUWxzTMzT9M+SMFFCHot84XxCZt9ert
 /7s9V2FbMHaT7bws5ZNRhrN+316wTNMCqOvKPHy6Y2j9bx8JcvQ6CLFuGI8de2RYO0w1XZFGgt1
 Q3tNBFZO+hHxAEDibIgNCLNi/bSe4UqH/h3Qc4dZ04rvifrdPP2obr1dzB7r2/QzJpCcnhOcjxL
 FKE+RoE1EN3FGH71OAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030156
X-Rspamd-Queue-Id: 94BBF1F5EAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54395-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/28/2026 1:57 AM, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 07:41:21PM +0530, Vikash Garodia wrote:
>> Depending on the buffer type (input, output, internal and interface
>> queues), associated context bank is selected, if available. Fallback to
>> parent device for backward compatibility.
>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c    |  7 +--
>>   drivers/media/platform/qcom/iris/iris_buffer.h    |  2 +
>>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++---
>>   drivers/media/platform/qcom/iris/iris_resources.c | 60 +++++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_resources.h |  2 +
>>   drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +-
>>   6 files changed, 79 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index 9151f43bc6b9c2c34c803de4231d1e6de0bec6c4..95962c19c334f08a74c5b7e8ba978ab631a65e9c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -335,8 +335,8 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
>>   static int iris_create_internal_buffer(struct iris_inst *inst,
>>   				       enum iris_buffer_type buffer_type, u32 index)
>>   {
>> +	struct device *dev = iris_get_cb_dev(inst->core, inst, buffer_type);
>>   	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>> -	struct iris_core *core = inst->core;
>>   	struct iris_buffer *buffer;
>>   
>>   	if (!buffers->size)
>> @@ -352,7 +352,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
>>   	buffer->buffer_size = buffers->size;
>>   	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
>>   
>> -	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
>> +	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
>>   					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
>>   	if (!buffer->kvaddr) {
>>   		kfree(buffer);
>> @@ -490,9 +490,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
>>   int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>>   {
>>   	struct iris_core *core = inst->core;
>> +	struct device *dev = iris_get_cb_dev(core, inst, buffer->type);
>>   
>>   	list_del(&buffer->list);
>> -	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
>> +	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
>>   		       buffer->device_addr, buffer->dma_attrs);
>>   	kfree(buffer);
>>   
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
>> index 75bb767761824c4c02e0df9b765896cc093be333..9520aa290b44f06ed2004ad89940c19d1c08a3d2 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
>> @@ -28,6 +28,7 @@ struct iris_inst;
>>    * @BUF_SCRATCH_2: buffer to store encoding context data for HW
>>    * @BUF_VPSS: buffer to store VPSS context data for HW
>>    * @BUF_PARTIAL: buffer for AV1 IBC data
>> + * @BUF_HFI_QUEUE: buffer for hardware firmware interface queue
> 
> Separate commit?

sure, introducing the HFI_QUEUE buffer type can be made into a separate 
patch.

> 
>>    * @BUF_TYPE_MAX: max buffer types
>>    */
>>   enum iris_buffer_type {
>> @@ -44,6 +45,7 @@ enum iris_buffer_type {
>>   	BUF_SCRATCH_2,
>>   	BUF_VPSS,
>>   	BUF_PARTIAL,
>> +	BUF_HFI_QUEUE,
>>   	BUF_TYPE_MAX,
>>   };
>>   
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> index b3ed06297953b902d5ea6c452385a88d5431ac66..c1241fb8dc6519020a063cbba87aed665701d7ae 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> @@ -245,25 +245,26 @@ static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
>>   
>>   int iris_hfi_queues_init(struct iris_core *core)
>>   {
>> +	struct device *dev = iris_get_cb_dev(core, NULL, BUF_HFI_QUEUE);
>>   	struct iris_hfi_queue_table_header *q_tbl_hdr;
>>   	u32 queue_size;
>>   
>>   	/* Iris hardware requires 4K queue alignment */
>>   	queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ)), SZ_4K);
>> -	core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
>> +	core->iface_q_table_vaddr = dma_alloc_attrs(dev, queue_size,
>>   						    &core->iface_q_table_daddr,
>>   						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>>   	if (!core->iface_q_table_vaddr) {
>> -		dev_err(core->dev, "queues alloc and map failed\n");
>> +		dev_err(dev, "queues alloc and map failed\n");
>>   		return -ENOMEM;
>>   	}
>>   
>> -	core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
>> +	core->sfr_vaddr = dma_alloc_attrs(dev, SFR_SIZE,
>>   					  &core->sfr_daddr,
>>   					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>>   	if (!core->sfr_vaddr) {
>> -		dev_err(core->dev, "sfr alloc and map failed\n");
>> -		dma_free_attrs(core->dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
>> +		dev_err(dev, "sfr alloc and map failed\n");
>> +		dma_free_attrs(dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
>>   			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
>>   		return -ENOMEM;
>>   	}
>> @@ -291,6 +292,7 @@ int iris_hfi_queues_init(struct iris_core *core)
>>   
>>   void iris_hfi_queues_deinit(struct iris_core *core)
>>   {
>> +	struct device *dev = iris_get_cb_dev(core, NULL, BUF_HFI_QUEUE);
>>   	u32 queue_size;
>>   
>>   	if (!core->iface_q_table_vaddr)
>> @@ -300,7 +302,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
>>   	iris_hfi_queue_deinit(&core->message_queue);
>>   	iris_hfi_queue_deinit(&core->command_queue);
>>   
>> -	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
>> +	dma_free_attrs(dev, SFR_SIZE, core->sfr_vaddr,
>>   		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
>>   
>>   	core->sfr_vaddr = NULL;
>> @@ -309,7 +311,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
>>   	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
>>   		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
>>   
>> -	dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
>> +	dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
>>   		       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
>>   
>>   	core->iface_q_table_vaddr = NULL;
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>> index be58e8620086d0f82c2c2bda29247483f5c56d79..65544cb0fa8fc4b250b0a0be1bb900d74b999d35 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/reset.h>
>>   
>>   #include "iris_core.h"
>> +#include "iris_instance.h"
>>   #include "iris_resources.h"
>>   
>>   #define BW_THRESHOLD 50000
>> @@ -177,3 +178,62 @@ int iris_create_child_device_and_map(struct iris_core *core, struct iris_context
>>   
>>   	return 0;
>>   }
>> +
>> +static enum iris_buffer_region iris_get_region(struct iris_inst *inst,
>> +					       enum iris_buffer_type buffer_type)
>> +{
>> +	switch (buffer_type) {
>> +	case BUF_INPUT:
>> +		if (inst && inst->domain == ENCODER)
> 
> Can inst be NULL here?

during queues init/deinit, instances are not created.

> 
>> +			return IRIS_PIXEL_REGION;
>> +		else if (inst && inst->domain == DECODER)
>> +			return IRIS_BITSTREAM_REGION;
> 
> Are there any other possibilities than encoder and decoder?

will simplify it as

if (inst) {
     if (inst->domain == ENCODER)
         return IRIS_PIXEL_REGION;
     else
         return IRIS_BITSTREAM_REGION;
}
> 
>> +		break;
>> +	case BUF_OUTPUT:
>> +		if (inst && inst->domain == ENCODER)
>> +			return IRIS_BITSTREAM_REGION;
>> +		else if (inst && inst->domain == DECODER)
>> +			return IRIS_PIXEL_REGION;
>> +		break;
>> +	case BUF_BIN:
>> +		return IRIS_BITSTREAM_REGION;
>> +	case BUF_DPB:
>> +	case BUF_PARTIAL:
>> +	case BUF_SCRATCH_2:
>> +	case BUF_VPSS:
>> +		return IRIS_PIXEL_REGION;
>> +	case BUF_ARP:
>> +	case BUF_COMV:
>> +	case BUF_HFI_QUEUE:
>> +	case BUF_LINE:
>> +	case BUF_NON_COMV:
>> +	case BUF_PERSIST:
>> +		return IRIS_NON_PIXEL_REGION;
>> +	default:
>> +		return 0;
> 
> dev_err(dev, "unsupported buffer type %x\n", buffer_type)
> return -EINVAL;

these are bit fields, returning -EINVAL would still match some bits and 
can make the logic as true. 0 can be defined as IRIS_UNKNOWN_REGION

> 
>> +	}
>> +
>> +	return 0;
> 
> Drop
> 

Ack

>> +}
>> +
>> +struct device *iris_get_cb_dev(struct iris_core *core, struct iris_inst *inst,
>> +			       enum iris_buffer_type buffer_type)
>> +{
>> +	enum iris_buffer_region region;
>> +	struct device *dev = NULL;
>> +	int i;
>> +
>> +	region = iris_get_region(inst, buffer_type);
>> +
>> +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
>> +		if (core->iris_platform_data->cb_data[i].region & region) {
>> +			dev = core->iris_platform_data->cb_data[i].dev;
>> +			break;
>> +		}
> 
> You really seem to overcomplicate things. Replace array search with the
> indexed array access. Much easier and much better.
> 
> enum iris_buffer_region {
> 	IRIS_PIXEL_REGION,
> 	IRIS_BITSTREAM_REGION,
> 	IRIS_NON_PIXEL_REGION,
> 	// add more when necessary
> 	IRIS_NUM_REGIONS,
> };
> 
> struct iris_core {
> 	struct iris_cb_device cb_devices[IRIS_NUM_REGIONS];
> };
> 
> region = iris_get_region(inst, buffer_type);
> dev = core->cb_devices[region];

all the regions may/may not be present in all SOC

> if (!dev)
> 	dev = core->dev;
> 
> 
>> +	}
>> +
>> +	if (!dev)
>> +		dev = core->dev;
>> +
>> +	return dev;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
>> index b7efe15facb203eea9ae13d5f0abdcc2ea718b4d..ea31726f1789130fccf6b24540a62b86cb3c36ac 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.h
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
>> @@ -16,5 +16,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>>   int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>   int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>   int iris_create_child_device_and_map(struct iris_core *core, struct iris_context_bank *cb);
>> +struct device *iris_get_cb_dev(struct iris_core *core, struct iris_inst *inst,
>> +			       enum iris_buffer_type buffer_type);
>>   
>>   #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index bd38d84c9cc79d15585ed5dd5f905a37521cb6dc..b61d7941d88662f34a9d2ab3b6c5bd9acf4b5df5 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -107,7 +107,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>   	src_vq->drv_priv = inst;
>>   	src_vq->buf_struct_size = sizeof(struct iris_buffer);
>>   	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
>> -	src_vq->dev = inst->core->dev;
>> +	src_vq->dev = iris_get_cb_dev(inst->core, inst, BUF_INPUT);
>>   	src_vq->lock = &inst->ctx_q_lock;
>>   	ret = vb2_queue_init(src_vq);
>>   	if (ret)
>> @@ -121,7 +121,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>   	dst_vq->drv_priv = inst;
>>   	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
>>   	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
>> -	dst_vq->dev = inst->core->dev;
>> +	dst_vq->dev = iris_get_cb_dev(inst->core, inst, BUF_OUTPUT);
>>   	dst_vq->lock = &inst->ctx_q_lock;
>>   
>>   	return vb2_queue_init(dst_vq);
>>
>> -- 
>> 2.34.1
>>
> 


