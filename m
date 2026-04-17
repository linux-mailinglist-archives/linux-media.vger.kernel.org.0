Return-Path: <linux-media+bounces-58961-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLANMjLg4WkKzgAAu9opvQ
	(envelope-from <linux-media+bounces-58961-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:24:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E407417DF5
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A2413021E97
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 07:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D3233D4EE;
	Fri, 17 Apr 2026 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K5+al1qC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2+Ym+Bq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC73313E29
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410578; cv=none; b=pB6/EZmHieVc+ydtViATLue/lla1EBudRHFExeph2jvJeJ2NCCcnG7DNSy8BzLmJlVMs/aAWAGA//n8db2uXTtqZSoigNvoyY++NWYpLg6p1l8xEDSpXIGsQxpotfCTPGVx0OgUq7yLnT0Nxp18Ala3FVray6gU56w0lCm5a7Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410578; c=relaxed/simple;
	bh=UJgzyvp8IsFYlpKz06IFX+wXpWmB7rGHydrnTHw/5Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdFRt0SCBt/bpkeLMmH4kTYe6VQdvrzYdkn+p8F2+JbHHkVF+oy997L0lNK6nxXopONPZpEUaLMCv8jhh3A6vc7fKdwVkgJhX/FZYoXBVhPWeIodfVux/7jNGuMLy8/WSfhQqEWlsSr6zjsW9dZAYGejtcBjje7XhF/fQ8qoJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K5+al1qC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2+Ym+Bq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0fraE1981949
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 07:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlzWYEhWl+ZJwHWIE9kkJeytw0Lnh1NUX+uLXgzgrds=; b=K5+al1qClvJTL8dT
	NiLyLOD1AdLebM+Acm/RJmPQ7T45RAbHlpAh/9zPdQYWviBeK3rBSnR3JnE2CcKg
	F9T0V8yqEW92Eq+S89nGpzqtJOKB43the83n1xZn13xASWs8Asj0EopqWBrh3GZO
	i9wbWgnxunUU+Naxs378my4TQbiHYI/0D+jwxlY2SW8c/mAClI4naZc3/Z8ba244
	nLOnvGgSkmCew/wpmgeVfmPIuf+ufk0iKSMgj3AC4ce6AZmN1lnqb90PNvGQyvgG
	Tssl8rl84aIGAW+8WjDtkrmhlT+wGo3eoiBeKDPkRJSTUhcU+4Sqsr4Hv214Htad
	H6Pgnw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk52jj2kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 07:22:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354bc535546so430977a91.3
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776410576; x=1777015376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlzWYEhWl+ZJwHWIE9kkJeytw0Lnh1NUX+uLXgzgrds=;
        b=f2+Ym+BqQjEGEGu0glkV0fWK0tDDr54UQb8aFbpNZjlDdc4aiTg+DBfPHR5122x97S
         HT/PwHisW7KXJoNFSoOxPR9nvgSy4Jy2WSHJzUJAlMLhqB864dlL4/ngYZ3F7o2jIxSV
         icubXsBQSsmYUiVzZiOnUkEJR4KlQC3tdDqXA7hMsic62UvK/7oTA/+k+oUZO62nUlnA
         o1Ocq8Y4FSG79StRqqvNEseQCOUj6DTKMwjmB1sPIAKfOaj0pX6lPNmZGVx+CoSB/MMj
         m7H7SRxwzt5enY83o5e+AV3nDTWTImlLGRbXW21HNLd7AGnXgxQKwZJv+jscaAx9Ze8n
         mx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776410576; x=1777015376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlzWYEhWl+ZJwHWIE9kkJeytw0Lnh1NUX+uLXgzgrds=;
        b=I5O8oC7C+0Ur+Y/QQsQnwqoMs/GpMEPyxbrx9+71bklGNAB1t7rjBZ76SxisDQ7ost
         OvLLG5NXtBVUSaVziHSZ9qaIgES0zTel8o9cAFm6LxEThVSENbn9cM1t65RoKPXILo8/
         YqJkgKUfHe77q8lXdaDieCXiqDUM85rx6jxUivA6ZdKXbCUNCt1cbKAW1xwJJfyBpYNx
         lPzTl6x98qnXnHS7QY4FBmjRjU2LpX1kI7N0gs+3gTQmEhdRny5gGjKx1PRZQpGptE4K
         WdaVW+jm/yEXfHdq8J+EPl9RFuhwd77HTx70FCBzqLgXkkMpmo/rnpaKUfwrfEvNpomb
         gWfA==
X-Gm-Message-State: AOJu0Yw6pYJSH6V4k+1GkiU/E/eW97iDxMummzosd0fNGNax1mnxXZDs
	9gss716r+kejH0XVRwj3esNaJHyLyd5L5lOheXj4biswPgxW1Q1Xs2HCNaJIPYoCn7n2qA+HVAm
	1sOkVXBqmlhif95r41BtmR/1l8a+NE47Ke4Z+sUkXVti72ThwGYnAU94Qh/4tC58zUQ==
X-Gm-Gg: AeBDietsKSCAQ6zw28Kcr/KYU2FEin40HeINLjHHiDf3UOy5UhCdWiPJksQ9PYpKAe5
	JUmE4mAtsWU5/dg8dBDpc4usaLu5SzjyJxBqfaEyYWLUpnBZZoruUuFiTdabkr1BLOL+X15xhoZ
	kKOL8JIIfoESfCg/DuGCXYG20XdcQRsX+y+qlIBPVcLGd2NeF6xVAkcimCKDC0zMH3vyyl2CqqR
	PXkMOyE/fyv2clJLkhtVipgXNsNXrie0rZGtr4PqruSOrmw4AGU3L1erCRd49575WmXGD36Syn+
	aKtg+FKO01FG8xB8Resr/x30FDV2kXfALH/t3A3WofgQjBpz+q+3+6AOsyIu/kOnTjE5jyn2Xcr
	9d5D+9R7+tJSZQDIdqraoexlXBPUmQ1ACp5uWepADg7y/addguUxGie3/2QGHZYlI
X-Received: by 2002:a17:90b:164a:b0:35f:b572:ece3 with SMTP id 98e67ed59e1d1-361403bd001mr1808883a91.6.1776410575881;
        Fri, 17 Apr 2026 00:22:55 -0700 (PDT)
X-Received: by 2002:a17:90b:164a:b0:35f:b572:ece3 with SMTP id 98e67ed59e1d1-361403bd001mr1808850a91.6.1776410575311;
        Fri, 17 Apr 2026 00:22:55 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.231.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613f5766c4sm622269a91.0.2026.04.17.00.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 00:22:54 -0700 (PDT)
Message-ID: <d27e1500-ac4a-01ac-084e-bb53aa1f63b0@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 12:52:50 +0530
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
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-2-428c1ec2e3f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=buR8wkai c=1 sm=1 tr=0 ts=69e1dfd0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=llJV7PLoYzplBNayqe3woA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=VRqzhRILX_6Jt83UIxkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Itx0XGvKUfCsY7yFv0h1Wu5QgebHBl5f
X-Proofpoint-ORIG-GUID: Itx0XGvKUfCsY7yFv0h1Wu5QgebHBl5f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3MiBTYWx0ZWRfX0fBWYqHUfgKJ
 Xg1ip9yazhIKCxCUi83Hf3AnQq0XVdxH/HGgLX179VoSBmrNKEwCzD3XzFAQ3Fv5ZvDOlTyUjgx
 b/NskZPZJznJaXY9yqe9fD/YXT4tHJhmizWTRuzkr8eBgWXGQvcIhu5OB6UZF483P6Xjrnn7LJG
 PSwiGUZwPRr/nzdqErj2jzAa0wauaTBB0MOql3wczyGQCQHOapr0WyjU4Y1Jjtiqq8oM4eooYAi
 8i91xRpW3JJSB/WxETlOdh7Khb7B8inpnzR1eT9upaK1gI6IXUYJlubtluZbe4kA5gSg9uSn+xS
 AvFhQIC4hEJJocvNiyFt2oZm+kw97bY79Ds88xv6FRCtTFHw6EDNkY9e/+ZEDwM0LLQ2P9+m6IL
 hebpQuH+xSxXeYCn1s3T5Q+JWIQ4pQPnldv3ePnLnQ2X2gkk0dNMyDhAXSN7/eit/470TRd5QCB
 fflnNgq4bTKzhkrZzig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170072
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58961-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 4E407417DF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/2026 10:13 PM, Neil Armstrong wrote:
> Add the necessary plumbing into the HFi Gen2 to signal the decoder
> the right 10bit pixel format and stride when in compressed mode.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71 +++++++++++++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>  3 files changed, 72 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 30bfd90d423b..8e547e390fa3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>  
>  	if (inst->domain == DECODER) {
>  		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
> -		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
> -			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
> +		switch (pixelformat) {
> +		case V4L2_PIX_FMT_NV12:
> +			hfi_colorformat = HFI_COLOR_FMT_NV12;
> +			break;
> +		case V4L2_PIX_FMT_QC08C:
> +			hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
> +			break;
> +		case V4L2_PIX_FMT_P010:
> +			hfi_colorformat = HFI_COLOR_FMT_P010;
> +			break;
> +		case V4L2_PIX_FMT_QC10C:
> +			hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
> +			break;
> +		};
>  	} else {
>  		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>  		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
> @@ -517,7 +529,8 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>  	stride_uv = stride_y;
>  	scanline_uv = scanline_y / 2;
>  
> -	if (pixelformat != V4L2_PIX_FMT_NV12)
> +	if (pixelformat != V4L2_PIX_FMT_NV12 &&
> +	    pixelformat != V4L2_PIX_FMT_P010)
>  		return 0;
>  
>  	payload[0] = stride_y << 16 | scanline_y;
> @@ -532,6 +545,57 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>  						  sizeof(u64));
>  }
>  
> +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst *inst, u32 plane)
> +{
> +	u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
> +	u32 stride_y, scanline_y, stride_uv, scanline_uv;
> +	u32 port = iris_hfi_gen2_get_port(inst, plane);
> +	u32 pixelformat, width, height;
> +	u32 payload[4];
> +
> +	pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
> +	width = inst->fmt_dst->fmt.pix_mp.width;
> +	height = inst->fmt_dst->fmt.pix_mp.height;

This HFI is only applicable to AV1, you might see some corruption due to
this. Please check.

Thanks,
Dikshita

