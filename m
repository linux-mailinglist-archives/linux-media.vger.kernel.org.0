Return-Path: <linux-media+bounces-61398-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEUZKQNaBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61398-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:01:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9916B531D28
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C89730B66D9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04703E5A30;
	Wed, 13 May 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7fCw9YI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BaFHqlEl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C3C3E5ECA
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669813; cv=none; b=d1mnfazyvTJxhxIJ7JkEzxZ2yw5nsB54eDvKm6bMhwmzufW1irXkJQIpSqo3eL/RTjLKq6Jh4Z4r9/eiQ7Em36m9MCpe/0tex77WyIeyTTQa7U8GEgd4dAEBBeNihLV2RWW0RTn+NF89rwy567YCKiUUmiMuSRJ6iTh51iPs1M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669813; c=relaxed/simple;
	bh=FWg9shk/loZIbWJ8J59lPWaJJEPfX/RRI6qRMtnRguo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6xG4U8FbfxHPAkA75J5V1T8plWkrJhx+NUxZMhti6RR+J/MPGcu9oJGagZPHXU+Yiaey0pAv1uPL+wAjFOzfUyKP8ASF8Pd/DbcL8Sx+hSq2AvBCHxBATiVHPwyMuERENhFgszJU2I4sOHHbtV4B8uBMgXiARksK9PQ6kc+Kw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7fCw9YI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BaFHqlEl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8woGZ4159625
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vog3EMZOwyDCb+tYGlc1v9/k
	rug/ByyrMxrv8nuhmd8=; b=M7fCw9YIl5dPiZdqz239m1KNpi0gTUqSi451PZPB
	0ruEXK+gfBDeV9Gzl0nmt0ydxJ5j4rhFO16kTATby3zwmQYZhK4Nun6Y1OSuGapu
	+YHiuoZoZzKi6ejED28NfCoBGgnmSXhPoCnNRl4WuqeunGKrXAqlTM/e83MX7rwq
	h+6zgOjZG/psAXMB1F+Ji13HEIfdHl3T3D12v/kx1dIzDGZiTyZ0GtRX49OaCOLG
	U4K1qGFHqAUSmzWHHKSvhn2e3QCSNLVBebGQ9+DMvAtfJN+G/g+y1NEnnSAFR1W6
	M4/MuHSGiLzN6ipIZgDKclumUM+MtMRr36HPEmxthuqHWA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91re51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:56:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514ae0edeb6so91899501cf.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 03:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778669809; x=1779274609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vog3EMZOwyDCb+tYGlc1v9/krug/ByyrMxrv8nuhmd8=;
        b=BaFHqlElSMtek5TfV1L18qsu6VxTJF5hm5Qqmm5KYC74cWmk/Sm5IpEnr+2mlWCSeU
         65AQTbLGMXoqHJP/UPpa+mfls8GMCHknkCNUzyBNLR6rBL4jTKh2/VCcyErvhZHMkVYY
         7VZb2mIJeqZ5gjKLcrs84/AtUDiWrmKTRZrO8zL02S5mNr04SW2VDnITzO0wsx1HK6wY
         C/OiHcx1jf2HyQgL6EcW1L3qf4mtD2ZaVYgKVWWKIMLXNrL3nh43Mh7IAYRqbflENOoL
         GJhpHEiC1Uc0DrkjEisJezgbuMyoKWI4VHCPbrHmEiXtzvcyDi2p1B5GIKEbRSgP2UGs
         tgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669809; x=1779274609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vog3EMZOwyDCb+tYGlc1v9/krug/ByyrMxrv8nuhmd8=;
        b=tPN2JXXGyxvSSTXNeIwpUqbMDDV9R/P9hqj9OQO8PhkdxuV2c79c87FySNjqWPLWq3
         sx1Hyj0fMKheejMyC9YFaOfQt0uSCRV8It4YtprQq4Nne39YMB3p1KL5B2U4O9JlmvUt
         SMbb4nh8xiXLutbphrIMAMDQ816CUHiLl9BgzVLP/C71rO5qcwb1nghpVRUmUxR8EdLI
         wpvp7qlIqceAWrU9bAfV0T8Fcg3gsY8RLV8jy6HKCO7J6AH6EcBN0PUThw5HD1f5mWdx
         9eeT5nJKSOzTEHvbjk2IYtDfqK+GogqQ9rc5CbSgxY/r/csoKyn7HVBxEfvwGHQggw3H
         xMwg==
X-Forwarded-Encrypted: i=1; AFNElJ8NPUtA5OOe89pv+MN4c8zWio6ZBKt5f9G8rK2f4uXhi6eTpRzG5ZRReIbKNQs/ewN56ZiiD1XozV0YGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaLS+BQTbKk60ydmGQeSt6Kmpd2lIyRP3J/PcR8CSqhCwcUbrP
	JQEaS91yRp1YNYCi3tZgEd40sSfqxm0zUy5mD7ApWu/I4yMNrEpGYWClY8KA5zPuoUBWPsra47g
	zUbmaFztf5J3lTg7EX8f2K7HoyLZ3HfVAKXK5hQFij6vTc9I4JiWN6fV5CC4wO3xD1g==
X-Gm-Gg: Acq92OHL8RphL1hkf8EKxRSPOdKmSf51uU1FvgZ8RNpDUoeCPEflztcunavndGOijLj
	2i0RAI9JKrnIHShsc8t6PxIVxrmrd142sLt+ICcNOcbYCCHUvRVYJG19in0lU2NEXg0C5MqBnOk
	silUeGDSxpN4q+TkeAqJyIz+FdG8DiAg+8NZ4OCVBwmmjDRLxzK+Co4hONDGQxIEc1XnMBdyqMa
	CcF0vFlpVltxqyqFpR5vqphgkTwt4kAnkKvehdqUwXA7x1Wypc6dLkgeFLFS4QzEfaXJMqrnYKX
	levYapeV92xrt3XB7dy1U92fD3Tn3dRGvHdFJ+dE/f5MHMoExo4Zx6+YdEClYO8sf+68Fnl87EK
	NVEBsRLjCEilpT5Cu9bfH24YmEv1w9k0n7R0jamLAw/jVVj2YmFE+FwVp8n5xAOnwzASXNL1BKX
	3r4GKEJcazYPmWI6txc9N5g+1RrazZCFKhqVQ=
X-Received: by 2002:a05:622a:2d5:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-514cf00b505mr95728111cf.31.1778669808974;
        Wed, 13 May 2026 03:56:48 -0700 (PDT)
X-Received: by 2002:a05:622a:2d5:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-514cf00b505mr95727851cf.31.1778669808539;
        Wed, 13 May 2026 03:56:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm39203141fa.18.2026.05.13.03.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:56:47 -0700 (PDT)
Date: Wed, 13 May 2026 13:56:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 2/6] media: qcom: iris: Add Long-Term Reference
 support for encoder
Message-ID: <hhmz7gci2o2bbbnsul5aj6oxxtvvzxfuxcifqvg46unl3q5ckm@gxlysjc5y7q5>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-2-4954e3b4df84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-batch2_features-v7-2-4954e3b4df84@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: U-dtkhNBOGvXP4XyODaahV0dN3g4WlxG
X-Proofpoint-GUID: U-dtkhNBOGvXP4XyODaahV0dN3g4WlxG
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a0458f2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=lV_me84f7PoditwAtxwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNSBTYWx0ZWRfX5B38ugPpf1FZ
 Qv5lY5Dc1ICzZcH8zjO1A32FuDQKmLMCWwdYejFx6DqqorM2HBhcXtaQ8dXCvYIpN5Xb1Q63yEl
 M9humc2aJDpEmZWAKXFXK+IF6HzSNT7ibSGbHZEYKpK+lVSro51qdpWhHK5agoKmq9zlC0R/X80
 bFdI+MzzUbIufotUuBx/tL3X6gU6hILeMfEItCagRL2jDh2orYxf00YwBjoJkakeG9WWXy6eEWx
 4aEvOZxMq12FOPASXYu5ljQQIupIrmcGhsl8KU8Ow/82B6FFDA/pWSiRSJ8jNMAKKF9CTJ/u+jp
 ujYWGu86MccjI75xmpJzH0oiciQSe5NfncYSbt32HTOM/b+Yqy4s71w9f7myrJ6ssNQfrMJuHP0
 /b8XVQC2AubQWMo2SccAOQWGLzEPZ6dlQ9fh7+UoHnX3hXHHXYtjEHK3knevlHz1F+FntMB8bw8
 3BqOeb+RIOW7T1bEKGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130115
X-Rspamd-Queue-Id: 9916B531D28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61398-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:55:11PM +0800, Wangao Wang wrote:
> Add Long-Term Reference(LTR) frame support for both gen1 and gen2
> encoders by enabling the following V4L2 controls:
> V4L2_CID_MPEG_VIDEO_LTR_COUNT
> V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
> V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 128 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   5 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   |  30 +++++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  25 ++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 ++++
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  30 +++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  20 +++-
>  9 files changed, 267 insertions(+), 4 deletions(-)
> 
> +
> +int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
> +	u32 hfi_val = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
> +		return -EINVAL;
> +
> +	if (!ltr_count || hfi_val == INVALID_DEFAULT_MARK_OR_USE_LTR)
> +		return -EINVAL;

This means that setting the property will fail if userspace has not
updated it. Please make sure that defaults don't cause errors.

> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &hfi_val, sizeof(u32));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index 9344d20042fd4dd5ed123463a93188f36efbd137..6db693a602aca296f032dfc31987071f8e15bd1c 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -243,6 +243,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT,
>  		.set = iris_set_ir_period_gen1,
>  	},
> +	{
> +		.cap_id = LTR_COUNT,
> +		.min = 0,
> +		.max = MAX_LTR_FRAME_COUNT_GEN1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_LTRMODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_ltr_count_gen1,
> +	},
> +	{
> +		.cap_id = USE_LTR,
> +		.min = 0,
> +		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN1) - 1),
> +		.step_or_mask = 0,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_use_ltr,
> +	},
> +	{
> +		.cap_id = MARK_LTR,
> +		.min = 0,
> +		.max = (MAX_LTR_FRAME_COUNT_GEN1 - 1),
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_mark_ltr,
> +	},
>  };
>  
>  static const u32 sm8250_vdec_input_config_param_default[] = {

-- 
With best wishes
Dmitry

