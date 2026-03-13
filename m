Return-Path: <linux-media+bounces-55674-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B5hE9YItGlvfwAAu9opvQ
	(envelope-from <linux-media+bounces-55674-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:53:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A54DF28345A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF79A3247671
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13FE37FF51;
	Fri, 13 Mar 2026 12:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzSGEcbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eawkK5iY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3DA37FF72
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 12:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406388; cv=none; b=aaKxUTMGLlqnmwnf0WC7VfXmjWU9ltD3d4ZKuj/R3B3fDz1NO4s2dK01he6eozOemAZwOsM72ps8qTZZEsr0M+GGp2d48MphMgExKO0V+94aRvC7t1SI7C6m8PAvbl3C/pZVZLdzreIFhpUd3KkpX75K4a8nXrVMpEYGbu+1tE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406388; c=relaxed/simple;
	bh=nJhV93H7AXahrb65Og+utzle97aJod/d0kpCZVnlzmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhgrwBNsTPwFhSz3z1FMqOjA3zG+ltSeea+5n/dbKyn2lUAZU/vRYI/ymILmajPZ8aVYCW1yREmY9QM3ZIyNiFYOgazkXU8nLh5j5sK44YyNRTA3nurDk9iZHXNb3JsPwY457kiIxVRV+en+Dh/i6Wq+CgzZh3nHgdnBqRmBrIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzSGEcbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eawkK5iY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8vCbI481530
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 12:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSVdqnHxlU9HD01HJHPseaMKKoXK4rDVcr80Iyt3a2I=; b=bzSGEcboakR2Rn0i
	d7+wPxAr5EAC81eeYDMnlDtaI1zuLSu+RjpbqJn/FO14WYBiOTNH1CSM8M36X/Jq
	/yEhQdWPhaIalXDIlEHxR03PfgJ1NTUjq7osauFXmf6pX627TV6ZMGhGknbRD5Wy
	Y+hhKwhJRXhFUO0uDS2YKuftbnDF6LKcKmlhTpCpBzfPSoamQQHks8YFfM6TzW1W
	p5TPO6FurftCnzOhKTnCyqAXU8ygOnTTuxcSL7vqmRsgOhanEG6qVmkiirbQdPmV
	PHzFBwyC7AtiehWZKDsIoO7c7OjE2loa1zuJnKXfH1TE7y2EDX9LsDX76OLKkY1b
	qzmggw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7rrm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 12:53:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adc527eaf5so16239635ad.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773406385; x=1774011185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSVdqnHxlU9HD01HJHPseaMKKoXK4rDVcr80Iyt3a2I=;
        b=eawkK5iYt2QXTrzEMsm7HQG7UBeHSMeBGEr3uImUpZBGY9z2tPW3bW4N6nPfEuECjl
         Hmpbm4Sp4Q6O8PTsULpa0/60u26zG9YBNn2jx0W7PT+I3spKHW/0UzhPb48ceQMt+NYl
         Z/0pBLJXnxW1LcKAfdNFNE4XgY3+KuIMPtYq/Nxjn5BAQ2+fGb598t5UdaH3Ee/kMNgf
         ZtzUp0qeO/d3vizi3XYcc9+V1CTmbRF4xGFAK8SbAOxFu30YATHjX2/1x3XxFhWIxgM0
         WQ4EkCL9vpkKfXOX8ovSpwjzfXb5IWqYkiPbhxL+tZOobDxmrCoxEy91dK87wqwBAclO
         KOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406385; x=1774011185;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSVdqnHxlU9HD01HJHPseaMKKoXK4rDVcr80Iyt3a2I=;
        b=AOwOwSZynR/ydx77k/0dYO7g1V8sO7Xn47pcHcOPl5LAIRFpeaNbmY3quxSa4GH0EK
         QwuJx4OFaWRwEnH87/QflUbMx76/Ln92VKsdulb/rMfZZqqGE0lTn36aV6dLYsidDYi5
         c/KEzzLyFUe4Xm6seuvcuhpWGgnscBzhEQpel3rKlUXaX3PZIhpuhlEjPVlF2bSXEPZi
         HoJJ6Ky9Fft5k3PjhvnXYRGFgZsAWxYu+5dbBsMYSEibDRiNj0PHKFBCPUS8nYpBRwvO
         3Ghy50Y9lgYDnxWfdlN906uTAjKuyL7VmFUztLmtJ5DnQrqg8omIqh6uOxwvTkqusbIZ
         Nwgw==
X-Gm-Message-State: AOJu0YyFMc+A14BemWqZRJAzOa+QF1z0N8HHrTL9nQGZla3nzNYnYtPs
	qB2O2fMkzJ+U4ZpePwus2o3gg6qjfmEgunBRcHMvZRuBHikI7ScjHrJPxDMB+8E8NdZXjTkePGZ
	FXXJp9McuR8RSDlxqv5rKFapJdOQ1xCeG1GB/JjqxCfNGxWFyfiYSgeJH2DWsOIrFRQ==
X-Gm-Gg: ATEYQzyEdhwbwPLPD7GaEuKXZDa7rHqvsCcIkL02k/7BgnrigEONLQENw1U5YehfUgC
	ZFBFcGfv1gWNgpIMZMN0tU013Sv/vudC3YsoWzEC0zAth0BLx1jxaku4bfPCmhve0DAi8p3PYR8
	1w3xaJzousUu5j11n8ypZYe3iiIBj2uGhtnwaNX4tcV9/DBWKgkPWrhdEmoTaXDa5BxPsk0Nws1
	blLX/v+PHUSXv0GXmC346wCzuwBHNCU516HYOql0XgUDbCj9O33iCyLgnQbJ8xXgUc6LeSW1RIM
	OwnShZeUoOe/qm6nn1y90kDXzIUcw7JybN1LCiRcPLPFDbCYa0gpOCJaUuomk/POkKDbVcVguOj
	fROeCE2t8tarC6NoVl5GFgeJSkrgv8DsMkXw6Y94AyCBZnlWCDsim
X-Received: by 2002:a17:902:cecf:b0:2ae:cbd9:5f2a with SMTP id d9443c01a7336-2aecbd961acmr29182425ad.11.1773406384621;
        Fri, 13 Mar 2026 05:53:04 -0700 (PDT)
X-Received: by 2002:a17:902:cecf:b0:2ae:cbd9:5f2a with SMTP id d9443c01a7336-2aecbd961acmr29182215ad.11.1773406384060;
        Fri, 13 Mar 2026 05:53:04 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece5f8dafsm22234935ad.26.2026.03.13.05.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:53:03 -0700 (PDT)
Message-ID: <45fea21b-90d0-5012-8c7f-218012d456ef@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 18:22:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: iris: drop struct iris_fmt
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260311-iris-remote-fmts-v1-1-de0044453b68@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260311-iris-remote-fmts-v1-1-de0044453b68@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9pd3kaZ0FvPcF7scLI27F5AwOry8F_m5
X-Proofpoint-GUID: 9pd3kaZ0FvPcF7scLI27F5AwOry8F_m5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMiBTYWx0ZWRfX3wbIzbyiiXCN
 mRXuh/qrYZPSkVBKAdBByRQN1FTedQm048YxZQyV40drKyZ/zqzvFGJ3O+4fIu7Q9rLiYjipMIs
 wcfgRz/fMMXMIsKG8qdyp9CBJ7mqqlH7RIKCqDb4gbMbh92xlq5qxBRVc0rTWeAt2evfRg36mqV
 4eXnxkUPDLzIKspdF2VsjSK2Is7kyq++J727V+9Z/2KdTr6acjCJA72/J33cOBH8UaxnqhwFW+R
 qMPOUXuWgg+uaNh5gACky9HJdU7VWLgq237O5dtE4rrLkvCXkP2TpjARvlD+Tou47CiaHTSOuql
 lf5A1M4c5IpELXzqWUQBxgJnOeuXEC0N5Ul2ZCorUzbJymFZ8TlfVFLV3BZKtDlhAyJC2DOAUIE
 z8MjF4T9FmwJRSvrsdrgoj4cR+pCI5Q3c0c0EqJngEv3zh3fo/4HqGcd32StIfTumMdEdk5Askg
 vVP0+JOlA/VoVZTDfnQ==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b408b1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ndT/fs+coltRyMHftQWjTw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5XEODaEGe611wgU1Oz4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55674-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: A54DF28345A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/11/2026 5:40 AM, Dmitry Baryshkov wrote:
> The struct iris_fmt unites pixfmt with the plane type, however the type
> from the struct is not actually used. Drop the struct completely and use
> u32 pixfmt in all the callsites.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_instance.h   |  5 --
>  .../platform/qcom/iris/iris_platform_common.h      |  2 +-
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 17 +---
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 22 ++---
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 78 ++++++++----------
>  drivers/media/platform/qcom/iris/iris_venc.c       | 96 +++++++++-------------
>  6 files changed, 80 insertions(+), 140 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 16965150f427..0eb256b0e82e 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -27,11 +27,6 @@ enum iris_fmt_type_cap {
>  	IRIS_FMT_QC08C,
>  };
>  
> -struct iris_fmt {
> -	u32 pixfmt;
> -	u32 type;
> -};
> -
>  /**
>   * struct iris_inst - holds per video instance parameters
>   *
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580e..737ca4b1fe5c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -237,7 +237,7 @@ struct iris_platform_data {
>  	u64 dma_mask;
>  	const char *fwname;
>  	u32 pas_id;
> -	struct iris_fmt *inst_iris_fmts;
> +	const u32 *inst_iris_fmts;
>  	u32 inst_iris_fmts_size;
>  	struct platform_inst_caps *inst_caps;
>  	const struct platform_inst_fw_cap *inst_fw_caps_dec;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index aa71f7f53ee3..c1e91e18d07f 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -20,19 +20,10 @@
>  #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
>  #define BITRATE_STEP		100
>  
> -static struct iris_fmt platform_fmts_sm8250_dec[] = {
> -	[IRIS_FMT_H264] = {
> -		.pixfmt = V4L2_PIX_FMT_H264,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_HEVC] = {
> -		.pixfmt = V4L2_PIX_FMT_HEVC,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_VP9] = {
> -		.pixfmt = V4L2_PIX_FMT_VP9,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> +static u32 platform_fmts_sm8250_dec[] = {

static const u32 platform_fmts_sm8250_dec ?

> +	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
> +	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
> +	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
>  };
>  
>  static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6..cd2725d3ff16 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -19,23 +19,11 @@
>  #define VIDEO_ARCH_LX 1
>  #define BITRATE_MAX				245000000
>  
> -static struct iris_fmt platform_fmts_sm8550_dec[] = {
> -	[IRIS_FMT_H264] = {
> -		.pixfmt = V4L2_PIX_FMT_H264,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_HEVC] = {
> -		.pixfmt = V4L2_PIX_FMT_HEVC,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_VP9] = {
> -		.pixfmt = V4L2_PIX_FMT_VP9,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_AV1] = {
> -		.pixfmt = V4L2_PIX_FMT_AV1,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> +static const u32 platform_fmts_sm8550_dec[] = {
> +	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
> +	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
> +	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
> +	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
>  };
>  
>  static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 719217399a30..2d3e2d72f221 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -67,23 +67,16 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>  	kfree(inst->fmt_src);
>  }
>  
> -static const struct iris_fmt iris_vdec_formats_cap[] = {
> -	[IRIS_FMT_NV12] = {
> -		.pixfmt = V4L2_PIX_FMT_NV12,
> -		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> -	},
> -	[IRIS_FMT_QC08C] = {
> -		.pixfmt = V4L2_PIX_FMT_QC08C,
> -		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> -	},
> +static const u32 iris_vdec_formats_cap[] = {
> +	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
> +	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
>  };
>  
> -static const struct iris_fmt *
> -find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
> +static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  {
> -	const struct iris_fmt *fmt = NULL;
> -	unsigned int size = 0;
> -	unsigned int i;
> +	unsigned int size, i;
> +	const u32 *fmt;
> +
>  	switch (type) {
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>  		fmt = inst->core->iris_platform_data->inst_iris_fmts;
> @@ -94,25 +87,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  		size = ARRAY_SIZE(iris_vdec_formats_cap);
>  		break;
>  	default:
> -		return NULL;
> +		return false;
>  	}
>  
>  	for (i = 0; i < size; i++) {
> -		if (fmt[i].pixfmt == pixfmt)
> -			break;
> +		if (fmt[i] == pixfmt)
> +			return true;
>  	}
>  
> -	if (i == size || fmt[i].type != type)
> -		return NULL;
> -
> -	return &fmt[i];
> +	return false;
>  }
>  
> -static const struct iris_fmt *
> -find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
> +static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  {
> -	const struct iris_fmt *fmt = NULL;
> -	unsigned int size = 0;
> +	const u32 *fmt;
> +	unsigned int size;

pls follow reverse Christmas tree order

with that.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

