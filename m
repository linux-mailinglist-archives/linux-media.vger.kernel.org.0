Return-Path: <linux-media+bounces-56660-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM1QB+jpwGl6OQQAu9opvQ
	(envelope-from <linux-media+bounces-56660-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 08:21:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A72482ED769
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 08:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B786F300A30B
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 07:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC4935F614;
	Mon, 23 Mar 2026 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGSuSkPe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NM7Vrk/k"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA8F35E937
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250441; cv=none; b=MEF1f37aQWjD9xDsLFDJR9zyn85Zyk47G274yE9f6pkLqC/XfybQvxMyTRXAqfbS6BtZPfo79yRDXSHnpoUv/jlQu6+N0FgvYURQqoLttUvB50ZEx4CXaeRkQszBis6m53GLVfWrgXPHolTvqehYvsSVRdpjBzq9zHT2IC9ONG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250441; c=relaxed/simple;
	bh=UtYQiLf9XT9Sq5MX9hWcKdGPqR2rORWlqfgKn5TIXQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuFkcQmCy29RJ8r+aek85rib+p5Odal3YJ+++y7/oXye493ypysZRFUYBEZkpx2SNALFbQdjf0+T77Ui8yaIL0HglrEc22C/mwJlQ/VZjBCqbJeC6NY0KyC7PH5h/0ke9ssAW0hYt8XXw7K8erfnGk6Ag+1FoLWzCmgXQkmxBgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGSuSkPe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NM7Vrk/k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MNH25m222291
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 07:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DBBxWS8d6swCU6YER0mu2txJ1/iuLHQ4Yi8SS9B1daI=; b=iGSuSkPe6DaKM+mr
	koK2Jt+0o4fmUCOZs6jWoj/cDVN20VeF9WBh2R3UtP28ncslm24gc1XCTN+WJWcl
	fAwGB5Mt0GGBS5o/aSMH5a7cU+/QuSVlT1DAMxBW9HB6S81NXoA+w7BL8enlZ57A
	JWtCB4R7q8Veiv1LFDySvPKY1F2KTAgUjOf33dlgQ4yeYveLx3maNTzsxU7xFbJT
	Rzex4RoO3VhtRO6pMsWbD8K5pIo8IXha8XGLl72qfibtvZnZpuOf7F2ULDhjdgEq
	musXL0N4+miEre2MOKMMrPzGV5rm/SYaQs6Tq+WO61bigBiSxSpe+mVp7MfDY1Iz
	L1psHg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1gpk4ecf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 07:20:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so36533735ad.0
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 00:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774250438; x=1774855238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBBxWS8d6swCU6YER0mu2txJ1/iuLHQ4Yi8SS9B1daI=;
        b=NM7Vrk/kix4o6cPoBTJMmXWu3qM+XnzlY4M1cSnBSm3/PblGqlU8dQXOLRjLUKs4GU
         lG9tvB6sso/LOU7zECVuy1WtcTQFDmmCUei3XkOGk/yz/jfsE+FF8dbXJSbpEXJA+ZVS
         blT9PwABfwPHxwM9T7XHXQBkgTYt4sZTLud5kmyIMuV3KIkxONcL0vTht1Nj/7LccUd/
         /wNQrK5jFTfRnCysDHQVd6+iuvk2PKKFmoT8OE1KO4+aRj1wNxEidfFykUCIwQJa0sf5
         p6WVnyKG3eX7+LJkmzAq3B5tPxPlTxezRQNS1we+v/A9MojivlIoTRT5KvCmt7/EANxq
         Kg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774250438; x=1774855238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DBBxWS8d6swCU6YER0mu2txJ1/iuLHQ4Yi8SS9B1daI=;
        b=i3s9vQU/I+wY0UXCnrMVTo72PZbPino8pxegZtpCimR3mlzzQk4maqGNF+ey3AmXvP
         9ufqG+Ow5dU/RzuVqu1h3OJdfzga7LHQn1bIgbOTcOovL6ndGF6Bb78UKgeqeVukgKGb
         cIc/4C9QwTubEbw7sTRvz4V16cb5/ibkdkcKFfPfA+bODnFIsibn8oaTWEswJZCO3lD6
         FN47+Qun4bs/Z3LXGhTuQvorke97+FKsCis+wJ9IOQfbx9zwvmt7oPpAkZNIIBWcFi1u
         LIDzZPnbO+AayIceoPSWVJfYy5rv/cO5U2JDZw1xFS97UygFH9W40yS6z599fsrqc8BP
         SgFw==
X-Gm-Message-State: AOJu0YxcTkdB2uOThsoflorw1SVFS0/hYD+95LTYoYq3ZsHygkosmAXf
	6n7s26oOA5++FmhTGiOjRTDOyUnJx/SIMenVy904osbjTISXpP5Dp/4PkO+h72GXgSt7Vp60ucd
	34ZVC1XLaJ6ngcMPqP4oocXSfbbrkIzSFliyWvXg8uv94kDsAu3yHTRJUdhT525Q3pQ==
X-Gm-Gg: ATEYQzzmuCda+WVFiw5zURp4rNMLo4AGGph1xk9RF6GhnQSKuMNlPMAIK7Tgyu2ZAvh
	HFQ7A9nUc1+upL1DeZ9Z0Y6Yp0GQYgLgxCMFNnR8QdpUnCKLwdLaxttYXIEGadb8OAdez1cH9IL
	IZX5yongmzSzRG0ksrANcJmNKCWC8riqineN9rq1mtpixQenON+EPY7tIlRcvnYi0tqF0Lq9hmV
	Rjr0ZUhXyhuA0B/kGUl6tkyDqdOITgPe6fZ0JN/VPJFs1OnFMcv3NxWMjpQ5TjatiaMLOix2JBz
	hxO4mOX0t9P9lkpKi0j5v7Srlj6AKuW5tViJiPoPjVTSiWeIlr+QEN04LluPlcYJ4WBzu3BVmrn
	H8JcNjY058CQvdR6ItrZb+Sgc2Ng57pcSBGRCMaSwVKsaOIxGkhfa6g==
X-Received: by 2002:a17:902:ea04:b0:2b0:7502:6ebe with SMTP id d9443c01a7336-2b082850022mr97122785ad.25.1774250437494;
        Mon, 23 Mar 2026 00:20:37 -0700 (PDT)
X-Received: by 2002:a17:902:ea04:b0:2b0:7502:6ebe with SMTP id d9443c01a7336-2b082850022mr97122595ad.25.1774250436949;
        Mon, 23 Mar 2026 00:20:36 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08368eb9asm128684195ad.69.2026.03.23.00.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 00:20:36 -0700 (PDT)
Message-ID: <14610f07-52c2-465c-d407-fff1974429ea@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:50:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 11/11] media: qcom: iris: extract firmware description
 data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-11-55a9566ebf60@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-11-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1evb-56dFlu44RR2bm_-T52us3cgpKet
X-Proofpoint-GUID: 1evb-56dFlu44RR2bm_-T52us3cgpKet
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NCBTYWx0ZWRfX0L6RqBYDV5PN
 8at4aFJ7n4q2MzfDS/zwHYjIMKIgDobzNvXBftjnux5mBjPczBtWtRtcKpq3IM1UaufPf6XE06S
 rgA+Mt4YIifBCFOZBMG83Gcn2iSgFjCNItSkLsYmKDDebv+AP5izKKrIf4HTiWAKqMJaFK/QPb/
 Hcg/dGNGAp1IX8HaZbnevq0Jiwvqc/E+alMT+w4NonDGdgMiGPaN73TeSMuVZ9Jm1Uz+gVpH9Jx
 gOpLPu1PYx1DPgcfoJE4MxHRidl17LouiW7b8Lkoxal560uFPbluuDPwwOa241AX4UJ0paUtMDV
 BHAQvR620eLImla0RLRphcIac9dSnh8SMNtSg0IPvs36kkYjuoOqhcQ4s6aKnH4g0mDdkXxaRha
 AEnKTsAhxOtrIf0jTqCqX69Us+d2wKdBeskK0iXC4XCB49Ad0DUfkcfPT6hquDuWHXxZrBi2ZNP
 fVuUW2gFig9VnUf7WqQ==
X-Authority-Analysis: v=2.4 cv=QKhlhwLL c=1 sm=1 tr=0 ts=69c0e9c6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1CAC9Jn3K0YispLxHrEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230054
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56660-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: A72482ED769
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
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

Missing documentation.

>  	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>  	enum iris_core_state			state;
>  	dma_addr_t				iface_q_table_daddr;

<snip>

> index dd87504c2e67..d36f0c0e785b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -251,7 +251,8 @@ static int iris_probe(struct platform_device *pdev)
>  		return core->irq;
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
> -	core->iris_firmware_data = core->iris_platform_data->firmware_data;
> +	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;

How will iris_firmware_desc be selected once a SoC supports both Gen1 and
Gen2 firmware?
Today it’s fixed in platform_data, but eventually probe would need to
choose between firmware_desc_gen1 / firmware_desc_gen2 based on the generation.

Thanks,
Dikshita
> +	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>  
>  	core->ubwc_cfg = qcom_ubwc_config_get_data();
>  	if (IS_ERR(core->ubwc_cfg))
> 

