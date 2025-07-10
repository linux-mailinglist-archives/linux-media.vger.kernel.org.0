Return-Path: <linux-media+bounces-37269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E3AFFCFB
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 10:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FF411C86D57
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 08:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1328528E5E6;
	Thu, 10 Jul 2025 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DXobjUdh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6309E28DF0F;
	Thu, 10 Jul 2025 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137757; cv=none; b=fX5cYQ81VmJZdG7B9qrO6vwRPlWUxjZSbvuGiR292Lu3g3ihOBrdsm10w+3KBBXb8tkF/fjFAAAc3C2Ewn6yQb1XXJ4hxoVyqE9ELkPWHWccnJi/0xW8qAcOAyhNF0DpQj5XRwEA2I2ao8GT1i2vAou+GJqupYtW/eHrXhS2HnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137757; c=relaxed/simple;
	bh=2ta2eZl1fMMsCqmW4VZnYmLNDmkLTRZBsKFzYUb4hDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BJqStQG+RhWB7MYUtuem0nTyUft59EHK78GEcsHOFBCyobFyMNXiGkps+fZJQAIGxpn5c11J8d8tCBbny5sNxQGgX6wN+/o+c2OiArsPWF8crQ+Ws7Q/+tE6k0Zvs0qremUCApjg2hAoLqMUb3u7/iy4VFiRsbX3+y/jrDrf9hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DXobjUdh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A0G58h012459;
	Thu, 10 Jul 2025 08:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoUDVSez8y8lC1Edtv6vomRCjdGeeZziTBQod4cqaL8=; b=DXobjUdhCrTis/os
	EjhXcnC6UnqrAHwjo56UvsV6waYlG+K583kFt5cMDByDfmPgeD79yH04e43d2yyr
	NLBFw58fB7scF1HNTbANwqbg4dxo4UYXS5bQtdQT6FxUqUjtdZbDiT/Hiq4KEChf
	3mesa6PKLeLkH8pJa4AV1PtW1jKBWCFS5/4cuG8tuvCIMqSMRBFEzrMvm3JMoD2I
	VNDBzjssttrtzYvaZ5TW4D5AbwIwJj7c48/tLDEfPpnZ5Rts3BbAB1jqU8qcKz6d
	k9sRr7X+UmnnYjdhQ7nkDFP/Bv25ogMaT3QDSvthOt5I8DFzFla0g1QoCjIQOw/m
	NubqKQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn7sxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:55:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A8tnlW013714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:55:49 GMT
Received: from [10.204.100.36] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 10 Jul
 2025 01:55:45 -0700
Message-ID: <55125121-5349-3b8b-2e81-29eec95d8337@quicinc.com>
Date: Thu, 10 Jul 2025 14:25:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 2/5] media: venus: vdec: AR50_LITE video core support
Content-Language: en-US
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
CC: <krzk+dt@kernel.org>, <bryan.odonoghue@linaro.org>,
        <quic_vgarodia@quicinc.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-3-jorge.ramirez@oss.qualcomm.com>
 <c0e8460d-1c94-d398-38a0-f63395256f27@quicinc.com> <aF62Msej5LvY51D6@trex>
 <8c7232a3-8c49-d77e-e8e4-6d86a33e2b42@quicinc.com> <aG1uINWPwvl505zG@trex>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <aG1uINWPwvl505zG@trex>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686f8016 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=2vAVLMtbNmCXBqtmqXEA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jjOCHvtZkpOqGb27fq0AfEzQ5zEc6dLd
X-Proofpoint-ORIG-GUID: jjOCHvtZkpOqGb27fq0AfEzQ5zEc6dLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3NiBTYWx0ZWRfXyAlgXqOIoaf9
 4t2eJga5m0jhrx/JTt7qnSw8As494AIdoyI0WkMe7B0x8IdfDyErFPoBaPONLPX25f+OLBEPyjZ
 WbJLpDvjhk65008bwED/Cm0qNiq237CcXfv7ot0ec4R/IHB0KMzojxAhYhqKqF0bxLFDzztX+OD
 AL6Rp6g3qCUbqXKXhtyfyYMw8sn8bsv4sjhFmuia4W9rM/YysniHz0g1ueqgUqra4dRJK6Oilgj
 unDZCXliQQPi8Lw5M+EEgWpeEcnM7SqokoVDuzmkt29mhO0ispjXqKEkimOEECejQBSxlKnxlIj
 uDMEOZRdsgmhkE0KSw5ld/Yb/8uwT9JIheX0+WmB90xhgShl5NjU6V6Xmi7BfOQMz1Et8clPc6Z
 4nBnHkhJyvAQ34G6XZCijxiskynuU70AtUsARH82aUfkjJpelmQonHrnIqj1By1B/VB8UAqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100076



On 7/9/2025 12:44 AM, Jorge Ramirez wrote:
> On 30/06/25 12:17:32, Dikshita Agarwal wrote:
>>
>>
>> On 6/27/2025 8:48 PM, Jorge Ramirez wrote:
>>> On 27/06/25 18:17:27, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
>>>>> The AR50_LITE is a streamlined variant of the AR50 video core, designed
>>>>> for power and cost-efficient platforms.
>>>>>
>>>>> It supports hardware-accelerated decoding of H.264, HEVC, and VP9
>>>>> formats.
>>>>>
>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> ---
>>>>>  drivers/media/platform/qcom/venus/core.c      | 11 ++-
>>>>>  drivers/media/platform/qcom/venus/core.h      | 11 ++-
>>>>>  drivers/media/platform/qcom/venus/firmware.c  |  8 +-
>>>>>  drivers/media/platform/qcom/venus/helpers.c   | 80 +++++++++++++++++++
>>>>>  drivers/media/platform/qcom/venus/helpers.h   |  2 +
>>>>>  .../media/platform/qcom/venus/hfi_helper.h    | 10 ++-
>>>>>  drivers/media/platform/qcom/venus/hfi_venus.c | 14 ++--
>>>>>  .../media/platform/qcom/venus/pm_helpers.c    |  1 +
>>>>>  drivers/media/platform/qcom/venus/vdec.c      | 15 ++--
>>>>>  9 files changed, 128 insertions(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>>>> index d305d74bb152..736ef53d988d 100644
>>>>> --- a/drivers/media/platform/qcom/venus/core.c
>>>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>>>> @@ -254,14 +254,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
>>>>>  
>>>>>  static void venus_assign_register_offsets(struct venus_core *core)
>>>>>  {
>>>>> -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
>>>>> -		core->vbif_base = core->base + VBIF_BASE;
>>>>> +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
>>>>>  		core->cpu_base = core->base + CPU_BASE_V6;
>>>>>  		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
>>>>>  		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
>>>>>  		core->wrapper_base = core->base + WRAPPER_BASE_V6;
>>>>>  		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
>>>>> -		core->aon_base = core->base + AON_BASE_V6;
>>>>> +		if (IS_AR50_LITE(core)) {
>>>>> +			core->vbif_base = NULL;
>>>>> +			core->aon_base = NULL;
>>>>> +		} else {
>>>>> +			core->vbif_base = core->base + VBIF_BASE;
>>>>> +			core->aon_base = core->base + AON_BASE_V6;
>>>>> +		}
>>>>>  	} else {
>>>>>  		core->vbif_base = core->base + VBIF_BASE;
>>>>>  		core->cpu_base = core->base + CPU_BASE;
>>>>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>>>>> index b412e0c5515a..e755a28e919b 100644
>>>>> --- a/drivers/media/platform/qcom/venus/core.h
>>>>> +++ b/drivers/media/platform/qcom/venus/core.h
>>>>> @@ -382,6 +382,7 @@ enum venus_inst_modes {
>>>>>   * @lock:	instance lock
>>>>>   * @core:	a reference to the core struct
>>>>>   * @clk_data:	clock data per core ID
>>>>> + * @eosbufs:	a lit of EOS buffers
>>>>>   * @dpbbufs:	a list of decoded picture buffers
>>>>>   * @internalbufs:	a list of internal bufferes
>>>>>   * @registeredbufs:	a list of registered capture bufferes
>>>>> @@ -450,6 +451,7 @@ struct venus_inst {
>>>>>  	struct mutex lock;
>>>>>  	struct venus_core *core;
>>>>>  	struct clock_data clk_data;
>>>>> +	struct list_head eosbufs;
>>>>>  	struct list_head dpbbufs;
>>>>>  	struct list_head internalbufs;
>>>>>  	struct list_head registeredbufs;
>>>>> @@ -520,7 +522,14 @@ struct venus_inst {
>>>>>  #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
>>>>>  #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
>>>>>  #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
>>>>> -#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
>>>>> +static inline bool IS_V6(struct venus_core *core)
>>>>> +{
>>>>> +	if (WARN_ON_ONCE(!core))
>>>>> +		return false;
>>>>> +
>>>>> +	return core->res->hfi_version == HFI_VERSION_6XX ||
>>>>> +	       core->res->hfi_version == HFI_VERSION_6XX_LITE;
>>>>> +}
>>>> It should be HFI_VERSION_4XX_LITE for AR50_LITE. 4XX represents SC7280 and
>>>> SDM845 which are AR50.
>>>
>>> ah good information - where is this documented? I never found this
>>> information... I'd appreciate if you could confirm with some document
>>> for future reference.
>>>
>>>>>  
>>>>>  #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
>>>>>  #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
>>>>> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
>>>>> index 66a18830e66d..f8dcef0426ac 100644
>>>>> --- a/drivers/media/platform/qcom/venus/firmware.c
>>>>> +++ b/drivers/media/platform/qcom/venus/firmware.c
>>>>> @@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
>>>>>  	u32 fw_size = core->fw.mapped_mem_size;
>>>>>  	void __iomem *wrapper_base;
>>>>>  
>>>>> -	if (IS_IRIS2_1(core))
>>>>> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
>>>>>  		wrapper_base = core->wrapper_tz_base;
>>>>>  	else
>>>>>  		wrapper_base = core->wrapper_base;
>>>>> @@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
>>>>>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
>>>>>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
>>>>>  
>>>>> -	if (IS_IRIS2_1(core)) {
>>>>> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
>>>>>  		/* Bring XTSS out of reset */
>>>>>  		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
>>>>>  	} else {
>>>>> @@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>>>>>  	if (resume) {
>>>>>  		venus_reset_cpu(core);
>>>>>  	} else {
>>>>> -		if (IS_IRIS2_1(core))
>>>>> +		if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
>>>>>  			writel(WRAPPER_XTSS_SW_RESET_BIT,
>>>>>  			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>>>>>  		else
>>>>> @@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>>>>>  	void __iomem *wrapper_base = core->wrapper_base;
>>>>>  	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
>>>>>  
>>>>> -	if (IS_IRIS2_1(core)) {
>>>>> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
>>>>>  		/* Assert the reset to XTSS */
>>>>>  		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>>>> No need to handle no-tz case. Pls drop.
>>>
>>> ok
>>>
>>>>>  		reg |= WRAPPER_XTSS_SW_RESET_BIT;
>>>>> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
>>>>> index 8295542e1a7c..812bec9a05be 100644
>>>>> --- a/drivers/media/platform/qcom/venus/helpers.c
>>>>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>>>>> @@ -230,6 +230,79 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
>>>>>  }
>>>>>  EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
>>>>>  
>>>>> +static void free_eos_buf(struct venus_inst *inst, struct intbuf *buf)
>>>>> +{
>>>>> +	list_del_init(&buf->list);
>>>>> +	dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
>>>>> +		       buf->attrs);
>>>>> +	kfree(buf);
>>>>> +}
>>>>> +
>>>>> +int venus_helper_free_eos_bufs(struct venus_inst *inst)
>>>>> +{
>>>>> +	struct intbuf *buf, *n;
>>>>> +
>>>>> +	list_for_each_entry_safe(buf, n, &inst->eosbufs, list) {
>>>>> +		free_eos_buf(inst, buf);
>>>>> +	}
>>>>> +
>>>>> +	if (list_empty(&inst->eosbufs))
>>>>> +		INIT_LIST_HEAD(&inst->eosbufs);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(venus_helper_free_eos_bufs);
>>>>> +
>>>>> +int venus_helper_alloc_eos_buf(struct venus_inst *inst,
>>>>> +			       struct hfi_frame_data *data)
>>>>> +{
>>>>> +	struct venus_core *core = inst->core;
>>>>> +	struct device *dev = core->dev;
>>>>> +	struct intbuf *buf;
>>>>> +	int ret = 0;
>>>>> +
>>>>> +	memset(data, 0, sizeof(*data));
>>>>> +
>>>>> +	data->buffer_type = HFI_BUFFER_INPUT;
>>>>> +	data->flags = HFI_BUFFERFLAG_EOS;
>>>>> +
>>>>> +	if (IS_AR50_LITE(inst->core)) {
>>>>> +		/* We must send valid sizes and addresses */
>>>>> +		buf = kzalloc(sizeof(*buf), GFP_KERNEL);
>>>>> +		if (!buf) {
>>>>> +			ret = -ENOMEM;
>>>>> +			goto fail;
>>>>> +		}
>>>>> +
>>>>> +		buf->type = HFI_BUFFER_INPUT;
>>>>> +		buf->size = SZ_4K;
>>>>> +		buf->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
>>>>> +		buf->va = dma_alloc_attrs(dev, buf->size, &buf->da, GFP_KERNEL,
>>>>> +					  buf->attrs);
>>>>> +		if (!buf->va) {
>>>>> +			ret = -ENOMEM;
>>>>> +			goto fail;
>>>>> +		}
>>>>> +
>>>>> +		list_add_tail(&buf->list, &inst->eosbufs);
>>>>> +
>>>>> +		data->alloc_len = buf->size;
>>>>> +		data->device_addr = buf->da;
>>>>> +
>>>> why this special handling for eos buffer is needed for AR50_LITE?
>>>
>>> this _fix_ was develope through testing: without it there is no EOS and
>>> errors are reporting upon killing the player
>>>
>> Would be better to see why there is no EOS from firmware,
>> there shouldn't be the need to have a dma allocation for this dummy
>> buffers, as there is no useful info in the buffer. Having the device
>> address as 0 or 0xdeadb000 should be enough.
>>
> 
> hi dikshita,
> 
> I am still keeping this on v6 as per our internal discussions and
> because v6 is quite different from v5 so wanted to provide early access
> to users.
> 
> if the firwmare is fixed to address this issue on time, I might revert
> the EOS page buffer. 
> 
I'd prefer to resolve this via correct EOS handling or gain clarity on why
AR50_LITE requires special treatment, instead of proceeding with new patch
sets built around this design.

Thanks,
Dikshita
> TIA
> jorge

