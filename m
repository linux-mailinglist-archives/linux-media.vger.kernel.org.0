Return-Path: <linux-media+bounces-61507-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BPKKDLOBGqXPQIAu9opvQ
	(envelope-from <linux-media+bounces-61507-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:17:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0106C539C1F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BBB53150BED
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C3E3ACA45;
	Wed, 13 May 2026 19:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwHgAQEa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrRjvr3d"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A594C3AEF34
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699116; cv=none; b=nHub4+/23CNC/ja2jM6AUQQdhgpmKOINv07GYHoLRfGAwmpvOY2pLgpRbSiE1Xge3Mr/rb2vOvBRw7qe+5KNM+suWyuhE+NpnFUMQQZ/4H6vXO7kW3ystirs1AMteNLLjGarj4g+JKyuDmqKUGnziqwkjnoUJzK0faIMqmreeIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699116; c=relaxed/simple;
	bh=SsMEpYID1WZuHEUR4hkzsm614xCESsi60+Qk0Myfzhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFQm7XUGwM91abTrC6CIl9cvJoHbrEPXZuGTZZAvf3qNah4O7i/kpaQtr5p+gkiv/7gpoXSaq1XxcgXHdPsoX8L9mE13YbLVbJYssFXFSe5UoaMbJN6i+pkPD2SbP3/FV94VS8ItgTmOBKWyO7lIVljV0lVX2Vrfttamz8BLr9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cwHgAQEa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrRjvr3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFdeD41242793
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Or8akwE4D0NRx487mlVzo9RIPU7uXy7D4zODRsalfzM=; b=cwHgAQEa5TXbPXse
	493kbAU2TlCNbddXH/HeDEvnnQWPnBWKoq7kFK+E96ujTjG1BokgmTSeSD7PnsnT
	PDhE80JYk/2lLUKo/6kLwWceVUTXLciYOa9quMc4Aa8q+CPwQuzszWiXvQhgPo8x
	gqPFzimCUZQsby619rE1oa4/AJvq+8wMOB98JEj5D7/C3iMbdAqciJ6PuWTTpsb6
	NZsvWbe3JAs/S0BHST7pFACBlH4Eymlno7brpkE39vcFgVeuXcgKshoWCWgEddZq
	ING3Rixvj+HrthkNSONQ0YNDL5LXyx97vJJIvcyn5sAJ4T6/HMv2GcEKBG2gZEkd
	TRee2A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4trv3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:05:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so6000110b3a.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778699113; x=1779303913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Or8akwE4D0NRx487mlVzo9RIPU7uXy7D4zODRsalfzM=;
        b=KrRjvr3dnLhqk/nFw0+yX77CvL4lDZ11VhJ40ACpMGYMmsOq6kJNfSZxYibFqEAHo/
         cXskE3Usi1eialnCEhdF9AmM1jJQA3fCEbwmg9g8yG90P6frmSQPoLlL4Ihibu2NKKkS
         eOHqK5U2P/1ozyl1NRYvDwbs+qmlF0JRzhal588AgNE2M5h1yZVXBpPz8JEgcb3/OLKe
         KHwMrH32reqnM9gUec0gS6CkJynh1Gj2e2JU457Fq9wHX6t2s9YLpgI96DnINgEqyf3s
         wSc97rqwZRFw6QR/41HKgEawU9MOYTJAWCQ8Fm/PTsy8FXjhaFmloXSaUlmcjQSaobAz
         VeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778699113; x=1779303913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Or8akwE4D0NRx487mlVzo9RIPU7uXy7D4zODRsalfzM=;
        b=B8COu4TmIL12cuFwenMbBXygmTKuBmnig9F9Ho4oriBOOmbNp3lSup5f+qrzNg4D2Y
         GLw9aesvQ7wWxHab+krXj+LGaXGpjr32ypk+GzWW2BbsfT4kGvVV+yuR4NhK9gj9Coqs
         wiEVKzFJzonqKKBmv0r93KJy6+Bt3ffLnPQr4E5Ehnj8frpRx/ZFfN7IEpM0fSmpl7rF
         jLQASfGBZBU7DCqEfwgMUGuHQwd/lNm9Hf9HS/aLDnPojncMB87n8xXrQMgNVGxkVIhr
         Zt1lz94j6pjsBO8GHQh2iHzrbznpGCK+Qv+KIPtzK6DfCDzBC67XDbOjagkwzLmFyE53
         sqsw==
X-Gm-Message-State: AOJu0YyuDI7SQDkhUZybq7LLOPof2/ceyAOSSGyJ9OeyhtFHoRHBEc9i
	rXYSnVWVrDnZnL6R+LJI4bxecr74s4lRkDgHdX2d866QqvEfuFjXKDKjvaJEAn8gQtJQ2lNJpTl
	g7FbH8rLG6Txs0N09e3kk+ALlgHQZUJ8z10N9SVN/dcna+7LSsNXzdvyfOyTBV2N0QQ==
X-Gm-Gg: Acq92OEm6Uzh8EFSO+6mgkgiweG7ztqDnEmA9kSHIiBnFOe1hTCP2haNEAc9nvjVYu3
	KyG/A8yGiz2hDfluY5426Bk8h0fBn30vF7wUUu+jLEWdJQTWPcPSnmtpqV7tAKdpzfxS2eiW6PR
	/3ACyHWpZdTL1cKiBKT12KbyPWsn22ENypCd3CwpcKv+5cvb+9gRIqINigQwnPy7lpsOEpeg6u4
	qKqMT8asXHuVSyPKd0IPtMWsYkzboq0a1/PtQHtIzomws5rwHJjen9CTRm0G4HzhGA5IVbn/Pbk
	aQCuH16mcARt7L8UxqYoMpVUIvs/hqlJ+wiT+iZpry5DEP8VTsoK3Hlm3n4rtRgno9HFSEZrvrF
	HPNbRxgBd9tEAw7m7gmzb+Z+0gVfVDy6GxINsgFrk716r55s+8YGor7Z+
X-Received: by 2002:a05:6300:210d:b0:3a2:f05a:795e with SMTP id adf61e73a8af0-3b0bddf8f0dmr731602637.3.1778699113184;
        Wed, 13 May 2026 12:05:13 -0700 (PDT)
X-Received: by 2002:a05:6300:210d:b0:3a2:f05a:795e with SMTP id adf61e73a8af0-3b0bddf8f0dmr731567637.3.1778699112673;
        Wed, 13 May 2026 12:05:12 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0ff4easm5121a12.18.2026.05.13.12.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 12:05:12 -0700 (PDT)
Message-ID: <8ee8e01e-fc55-4786-9c28-48fb17bf2a44@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:35:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-4-7fc049b93042@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-4-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a04cb69 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=ry5-__lr15mXsCcL3A4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NyBTYWx0ZWRfX2ZmMlz8IYzUe
 FsfzpumPJ8liXiN/+HOFm3xT+SySyOPuYK/KEtZywjPScSWpCqcWT7XE8yCm23NY6iBV3s8K1qU
 361lAF5fnpP/dXl3BirP0SiBJW214j6ismoHy04nd1PTFqp7vQ+Y6Sw7bXW4r14VVHKV+LEzg8P
 n92RHQfv/0kSrhenyY5CODT5cTdWfUTyVsEJbsju4c13MLk6dW3DNuheyVy4dISiWGU4vjM7qwL
 LrUy4cQwXVgJbeaSK+vM6RS1bDXROla7w3lGhcxcLT0qHagncOtEkskwS4nnntAE4g2F2CIl+te
 shYYmHvpcCA4ehMKyfoOFPXU2u26fAX8f7T4tZXId2GrM23sTxvPLhXoG76A2WhkthMmhgrcWoa
 DfNHnpROSOkDSRVrI/svktSF2RTiR8TKtV+f1uigXycZOoQ8l23mFa4BtC34PuNaFi1NJX0s8My
 hi6OMrh1U5RHRAuTaxA==
X-Proofpoint-ORIG-GUID: c0Zq5fLaSPF6zimz1XxHxIaxEOj46BCK
X-Proofpoint-GUID: c0Zq5fLaSPF6zimz1XxHxIaxEOj46BCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130187
X-Rspamd-Queue-Id: 0106C539C1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61507-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
> Update the gen2 response and vdec s_fmt code to take in account
> the P010 and QC010 when calculating the width, height and stride.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    | 21 ++++++++++++++++---
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 24 +++++++++++++++++++---
>   2 files changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 8e19f61bbbf9..0541e02d7507 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -542,9 +542,24 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>   	pixmp_ip->width = width;
>   	pixmp_ip->height = height;
>   
> -	pixmp_op->width = ALIGN(width, 128);
> -	pixmp_op->height = ALIGN(height, 32);
> -	pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
> +	switch (pixmp_op->pixelformat) {
> +	case V4L2_PIX_FMT_P010:
> +		pixmp_op->width = ALIGN(width, 128);
> +		pixmp_op->height = ALIGN(height, 32);
> +		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
> +		break;
> +	case V4L2_PIX_FMT_QC10C:
> +		pixmp_op->width = roundup(width, 192);
> +		pixmp_op->height = ALIGN(height, 16);
> +		pixmp_op->plane_fmt[0].bytesperline = ALIGN(pixmp_op->width * 4 / 3, 256);
> +		break;
> +	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_QC08C:
> +		pixmp_op->width = ALIGN(width, 128);
> +		pixmp_op->height = ALIGN(height, 32);
> +		pixmp_op->plane_fmt[0].bytesperline = pixmp_op->width;
> +		break;

client facing api, good to have a default here

> +	}
>   	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>   
>   	matrix_coeff = subsc_params.color_info & 0xFF;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 99d544e2af4f..eea69f937147 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -266,10 +266,28 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   		fmt = inst->fmt_dst;
>   		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>   		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
> -		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
> -		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>   		fmt->fmt.pix_mp.num_planes = 1;
> -		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
> +		switch (f->fmt.pix_mp.pixelformat) {
> +		case V4L2_PIX_FMT_P010:
> +			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
> +			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
> +			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
> +				ALIGN(f->fmt.pix_mp.width * 2, 256);
> +			break;
> +		case V4L2_PIX_FMT_QC10C:
> +			fmt->fmt.pix_mp.width = roundup(f->fmt.pix_mp.width, 192);

ALIGN ?

> +			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 16);
> +			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
> +				ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
> +			break;
> +		case V4L2_PIX_FMT_NV12:
> +		case V4L2_PIX_FMT_QC08C:
> +			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
> +			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
> +			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
> +				ALIGN(f->fmt.pix_mp.width, 128);
> +			break;
> +		}
>   		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>   		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>   		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> 


