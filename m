Return-Path: <linux-media+bounces-64067-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TNZDGpfUJWrHMQIAu9opvQ
	(envelope-from <linux-media+bounces-64067-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:29:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CF46517F2
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:29:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OKALnbUe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JM914pxz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64067-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64067-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB69D300AEC7
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 20:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837EA330305;
	Sun,  7 Jun 2026 20:28:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D96631F99D
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 20:28:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780864137; cv=none; b=EXk9CwUffl6Um6JUsyt1infpTtNY+6+gAUWScoThTafw9BTH0WLrjKRnmN3q/yTVoX7ykZcYlCuYKls/4dT8Mf4ql6IsF8Cn1nyWy8taSBst0xsX/1VSQ+2SS3JRc3uIzbnxEpwtsFdsY18mMlWYZwAF0o+LnDkC/KNke2CeIbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780864137; c=relaxed/simple;
	bh=X/M5hTevAocLAlRb5fBesPFQooorHVzBtArCjRX29pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGrUcINwlC11wxMChMehwArw0yoWGcyYTXmZYCGY5A8Lh0ji83aVwdDA8nqJ9SdOI8BNVBMjmdKWkvRrlgkoYMBZnfhqebwykq8aHdFRRPLZBl56e9WIj+LG6vJ9a8LKTDGmDWUjb4oDwhUwSo9wiowuNOZ0zFb25DxcOd9kNOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKALnbUe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JM914pxz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Jt06E1464969
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 20:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wdLUsUHVzttwrFo5wPPuRwgT
	GSi3dFu/xDl7lAHMlsE=; b=OKALnbUev9Wg1I8BkeoSB1+VDOeC8CvManpYIKZL
	0/Y2GnyRD2EpQ2b5j05ZSG1wrU1TXgaPJt9NhEMSIkSAC5Z6XWBbhMEF/da3+9vU
	JIE6FHn6/KLdLi/xtbxvV8UZc0m91LdfLrBLUEaUKncwSVJx6RPfm4d3Nm9cyNVs
	Qc4r75lCL1urdAFx2U0e4oMKSXKW9X+fof6lsBTCk706qvRkXNXEwTrggTTpTNXA
	nLA4vZmbCvmh/yduS5M5sbYsqlAh8QnYF1Fd7rDHWEmuH54V2/ntv+JwudcEm3ve
	9RPuEZ8pYtr42HBkJKzLBcnLkOOeAuuwKAO1kKzmKmxwVQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3n3p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 20:28:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59ec1fd295eso2047741e0c.3
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 13:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780864133; x=1781468933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wdLUsUHVzttwrFo5wPPuRwgTGSi3dFu/xDl7lAHMlsE=;
        b=JM914pxzOW925/ex+Qe1ZZZlJ8Vm5XBc687ZlW0Gxhl1BUPqBHW1L0STtlkZtbp4Qk
         sFjEGEleRGoo+Ua6OSjlURZ1hr96/k5Uib0AFJT6H5Z9OyCM1fHaRBbNEdVPQRjgSpVo
         jYhqFpJh8Gox0dK7QMmnSV5jxmTLUthY7gCKfFgXrigBgomW3iZoqTCXdfyBFcQqY2Zq
         ndIgfBpXspwhi0vGleiwwB0QC5QMMDzpbB9enMIqweb+ici6h4Xzl07yUePyCo5cmBgg
         bLfzlXmHR0Bx7W1fzPVm/ON/MgyDraWHu3q2qjqg53zM3+PDDDgrxcQxPxg6J+EzF8R5
         0xSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780864133; x=1781468933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdLUsUHVzttwrFo5wPPuRwgTGSi3dFu/xDl7lAHMlsE=;
        b=QB/IIJjbkK/5h11iNU41Bbu+GIoRar9kxD5CLJTO7d+zQyyap0qg3IzPGAK33sqDoQ
         +u7074ER1Nozvy4euGlSDM40zrh1CdGedOmsxqEN40guDJOtyF7ntHOspRJGGYb7FB11
         7LFye2yi4M0kOP0hh9EOaiykQZm+Piae7eIjz0bsw1+p4Z8k5XLFhy6Ky3OVPLsuu3re
         Vj2et98hE3PvbzEFOLonkaHGReFOpFVEo/vTollCW19N8p4rxE6Ijboq0KORROk6P3ll
         MnkhaclR9rYNymr/07zfzr6BJF+mYthqD8kUWQv4kSZb5y8oG78an6qTw1D5ZEJ2HpR0
         qPvA==
X-Forwarded-Encrypted: i=1; AFNElJ/vhLMR2EW0clHSQJxMGbCBoTx7hYyMu7+ExXIHChfvNUoFUJ4A7cNfg44Akw+cWTgZBZK6cpGNHaHRyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLLqNuVYW3Ymkyebj+QTw+F367A5i2k9FdfUF5X18BtpB8LeFO
	0HQqv+hOBW/A9TT9ubrycm9dCgjKvA879bhJjoGhkDRuiDQiFCbZ7TmjMc/zhgdPWPJHq1GgNnP
	IYvfxVldTzWvFN5LvSKoaRgz7D5ffzuMaF7vFERGEaOq3SwjdeF3w8c1xyx7PTF+4Pg==
X-Gm-Gg: Acq92OHl+xbWbRfzhgqtalmfmDbwORzXw2BGAutNMXpHcLFJd0ubIvijTYXYm/00euj
	8xU+Brgj+IkWGXpzL0/4wej/q+FRrLk84JLwElbWRM3C4UXNDqZeSMSUdDamB4IaSMPQPQb++RQ
	ikVKVpLjW5lS+mbU62gV8tBNmfrXyerHILuKBG8AmFWvvkMQx+s4GOEodxkBihFeHCt2XQKedC8
	Pmke9zesOkoK2qubBezaO5nEH/uDicmp6tNqXscHjn4X9WHwItCkibDInQDpb8sU6kChurP+JjP
	HuMcDymRvF4WQnAUi5q7cR60HuhZjYfLuM3kCyxaVIN8hUYQnWFlwpmEJNxlGmjwqNtPmAtBfou
	Yi07nnsweaEI4slLLkLp1uXh7nmuScFdrSwmFtWoFF6KxzFaArg0vasdr5T9H55PQgEVGvPxTvN
	+Rkh67sOIYpFN5Yw0xnk/MyuyEqD1pEG/i1/7tM3SX2tboSw==
X-Received: by 2002:a05:6122:3d12:b0:59f:4c56:9d0e with SMTP id 71dfb90a1353d-5ac4ec9396bmr5834136e0c.5.1780864132690;
        Sun, 07 Jun 2026 13:28:52 -0700 (PDT)
X-Received: by 2002:a05:6122:3d12:b0:59f:4c56:9d0e with SMTP id 71dfb90a1353d-5ac4ec9396bmr5834127e0c.5.1780864132280;
        Sun, 07 Jun 2026 13:28:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9868afsm3327120e87.59.2026.06.07.13.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:28:51 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:28:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: qcom: iris: Add gop size support for gen1
 encoder
Message-ID: <ehhohmkfuh3qz4vdcqtgjy6ryvqzqibphnug3somb4f3pyxc5r@rdtveg2ynm5n>
References: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
 <20260604-dynamic_encode-v2-1-6e97df032482@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-dynamic_encode-v2-1-6e97df032482@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwNSBTYWx0ZWRfX2k11CWcqji3f
 cr+jW1q2Nwm1WObe/xBN2O9pB97Y9YM2ifyAGiyMP0zgnRUG04Iuy0CFsmO0QcPRPPRh0zT/JZj
 pMJ0vau1aPfvgvnwBNiG2+ZfVifqEnYb85oCbbBZ7s3zoosR2Q4+G9/qGzbXAyUMqmtqRNEbB06
 L+3O1FsRI1HXRyG6iHSzSHUSqO8pPRW4wWj/sGcVCJDS7g+DfKvL3deOJ5lKE7GSCrPbNTe5ImW
 pbdPtRkavoYxMmEqqSdUMrTjyZPE2PpT4pczCGAe9wlJpprZ8BIbRfEJmX8TzGLYdEFN0+EYG87
 q6VJLs3EqVTZ2tve5ldlDHudwZTQLZTd6HT3cA6ZNr6ddnyTjCiYRvMERJG6KmI5NBehbvXi0Ga
 1HONafZZ7Cu5ZLH1NwWXeHJVPMTr/CN3kchIT6/wIW7Om5nuRh4RoDiyRUW6L/8e4ILaHc69c0F
 LpCIVWBUCVXSrI5+tFA==
X-Proofpoint-ORIG-GUID: dUSFCPgYgJOHcEhEhqDEeVPZA2E57J9c
X-Proofpoint-GUID: dUSFCPgYgJOHcEhEhqDEeVPZA2E57J9c
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a25d485 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=4sRnQFuGRlS7IHtNp0wA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64067-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,rdtveg2ynm5n:mid];
	FORGED_RECIPIENTS(0.00)[m:wangao.wang@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07CF46517F2

On Thu, Jun 04, 2026 at 04:00:38PM +0800, Wangao Wang wrote:
> Add support for gop size configuration on gen1 encoder by enabling
> 
> V4L2_CID_MPEG_VIDEO_GOP_SIZE.

Extra empty line within a sentence. Instead please explain, why
INTRA_PERIOD is being merged into GOP_SIZE cap.

> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c           |  2 +-
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c        | 16 ++++------------
>  drivers/media/platform/qcom/iris/iris_platform_common.h |  1 -
>  3 files changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 10e33b8a73f60759c4f1cb17b5c95897f0e1468f..391e1fc5f6e2ec8e9cf5ba4e0f76b2d1da3e2a35 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -1293,7 +1293,7 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
>  int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> -	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
> +	u32 gop_size = inst->fw_caps[cap_id].value;

Why? I think it was good as is.

>  	u32 b_frame = inst->fw_caps[B_FRAME].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	struct hfi_intra_period intra_period;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index ca1545d28b5310d8c45a905287dcb69f6184d9cc..eff9216bb50143c0d752051a6400605bbaf3803e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -171,7 +171,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.max = (1 << 16) - 1,
>  		.step_or_mask = 1,
>  		.value = 30,
> -		.set = iris_set_u32
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_intra_period,

This is the GOP_SIZE capability, so you will get it as cap_id.

>  	},
>  	{
>  		.cap_id = ENTROPY_MODE,

-- 
With best wishes
Dmitry

