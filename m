Return-Path: <linux-media+bounces-59507-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDGlNz4262nRJwAAu9opvQ
	(envelope-from <linux-media+bounces-59507-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:22:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E05645C182
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2814E30530C8
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87B0387359;
	Fri, 24 Apr 2026 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ler9R/RQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhwtm89n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C062A37C0ED
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022274; cv=none; b=ltvI/Mfs7pvcLUyhmtkiuv7Kar89+zk2hd7jsBSrxXPaj9BnQw8BFz8gWMgegisD/q2a6onA6UQeaVDiEKppnNjlESo6MBc9bGOjoUtItEKun60gspLcX0QASQJ4mdlMHOTW0mnmc4q+c5ERPI301cf+EfCBFJLaWcqJVdEhNb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022274; c=relaxed/simple;
	bh=ZqD9SCbSH5/aik2kX9oPA2bNhJzOsnyxshXjNaCGGS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uVzK0acfPQ3gNjEKcVZBKe93th+oPLJ7CW72AiGnAnz7D1ChR/NJOhyYn14/9w1FKkpaFsSepv3YsBVJhR3ddVYkV1+tBL4qPGSdkYwYY0/V/PIU9R1oTbnp9lWNegRaPCoTHeHFC6/X3NL/d9bantSrmrFXcdmX68LZ2bKbUeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ler9R/RQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhwtm89n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O88Hdp4012159
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 09:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqD9SCbSH5/aik2kX9oPA2bNhJzOsnyxshXjNaCGGS4=; b=ler9R/RQwVPLaFBw
	QTto4e4FT8hhSvQBmGbiMupbl8C6Z0NoDBHOVyrzFz3LGhuW1hsKQUVizLozF/da
	1W9E1QAkOZHe/W2VgpglzjkR2zFt61FLDgGyBvbT5ztpPRHIElEje875bNKq5fjt
	uwAaBBEg0/80XZsEsmWOOsVLLd8d+8Ill2uXnIfXdLa92ei4sUiftNYihWKVbiVV
	VpkY+H4s+qSJODhaQDJuBRwEjkuoMKHdcXByp33MOv4o8iGjX4kdUw/8kk7FOi+1
	c6faHB3MoYuVosMYxUbk8c49bd0K2UO3AQoFgncOfGV1K3IyvK45QreBZFOQpHf8
	IyWKHA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9ukwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 09:17:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso4473006b3a.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 02:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777022270; x=1777627070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqD9SCbSH5/aik2kX9oPA2bNhJzOsnyxshXjNaCGGS4=;
        b=dhwtm89nMsLCDiYN9FteF+PNcKkylUaDtn2uxjqL4/t+I/89AYP4OLwwbmveEh6Y0O
         wkfjl6tg85Y5fvrgyJUoNYUij45zh5SOeJLbWpQve4Et3hueheYJi4H58UUttic9IG2i
         3veyzj3RZo/h/I8NNyaUFpLIwD/ADremeb/RO5NjIHhQT8ZDdMbCL/A2FIiqn2t+7rdM
         72xUMd/y9OO4K3M3oXHfGiv/afQd3/yz/e7IOBzN88ncJH4QmxPFCF0a8FS6EQf4TIup
         JbZ8zd1DMYsuBJOEyMhIS8m/wZAPcsbia+a/53j/7vAkaIRsxdTr67CEqYtN8ucpoixQ
         Vgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022270; x=1777627070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqD9SCbSH5/aik2kX9oPA2bNhJzOsnyxshXjNaCGGS4=;
        b=VeoJyCPBDcWO3RvFJdiIPOOEd809QRpHtxMP2vbZWgsV77f4NBHjITtLIO9ZucSgz0
         zkNra7as7J9DQgL9HFG8PW8w3R0u0KlszkDsxVoovEPnfWaO/1IB+9dYDTIQ3hv6U+qW
         g97KaFaunBw0Bs2EIU9RMntVFlZJGoqYKfgR5NN8yRIaczcRSki3YLrAqd6plxYZwzWe
         sIezoi4SK10zPPhUO//q8hh3o4+0CPapReNtqjqga/PXiVzz50KRYf21Kw/a7rBaLq0y
         XsXSAWtBUVTpQV5FGdHvfkAqCDKziA/p9tbtSHYC/Sbl9X+fipcobnTVxGbCrodBDGp6
         mtqQ==
X-Gm-Message-State: AOJu0YyJX7XH0c1lucPkyLJ1S+MnkLSSnx+f+L+Qt78jAvkhpXdzd8NZ
	FmcPi76RQtC4Fkn/JBtW1fdza/nz7zR/+D+M4/ZfQbYppdzSo2PirimSV4okGs64aq/8NErHpTL
	7ZcWvvtEbrRL4XmuzgO6Bz4EpNrK0f3XWqaISqhnOoZvToZi7zf5+tROiwarC3/2d7g==
X-Gm-Gg: AeBDiev5DbTSp/0b2RW7t+uYmhOYlDkvEci57DEQntaS844mgnUxlXZNoI9EY8FP9jV
	aqLzUybR2/lJJQS837oEhyafebaylVVGwsYKxAHQ5ZNb1y3S5iUmDmMukBSqAdZEwxoqAauhN6z
	imXD6Tt/hZ5TdLQcvhrsrhmKLvryswmpbC21NON2FMCSEVP2mGCX31iyAYgKCNDI1rjLnJMb92X
	77NOFKEBOJJT1eyAmiCrbQVUAD++3hiQDrqpUlmb23fWt9s61yXryM/SfuzEEJatAU6OcRuk3Qx
	h5HrZ1JAgxEc253plwyuEAphcS6qGlBdwghcHhNkmzVhPWvydU7a9nq/mYJuwY2rEu+syETeBcZ
	72WVPMxi9AbYkT+I/RAcp3mNMkI+wVS/zazRoqstc7Hq6N8C4Bo444ZzyH+D7O7Pzow==
X-Received: by 2002:a05:6a00:2da2:b0:82c:9c47:fef9 with SMTP id d2e1a72fcca58-82f8c87e249mr34286765b3a.2.1777022270453;
        Fri, 24 Apr 2026 02:17:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da2:b0:82c:9c47:fef9 with SMTP id d2e1a72fcca58-82f8c87e249mr34286725b3a.2.1777022269873;
        Fri, 24 Apr 2026 02:17:49 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe40dasm22540997b3a.40.2026.04.24.02.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:17:49 -0700 (PDT)
Message-ID: <ec1a0557-18eb-4b16-7c10-95b69ea7e63a@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:47:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: iris: optimize COMV buffer allocation for VPU3x
 and VPU4x
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <lWwJ9pbXoZXg350L9fA8Sx-qznLud6KXnJlBTFNBLZQXEwKZeI50KGzJPDq43FO2QtbisF9pyxxeVTXX-WvN0Q==@protonmail.internalid>
 <20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com>
 <c0a23200-e3f3-46ad-9057-4ee8723d2f43@kernel.org>
 <899e0575-6de3-4ab7-b817-7a51c6b45787@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <899e0575-6de3-4ab7-b817-7a51c6b45787@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA4NiBTYWx0ZWRfXw/pJUR2zavtm
 A6bZrNfzolmyEc6QeHGmU7jidOl4cbj0+jErfOeNJpq5WDom4YuE/KJdbIOBzFmyaiuGyIt7c/m
 PhCmS5nAt5/K8xSQcLl9r1Z/qCHxZJIFJisGDQy1nvdDQRWI3TaknO+QbuITJ6mN2ZwELQfV2at
 PkjpnRlXJP8HXYw98pYrsfOjuIoJOY2XgDnZTYgVBOIJcy5AzgIiBKA5/M6ZieCiIYT0dKbVYH0
 v1l8czqN2eteiGfhb8FfrhXnbjvMvKKnu3EX6BdkXvO1dPfhZI2PtmNTsTs/L8Ms+cbjNZvKMFV
 vAUifXSYrj9/NQJvH7xjZsUqNg/QRSFwVgX4BEEWPNFHS/SX3J5adpbVl8+gxTaDcL3p1l8QeWe
 z8Rk8xLSmjvPHrcB3hvFnu0rEAabEY64m0cff8dsv3jSqwZQQ7ANChRmXI8W46+P9dXTITIOdPM
 W5ytK4Xx8eKB9qToAXQ==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb353f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=gkiTcqCCC2T/77GpOVv7Jg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=LgKhh46ExfKBiJyGOCMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: LG8XZYiAzh_AJHnMaXL3PJNopsLpVK0q
X-Proofpoint-ORIG-GUID: LG8XZYiAzh_AJHnMaXL3PJNopsLpVK0q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240086
X-Rspamd-Queue-Id: 3E05645C182
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59507-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/22/2026 1:12 PM, Vikash Garodia wrote:
>
>
> On 4/21/2026 2:31 PM, Bryan O'Donoghue wrote:
>> On 21/04/2026 07:41, Vishnu Reddy wrote:
>>> The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
>>> num_comv count unconditionally when calculating the COMV buffer size.
>>> This resulted in an oversized COMV buffer allocation throughout decode
>>> session, wasting memory regardless of actual number of buffers required.
>>
>> You should define what a COMV buffer is before talking about how you are
>> changing it, i.e. define the term Co-located Motion Vector (CMOV) and then
>> use the abbreviation CMOV liberally as you wish.
>>
>>> For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
>>> replace iris_vpu_dec_comv_size(). It derives num_comv dynamically, it
>>
>> "These derive num_cmove dynamically"
>>
>>> uses inst->fw_min_count once the firmware has reported its minimum buffer
>>> requirements, and fallback to inst->buffers[BUF_OUTPUT].min_count during
>>> initialization before firmware has communicated its requirements. This
>>> aligns the COMV buffer size to the actual count needed rather than always
>>> allocating with fixed VIDEO_MAX_FRAME value.
>>>
>>> Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
>>> to MIN_BUFFERS instead of 0. This masked the fallback logic and caused the
>>> COMV size calculation to use MIN_BUFFERS even before firmware had reported
>>> its actual requirements. Fix this by initializing fw_min_count to 0.
>>>
>>> During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
>>> to 6.16MB per decode session, significantly reducing memory consumption.
>>
>> Cool nice fix.
>>
>
> Indeed, a good saving.
>
>>>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> ---
>>>   drivers/media/platform/qcom/iris/iris_vdec.c       |  2 +-
>>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 24 ++++++++++++
>>> +++++++---
>>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
>>>   3 files changed, 23 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/
>>> media/platform/qcom/iris/iris_vdec.c
>>> index 719217399a30..f433065e08b2 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> @@ -24,7 +24,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>>>       inst->fmt_src = kzalloc_obj(*inst->fmt_src);
>>>       inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
>>>
>>> -    inst->fw_min_count = MIN_BUFFERS;
>>> +    inst->fw_min_count = 0;
>>>
>>>       f = inst->fmt_src;
>>>       f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/
>>> drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> index 9270422c1601..57237543b229 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> @@ -731,6 +731,23 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>>>       u32 height = f->fmt.pix_mp.height;
>>>       u32 width = f->fmt.pix_mp.width;
>>>
>>> +    if (inst->codec == V4L2_PIX_FMT_H264)
>>> +        return hfi_buffer_comv_h264d(width, height, num_comv);
>>> +    else if (inst->codec == V4L2_PIX_FMT_HEVC)
>>> +        return hfi_buffer_comv_h265d(width, height, num_comv);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static u32 iris_vpu3x_4x_dec_comv_size(struct iris_inst *inst)
>>> +{
>>> +    struct v4l2_format *f = inst->fmt_src;
>>> +    u32 height = f->fmt.pix_mp.height;
>>> +    u32 width = f->fmt.pix_mp.width;
>>> +    u32 num_comv;
>>> +
>>> +    num_comv = inst->fw_min_count ? inst->fw_min_count : inst-
>>> >buffers[BUF_OUTPUT].min_count;
>>
>> Please just if/else this though its far easier to read/understand that way.
>>
>>> +
>>>       if (inst->codec == V4L2_PIX_FMT_H264)
>>>           return hfi_buffer_comv_h264d(width, height, num_comv);
>>>       else if (inst->codec == V4L2_PIX_FMT_HEVC)
>>> @@ -739,7 +756,8 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>>>           if (inst->fw_caps[DRAP].value)
>>>               return 0;
>>>           else
>>> -            return hfi_buffer_comv_av1d(width, height, num_comv);
>>> +            return hfi_buffer_comv_av1d(width, height,
>>> +                            num_comv + AV1D_COMV_BUFFER_OVERHEAD);
>>>       }
>>>
>>>       return 0;
>>> @@ -2025,7 +2043,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum
>>> iris_buffer_type buffer_type)
>>>
>>>       static const struct iris_vpu_buf_type_handle
>>> dec_internal_buf_type_handle[] = {
>>>           {BUF_BIN,         iris_vpu_dec_bin_size             },
>>> -        {BUF_COMV,        iris_vpu_dec_comv_size            },
>>> +        {BUF_COMV,        iris_vpu3x_4x_dec_comv_size       },
>>>           {BUF_NON_COMV,    iris_vpu_dec_non_comv_size        },
>>>           {BUF_LINE,        iris_vpu_dec_line_size            },
>>>           {BUF_PERSIST,     iris_vpu_dec_persist_size         },
>>> @@ -2098,7 +2116,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum
>>> iris_buffer_type buffer_typ
>>>
>>>       static const struct iris_vpu_buf_type_handle
>>> dec_internal_buf_type_handle[] = {
>>>           {BUF_BIN,         iris_vpu_dec_bin_size         },
>>> -        {BUF_COMV,        iris_vpu_dec_comv_size        },
>>> +        {BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
>>>           {BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
>>>           {BUF_LINE,        iris_vpu4x_dec_line_size      },
>>>           {BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/
>>> drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>>> index 12640eb5ed8c..7a9cc1c92da3 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>>> @@ -110,6 +110,7 @@ struct iris_inst;
>>>   #define MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE 96
>>>   #define AV1D_NUM_HW_PIC_BUF    16
>>>   #define AV1D_NUM_FRAME_HEADERS 16
>>> +#define AV1D_COMV_BUFFER_OVERHEAD 7
>>
>> Whats this ? Why is there a new seven byte overhead ? Does it represent a
>> header, an alignment ?
>
> Vishnu, pls check if we need to add this as initial count was 18 [1] ? What if
> initial count was 11 [2], and post DRC, fw_min_count would be 11 too for AV1d,
> so the overhead can be avoided.
>
> [1]
> https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c#L1220
>
> [2]
> https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/media/platform/qcom/iris/iris_vpu_buffer.c#L2157
>

Thanks for the information, will check and update in next revision.

> Regards,
> Vikash
>>
>> An overhead can mean anything.
>>
>>>   #define SIZE_AV1D_SEQUENCE_HEADER 768
>>>   #define SIZE_AV1D_METADATA        512
>>>   #define SIZE_AV1D_FRAME_HEADER    1280
>>>
>>> ---
>>> base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
>>> change-id: 20260421-optimize_comv_buffer-ae7107673609
>>>
>>> Best regards,
>>> -- 
>>> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>
>>
>>
>

