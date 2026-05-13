Return-Path: <linux-media+bounces-61519-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCNUJc3SBGr0PQIAu9opvQ
	(envelope-from <linux-media+bounces-61519-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:36:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A67E353A10B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0817A30072A9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4148C3B6BEB;
	Wed, 13 May 2026 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgdRRt6s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKqCmsQZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF873B19A8
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700436; cv=none; b=Jdn4NmXrtMIrkSRa1QCcmfOlEwbt9WjbAtdUBDLhf8p2X6/8m6njoa+WxE2sr9ixf/zW5PsJ0bAy49whABDeyrrT+qLR593ns9ItrRSUX1nbpmzv2PNjFg2VGdWKXdm8IXdxcUhrHYrxsYVbS5CxVWpVvB2iGsQA7l/vxW36fJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700436; c=relaxed/simple;
	bh=tV3pv7xKKDP1+S0W7Yp+8gNmAXnCpGwI5fcu2TVBbGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NivT4fmw6HGc2P7tgiiiL4fndoaRTFZXO+29SUlzdRLknSpTtYbcfy6c5l5vIIsQm2EX4xGz77vcIgpoARou/ThJpqKMtz3KvSbI3ZFWSxqiY1wn9E/vX5Vh7MBOYj9DBvptaukEI5DMu9mr69uc2sG449x737Qx9w1oeeE1HP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgdRRt6s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKqCmsQZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAq7u2524310
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XC1PMvPouH5s16VJkuyjTVmFB3EWh4Dc0i1OjLJSlro=; b=lgdRRt6sFBFm3XaY
	ys/pt33Wa5hjJqn7+akykyNrZozHF1viVZ26oPlIAcSrmALiqVta6EEs7qQfPzRr
	RHWwYDmE1HEtCkbJVsHiCJz5RN/Etf42i8G61UVkoOw1snUJk12ZfA5vvDkbSPqW
	GIHA44UgJ8BNtoa1Wpec7YmWvsTHkN0RKyTHkTdjGC/joYfMbT9isGiA74mmX6Qz
	w+OFopm6bYvmOoim17XhLtD+Eyp3pOOVDoJFy15/lTTVGWCv/NV6S0weQS4eA2iT
	uBiTpBpvFFVYZ1VrPb7rT4N2rP2SQgFCs9VawAtjRESEeEQkwPKJry9cv+GHAkWJ
	Szw+cw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjgtxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:27:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso3723572b3a.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778700433; x=1779305233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XC1PMvPouH5s16VJkuyjTVmFB3EWh4Dc0i1OjLJSlro=;
        b=VKqCmsQZ6XpkHyJ7l8cEKPyBlapebStaIiZq/jLH99Tp5BaW41xCzgaVdUbi5KSim8
         9Dlv/OY+tHn5sWDJXKEvnfr99MAnZHkn35PrOHS2NHuNne6djJVIExl0F9Qb9DYeYAxL
         QxXuo92yj6FrFywMjMr7LOmgA7O8pYvkqtqo19omPpmUjLX9JMkrpqpsyrxOg1TQdYR3
         qri4XpN4Ngln7PN+Bm7bO6T1Eh8ZtoDeN1SALPU6WnwCuKW83xJW8V5VDFH1UTYsaQTp
         pOxWOB2XALM6TAAmsjE8G29VRg0MvS4fnzNOEqsv6AFPFYcuIKGG7s8YYCeAblgHmVRI
         QFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778700433; x=1779305233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XC1PMvPouH5s16VJkuyjTVmFB3EWh4Dc0i1OjLJSlro=;
        b=tB8dXbapiNVcWwhiUvXk07QbbVVI9JYNLaGYGNI/gUsn6YiMOfxYgy9oMUABPTYjY1
         wFc8nmgtbrlSCe91mHq2LQgvjl7W7M1RL7FEY03OQIhZnLItvPiPe9EUxhzVFyYo5t9B
         TuDbREJ2nEHZsXz/Mbl6QrGYyGmzQoQH8nrFnjyeIWsFRn0kn1g44shQCeD6m5M20/9Q
         4FY74DigHiDxsF4N0Vvnh0wHUPouHhHrdtf9sRyEZqALYWFZyNi764gkyx4wRFZDxkZE
         nZ6v+S3VpTDHHK87g+Qa1CP9CYsi3FkUIXtM0Up51ea6uJih3fFtf4IhNLMU7TuYgItF
         7phw==
X-Gm-Message-State: AOJu0YyHUDqdQPvRvMXE1mSUeoc8rbWxIg+/PNqiuPQO4RM4TW6kRMT2
	ibu4dl5rXNgKMrWS86Fip/anI/NL/YGGRJgO780MGoeRPiGc+m2WlbVGPaHceeai+zTxHf+FKu4
	83uS6gPiFrixx5dOjohH9APbCDfCVaAseqe0B3RW/bwtPeVzb6UZLFdghv1KOndlPww==
X-Gm-Gg: Acq92OEzfUBDJO36LSTjNbHns971cR7pwCbsp+gNVZR7OoB0SskieW0adIeF+Q//RD2
	GrTOb4mfn2k7tsSQ0Mrl6KvFC1WrEyY3JtIcSOpdLLMOzhjul+fYvD4sCk7S904b3nQFWesO+Iq
	31NtM/ElEXNfqWhqEasX71F4E9GYhm+HD/XfTUxxK6J+yGHb8v3k6zb0v1x9v19JzDTnNEQol1s
	AOXzI8Si/IP+VKT1+wfri1I5agIQnXpWDter9ToDGIteWyLt9RA7B2Fq37n48Hlm7LC7pGN8h+w
	dF/OyxV+T2xd5MhT8NAAjUXQy9CJaDI4+DhWwRftzF485+AZVWlGlv/XxsiNlFPbG/HUugqlI3p
	FA7Xlr9m5eGRY+rgJurGzN/yfl4zCOzHMszHDCGNEfHDP+qxRyTazucXN
X-Received: by 2002:a05:6a00:14c3:b0:838:af72:fb35 with SMTP id d2e1a72fcca58-83f03e949f1mr5153308b3a.10.1778700433441;
        Wed, 13 May 2026 12:27:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c3:b0:838:af72:fb35 with SMTP id d2e1a72fcca58-83f03e949f1mr5153290b3a.10.1778700432966;
        Wed, 13 May 2026 12:27:12 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664220sm289587b3a.4.2026.05.13.12.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 12:27:12 -0700 (PDT)
Message-ID: <5fc62574-fae1-4bf0-b6b9-fb6fb33041f8@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:57:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LrYuEh0FBKOZfrZ5BCZAHWIamHLqL7kG
X-Proofpoint-ORIG-GUID: LrYuEh0FBKOZfrZ5BCZAHWIamHLqL7kG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE5MiBTYWx0ZWRfXz+xqbC0hSmO7
 R/YjOKVYi/q6dMZLK2/SXc/OugxgbD1C7Y10dBKOcuNc0aBBamSMDyaSEwVJyvm0KsCWcEBNLXy
 demkMuOZFm5wzUgxuGJYFtrSY5DtY/dhAURsTDWD8iVVE9tLX2w1nRqQ8v+f9EH/LRmrJiTNs73
 7OT/8dyXjjP7J5zvpk/qDcjgN5hznP8pdnQviuyJwyawVcmqcN+s5M2O36gVr5x/YLwmn1lm0cl
 CWeo8sNbpuh98l/TKLy7UpX1zth1AqPPzIbLWOIW8yWB6aQiSPDqF3THJb2ug8fpu3mEG+wC1up
 q+nBQ9wV/2loWUOf/1D65JC4uWd6sxfDIjYr4ptZ1tRkJG/GKbI8r69L05542pZ9wAEgWwqOXdx
 9NpUXlQ4TT3Leo6UokXxl2Cb2WSiyOCnc1exzwNTSfGYxH8j8v5qUa/jGrsQ9ioS/OXrlD8zT/M
 I3Iv9Exss4a0p8oWwRg==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04d092 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=vZN6g2wfPXE3sIqakpMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130192
X-Rspamd-Queue-Id: A67E353A10B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61519-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Action: no action



On 5/11/2026 2:50 PM, Neil Armstrong wrote:
> The 10bit pixel format can be only used when the decoder identifies the
> stream as decoding into 10bit pixel format buffers, so update the
> find_format helper to filter the formats and only allow the proper
> formats when setting or trying a capture format.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
>   drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580e..cd3509da4b75 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -18,6 +18,7 @@ struct iris_inst;
>   
>   #define REGISTER_BIT_DEPTH(luma, chroma)	((luma) << 16 | (chroma))
>   #define BIT_DEPTH_8				REGISTER_BIT_DEPTH(8, 8)
> +#define BIT_DEPTH_10				REGISTER_BIT_DEPTH(10, 10)
>   #define CODED_FRAMES_PROGRESSIVE		0x0
>   #define DEFAULT_MAX_HOST_BUF_COUNT		64
>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index eea69f937147..f4d9951ed04c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -99,6 +99,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   	if (i == size || fmt[i].type != type)
>   		return NULL;
>   
> +	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
> +			return NULL;
> +
> +		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
> +			return NULL;
> +	}

similar logic would be now needed while enumerating fmt.

VIDIOC_ENUM_FMT will now enumerate all capture formats (NV12, QC08C, 
QC10C..) regardless of the stream's bit depth, while VIDIOC_S_FMT will 
reject the wrong-depth formats.

userspace will see formats via ENUM_FMT that it cannot successfully set 
with S_FMT.

> +
>   	return &fmt[i];
>   }
>   
> 

Regards,
Vikash


