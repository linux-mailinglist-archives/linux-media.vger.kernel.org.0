Return-Path: <linux-media+bounces-61498-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GpSNmTGBGrdNwIAu9opvQ
	(envelope-from <linux-media+bounces-61498-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:43:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6665392BA
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35D4A301413B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758F43AA4FA;
	Wed, 13 May 2026 18:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L23p5lZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+BXVhM5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61879393DE2
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697823; cv=none; b=MYTyfYEwH1Z88AZwj4s8ug0lS5A6MrWzGti+77dAPbdxvnxRPsRxR0NfvzURMDdlH4iyf5LI5S39+YQduD5p5WaG9DrI0pVWbq+8D4//tbR7RVtcyKy6M0HGoTb8k1cqqahIniNn4+AhA/5ON849W0K4jc48QMkmYVON2H8pDwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697823; c=relaxed/simple;
	bh=z5egP5dJzb2DadZbBwkkR2UBt/ZnjdpoQCVRW2c+c9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoPZtOXIGzxxwyspiYPgGtXYec2qTbMO7If4fjsmuBHgf3KZSCmj8zn/AJBnsgwaDvwKUc2ia9wUmtIo2cG+w0XBsdS7Bn7BJIRv5SEduEsvvgz8+vONSz/Qr5MjbIhBdo4D5ECxruWHIQvVHvBhjm/rmghFBAC4NfvckoQDwpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L23p5lZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+BXVhM5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGvraG2321368
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XvyrrmfA62QhG8XDtmyOCgKRBC/pFkF5XyaxOLT9qk=; b=L23p5lZFbXsUlS32
	Igu39ZoBi/AT0apvFW2MQ4JZd8I4g54guqynUrExNy+uZGKxJSZyN1y1eLAewrHR
	5ibLf+jAr/CYkWLTFkeXv3wdbPWL1Q6DKlVsOoPLZVVFW7McvIm6CNWPpGNBjKQK
	ldrN+ykuZM+l8rUA0Hgmre8q9TatWiWFcLlAlEVudP+SLOYelHU7PzpJpKRA1Yny
	qIdbq8FZZJ2flBCPLuZj5aKdH+Jps0vvRovtHLlIttNTjEIe3XzUksNOAShDlzhq
	Mumn22yfZ1eHNVHyeBiIugWOAENjveSe4O90AUxgJdgb5CeON7IWT6Ahdme32pcJ
	Svbkiw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgubhmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:43:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba115ab6bbso69415155ad.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778697821; x=1779302621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7XvyrrmfA62QhG8XDtmyOCgKRBC/pFkF5XyaxOLT9qk=;
        b=H+BXVhM53s1HFnAL92mcMAfIZjRYXAc7g+kIqcDtxlSbRgMxglT1lgdm91N0EDBAIZ
         Exd5vStJZIVhIpWRVlcE8qpAcHt2VJQZ9yozom2+zIjIs0aN/GAcLr4/PAz+PskqpHjd
         gKkQizw2lQeuqQTlrKX/aM3pYeBcl3o7Fl9/bi1nGniYMuewqQI40ArXo4R/xP6pohPf
         5NQH4Y83YkN2dPxK5LPles7iGZF4ArKXCIFw5sVwkTTCyNznq4kM+MaYuftFY8YTaNCr
         MONqZNgD+1ArJKyxKVgKhLDczoIHzmNKygp+iepWg9AVbmJiRVnEK1NtSZ69Ul4A7tdy
         yhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697821; x=1779302621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XvyrrmfA62QhG8XDtmyOCgKRBC/pFkF5XyaxOLT9qk=;
        b=Ff0OW+uYmplxXjOx9G1qqFW7IAa9Mb6niLb6pQpOAzwv8zz0SWph6y+3mH5TYFDFcL
         UGdw8AfLdpxI6pRjdFnE2jzHo5YaoJ3MMgQykNw8m0M5fhsV4KvvAJBVH7YbT4usHXFs
         d2k1cbdYLwtX9a4I17vdiWdzN1rgqdJ2JZi4aADxlcW/rOyVi92L25/nOpfyVfo5y69u
         eBxA9zRv6ka7gD8HtLnRNe6EASxcctQ0m7j0Wd/fAvP4ShBOkjuzkaNbZcoi6s+ZUb05
         QLCh6S7CbABtwvfKRS99A3JoACoRupgKHEuo6f8WM98B30634oZG/6Wt9mqgtm1vIHgD
         Xnog==
X-Gm-Message-State: AOJu0YyAwhurMkgZ1JndQdAw/tN+iB+LDD9v/Z+ALRmL2LdfyZUCKTcw
	wZjxjskeYZC5A821AGSMovPtlEtAwL1PrWUXadSA8tQ2QCwPDz/9QZqCrvKT4/jKw1/GLtOIa+P
	8WnZNuMWcIMhSqPY+A+Ob7++NeoDAVLCkcnsEtGRBdj3ocB8naNeh+lUtABcUuvEwAA==
X-Gm-Gg: Acq92OGysYfHRkWgaNOZFI0rtJfKFzSIQuHkTFDCUwTFjL2k3eoWuA2rYzDJKg165vm
	eiwjoX6ByqEy71Jlve1KcUpfCe83R56/BCr2fwaRNemV8gI/iMqH6f3l8R1VxsYH16wm62lD3Cl
	Y2mNbjZzK5LorQ2JQONVHlLrktnJCVUpBWaZhx5LcKajXgg6SncoBY4bC2IIewMvzT7ulyZNcdx
	vqDO6GbBHZ3t8Plu+JeKVmk6gHi1S0cRqW3Mf/FrT4+rK6qqIpnffoRlCCFlN9rG+Vr3Xyz3VrK
	wGup4QX8MZHZ95QN/5xqNF1fFV52Ft7kJQEplmIc3IuvS7ocG+J5jWSJdccYsjZkyzs421ThDLR
	GGYKz2jYZI91nYLpv+9VAD0o2ueC96DUUhWr1FAP7cz8PKPEOZQxeIXsu0PnHSbh+z5w=
X-Received: by 2002:a17:902:c212:b0:2ba:359a:9b8e with SMTP id d9443c01a7336-2bd27158ce7mr38833365ad.10.1778697820820;
        Wed, 13 May 2026 11:43:40 -0700 (PDT)
X-Received: by 2002:a17:902:c212:b0:2ba:359a:9b8e with SMTP id d9443c01a7336-2bd27158ce7mr38833175ad.10.1778697820112;
        Wed, 13 May 2026 11:43:40 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d269fcsm179422045ad.15.2026.05.13.11.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:43:39 -0700 (PDT)
Message-ID: <a5e7a134-8b23-4cd1-a4c5-6f6c1954a983@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:13:34 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] media: qcom: iris: add QC10C & P010 buffer size
 calculations
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-2-7fc049b93042@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-2-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04c65d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=nxzhqeCB-ifmqVh3ynMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dcshX7he1MfPwGTtwrmdSI0WAaZDfbvU
X-Proofpoint-ORIG-GUID: dcshX7he1MfPwGTtwrmdSI0WAaZDfbvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NSBTYWx0ZWRfX/xY4jXvO6Y6G
 NHd/D+0Y9QgPUUiPrGuuiY954sM/jiRRCM5jfkVn34nwk0hVxC+Z6Wqww4FPQWx6Ae1LVU9ySOX
 bq0CHpQkdV0DsWCAqzKC8Lq4tCJU5uidinUL2nfdcp0f5/fqPPqpUJEhXLtrRjIpFwDvSiXKWBG
 y21IA1JEXu4QkGc/o/q3fsvA525DqFFvmZXXJ9EjewxDb9Py/YM1bcxGzB+IYGVR1VAlWvIQnCn
 cxKouS7sI7xK2b1cgDlfO2IXjNQsTZUqQz7F5/gk4UkqDnKFLlLlF1kt+sMVBi54OTA8SKY5s/+
 qexwOA+3CejnaXzX5y3TOzBIiGDuHLmsgx9TkcBC0YG5HXpXnqiADE4hN+6Ab8SHml1rKvTCxhX
 W1CrEdOBsOJfXPyFFvOFYhZLPadAYU6/Uo5iDH6arF5SWln+4cLceP41bVZOeRo9yNSsHqIzNVz
 G/3HmRHAkVRO0kApEqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130185
X-Rspamd-Queue-Id: 4D6665392BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61498-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
> The P010 (YUV format with 16-bits per pixel with interleaved UV)
> and QC10C (P010 compressed mode similar to QC08C) requires specific
> buffer calculations to allocate the right buffer size for DPB frames

expand DPB

> and frames consumed by userspace.
> 
> Similar to 8bit, the 10bit DPB frames uses QC10C format.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 195 ++++++++++++++++++++++++-
>   1 file changed, 194 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 1d53c7414b75..713a63d0ca0c 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -15,8 +15,11 @@
>   #define MAX_WIDTH 4096
>   #define MAX_HEIGHT 2304
>   #define Y_STRIDE_ALIGN 128
> +#define Y_STRIDE_ALIGN_P010 256
>   #define UV_STRIDE_ALIGN 128
> +#define UV_STRIDE_ALIGN_P010 256
>   #define Y_SCANLINE_ALIGN 32
> +#define Y_SCANLINE_ALIGN_QC10C 16
>   #define UV_SCANLINE_ALIGN 16
>   #define UV_SCANLINE_ALIGN_QC08C 32
>   #define META_STRIDE_ALIGNED 64
> @@ -80,6 +83,63 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
>   	return ALIGN(y_plane + uv_plane, PIXELS_4K);
>   }
>   
> +/*
> + * P010:
> + * YUV 4:2:0 image with a plane of 10 bit Y samples followed
> + * by an interleaved U/V plane containing 10 bit 2x2 subsampled
> + * colour difference samples.
> + *
> + * <-Y/UV_Stride (aligned to 256)->
> + * <----- Width*2 ------->
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          y_scanlines (aligned to 32)
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
> + * . . . . . . . . . . . . . . . .              |
> + * . . . . . . . . . . . . . . . .              |
> + * . . . . . . . . . . . . . . . .              |
> + * . . . . . . . . . . . . . . . .              V
> + * U V U V U V U V U V U V . . . .  ^
> + * U V U V U V U V U V U V . . . .  |
> + * U V U V U V U V U V U V . . . .  |
> + * U V U V U V U V U V U V . . . .  uv_scanlines (aligned to 16)
> + * . . . . . . . . . . . . . . . .  |
> + * . . . . . . . . . . . . . . . .  V
> + * . . . . . . . . . . . . . . . .  --> Buffer size aligned to 4K
> + *
> + * y_stride : Width*2 aligned to 256
> + * uv_stride : Width*2 aligned to 256
> + * y_scanlines: Height aligned to 32
> + * uv_scanlines: Height/2 aligned to 16
> + * Total size = align((y_stride * y_scanlines
> + *          + uv_stride * uv_scanlines , 4096)
> + *
> + * Note: All the alignments are hardware requirements.
> + */
> +static u32 iris_yuv_buffer_size_p010(struct iris_inst *inst)
> +{
> +	u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines, uv_scanlines;
> +	struct v4l2_format *f;
> +
> +	if (inst->domain == DECODER)
> +		f = inst->fmt_dst;
> +	else
> +		f = inst->fmt_src;
> +
> +	y_stride = ALIGN(f->fmt.pix_mp.width * 2, Y_STRIDE_ALIGN_P010);
> +	uv_stride = ALIGN(f->fmt.pix_mp.width * 2, UV_STRIDE_ALIGN_P010);
> +	y_scanlines = ALIGN(f->fmt.pix_mp.height, Y_SCANLINE_ALIGN);
> +	uv_scanlines = ALIGN((f->fmt.pix_mp.height + 1) >> 1, UV_SCANLINE_ALIGN);
> +	y_plane = y_stride * y_scanlines;
> +	uv_plane = uv_stride * uv_scanlines;
> +
> +	return ALIGN(y_plane + uv_plane, PIXELS_4K);
> +}
> +
>   /*
>    * QC08C:
>    * Compressed Macro-tile format for NV12.
> @@ -204,6 +264,132 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>   	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
>   }
>   
> +/*
> + * QC10C:
> + * UBWC-compressed format for P010.
> + * Contains 4 planes in the following order -
> + * (A) Y_Meta_Plane
> + * (B) Y_UBWC_Plane
> + * (C) UV_Meta_Plane
> + * (D) UV_UBWC_Plane
> + *
> + * Y_Meta_Plane consists of meta information to decode compressed
> + * tile data in Y_UBWC_Plane.
> + * Y_UBWC_Plane consists of Y data in compressed macro-tile format.
> + * UBWC decoder block will use the Y_Meta_Plane data together with
> + * Y_UBWC_Plane data to produce loss-less uncompressed 10 bit Y samples.
> + *
> + * UV_Meta_Plane consists of meta information to decode compressed
> + * tile data in UV_UBWC_Plane.
> + * UV_UBWC_Plane consists of UV data in compressed macro-tile format.
> + * UBWC decoder block will use UV_Meta_Plane data together with
> + * UV_UBWC_Plane data to produce loss-less uncompressed 10 bit 2x2
> + * subsampled color difference samples.
> + *
> + * Each tile in Y_UBWC_Plane/UV_UBWC_Plane is independently decodable
> + * and randomly accessible. There is no dependency between tiles.
> + *
> + * <----- Y Meta stride -----> (aligned to 64)
> + * <-------- Width ----------> (aligned to 48)
> + * M M M M M M M M M M M M . .      ^           ^
> + * M M M M M M M M M M M M . .      |           |
> + * M M M M M M M M M M M M . .      Height      |
> + * M M M M M M M M M M M M . .      |         Meta_Y_Scanlines (aligned to 16)
> + * M M M M M M M M M M M M . .      |           |
> + * M M M M M M M M M M M M . .      |           |
> + * M M M M M M M M M M M M . .      |           |
> + * M M M M M M M M M M M M . .      V           |
> + * . . . . . . . . . . . . . .                  |
> + * . . . . . . . . . . . . . .                  |
> + * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> + * . . . . . . . . . . . . . .                  V
> + * <--Compressed tile Y stride --> (aligned to 256)
> + * <------- Width * 4/3 ---------> (aligned to 48)
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  Height      |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_Scanlines (aligned to 16)
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
> + * . . . . . . . . . . . . . . . .              |
> + * . . . . . . . . . . . . . . . .              |
> + * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> + * . . . . . . . . . . . . . . . .              V
> + * <---- UV Meta stride ----> (aligned to 64)
> + * <----- Width / 2 --------> (aligned to 24)
> + * M M M M M M M M M M M M . .    ^           ^
> + * M M M M M M M M M M M M . .    |           |
> + * M M M M M M M M M M M M . .    Height/2    |
> + * M M M M M M M M M M M M . .    V           M_UV_Scanlines (aligned to 16)
> + * . . . . . . . . . . . . . .                |
> + * . . . . . . . . . . . . . .                V
> + * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> + * <--Compressed tile UV stride--> (aligned to 256)
> + * <------- Width * 4/3 ---------> (aligned to 48)
> + * U* V* U* V* U* V* U* V* . . . .  ^
> + * U* V* U* V* U* V* U* V* . . . .  |
> + * U* V* U* V* U* V* U* V* . . . .  |
> + * U* V* U* V* U* V* U* V* . . . .  UV_Scanlines (aligned to 16)
> + * . . . . . . . . . . . . . . . .  |
> + * . . . . . . . . . . . . . . . .  V
> + * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> + *
> + * y_stride: width aligned to 256
> + * uv_stride: width aligned to 256

This does not match with above layout

> + * y_scanlines: height aligned to 16
> + * uv_scanlines: height aligned to 16
> + * y_plane: buffer size aligned to 4096
> + * uv_plane: buffer size aligned to 4096
> + * y_meta_stride: width aligned to 64
> + * y_meta_scanlines: height aligned to 16
> + * y_meta_plane: buffer size aligned to 4096
> + * uv_meta_stride: width aligned to 64
> + * uv_meta_scanlines: height aligned to 16
> + * uv_meta_plane: buffer size aligned to 4096
> + *
> + * Total size = align( y_plane + uv_plane +
> + *           y_meta_plane + uv_meta_plane, 4096)
> + *
> + * Note: All the alignments are hardware requirements.
> + */
> +static u32 iris_yuv_buffer_size_qc10c(struct iris_inst *inst)
> +{
> +	u32 y_plane, uv_plane, y_stride, uv_stride;
> +	u32 uv_meta_stride, uv_meta_plane;
> +	u32 y_meta_stride, y_meta_plane;
> +	struct v4l2_format *f = NULL;

drop NULL

> +
> +	if (inst->domain == DECODER)
> +		f = inst->fmt_dst;
> +	else
> +		f = inst->fmt_src;
> +
> +	y_meta_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width, 48),
> +			      META_STRIDE_ALIGNED);
> +	y_meta_plane = y_meta_stride * ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.height, 4),
> +					     META_SCANLINE_ALIGNED);
> +	y_meta_plane = ALIGN(y_meta_plane, PIXELS_4K);
> +
> +	y_stride = ALIGN(f->fmt.pix_mp.width * 4 / 3, Y_STRIDE_ALIGN_P010);
> +	y_plane = ALIGN(y_stride * ALIGN(f->fmt.pix_mp.height, Y_SCANLINE_ALIGN_QC10C),
> +			PIXELS_4K);
> +
> +	uv_meta_stride = ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.width + 1) / 2, 24),
> +			       META_STRIDE_ALIGNED);
> +	uv_meta_plane = uv_meta_stride *
> +			ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.height + 1) / 2, 4),
> +			      META_SCANLINE_ALIGNED);

Please use >> 1 throughout for consistency. I see 
iris_yuv_buffer_size_p010() uses them, while 
iris_yuv_buffer_size_qc10c() dont.

> +	uv_meta_plane = ALIGN(uv_meta_plane, PIXELS_4K);
> +
> +	uv_stride = ALIGN(f->fmt.pix_mp.width * 4 / 3, UV_STRIDE_ALIGN_P010);
> +	uv_plane = ALIGN(uv_stride * ALIGN((f->fmt.pix_mp.height + 1) / 2, UV_SCANLINE_ALIGN),
> +			 PIXELS_4K);
> +
> +	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
> +}
> +
>   static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
>   {
>   	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> @@ -268,10 +454,17 @@ int iris_get_buffer_size(struct iris_inst *inst,
>   		case BUF_OUTPUT:
>   			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
>   				return iris_yuv_buffer_size_qc08c(inst);
> +			else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C)
> +				return iris_yuv_buffer_size_qc10c(inst);
> +			else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010)
> +				return iris_yuv_buffer_size_p010(inst);
>   			else
>   				return iris_yuv_buffer_size_nv12(inst);
>   		case BUF_DPB:
> -			return iris_yuv_buffer_size_qc08c(inst);
> +			if (iris_fmt_is_10bit(inst->fmt_dst->fmt.pix_mp.pixelformat))
> +				return iris_yuv_buffer_size_qc10c(inst);
> +			else
> +				return iris_yuv_buffer_size_qc08c(inst);
>   		default:
>   			return 0;
>   		}
> 


