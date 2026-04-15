Return-Path: <linux-media+bounces-58780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHh2IHgz32msQAAAu9opvQ
	(envelope-from <linux-media+bounces-58780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 08:43:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA2B400F67
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 08:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66B3C30B4115
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 06:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B52139023B;
	Wed, 15 Apr 2026 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMRwnpvb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHL3VjMJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AA13803EB
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 06:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776235149; cv=none; b=erDFnJEmE2NNh2zl0xIOrnNRt6Xw2HI1td7e1HqWY6k/EjpFqt1zdu/d+VnkHDKE+eV7weHVqthofQo2jsG4Tb9xybgoqYz1dQlh3qFbyjQVfopoz3jjTjxVFUx1LK1+TDEcJXvDQhlvQiSaiN50OKr/8DL+s25SjoSEmpAbHt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776235149; c=relaxed/simple;
	bh=vtQ7cauf2a30cH0wbYRSCeQJZjnkFBDa7ZqMd9jfows=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyqBtY8ylOgDUMMxWkh/IzvWDkeS26AG8k5eJdF1uHSoVJZEuNg9rnciTadGvpvGBlGdvMPtUXgOGECKBjU6+HJ5796BBQhCNVNgx3YNm1jnRb4cW3lb/VVobFFrSWeQ9gO155sd6wTYk4cfOpQQSaLIo7+iPggpNlamt0vRpOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMRwnpvb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHL3VjMJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F2deH33936811
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 06:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tcqevKYcvLQFkBP6SAaO9TMJY403tMBt0fptayYFG1A=; b=gMRwnpvbAvZv9Sv8
	UKFJvLJri4y7j5qkpR6U/pbL8QC9ZqLNmnpo/gbiL+WUJ3W0HOFitWIByFTOC9EV
	+r/dzy6Iv3/VKhs1Rs2mC2vHsqjC/u0GtEZuvgnO10aM2rW1TewYp3pUmpKcWf04
	OwoqGEIrnP+hOKDYFn8l6HkYAFYC2gK11l2Y0/Dcva0tYqu1nkPH6Z4QaQM6ByjF
	TYLLSYVbCIgiyIu7ovQbej2UQ+8KrJNkc9VsTfnA9dUQmzVwmHTxEFkr5S6j2yF8
	GhRz/XwCM4U/n3+WqcFodqIvCKk7XX85u2aIbetrTyjtpeZz2XQAlfAH9HOrohsd
	vep20Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrbf2gsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 06:39:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso35257905ad.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 23:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776235146; x=1776839946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tcqevKYcvLQFkBP6SAaO9TMJY403tMBt0fptayYFG1A=;
        b=WHL3VjMJU60mjsa+OILj9u9l0GzsNXG+SZtfFJHIOeI/5d087CsdJXXyvbZt3dTzLM
         sQGMfSMPaP4KQ/NOGLVAJKPMOHPYO62h54G5ATLQyXkk297e7JWqL/SeqLs6dSijl1FA
         sxoysRCJ8LEX7ivfOrC9oRH2Cx8S24VzMslUzpMjNTtPXnWojBDHVlIULIuOhFVhhSXG
         1w/ozGboqK7H7Ocyo0L+klLkF/BrDZ9cEDP773hPskeYkp8/9PkVaCWdrHJ2xMeuO4O4
         K66+c+5pQOGyqLnr76q5m3UO0+pJwuNfuGcfNGYnP66kl1UxS6eTLVqRy3/qqsVx5fCd
         jjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776235146; x=1776839946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcqevKYcvLQFkBP6SAaO9TMJY403tMBt0fptayYFG1A=;
        b=nMmnDUlJ+ms9vn/ozeAtGXt9u80pZCohbX6dLBamrU+SYy1fjKpIB4P/KjHgXQH1Rj
         bFS0p+WeWgio+96vp5s89R/PHEdevU/8E50Me615qJshCO8ldubQNjsCtk39+ZvdiL+Q
         tdG/rH1cjILsQYiW4i6cWTdPf445hrgFd7srivUMuvcKsbcNl0yowwuvSkCdldGkSp2q
         mhwdR2VlUpGV6lu6iCQP89/UorIXaBi4pS7P7EFGjE1+WpHTlmfcn+oVz9TNImD9VDOu
         rzFggTaUHDDQgw+IBxH7ITGr6W9DKJYoCN4A+oIqhbcxmcmg62XSQFo3V/WGtlozcivK
         imEg==
X-Gm-Message-State: AOJu0YxGVJILlQapEafJcSn0wny5VAyDWGTzcY2V/UWYrOm4IYvde6TS
	phbLr6qNNnIt674kj06FWqFjM2sIl0YZ2yNkw+tE99M2fNTgABQv7zI39Sj8mTnidX87bjL7e0Q
	/9OXoroTEqKhcaQY2+EnVNx+eQRZwMgjf+h7NxfwbziNUKz4eH4r6W9OPWjMA1rMKPA==
X-Gm-Gg: AeBDievRsZltXTbUBSZMhoHsUpBvC0A3XFaR2QFPjfbPPQs/RtHAAE9VmSDiWRAoaYU
	IExDkbjDkBairuvGTAdhKm8F61g4vA4f0BqgqPXpCA/7NmQfXuMO8NUdbHfBpZw+XXEJXF36OXK
	ZwKPC4DyzC7p8UvY4Qt1hg+6sSf82LkKs4HU6FjkbnAZpWBFXcNBdb76lJcS9kqQjIUEfF0Od2f
	50sF4jmpd84/94jiNO4eo6aDENptfVOwzRTZT5S9Xp89SxqBm8sYQgWRI50V3t0VNTsHO9ezjpc
	D3tSap+Hli0jkxPlE7eLDf1ilFTUQEsKXlwWOfWyXc9tBsLqRpH/M/Sd5yObWXsijoWSAPYmwru
	NIp47WcCBQOTkYpFFLMQ3UAUOAEYoSZdksk44Z9+x6jjdo8zrBh7kDA==
X-Received: by 2002:a17:903:3e29:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2b2d5975cfdmr143084085ad.5.1776235146364;
        Tue, 14 Apr 2026 23:39:06 -0700 (PDT)
X-Received: by 2002:a17:903:3e29:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2b2d5975cfdmr143083805ad.5.1776235145789;
        Tue, 14 Apr 2026 23:39:05 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782ace42sm12398615ad.68.2026.04.14.23.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 23:39:05 -0700 (PDT)
Message-ID: <faa04229-1070-3a2f-94e6-a7e238fb8121@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 12:09:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 6/7] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-6-428c1ec2e3f3@linaro.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-6-428c1ec2e3f3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: s-rQW9C2T4W3BWsjZ8nqNceIw81laPfa
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=69df328b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=6ikEG6PPlcl_cW5we_EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: s-rQW9C2T4W3BWsjZ8nqNceIw81laPfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA1OSBTYWx0ZWRfXzhlkVE9FawB+
 HhBJvK1II9VZRTgUrhAVboGUOiNOlwrV7cb8N7VLIgtRv9odePK7R5zkM7m2BnCdqg6JW3eWBc8
 yJUcC0LRfickugs9WDZVdfVHfCIPQpehATYNtfBzJeHelPPMmlXWx2pTT6HGhdXa+7LDpTGEp4m
 U1ZO4tpxvDn5y4wDysPLPfQMCpujJdjgEiIum3pWUAzoOjWhxdR16gE13T4dHV9hUDJP5e4/Wr8
 UF3sRkcZxZpn+UTYxbbFCXoXmwdpMmR9H9cHwrQbMHDOYi3fmZaWC7WorwPnZq9soHFL2znbTNb
 EOnshrlfhtft6p9+rtGYj04cslQLH2XbNDKrMSCkVjaJPB1sSCyMztnxivLZJu7bt12GgnlbAcw
 hEMgjVJye3XmlkTfByDnu/3llwmWI5IZt1FMmrJGApMW9ildV14jh4l8854F+jNjOteL+hfcwL+
 PgBYFTZeBe28sCWeiow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150059
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58780-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBA2B400F67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/8/2026 10:13 PM, Neil Armstrong wrote:
> The 10bit pixel format can be only used when the decoder identifies the
> stream as decoding into 10bit pixel format buffers, so update the
> find_format helpers to filter the formats.

This series breaks the v4l2 compliance tests for the existing platforms.
Decoder failed for below:
VIDIOC_S_FMT: FAIL
Cropping: FAIL
Composing: FAIL
Encoder streaming tests failed.
Please check once.

Regards,
Vishnu Reddy.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 41 ++++++++++++++++++++--
>   2 files changed, 40 insertions(+), 2 deletions(-)
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
> index ca0518c27834..bfc13c1044c7 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -105,6 +105,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   	if (i == size || fmt[i].type != type)
>   		return NULL;
>   
> +	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_8)
> +			return NULL;
> +
> +		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
> +			return NULL;
> +	}
> +
>   	return &fmt[i];
>   }
>   
> @@ -113,6 +123,7 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>   {
>   	const struct iris_fmt *fmt = NULL;
>   	unsigned int size = 0;
> +	unsigned int i, k = 0;
>   
>   	switch (type) {
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> @@ -127,10 +138,36 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>   		return NULL;
>   	}
>   
> -	if (index >= size || fmt[index].type != type)
> +	if (index >= size)
>   		return NULL;
>   
> -	return &fmt[index];
> +	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +		if (fmt[index].type != type)
> +			return NULL;
> +
> +		return &fmt[index];
> +	}
> +
> +	/* Loop over the valid capture formats and return the index */
> +	for (i = 0; i < size; i++) {
> +		if (fmt[i].type != type)
> +			continue;
> +
> +		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
> +			continue;
> +
> +		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
> +			continue;
> +
> +		if (k == index)
> +			return &fmt[i];
> +
> +		k++;
> +	}
> +
> +	return NULL;
>   }
>   
>   int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>

