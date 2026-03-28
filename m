Return-Path: <linux-media+bounces-57421-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH5lFYJ0x2npXgUAu9opvQ
	(envelope-from <linux-media+bounces-57421-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 07:26:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C0734D816
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 07:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CC613021EA7
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 06:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACEE337BA6;
	Sat, 28 Mar 2026 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LK6QF+H3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGgaIJjd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3FF30FF26
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774679157; cv=none; b=XzLIR72gRbjxVrs/Z453uAT4myaWeEKahp/727md/rv0zM4dcZk6RyF/maWTHJQ6QTADGCn19YYfdKoX9PVaZkKtizPJcSwzpDRYl7TwRDqcl6MwAa95wBg1dbthFpOIRsCJa/YJjOzmw40t5+h+qmdZDmJ0x2KG5dNhQNR739s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774679157; c=relaxed/simple;
	bh=x378TmYIvCw7bbd+OA9uXgGesY3LGv8GwqbJTuA6yyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLGkE3sIsBa2xuoxwZDi8zUGb6r9SV48EEtTbvgBMU2Tgfad8cgksB57UV2j2xh7mymwH5C8T/kOad961LHHVqTvRKJW0MWiESOGqJU0Fsrbvr9pb9zdeMmBOZcgqQVPhZvE8aqbOhsGnM9ONQK6XIFinc1zWnqjBw5rMao5do0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LK6QF+H3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGgaIJjd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S29EF7855138
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 06:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AnmAY2j6WsZg+gjoAQiABlVqqmlC+uI6ln6mUZFTiOA=; b=LK6QF+H3ZTL8mBSm
	UNdL1oSaq3P7IvYciyLIt397Z9F7QwyRxFChOajUg0PFLYxLDS5GgiTAqoVHOdNp
	x9HRbPuXmRQrnOv9d5qT4Nri8OSopIB3WK9zAPyOLjgMjtkfw7zdsNMMeg3fFvin
	SCCXDa9jAeUYRNJTdEGBhI+svsag7Pax5nziwZA4moFtBDFcLkbyE7j3yuac4ttg
	bwv9XpCDLW2ZD8UMwdOONXO7iCqnhcfbuRbAn1OQnHN0Nhwx74xb3a4TJHKjJKNn
	dPByVTiPAgfKnCn23dHQzIv8NAY7ihuXjJmTwjWFYBM82/S6QA+ozSSFnfE1x+KN
	5A9TcA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqgdg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 06:25:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c741a9ef5f0so1933432a12.1
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774679154; x=1775283954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AnmAY2j6WsZg+gjoAQiABlVqqmlC+uI6ln6mUZFTiOA=;
        b=GGgaIJjdnRx7ypN2QX+rYYjcw8EU0ue8YeNFtolEmzJwlEscs6hEBYzAZUzXPZVqpA
         37G9l8PM4QQJSCv5xxwoUesa40Jcd56N2+/IXHplvcfxbS6vXSL+O9ouTcBkw5+MT0Ts
         1OFdwl1wI1U2hL++oDAO1nOB5OYwVP/RXQvWTm38KwHTVsUxrMliZw25vcStB5IRRj+B
         r3xH2Pw1iMmtPrBIo0U1FazAzKXEn/SEsLMQ3BC/KQ+J5aT3d6eMZZVQ5Ik93afDQzrT
         uxZdQIHCmxCU4LUDT3qM+XT0AT66nsGoQbIGpa7VDtLfq6IMgkbQtTVJKe6usB6LO2Wc
         QnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774679154; x=1775283954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnmAY2j6WsZg+gjoAQiABlVqqmlC+uI6ln6mUZFTiOA=;
        b=nm9uktx7owvtiX2wzJMeRLW37Zn2kwxEorCp+n5PtVcXr69wCx8UQ3rxqTfhPRPI12
         /WnMqYBgJmv51/R9weBwQfpeq4DvbYw65M3SunEMSd4KxPo6ujyMr5WG/yc+AaZvnqfX
         1gQO0tY4ikBbX7x1yjERRS75HxKY3xCM0ORoU6tRGsAbVBJqTftJ5e6VTcsDRHYhDCqF
         8VkOf2kUCYienZBJQ54hRAwW4ugs2KICdvndkflH1CRFsC39XdxJJCMjBVlotr2dmrqf
         qajITUbw0IbuW7RlLnlJRFRkzB5but4BqfiLthj+oaNIUjJhvYDjo7bpx/8tPF8p/A+q
         YTqQ==
X-Gm-Message-State: AOJu0YwjfT3n3AiQQSIcCapK/z4p68YiUC1RHMS2o2Z35LQdMTNt1sVL
	HBi8hnM7GMRrzcZYRK4J6ePh5nwemCOfiK2OJ1pRAhXJC6GYK5nKshXGCk5DGDxbsSIX/JMFxSI
	GTma4tv2OQFOJGYC9m/h1x8DCVDcf9sdMWv3ecRz64lhphK7bmb5mMghpT2goUrEAOg==
X-Gm-Gg: ATEYQzxPqBad0sGp7BevEe9uqMvfX15QLqk4AdXnn52Y7zPsdvTaVNIT5koyTCiZI31
	SV5GA3dlffgK/UHf+QejprT74oJa5QyBeaSt+wCl5MluuxS7WlDTxlEUjuzs1rfyfHr4q4IxCk5
	2Nja976FgsBSeXtVG25UxRoM54mcw5xvVD/dFcrUS2XkFp4ETiCoIJNC57pq3UJT2cJIUlExmOU
	NWOUoos1ehidGfXZxHrNPzgnYu978mck7gJSS+wxz52ZqHwPL7FWM3VYNuzaZiqvt+06MWrFOhC
	SzaAWBFvvQ0vfzd0WATKypAa3mS7RCVc8hrXWjgUsaXaLsnqqFsV9gapopMx84to5xyU/60P8be
	5j92wM4zO+lzdGCUjkXUQXvXCc8QgoWKUlRHYdY7DX1xiiR5zrv0uBg==
X-Received: by 2002:a05:6a00:4517:b0:82a:75d2:73c6 with SMTP id d2e1a72fcca58-82c869c5f49mr6718338b3a.18.1774679154221;
        Fri, 27 Mar 2026 23:25:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:4517:b0:82a:75d2:73c6 with SMTP id d2e1a72fcca58-82c869c5f49mr6718322b3a.18.1774679153709;
        Fri, 27 Mar 2026 23:25:53 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86307a5sm1071769b3a.60.2026.03.27.23.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 23:25:53 -0700 (PDT)
Message-ID: <3fe34754-e691-9fd9-7fab-1c81f98ef534@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 11:55:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v10 11/11] media: qcom: iris: extract firmware description
 data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
 <20260328-iris-platform-data-v10-11-46b92bfe7b52@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260328-iris-platform-data-v10-11-46b92bfe7b52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Dyvk-dguEVkcnMuumZbMb9XhiO7HhyQL
X-Proofpoint-GUID: Dyvk-dguEVkcnMuumZbMb9XhiO7HhyQL
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c77472 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=n9i7a1ABM4vdrNuulSdbnA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1XFNu35YfRq_e6hXo-gA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA0NCBTYWx0ZWRfX/PyenQshttFp
 J2K8lAEXRUuRzNBGf9Do/mNAddZ7F0s8GTfk/xKSLaLYXObVB2vvD8/avTUKTtoWQSjwbWZQ9PN
 S7/7vrCD7n4V/QoH9iKSHaM6kQ26ZoT8BwUm/DJWg4CC1BfFXJtmcYBHgKr3E8MRUNEmc3CcPNL
 rW1IlcD876O2nnhDl4HPQH9AdtFVaP7nmMkVbxEAlczrY1UDIC25FtmzUMHw6+wn+BtvpTvirHi
 m/SDhin74hyXosZPi8yH8/L+vkEjv0tzKVm5Fh5c46UX1kCFx6CDmTIIEtuhJdM27lrIZfczlRN
 r24rlGfAKMQStjbYgq5Ejcy6kuFD+UlpNA92RC4nkrGWFPt5KcUP5IqpIRLvqIqnc/6Jx5s7va1
 QRp50Th141qubkIRRSzMyIQoybvquAH7WmN58X9d0DIqEV9UhYM8FyRBgB8hx1Tfp3CVIh7xasG
 RGZOZz5tJrtSK7oxR8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603280044
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57421-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: E9C0734D816
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/28/2026 4:58 AM, Dmitry Baryshkov wrote:
> In preparation to adding support for several firmware revisions to be
> used for a platform, extract the firmware description data. It
> incorporates firmware name, HFI ops and buffer requirements of the
> particular firmware build.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
>  drivers/media/platform/qcom/iris/iris_core.h       |  1 +
>  drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
>  .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
>  8 files changed, 57 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index fbe136360aa1..ef7f6f931557 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -295,7 +295,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
>  {
>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>  
> -	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
> +	buffers->size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, buffer_type);
>  	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
>  }
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index e0ca245c8c63..7f36eb65dcbf 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -99,6 +99,7 @@ struct iris_core {
>  	struct reset_control_bulk_data		*controller_resets;
>  	const struct iris_platform_data		*iris_platform_data;
>  	const struct iris_firmware_data		*iris_firmware_data;
> +	const struct iris_firmware_desc		*iris_firmware_desc;
>  	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>  	enum iris_core_state			state;
>  	dma_addr_t				iface_q_table_daddr;

This is still missing the doc update I pointed out in v8/v9 as well.
With that fixed,

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

