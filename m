Return-Path: <linux-media+bounces-64069-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wWjPFLXWJWorMgIAu9opvQ
	(envelope-from <linux-media+bounces-64069-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:38:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAFE651837
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:38:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KEJWkKlb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W+As7Ku8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64069-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64069-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAD9C300FC5F
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 20:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4C032E757;
	Sun,  7 Jun 2026 20:37:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0515F31A807
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 20:37:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780864640; cv=none; b=VOUvTAKvLEiTfShcwmaofNV/KHGjh/7bUFesSDCDLJhAbYsfR5IjfijR4b5tDbbFMmEjhSFBgEEXxeFyu7z/6WpQXp7mxqbB8x+g1/V9ZWkesIoNpKbyqPQL9posnm2BxUshBu2ijmCAl4t3dxITLllJ7qdAsCrcO3HQyZb8nWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780864640; c=relaxed/simple;
	bh=0cGGJKGkk2JMo1lA0Fxg4aE7RX05+Ls4NDrlqzrqLnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMcewYud/LKWd3xVFk5P7F4TTPtca2NPu86OU3InIpjl6lH3eq/IfLwbed+XUD3tXAHuaUxeQPc52s3AVjrty9yaPDBkNxslztwNozzL57j5j6Vf+5AMhxEz2Pg+t9mxSnPrs1U8oYY/aGbRxv102TOB0wDdmzFMXgv0OMjTia4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEJWkKlb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+As7Ku8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657JM1t31437828
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 20:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DUnRWCAnDIUWTXaN6WB5sCQ1
	X0TmmEWbV8Gu3omt2O4=; b=KEJWkKlbI/srOkMYik6MREWScIqCi/EtkK/jr1Qk
	72oKH3zNGtbzyyCL2+A2Y8DuChsBU8whbN5uFjPMRV6zuwHf4HwqqO6uB4n6MVwg
	yIDyrcSeORUA9D+qCMaAdk+nlUPiG+18zg8QI4Q+eZFIF8znFlEnuVnTtIG6e9QG
	1w6R0aEXNLVDlpgzSbgImujQ2bPQb8HS5636zbJA0ygRwf/kdukBf3qdtD9q8H5V
	2E6tu9RBOLC9zms27BAn0mu/5GLDDGKsza1wz3m2PfKd7WcF9IYUrlC5i75kXgcO
	xevlH32PAzlQnHgoeJEWHjQM9BdgvTFMBHVOXDCBY1PaVQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4w1tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 20:37:17 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd65ab97aso5397734137.1
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 13:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780864637; x=1781469437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DUnRWCAnDIUWTXaN6WB5sCQ1X0TmmEWbV8Gu3omt2O4=;
        b=W+As7Ku8A2aX+qrXOEoSiYwz2DYRzTlW2RKt53i7DtrVwPGdwftELpWS53ciET7D4I
         Qmw4e0p4gBklQHHHmPGGo8mIblbzgd4I0o1JLJThvoYwBeWChsv3dHOX3NBkRCTO6bzC
         X+2zDMi1n68Qevf7HSSwWIdn8jPS5hJpAgIbTZwY5fhoThUSWAHEKf5Yn79G8IYl65TE
         or6Yl2ZG1LdzGyLALVXlRixNy8L+XgolnLO6FZNhgPNnh/TPnvQdaz+mPQ+mIIMyk0fW
         ui7Kxpg8xNSFa1Up5yxyJHbGZMS9J5ABvNi/+iJUGtof9S351oIKlstNKgpNF29V+lsw
         LXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780864637; x=1781469437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUnRWCAnDIUWTXaN6WB5sCQ1X0TmmEWbV8Gu3omt2O4=;
        b=FT9C6GPahEepwUiITvgeMDMjsNs5LUY1v/NgvQGMYXj+3jy1Z2HDPGN6OmjSE27Mxx
         ws2VRkkGIBfFJqwxiCL1VI1VaVLSF9siV8qgtcorrlnuWmDtUtgQjYYWDFCdb5tUTFrv
         xaI1JKadpdWrX9l3p7LhIdWyOQKCu8bAcvghwrIDmpuXP9FWja5dZcRFe9ZkOWX57H5Y
         lX495LtXvgfsnZmGl4RAbi6JVcP6+UZHkR3tZsPgRs4PNC3b4zqkzucsg2EVRLaVNLU/
         RiHbNdamJz/v2odKOkKlP84w9n3plKXfPe/rEtljtr2scpqKIy2YgWfLjg0629rkN69b
         6TCg==
X-Forwarded-Encrypted: i=1; AFNElJ9DVp9MP7AXs5fwg3AN9pNKRcRAHR/77RCGpoV3CSUWhQbQzEB8+NKI5wP3VyYhKLC3Dsus9qnNZ/TkKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylUjimOQw5QqbHlO7rnCHBbim1AtD6IMGzbzHj9o2fSQXihHv8
	mmNsIh8+lK2qnS5cCyvqJ+Xxa1JBqEsZ/nacshjF+Nb2IF1Ehpr1yikzMM0/yCliuBlADjrVAIv
	4viry5dcLbFdzqW54ylqYRPi8MZgiKPLl+Bmxy0VMkRwmOnoSQ7nydS1T5Vlhpz5TAA==
X-Gm-Gg: Acq92OECQitdwwVFsKGJtLg+D/AL0zBYs5gUSQSZMIc3v+tX0pX8Xh5qVIdzpvHC2bl
	tfYkF1BNNtqy/9P+icWVjOEV8+w9lrpPf9uTQNoeflNnbLCf7XhABba2vLwXJXtNQRxaw9nd64y
	3VbKiawaGHi0BDpNsxrvpZDW6EdvnIGCXwkHEFk0LYfF4bm16XSe8VGT2AFinGrY0POqVlh2OKk
	ImC3lVAHTUsbF0rQSslZAsKpNjlCqj/HqhNppYu1q5kGBwidRZANA7eoEy2wvQOQAl3ZATDG8Dv
	h8n4Sph3qABymZLWGCL7WJ/1DPL817rH/c7z5mjcoBo7ECFP9xJp9rrCeUl3qnIt9D/bppdmzgn
	ZIdZOs3cbDWf2cFzL82Edz6H/DrMFrB3W4m8eDszBJwz/x3CUW1N0hhieweakv8Apc1AXilxFdP
	V4kMSLlwSz0a0zUbMMoJBJ4zSv9hPNUTpYkYN+SB6wvYLzXg==
X-Received: by 2002:a05:6102:5127:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-6fef8531f7cmr6123452137.17.1780864637395;
        Sun, 07 Jun 2026 13:37:17 -0700 (PDT)
X-Received: by 2002:a05:6102:5127:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-6fef8531f7cmr6123449137.17.1780864637022;
        Sun, 07 Jun 2026 13:37:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9868afsm3330768e87.59.2026.06.07.13.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:37:15 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:37:11 +0300
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
Subject: Re: [PATCH v2 2/2] media: qcom: iris: Add request key frame support
 for encoder
Message-ID: <io3zcir73kgl7fglv5ryaayy6jdozbifodia2bkatecinxrmeh@5cb7e3lrflr3>
References: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
 <20260604-dynamic_encode-v2-2-6e97df032482@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-dynamic_encode-v2-2-6e97df032482@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TT1ZUsO3YOZwgqOpMoSEZSbawzX_NAvM
X-Proofpoint-GUID: TT1ZUsO3YOZwgqOpMoSEZSbawzX_NAvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwNSBTYWx0ZWRfX+ybkCnuN35Jj
 70Beg/Szn9iCbN4+uiChHGTJrJzdoCsbKKLES3dX+XpyA1lmhoRwIGze7EXmchi+olAjXpQA3uI
 un0o1BSwXmtXeo21X1QhMX+nBz8f+U6g6R0H7YLL6qq31QzDVHfK1K0v+IgJ2VqZ7CsOli6lz64
 o/l+neLfT/DfJxpIe14e6PFuB/cf7ZnKawr46vUSwh9/INC3cDQhe4YmY2lbYUiE6yig+4QC5uM
 FPbRU6OfbBt40IooqUykXBkIM1zpcM03t6/8Q6JQcdw4dwuP42bBY6sK308w1SGNFQZOuuGoqoT
 vXtNHYnrYmAu+Kz61kPs8wtFFbATOmOm2WLm7odw4WGploxErWVoJgbf5douqhEd0ZfU58ZWwqF
 LQz4jI2Sl4wzmGuoFWZx19E6JhsNBMVXhEys36tqw5NOBkQ+fNrUAfwRq6lwqXVcwn/8XiVSNiS
 hrp6X/010DEldGanSTw==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a25d67d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=sDdIUKycxF9-MKv0SpgA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64069-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,5cb7e3lrflr3:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:wangao.wang@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: ADAFE651837

On Thu, Jun 04, 2026 at 04:00:39PM +0800, Wangao Wang wrote:
> Add request key frame support for both gen1 and gen2 encoders by enabling
> 
> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 22 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 10 ++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 +++++++
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  8 files changed, 56 insertions(+), 1 deletion(-)
> 
> @@ -1477,6 +1481,24 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
>  					     &bitrate, sizeof(u32));
>  }
>  
> +int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_val = 0;
> +
> +	if (inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value)
> +		hfi_val = HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR;
> +	else
> +		hfi_val = HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32_ENUM,
> +					     &hfi_val, sizeof(u32));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 3c462ec9190be8935176b290588f224fe4f144a4..8d8bbef960076c08e5af0f65920dde187f24a313 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
>  int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index eff9216bb50143c0d752051a6400605bbaf3803e..04c78417dbae33dff1cc7099e6f105caa606048e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -375,6 +375,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  			CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_bitrate_gen1,
>  	},
> +	{
> +		.cap_id = REQUEST_SYNC_FRAME,
> +		.min = 0,
> +		.max = 0,
> +		.step_or_mask = 0,
> +		.value = 0,

How does it work if min = max = 0?

> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_req_sync_frame,
> +	},
>  };
>  

-- 
With best wishes
Dmitry

