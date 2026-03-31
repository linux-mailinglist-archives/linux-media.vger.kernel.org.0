Return-Path: <linux-media+bounces-57792-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPRvAP7Wy2mILwYAu9opvQ
	(envelope-from <linux-media+bounces-57792-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 16:15:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B397236AC77
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 16:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 431E83038A78
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 14:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7E33FA5D8;
	Tue, 31 Mar 2026 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IS5sQMId"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C330B33F8A2;
	Tue, 31 Mar 2026 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966520; cv=none; b=MZWSzJ1YeDyY+GcDgtrLJaQkY3XLte5NBVWBmsw8b0x0dGn0vX2mE2BYCyo6bhpUFKIWQLbgLAfmHukIBgmXXIWXFXV0ZVnH864M5H0WD7DH3JqA1b6mQrEjN0z5MhJL2ObaaKM6yaW9lX+tiiH/uXjY6Femwl48UXO+NGABJSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966520; c=relaxed/simple;
	bh=HxYTxUP2VKgB0TsZMiUlC/jUy2GXJxnWre9Aj+JWbXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDdtBWWhFoDxuSaqfyD+INRfuP0VofG3NlgIrb3548/TasUcc5+FeNoAcVkngCjlzR5mK7hGR9H9E0YCOCgjqxrnvlgtzLJyPdXSKhQUAkz3NKIsfNcANSMEFAz76ErX00AaW2DJZEE4UEFyDPA53NEZvDoGjHCXuBmWhz/Ufos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IS5sQMId; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8C3C19423;
	Tue, 31 Mar 2026 14:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774966520;
	bh=HxYTxUP2VKgB0TsZMiUlC/jUy2GXJxnWre9Aj+JWbXA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IS5sQMIdLvWsqW4aFtjkStA6aaLq30RX3S+NP/xCgLim9kfilNwLkAPBTCz0HdU8R
	 rczXGxINbrtlYmjUEwwC3uny+cBMWjpFMGKD2CU6sJ3DPimJ0/reGkluIU3CQ385dI
	 LMbOYXhMYfo4rbwBUEdd/4sri5tIPWIO6h9XfWj9XJWh3dQFxUxw3XmyB3TN77dpAE
	 TdFUm0S7uyZNlRcT9N3onjk8aA8bVjVZ3TmW/tUXZtzwDWZBNv3h41fMXSw1Z1oHEG
	 3ehLS9aaN8xxeqYEJutS1O248mMOQqXnQPA9sZC/J9fKFnJco7gJi98csMa+wdGAh5
	 MQd3H71PNnkmA==
Message-ID: <09993b18-157a-48b9-afdc-150697b660f3@kernel.org>
Date: Tue, 31 Mar 2026 15:15:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: iris: add FPS calculation and VPP FW overhead
 in frequency formula
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <gBTTNSRWouIHkWZqgHynz2HHwT-GFpNnPnnJ_uScxTYdGt_rvUKr_0cZdIeruTL3YEbWy43tamhM16u395B_Pw==@protonmail.internalid>
 <20260325-update_fps_calculation-v4-1-13728c0065ff@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260325-update_fps_calculation-v4-1-13728c0065ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57792-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B397236AC77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25/03/2026 16:35, Vishnu Reddy wrote:
> The driver was using a fixed default FPS value when calculating the VPU
> frequency. This caused wrong frequency requests for high‑frame‑rate
> streams, for example 4K at 240 FPS. Because of this, the hardware was
> running at a lower frequency than needed.
> 
> Add the FPS measurement based on the decoder input buffer arrival rate.
> The measured FPS is stored per instance and used in frequency calculation
> instead of the fixed default FPS. The value is clamped so that it does
> not exceed platform limits. Add a VPP firmware overhead when running in
> STAGE_2.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v4:
> - Renamed the variable names (Vikash Garodia)
> - Updated the fps calculation logic (Vikash Garodia)
> - Link to v3: https://lore.kernel.org/r/20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com
> 
> Changes in v3:
> - Updated the frame_count condition check (Vikash Garodia)
> - Link to v2: https://lore.kernel.org/r/20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com
> 
> Changes in v2:
> - Replaced div_u64 with mult_frac (Konrad Dybcio)
> - Link to v1: https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 20 ++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
>   3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 16965150f427..a47cd949645f 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -109,6 +109,8 @@ struct iris_inst {
>   	u32				metadata_idx;
>   	u32				codec;
>   	bool				last_buffer_dequeued;
> +	u64				last_buf_ns;
> +	u32				frame_counter;
>   	u32				frame_rate;
>   	u32				operating_rate;
>   	u32				hfi_rc_type;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 719217399a30..7fb45df37db6 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -54,6 +54,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>   	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>   	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>   	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
> +	inst->frame_rate = MAXIMUM_FPS;
> 
>   	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
>   	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> @@ -369,6 +370,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>   	if (ret)
>   		return ret;
> 
> +	inst->frame_counter = 0;
> +
>   	return iris_process_streamon_input(inst);
>   }
> 
> @@ -411,6 +414,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>   {
>   	struct iris_buffer *buf = to_iris_buffer(vbuf);
>   	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
> +	u64 cur_buf_ns, delta_ns;
>   	struct vb2_queue *q;
>   	int ret;
> 
> @@ -427,6 +431,22 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>   		return 0;
>   	}
> 
> +	if (buf->type == BUF_INPUT) {
> +		cur_buf_ns = ktime_get_ns();
> +
> +		if (!inst->frame_counter)
> +			inst->last_buf_ns = cur_buf_ns;
> +
> +		inst->frame_counter++;
> +		delta_ns = cur_buf_ns - inst->last_buf_ns;
> +
> +		if (delta_ns >= NSEC_PER_SEC) {
> +			inst->frame_rate = clamp_t(u32, inst->frame_counter, DEFAULT_FPS,
> +						   MAXIMUM_FPS);
> +			inst->frame_counter = 0;
> +		}
> +	}
> +
>   	iris_scale_power(inst);
> 
>   	return iris_queue_buffer(inst, buf);
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 548e5f1727fd..d621ccffa868 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
>   	u32 height, width, mbs_per_second, mbpf;
>   	u64 fw_cycles, fw_vpp_cycles;
>   	u64 vsp_cycles, vpp_cycles;
> -	u32 fps = DEFAULT_FPS;
> +	u32 fps = inst->frame_rate;
> 
>   	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
>   	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
> @@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
>   	if (inst->fw_caps[PIPE].value > 1)
>   		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
> 
> +	/* 1.05 is VPP FW overhead */
> +	if (inst->fw_caps[STAGE].value == STAGE_2)
> +		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
> +
>   	vsp_cycles = fps * data_size * 8;
>   	vsp_cycles = div_u64(vsp_cycles, 2);
>   	/* VSP FW overhead 1.05 */
> 
> ---
> base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
> change-id: 20260304-update_fps_calculation-98ee7f7507b1
> 
> Best regards,
> --
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 
> 

Please fix your doxygen.

[[ATTACHMENT|junit/test-kernel-doc.log.txt]]
4 warnings as errors
Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
member 'last_buf_ns' not described in 'iris_inst'
Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
member 'frame_counter' not described in 'iris_inst'
Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
member 'last_buf_ns' not described in 'iris_inst'
Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
member 'frame_counter' not described in 'iris_inst'


System Err:

[[ATTACHMENT|junit/test-kernel-doc.err.txt]]
Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
member 'last_buf_ns' not described in 'iris_inst'
Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
member 'frame_counter' not described in 'iris_inst'
Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
member 'last_buf_ns' not described in 'iris_inst'
Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
member 'frame_counter' not described in 'iris_inst'

---
bod

