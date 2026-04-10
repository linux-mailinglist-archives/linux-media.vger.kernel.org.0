Return-Path: <linux-media+bounces-58550-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LQDBQz02GlJkAgAu9opvQ
	(envelope-from <linux-media+bounces-58550-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:58:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CA73D7CA1
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4ADE303101D
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C643A3E9A;
	Fri, 10 Apr 2026 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knOQ31S7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgVkExr4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C995939BFE0
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 12:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825860; cv=none; b=D4CeTLYUL/yIwng0ela4KhhFfba5LoyPeSBus9O36aj3GEhhRvIj+fNCetxYhcJIldaG9krQ4hRfY6y4fGHbCUd1ho4eviJlXpSfUUJHXkn4GVKit/ws+XXbM5Q3szBQD+FbYjHVaHHtxjzLKfiQtRLuKZ2VrcpGCv0tkj4IgZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825860; c=relaxed/simple;
	bh=mfaZUJoHVDJgW+z7YKj21ofq85T85uKHQ52Uu0jezDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kqAmopwrfEf2woEK6ucdHkQ07dt8V781dQWvDyNXE/2RbXXjEjIHahHQVgjjDrtvXSua/WUtL8t0dGMC7QuxwOc4vPYtL+EhAo1r2INqYwlLisLGoITtTu3B7AcX19gXbLhO/c+oKkTJhVJ6i0tmquULMmAMB73Rgvobhu96HeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knOQ31S7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgVkExr4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB1bZq1322755
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 12:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ds4zVlgBKaP5o4ff44iGCCaeyreSqHBxoOUNC/HcPH8=; b=knOQ31S7w86/H/om
	tvgvsCqM02t8L9eeb1S85SWZ7lv/7vw9n++v6Z7bChMQRshKQe5/FB2VBaB8zUwt
	Kn/u0bG9scuS3HFbylXuxfIzjc9LPfp5Z0VvMgGqFj15nODkZu5XOHokM05a6Kzc
	FIfk1rDPYdS6BRvuddC7RTH+98A9n8MabyhxuNCEQdFaP4hDZz2u60CPjcOuUTO2
	CV3lsXxwHLFALHDrM2yNBrNJqilIr9GEzoExEeag6XIU8zrbL/seLL3ukvyK9tDX
	HzxNIDD+0RCld3mizEl3N6Gn4ZT8nyDH44de/sTIN04UNirkTIS/i0aZIN8LLDhf
	QwAg5Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyyh8b97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 12:57:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so2337867a91.0
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 05:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775825854; x=1776430654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ds4zVlgBKaP5o4ff44iGCCaeyreSqHBxoOUNC/HcPH8=;
        b=XgVkExr4bm/NXwDDY0d+X3n67OcV1vsJpeHrFUcSCvTkvmb0cNtjsXhllPCC2hcnLp
         VrErt0XeEPu8Xzp6iRnoAdbo0CRWiBFHNAbukjE0B9Ib3kQgOeZKg4gBkC8AbKa7uf+Z
         cp947Z6uNbHBqbBizbEGXCddbrJe1uc1CwJtO0oYuQLLWB9+HCKCZGKOjvZHxvs2lHZY
         HjQeUP1iRWhDeMIy/iKAVAKthtrZC8bMoNM4qxDkTG8GRb3zWj4LmKvnPgNPRMBW0ohO
         xhy33t2rsGWQay7+oXarY9uUmZKtUVhaEILYTcp1nxzUu055eyJM865JiQzy8Bwaf4Bn
         noQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775825854; x=1776430654;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ds4zVlgBKaP5o4ff44iGCCaeyreSqHBxoOUNC/HcPH8=;
        b=lI+OIMeff/eFn66Rqb0Qp4kwH31NruJTXQ9LH/q2jEn+7ESfUyLVU9QXb1qYpRo2hW
         pealw0VvrvNjtSFrPUn8ByJqXIdlj7QfvF6CbMjV9ISCfsbx0Irpe1tw9xgSC5L1A5LM
         5/Euimr6vndPhQ3gFVWhtoAuJiasoQ1Kfngu/1DiFCy0Y/Qts+GnfJW43mDcC67urKOv
         4mCX9khW+DBUosp5RwIw28u5g6V7pkUNrhhJHCHtbySJQj92aHZT4bx0BywMeebmeAbO
         vA/vPueii3p3LVOlCPYayXeG+e9AaG0irw6noaXuuFZGhIhftOjZei1lhBZ0Sb3V/xAQ
         xttA==
X-Gm-Message-State: AOJu0Yy+MVthrRtVLw1j/xlIXLWCzg+pImfnjCiWmuUegbpGnO7kHXyu
	47sTQ5qaPnOx7LkR73fvc/d1Cj7fpVBU0DKD9m5KoQvMpRwHQqAsYdSvt4bOf57GotPDaspVO/0
	IsD3a9OZ2Y8K9Z32PXOiaCXXxWyzIx3BoqPrW6WxXGEpvConDgR7awFrVXxUK2boAWw==
X-Gm-Gg: AeBDieuztlKok8QS5Mau4Hl1GpxDaL4fKW+pQqgqpCYDG0Yj4DicaXXf6oDzT/Js8hW
	mmJjpzshqnKH6CWQOqbBF23capzyQaYP0R/KBfFdON52suemKZadJ9oup+v1dXTx2ZQvjoQ321/
	jmpz5To7KOUaXmQuZE/XSPA2H+fJZxcu0P/l7HuAM6HkfaFSbMIV3Xym93pJBqVOlDwCoTbCMDE
	qz+L+F4oob92dGlFm37VWCKuFmpN/3NDGQAD0aOCZP84Ft8H802u1Q2I1POAP06PtnE+s7fLj8j
	C9j0hedo9QsTT2pSu0NTmvE3altJgByS93T7jgkV1MnqmZ/EoT+VZqCKen/tcBhj/+1OZzA90Xw
	z+B1SePNetjcEhO15guuHyzEULH4CAvd/kq3kdAXrOGAf9LrP8dTtCQ==
X-Received: by 2002:a05:6a21:6d8c:b0:398:9e47:f5ff with SMTP id adf61e73a8af0-39fe3c2d6d4mr3338019637.2.1775825853666;
        Fri, 10 Apr 2026 05:57:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d8c:b0:398:9e47:f5ff with SMTP id adf61e73a8af0-39fe3c2d6d4mr3337988637.2.1775825853173;
        Fri, 10 Apr 2026 05:57:33 -0700 (PDT)
Received: from [10.228.28.18] ([223.187.29.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a20100sm2283911a12.29.2026.04.10.05.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 05:57:32 -0700 (PDT)
Message-ID: <7db19009-4e33-945e-789e-689b72c39aa5@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 18:27:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 4/7] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-4-428c1ec2e3f3@linaro.org>
 <99eb55a8-6370-bf7b-f9de-e88231454b0e@oss.qualcomm.com>
 <0301bf82-0859-44cd-99df-3de997e2cff4@linaro.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <0301bf82-0859-44cd-99df-3de997e2cff4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMSBTYWx0ZWRfX3uUxza+05ZAz
 dG4V1wD+CIlLtbU0nncAS6wAkN/tqGw4qJJBVvsoQ0XFaQEq5CvL/Dy5o1ENCKbaxx/oY41pv43
 eykyNzy3EswNl7MQnhK5umzqTC03Zuo19GOJwRifxExl4ac7XuPTF1qA7Gq6vowhJYFS7LW9C4O
 PzGbqlB7el1qWLHmfG6iBxPvm7RvbtZCP6oHNL1e4qucOdZ6ZS/O+c//YkAVA3vBhQZeDArfeCr
 w8mMuqamx3LPdeh9ZBaq1Mhwc/wilFE9OeuCzdIs5ySLUgsoVPOAMGf8K1QSAuYWf7Ze6Y7aT5j
 0HGwDX7sbzBoGqXfzVzG3qMc7a3X/6HanVqAqoJ7tRJV2kNQOvCww84DbY2YxNq70I2NePpSIQ7
 9RnYGAOEezUatpA5JExhrqF1+5yZBse8T21MBkZNoVY1CUYpu/mgUWNEaKpfTFKmwOa2PoRTOcJ
 TMrbU5GaZn+k+LxdhYg==
X-Proofpoint-GUID: OnwTuNZifHwUfh-WqRTUKZj1nv86pU-q
X-Proofpoint-ORIG-GUID: OnwTuNZifHwUfh-WqRTUKZj1nv86pU-q
X-Authority-Analysis: v=2.4 cv=Wv8b99fv c=1 sm=1 tr=0 ts=69d8f3be cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aYLc1Eu5VfAKJ9dfaigxQQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=vnVwoM5oVR9n0Qh_OwwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100121
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-58550-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78CA73D7CA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/10/2026 5:29 PM, Neil Armstrong wrote:
> On 4/10/26 12:10, Vishnu Reddy wrote:
>>
>> On 4/8/2026 10:13 PM, Neil Armstrong wrote:
>>> Update the gen2 response and vdec s_fmt code to take in account
>>> the P010 and QC010 when calculating the width, height and stride.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../platform/qcom/iris/iris_hfi_gen2_response.c     | 19 
>>> ++++++++++++++++---
>>>   drivers/media/platform/qcom/iris/iris_vdec.c        | 21 
>>> ++++++++++++++++++---
>>>   2 files changed, 34 insertions(+), 6 deletions(-)
>>>
>>> diff --git 
>>> a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c 
>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>> index 8e19f61bbbf9..d268149191ea 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>> @@ -542,9 +542,22 @@ static void 
>>> iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>>       pixmp_ip->width = width;
>>>       pixmp_ip->height = height;
>>> -    pixmp_op->width = ALIGN(width, 128);
>>> -    pixmp_op->height = ALIGN(height, 32);
>>> -    pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
>>> +    pixmp_op->width = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
>>> +        ALIGN(width, 192) : ALIGN(width, 128);
>>> +    pixmp_op->height = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
>>> +        ALIGN(height, 16) : ALIGN(height, 32);
>>> +    switch (pixmp_op->pixelformat) {
>>> +    case V4L2_PIX_FMT_P010:
>>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
>>> +        break;
>>> +    case V4L2_PIX_FMT_QC10C:
>>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(ALIGN(width, 
>>> 192) * 4 / 3, 256);
>>> +        break;
>>> +    case V4L2_PIX_FMT_NV12:
>>> +    case V4L2_PIX_FMT_QC08C:
>>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
>>> +        break;
>>> +    }
>>>       pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, 
>>> BUF_OUTPUT);
>>>       matrix_coeff = subsc_params.color_info & 0xFF;
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c 
>>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> index 719217399a30..ca0518c27834 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> @@ -272,10 +272,25 @@ int iris_vdec_s_fmt(struct iris_inst *inst, 
>>> struct v4l2_format *f)
>>>           fmt = inst->fmt_dst;
>>>           fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>>           fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
>>> -        fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>>> -        fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>>> +        codec_align = f->fmt.pix_mp.pixelformat == 
>>> V4L2_PIX_FMT_QC10C ? 192 : 128;
>>> +        fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 
>>> codec_align);
>>> +        codec_align = f->fmt.pix_mp.pixelformat == 
>>> V4L2_PIX_FMT_QC10C ? 16 : 32;
>>> +        fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 
>>> codec_align);
>>>           fmt->fmt.pix_mp.num_planes = 1;
>>> -        fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 
>>> ALIGN(f->fmt.pix_mp.width, 128);
>>> +        switch (f->fmt.pix_mp.pixelformat) {
>>> +        case V4L2_PIX_FMT_P010:
>>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
>>> +                ALIGN(f->fmt.pix_mp.width * 2, 256);
>>> +            break;
>>> +        case V4L2_PIX_FMT_QC10C:
>>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
>>> +                ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
>>> +            break;
>>> +        case V4L2_PIX_FMT_NV12:
>>> +        case V4L2_PIX_FMT_QC08C:
>>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 
>>> f->fmt.pix_mp.width;
>> In the removed code, bytesperline for NV12 and QC08C was aligned to 
>> 128 bytes.
>> In the new code, Is that alignment missed or not required?
>
> The alignment is done right before:
>     codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 
> 192 : 128;
>     fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
>
> calling ALIGN(f->fmt.pix_mp.width, 128) again is a no-op.
>
Here f->fmt.pix_mp.width is not aligned, fmt->fmt.pix_mp.width is aligned.
It should be fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 
fmt->fmt.pix_mp.width.

Thanks,
Vishnu Reddy
> Thanks,
> Neil
>
>>> +            break;
>>> +        }
>>>           fmt->fmt.pix_mp.plane_fmt[0].sizeimage = 
>>> iris_get_buffer_size(inst, BUF_OUTPUT);
>>>           inst->buffers[BUF_OUTPUT].min_count = 
>>> iris_vpu_buf_count(inst, BUF_OUTPUT);
>>>           inst->buffers[BUF_OUTPUT].size = 
>>> fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
>>>
>

