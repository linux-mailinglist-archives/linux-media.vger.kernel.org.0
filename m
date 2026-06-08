Return-Path: <linux-media+bounces-64124-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J3AzGLtVJmoTVAIAu9opvQ
	(envelope-from <linux-media+bounces-64124-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:40:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB96652DC6
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:40:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZW08KphT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Sd1MZgG6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64124-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64124-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2C39300406B
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 05:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B501E379C20;
	Mon,  8 Jun 2026 05:39:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DB235DA40
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 05:39:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897189; cv=none; b=BOEy/tJGGaOngRVAiw+/9UZvsXoHQHQSyfuGyx2eHoiWUY/oqn/DCdjMtTDaZ40s93BJN+96T+kWgJ6OOJfLulRcUmF7nS6ufGB7favBQZV7eQcPKRirXJR88eXHiC9+BWljxch7GHvtxPIdHqbV4/6NMhmHnyLC3QnIdODPQaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897189; c=relaxed/simple;
	bh=JpoZHFk7B+FNKCUvCv8J0gju7j04clYLRSjUZtit+yk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=u4Dji27HyzHNGdgJS9VQfGGGEwof/vyEM3AoEPdV/nvoOFWrmawdJjOQ8ADRbVRN4zYhdYopoSYEwsnv5+auPvtVCWU6ay2d8Ze5wF0edl1xY4se2TkgAsPZPWCCsuweSSg+GeiWDWYq7ygrNIAWCG/Ku53KfNvQM3R+92odEYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZW08KphT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sd1MZgG6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580ENq41511230
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 05:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LumdMRl3N4whwwMsWXm6IkVbxduPsWVFlMKwRHEwLo=; b=ZW08KphTphXnC36N
	GUzk0MrtCx+iw/2JCZfN8FeZf0/NRqINvL6ngXFroi7t+Un5TeQiztt/Ec/wUHX5
	0yoSUJSPjHuJf/8M1nl9nP1gPUnJpFGHnZsHEO4zPA5P6bmP6oAN8LHpitWK8b7w
	rI3XvkKgLtyeLzoj2MWCuNCpxp+cWud0aO/UbNqwXc9jPjClzRSpTlbhqu3Pvos5
	WiifpslfGwVriPt9ZRIAvt/n8t1ZKvdaXEWY/wwVGc92CLmWfD4i4H9c16v9ko+a
	un8MXP1KdZbi8LZ24S6gKudBhZI0Ter3IEPkCpQl2j6oX9PTfNs5jt7sU0ghKbvs
	+KN9lQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadwpt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:39:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8581f7723aso2280340a12.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 22:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897186; x=1781501986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/LumdMRl3N4whwwMsWXm6IkVbxduPsWVFlMKwRHEwLo=;
        b=Sd1MZgG62E5FFWfxasDf/jWMNxYDE/1HZwx13I2SfMT4IqXCvpxWDj4W8yOKzIhOHf
         S7vxJ1mylylJPjEG03uPkrTo+U1lDxMuYmidweNuLZzLgkTraqG20JCk2b6gxQeVm5Yo
         7qFUkHPQ9eAcE/91u2QzFcmkWnM6M7YlzxkzP7GTVRmym81qP2qDPRHbMwoyjgB9q2q4
         I4BBir/Ei9CpsCexeLB1HbfnLA2109/fm0HgMo/61FtobCpGsHJrYXy7XlWDE72kB3Fd
         rqvGlU0ml4GztmX2rDpwc8t6UydWKUFnRcKIdk7eIB3BWmzn1oLJbEXQmNxVIm6wFwE6
         NqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897186; x=1781501986;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/LumdMRl3N4whwwMsWXm6IkVbxduPsWVFlMKwRHEwLo=;
        b=cZphIewWyXqEbx4udqaQnsvECm8ya6WRzt8eCtA5+f5WrpPilAnDdUNWBUcdT475Bo
         gxN+8sw/3W9WnhZyokbHavWvRXdJvOC9K5hoMepFVt3P6cvpbTwAR+0GKI8ciNOm1dkC
         ecUsq1uO+FgISYSDhywlb6CO5EJ2FYRDx9tGtuCSYrglXhQQjjm8E9Dtxr78NAJHW37b
         kdWgAzTzgQzFwptGW4oVBI5pbeixhbpaZdPi21LMrAO2Bt816Jr6r21bxSds6yUCMJ1n
         c9tYVuH7neVyxYwOCMj7Lu/gUHQXUiTMd6WUbLP1jkPdeGMxw56uLnHCWawEUu5wjwKi
         ZthA==
X-Forwarded-Encrypted: i=1; AFNElJ87MPYUctIHihcKFU7jIZimrq577fz+6OMh553XkjeIdnfuX+vTSqqwuoD9ipYi1wwe1dLSBKmH+k90WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPr4Z7XjW1PnfBN7E1VGVTn9rhXwkZ5XomglNTu/4PZ9Yn3E2x
	vM98cBA4ACma0sIFELrZI/yZAhAtI5nJH6l5cVGGY0j2ym24KG2lXFTRF0+Y44VDduNHlQQg0Xk
	HpzDoWQnDi0/k8edeQHDE477tqxBCE2TFIltfvPi89EjPiVgpkHtQRzC1q6KUQCkiBg==
X-Gm-Gg: Acq92OFZ10DCFcIVM0WUbLPb/Wxs8aPhMVgo7aVReBYZCByy8EVeg7vH2oz1IiFZNDu
	G2WRRQINv2qU5zRdncN1G7vaT6XM9DXa+CdJcjd5qqZ/xxqyK6unnqXG1Y6g9eDRblE6r7he2V5
	YxmlNobmlpObbYthdCwfyNhWKT9HapBrxApupBw3Pi/4/mSNytsvAJqK6InOos5LSxDl7DKAgBP
	kotXTH5WbSQQFFSxrbO/DKu6NzabhZojWoZbxVImIYUwsXtNMCWNal1vldJLIYBIVepCl/ktY97
	RKRl2cEfTkMhvv4lE/P0VhZ15u9KBw5R0NeEDwHx4qzt48oThOtyJiqsiaH9hAQUWxwjI9xpwr2
	JZvYTVdiCMSSutEGxyZa7b+noCjpgLmuPC3ElRRqPEtYf9PlJW/SLfsyn4rwe/vuo
X-Received: by 2002:a05:6a21:6e04:b0:3b3:2703:110 with SMTP id adf61e73a8af0-3b4ccd1b49cmr16495568637.4.1780897186469;
        Sun, 07 Jun 2026 22:39:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e04:b0:3b3:2703:110 with SMTP id adf61e73a8af0-3b4ccd1b49cmr16495533637.4.1780897185956;
        Sun, 07 Jun 2026 22:39:45 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a505fsm14522572a12.20.2026.06.07.22.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:39:45 -0700 (PDT)
Message-ID: <6fb0c372-d77c-da95-5cad-c620b68c2bd3@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:09:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 09/12] media: iris: Add support to select core for dual
 core platforms
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-9-afaa55d11fe0@oss.qualcomm.com>
 <20260603144434.928EF1F00898@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603144434.928EF1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a2655a3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8D1nwKgvKgv7XXS0Yz0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: _37dnTLTw6vPqBc5A6tTGE9t84RtyRaT
X-Proofpoint-ORIG-GUID: _37dnTLTw6vPqBc5A6tTGE9t84RtyRaT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfXzK4M/7KkjI0M
 RrjvlBYWe2ILDLSeWeDEonvGD2jE3pUbFcMReGP2d3SGIiUknX1ntrqn3eN7ZUiU5Y3wkjYJgfw
 Tr0Xo2LqrEc7W3RUoOgjgvIX1+QrF58rP0i/whNjVbfZRsoOzrV4u2iCdac2L57RsD2iOEcPNGc
 yJJhDN1CN/mID3u5tHzMFG4H0d8uNFqRGcl77JSwfJ9lmUxhjKTaouL1uL2I/hO+VFRqaVPU9qc
 66gyVPi6jSn481oa7Gs6pcmxPA5MmsYBXhMVBlWUJVot+xB1BZ/0cp1WI9bj2l+ux1NdIZ3baGa
 vvSF1Cbokl6ZZmxmqn5J/ENGokgzYquaoKdGec8YjOwMEu2K7KLMye4SNQ10IIZw/L+uhKWSEtB
 wtlzei6NnEX+1ox3cUIUpdC1taaMpkkPioeb4H1tJH/5EhlgjOyEPK843ISLoa5tNsw6yDayKSv
 TTLajoQz3B6h2X5WNgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64124-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DB96652DC6


On 6/3/2026 8:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Dynamic core assignment logic mutates `inst->core_id` during streaming without firmware notification and without holding `inst->lock`.
> - [Medium] Initial core assignment bypasses MBPS constraints.
> --
>
> commit 2b81abf719d22ec30cd3764b2bba16be2af15168
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> media: iris: Add support to select core for dual core platforms
>
> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
>> index a2ea2d67f60d0..dbb89396e6514 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>>  	if (ret)
>>  		goto error;
>>  
>> +	ret = iris_set_core_id(inst);
> [Severity: Medium]
> Since this initial core assignment is driven by iris_check_session_supported()
> called just before this, does that function need to check both MBPF and MBPS
> limits?
>
> Currently, iris_check_session_supported() only calls iris_check_core_mbpf() to
> verify Macroblocks Per Frame limits. The complementary MBPS constraint check
> via iris_check_core_mbps() appears to be entirely omitted.
>
> Could this allow a session to be successfully assigned to a core that meets
> the MBPF limit but vastly exceeds its maximum processing capability (MBPS)?

Decoder doesn't know the FPS at this stage to validate MBPS.

>> +	if (ret)
>> +		goto error;
>> +
>>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>>  		if (inst->domain == DECODER)
>>  			ret = iris_vdec_streamon_input(inst);
> [ ... ]
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 65896d0c1f16b..9f8dacfa768d8 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -318,6 +318,67 @@ static void iris_vpu36_program_bootup_registers(struct iris_core *core)
>>  	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
>>  }
>>  
>> +static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
>> +{
>> +	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
>> +	u32 max_load = mbpf ? platform_data->max_core_mbpf : platform_data->max_core_mbps;
>> +	u32 max_session_cnt = platform_data->max_session_count;
>> +	u32 core0_session_cnt = 0, core1_session_cnt = 0;
>> +	u32 core0_load = 0, core1_load = 0;
>> +	bool select_core0, select_core1;
>> +	struct iris_inst *instance;
>> +	u32 load, new_load;
>> +
>> +	inst->core_id = 0;
> [Severity: High]
> Is it safe to mutate inst->core_id here during active streaming without
> holding inst->lock?

core->lock is already acquired before control reaching here, so additional
inst->lock not required.

> This function can be reached mid-stream if a concurrent s_parm call triggers
> iris_venc_s_param() -> iris_check_core_mbpf(). Since iris_venc_s_param()
> executes without holding inst->lock, a concurrent call can clear
> inst->core_id to 0 right before iris_set_core_id() reads it during
> iris_vb2_start_streaming().
>
> Additionally, altering inst->core_id mid-stream without notifying the
> firmware (which only receives HFI_PROP_CORE_ID at stream-on) permanently
> desynchronizes the driver from the firmware.
>
> This could cause iris_vpu36_get_required_freq() to incorrectly shift the
> session's power votes to the new core while the firmware continues executing
> on the old core, potentially leading to hardware underclocking and system hangs.
>
>> +
>> +	list_for_each_entry(instance, &inst->core->instances, list) {
>> +		load = mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);

