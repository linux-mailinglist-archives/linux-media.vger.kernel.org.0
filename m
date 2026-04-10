Return-Path: <linux-media+bounces-58531-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAJqA8vN2GngiQgAu9opvQ
	(envelope-from <linux-media+bounces-58531-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:15:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FAB3D584D
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 365C33017C09
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6483803E5;
	Fri, 10 Apr 2026 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ix+X0e4r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LS6TnZd6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000463016E1
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815820; cv=none; b=Ptk3rn/2QncHF/kn+CZ/tXz/xu+2hYq8/EnztzWMfKPDe+5tRZeRYVPtUEkoVA6DFXPZJa9CuDhhRbPqxciOBiy2qYPSLDyafu+XSYdL8rVK0oI8kwtlYBKp61/agfufVhaQIdWB1BIo628XEQeagwjwW9BQcMGMDutXWNdSbYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815820; c=relaxed/simple;
	bh=2OV7x9Lv/OakKlu335yqsl8m0c90dxHBGy/Fy/fnXyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8jL6+IobRniS0BWSJ3qIY8pBfOPkXQtJ6WimM24Go2GseJldd74zrGy1D4d35cp5KVeoAHSQ/A9gaWwSnclybVRPfBKAX4G0UQleYkE7FYw5zAsKBoH6VWIYB195vWiE27PG6fq97HifBO0A6dj/amevVcckq5VIsasxnS1JSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ix+X0e4r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LS6TnZd6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oY0v1925776
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 10:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50pbHWz5L4Ep8xCFcd58OKxaduUzmduABDRD2HJ+f0E=; b=Ix+X0e4rkdPbgHYr
	zpWv3zUVcA28HCEeq6DsnoGa99IPyAyr1y9FuDaC7MzX5uIgSgEDf3GrQHCo5pTa
	DDIo5JycuxVzgp1CcnNjCCd33iJ4WVetTFEtHpGy7KPXf5xf47s1VB5JSipftHrD
	4ZKiv12DPbx5JybQuGr9m4QEB/RU4WNNarcatZHaWcBmc7DTWbd9Ul/aGlSEhn2e
	LpHWHm3yusK2+0FE+IB+zsOQQ3i7HYfWUr2d6Py0oTySF8dC8/Qi5OfKzrl2X+YD
	8Zf5VaiVmTnTO0q1azpwp0vybK4X/0mG4hNxRrmsCk+v8a+iB7+YtpiMUTBvjC7G
	nPLz9g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjrxcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 10:10:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d98c6ab60so2009588a91.1
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 03:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775815816; x=1776420616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=50pbHWz5L4Ep8xCFcd58OKxaduUzmduABDRD2HJ+f0E=;
        b=LS6TnZd6Qtb35KRNh8i8F/LVpRA8EIAqOlwZTEYZW0uDJ/shDJI2777MQHsQWLJO5S
         c6D1EDff999hQL1xKjAmBf3fYAigHOu/CL/UxZKZfmYIeit1u8pUMGGRBaQJO82vIGbN
         2ItfcFhJXHRcy0wkCWm10wuNoxrGp8YC2Pdd7IC/LhrrHBuafzlYNWeWOPLulOygfLh1
         T7y9ksOud/THbMPUZuMWnquVSkN+R6NF41/TbCO+tRFsOJb7Z8XLRxeD5yutaQuyOhBm
         vzKN0HyzdatwNTIBsxdpd00SYM1gsljWnae/pa0Q1C65ZMdOIx/3GENBrNNgHBoWEXme
         BKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815816; x=1776420616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50pbHWz5L4Ep8xCFcd58OKxaduUzmduABDRD2HJ+f0E=;
        b=TT0r6k0FoENRyESlHV+VyU7STH+kO2ZdPz/Ir8bdA9c5LpXl/WZkRKCMYAaMVG6dGu
         53chtDYIwCPxojafuIYckdza2T5XXLOuTSCGueD5gPkDYLQJapBHXz/pOOhY0AcW9WTT
         9+S/eEkgVP2YFp/1jUQPp6imH4AKdnf29UC4DYJkQPSgw4C6iD7WUDWHMpk+zJb86Tfz
         FYvUaT6ILnRbcz8/hk/BkrrFVqty9a7i/trf7+uTl17Kv58kfSw1PXlWChMgrKCX8d4Q
         nthlnHXHCFwC/2w76swsul2yFYbPSuFCWwdr+MlHzzxa7LLpP9OBN5z9nPq6sDtrUccP
         77Aw==
X-Gm-Message-State: AOJu0YzQNR3vUeOhoxPRcmizE1ZMVLpS1D9nmFexCtxOZTfc8xEDq3kf
	9oFFb2mUDPt7/bGn5+xxrDwSIzK/DBnqHtPTv6cmk6he2Ds70qRjlbkUKRZlfctp9a4YulyUDRI
	8NXIJwZa7atwnpNYBf/7Kz+eYjClzgXP9H8Bb05JsQWZ8DN9Zh0I52/Q3MeuqxKOcCg==
X-Gm-Gg: AeBDievW7rHl+zPNUu9sbNYjLdjiJw9GULCF504etDUY5AXjteEOKwXrc/Z64QZZ2Tv
	PCctGT0c4ZQ65rhZsVX4U/6weDjpkkY6VxhEwcXWPADBMvsm6HaBCZyj2d5biicg3AaoJWGRlqT
	5M8e7uR1LNAKbCPruzxstziwaq1C3svZutQk5ln1V+zy52LzN6bCP406eDsP5Bg30NaqT+vulO3
	CDbZw7RQrfzsBhZYhWTFLxKrcW4mjiJE/tQf3jmGlK+GY/aiLk5w5QzJl16/k2zyt6GijDc2M/e
	d+U0KN1cM3rzBu3zUjsJDZVt8gLQILjKnu51Xc5ZYa2rXISi8dhyJLPRkXefo87XZ9qhBU6dpIG
	06qzpBhBQsA5a1u46LF1EVYzao5le3SElfeeKJboyqMqwZOGTr6FVkig=
X-Received: by 2002:a17:90b:4ac2:b0:35d:a559:5c0a with SMTP id 98e67ed59e1d1-35e43022d4cmr2068886a91.6.1775815815739;
        Fri, 10 Apr 2026 03:10:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac2:b0:35d:a559:5c0a with SMTP id 98e67ed59e1d1-35e43022d4cmr2068850a91.6.1775815815046;
        Fri, 10 Apr 2026 03:10:15 -0700 (PDT)
Received: from [192.168.202.18] ([106.192.36.31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e34fd383dsm8291028a91.6.2026.04.10.03.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 03:10:14 -0700 (PDT)
Message-ID: <99eb55a8-6370-bf7b-f9de-e88231454b0e@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:40:07 +0530
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
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-4-428c1ec2e3f3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d8cc8a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=NP+XTJQPoO73HiJDCNFURg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=ry5-__lr15mXsCcL3A4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: b2FyNS7PlCBc9Ymv9ljmonKMs_cXrK2v
X-Proofpoint-ORIG-GUID: b2FyNS7PlCBc9Ymv9ljmonKMs_cXrK2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5NCBTYWx0ZWRfX6gdpxf0PGHh/
 CBnGvktbWh/7jNUaDAUkRDQ0RAGonrj3SUbpX4Cpk7ovhNqo4ATqNFXf+WrcIqz1Vq1CWmF7Yqz
 LBJnYY5eMly2MqB6Z7w+x6LZPhjV2UpM97FustRxJtPZEVYPDVttuz7Nh8dwFC2C9pytdxcRavO
 h5RlnO5zgo/UDJRWAN4MYb2jraQvEglIHOd3D8qDPdxgoo1j9/yKGvc1kCmleb0AYNEHVQE0muA
 NjcKpGDhoND6+FHRUPQasfb1hsw4PeQkE4OmLALbl+Vmt6mofqHND28kskvAX1d+fl6db0y26Ru
 ksb7qnRMg6dBqr2DlMh7SWqR6iaOU7FK11F/zbpTx0A1bkuQ97vBOjas5ZFxew6WGYrqF0DTF+H
 2eaQMxjtTPvR6WjgvmYm9EtY2gwwYPhZYbCHmMk5+h5PQeDkgbwTiEJztk1pTFWEhGlVxxfblp5
 E3Mu4TSs2N8HjFd9tLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100094
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58531-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 63FAB3D584D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/8/2026 10:13 PM, Neil Armstrong wrote:
> Update the gen2 response and vdec s_fmt code to take in account
> the P010 and QC010 when calculating the width, height and stride.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../platform/qcom/iris/iris_hfi_gen2_response.c     | 19 ++++++++++++++++---
>   drivers/media/platform/qcom/iris/iris_vdec.c        | 21 ++++++++++++++++++---
>   2 files changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 8e19f61bbbf9..d268149191ea 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -542,9 +542,22 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>   	pixmp_ip->width = width;
>   	pixmp_ip->height = height;
>   
> -	pixmp_op->width = ALIGN(width, 128);
> -	pixmp_op->height = ALIGN(height, 32);
> -	pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
> +	pixmp_op->width = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
> +		ALIGN(width, 192) : ALIGN(width, 128);
> +	pixmp_op->height = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
> +		ALIGN(height, 16) : ALIGN(height, 32);
> +	switch (pixmp_op->pixelformat) {
> +	case V4L2_PIX_FMT_P010:
> +		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
> +		break;
> +	case V4L2_PIX_FMT_QC10C:
> +		pixmp_op->plane_fmt[0].bytesperline = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
> +		break;
> +	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_QC08C:
> +		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
> +		break;
> +	}
>   	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>   
>   	matrix_coeff = subsc_params.color_info & 0xFF;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 719217399a30..ca0518c27834 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -272,10 +272,25 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   		fmt = inst->fmt_dst;
>   		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>   		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
> -		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
> -		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
> +		codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 192 : 128;
> +		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
> +		codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 16 : 32;
> +		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
>   		fmt->fmt.pix_mp.num_planes = 1;
> -		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
> +		switch (f->fmt.pix_mp.pixelformat) {
> +		case V4L2_PIX_FMT_P010:
> +			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
> +				ALIGN(f->fmt.pix_mp.width * 2, 256);
> +			break;
> +		case V4L2_PIX_FMT_QC10C:
> +			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
> +				ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
> +			break;
> +		case V4L2_PIX_FMT_NV12:
> +		case V4L2_PIX_FMT_QC08C:
> +			fmt->fmt.pix_mp.plane_fmt[0].bytesperline = f->fmt.pix_mp.width;
In the removed code, bytesperline for NV12 and QC08C was aligned to 128 
bytes.
In the new code, Is that alignment missed or not required?
> +			break;
> +		}
>   		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>   		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>   		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
>

