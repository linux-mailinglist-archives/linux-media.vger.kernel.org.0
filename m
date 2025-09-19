Return-Path: <linux-media+bounces-42811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F7DB8AA5B
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 18:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2081F1CC37B7
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 16:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981F231FED4;
	Fri, 19 Sep 2025 16:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLtBJnLv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329E52F49EF
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 16:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758300864; cv=none; b=csCTWhTW5RZfBHMGu/+dJwBfRtFofPvPobSeAX/fSHbA+SJTst9HieNtVNGfXMGVmMn2mEhX2gJIwrESn5xBLVrI12yBgpAmg4Gy3rVaH9OpcJO8V97DUWQ73XcO22fJZkGNW3a4LgjUpzBKZCp/5A8L5f8YS1xJNCW8CP61YlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758300864; c=relaxed/simple;
	bh=VSHJYCourAAIuvwWkTqwOXUbwvt9OGPOVDGL+CHFzbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iu6QhaIngQ8jpk7FphJEuqbzFfb9OkxBHaeRJlsLseql7n/e40YiEauVtDREJFPfBCKdN5875LrooqJnnYAeVz2jPaQBtYwXYpgA8daGV4jJcLm9na9T6tp8B0JRFKZDO5w6rfvAka2LiJdeyOFOIqBu1ehsKUPR2S/+510IDJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLtBJnLv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JDOnmd030556
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 16:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+K8jgjXE/pFDboWmw82TxVnx
	/ChcscN2444xVbv5dwg=; b=bLtBJnLvTwEztyJqulAf1AACHbB1lScYCBC/JhBO
	W0i+Ay01eSWdhN1PqpTjNnKfadL9dXn8MHtBlUvXeDmU5D/VDKcqKGwMzqXvcjFE
	aMBzMEoU9qL0FztKFLWLbSvzad6X5R1Sje76Bxzunn4W+N1nziW1B75xIP8GkTCp
	ksGN0EpXMbn6neB6/a1LagLwdGVWl1TSRq4qYlOJY8mCOTBkAmX0H5s7hpO1f1aM
	6845tLhUJe/UIsGV5tHQVjBthTOq5ExXy5ws3wxK8B8F6r9slFQTvLs4ZXJ+Lbfq
	regCk9noxm0/RSDEKQJ1zb5xDuXXEjnsyIu2C4Iu22NH3Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49916x20pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 16:54:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-78f3a8ee4d8so34284926d6.1
        for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 09:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300860; x=1758905660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+K8jgjXE/pFDboWmw82TxVnx/ChcscN2444xVbv5dwg=;
        b=MQjIhgfa+5cU7yGTcwrbKozVjgfDuIttIuDZeM1vL9Y62Ug8IB35G016lMwMlwHk3h
         /Q2ktjXwnOMZY/vaSuvInHD7kdQ8yDJ+yi3N/kMDU1YLMnQuhM+4vhPGUUyM/11mREU8
         tpkLvbCfzG49FIuXx0WE+xbi1i+meVViOtsfpBaXvCSLuxz2R0OAPMjYP48WKSTyRw+S
         pQ93JG0uK03AGHfhpQhVsVYBLhVpH2hieAtjUMehAOUT4jPVScZVE7EQxkE6EqBMKZ17
         jUeFeD7WKLCckqmsFKsmBZkV05A8M+52o9IcHQM8jtgV19sTN0wwJ3Mj30xSmu6K8Ek1
         TO8g==
X-Forwarded-Encrypted: i=1; AJvYcCWIyX6mD8aYEGwcQOtIrP23nw5ru9v8xRwt56XXLz9xf1O4jpn5GvOlBxwpk/O0fpnyUIUL0qk1ZpxO/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEFfOFD2m+0NrUxjziy8rxy6kNtYtRAj6PjzQjGdrl3s5Twb3R
	xbghmYCHGENE63HFj7Sj1rwQsYVbGhhQLTKkZmXK8uJfGPwwQf8p6iBgkPS+FiMpSri5iwbs690
	e8oR0RBTacwjtLsd1OsHA5FrfQqvhabyfGdplj8fP5QFEIo7VqgqLJG42QwgmA4tPaQ==
X-Gm-Gg: ASbGncs2VgdJCIBrEv4/jlATXJPj/6a9lxc6WPXON9jEUSvMOiNkun33iDaxPGL04Mw
	FgZaPBg1Xx3wkRUoF6Ny1gE59mW0qxClq7foE1eoPnU/vsFRPvnButAkBox9zdwSkqhRVrUz1hb
	b23w4s3V0T2wl+rmxxhgGwj/+wCmFMi37dEVRSqUjbskikLD7dNZ8FNjqgU/Lv6b6j5BUmeFSLn
	07z6GuS3wdaDq2vpkeeb843l4uQ0X37XccTlUET7T26FLs4LeJfAas1dowto+Ke5v+4Tk08klLh
	nk06jdDkFNB90EgKONjKkKYYTbDN8/ObGR+eCwp/2GxHjPJ319+EhD7qtJhybE4ALLraAo9FGnk
	1JpFk3YU2qo9lDoWG0lKFQs/gEDe+lVm/9eUG4MzGWZkVLUzbpCzw
X-Received: by 2002:ad4:5d62:0:b0:780:9df5:62a with SMTP id 6a1803df08f44-7991a92e5bbmr49548456d6.37.1758300859758;
        Fri, 19 Sep 2025 09:54:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYwjHgarhNWvducF7GWWboTJDl6AnQTIpGVlBaBwCyGFu3dV++wP7cmOEYjPAX+nRIJmjV0Q==
X-Received: by 2002:ad4:5d62:0:b0:780:9df5:62a with SMTP id 6a1803df08f44-7991a92e5bbmr49547986d6.37.1758300859078;
        Fri, 19 Sep 2025 09:54:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a90a21b6sm1474230e87.78.2025.09.19.09.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:54:18 -0700 (PDT)
Date: Fri, 19 Sep 2025 19:54:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
Message-ID: <d2qkd3k7pv7cv3rf76nf3wxedqagg7egz7q2vipiddxzbac5oj@rva7gymbaof7>
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA0OCBTYWx0ZWRfX5PTw3IXBJQO6
 IEmqYhiEj/VTL0frLObCye9pDSmsmQS/5xyehBAu1UhKXVDga0Knd2OIeY1JsG1VG7cQeIYKIuR
 dX2uDLwukJkLQc+7G4Rad4rjKkiVbrDUA/F7rzhrfj3q0bo8EdMRv57LFZyhBaPM25X2ZhNQnlF
 1MRNfgfKXtlQr11osoYTzER/ZoEwcH2iDus4aehuslm6G0ZD4CRZBkiyY3+594OYqzWfWgJCdNZ
 fKvctVYOIZ52fQqXCUw2fEItKPtaryvBHNGW9jlO4hVZfb5b3dW885bhM9UqqktGIkfcYr9/DaE
 OFwFJ+OM0BGLCbU/q2eQsSWwTWRPtZotvxs4XwaQmMCEwCnQvazK60UGQkOY8VoT3X0uGw1Qz30
 Rk/kzh3L
X-Proofpoint-GUID: vvcMH2T8TRVwmKrB2yR8jxHl82hUdBC3
X-Authority-Analysis: v=2.4 cv=LcM86ifi c=1 sm=1 tr=0 ts=68cd8abd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XQYPtZJ1ybOpo95NIg8A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: vvcMH2T8TRVwmKrB2yR8jxHl82hUdBC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509190048

On Fri, Sep 19, 2025 at 09:17:16PM +0530, Dikshita Agarwal wrote:
> Introduce handling for the QC08C format in the decoder.
> Update format checks and configuration to enable decoding of QC08C
> streams.

What is QC08C? Is it supported on all devices?

> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  5 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++--
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 18 ++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
>  drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
>  8 files changed, 89 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index c0900038e7defccf7de3cb60e17c71e36a0e8ead..83dcf49e57ec1473bc4edd26c48ab0b247d23818 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -261,7 +261,10 @@ int iris_get_buffer_size(struct iris_inst *inst,
>  		case BUF_INPUT:
>  			return iris_dec_bitstream_buffer_size(inst);
>  		case BUF_OUTPUT:
> -			return iris_yuv_buffer_size_nv12(inst);
> +			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
> +				return iris_yuv_buffer_size_qc08c(inst);
> +			else
> +				return iris_yuv_buffer_size_nv12(inst);
>  		case BUF_DPB:
>  			return iris_yuv_buffer_size_qc08c(inst);
>  		default:
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index e1788c266bb1080921f17248fd5ee60156b3143d..e458d3349ce09aadb75d056ae84e3aab95f03078 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -774,20 +774,21 @@ static int iris_hfi_gen1_set_raw_format(struct iris_inst *inst, u32 plane)
>  		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>  		if (iris_split_mode_enabled(inst)) {
>  			fmt.buffer_type = HFI_BUFFER_OUTPUT;
> -			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
> -				HFI_COLOR_FORMAT_NV12_UBWC : 0;
> +			fmt.format = HFI_COLOR_FORMAT_NV12_UBWC;

This needs some explanation.

>  
>  			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>  			if (ret)
>  				return ret;
>  
>  			fmt.buffer_type = HFI_BUFFER_OUTPUT2;
> -			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
> +			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
> +				HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
>  
>  			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>  		} else {
>  			fmt.buffer_type = HFI_BUFFER_OUTPUT;
> -			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
> +			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
> +				HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
>  
>  			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>  		}
> @@ -806,6 +807,9 @@ static int iris_hfi_gen1_set_format_constraints(struct iris_inst *inst, u32 plan
>  	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
>  	struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
>  
> +	if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
> +		return 0;
> +
>  	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
>  	pconstraint.num_planes = 2;
>  	pconstraint.plane_format[0].stride_multiples = 128;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 4ce71a14250832440099e4cf3835b4aedfb749e8..5ad202d3fcdc57a2b7b43de15763a686ce0f7bd7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -422,6 +422,20 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
>  						  sizeof(u32));
>  }
>  
> +static int iris_hfi_gen2_set_opb_enable(struct iris_inst *inst, u32 plane)
> +{
> +	u32 port = iris_hfi_gen2_get_port(inst, plane);
> +	u32 opb_enable = iris_split_mode_enabled(inst);
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_OPB_ENABLE,
> +						  HFI_HOST_FLAGS_NONE,
> +						  port,
> +						  HFI_PAYLOAD_U32,
> +						  &opb_enable,
> +						  sizeof(u32));
> +}
> +
>  static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>  {
>  	u32 port = iris_hfi_gen2_get_port(inst, plane);
> @@ -429,7 +443,8 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>  
>  	if (inst->domain == DECODER) {
>  		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
> -		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
> +		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
> +			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>  	} else {
>  		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>  		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
> @@ -527,6 +542,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>  		{HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },
>  		{HFI_PROP_PROFILE,                    iris_hfi_gen2_set_profile                },
>  		{HFI_PROP_LEVEL,                      iris_hfi_gen2_set_level                  },
> +		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
>  		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
>  		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
>  		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index aa1f795f5626c1f76a32dd650302633877ce67be..1b6a4dbac828ffea53c1be0d3624a033c283c972 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -91,6 +91,7 @@ enum hfi_seq_header_mode {
>  #define HFI_PROP_BUFFER_MARK			0x0300016c
>  #define HFI_PROP_RAW_RESOLUTION		0x03000178
>  #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
> +#define HFI_PROP_OPB_ENABLE			0x03000184
>  #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
>  #define HFI_PROP_END				0x03FFFFFF
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 5982d7adefeab80905478b32cddba7bd4651a691..11134f75c26dd1f6c92ba72fbf4e56e41a72de64 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -15,12 +15,17 @@
>  #define DEFAULT_WIDTH 320
>  #define DEFAULT_HEIGHT 240
>  
> -enum iris_fmt_type {
> +enum iris_fmt_type_out {
>  	IRIS_FMT_H264,
>  	IRIS_FMT_HEVC,
>  	IRIS_FMT_VP9,
>  };
>  
> +enum iris_fmt_type_cap {
> +	IRIS_FMT_NV12,
> +	IRIS_FMT_UBWC,

UBWC is not a format on its own, it's a modifier of the format. Please
come up with a better naming.

> +};
> +
>  struct iris_fmt {
>  	u32 pixfmt;
>  	u32 type;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986b74534a2912524c8553970fd862e..69c952c68e939f305f25511e2e4763487ec8e0de 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -691,6 +691,7 @@ static const u32 sm8550_venc_input_config_params[] = {
>  };
>  
>  static const u32 sm8550_vdec_output_config_params[] = {
> +	HFI_PROP_OPB_ENABLE,
>  	HFI_PROP_COLOR_FORMAT,
>  	HFI_PROP_LINEAR_STRIDE_SCANLINE,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index 85c70a62b1fd2c409fc18b28f64771cb0097a7fd..e2f1131de43128254d8211343771e657e425541e 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -34,7 +34,8 @@ int iris_get_mbpf(struct iris_inst *inst)
>  
>  bool iris_split_mode_enabled(struct iris_inst *inst)
>  {
> -	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12;
> +	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
> +		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
>  }
>  
>  void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..7fa745c6bf8950d192c2d2fc1770c4b6fd7b8c4c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -67,7 +67,7 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>  	kfree(inst->fmt_src);
>  }
>  
> -static const struct iris_fmt iris_vdec_formats[] = {
> +static const struct iris_fmt iris_vdec_formats_out[] = {
>  	[IRIS_FMT_H264] = {
>  		.pixfmt = V4L2_PIX_FMT_H264,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> @@ -82,12 +82,35 @@ static const struct iris_fmt iris_vdec_formats[] = {
>  	},
>  };
>  
> +static const struct iris_fmt iris_vdec_formats_cap[] = {

s/formats_cap/formats_capture/

> +	[IRIS_FMT_NV12] = {
> +		.pixfmt = V4L2_PIX_FMT_NV12,
> +		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +	},
> +	[IRIS_FMT_UBWC] = {
> +		.pixfmt = V4L2_PIX_FMT_QC08C,
> +		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +	},
> +};
> +
>  static const struct iris_fmt *
>  find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  {
> -	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
> -	const struct iris_fmt *fmt = iris_vdec_formats;
> +	const struct iris_fmt *fmt = NULL;
> +	unsigned int size = 0;
>  	unsigned int i;
> +	switch (type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		fmt = iris_vdec_formats_out;
> +		size = ARRAY_SIZE(iris_vdec_formats_out);
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		fmt = iris_vdec_formats_cap;
> +		size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		break;
> +	default:
> +		return NULL;
> +	}
>  
>  	for (i = 0; i < size; i++) {
>  		if (fmt[i].pixfmt == pixfmt)
> @@ -103,8 +126,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  static const struct iris_fmt *
>  find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  {
> -	const struct iris_fmt *fmt = iris_vdec_formats;
> -	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
> +	const struct iris_fmt *fmt = NULL;
> +	unsigned int size = 0;
> +
> +	switch (type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		fmt = iris_vdec_formats_out;
> +		size = ARRAY_SIZE(iris_vdec_formats_out);
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		fmt = iris_vdec_formats_cap;
> +		size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		break;
> +	default:
> +		return NULL;
> +	}
>  
>  	if (index >= size || fmt[index].type != type)
>  		return NULL;
> @@ -126,9 +162,10 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>  		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if (f->index)
> +		fmt = find_format_by_index(inst, f->index, f->type);
> +		if (!fmt)
>  			return -EINVAL;
> -		f->pixelformat = V4L2_PIX_FMT_NV12;
> +		f->pixelformat = fmt->pixfmt;
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -157,7 +194,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  		}
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
> +		if (!fmt) {
>  			f_inst = inst->fmt_dst;
>  			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
>  			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
> @@ -238,10 +275,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  		inst->crop.height = f->fmt.pix_mp.height;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
> +			return -EINVAL;
> +
>  		fmt = inst->fmt_dst;
>  		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
> -			return -EINVAL;
>  		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
>  		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>  		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
> @@ -268,7 +306,8 @@ int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
>  {
>  	const struct iris_fmt *fmt = NULL;
>  
> -	if (pixelformat != V4L2_PIX_FMT_NV12) {
> +	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (!fmt) {
>  		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>  		if (!fmt)
>  			return -EINVAL;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

