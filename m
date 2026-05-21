Return-Path: <linux-media+bounces-62450-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIgGNy/XDmr2CQYAu9opvQ
	(envelope-from <linux-media+bounces-62450-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:58:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9B75A2CF6
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91C8F3036094
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2987037D128;
	Thu, 21 May 2026 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOMi8A+X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U1XwvVGr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235753016FC
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357129; cv=none; b=accw0QUmbrcThFeXOVMBnxH3RHc1jJ7sh1H6bJPEggxf3+x03DKrVd7QPioBtzDrEm+aGubDyG38I0txrARtDrnCdfYtk89vQj/lIE6N0EHbgr7ISSaQzz+AuxOutCe4TvfEO1thaXAbKpEDHS6q4PPg3IwhjMu+Sa/ucZ1b05Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357129; c=relaxed/simple;
	bh=PFzCd1ME+IUGqIX1zCgjT2rjAFDO7ig/5gyjqIdXHrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoCsA1qcYtPPRvu9SL0x6Acou8LJeeK5DGKUQj/EDo5BAgo/nfDBX/iCXkXIjoPTU4LN/aZRYjw/NIa/+73JyA5Gu3T1+0RBAI6d5k6UZcw0ZE0rnt++xxLIUtIR1/XyydQ/Mr8h1kDSjFf2ELNXuT8hMGzcuZCxexVX3s31Lqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOMi8A+X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U1XwvVGr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A5go3343968
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HIP7W+4Ot926uFKgVUKYwj6jEusZ85Di/Ri8exHnTMU=; b=EOMi8A+X8SaZd7Tg
	Urc1qqFdEdoROuL3jr72KDYht8t5TRT+bdYl2eivt9Pb/1FwpFV0LSPGEn/jMsL+
	nrHAQBqgMlBw9Q00S+VnPWGgQwqRgyOYtT1OQQdQnke+IxLofpxYUsG+njeFJNEX
	HJEsU5/5ClCM2RoWJc48AKVTFSWJi/dDym87f/aNnbczMCLtwEzrP+X6l8e51BVG
	p7z3AGuvjeQ9QlKKdcSRwju8Sa7pZzD/ZlyALJ5y4k/zWyCLOvqBCCAhwvB6Wuun
	4gdRNtrar6Euwsct0nR9wfjSWD5f8+8DFSry7lYWPPkDmJ+P5W5/wK63HMsKO7yl
	zrXAHw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahrq0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:52:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so5617486a91.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 02:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357126; x=1779961926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIP7W+4Ot926uFKgVUKYwj6jEusZ85Di/Ri8exHnTMU=;
        b=U1XwvVGrElQ5ivS3UBdv1pqwjHZ2Ad6/RKJ8RdPyFkWRCgeJOr7lLmsd2edb9wfZ/a
         f1hoQCNJoTn2kCmAlr7pnmdq3ABbxZ6olGjDNQVmzc33qrOt2KZhyBgdwEyEgsF7S+kq
         X36H431zM1DP9oF89sPtxGwzWzlgulHgfKlfGvJZBuNU1R8Tvge+W2bsfyMr8NqFk+3y
         DGihucREr2AZ5b7DCwdeWsm/X4qzAYco1FxoUVjNCNX4lylJy7bPdhVkdsup2DhLYXsR
         rWwNLkOOf3FeLJCqG1pHn84zI4Eb3+63uKOQ0mwdtGNtSM6+bR6niKYHUkL13XB+PG7B
         55Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357126; x=1779961926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIP7W+4Ot926uFKgVUKYwj6jEusZ85Di/Ri8exHnTMU=;
        b=dl+XAtQVlb9wPle6jhmgpVI/6LVTmjYMH+wNJQL8XIsvHrn9mj/L9ZkXL1ni7Hh9j7
         kLM0LR+Xy5g+wOc2aKeorOixBKcZWUheYWycJSth9qZ7Fw6wjPL5ZCHWJF2uTRTlWGkk
         TUyI455kEDOcSmPk2MCYdBDCgSzABeQGOYQlJWnDHpdrBcnrkJ3s8bYGLq4vU7Y1Bp8t
         9JOsI/S0Pm6o4gkYun3vS6gYgxXF4vH5W/H3zF63y6R7BdBfrETQJ2rDZyP8DYCIlrjs
         feoF4PY7+tWO2OzNAsEVBoYavqmpCJQzPXQ8pp3uC8/ruKcQy/ld7FQOCeTcN0VLLubQ
         mvAg==
X-Gm-Message-State: AOJu0YyUVDKnchM9fhf0R0KwvN/BPBslfk8B1t+r5qdQzAqa2QEuSNXk
	x56IeVi8G+WNidjlboVAIN3ehPi8vqfJHy4NqtPkwfIYuPwEAhCXcHL1ic7OO4kS3uAP6i+4iPY
	Ryfwrczt4RWimakeObJrpwNcS58Jivhi2NoWpmgESqUWtRzel1ej5mck05MZtTn3HJg==
X-Gm-Gg: Acq92OGfhl+zkAXcCaXMyPwLj87NkX15GU12b2X2qBdmLyMa8PP22eigWkbZVzWFosR
	A5HNF02LZ2L+jGWnGeUyU84E+X2ORD8gIjaFyPEAdfJCl6aqyXJ1vfKXJ2eEXkioY3ixmPczOqT
	HVPDbCJp1dkOZW2qveDzQ2CGS4H/kvBhAXzF4fkb+ObdNKtt4+EbPngxclPV2bfscXFlz9Ar9dw
	PbM4pWsal4eea72aIChtrhCRlz0EMXDjAT/X2Wm5d/vMCzKzRSsPl/EVjZHRUcVvX8/aHIUYSBu
	T5lLDsie3JnbzLbQT23ezL5flcqka6xTBVYoDxjZ2n70eed1uF+jUhjxJxULeq62GQ4grLOD4If
	tcA9Hmf2wUn0q928O9x9K6YchZVRqF0lN8rUm5Ko3bv6ya5ILWXDGx3Y=
X-Received: by 2002:a17:90b:2e8e:b0:369:bddb:79b0 with SMTP id 98e67ed59e1d1-36a4576327fmr2114573a91.26.1779357125837;
        Thu, 21 May 2026 02:52:05 -0700 (PDT)
X-Received: by 2002:a17:90b:2e8e:b0:369:bddb:79b0 with SMTP id 98e67ed59e1d1-36a4576327fmr2114552a91.26.1779357125322;
        Thu, 21 May 2026 02:52:05 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a4690a4c2sm605162a91.10.2026.05.21.02.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:52:04 -0700 (PDT)
Message-ID: <3b7b86b8-2cdf-4c91-bbd0-0ab3c6861b90@oss.qualcomm.com>
Date: Thu, 21 May 2026 15:22:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
 <c6789e1e-db42-4546-8a98-d75a2443747a@oss.qualcomm.com>
 <de7c6626-a1fc-4a8e-b5e6-86dadf47cdf7@linaro.org>
 <bdc1bd01-f9ab-4101-b9e6-5799d63ed1f6@oss.qualcomm.com>
 <89a81b27-b217-4c74-96c0-c6f813a0768f@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <89a81b27-b217-4c74-96c0-c6f813a0768f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX33URr7JaGPIs
 B2FEfPBel5FUj6QPft4ibOBgd2WJUPRV03fREkzkxC2ufyC/uKqlpfYxR+mJhumt8QK/QD1qTUz
 9+inpGo5+pnRvIsFy9N7yMR3larlkok/5DwFV1u3AzrZ3ctIP7H13lt26fwcrZIc7N8KDHHV+Hd
 wFN5Qq2MruhibeAjYM+R3coCkieloPbmQgabhufOQ35S5jFuVFswTl5CZE5O/sxbrNFKkyKjQ8B
 0QTiJCxRBNRGDjNKucCGEH2IDMSpRE2z73pjvar2KZn/h2nHPOv/+iPkSJ4BlmWFwJBRlYYEi7S
 SWJwWUCyfyAY4SbJIvjyapU9Fx00xjwk/pPCoKHjoTYflxW2S6WZ931UNA780a/VPhA9B4U4KEf
 bq6yY3EVcift3JRzEeXBENYEdKlbY/t6v4H67KJirjiqB3wxw8qojOE9gIKiad7CKp/bPwUkCLl
 16HB/8rMA/wsOPGdCWA==
X-Proofpoint-ORIG-GUID: IMgg9z2XveMDd3GNhlbh7M-GV9oLWfoU
X-Proofpoint-GUID: IMgg9z2XveMDd3GNhlbh7M-GV9oLWfoU
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ed5c6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=r17rQ0tmIEUrj-diuPAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62450-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C9B75A2CF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/21/2026 12:57 PM, Neil Armstrong wrote:
> On 5/20/26 17:55, Vikash Garodia wrote:
>>
>> On 5/18/2026 1:09 PM, Neil Armstrong wrote:
>>> On 5/13/26 21:39, Vikash Garodia wrote:
>>>>
>>>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>>>> Add the necessary bits into the gen2 platforms tables and handlers
>>>>> to allow decoding streams into 10bit pixel formats.
>>>>>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>>   .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++ 
>>>>> ++ ++++++++++-
>>>>>   drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
>>>>>   drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  8 +++ 
>>>>> ++---
>>>>>   drivers/media/platform/qcom/iris/iris_vdec.c             |  8 +++ 
>>>>> +++++
>>>>>   4 files changed, 30 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/iris/ 
>>>>> iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/ 
>>>>> iris_hfi_gen2_response.c
>>>>> index 0541e02d7507..b6d815c01f1d 100644
>>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>>> @@ -542,6 +542,15 @@ static void 
>>>>> iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>>>>       pixmp_ip->width = width;
>>>>>       pixmp_ip->height = height;
>>>>> +    if (subsc_params.bit_depth == BIT_DEPTH_8 &&
>>>>> +        pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
>>>>> +        pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
>>>>> +        pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
>>>>> +    else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
>>>>> +         pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
>>>>> +         pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
>>>>> +        pixmp_op->pixelformat = V4L2_PIX_FMT_P010;
>>>>> +
>>>>>       switch (pixmp_op->pixelformat) {
>>>>>       case V4L2_PIX_FMT_P010:
>>>>>           pixmp_op->width = ALIGN(width, 128);
>>>>> @@ -625,7 +634,12 @@ static void 
>>>>> iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>>>>       inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
>>>>>       inst->fw_caps[TIER].value = subsc_params.tier;
>>>>> -    if (subsc_params.bit_depth != BIT_DEPTH_8 ||
>>>>> +    if (subsc_params.bit_depth == BIT_DEPTH_8)
>>>>> +        inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_8;
>>>>> +    else
>>>>> +        inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_10;
>>>>> +
>>>>> +    if ((subsc_params.bit_depth != BIT_DEPTH_8 && 
>>>>> subsc_params.bit_depth != BIT_DEPTH_10) ||
>>>>>           !(subsc_params.coded_frames & 
>>>>> HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
>>>>>           dev_err(core->dev, "unsupported content, bit depth: %x, 
>>>>> pic_struct = %x\n",
>>>>>               subsc_params.bit_depth, subsc_params.coded_frames);
>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/ 
>>>>> drivers/media/platform/qcom/iris/iris_instance.h
>>>>> index 16965150f427..16424d1e94a6 100644
>>>>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>>>>> @@ -25,6 +25,8 @@ enum iris_fmt_type_out {
>>>>>   enum iris_fmt_type_cap {
>>>>>       IRIS_FMT_NV12,
>>>>>       IRIS_FMT_QC08C,
>>>>> +    IRIS_FMT_TP10,
>>>>> +    IRIS_FMT_QC10C,
>>>>>   };
>>>>>   struct iris_fmt {
>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c 
>>>>> b/ drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>>> index 5da90d47f9c6..ceed4b5d96ca 100644
>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>>> @@ -56,9 +56,10 @@ static const struct platform_inst_fw_cap 
>>>>> inst_fw_cap_sm8550_dec[] = {
>>>>>       {
>>>>>           .cap_id = PROFILE_HEVC,
>>>>>           .min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>>>>> -        .max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>>>> +        .max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>>>
>>>> what about gen1 platforms ?
>>>
>>> With this patchset gen platforms will reject 10bit since all the
>>> plumbing in the HFI response handling is missing.
>>>
>>> Once the Gen1 HFI gets the bit_depth and calculates the buffer sizes, it
>>> should work. But looking at Venus, the 10bit buffer calculation seems 
>>> much
>>> more complex in Gen1.
>>
>> Is it more than accommodating higher buffer size by adding 25% extra 
>> for higher bits for decode scenario ?
> 
> No idea, I haven't looked closely how to implement 10bit on gen1, I just 
> checked if this patchset
> wouldn't cause any regressions.
> 
> It may show P010 and QC10C in enum_fmt, but the PROFILE_HEVC and would 
> not expose MAIN10 on gen1.
> 

I can sense this could lead to compliance failure on gen1 as the driver 
exposes 10bit as supported format but does not allow the configuration. 
I could be wrong here though.

Regards,
Vikash


