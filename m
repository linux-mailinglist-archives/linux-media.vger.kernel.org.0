Return-Path: <linux-media+bounces-59299-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPjtOX6S6Gl9MgIAu9opvQ
	(envelope-from <linux-media+bounces-59299-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:18:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A27C443D8C
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE3EE305BFD9
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABDA3C1980;
	Wed, 22 Apr 2026 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmUC8Ag7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HjQzb27R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9375A3BBA00
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849222; cv=none; b=M2Tsjdm49KTtjjcoS2gatb/VwWyqDwWN7Pu2URZ1+FfcMEVDWhxxWiFHhNy3m+KcCYXvVHrG6mo1kH4ceTD42JZrCg/JCuWvTpXS+iQWs6pq96gWaaF7vBET7bWXTq204DK5oHUAG/TijBDwDP4cKSeKqAC/0p8FfjRStqLHsUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849222; c=relaxed/simple;
	bh=D+5UgMgWMIDxvfMIXAumusVZuoLTVm/qXDr92m0TzTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OabALMNQRnQyxtMRR5oBgjjYbb89YlQX1OLL6lQnTdHDz3Uq7bYLpFqR8acf2ZxWlkG3R2lrfKKVajX55tC1Bod7ona1mctueVrdMcoIAYZiDudyv28prBaStthAnxlzfyawlV/nuYOj13IGpr70wgDo4iD4JUttsA6Cbx0yK5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmUC8Ag7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HjQzb27R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5YQUB2123517
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 09:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rU/aIrnL5E4EEtWlfuu817RS3wEfk8XZfHo7ZxYzUhY=; b=WmUC8Ag7cg4P/r0A
	j6Quh4st8wCiWU1sZ5eHhs3n4SpmexAYphydoYIKgyNtrdNB22aQWHJYG+zQW+f9
	hnAECXkkXy0Tj4ryaKeERe28qkXuMh+OH8zo4do44ov/VwPzD2jIQ85puPlHtW7j
	XTKiE4TXvwUvToFF1GQOusR0qSc0yW8z3mWMWHr9221HvxO/0jQjLwhvE91XVQ5M
	Ve4fgi/UKbdHogWIOaVQCKfX2/fIyHUyIhN0tIogfqa4OpbfXbsgt6bO5TtX74WC
	BMQZICDbDalops2zbVlmnoD9oglx1P21HhksjFKDjsn9Qd8HetaWgXq2lh5MhjbG
	zIw4Jg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftnp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 09:13:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso5472462a91.0
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849220; x=1777454020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rU/aIrnL5E4EEtWlfuu817RS3wEfk8XZfHo7ZxYzUhY=;
        b=HjQzb27RAeNgk7GaqDqJplBgzOPTuNxuUGH3HMIdVJ79jeNbqgT0HpoEX2Hm7etyvB
         UCwbAT/GjsSCDMlDXYAGu/o1qf6bH1JWdM4n68KeV/9I+x0092Fp/ws4O8dexB+26rG9
         2BxqeV83dM1VXy5t2HD+qLqOIu3Za9Retv8asp5YuYH0FfhMlKffuQm7FW6gwrVO5CjH
         /d5WVJbUmqMSoZYyhHqIBktneIL9dGve48F/SIPoOshhhybpBSFPR5w45UoY7QrihnBY
         uRn0aoqOTxSSGiuRx4M357rxhwQbeqXvRCMcfWEmc6CTX6zA0SfAMw2cJpS50AN+hNbg
         hc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849220; x=1777454020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rU/aIrnL5E4EEtWlfuu817RS3wEfk8XZfHo7ZxYzUhY=;
        b=EJ55Hlg7yYi7ZF360uhsLS+tMskJbfhMvGk4O+cuhj3J7N4CkWME9QnViI5Lx6Kstv
         U6zh5lmc3+QZLSmz2fp1bBMBwg0mWI/77yzNz7il17WIrg/g4yhSYaSp26sje+fwXi8b
         dsWdlCdp9yNNQbE1V3/sdRlpbIXWJG09Yjttzmu7UjZo9F9UUkKf80qCDwX1k8QCEIre
         dpmT+y9YNBMAtX+13Lf7y+mzW0y2CRgzLau0zMqqwnAY46I1d+bMPyK8Sd9msajHZjie
         fAlstCpw7Q7Os/KhznS5KKBXAUnZP38mzwYM6btdPBWdHNASUeyQ/k9OmzuE2RnVNiSW
         8hAw==
X-Gm-Message-State: AOJu0Yw630WDNYu9Yf81Lf0h3fkdchgvF2s8tobq20p4gohb9D1nzXkz
	n/4KPYiwfOfgcsZ/boZ/FpgF/zWPlvijdH/C3n/tOeduhHgCGNuGm2T2OdYGn9X2TFKxv0r1idD
	urYDx76CHULC2oJ5A+P9038xSuyFGZy5NCSLV9fwEbWr17TnsjIdx4W+yrkxBYOtZFw==
X-Gm-Gg: AeBDiesL9ZH2I5S8FzqW+g0q9jxn4Ld30eodKcHtWfecN5FCFDqAR7yCJICWyu2ORS4
	jJipJh8U21/97xOVI4sire+2/uzCmvEHbzEhebQY3qAUcbovMouBLvRVj2ddnrGg0pILRW9JZSR
	kMEcwnEkRynjpuXemvjioqVjPDFUYzl0oQ+VEv7d0O6IH16PBeWkr/Yrx0jdN5uNleE7s/TkWMt
	kvFtDgZVWofDksse8Fb+Z0Vpp3COtsevBCioatm7SKX42H0MaRGs+8NYIQ+1AtCFo8p5RovZR9v
	hcOJji4VyiGsSkI9geExGm2wnOlxIpRUUxRrkF+DJSy4k5n27g1dSj+be4I1I2jTaQWE4V234qT
	e4UmyO14lEz0ZwhGUEImckkasCBtXpqiYpRqH+i0n+x15HpzAH/zoAwO8zK4rvmv0
X-Received: by 2002:a17:902:bf41:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2b5f9f5c1c5mr163764705ad.25.1776849220063;
        Wed, 22 Apr 2026 02:13:40 -0700 (PDT)
X-Received: by 2002:a17:902:bf41:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2b5f9f5c1c5mr163764495ad.25.1776849219564;
        Wed, 22 Apr 2026 02:13:39 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.228.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa507cbsm164034525ad.37.2026.04.22.02.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:13:39 -0700 (PDT)
Message-ID: <568c51fd-a229-0cd9-815d-7461606beb60@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:43:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
 <20260417-topic-sm8x50-iris-10bit-decoding-v2-3-c987b65a31d5@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-3-c987b65a31d5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e89144 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=rP2ZPG2H70Gfrv7XvIldxw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=hsJvx-B6qgcxRBDfHDcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dGAklT77PTiz7u0cLEFAl1t7wLML5UR1
X-Proofpoint-GUID: dGAklT77PTiz7u0cLEFAl1t7wLML5UR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MyBTYWx0ZWRfX873KOT5FQkoi
 dj6bv+Idmuxf9DcjyZC+sIAMcSwEXgDBQImCr95urRfVIUVfL4w+8oZTFamMZTA4mCBETC9m3rK
 3eibL18R0Va2YbOhOGVZYJ9HiCPjJIr9Hgnei1+eLCZ581rgju/IcQfRiQhlgv4IWJ8JDBy9RbM
 dMvg/vH9bIOHjfIlxYbfnL/n986RRoinByKi2azuBLptsy6qejxGNctQc5Jgl/c0SnB1vP+bGV0
 iaBM447P4xzcA0yEotLlmUbiQs/m9AjY2kbGKEIq1WMkDFu8wrwM0FkwlqUZ3Nh0TjHckCrNu/F
 chEoIVBk7qntzmAblZ2osREMEO/x6GLLJw1uWwNU2wnezUy2WiEIC7eXD4jccYSJ93aqjeZAU4d
 IM7HUJJuEcwUvx7N4ywQmAaO4wFKWOo29Djs7y+OXRbw/BHXkat+oc2E8M9A8cz21Nl/K0u3VHC
 E478fLPzTjp/APpZiDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220083
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59299-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 4A27C443D8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/2026 3:07 PM, Neil Armstrong wrote:
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
> index 30bfd90d423b..d664e606e886 100644
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
> +
> +	switch (pixelformat) {
> +	case V4L2_PIX_FMT_QC08C:
> +		stride_y = ALIGN(width, 128);
> +		scanline_y = ALIGN(height, 32);
> +		stride_uv = ALIGN(width, 128);
> +		scanline_uv = ALIGN((height + 1) >> 1, 32);
> +		meta_stride_y = ALIGN(DIV_ROUND_UP(width, 32), 64);
> +		meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 8), 16);
> +		meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 16), 64);
> +		meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 8), 16);
> +		break;
> +	case V4L2_PIX_FMT_QC10C:
> +		stride_y = ALIGN(width * 4 / 3, 256);
> +		scanline_y = ALIGN(height, 16);
> +		stride_uv = ALIGN(width * 4 / 3, 256);
> +		scanline_uv = ALIGN((height + 1) >> 1, 16);
> +		meta_stride_y = ALIGN(DIV_ROUND_UP(width, 48), 64);
> +		meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 4), 16);
> +		meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 24), 64);
> +		meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 4), 16);
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	payload[0] = stride_y << 16 | scanline_y;
> +	payload[1] = stride_uv << 16 | scanline_uv;
> +	payload[2] = meta_stride_y << 16 | meta_scanline_y;
> +	payload[3] = meta_stride_uv << 16 | meta_scanline_uv;
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_UBWC_STRIDE_SCANLINE,
> +						  HFI_HOST_FLAGS_NONE,
> +						  port,
> +						  HFI_PAYLOAD_U32_ARRAY,
> +						  &payload[0],
> +						  sizeof(u32) * 4);
> +}

I’m still not convinced this change is needed for non‑AV1 codecs.
I’m concerned this may be masking an underlying alignment issue, since this
property is not intended to be used for non‑AV1 codecs. Even FW team
doesn't recommend setting this property for other codecs as it can lead to
wasted memory due to over‑allocation and padding.

Thanks,
Dikshita

