Return-Path: <linux-media+bounces-58957-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJB7LwTY4WkuywAAu9opvQ
	(envelope-from <linux-media+bounces-58957-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:49:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 464024178B9
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C90D3170889
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 06:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F308A31B823;
	Fri, 17 Apr 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGuT7m58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHbhDAJT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353A730EF9A
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 06:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408450; cv=none; b=M3SGb9H6sbKc8PlNh2jBRcGMzPJgVmPYVgc9CEqgPo2nNU/IdM4eSo6cfj3qDlOYKNAOmEocv7Lh2wVKmzFYlNA0NM+e6DT37lSi8GCvgThkNhN9Jm4tSM9PNTMUavcT5UPMVhr6qfaNdyV6PPh3RE2Et9ky2P6KJaVCyQo55b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408450; c=relaxed/simple;
	bh=7E8KXrAb4rAzGifcQFTcEfNQehUOwd06FrsOfA5FV94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbZQMY4u9J6o77N8cnStJ7U/fgMEpYk5gE8cBxMruJoSRrg2a4nUJrRqiOoH452qS4yRnqmtdk23MQfxwRbmWEvFv+zeBaxIMvtZPhwbAu1oXi2XRFNlrl+PQECjlnAIsV29koVWBZX1yEDonvJIut2LBUWWfmArpIUgPP3ACQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGuT7m58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHbhDAJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0fh7p869236
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 06:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bb8Xgb/vhmyiApz7LARdkc3T4/oZmvUWpJTgMfiXpfM=; b=ZGuT7m58aw88Ijt7
	ISeKIRtfLUgBBp+N8OkA7JTo/pibfnJqcL40PRBKw+LjN9o3Lw+Ekjn+pNc2ukjo
	GN2jBQjBd+6j+8oh8IGLTtdyiI1i/isBdd+KkT1BqSxKAUTQYHLHj4OjYywcXes3
	smnT1zi83IOvPuw+tHiMhucQj2xQOEvpMltySd5ZcMLlLtNnVOjWGAkZ8vXxeBG8
	r0WMrg9Ocjqt6bmJhpWtsBywPMwEh2OOynX7m1yW6Rz9F0SIkC20/IFCHjZ2WsaN
	a4rVWdT2Wr0UjZewnFf/79w+pPVyX3pEXIVky9RXV2R94ATAY37EFrf/KWiXMf/8
	/oYrgw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvruc1kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 06:47:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7939ac69edso512144a12.3
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 23:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776408447; x=1777013247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bb8Xgb/vhmyiApz7LARdkc3T4/oZmvUWpJTgMfiXpfM=;
        b=UHbhDAJTW2OwgygC0PJn+uoFh6cwupRrugjBYQFBIjEKsTxMrqtdKgeV0UjjvCemv9
         w1fmxlpk8VBKznKaaASeaGFJUh7XLNdzo38g1pdYRb1CMSvevL2d4dK1yKgmcK6GdPl1
         dvYN81OKR4zq9ffOnibh8F0PLef7S9JHl6sdOXZzUWsNvn2W01n/vEttccxqeB4hHuG5
         SpK6kFHj4aVdmFst2nlcnJ9o6vJK5chLGtYxgiHCPOdJkEIcjoACZ9i8bFkgWmh11R5d
         8pH3uixyouF826fe4nsE7B853XN95rfSyWWy1y41UMNUNTdOBATNRnb4dI/dSpgdjNos
         3J3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776408447; x=1777013247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bb8Xgb/vhmyiApz7LARdkc3T4/oZmvUWpJTgMfiXpfM=;
        b=hwvjlu4Zto/DLvELEmOIAn4qy9R1DjRUut1o4o7EhndOeiS7ATmU5Jrdz55/lh5zrs
         /yEOlYq0ijTDlSv6506Gt88qG12h4h5q8yiANSOrSjhduRejMQJF0NtgW2MBDznoGbvP
         VVyEt5wync6KCIEhr6xwsLoXIU4i0k/XXjkpegkSbh0NzGgerZif9KBcOxHka/DTqwMW
         hv4PdVeGSrRhQ5nAoGmQjZ/IDH8w8r87cxYz4USBJbMSa5twUvVLdISDrgYmSv/NAHpF
         qAMmKbIOcp1EbDZr0Slw9G19JpTzflCWRvZjXNfDY7P54GfMEjyAOhDin+TW16NBtWpM
         APNg==
X-Gm-Message-State: AOJu0YxU3mYuVcHAJNo85JXcqZHWKsT2q87xNVByeDKMWWHxICdiT1Vf
	BpRYdTc7f11oeLRU9OL/pK7mIj6j/WJPewjmPQYVkcqvRbV1QWb0IFP+MTCroFBUIVOLmn57VvT
	XGgHvgnhvQsRqmzuGTC0Jcmd/0s96BaWnikPhJzcHcXONtjFf5pCgG+eQfDZ9I1IUnA==
X-Gm-Gg: AeBDies3sTwxikOU8pT5T2PPWRToAscVCmNoUi7rjHcHpruUTfp7JGJe/N7u0IwYf+k
	BvZejOVkx+665MQZgH0xtLRl/P++9f09lTrh0tQAZUYZieZpUWdAntnppi95t3jaCi1smVIy6SW
	A32U7uNqUyf1m+N8m/qlKv8HK/0r7fgnS5DLnvY0ZVBRRm9LeK36ZPdkZaD1VlwdcB18Xxdc/2Z
	7AgJtnDZo4eu0/BflCY85ukL4p+efZwHh820LfIHw809mgYbTH/re3X6CoELK+GYZhljfdXFXuR
	ZhEnAvcDG0zmf7bnnNC3oNhO6FYYBWse8oI08jZpcwSKy4YwAA3qWY4SAIJ99f5KxbkC6kiFkgo
	ztqYPdm3oUbJV5CJ3mIcwvJ5E1BKMgrvnQvI1Ga/UmzJNdvzNr1FeP0GIw+s8Umhx
X-Received: by 2002:a05:6a21:9995:b0:39b:c0b5:b0dd with SMTP id adf61e73a8af0-3a08d6918cbmr1785034637.4.1776408446711;
        Thu, 16 Apr 2026 23:47:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:9995:b0:39b:c0b5:b0dd with SMTP id adf61e73a8af0-3a08d6918cbmr1785005637.4.1776408446221;
        Thu, 16 Apr 2026 23:47:26 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.231.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f0811fsm622614a12.0.2026.04.16.23.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 23:47:25 -0700 (PDT)
Message-ID: <0afa05c9-1cbe-88b6-32d6-f65813391817@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 12:17:21 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC 1/7] media: qcom: iris: add QC10C & P010 buffer size
 calculations
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-1-428c1ec2e3f3@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-1-428c1ec2e3f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA2NSBTYWx0ZWRfX3hvQ/K+6UGTi
 jhyevkLRVQ3Xq8D+3xcEy6LiUNlzqaECKG1XTFCEKqhe3m/xhgbc0B75Dlo12z2nGKefQa8ucz9
 Oj33WoGoLF6uPmMIZI1ErOOWxzcN4C4soqLzJeUcVp2StLPTC6gHECzopNUTuqDjJoS2MPfzb/a
 Mmo8zHWpvNs52TbDtjWZYpqTcsz/3oplndAkJSxCfnoxaRuJwzoMqZQ9tjNRbKdKvHvPfhh4V4O
 79KxyyK1OVt/pWA1sCo/hCsJmu3jRJFm56j20ZdK1iSD7hlEBuFTsyPGjPBFbU27Lnat/8nSJg1
 b6ZoFZsBfskp43RxUKoGcAGQ+qgXBVj9zwwXAkqEaGhUHJQcYxSRo6R/a/IKOU8Ih4ybyfZvmAi
 xuSQ9iZeRiBboFLjzkVJtByHFah6xDKh0ZCknGojExXMesUamDNQRBC170C+aQA68Ghdmi4v9TG
 wvRde3VUvpOaOLXAsbg==
X-Proofpoint-GUID: ilgKQW288EhzW77l2Q6Fgjj7_lH9CpHC
X-Proofpoint-ORIG-GUID: ilgKQW288EhzW77l2Q6Fgjj7_lH9CpHC
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=69e1d77f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=llJV7PLoYzplBNayqe3woA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=uEfOiGl7ADfDV9_g7LQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170065
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-58957-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 464024178B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/2026 10:13 PM, Neil Armstrong wrote:
> The P010 (YUV format with 16-bits per pixel with interleaved UV)
> and QC10C (P010 compressed mode similar to QC08C) requires specific
> buffer calculations to allocate the right buffer size for DPB frames
> and frames consumed by userspace.
> 
> Similar to 8bit, the 10bit DPB frames uses QC10C format.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 81 +++++++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 9151f43bc6b9..a0e31bff8f26 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -15,7 +15,9 @@
>  #define MAX_WIDTH 4096
>  #define MAX_HEIGHT 2304
>  #define Y_STRIDE_ALIGN 128
> +#define Y_STRIDE_ALIGN_P010 256
>  #define UV_STRIDE_ALIGN 128
> +#define UV_STRIDE_ALIGN_P010 256
>  #define Y_SCANLINE_ALIGN 32
>  #define UV_SCANLINE_ALIGN 16
>  #define UV_SCANLINE_ALIGN_QC08C 32
> @@ -80,6 +82,26 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
>  	return ALIGN(y_plane + uv_plane, PIXELS_4K);
>  }
>  
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
>  /*
>   * QC08C:
>   * Compressed Macro-tile format for NV12.
> @@ -204,6 +226,55 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>  	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
>  }
>  
> +/*
> + * QC10C:
> + * Compressed Macro-tile format for TP10.
> + */
> +static u32 iris_yuv_buffer_size_qc10c(struct iris_inst *inst)
> +{
> +	u32 y_stride, y_buf_height;
> +	u32 uv_stride, uv_buf_height;
> +	u32 y_md_stride, y_md_height;
> +	u32 uv_md_stride, uv_md_height;
> +	u32 y_data_size, uv_data_size;
> +	u32 y_md_size, uv_md_size;
> +	struct v4l2_format *f = NULL;
> +
> +	if (inst->domain == DECODER)
> +		f = inst->fmt_dst;
> +	else
> +		f = inst->fmt_src;
> +
> +	y_stride = ALIGN(ALIGN(f->fmt.pix_mp.width, 192) * 4 / 3,
> +			 Y_STRIDE_ALIGN_P010);

Y_STRIDE_ALIGN_P010 is being used for both P010 and QC10C, lets keep it
Y_STRIDE_ALIGN_10_BIT ? or something similar ?

> +	y_buf_height = ALIGN(f->fmt.pix_mp.height, UV_SCANLINE_ALIGN);

why not call it y_scanlines only?

> +
> +	y_data_size = ALIGN(y_stride * y_buf_height, PIXELS_4K);

s/y_data_size/y_plane ?

> +
> +	uv_stride = ALIGN(ALIGN(f->fmt.pix_mp.width, 192) * 4 / 3,
> +			  UV_STRIDE_ALIGN_P010);
> +	uv_buf_height = ALIGN((f->fmt.pix_mp.height + 1) / 2,
> +			      UV_SCANLINE_ALIGN);

s/uv_buf_height/uv_scanline?

> +
> +	uv_data_size = ALIGN(uv_stride * uv_buf_height, PIXELS_4K);

s/uv_data_size/uv_plane?

Pls keep all these names consistent with other functions, applies to below
variables as well.


Thanks,
Dikshita

> +
> +	y_md_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width, 48),
> +			    META_STRIDE_ALIGNED);
> +	y_md_height = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.height, 4),
> +			    META_SCANLINE_ALIGNED);
> +
> +	y_md_size = ALIGN(y_md_stride * y_md_height, PIXELS_4K);
> +
> +	uv_md_stride = ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.width + 1) / 2, 24),
> +			     META_STRIDE_ALIGNED);
> +	uv_md_height = ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.height + 1) / 2, 4),
> +			     META_SCANLINE_ALIGNED);
> +
> +	uv_md_size = ALIGN(uv_md_stride * uv_md_height, PIXELS_4K);
> +
> +	return y_data_size + uv_data_size + y_md_size + uv_md_size;
> +}
> +
>  static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
>  {
>  	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> @@ -268,10 +339,18 @@ int iris_get_buffer_size(struct iris_inst *inst,
>  		case BUF_OUTPUT:
>  			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
>  				return iris_yuv_buffer_size_qc08c(inst);
> +			else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C)
> +				return iris_yuv_buffer_size_qc10c(inst);
> +			else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010)
> +				return iris_yuv_buffer_size_p010(inst);
>  			else
>  				return iris_yuv_buffer_size_nv12(inst);
>  		case BUF_DPB:
> -			return iris_yuv_buffer_size_qc08c(inst);
> +			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ||
> +			    inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010)

Please introduce one API, is_10bit_format and use that here instead.

Thanks,
Dikshita
> +				return iris_yuv_buffer_size_qc10c(inst);
> +			else
> +				return iris_yuv_buffer_size_qc08c(inst);
>  		default:
>  			return 0;
>  		}
> 

