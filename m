Return-Path: <linux-media+bounces-61400-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G7vLJhbBGqiHQIAu9opvQ
	(envelope-from <linux-media+bounces-61400-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:08:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859C531E3F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F32A300C0D3
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2B73FD141;
	Wed, 13 May 2026 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7WdAaKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2mrGee5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3733F9F56
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670481; cv=none; b=X7Vr4w4KgtuiaW/JVrJJ2uHdnGlBqSb8NnhYm5Ry2pSnjFx1wITy5IIAYefw6YR28c7aYi/ZlaJvfar8O8cnK/OEtsyw1rRKryL8b/XRJjGciMSEvywKnhAXJeRzWBYePcIicDfsDjAXKsh4B11MItqP2VZoArfUEh39Iir+DZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670481; c=relaxed/simple;
	bh=aIGp/rSSNYj8m5iMWxp075wsSXq0iuZYO4lAifc8hmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcR06iygIZlhDukb9+u+Jv/aIxWcGjYk2qS5rKdNh+0URUOatFoKhNuDu5OpK0t62Q/ess3OnK6pyY/Z8vNe9VLr1duWIamz4RujwA9OduGDix8R3r1tt07XZVXxZ+GWMgJahB3FhsecPqh/LtwALd9ozuktXD4+34eFc6VkFyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7WdAaKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2mrGee5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAvgmd1393173
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VgE7XM603GUjVOoC/ZJt0UDV
	Oq7mQaaxZy3cFxJTtyg=; b=L7WdAaKQ0t0KAM6AhUWHjtNaBwJLUC0Y7yw7F/Pu
	iPWcEXoVTUXt8c5w88114Eq6hrjyytj64Vi8r3hx0nhFLRR10yKfABH//YB5gTeO
	jHyr0V47AUJ0/9dTqkaL4PHpohRaKS33MbVl9xz+78sUFGVMvWyZtllzvVUnjf+n
	DGJwVCS1iaUW6CbXsSYBRARsS5aXHh16yHh03MYkHRSndxKIq12vilcQIjlVut45
	ZHZlyBkXkqpICA6CX3fgaB6AqTpgOw8KfkAf9lf5kc+1Dz8+aBCkrn81Gv9nHEA5
	ikConF/k4Opoh+OUhx6mRnaGDcvHQGZ+OLjzYpZOt8Il9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261bd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:07:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d890580e1so110647441cf.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 04:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670477; x=1779275277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VgE7XM603GUjVOoC/ZJt0UDVOq7mQaaxZy3cFxJTtyg=;
        b=A2mrGee5/VGkWTD3or5YRVvPacBZGOwHLXGKgF32R1PpvBv+aTSZ3leX/s0qBOVLuz
         mo8Sm7KKYD3bRmQUekm8gaHJx8vS3mxJd2SobqMmwRAVjBFMldQG0/BtyKQEVvraSSHr
         7M7zcO4NXWUeCjGqwRmffjM2rzmZ1bv4S+GDUQhXYNx/UzW2FRwod/45tRct24slL3Hl
         THCG7SduGrwgtf5h1EOmp1DBEQ9bzBx9+enfo/7wuk0FVfJ8zGkbR8w8cz3MlkolkTbL
         XXK7KQfERo2X0JLu0O5tZacTxepukzXGK8s1phF88h6ZgR/dlsblwYgHaHny6VdaGx2c
         V+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670477; x=1779275277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgE7XM603GUjVOoC/ZJt0UDVOq7mQaaxZy3cFxJTtyg=;
        b=e1WJZw8EEKreOgFpNIk3ZMJOiAtM6GU7Tk9bG8u2g76y2s3jcFEWx9Vkx+CwDs0BWe
         KAyL6Mw6igSkWTffT81izYCOSRFVXhzcKxwaseTcyOVcu3syFhx00uO4Hp3jf2eRG1H2
         4xaRSUQpuFaVHuH31gDrRVSdNMcwyDRWltZVVVSXvcvQYp4aRTcYQt9qaTCn5PwVUiRC
         vIjUu0gN97ZfSNR2TM/nSUXIaJAUaJZhiwkwSVjLnDJ8NSsiRQxFQXb8l+inkL1ObbKJ
         L3Bgpi+b6tT11iIbZbsSFEYYTuGByRnXyCuBWjIp3Ujeo0cQgK1J7uv6GgIMNfz0xSDo
         Mceg==
X-Forwarded-Encrypted: i=1; AFNElJ8M8Q2NCfDTgi5aJpRWyJhZL/oiIc2YVLo5K3IZ+DANq+2QuhnREOV3Z+5saFTqLI9M7DHDI53NUhscZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBC/ErUyEx8s4/9aERBQF2LsuJWYVsuFsehT/fGskRTc1uHPig
	t+5UvoS9N+ZmMSpd1GlFd0GgOR/IUoxMFyyyaMxACJPMkMRKIkQQwpz2Deux4gP9eRfQw1FUKUO
	u2XEomcbo/NKYKeV50QxrJbooW6t1SScnyDueVkJWyxdkyaAz/GRxE8kSoqclZLPL8w==
X-Gm-Gg: Acq92OHtdc+R1P6m2odz57PU5gw7fxtBTQWs2E/jNmApDklKXLDJ6Bo8U9eyZyTnIqV
	yPhCQN/ib7ZmUhln12PbkO57wsvRmxQmShkrteiULsyZc3HRote5ZA++RUsXEdsZV9gQUU/XsM+
	ixfRRS8hjtOgj1w4WA/t3betUB0PZzEPTJIKdJaHHAn82Hw3tJKn2bab30o4Ge2U8Nouo1Rv0rk
	Pi+TauHY3SlUooIQxF84OYIgHGFYKuA8WecljZSt+c80G+UJ8SWzIjyebMrrHdLnYqvv9Njel3v
	g3WOdT78jvQ+ush76t0+1eEmCbtlROQG6ycRnOz5iAJXcQe0+oBkSkv6MqonPalwZjEPwz/JO/w
	Sc78kvSX+HiPbLJjlCy3RuKtK7RfTJBISWuI1jy7h7TDUl9XWvt2YfBDger0+D8nhlTQ9qZr2qt
	5pbzHpa6RH/GTC/fyqSh+S+c2JYBtTpdXVEaE=
X-Received: by 2002:ac8:7c47:0:b0:50b:4a84:aa94 with SMTP id d75a77b69052e-5162f420ae3mr36264371cf.7.1778670476968;
        Wed, 13 May 2026 04:07:56 -0700 (PDT)
X-Received: by 2002:ac8:7c47:0:b0:50b:4a84:aa94 with SMTP id d75a77b69052e-5162f420ae3mr36263891cf.7.1778670476487;
        Wed, 13 May 2026 04:07:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18ef9sm39559861fa.8.2026.05.13.04.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:07:55 -0700 (PDT)
Date: Wed, 13 May 2026 14:07:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] media: qcom: iris: Add hierarchical coding
 support for encoder
Message-ID: <5kza7mdcjvzhfr32azt67fzsz2kqfxzywofqf75chv5otv4tns@4csfz5fd27yb>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-4-4954e3b4df84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-batch2_features-v7-4-4954e3b4df84@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a045b8e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SKCy2CzXe3MlQiDSoE4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNiBTYWx0ZWRfXxxUrkd2Bnjsg
 LRR128ZxZs1AfT+3RAa7ubj5wM9lDKoRRCKKLyO0qvytTTGQ8Fve0B8FlKMDQ5IHWrXTCCBxl51
 VpLbzUJVY7E7aPcX2tlGRVyxAO6BraLCTKwJFqu14LJRJelY5LS9tnlUh5hvYrSI6bIPqUErIyK
 T0cXtPfdmxB0Tz3LZGGvXH9uSo4J3/hvKgForhrhZ7TfqpW67ra6JMI+HGAP/zaCqBpdI++oyvJ
 ILQm5ncDZ/hPb9R++EjIPwFsyBZU5t+jADKhNgNjd1HTEz6lxxcpu1kHc+qYu9fo3rGkjDJ2nyK
 pz/gu+xF+X/KHWqg5yEfaO5HGzAWmBfQcNFsuyCqP86NVKXlRBZB07R5ZEIG5o1E1UzE9XaOm0/
 OEApi1d3a9x6huqKf3E/ErToGcgJ14RH3Eajt7tXKxyOdvjBgoAl1iFtefKyMJ1B0xF8Qcw9jUs
 RyT6DH/MkAbcZNcN+jQ==
X-Proofpoint-ORIG-GUID: wnNULlfKHqFh9uhn-H9PYg5zbVP56sHa
X-Proofpoint-GUID: wnNULlfKHqFh9uhn-H9PYg5zbVP56sHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130116
X-Rspamd-Queue-Id: 1859C531E3F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61400-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:55:13PM +0800, Wangao Wang wrote:
> Add hierarchical coding support for both gen1 and gen2 encoders by enabling
>  the following V4L2 controls:
> H264:
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING,
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER
> HEVC(gen2 only):
> V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE,
> V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 288 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   7 +-
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   |  94 ++++++-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  21 +-
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   2 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 184 ++++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  15 ++
>  drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
>  .../platform/qcom/iris/iris_platform_common.h      |  23 ++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  28 ++
>  10 files changed, 658 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index a6bd2eada52b68afd91032315c2701d8c74a9763..10e33b8a73f60759c4f1cb17b5c95897f0e1468f 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -120,6 +120,40 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return MARK_LTR;
>  	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
>  		return B_FRAME;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
> +		return LAYER_ENABLE;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
> +		return LAYER_TYPE_H264;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:
> +		return LAYER_TYPE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
> +		return LAYER_COUNT_H264;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER:
> +		return LAYER_COUNT_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:
> +		return LAYER0_BITRATE_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:
> +		return LAYER1_BITRATE_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:
> +		return LAYER2_BITRATE_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:
> +		return LAYER3_BITRATE_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:
> +		return LAYER4_BITRATE_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:
> +		return LAYER5_BITRATE_H264;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR:
> +		return LAYER0_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR:
> +		return LAYER1_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR:
> +		return LAYER2_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR:
> +		return LAYER3_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR:
> +		return LAYER4_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
> +		return LAYER5_BITRATE_HEVC;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -229,6 +263,40 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
>  	case B_FRAME:
>  		return V4L2_CID_MPEG_VIDEO_B_FRAMES;
> +	case LAYER_ENABLE:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING;
> +	case LAYER_TYPE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE;
> +	case LAYER_TYPE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE;
> +	case LAYER_COUNT_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER;
> +	case LAYER_COUNT_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER;
> +	case LAYER0_BITRATE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR;
> +	case LAYER1_BITRATE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR;
> +	case LAYER2_BITRATE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR;
> +	case LAYER3_BITRATE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR;
> +	case LAYER4_BITRATE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR;
> +	case LAYER5_BITRATE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR;
> +	case LAYER0_BITRATE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR;
> +	case LAYER1_BITRATE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR;
> +	case LAYER2_BITRATE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR;
> +	case LAYER3_BITRATE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR;
> +	case LAYER4_BITRATE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
> +	case LAYER5_BITRATE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
>  	default:
>  		return 0;
>  	}
> @@ -575,7 +643,64 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
>  				     &hfi_val, sizeof(u32));
>  }
>  
> -int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +int iris_set_bitrate_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
> +	u32 bitrate = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_bitrate hfi_val;
> +	u32 max_bitrate;
> +
> +	if (!(inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) && cap_id != BITRATE)
> +		return -EINVAL;

Why do you need this check?

> +
> +	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +		max_bitrate = CABAC_MAX_BITRATE;
> +	} else {
> +		if (entropy_mode == V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC)
> +			max_bitrate = CABAC_MAX_BITRATE;
> +		else
> +			max_bitrate = CAVLC_MAX_BITRATE;
> +	}
> +

Other than that LGTM.

-- 
With best wishes
Dmitry

