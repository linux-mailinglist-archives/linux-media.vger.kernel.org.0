Return-Path: <linux-media+bounces-67634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +3/OB5FFV2qvIQEAu9opvQ
	(envelope-from <linux-media+bounces-67634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:32:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 022DC75BE88
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:32:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hLvqPZif;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67634-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67634-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 252403003BD8
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 08:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AE23CCFAF;
	Wed, 15 Jul 2026 08:32:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1013927A91D;
	Wed, 15 Jul 2026 08:32:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104331; cv=none; b=OayLEGB4bhBzAqyxiHfhB2aotCNlbEgw4vh1IXxiiTYXmhtaNh0FGVck6ABo4IvF8QMrBxZUfWKLimzgIQfcMyBNVAqu6BPPyZaFG/K3relbi6ccKkkOUxD12ewtguTRSk1SvNUQrUX/HQihMyw5qUbPxQTH8OzuhcPRYb1+fZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104331; c=relaxed/simple;
	bh=VdgvCK/DEqos+tWO5AzNwxX7DxDwPVMJyr33E1EKcKQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lFDgwEiFGeKWbZQmOC8Xgjk2U/UHvdBjM7awcnj677GjBU0KXtMOpImtoc7B98jNL4zj9jCyt9pPI6ji7864hLML1SDy52CCBfqDarJ7Ii0KNW9kI3kG51RUNNAuWZCIEPt9nKLHGdg0insdhXxRBdphNPg0lMdZgvPfvPM5bqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLvqPZif; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C22B1F000E9;
	Wed, 15 Jul 2026 08:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784104329;
	bh=Rv/WkuhxEmVUjKZPLywY5nPLg9cMq0vAok56zknF3Nk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=hLvqPZif2ftOlKR0HnL/JKQjlgidV43UKiPa7KUafE+twJqDCgFyjMCt8FKbHjp6k
	 4STxhrb9q8DfXfozEuMa5rRu9sEWqhBuTZn6tZCjtrk70LsD1DQx7tWim0sF+E8zNa
	 4Xf03snqC7qW58dn2VhHis9kWhubGvopV1XNqrrFTYJvoALZIJB1TjSX6iy5ni8CLJ
	 nXrLS3m6lb+0Go0RhrY5DTfCJqgPyfveeR6xB4Ra5YgzCYJoDsfwgubV32YOaO8cUR
	 r2INB6xTAdn0+riQtT821zjlqjZhey6NresU+MS70P/84oWCZgqkKK8Be8TduV16IF
	 Gfu78VSC6UFag==
Message-ID: <1ef14047-f385-4163-ad9d-414702f45695@kernel.org>
Date: Wed, 15 Jul 2026 10:32:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 2/3] media: v4l2-core: Add support for video encoder
 ROI control
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
 <20260714-enc_roi_enable-v2-2-63683f9dbcef@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260714-enc_roi_enable-v2-2-63683f9dbcef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67634-lists,linux-media=lfdr.de,cisco];
	FORGED_RECIPIENTS(0.00)[m:deepa.madivalara@oss.qualcomm.com,m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 022DC75BE88

On 14/07/2026 21:00, Deepa Guthyappa Madivalara wrote:
> Add necessary support for controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
> and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-api.c  |  1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 40 +++++++++++++++++++++++++++++--
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++++++
>  include/media/v4l2-ctrls.h                |  3 ++-
>  4 files changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>  	case V4L2_CTRL_TYPE_U8:
>  	case V4L2_CTRL_TYPE_U16:
>  	case V4L2_CTRL_TYPE_U32:
> +	case V4L2_CTRL_TYPE_S8:
>  		if (ctrl->is_array)
>  			return -EINVAL;
>  		ret = check_range(ctrl->type, min, max, step, def);
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index ba047d7d86010bf0cf8f8fbf2dc343883d6bdae0..15b69dce0127e7c8546c2d23ae5458ace10301a0 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -287,6 +287,14 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>  			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
>  		}
>  		break;
> +	case V4L2_CTRL_TYPE_S8:
> +		if (value) {
> +			for (i = from_idx; i < tot_elems; i++)
> +				ptr.p_s8[i] = value;
> +		} else {
> +			memset(ptr.p_s8 + from_idx, 0, elems * sizeof(s8));
> +		}
> +		break;
>  	default:
>  		for (i = from_idx; i < tot_elems; i++) {
>  			switch (which) {
> @@ -367,6 +375,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_U32:
>  		pr_cont("%u", (unsigned)*ptr.p_u32);
>  		break;
> +	case V4L2_CTRL_TYPE_S8:
> +		pr_cont("%d", *ptr.p_s8);
> +		break;
>  	case V4L2_CTRL_TYPE_AREA:
>  		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
>  		break;
> @@ -481,6 +492,21 @@ EXPORT_SYMBOL(v4l2_ctrl_type_op_log);
>  	0;							\
>  })
>  
> +#define ROUND_TO_RANGE_SIGNED(val, offset_type, ctrl)			\
> +({								\
> +	offset_type offset;					\
> +	if ((ctrl)->maximum >= 0 &&				\
> +	    val >= (ctrl)->maximum - (s32)((ctrl)->step / 2))	\
> +		val = (ctrl)->maximum;				\
> +	else							\
> +		val += (s32)((ctrl)->step / 2);			\
> +	val = clamp_t(typeof(val), val,				\
> +		      (ctrl)->minimum, (ctrl)->maximum);	\
> +	offset = (val) - (ctrl)->minimum;			\
> +	offset = (ctrl)->step * (offset / (s32)(ctrl)->step);	\
> +	val = (ctrl)->minimum + offset;				\
> +})

Why is this new define needed? I think you can just use ROUND_TO_RANGE.

Regards,

	Hans

> +
>  /* Validate a new control */
>  
>  #define zero_padding(s) \
> @@ -1365,6 +1391,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  			return -EINVAL;
>  		break;
>  
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1378,6 +1406,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>  	size_t len;
>  	u64 offset;
>  	s64 val;
> +	s32 tmp;
>  
>  	switch ((u32)ctrl->type) {
>  	case V4L2_CTRL_TYPE_INTEGER:
> @@ -1403,7 +1432,11 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>  		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
>  	case V4L2_CTRL_TYPE_U32:
>  		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
> -
> +	case V4L2_CTRL_TYPE_S8:
> +		tmp = ptr.p_s8[idx];
> +		ROUND_TO_RANGE_SIGNED(tmp, s32, ctrl);
> +		ptr.p_s8[idx] = (s8)tmp;
> +		return 0;
>  	case V4L2_CTRL_TYPE_BOOLEAN:
>  		ptr.p_s32[idx] = !!ptr.p_s32[idx];
>  		return 0;
> @@ -1556,6 +1589,7 @@ void cur_to_new(struct v4l2_ctrl *ctrl)
>  		return;
>  	if (ctrl->is_dyn_array)
>  		ctrl->new_elems = ctrl->elems;
> +
>  	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
>  }
>  
> @@ -1998,6 +2032,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_U32:
>  		elem_size = sizeof(u32);
>  		break;
> +	case V4L2_CTRL_TYPE_S8:
> +		elem_size = sizeof(s8);
> +		break;
>  	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
>  		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
>  		break;
> @@ -2215,7 +2252,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  
>  	if (flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
>  		void *ptr = ctrl->p_def.p;
> -
>  		if (p_min.p_const) {
>  			ptr += elem_size;
>  			ctrl->p_min.p = ptr;
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd398dfb97f4ba0085 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>  	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta QP";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
>  
>  	/* VPX controls */
>  	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
> @@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>  		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
> +		*type = V4L2_CTRL_TYPE_S8;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
> +		*type = V4L2_CTRL_TYPE_U8;
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		break;
>  	default:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index a1806ddbc797efa52e83cd3f685ef70d5b5483d2..9a68a3555e349f1e55aa01af5c10f08201d62bae 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -27,6 +27,7 @@ struct video_device;
>  
>  /**
>   * union v4l2_ctrl_ptr - A pointer to a control value.
> + * @p_s8:			Pointer to a 8-bit signed value.
>   * @p_s32:			Pointer to a 32-bit signed value.
>   * @p_s64:			Pointer to a 64-bit signed value.
>   * @p_u8:			Pointer to a 8-bit unsigned value.
> @@ -61,10 +62,10 @@ struct video_device;
>   * @p_const:			Pointer to a constant compound value.
>   */
>  union v4l2_ctrl_ptr {
> +	s8 *p_s8;
>  	s32 *p_s32;
>  	s64 *p_s64;
>  	u8 *p_u8;
> -	s8 *p_s8;
>  	u16 *p_u16;
>  	u32 *p_u32;
>  	char *p_char;
> 


