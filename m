Return-Path: <linux-media+bounces-66119-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yoV0Aa7cQ2o1kgoAu9opvQ
	(envelope-from <linux-media+bounces-66119-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 17:11:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 640576E5C76
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 17:11:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h42Jucuu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MNYb1fkQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66119-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66119-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17AED3065BD8
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06FA2F5A12;
	Tue, 30 Jun 2026 15:06:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C362C235E
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 15:06:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831983; cv=none; b=eVreQjTwXhX1PLF53W4d583BQQypcNHj7+gnRQTxcMcMxSlv34Ywt9btZ9jr0B85Mj2YleR6aMVaAFHf6npzImTDNF59mEzm0omzyi9rhSC3RfZLMOG+j/y+MzEaE5OdpAFUClbDw3OyUC5umGWmzAugoDeB3w/ftfesZ3NmiWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831983; c=relaxed/simple;
	bh=tBVYYckRP4d98f9cneFiFb4yQf/dFJHCosDHcvrcfUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6VWUsi6xvOcULkhp5hvEOwdFvWHJXWtn+ZXtoWu7YaKzl71pS4YGTx4OuwrBjxtB1QQArGuvG0fZ6nGKAjjnIknsFRPAAILf381OBsvRp8MURTsivvA53Ze7dUz/gQWaNse+HbHflCZSJRs938XoydysZZl2Ovdjygk1Sq5LoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h42Jucuu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNYb1fkQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDXJk2116540
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 15:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urrKHuOuZqzsOMcDEsGR2fyzmoC2DHEP0l8VP4d1anU=; b=h42Jucuubd17xgvs
	KQxP2WDCrL/z0x1wHr4prfhhtUeV0F+PhGqKWirWL9Z3eLFfZ/OooLFajA4+aOes
	9TZ+pf0JpmVMyxJT3U9NKCBTI976wd0JsgmknnqpVrGRetIR6abIAa+IuI05oxsE
	VKiAybTDsGeo7drM0ab2RHXarOEbs32HXhdOnwrv9yrzyIos3vYmRN84F5vLEC1e
	jIm4Wgr7e/SReX+LxEXj+UBWPcKbEEMStej5QoVJrXly+iGN0EAd2qojdVnlbkOc
	CDE7iujmN1Nnb8HziKFx66IwFYK75GU26nczgHswp0aIjzNRX9yi6YjnLMqq2Go/
	IYdXiw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j46kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 15:06:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ed664e368so655345eec.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 08:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831980; x=1783436780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urrKHuOuZqzsOMcDEsGR2fyzmoC2DHEP0l8VP4d1anU=;
        b=MNYb1fkQxi3s7ud0l4dm+aVCUt0/9C+TdJWKEKhqVGxzeQNNa1dQqorQRQ0BQqI5Z/
         kLTHeQUq5UjXZQlctFMNd6T35ZL+wahXvnTWfCLNwVxoWEOZl4kK9GkOFWwJLyWzA8vL
         8BhWlvP5q82E1nqTRd+Hrofn+HGnBGd2yOKEJu9wRc01DapfTzL9cpthQy4o5yHuRRmN
         DXd79Jg3GpP0qLkme34yZLap5jY0xGEnQUYo6PDnuODbMHZ/7v4wyyPaRvVY6K9hkEjL
         dxE+uxYzOhOVWV7PoJ1jCsFR1Eehn/Ax1MTCrTw5vgoB0IWvRE0bB8MV70f6eIIddB7X
         VmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831980; x=1783436780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urrKHuOuZqzsOMcDEsGR2fyzmoC2DHEP0l8VP4d1anU=;
        b=OfsQ5kqOia7pLqSG5q0yVR+GeUdLGfwXZBcPRHQxvUpp8cj9hzxxZOy6OL72eZRyI/
         ExqFHwv7NymTyikABCv5Ha2SGzTPVgRkYUVrCGxtjKOWjXcZh1ojLZx7zyVMgPQRiqNn
         IdDKpcf8UVoV7F6bmKhc28CG38LwznUrWN85UNDvNj5/md18xjSbFcmXCjywV20B7sdF
         NxnoTXUvmuNhZZttQolUzE0yfkFoj8Ffvq+CgL+tufdxIt3m2zAQGmrkNyBbtPsVd5ZS
         uZeczQli/Hqrk1r2t0NkIazhRhzxLVrNWFOMJ4rKATO8eKYHLDJgDIBKmXQ4fviMyB/r
         wovA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3nn2XRHl211+tJWX7C6odCMA+CQo5Dwq2IEDDY2WdQ+7hFbgonrHImYADbTa1XwK4Wj5Ob4Gc0HWVLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAM2lU5ofK0l9hP7qPUbFLBvIn6bM8hdbx+ln1mTh0zjqcjIsb
	hT6h+qLHKdjuq5RrziFOlSeB6WVGv27OesBigSL8CalDSJeKA9ffPoKkFu2J9hSdrRFAd0cTDnS
	PcP/vy649l8KVZvrCv1Q39Y+jpvQ9ktsnrBL0Ba1ddwmFt+ywuKNrzQHFmo6zr13R3Q==
X-Gm-Gg: AfdE7cn2Fx6iP3EbtnoDKeajOgBAbOxrMccsKbctlf/GILkuKnDbDE8A0vs6AHuAVRE
	8kMYEbU9hTyzJohk+pEs/OwXXRW78knW6VibkqSVo/dL2rTwoYRvspMui0NgxVB3Uput3m5CTA7
	sc2//dU4ov7XIHw4GRC+CXVQAkueluZxmyCGXZV2NfOsz6o+62U+q0SaopB+K3hAaiLtvkeIL8V
	csjoQnsJby+48iQ+s1cImol6d+4KPQs7llLZ/1OJ/OUnCoD+xhsQPPFcPqPAk3FmlhcYQzo9xsJ
	6yBnfwRplQT/Qq9saS1NcerrUbqCyV7K6JrUgnf9NsPKQYbtiXWq6d0nv8SKsraryjwFAZV9ZuN
	jToLGTP68cTsBf7+HZxcrDu4E7Ks2zXRwr5Xbk0wctaQ=
X-Received: by 2002:a05:7301:2a27:b0:30c:ab96:7304 with SMTP id 5a478bee46e88-30eea0b83b6mr2029027eec.20.1782831980454;
        Tue, 30 Jun 2026 08:06:20 -0700 (PDT)
X-Received: by 2002:a05:7301:2a27:b0:30c:ab96:7304 with SMTP id 5a478bee46e88-30eea0b83b6mr2028977eec.20.1782831979816;
        Tue, 30 Jun 2026 08:06:19 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3205993sm9524988eec.24.2026.06.30.08.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:06:19 -0700 (PDT)
Message-ID: <8dc9018c-5b2b-26e9-628f-04f9adcee1c5@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 20:36:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] media: qcom: iris: improve gop size support for
 gen1 encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260624-dynamic_encode-v3-0-f2a2db0ac2af@oss.qualcomm.com>
 <20260624-dynamic_encode-v3-1-f2a2db0ac2af@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260624-dynamic_encode-v3-1-f2a2db0ac2af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EEzyHIqj8frLrOlqRbvneOFq4ZxjJQzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MiBTYWx0ZWRfX8NRVQk8/eWbt
 9+O9HyQDpRFUiJV9y6xaVhiItwJQLLuqKASN/4Zv7RgsZ2NbLvxrVDCslMOKgBvl8NiRFLEUpld
 GLMCLcVkQ46DLYa5SJV2oaMOgmSXUeWhg8ua8xDHkwaClmuPRTRSjDnH9QAihxZANYtkwt6b3eN
 lxBjJwkXKongBvbraisRfGBsqg5sInz15PHXBRB0sEBT00Gj3HOF9oj1u1iYd6IItL5jHUmwt12
 DP1QS57fojyAKuHgZ3jyjHu2qsg5JhpZGXNkE0cEnKa62aqqY8HGA3PsBHwpxuKC22wmQlDvsdk
 I3MvVtBeIC/Wzqs5Vi5Rr+KAx9HqpZyy8X47xqOu4gwdMXPUL+ZGkBLlMxLuUYysAjCzBNohdEG
 DNDwKE8MoB714pbzd/bHTLqRCWR5wfrhUQogGG2FX5faX91tnyY0dqdxizi1t5iufbt+DaHFvRd
 yg8Hqy/NiwGxNUcc9vw==
X-Proofpoint-GUID: EEzyHIqj8frLrOlqRbvneOFq4ZxjJQzt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MiBTYWx0ZWRfXwcqTb8S+90W2
 2jDwIEbNxbkgZBLushrorRJ7qdwu1HtuuOBpGZOHgFLhvYV7srhNjoDCtvGIktygjcn/IXF6t0h
 UBuLwd+GTBJ4d2nInMclwnl0Xxkhh30=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43db6d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hUGi12Jgw1DI7xEWZf0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66119-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:wangao.wang@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 640576E5C76


On 6/24/2026 2:21 PM, Wangao Wang wrote:
> The GOP_SIZE cap was missing an hfi_id, so it would not interact with the
> firmware but could still save the parameter passed by the client.
> INTRA_PERIOD was acting as GOP_SIZE here. The code was redundant, so the
> two caps have been merged.
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
>  	},
>  	{
>  		.cap_id = ENTROPY_MODE,
> @@ -240,7 +242,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.step_or_mask = 1,
>  		.value = 0,
>  		.hfi_id = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
> -		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_ir_period_gen1,
>  	},
>  	{
> @@ -281,16 +283,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.value = 0,
>  		.flags = CAP_FLAG_OUTPUT_PORT,
>  	},
> -	{
> -		.cap_id = INTRA_PERIOD,
> -		.min = 0,
> -		.max = 1,
> -		.step_or_mask = 1,
> -		.value = 0,
> -		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
> -		.flags = CAP_FLAG_OUTPUT_PORT,
> -		.set = iris_set_intra_period,
> -	},
>  	{
>  		.cap_id = LAYER_ENABLE,
>  		.min = 0,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index c9256f2323dc4521f9eacaeffb0fc08a180de3ff..ff48333ad089894c3393e8ad45903c2603288eb9 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -165,7 +165,6 @@ enum platform_inst_fw_cap_type {
>  	USE_LTR,
>  	MARK_LTR,
>  	B_FRAME,
> -	INTRA_PERIOD,
>  	LAYER_ENABLE,
>  	LAYER_TYPE_H264,
>  	LAYER_TYPE_HEVC,

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


