Return-Path: <linux-media+bounces-54705-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJewF/ORqml0TQEAu9opvQ
	(envelope-from <linux-media+bounces-54705-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:36:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F17ED21D2D4
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0C0B301829F
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 08:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7FB379990;
	Fri,  6 Mar 2026 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLPkKVpt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uodsciiy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D479378833
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786153; cv=none; b=PAtZ8SVI5jxmsnOgiINfUs5/zDbF+rl3w5n0xBRmaqanquLNbwSWe4v/LnIFn6wGC3fxxagSfcsLZoa194z1Sz+cqCRsIuDwDedLy2H+PlKWWvVZJ9purze+6llqtkcTy8FylL0zGBUimFtRV9RCLJbiyBAPN+tjCYT21tYm9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786153; c=relaxed/simple;
	bh=uDg+eXXc82VfCk6xMKbsneT6Tpz1j1l0OhD2Jtmju5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLpakP7QC7iIhrXaSMRY21LdNByW/Xt0Yrg4jAk9OXl4CusTaX+UtRDXS9CLuLSBi21Cm7JUkPBf5wySPAFT6LyFD2zRinAfUOBFU7fAp3EhmdlcZCFd1/qOADTedKpR3i4LlkGiJV/YKNgTQcqKlh9be8i2OMgrUSmyRDYe5xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLPkKVpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uodsciiy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aNIG2327507
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 08:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPSIBOaKrTaFEU5pgrvCQyRqxyV9K5ArRm+ghebkNOo=; b=TLPkKVptC8KC4lc/
	hRUCulQtbB1JNnG3XmCT590QFaOfWdLjyGd3KRVJQzx+qTLg02neiEybH1hanyhd
	MdXAnZ6WaDDcF2FtZAYQkHHU6dOZaHkpYLoRXqJj5oAkHsfanyFyDcfw9ZmJl48D
	XcMbpYBmD3w/jLxkrrQo4ZKuClu9T5gqD3bGGiIakgZZBpTPgrHmR5kutm9nD3Is
	bOf0YstCZYueXcwjbuVQ2+vErKFqmGn4Y4IDUKVIM6CG7H+TtDIkMng5jWgeIc/x
	9u/XH9JH2JDMXc2DE9ke2LrVPv4LPquzLNsY7s7zNRlG4JqZ+khXR1VD33a2Q9Fa
	m0pbqg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09t91a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 08:35:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e425c261so8108299a91.3
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 00:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786149; x=1773390949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rPSIBOaKrTaFEU5pgrvCQyRqxyV9K5ArRm+ghebkNOo=;
        b=Uodsciiyy2dbYkBwMSSPPQ4CqZA18QLqkqBEh6x4vVyyPxRqQ9/OqiZqlFkP4UNkpE
         t6BEzYQQn+XS1ECSyVne3zq+ID6r9zSJob9tvO/MzlajWrivBVe33gvWAqIGZSXuhvAz
         VvzxCWGdOa7EXABAWJAF3M1834kIKsd8AxZFuVd5o5f9tnOpjsp6HMvZu3zVh+xYcKJ5
         qzZmVIxyKsmCVf2F3/jUqzYkAiUbIe7cKUmY+erS8IfWRtI+Y5X6+wuiS3x0oGPGYgW7
         YSp7AB853R33NgYdkdqcncPSl4oa/MZcuMoPbECpo0NytGcSRYdz94wKHlEY2+PON/Si
         vxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786149; x=1773390949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPSIBOaKrTaFEU5pgrvCQyRqxyV9K5ArRm+ghebkNOo=;
        b=Y+LhyPYlgHR0BGaNVI8eF+2Uofs+i6aguxP+5ylZrMwJS1OUm4NkeRMiMXlWFWLCa/
         6oaf8xRGIrv18Rjqo+64Wt7ZUEQlHRKDBMWlO8AfYQUW+BaC7nFKs2jkzjkAYadnfhOE
         2Su7qZtQ6EQQ8mAydmtISoCHwNU4tbAP8TBVh2aZgrTBslgfuJuxxulywJGpykZwWtcK
         DRwos7NFmGqGuWjpIKW+y+RwFr81k24hObfjj1fVZ0wmuJHGfKSBtLpPOX32vIRojeOx
         mJBsLWE8wNQ3YgYxzq0oWUEritEbocAHb+CM98GWq+WCvf2g93b6q0F/m9VMCX4hsDDT
         o0TQ==
X-Gm-Message-State: AOJu0YwfkHQKdHLRt0uwbeTvbmCos9thvH7FNe/J1oZwVqyF5TMiL302
	q4D8IMuIZg9gc5klp6BKa125UkhZ6FRUNoYUQn0hwLRMI2fn9iLtUpDek9e0hqNM0TTpDEITqtY
	dfj7U7BEQWE9NaGw0SyZog6Jq2oKN2TkGbeT8jM+8Iwaj4s7e/E26zClQULq6RgqDeQ==
X-Gm-Gg: ATEYQzweEmHwDQuOCqxnAqiAZ+3hTWeGpbrE7kbBpg/S4160zUNYvb57XKpTUaoLYwT
	8doRZrVO6/pYx9v47/fjvQeS9y/0pnSc3hAUSa868N+zq8ku8iSTUQkwaAL1Q2DgimlkYeHcp0z
	qUCZwvjOJItr4UD65dldM+CLFKEcE7J7RSzWCwpvUxU+/xMWQ87KUkbvYCF96LlKjWL2H6LhF1l
	JgM4mwJaWuLbJRy4Wdbr64IIqcLC4c3vILoA1PArS9Oumhl5qBDHZeE53vpVPFUndzlZjQGChCJ
	rBlld8ilXBxUFFD3O9yDd3s6t52qVDIj9QlMI7sifx7htwvR6Wg+izc5ils14Xf4YfA3RhnSBmY
	tMgL/gssy7QInqcntm60bY0s1U5g8qHfpo5obAgLAIFzR0rLUgZli1Q==
X-Received: by 2002:a17:90b:5104:b0:359:8988:38bc with SMTP id 98e67ed59e1d1-359be233210mr1384105a91.7.1772786149060;
        Fri, 06 Mar 2026 00:35:49 -0800 (PST)
X-Received: by 2002:a17:90b:5104:b0:359:8988:38bc with SMTP id 98e67ed59e1d1-359be233210mr1384075a91.7.1772786148422;
        Fri, 06 Mar 2026 00:35:48 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bbab6e4bsm758328a91.0.2026.03.06.00.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 00:35:48 -0800 (PST)
Message-ID: <69150451-3580-e7d9-9ed9-1d3fc0a2476b@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:05:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 07/11] media: qcom: iris: split HFI session ops from
 core ops
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-7-acf036a3c84c@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-7-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Z9UIV98SzIxo-pxHCe2Bt3Oi0Yeq29Dv
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69aa91e6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IrIcjQS8YOhLhDNCWt0oYA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aeXXQIQdJUFBVMhoBREA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Z9UIV98SzIxo-pxHCe2Bt3Oi0Yeq29Dv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MCBTYWx0ZWRfXxzoOxmmyBy1w
 ZoffC11OpPC9sfS5D4eyvRbko+7FBBORpeTG1d8YEdQoTh8VO5iIdD8Z+NdB50qQ2zIQxRU3Udm
 YjFJfGdIZ7QLtutmwNSU9N82aqZF8Ke0sxpAh1rVF6O9yNoLExhGPC4XP7U5Qfna+N+c1ws7628
 ftxYZ0JOHEqOtTOp8p8sdphRaIZggp0VHdyeFfRElwkdiNzdNXfn7huXgkP/sftbfItln64yjJk
 x6cERK9KfCsW2Acw8aBgNzcLiKAp+P19G9bczFlyd4jS9QZ9/3nPkORD2EEGWzKg5QXgA9X3ZpM
 8FY/Sfak4cyKZ/3Urq2Kr62f0FC+fX6UV+dFelauyKRTl9lF/Du7i6x/iKoMUrJSW+C4OPEYpyU
 IO4rZn4tcB449YY8mYiPchvIjWJLgEmwwGCE9XwVRkTNSfpwHj1WOS6antUHKgHEQUA3bXxak0O
 SjCX9J71cmkin56rd9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060080
X-Rspamd-Queue-Id: F17ED21D2D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54705-lists,linux-media=lfdr.de];
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
X-Rspamd-Action: no action



On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> Calling HFI instance-specific ops should not require double indirection
> through the core ops. Split instance-specific ops to a separate struct,
> keep a pointer to it in struct iris_inst and set it directly in the
> get_instance function.
> 

IMO, In this case better names could be hfi_sys_ops and hfi_session_ops.

Thanks,
Dikshita

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  4 +-
>  drivers/media/platform/qcom/iris/iris_common.c     |  8 ++--
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 46 +++++++++++-----------
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  3 ++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 23 ++++++++---
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 17 +++++---
>  drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  2 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       |  6 +--
>  drivers/media/platform/qcom/iris/iris_venc.c       |  4 +-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
>  11 files changed, 72 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 9151f43bc6b9..915096b21279 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -404,7 +404,7 @@ int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
>  
>  int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	int ret;
>  
>  	ret = hfi_ops->session_queue_buf(inst, buf);
> @@ -572,7 +572,7 @@ int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
>  static int iris_release_internal_buffers(struct iris_inst *inst,
>  					 enum iris_buffer_type buffer_type)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>  	struct iris_buffer *buffer, *next;
>  	int ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
> index 7f1c7fe144f7..69748e5764f3 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> @@ -48,7 +48,7 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>  
>  int iris_process_streamon_input(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	enum iris_inst_sub_state set_sub_state = 0;
>  	int ret;
>  
> @@ -90,7 +90,7 @@ int iris_process_streamon_input(struct iris_inst *inst)
>  
>  int iris_process_streamon_output(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	enum iris_inst_sub_state clear_sub_state = 0;
>  	bool drain_active, drc_active, first_ipsc;
>  	int ret = 0;
> @@ -189,7 +189,7 @@ static void iris_flush_deferred_buffers(struct iris_inst *inst,
>  
>  static void iris_kill_session(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  
>  	if (!inst->session_id)
>  		return;
> @@ -200,7 +200,7 @@ static void iris_kill_session(struct iris_inst *inst)
>  
>  int iris_session_streamoff(struct iris_inst *inst, u32 plane)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	enum iris_buffer_type buffer_type;
>  	int ret;
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 3cec957580f5..f5032c5eb5a5 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -399,7 +399,7 @@ static u32 iris_get_port_info(struct iris_inst *inst,
>  
>  int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_value = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  
> @@ -412,7 +412,7 @@ int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  
>  int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_value = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  
> @@ -425,7 +425,7 @@ int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  
>  int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	struct v4l2_format *inp_f = inst->fmt_src;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	u32 height = inp_f->fmt.pix_mp.height;
> @@ -446,7 +446,7 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  
>  int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 work_route = inst->fw_caps[PIPE].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  
> @@ -459,7 +459,7 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  
>  int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_id, hfi_value;
>  
>  	if (inst->codec == V4L2_PIX_FMT_H264) {
> @@ -479,7 +479,7 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>  
>  int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_id, hfi_value;
>  
>  	if (inst->codec == V4L2_PIX_FMT_H264) {
> @@ -499,7 +499,7 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  
>  int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	struct hfi_profile_level pl;
>  
> @@ -520,7 +520,7 @@ int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_ca
>  
>  int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 header_mode = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	u32 hfi_val;
> @@ -539,7 +539,7 @@ int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
>  
>  int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 prepend_sps_pps = inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value;
>  	u32 header_mode = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> @@ -561,7 +561,7 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
>  
>  int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
>  	u32 bitrate = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> @@ -586,7 +586,7 @@ int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>  
>  int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 rc_mode = inst->fw_caps[BITRATE_MODE].value;
>  	u32 peak_bitrate = inst->fw_caps[cap_id].value;
>  	u32 bitrate = inst->fw_caps[BITRATE].value;
> @@ -613,7 +613,7 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
>  
>  int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
>  	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
>  	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
> @@ -640,7 +640,7 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>  
>  int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
>  	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
>  	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
> @@ -667,7 +667,7 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>  
>  int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 entropy_mode = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	u32 hfi_val;
> @@ -687,7 +687,7 @@ int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>  
>  int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 entropy_mode = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	u32 profile;
> @@ -712,7 +712,7 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>  
>  int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
>  	u32 i_frame_qp = 0, p_frame_qp = 0, b_frame_qp = 0;
>  	u32 min_qp_enable = 0, client_qp_enable = 0;
> @@ -776,7 +776,7 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>  
>  int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
>  	u32 max_qp_enable = 0, client_qp_enable;
>  	u32 i_frame_qp, p_frame_qp, b_frame_qp;
> @@ -841,7 +841,7 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>  
>  int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0, client_qp_enable;
>  	u32 i_frame_qp, p_frame_qp, b_frame_qp;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> @@ -902,7 +902,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  
>  int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	struct hfi_quantization_range_v2 range;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  
> @@ -923,7 +923,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  
>  int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	u32 hfi_val;
>  
> @@ -953,7 +953,7 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  
>  int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	u32 hfi_val = HFI_DISABLE_FLIP;
>  
> @@ -972,7 +972,7 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  
>  int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
>  	u32 ir_period = inst->fw_caps[cap_id].value;
>  	u32 ir_type = 0;
> @@ -998,7 +998,7 @@ int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type ca
>  
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	struct platform_inst_fw_cap *cap;
>  	int ret;
>  	u32 i;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index 3edb5ae582b4..4f26b010249a 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -110,6 +110,9 @@ struct iris_hfi_command_ops {
>  	int (*sys_image_version)(struct iris_core *core);
>  	int (*sys_interframe_powercollapse)(struct iris_core *core);
>  	int (*sys_pc_prep)(struct iris_core *core);
> +};
> +
> +struct iris_hfi_inst_ops {
>  	int (*session_set_config_params)(struct iris_inst *inst, u32 plane);
>  	int (*session_set_property)(struct iris_inst *inst,
>  				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index b7aafda1d99e..fde8219309b0 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -1015,11 +1015,7 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
>  	return ret;
>  }
>  
> -static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
> -	.sys_init = iris_hfi_gen1_sys_init,
> -	.sys_image_version = iris_hfi_gen1_sys_image_version,
> -	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
> -	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
> +static const struct iris_hfi_inst_ops iris_hfi_gen1_inst_ops = {
>  	.session_open = iris_hfi_gen1_session_open,
>  	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
>  	.session_set_property = iris_hfi_gen1_session_set_property,
> @@ -1032,6 +1028,13 @@ static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
>  	.session_close = iris_hfi_gen1_session_close,
>  };
>  
> +static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
> +	.sys_init = iris_hfi_gen1_sys_init,
> +	.sys_image_version = iris_hfi_gen1_sys_image_version,
> +	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
> +	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
> +};
> +
>  void iris_hfi_gen1_command_ops_init(struct iris_core *core)
>  {
>  	core->hfi_ops = &iris_hfi_gen1_command_ops;
> @@ -1039,5 +1042,13 @@ void iris_hfi_gen1_command_ops_init(struct iris_core *core)
>  
>  struct iris_inst *iris_hfi_gen1_get_instance(void)
>  {
> -	return kzalloc_obj(struct iris_inst);
> +	struct iris_inst *out;
> +
> +	out = kzalloc_obj(*out);
> +	if (!out)
> +		return NULL;
> +
> +	out->hfi_ops = &iris_hfi_gen1_inst_ops;
> +
> +	return out;
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 93ce7ac3a19c..502767f1593d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1390,11 +1390,7 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
>  					inst_hfi_gen2->packet->size);
>  }
>  
> -static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
> -	.sys_init = iris_hfi_gen2_sys_init,
> -	.sys_image_version = iris_hfi_gen2_sys_image_version,
> -	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
> -	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
> +static const struct iris_hfi_inst_ops iris_hfi_gen2_inst_ops = {
>  	.session_open = iris_hfi_gen2_session_open,
>  	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
>  	.session_set_property = iris_hfi_gen2_session_set_property,
> @@ -1409,6 +1405,13 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>  	.session_close = iris_hfi_gen2_session_close,
>  };
>  
> +static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
> +	.sys_init = iris_hfi_gen2_sys_init,
> +	.sys_image_version = iris_hfi_gen2_sys_image_version,
> +	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
> +	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
> +};
> +
>  void iris_hfi_gen2_command_ops_init(struct iris_core *core)
>  {
>  	core->hfi_ops = &iris_hfi_gen2_command_ops;
> @@ -1420,6 +1423,10 @@ struct iris_inst *iris_hfi_gen2_get_instance(void)
>  
>  	/* The allocation is intentionally larger than struct iris_inst. */
>  	out = kzalloc_obj(*out);
> +	if (!out)
> +		return NULL;
> +
> +	out->inst.hfi_ops = &iris_hfi_gen2_inst_ops;
>  
>  	return &out->inst;
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 16965150f427..c58e8ec24c62 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -15,6 +15,8 @@
>  #define DEFAULT_WIDTH 320
>  #define DEFAULT_HEIGHT 240
>  
> +struct iris_hfi_inst_ops;
> +
>  enum iris_fmt_type_out {
>  	IRIS_FMT_H264,
>  	IRIS_FMT_HEVC,
> @@ -38,6 +40,7 @@ struct iris_fmt {
>   * @list: used for attach an instance to the core
>   * @core: pointer to core structure
>   * @session_id: id of current video session
> + * @hfi_ops: iris HFI instance ops
>   * @ctx_q_lock: lock to serialize queues related ioctls
>   * @lock: lock to seralise forward and reverse threads
>   * @fh: reference of v4l2 file handler
> @@ -80,6 +83,7 @@ struct iris_inst {
>  	struct list_head		list;
>  	struct iris_core		*core;
>  	u32				session_id;
> +	const struct iris_hfi_inst_ops	*hfi_ops;
>  	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
>  	struct mutex			lock; /* lock to serialize forward and reverse threads */
>  	struct v4l2_fh			fh;
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index bf0b8400996e..104910419dd1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -129,7 +129,7 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>  	if (!inst->once_per_session_set) {
>  		inst->once_per_session_set = true;
>  
> -		ret = core->hfi_ops->session_open(inst);
> +		ret = inst->hfi_ops->session_open(inst);
>  		if (ret) {
>  			ret = -EINVAL;
>  			dev_err(core->dev, "session open failed\n");
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 719217399a30..a48771687c10 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -374,7 +374,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>  
>  int iris_vdec_streamon_output(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	int ret;
>  
>  	ret = hfi_ops->session_set_config_params(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> @@ -434,7 +434,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>  
>  int iris_vdec_start_cmd(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	enum iris_inst_sub_state clear_sub_state = 0;
>  	struct vb2_queue *dst_vq;
>  	int ret;
> @@ -497,7 +497,7 @@ int iris_vdec_start_cmd(struct iris_inst *inst)
>  
>  int iris_vdec_stop_cmd(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	int ret;
>  
>  	ret = hfi_ops->session_drain(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index aa27b22704eb..ffa7d5a91d15 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -581,7 +581,7 @@ int iris_venc_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>  
>  int iris_venc_start_cmd(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	enum iris_inst_sub_state clear_sub_state = 0;
>  	struct vb2_queue *dst_vq;
>  	int ret;
> @@ -623,7 +623,7 @@ int iris_venc_start_cmd(struct iris_inst *inst)
>  
>  int iris_venc_stop_cmd(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	int ret;
>  
>  	ret = hfi_ops->session_drain(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index bd38d84c9cc7..eddf2694e759 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -224,7 +224,7 @@ int iris_open(struct file *filp)
>  
>  static void iris_session_close(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	bool wait_for_response = true;
>  	int ret;
>  
> 

