Return-Path: <linux-media+bounces-51331-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDuMEdnxcWmvZwAAu9opvQ
	(envelope-from <linux-media+bounces-51331-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:46:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8636164BED
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CBD3F5AB42C
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 09:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDB935294E;
	Thu, 22 Jan 2026 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnHd9bJB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="La1MZVFq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0A1261B92
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074737; cv=none; b=qwtJf41C8nQwv7hMlCI+OoU97iR8K4IjkxTT6/QspQLffJis5WWN12Sobx7b9qBGnVVQmfCnzr3kmJEgVukERLF07QzH0vPs+OXFeqfx01w5tBVrEL3lfmAaG7/pcWj7rVgnh/a76ocHixaum966lENl4DCh9bLrU/1kiWGMVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074737; c=relaxed/simple;
	bh=HquS72/jFwucgqF060xLKnjqOqFDSPXzaOPKsv/8ZUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6I6x8unN6voGb2mk3IAqRyROdUZEjI/pP+Y0YUepWTFjEj3Q9eYmdvh89Ge5E4taDZYBE74o4RPVhGpI4o+ggGZiHWtfRROHyMyEBLlOWLhbFK/CBozlfasg58YYxHFjXXlsJAcz1s8KfYNPvBHi8hklbqHF52PRl7CzFvJa3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnHd9bJB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=La1MZVFq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M8Ww0C4057906
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CQTVG4E9/RDbgAaBCy7u6PVeDWy91kaHmtzhssgkJk=; b=gnHd9bJBBmzB5QU+
	/DCBj9LN26hI+SaPEUBQw+T5uaCGY44A+HxG+f2EaooM61YwOjN9s+lUeWJXDAga
	KPkxt96qSZ3ulMsssmwk+jTKUIp9gzXHHKF9RcZ9ZSVJm8FgmW5lwHBQdpr+Ullk
	irPjeTnXL9gfNYgJrGDfrQZuQ6Letpn0L+1amG9UR8xgx/2PdoTl5PjDKLWQx4iT
	CfTPLlUefbIvKNn2k8bz+HNPJhFwFDIRaNZwx0cN8F3dGnuj0zAP/UinziatT+TT
	D32aNgkwu6QPr78TEoGk5rkNO6iEcxrM3SOXddoWzazdWMmRHJv/0dw+ZgHcm5KO
	EhU15g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbsrkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:38:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a784b2234dso18781875ad.1
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 01:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769074731; x=1769679531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CQTVG4E9/RDbgAaBCy7u6PVeDWy91kaHmtzhssgkJk=;
        b=La1MZVFqA/dgmXjDuuJEU0e7m9YzEm/+XvmSXVER2QYmBVJiNKwlajSUsEDJ7waEUL
         L13rUxr1LE80V1gEe0A24MpPX06ScCzjdAhEUsMtxUgqEqCvSJ6qVzbyXq2b/E7IgCEI
         m928D0Gq6/y88/glbl8bjq9s1eCrtT2Ml9WKbVOVBs29KHXl7qWn/zVAiesuGim3zcWF
         iLbnXq8/9QpLoZJ5qFJHi845nMkVKkNlcqT6yMQu+UT2qeKb6CGziK9DjG8rj5svKCOS
         awV3PT1azHe2d6hvQxu76YG3UBC9Ver1Ao7yoqc9iyNUQX+chrhv8rbYnXKXh0vtG4q8
         37sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074731; x=1769679531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CQTVG4E9/RDbgAaBCy7u6PVeDWy91kaHmtzhssgkJk=;
        b=iczDzEAwmWvVTWGy3HA7DpaTF36Mw2Gbj6KPpZasMSGRIEZ0sdKtBuZqOzISOTitNF
         h/AarLLi6W+Lv3mBigPa3otLbZ/Etf7zjqUfRXcarD60r/4CzEr1DJMT9QTDF8VAosoS
         PsoPSv/O8rQMmwT0+wHUJUqFtryc4k/G0RNPE8gX2RT2XQMlJLuvspmKMvoysJSB+6EO
         +deBT3O4TvdvQH3ftK6M2gyVB8Tbs+PN//VGi+0GY43i0/LpQsOYJnK3Zy+UWHPItu2q
         7rTSd6f80Rv19QL2UXUJHw6r/7DCHY02jcRf/iBAB1pluWYpRfQ3mnpd+uOuBp7ulVO9
         5+sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsuCQ346toBOW3Gg/DLWHm0nx2R6flr5LIIHJVFZwRfuRs+DYavV+QP7Z+lvp073lhziFONQJxmUXX0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+oc8k7oJTfEeNsdukr1LC+q/Pcqm+WHjEIB1tzr1ZhadYioTK
	axtxureSjXq7911ta0XvI4EDqxOPmfxX6UNJaa2TYzj38f2SugS+EXOzwcF38ByeFSlQjHz6hOD
	dn0kQI3Ai1subbYivv6+kMdfGQz3HzHJSB4FjEVwf7d9HOr9wLx3BBPVgalrbMDzX8Q==
X-Gm-Gg: AZuq6aJ+c5tmYiKOyp+JgZTytWLJzOJg9Tr0zUzJVXVjshCxL9BrmNOmnRLvf6lbc1w
	Z47DgaLDBYYnEyKVwKgMOmcLRIaAUYCf5JamhrSFMKkanjiHplHii9lwHxCsek735bqN8E7orE5
	BR4EFxw+4SlaWo54TgmbzY+PZxY4gV/r5Ycr02r84H/E0PjabgqsuGtIk4GTjEeA3vkDeZSaCXj
	ySNcb5PmUNszDBjdh80DaJeidqShil91LVF7AntMjvFUXtkOROlnQw1TQ0CAZdMD2iMcFAZcild
	FJ6HT2u5c9aUQzj29IRmx1RPc/+FP1yM0RmrORv37Ko6wYxF4WvXq7B5O991CvhvneyvvKmC/lv
	k/Upzsf1VBJs+dOPnE/3EpcOgC0/KpPkXVLsBdtf11Q==
X-Received: by 2002:a17:903:2448:b0:295:592f:94a3 with SMTP id d9443c01a7336-2a76b067a21mr76267245ad.48.1769074730663;
        Thu, 22 Jan 2026 01:38:50 -0800 (PST)
X-Received: by 2002:a17:903:2448:b0:295:592f:94a3 with SMTP id d9443c01a7336-2a76b067a21mr76267015ad.48.1769074730022;
        Thu, 22 Jan 2026 01:38:50 -0800 (PST)
Received: from [10.0.0.3] ([106.222.230.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce4dfsm175446865ad.29.2026.01.22.01.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 01:38:49 -0800 (PST)
Message-ID: <e4afc72c-ed44-c516-a44f-4f727da86248@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 15:08:45 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/6] media: qcom: iris: Add hierarchical coding support
 for encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <20260109-batch2_iris_encoder_enhancements-v3-4-196855ef32ba@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-4-196855ef32ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -T_YVV0lgTBWB9A4VZka4m3rBr514S4A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2NiBTYWx0ZWRfX+ZcnxkIhJ6fF
 7Pqip0o+69eTBqweikYignCyIfacmiNj4hN1h/nFdPBkzN8CTBCizDR/4h9XgyRMuUhl+Lv/ke8
 f9JHgHMbBTNV4nvjmZIaeLPWKILFjS8GBJJtY8W/m57P56GWOpjWq5xln6oYBGD3YhzwQEXW/On
 75O53mHj7pSk+xHDnDf/HgherwIJyTmRhqgRk/xmXZT77YVUqDyHKRP5Y0DzkEy5fonlc3afIHe
 uMkVXykgWejHgX8IrRyArab/FxhWiTYtXxSoy/ImwPkVkwnEyFxfy4aFMPgQMm+J26svtnK1uMu
 eyRmTGqmlctUV+vjmtVDYmL3+8mYhHYZMH/FnsWFxocenWSFPwc/xLiOvw0GILB+mmNEQLESfgP
 jfuQlvQ3xTaUkzgNx4vNc9bf7hrg6/UZSHgFZ80a0k85GkU939jGST9Xt2xxpNsclMv/Yf4y2UO
 XCnAxe6vHzUYRaU09xA==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=6971f02d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=UD/l5MNMsL2kxzD4rLSz0A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=xc4UoQ3RFG4-6lN0HOoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: -T_YVV0lgTBWB9A4VZka4m3rBr514S4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51331-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8636164BED
X-Rspamd-Action: no action



On 1/9/2026 1:12 PM, Wangao Wang wrote:
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
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 279 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   7 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  21 +-
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   2 +
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  15 ++
>  drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
>  .../platform/qcom/iris/iris_platform_common.h      |  23 ++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  94 ++++++-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 182 +++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  28 +++
>  10 files changed, 647 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 02106a4c47db7a8b2e6461acb9d24a22291ff3cb..8d04eb0b52219f5ae609fc976e51f2fb04000a85 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -116,6 +116,40 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return MARK_LTR;
>  	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
>  		return B_FRAME;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
> +		return LAYER_ENABLE;

Will the same control be used for HEVC as well? I think this is applicable
for only H264 encoders.

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
> @@ -221,6 +255,40 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
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
> @@ -567,7 +635,60 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
>  				     &hfi_val, sizeof(u32));
>  }
>  
> -int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +int iris_set_bitrate_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
> +	u32 bitrate = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_bitrate hfi_val;
> +	u32 max_bitrate;
> +
> +	if (!(inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) && cap_id != BITRATE)
> +		return -EINVAL;

Can you pls explain what is this check for?

> +
> +	if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		max_bitrate = CABAC_MAX_BITRATE;
> +
> +	if (entropy_mode == V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC)
> +		max_bitrate = CABAC_MAX_BITRATE;
> +	else
> +		max_bitrate = CAVLC_MAX_BITRATE;
> +
> +	hfi_val.bitrate = min(bitrate, max_bitrate);
> +
> +	switch (cap_id) {
> +	case BITRATE:
> +	case LAYER0_BITRATE_H264:
> +		hfi_val.layer_id = 0;
> +		break;
> +	case LAYER1_BITRATE_H264:
> +		hfi_val.layer_id = 1;
> +		break;
> +	case LAYER2_BITRATE_H264:
> +		hfi_val.layer_id = 2;
> +		break;
> +	case LAYER3_BITRATE_H264:
> +		hfi_val.layer_id = 3;
> +		break;
> +	case LAYER4_BITRATE_H264:
> +		hfi_val.layer_id = 4;
> +		break;
> +	case LAYER5_BITRATE_H264:
> +		hfi_val.layer_id = 5;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

The layer bitrate should only be set if layer encoding is enabled, isn't it?

> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &hfi_val, sizeof(hfi_val));
> +}
> +
> +int iris_set_bitrate_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>  	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
> @@ -1183,6 +1304,162 @@ int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type
>  					     &intra_period, sizeof(intra_period));
>  }
>  
> +int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 layer_enable = inst->fw_caps[LAYER_ENABLE].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 layer_type;
> +
> +	if (inst->hfi_rc_type == HFI_RATE_CONTROL_CQ ||
> +	    inst->hfi_rc_type == HFI_RATE_CONTROL_OFF)
> +		return -EINVAL;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264) {
> +		if (!layer_enable || !inst->fw_caps[LAYER_COUNT_H264].value)
> +			return -EINVAL;
> +
> +		if (inst->fw_caps[LAYER_TYPE_H264].value ==
> +			V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P) {
> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
> +				layer_type = HFI_HIER_P_HYBRID_LTR;
> +			else
> +				layer_type = HFI_HIER_P_SLIDING_WINDOW;
> +		} else if (inst->fw_caps[LAYER_TYPE_HEVC].value ==
> +			V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) {

why are you checking HEVC layer type for H264 codec? seems like a bug.

> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
> +				layer_type = HFI_HIER_B;
> +			else
> +				return -EINVAL;
> +		} else {
> +			return -EINVAL;
> +		}
> +	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +		if (!inst->fw_caps[LAYER_COUNT_HEVC].value)
> +			return -EINVAL;
> +
> +		if (inst->fw_caps[LAYER_TYPE_HEVC].value ==
> +			V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P) {
> +			layer_type = HFI_HIER_P_SLIDING_WINDOW;
> +		} else if (inst->fw_caps[LAYER_TYPE_HEVC].value ==
> +			V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) {
> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
> +				layer_type = HFI_HIER_B;
> +			else
> +				return -EINVAL;
> +		} else {
> +			return -EINVAL;
> +		}
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	inst->hfi_layer_type = layer_type;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32_ENUM,
> +					     &layer_type, sizeof(u32));
> +}
> +
> +int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 layer_enable = inst->fw_caps[LAYER_ENABLE].value;
> +	u32 layer_count = inst->fw_caps[cap_id].value;
> +	u32 hfi_id, ret;
> +
> +	if (!layer_enable || !layer_count)
> +		return -EINVAL;
> +
> +	inst->hfi_layer_count = layer_count;
> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq)) {
> +		hfi_id = HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER;

why the streaming check? and what's the significance of this setting? why
this prop is set under streaming check?

> +		ret = hfi_ops->session_set_property(inst, hfi_id,
> +						    HFI_HOST_FLAGS_NONE,
> +						    iris_get_port_info(inst, cap_id),
> +						    HFI_PAYLOAD_U32,
> +						    &layer_count, sizeof(u32));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &layer_count, sizeof(u32));
> +}
> +
> +int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 layer_type = inst->hfi_layer_type;
> +	u32 layer_count, layer_count_max;
> +
> +	layer_count = (inst->codec == V4L2_PIX_FMT_H264) ?
> +		inst->fw_caps[LAYER_COUNT_H264].value :
> +		inst->fw_caps[LAYER_COUNT_HEVC].value;
> +
> +	if (!layer_count)
> +		return -EINVAL;
> +
> +	if (layer_type == HFI_HIER_B) {
> +		layer_count_max = MAX_LAYER_HB;
> +	} else if (layer_type == HFI_HIER_P_HYBRID_LTR) {
> +		layer_count_max = MAX_AVC_LAYER_HP_HYBRID_LTR;
> +	} else if (layer_type == HFI_HIER_P_SLIDING_WINDOW) {
> +		if (inst->codec == V4L2_PIX_FMT_H264) {
> +			layer_count_max = MAX_AVC_LAYER_HP_SLIDING_WINDOW;
> +		} else {
> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
> +				layer_count_max = MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW;
> +			else
> +				layer_count_max = MAX_HEVC_LAYER_HP_SLIDING_WINDOW;
> +		}
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	if (layer_count > layer_count_max)
> +		layer_count = layer_count_max;
> +
> +	layer_count += 1; /* base layer */ 
> +	inst->hfi_layer_count = layer_count;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &layer_count, sizeof(u32));
> +}
> +
> +int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 bitrate = inst->fw_caps[cap_id].value;
> +
> +	/* ignore layer bitrate when total bitrate is set */
> +	if (inst->fw_caps[BITRATE].flags & CAP_FLAG_CLIENT_SET)
> +		return 0;
> +

any streaming check required here?

> +	if (!(inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET))
> +		return -EINVAL;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &bitrate, sizeof(u32));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 609258c81517b71523b682ca994786cdd020b07f..3c462ec9190be8935176b290588f224fe4f144a4 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -22,7 +22,8 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> -int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_bitrate_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_bitrate_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> @@ -42,6 +43,10 @@ int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>  int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index fe51eccb903be146e83a4fb2faf4b4092875dea4..5d7d7856b35f4175225256c2aed619527aa5f2e8 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -602,11 +602,10 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>  		break;
>  	}
>  	case HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE: {
> -		struct hfi_bitrate *brate = prop_data;
> -		u32 *in = pdata;
> +		struct hfi_bitrate *in = pdata, *brate = prop_data;
>  
> -		brate->bitrate = *in;
> -		brate->layer_id = 0;
> +		brate->bitrate = in->bitrate;
> +		brate->layer_id = in->layer_id;
>  		packet->shdr.hdr.size += sizeof(u32) + sizeof(*brate);
>  		break;
>  	}
> @@ -726,6 +725,20 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>  		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
>  		break;
>  	}
> +	case HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER: {
> +		u32 *in = pdata;
> +
> +		packet->data[1] = *in;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
> +		break;
> +	}
> +	case HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER: {
> +		u32 *in = pdata;
> +
> +		packet->data[1] = *in;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
> +		break;
> +	}
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 4343661e86065f5623b2c02c7ee808a3c47a8c41..0e4dee19238464a9671a94eaab8eeda2d7f7ca9f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -154,11 +154,13 @@
>  
>  #define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
>  #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
> +#define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
>  #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
>  #define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
>  #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
>  #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
>  #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
> +#define HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER		0x200600b
>  
>  struct hfi_pkt_hdr {
>  	u32 size;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 2b8c87c25a066ead30bb1b134bdc3fe1e84e8f05..558ad8ee76d7fb0a79b13dd327beb414b3609d3e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -74,7 +74,22 @@ enum hfi_rate_control {
>  #define HFI_PROP_LTR_COUNT			0x03000134
>  #define HFI_PROP_LTR_MARK			0x03000135
>  #define HFI_PROP_LTR_USE			0x03000136
> +
> +enum hfi_layer_encoding_type {
> +	HFI_HIER_P_SLIDING_WINDOW	= 0x1,
> +	HFI_HIER_P_HYBRID_LTR		= 0x2,
> +	HFI_HIER_B			= 0x3,
> +};
> +
> +#define HFI_PROP_LAYER_ENCODING_TYPE		0x03000138
> +#define HFI_PROP_LAYER_COUNT			0x03000139
>  #define HFI_PROP_TOTAL_BITRATE			0x0300013b
> +#define HFI_PROP_BITRATE_LAYER1			0x0300013c
> +#define HFI_PROP_BITRATE_LAYER2			0x0300013d
> +#define HFI_PROP_BITRATE_LAYER3			0x0300013e
> +#define HFI_PROP_BITRATE_LAYER4			0x0300013f
> +#define HFI_PROP_BITRATE_LAYER5			0x03000140
> +#define HFI_PROP_BITRATE_LAYER6			0x03000141
>  #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
>  #define HFI_PROP_MAX_B_FRAMES			0x03000147
>  #define HFI_PROP_QUALITY_MODE			0x03000148
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 0a0d4ace0bb6bee6ab11bd47fddb27432cd524f7..f4aa904f94ebb3c87bcdeeb6c3732b616d030b96 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -73,6 +73,8 @@ struct iris_fmt {
>   * @enc_raw_height: source image height for encoder instance
>   * @enc_scale_width: scale width for encoder instance
>   * @enc_scale_height: scale height for encoder instance
> + * @hfi_layer_type: hierarchical coding layer type
> + * @hfi_layer_count: hierarchical coding layer count
>   */
>  
>  struct iris_inst {
> @@ -115,6 +117,8 @@ struct iris_inst {
>  	u32				enc_raw_height;
>  	u32				enc_scale_width;
>  	u32				enc_scale_height;
> +	u32				hfi_layer_type;
> +	u32				hfi_layer_count;
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 34deb32eb5be0899fee779ff99b3f4b8bd91529f..4b98c209fda49bba6caa84b839809062e713fe5a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -32,6 +32,12 @@ struct iris_inst;
>  #define INVALID_DEFAULT_MARK_OR_USE_LTR		-1
>  #define MAX_LTR_FRAME_COUNT_GEN1		4
>  #define MAX_LTR_FRAME_COUNT_GEN2		2
> +#define MAX_LAYER_HB				3
> +#define MAX_AVC_LAYER_HP_HYBRID_LTR		5
> +#define MAX_AVC_LAYER_HP_SLIDING_WINDOW		3
> +#define MAX_HEVC_LAYER_HP_SLIDING_WINDOW	3
> +#define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
> +#define MAX_HIER_CODING_LAYER_GEN1		6
>  
>  enum stage_type {
>  	STAGE_1 = 1,
> @@ -156,6 +162,23 @@ enum platform_inst_fw_cap_type {
>  	MARK_LTR,
>  	B_FRAME,
>  	INTRA_PERIOD,
> +	LAYER_ENABLE,
> +	LAYER_TYPE_H264,
> +	LAYER_TYPE_HEVC,
> +	LAYER_COUNT_H264,
> +	LAYER_COUNT_HEVC,
> +	LAYER0_BITRATE_H264,
> +	LAYER1_BITRATE_H264,
> +	LAYER2_BITRATE_H264,
> +	LAYER3_BITRATE_H264,
> +	LAYER4_BITRATE_H264,
> +	LAYER5_BITRATE_H264,
> +	LAYER0_BITRATE_HEVC,
> +	LAYER1_BITRATE_HEVC,
> +	LAYER2_BITRATE_HEVC,
> +	LAYER3_BITRATE_HEVC,
> +	LAYER4_BITRATE_HEVC,
> +	LAYER5_BITRATE_HEVC,
>  	INST_FW_CAP_MAX,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index 14bb72c223dd86a0bd22d863df73159169871031..e50b6322912c4f09f09772ccac2fa505f9dd2b5c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -142,7 +142,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
>  			CAP_FLAG_DYNAMIC_ALLOWED,
> -		.set = iris_set_bitrate,
> +		.set = iris_set_bitrate_gen1,
>  	},
>  	{
>  		.cap_id = BITRATE_MODE,
> @@ -297,6 +297,98 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT,
>  		.set = iris_set_intra_period,
>  	},
> +	{
> +		.cap_id = LAYER_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = LAYER_TYPE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.max = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
> +		.value = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = LAYER_COUNT_H264,
> +		.min = 0,
> +		.max = MAX_HIER_CODING_LAYER_GEN1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_layer_count_gen1,
> +	},
> +	{
> +		.cap_id = LAYER0_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
> +	{
> +		.cap_id = LAYER1_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
> +	{
> +		.cap_id = LAYER2_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
> +	{
> +		.cap_id = LAYER3_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
> +	{
> +		.cap_id = LAYER4_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
> +	{
> +		.cap_id = LAYER5_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_sm8250 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 7c9a71755685d195a7adc8064523e1c33a572089..5ffc9ff75f7f7110867ad133a6006b543aea057b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -313,7 +313,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.hfi_id = HFI_PROP_TOTAL_BITRATE,
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
>  			CAP_FLAG_DYNAMIC_ALLOWED,
> -		.set = iris_set_bitrate,
> +		.set = iris_set_bitrate_gen2,
>  	},
>  	{
>  		.cap_id = BITRATE_PEAK,
> @@ -677,6 +677,186 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT,
>  		.set = iris_set_u32,
>  	},
> +	{
> +		.cap_id = LAYER_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = LAYER_TYPE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B,
> +		.max = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B) |
> +				BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
> +		.value = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = LAYER_TYPE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
> +		.max = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P),
> +		.value = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
> +		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_layer_type,

layer type depends on layer count so shouldn't you have layer count before
layer type in caps? or handle both in same set API?

> +	},
> +	{
> +		.cap_id = LAYER_COUNT_H264,
> +		.min = 0,
> +		.max = 5,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_LAYER_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +	},
> +	{
> +		.cap_id = LAYER_COUNT_HEVC,
> +		.min = 0,
> +		.max = 5,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_LAYER_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_count_gen2,
> +	},
> +	{
> +		.cap_id = LAYER0_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER1,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER1_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER2,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER2_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER3,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER3_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER4,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER4_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER5,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER5_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER6,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER0_BITRATE_HEVC,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER1,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER1_BITRATE_HEVC,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER2,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER2_BITRATE_HEVC,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER3,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER3_BITRATE_HEVC,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER4,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER4_BITRATE_HEVC,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER5,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER5_BITRATE_HEVC,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER5,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	}
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_sm8550 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index b5fb616916e5c7bf46998fc14510af9c9341cf10..c962042518fceb0f82a48956df01c8f3cd26df99 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -670,6 +670,8 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
>  
>  static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
>  {
> +	u32 layer_count = inst->hfi_layer_count;
> +	u32 layer_type = inst->hfi_layer_type;
>  	u32 bframe_count, ltr_count;
>  	u32 num_ref = 1;
>  
> @@ -679,9 +681,35 @@ static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
>  	if (bframe_count)
>  		num_ref = 2;
>  
> +	/* The shift operation here is rounding logic, similar to [(x+1)/2]. */
> +	if (layer_type == HFI_HIER_P_HYBRID_LTR)
> +		num_ref = (layer_count + 1) >> 1;
> +
> +	if (layer_type == HFI_HIER_P_SLIDING_WINDOW) {
> +		if (inst->codec == V4L2_PIX_FMT_HEVC)
> +			num_ref = (layer_count + 1) >> 1;
> +		else if (inst->codec == V4L2_PIX_FMT_H264 && layer_count < 4)
> +			num_ref = (layer_count - 1);
> +		else
> +			num_ref = layer_count;
> +	}
> +
>  	if (ltr_count)
>  		num_ref = num_ref + ltr_count;
>  
> +	/*
> +	 * The expression (1 << layers - 2) + 1 accounts for the number of reference
> +	 * frames in the Adaptive Hierarchical B-frame encoding case. In this scheme,
> +	 * the number of frames in a sub-GOP is related to (2^(number of layers) - 1),
> +	 * hence the use of the shift operation.
> +	 */
> +	if (layer_type == HFI_HIER_B) {
> +		if (inst->codec == V4L2_PIX_FMT_HEVC)
> +			num_ref	= layer_count;
> +		else
> +			num_ref = (1 << (layer_count - 2)) + 1;
> +	}

were you able to test these different scenarios?

Thanks,
Dikshita
> +
>  	return num_ref;
>  }
>  
> 

