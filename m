Return-Path: <linux-media+bounces-13776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8A2910059
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 11:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EF86281830
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 09:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29561A3BDA;
	Thu, 20 Jun 2024 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lchDhiMl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C6C39FD7;
	Thu, 20 Jun 2024 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718875723; cv=none; b=ByyWVZsO8NzxrMRlrWDCDEbocAQs4sa2KDWSDrsnHV13va+uVwlKsEmo61UHgcYUIRiS6dgz592V4XTptd9FBGBWhoN+g5dIUxvaLXT9vNr6dGDBqHdaZ6389R7s2MxWVRKfaVKs70Va/vG3YDhhQ1XLpLICQRn/X3Sm1ibf/xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718875723; c=relaxed/simple;
	bh=m8KQ0CG7MxsfCOUp9aL+Pw6h/7zIsptflSEXm+JmxPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GGZNWT2Twort5opb/wF5xCY0jhv3C2YTKxuyH24Vn8uK4gjIWI8jqUVmm6dfiTXEDejM6RGWJRZ+PgvFz43ugVl/6o0RQ6iWeuHinYveQmkhbV4uF22RxjMgnrE++Y8SWzHC0iQRB/peZiGHlFFtpEeU39wK7IJG8n5oaKJaz3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lchDhiMl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K14U76025733;
	Thu, 20 Jun 2024 09:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TlThF/S6qrr8QeZ5KCYrQVO1lILTdee58Eh9BRos3gc=; b=lchDhiMlIvHl0ay8
	Vf5I+yZPaKowUdBOgfzaUNNwV0k7lUhwFUz00Ng7wi8FSfzQdjAx/lKGze2YUAOH
	CkhbhA2smLF0SWhZ6lDTKFD6c4VRyBPpT8LaWFxMA0B04gbqwdL8yzgkXGOb5FpM
	9YYPOLWkLy++D6SmkuJxmizimTB1x3fzOTnMS2Anu6c9Voly9ocpDutCKP3aZUxa
	7QkLkiGRSrugFL6bH0C+Gbqh3uSTFn0HG/Lj3LkajmMi6BBQb0dbdecPhYkTP10E
	oTKxjrqcZQy/2chTXkOifqKmg6YXqDNj1yCXLJARnxXYOxPtbrNObRt7jSMpvcMZ
	pYkjvg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujc4kwy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 09:28:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45K9SZca008541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 09:28:35 GMT
Received: from [10.216.22.73] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 02:28:33 -0700
Message-ID: <5b919082-f8c1-569f-a9b1-cd2cdeac8b26@quicinc.com>
Date: Thu, 20 Jun 2024 14:58:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Constify struct dec_bufsize_ops and enc_bufsize_ops
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <9bc4b28a55c42fa4a125c3e03d4c8b0f208550b4.1717313173.git.christophe.jaillet@wanadoo.fr>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <9bc4b28a55c42fa4a125c3e03d4c8b0f208550b4.1717313173.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PgfO9nJlvZuP5LP7gPz5yCCchdDdSD3y
X-Proofpoint-GUID: PgfO9nJlvZuP5LP7gPz5yCCchdDdSD3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200066

Hi Christophe,

On 6/2/2024 12:56 PM, Christophe JAILLET wrote:
> "struct dec_bufsize_ops and "struct enc_bufsize_ops" are not modified in
> this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   12494	    822	      0	  13316	   3404	drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   12766	    566	      0	  13332	   3414	drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  .../platform/qcom/venus/hfi_plat_bufs_v6.c    | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> index f5a655973c08..6289166786ec 100644
> --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> @@ -1063,51 +1063,51 @@ struct enc_bufsize_ops {
>  	u32 (*persist)(void);
>  };
>  
> -static struct dec_bufsize_ops dec_h264_ops = {
> +static const struct dec_bufsize_ops dec_h264_ops = {
>  	.scratch = h264d_scratch_size,
>  	.scratch1 = h264d_scratch1_size,
>  	.persist1 = h264d_persist1_size,
>  };
>  
> -static struct dec_bufsize_ops dec_h265_ops = {
> +static const struct dec_bufsize_ops dec_h265_ops = {
>  	.scratch = h265d_scratch_size,
>  	.scratch1 = h265d_scratch1_size,
>  	.persist1 = h265d_persist1_size,
>  };
>  
> -static struct dec_bufsize_ops dec_vp8_ops = {
> +static const struct dec_bufsize_ops dec_vp8_ops = {
>  	.scratch = vpxd_scratch_size,
>  	.scratch1 = vp8d_scratch1_size,
>  	.persist1 = vp8d_persist1_size,
>  };
>  
> -static struct dec_bufsize_ops dec_vp9_ops = {
> +static const struct dec_bufsize_ops dec_vp9_ops = {
>  	.scratch = vpxd_scratch_size,
>  	.scratch1 = vp9d_scratch1_size,
>  	.persist1 = vp9d_persist1_size,
>  };
>  
> -static struct dec_bufsize_ops dec_mpeg2_ops = {
> +static const struct dec_bufsize_ops dec_mpeg2_ops = {
>  	.scratch = mpeg2d_scratch_size,
>  	.scratch1 = mpeg2d_scratch1_size,
>  	.persist1 = mpeg2d_persist1_size,
>  };
>  
> -static struct enc_bufsize_ops enc_h264_ops = {
> +static const struct enc_bufsize_ops enc_h264_ops = {
>  	.scratch = h264e_scratch_size,
>  	.scratch1 = h264e_scratch1_size,
>  	.scratch2 = enc_scratch2_size,
>  	.persist = enc_persist_size,
>  };
>  
> -static struct enc_bufsize_ops enc_h265_ops = {
> +static const struct enc_bufsize_ops enc_h265_ops = {
>  	.scratch = h265e_scratch_size,
>  	.scratch1 = h265e_scratch1_size,
>  	.scratch2 = enc_scratch2_size,
>  	.persist = enc_persist_size,
>  };
>  
> -static struct enc_bufsize_ops enc_vp8_ops = {
> +static const struct enc_bufsize_ops enc_vp8_ops = {
>  	.scratch = vp8e_scratch_size,
>  	.scratch1 = vp8e_scratch1_size,
>  	.scratch2 = enc_scratch2_size,
> @@ -1186,7 +1186,7 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
>  	u32 codec = params->codec;
>  	u32 width = params->width, height = params->height, out_min_count;
>  	u32 out_width = params->out_width, out_height = params->out_height;
> -	struct dec_bufsize_ops *dec_ops;
> +	const struct dec_bufsize_ops *dec_ops;
>  	bool is_secondary_output = params->dec.is_secondary_output;
>  	bool is_interlaced = params->dec.is_interlaced;
>  	u32 max_mbs_per_frame = params->dec.max_mbs_per_frame;
> @@ -1260,7 +1260,7 @@ static int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
>  		      struct hfi_buffer_requirements *bufreq)
>  {
>  	enum hfi_version version = params->version;
> -	struct enc_bufsize_ops *enc_ops;
> +	const struct enc_bufsize_ops *enc_ops;
>  	u32 width = params->width;
>  	u32 height = params->height;
>  	bool is_tenbit = params->enc.is_tenbit;

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

Regards,
Vikash

