Return-Path: <linux-media+bounces-53777-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG3dGnkQomkmywQAu9opvQ
	(envelope-from <linux-media+bounces-53777-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:45:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E431BE40D
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 890D2306ACFD
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 21:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627E1472791;
	Fri, 27 Feb 2026 21:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ae6wBDMA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8712882D6;
	Fri, 27 Feb 2026 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772228720; cv=none; b=Xh/E/f2Iwr7sFOvr8y5DTsODrYgcxkfEEyPEcnRrXkIV954aXysj4eiG8nhAbUpA557DPve95pchUFwC1biX4stVPWdmuXuUi1NP9opREnnTZNTjwlNXhVmE0jlchZ92BnBkiP5cpDk0jYjda03nIFLDjRcFHRjXX/1E+XSOzNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772228720; c=relaxed/simple;
	bh=OGvWo+AIv+lwDE8J/A7kKn4UpSB/6vw45Dl1C6mmnGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ce98HDWLTkVeQIYce2FQKNkiY0pe1bc9/CjJpfIuighem5Y/Yc6bo6dq7ndkA2KxuX3xpBdnA1CtfNzBMz3tQhmKXBiKx7zKLtxmS89pMdkFzM2oeA/2PUHfyaA4ON8ESUjiFNKR83yf0cvKD5QckZCwgYqnCpIswyWSfeKqXsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ae6wBDMA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC864C116C6;
	Fri, 27 Feb 2026 21:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772228720;
	bh=OGvWo+AIv+lwDE8J/A7kKn4UpSB/6vw45Dl1C6mmnGc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ae6wBDMAm9RtIAfif2cOEJJHm7puxf2oUEeEEX9IL7XQFQro05j/O9KUza9ZV+Zmm
	 khNg4X8MJBDabzdd1/AMgbAOJJE0pwvt7e28bGqbjv+40eyv2s8tRSAkWUProfSfhm
	 eqjO9yC49229xOCJ57jb0WBhlTPEaiZ0eYk6fuymBxqxR2CwI0Gy5MZbc27HkG3DjS
	 ngVKmq2tAXNN+C2ehWyFzkcvJdHNl0i8z9Z8mB/l1XlCxCcbvi8Huxjc5gInLeLxxI
	 jmbKSknAOIZvMtSoZV4tlZP2RdPJCYGrbaSO2zs0lLi8ZNPJiAVjwgGKBH6KQ31ORs
	 HVFnByexfTWiw==
Message-ID: <75a8b887-cbdd-4780-8262-1cc24a55bc90@kernel.org>
Date: Fri, 27 Feb 2026 21:45:09 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix use-after-free of fmt_src during MBPF
 check
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <rUXTfoyGnkGklkQTcUpGww1LY3k1mQifzKFqJaChQkC1jTWg-_3dxJVTkYOp45jUmL45pc7DKHXZvEHaEm-Evw==@protonmail.internalid>
 <20260227-fix-use-after-free-of-fmt_src-during-mbpf-v1-1-307cdafffa2a@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260227-fix-use-after-free-of-fmt_src-during-mbpf-v1-1-307cdafffa2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53777-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 53E431BE40D
X-Rspamd-Action: no action

On 27/02/2026 17:33, Vishnu Reddy wrote:
> A race condition was observed during concurrency testing. the core MBPF
> check walks the list of active instances and reads fields such as fmt_src
> height and width. 

Where does that happen - you highlight iris_close() below - that's good, 
what's the method or methods that can run concurrently with iris_close() 
- you should state those in the commit log so that reviewers like myself 
and people reading the commit in the future know where to look.

At the same time, iris_close() could free these format
> structures before the instance was removed from core list. this creates a
> use-after-free window where the MBPF checker access the freed memory and
> read invalid values.

Without looking at the code this description seems suspect.

&inst->lock ought to protect inst && inst->thing if it doesn't, then the 
lock isn't being used correctly.

> 
> To fix this, the freeing of fmt_src and fmt_dst is moved to the end
> of iris_close(), after the instance has been removed from the core
> list and teardown is complete. This avoids accessing dangling pointers
> during the MBPF check.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Needs

- Fixes:
- Cc: stable

> ---
>   drivers/media/platform/qcom/iris/iris_vdec.c | 6 ------
>   drivers/media/platform/qcom/iris/iris_vdec.h | 1 -
>   drivers/media/platform/qcom/iris/iris_venc.c | 6 ------
>   drivers/media/platform/qcom/iris/iris_venc.h | 1 -
>   drivers/media/platform/qcom/iris/iris_vidc.c | 6 ++----
>   5 files changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 719217399a30..99d544e2af4f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -61,12 +61,6 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>   	return iris_ctrls_init(inst);
>   }
> 
> -void iris_vdec_inst_deinit(struct iris_inst *inst)
> -{
> -	kfree(inst->fmt_dst);
> -	kfree(inst->fmt_src);
> -}
> -
>   static const struct iris_fmt iris_vdec_formats_cap[] = {
>   	[IRIS_FMT_NV12] = {
>   		.pixfmt = V4L2_PIX_FMT_NV12,
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
> index ec1ce55d1375..5123d2a340e1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
> @@ -9,7 +9,6 @@
>   struct iris_inst;
> 
>   int iris_vdec_inst_init(struct iris_inst *inst);
> -void iris_vdec_inst_deinit(struct iris_inst *inst);
>   int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>   int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>   int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index aa27b22704eb..4d886769d958 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -79,12 +79,6 @@ int iris_venc_inst_init(struct iris_inst *inst)
>   	return iris_ctrls_init(inst);
>   }
> 
> -void iris_venc_inst_deinit(struct iris_inst *inst)
> -{
> -	kfree(inst->fmt_dst);
> -	kfree(inst->fmt_src);
> -}
> -
>   static const struct iris_fmt iris_venc_formats_cap[] = {
>   	[IRIS_FMT_H264] = {
>   		.pixfmt = V4L2_PIX_FMT_H264,
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
> index c4db7433da53..00c1716b2747 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.h
> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
> @@ -9,7 +9,6 @@
>   struct iris_inst;
> 
>   int iris_venc_inst_init(struct iris_inst *inst);
> -void iris_venc_inst_deinit(struct iris_inst *inst);
>   int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>   int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>   int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index bd38d84c9cc7..5eb1786b0737 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -289,10 +289,6 @@ int iris_close(struct file *filp)
>   	v4l2_m2m_ctx_release(inst->m2m_ctx);
>   	v4l2_m2m_release(inst->m2m_dev);
>   	mutex_lock(&inst->lock);
> -	if (inst->domain == DECODER)
> -		iris_vdec_inst_deinit(inst);
> -	else if (inst->domain == ENCODER)
> -		iris_venc_inst_deinit(inst);
>   	iris_session_close(inst);
>   	iris_inst_change_state(inst, IRIS_INST_DEINIT);
>   	iris_v4l2_fh_deinit(inst, filp);
> @@ -304,6 +300,8 @@ int iris_close(struct file *filp)
>   	mutex_unlock(&inst->lock);
>   	mutex_destroy(&inst->ctx_q_lock);
>   	mutex_destroy(&inst->lock);
> +	kfree(inst->fmt_src);
> +	kfree(inst->fmt_dst);
>   	kfree(inst);

On the face of it I like the logic of moving the kfree() after 
destruction of the various other bits - however the description in the 
log makes me question of the two locks we have are being used correctly ..

Please provide more detail.
> 
>   	return 0;
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260226-fix-use-after-free-of-fmt_src-during-mbpf-abc27f573400
> 
> Best regards,
> --
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 


