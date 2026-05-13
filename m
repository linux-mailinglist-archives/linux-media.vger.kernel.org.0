Return-Path: <linux-media+bounces-61399-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP/jJdNZBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61399-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:00:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 368F0531CDA
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 419C5300B9C4
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD0A3FAE00;
	Wed, 13 May 2026 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ch8w4AuG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2HBSOwt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBFF382288
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670028; cv=none; b=vGV4r21Ec82+Duogj2k4eM4A1/2ojaY5gShnDmlLwF5f23B/IF1P1ng68lvVZZisDJJLI/AtkGUl8RCulURPoonsKfw9B2WC2DyIOBtypXWapjdq9RI3UZwCP10QKXT6/cc4qqZX/YMKXMCYo3UtvuTOiwCGbFnQd3UNrzwVbs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670028; c=relaxed/simple;
	bh=yt2x7cHtd96/kUcJkMEIM1meLw6bUQUeIedyEM2TIDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZJxVC7jYQwTQ0C1r4KPySDKcjTHJcm5KDZ2A3NUCC1RFdd7l3bv66w+q+UJA3muohvT/493869txlWCdvfGtan5NqcdE6fRyfik2p5/YnuSSczzAVJKlMhIKi9CsZsFu4RhmY16w7k2ebF91FZyk8Aq7MK7MxaiILZUwzG/tTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ch8w4AuG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2HBSOwt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jeP63007155
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yyfwuNihNlS+U6UDbASjReM3
	6Po/zUqBzFqCxRvlu6o=; b=Ch8w4AuGigSzAr32yzYxiSTWZ2Q2is6XbuO5942O
	6dIk/RHFsaIVLDNQBMhQ7+Jy0v8ZioKJc9fhe7iCsmJNl6CNODB+Jd2vAvWpjoV3
	Nk8g0HNtnEjlptmUHxuI4gyYuB+Nbdy1LIp9Q4cN0VIL/WdOIUQ8clSONL2IrIRm
	mYsB2kVbRpEnykIsOWxekk5vKh0xgJTnbRWVMUNXl0UtIcGjCiI326PxMJ64S0xv
	brQLREXpkr5+jxfg+WEYAsP67D8RtWEXUbsBLsulsr2cWN7ODHniivI1PrC58j3u
	PHthB+2x5dezWABnn4UNC6bwfFvnsn4v8PefQnr3RyZm2Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0g8wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:00:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3403e99so127947141cf.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 04:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670025; x=1779274825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yyfwuNihNlS+U6UDbASjReM36Po/zUqBzFqCxRvlu6o=;
        b=V2HBSOwt1CHpiriK9FIN3kOEX+VQUQriESfbNHZvzrWGRMvxDiw6Totzop5ydErgwS
         GRBd/BMmI66CB0T/l1LoxYJ/e9Hwl8KpOEPVT6P0lXj/hjBEaAYglM51M6OJRYk5U9NA
         EpAJj+f8ckg2sgMfzHWSoMzwgZbi00wFagBHo6OWlVXdQm4mvs8rmUxDZFIxLjPrDmBM
         aE9ISAkVtqfC9lDTNYK2qzGcggeiVo1h6hzZifWmpMS2skROvppbJo2tai4z4tmT95a1
         l0UABpfzJhA+kKuCceifsFTDEljGG4sY2RTNj6Fd4lBVMDMW2ieKTNJ3FqnntXcAnOD2
         rT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670025; x=1779274825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyfwuNihNlS+U6UDbASjReM36Po/zUqBzFqCxRvlu6o=;
        b=at49X8xCbhy0DjqCTYJrLVZ1N/DSpcN9HJEgpAHK5mnuPcF9NE98CifABlcn5mN2GG
         GReY3ZGVomyHel0QEW4g8EguVsCowccX3zWc382z1UMnQ0iLEe4NMaw3Jia/FK2vStBZ
         +g60O7cztPK9eemtrKlnf8F4MPD46wDf+wzd/LhpRi1hmlSUTazeBob6bZNhSCUCXYLS
         2jZgnctmEDNcP5Jz+rocMn7D6WQbCuVCbOX83g9b73IgmBKvvx6IuQ9VOZYKzu+hCXka
         HQmlm0AJt+tixQvINKBK2M7hDyBFIYTscrZJa7mSjKtULIktJ5+6WKTNOSw80mDQXv0w
         BQPg==
X-Forwarded-Encrypted: i=1; AFNElJ8DUKF/uxnd5oAMMO2/jkvfY8MlIrWSb/ROBbU4hsVPT1EwGfh5CpYxzvziDk3fBMIxy7KWG7YBbBbkbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvJEMMwjQhqugQd5kQsGDpVOdv1DyiIZG1Z+cggAfoOD1Rjxm1
	ccjQx5p7x5PWJD7sr9RlhIe1GtfAk7snlYFubjuJKy6rd4AexusFf9qsqf4IHrZD4pWMLFTnBVt
	64l6JxnMCLytNWfK4ONMbqtQeEC0nWD5SCJB3og7EAmfwJ/Eif9r/l0eVl/q08IxD1g==
X-Gm-Gg: Acq92OHa8ERdUJLSVIBcSblKbaqFgn8tEVUPg/gCnONMYaO9znQjHr65TyieIfIaSPJ
	IwBbBWXuWMdDruZBPSXhLXjyjUfBhDjfJSJnMKXzZ8wAKrLDvm7pY/eTeP2EcNHNxVwecOFXYxb
	tsU3+k3jmHUgs/EfINxkMFoijiVOp1W14Ehgom2l4KxwmPa6Wzf//Xq/cTx7sZGipSlTFZIiJmY
	/qGxFZn/5bPG7oYQSN6jJAI+8bZyg0nGAG2DRZlhtlKqv6b54JvHR1Jk3YUc7qMkO2iVRe52+J8
	VVZ4yxN11oK74+q6UWIz3KAZ3guXOOeISzRwTrOmeJYx9YVn+gMZM8/QWyB/UL6UU88kcIzJ6wR
	Zyq4NqwTyAAQqraReZByY+RaciFRdzWYnOWo4dMzOtAKorwiJhA4esVMdt/TTYHPU4JqknhRFXy
	DvUF+jZnzguRDPoWPGs2hGETEZOqoDD30TTCg=
X-Received: by 2002:a05:622a:5:b0:509:965f:888f with SMTP id d75a77b69052e-5162f2a4b4dmr36745521cf.0.1778670022277;
        Wed, 13 May 2026 04:00:22 -0700 (PDT)
X-Received: by 2002:a05:622a:5:b0:509:965f:888f with SMTP id d75a77b69052e-5162f2a4b4dmr36739091cf.0.1778670018592;
        Wed, 13 May 2026 04:00:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facc2sm2517463e87.22.2026.05.13.04.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:00:16 -0700 (PDT)
Date: Wed, 13 May 2026 14:00:14 +0300
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
Subject: Re: [PATCH v7 3/6] media: qcom: iris: Add B frames support for
 encoder
Message-ID: <vayghe665w66b2whefdstroyrleozjzfye4t5ckvjmju2rnftk@mxquiebncit5>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-3-4954e3b4df84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-batch2_features-v7-3-4954e3b4df84@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNSBTYWx0ZWRfXzpgjx6pGTK5K
 jdnOAQlT81GakuNiK8aHtQVl7w+QrB0VRy0TFdOJCNJqoiprQJftXpHvxfux64lioHsn2JUqWbP
 ld1OlPgks404zl8PJ4zRC6k76mKG8oQ6a9GyPeohoE0Wk/CTYAstmPHhto4RfH14n5zVFy+k1Pa
 nV9HYz8bdKUMrfGQ5J+91Z8FCoEYflrlqYn1Bk4PDzhT/y2dgioN/8M27lMPJO7XXKqkuwSOQp/
 dlsSxHvJHkiIzjU1yD0GrY6OI4A/ACzGvftJ/ZgZPMybwho9qwNzsu5c81iFDsjzbmjtg478OCJ
 QPaZq/I3YvAG9HeeaugUdl+s2pUWn96hZTAjEk/0UG0HoHotRwHHe2pMLDLDDSyhyKzrhyQI0hx
 xzlx2zRyDFhPR6aXcr3DF3hNKNDO/QhVPQ3wf8T7ISHEl353Hk6mirTvOEjaLkzjxt8381F1+Jh
 xm4Vf12osGLyLZtVKpQ==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a0459ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=fARREy4TeX19WRZZn4cA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4ebEF6fdi4qYdwLalDv1he9ytQE1Mx1f
X-Proofpoint-GUID: 4ebEF6fdi4qYdwLalDv1he9ytQE1Mx1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130115
X-Rspamd-Queue-Id: 368F0531CDA
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
	TAGGED_FROM(0.00)[bounces-61399-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:55:12PM +0800, Wangao Wang wrote:
> Add support for B-frame configuration on both gen1 and gen2 encoders by
> enabling V4L2_CID_MPEG_VIDEO_B_FRAMES control.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 30 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 18 +++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 ++++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 10 ++++++++
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 10 ++++++++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  6 ++++-
>  8 files changed, 84 insertions(+), 1 deletion(-)
> 
> +int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
> +	u32 b_frame = inst->fw_caps[B_FRAME].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_intra_period intra_period;
> +
> +	if (!gop_size || b_frame >= gop_size)
> +		return -EINVAL;

The same comment. Maybe I misunderstand something, please correct me if
I'm wrong. The definition of the GOP_SIZE capability allows 0 as a valid
value. Here you are declining it. Why?

> +
> +	/*
> +	 * intra_period represents the length of a GOP, which includes both P-frames
> +	 * and B-frames. The counts of P-frames and B-frames within a GOP must be
> +	 * communicated to the firmware.
> +	 */
> +	intra_period.pframes = (gop_size - 1) / (b_frame + 1);
> +	intra_period.bframes = b_frame;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &intra_period, sizeof(intra_period));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;

-- 
With best wishes
Dmitry

