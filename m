Return-Path: <linux-media+bounces-59192-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFcpAz4K52ly3AEAu9opvQ
	(envelope-from <linux-media+bounces-59192-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 07:25:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7161E4367BB
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 07:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33E5B301A712
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 05:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CBE32E692;
	Tue, 21 Apr 2026 05:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l59brESl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cmyl2XRd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B2140DFA1
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 05:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776749089; cv=none; b=nzcu/PvlgbXxBtq85zl/Hv01K6t6Cr2+bjNggwpMTJlvsD0hmlG6MmsxwVuhnDorGKuWxvb288cO0Q+8IXODwZ0R4cPQoJxmrg0qPbhWdw1nmnymZWtjYZ+PQ691tocZdDFWbljgJ43n0K79A1rEkoxh20JHGCTM61ZCnTpBEfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776749089; c=relaxed/simple;
	bh=MgQT4N+Mqb1evwM8+fhvVokUy2mUmmNhfCNY6bbnGs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+FLdYus7Kas3Op4+uDgBTJhUN8YI8fZMCnrGo1GPCWQTiUl3Ebsa+1QBOsrvKNjsOUDEUEuyKIWKem1XiqeB1SOZgh5NZuLDKX967VWCl13W5qZW4nx65YEGKw3AskWxvRMW6UI45UN0GWA0gwT9SE3UT78RXrh9JADM9vyy54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l59brESl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cmyl2XRd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L0x9JZ785636
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 05:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCL++qfBVqJug1AN+YapQM/WiamenNZBA74qYFRRIrE=; b=l59brESl9AI9VY4j
	7a9DL4M0sMcQDrKE7oE/VLb5yNRBpFRD1O1u6d8GD7GCUZDcbUelzr60tm/gj14Z
	DoNGIhESHVL9BGbJ8oNOgoo4vwaNutiQTEf8hRpSGokjf2K5ntKzwxwIwlM08UBj
	r8/eqGKbHcC7Qnm9CljDdH1m/VEub6T5SUezKKTfGw4Hxijueki7Hs+fnOV3IJ6k
	3MXTNnlDV9qaphzbImQdnt/KcSDfqzLOr1hNbhs6qm46TmTALnFWmQAzNyaqzTaG
	EBx1Pz6Eyf50OQCekl5MCqeTwmU3T/v2qmzXH5Xm2zHNmDxJLvwwgAEcbPlwNZZw
	6V1/vg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhdhkt5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 05:24:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso3685987a91.0
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 22:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776749086; x=1777353886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WCL++qfBVqJug1AN+YapQM/WiamenNZBA74qYFRRIrE=;
        b=Cmyl2XRdOPxWNKOUe50n051t5BifawnCYFcPNk6oeMlJEtnCFhbtJ2glJwJ+SIeq3N
         t074t/tUok12ONwkH7OnTwYLheEJfh1o7We21WCTfwTcdIgDZz5gZlcMRbe/5F7RylXo
         Bz6U+ytrBvkGbwBvsBq9YFQjulOeVtE7r6B0lzX/uHKkE9xlbn5x1ZOcixzreVM1X9vL
         QnyBOTBAoZ3h9Tv567Es6EhrZdngUhBCiyHARrm6HOw8Z1yUcWY1DTHhtymd7L1quUwn
         UH38ZpkiJkWHagl6/Y3f8B+EKjKN/YA3z+5QvR87pBeWG1NGtxhhuB8paat+4gEeCCUw
         HU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776749086; x=1777353886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCL++qfBVqJug1AN+YapQM/WiamenNZBA74qYFRRIrE=;
        b=GZpI3zJ0yr4+pq9co1OlmBmmwn/zpbCbrWfCGjVNaLG4XIBdU9Zo7lTbyZfTnktZT4
         0YV6jxOaEjAzZ0xeE9Wp5vLb2umT4FFPW+0RHp2H96NTxULEp1VbZSpKsZ4x6sPR9KSo
         pm4jKX5H+cW2M07A4TMCfS4qZcXkFa7BghkvINyu94LJwCrxhhYVaouYZOBQMWuto9dV
         bS8bvy1n00Q+bDl7Xpym0tQ6lfDgZRVHJQqJDo0UxE0yuOBsl5ZaRaRcIUMoAzLQmmHi
         Q9xMcmUDOFEBfmiKtEsGRnzIdjvrqNSbhgpCzMpKFpj/EryAKOygjpZitNzzadvd+IEl
         OI4w==
X-Gm-Message-State: AOJu0Yzgt3wecmyZUenotamXSx7ciM/9B9pWpt7VeoIM/x6esfe/q+tX
	M/DNJaes6q1J43x4SMvcMfxAskU9VwSNmg92vbtye77aiY6d70B9hj1/+PocKLFvWkBNpQszrAV
	mdW1TQOObzeWXCFFwnvV5clDTifEE6Gkj0rcY130cXxr2KJFcqG8j8D9E8gjCBoLoAg==
X-Gm-Gg: AeBDiesKk7Pd5O8fcAXT71/zX3lKSFmz/cI3K2u2+ZmvWgOee/9GxADaLTWFrhum5f4
	YLZwRcKL34CUgAjjj/Kln9mGnxE4xmBpcXGm/XFpTMR5PH1j5DGoRmMtPbFWR3GSWxWHeG+MDZg
	IfKlsaalxXD4k7QYTSUXtfANZ+wCOErrpTGDHx181kwcdecJiM8ZRvg4bjlWAocSXh8KscWLfXa
	aOd7ZvPz/O76XmI4jvwHeYzR+YwPlJg9GV937mlozgkL13nhfIvsJy1cFAQ95O3TqhtSJrUvDiD
	2C+gEwaYoezdZ2Di7UBtGISSKNksVUdKVzKs1FC9a23bSeyNQcI+OKTWPHCLY6V1pmILlYfZYGj
	k6UEMODEAVn0QlKH8/Z63e4zbqsi6LJ08hIqoP9RCqeQI/SYd5xiQiSspltq6VGzi
X-Received: by 2002:a17:90b:3d01:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-361404af0a4mr17842724a91.23.1776749086432;
        Mon, 20 Apr 2026 22:24:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3d01:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-361404af0a4mr17842699a91.23.1776749085953;
        Mon, 20 Apr 2026 22:24:45 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.228.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a92asm11957276a91.10.2026.04.20.22.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 22:24:45 -0700 (PDT)
Message-ID: <f336e049-eb6c-5784-b831-fffcc162ffe0@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 10:54:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC 2/7] media: qcom: iris: gen2: add support for 10bit
 decoding
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-2-428c1ec2e3f3@linaro.org>
 <d27e1500-ac4a-01ac-084e-bb53aa1f63b0@oss.qualcomm.com>
 <dbc98f63-b851-4470-be38-aeb83c719759@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <dbc98f63-b851-4470-be38-aeb83c719759@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KXscoKsAIwktD50JYHpOB0PpHalw3X75
X-Authority-Analysis: v=2.4 cv=IMgyzAvG c=1 sm=1 tr=0 ts=69e70a1f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=rP2ZPG2H70Gfrv7XvIldxw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=9ymPTIKn-T6a8pg3zFsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KXscoKsAIwktD50JYHpOB0PpHalw3X75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1MCBTYWx0ZWRfX1RRlW/uUA5CY
 DGbWLdFxRRRzkHKZtI6L/5q5i/d3tLWsHvttQB8fvKZ10AAq9uXouaR+DUK6sra+GLu4OqhBHXn
 /7CswajpQ0yEdiCJ8vv7TSWtjCvQ7fyLMntHC9qW6RjH3ywUauh4qe7fiP8YJroMb8fpKfhQ1W+
 Fyc7ZDifrSzWMmyb/E4KftcMah06ajBAG0/8Cx7+ZtmtSNTiCCE6Y6Os8H9jBGpPGQZfir+/U5P
 GJI+SQ5HrY/65Smof+0jPhFSm6WQcwOwI4zmLJwzPNDsPgxSYi5h/5yQn1MYq8s0zrZb5SVlGPY
 ao5pW3YJbJyPNy5sA0MOcviyHlgJX/KaVlqm+fysZQpBcSkJYDL4nvjMZ9zXeuTYXGNg3uP7FYE
 1HkNGe0oRHP5KFml0q/huxQSSeMGERKe1CzLmNB8y2d1hCSvQ1LObSpZbWY7Xx9Il6qPhpAzrbd
 lOLrV4/YE8P87fzsaOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210050
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59192-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7161E4367BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/2026 1:33 PM, Neil Armstrong wrote:
> On 4/17/26 09:22, Dikshita Agarwal wrote:
>>
>>
>> On 4/8/2026 10:13 PM, Neil Armstrong wrote:
>>> Add the necessary plumbing into the HFi Gen2 to signal the decoder
>>> the right 10bit pixel format and stride when in compressed mode.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71
>>> +++++++++++++++++++++-
>>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>   drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>>>   3 files changed, 72 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> index 30bfd90d423b..8e547e390fa3 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct
>>> iris_inst *inst, u32 plane)
>>>         if (inst->domain == DECODER) {
>>>           pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>> -        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> -            HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>>> +        switch (pixelformat) {
>>> +        case V4L2_PIX_FMT_NV12:
>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12;
>>> +            break;
>>> +        case V4L2_PIX_FMT_QC08C:
>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
>>> +            break;
>>> +        case V4L2_PIX_FMT_P010:
>>> +            hfi_colorformat = HFI_COLOR_FMT_P010;
>>> +            break;
>>> +        case V4L2_PIX_FMT_QC10C:
>>> +            hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
>>> +            break;
>>> +        };
>>>       } else {
>>>           pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>>           hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> @@ -517,7 +529,8 @@ static int
>>> iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>       stride_uv = stride_y;
>>>       scanline_uv = scanline_y / 2;
>>>   -    if (pixelformat != V4L2_PIX_FMT_NV12)
>>> +    if (pixelformat != V4L2_PIX_FMT_NV12 &&
>>> +        pixelformat != V4L2_PIX_FMT_P010)
>>>           return 0;
>>>         payload[0] = stride_y << 16 | scanline_y;
>>> @@ -532,6 +545,57 @@ static int
>>> iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>                             sizeof(u64));
>>>   }
>>>   +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst
>>> *inst, u32 plane)
>>> +{
>>> +    u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
>>> +    u32 stride_y, scanline_y, stride_uv, scanline_uv;
>>> +    u32 port = iris_hfi_gen2_get_port(inst, plane);
>>> +    u32 pixelformat, width, height;
>>> +    u32 payload[4];
>>> +
>>> +    pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>> +    width = inst->fmt_dst->fmt.pix_mp.width;
>>> +    height = inst->fmt_dst->fmt.pix_mp.height;
>>
>> This HFI is only applicable to AV1, you might see some corruption due to
>> this. Please check.
> 
> This is what I saw looking at donwstream, but I had not implemented this
> initially
> but I got some corruption with some different width/height, which was
> solved adding
> this command.

Even with your implementation, this API would only ever be triggered for
QC08C and QC10C formats, which I don’t believe are currently being tested
with your series. Since HFI defines this as AV1D‑specific, invoking it for
other codecs is unlikely to help and would be incorrect.

Pls re-check.

Thanks,
Dikshita
> I guess this in-firmware calculations are not exactly the same the DRM
> driver expects.
> 
> Honestly I think it's preferable to sync the stride/scanlines calculations
> between the
> driver and the firmware.
> For example I used the same "ALIGN(width, 192)" for the v2 iris patchset
> which was wrong
> because ALIGN only works on Power Of Two number but it still worked because
> this HFI
> HFI_PROP_UBWC_STRIDE_SCANLINE command was called with the wrong aligned width.
> 
> Neil
> 
>>
>> Thanks,
>> Dikshita
> 

