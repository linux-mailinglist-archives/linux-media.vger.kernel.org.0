Return-Path: <linux-media+bounces-61427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKqZMGd1BGqdJwIAu9opvQ
	(envelope-from <linux-media+bounces-61427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:58:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C338533740
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D16D31CFA93
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7751542EED8;
	Wed, 13 May 2026 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fV9HPaAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A4943D4FA
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676552; cv=none; b=L9CBZK3FvtPgsOlDfJrjKl49ygPQ8nNutLKZ9/4DEJOTUGqARzCd5kMnswWUA5XEzanAg1alRmfh5+pVk9FDR/GECiSoZa9m8/C7t4ecRYcsoime2NG8IHHK0GbpPDt7Bi/k1XUIjY0jcVWxN0RbDmOEC9YqMvaeZwwE12BnhmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676552; c=relaxed/simple;
	bh=7O6IBWVUvm2jpVuyxoa3pMYLctJx4maCmYfCMhHSoec=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=cK7zR12jhLGKuJmu4ENxeC6vgl3dq+mPSNbGiMzdv3fB7YrFJp92WlARyqelc3ZAwOtkv/MVgmLpCuF10z/MYtxfWbSz5ARosZMGXZ2/yr3viV8qkr8PxA3GtwW5C91PxXS4IX0oijov9HJPhtGGRuMrIDgo0a6KsTA+H7fv7Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fV9HPaAJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351B4C2BCC7
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778676551;
	bh=7O6IBWVUvm2jpVuyxoa3pMYLctJx4maCmYfCMhHSoec=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=fV9HPaAJLvhCTjlPg6wYMcj5eZf/cuRgQF5P8P0Fki0IEuRDGb5KaH+YJlsf/a4DA
	 A1jTqAHn2fFp44XkqC9Tr7Jed9MJOSUKhgjZX7F1r85yhPETUjxHGesN9dLaTespsJ
	 qILh0AiFvpI+B+BQUxay1+9s61sELoiqcivPNLcL/P3wZyQExwj4Nl+ytSAoN2k8Ie
	 iiajOk9JNEwLWa+lFNLq24jwYmR7Pvl4rExONmKi6DAOZsqbmUS2R1aea6Vi/Umn1z
	 UTymGPGzh9F0RRc6/CivGxvq2yWIAS+EPd/GaZIF3QXtNyUeG9UxU1TrcM2C/+oqTI
	 hya6V31D6/FNg==
Message-ID: <59f36548-06b7-452a-810b-96e5b25e5573@kernel.org>
Date: Wed, 13 May 2026 14:49:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: vivid: check vb2_is_busy before calling
 vivid_update_format_cap/out
To: Linux Media Mailing List <linux-media@vger.kernel.org>
References: <3016ee7c-9a4f-4fcf-b17f-0dce5bbc9260@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <3016ee7c-9a4f-4fcf-b17f-0dce5bbc9260@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1C338533740
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-61427-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Action: no action

On 13/05/2026 10:52, Hans Verkuil wrote:
> The vivid_update_format_cap/out() functions must only be called if the
> capture/output queue are not busy. But for several controls that is not
> checked.
> 
> Only when streaming starts will they be set to 'grabbed' and it is
> impossible to change the control, but between REQBUFS and STREAMON you
> are still allowed to set these controls. Since vivid_update_format_cap/out
> will change the format, this can cause unexpected results.
> 
> I suspect that this is the cause of this syzbot bug:
> 
> https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89
> 
> But since we never have reproducers, it is hard to be certain. In any case,
> these checks are needed regardless.
> 
> Reported-by: syzbot+dac8f5eaa46837e97b89@syzkaller.appspotmail.com
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Oops, this should be Hans Verkuil <hverkuil+cisco@kernel.org>. Also add:

Fixes: c79aa6aeadb0 ("[media] vivid-capture: add control for reduced frame rate")
Cc: stable@vger.kernel.org

Regards,

	Hans

> ---
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> index f94c15ff84f7..e40ff999cad8 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -608,18 +608,26 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
>  		tpg_s_vflip(&dev->tpg, dev->sensor_vflip ^ dev->vflip);
>  		break;
>  	case VIVID_CID_REDUCED_FPS:
> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> +			return -EBUSY;
>  		dev->reduced_fps = ctrl->val;
>  		vivid_update_format_cap(dev, true);
>  		break;
>  	case VIVID_CID_HAS_CROP_CAP:
> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> +			return -EBUSY;
>  		dev->has_crop_cap = ctrl->val;
>  		vivid_update_format_cap(dev, true);
>  		break;
>  	case VIVID_CID_HAS_COMPOSE_CAP:
> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> +			return -EBUSY;
>  		dev->has_compose_cap = ctrl->val;
>  		vivid_update_format_cap(dev, true);
>  		break;
>  	case VIVID_CID_HAS_SCALER_CAP:
> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> +			return -EBUSY;
>  		dev->has_scaler_cap = ctrl->val;
>  		vivid_update_format_cap(dev, true);
>  		break;
> @@ -1116,14 +1124,20 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
> 
>  	switch (ctrl->id) {
>  	case VIVID_CID_HAS_CROP_OUT:
> +		if (vb2_is_busy(&dev->vb_vid_out_q))
> +			return -EBUSY;
>  		dev->has_crop_out = ctrl->val;
>  		vivid_update_format_out(dev);
>  		break;
>  	case VIVID_CID_HAS_COMPOSE_OUT:
> +		if (vb2_is_busy(&dev->vb_vid_out_q))
> +			return -EBUSY;
>  		dev->has_compose_out = ctrl->val;
>  		vivid_update_format_out(dev);
>  		break;
>  	case VIVID_CID_HAS_SCALER_OUT:
> +		if (vb2_is_busy(&dev->vb_vid_out_q))
> +			return -EBUSY;
>  		dev->has_scaler_out = ctrl->val;
>  		vivid_update_format_out(dev);
>  		break;
> 


