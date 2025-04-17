Return-Path: <linux-media+bounces-30497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08456A92C02
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 22:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 273D8467CAF
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 20:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1B12066F4;
	Thu, 17 Apr 2025 20:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y+9sIy38"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F4F2AD0C;
	Thu, 17 Apr 2025 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744920212; cv=none; b=d2+RmqeuXgUr9fsaMvUu8mh5VYAvHkwWLSiWgCBcnwDg/jX5nfx0LNXJ537+XEwZUVTWMozaDbjwHWcBkHzgIXdkgq3URGvRPp7Gafw4gbNIseIAyVKoIQjl9MpSJEklnTMGgsl2V/5DqwqaSPxWhrHhk57Z0uB++nXRhSis6f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744920212; c=relaxed/simple;
	bh=3kGzz5RbO01lQZiY9SyztMocLOyi16RrJFbXQtreFCY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YUTN3xAw7RN5fwaKbIqa038PXHrgFz+sc2aaz7HDMvt+ia+uBN8jk01j2ypXg2HtSU51Bd4rq2RGs1VF+3PCZ3czT2HO5dptlR3hKzyKk7RiVapRNYUuy43UMkMaYP/DWEGnTUmnsvQVCNpAR3tmlfHiIqEAsFO5YTpUf2x6oUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y+9sIy38; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744920207;
	bh=3kGzz5RbO01lQZiY9SyztMocLOyi16RrJFbXQtreFCY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Y+9sIy38KYZRD7PKBv0ajM9D7KuIN3qfrFhyFzsJ76HPNWW04DFo8gxQuMF45fA+W
	 GG5IFhUFBbYnBYreHdWyAuLFCx/tighfCSO2G5Ss1uj1b39oLSgec/Tp/Pjl4XS1E+
	 lAQUNLoE6O/dcVZ5YQf8OL0KUx66BKhMlVlYFq8oih+D3NtBbWsCWLxCKWOk0B/A+0
	 l55meOi8wI9mUXOzmjqe3qgj0kpEh+FeRFqt+wPRXDvdauhVIFB8vgjlfu4U7p9rgq
	 nCELDRdt0KSKS+e/vHCZPS7sOz/DB/0BXOzUM9y7yWZYB+5MtbEgVBY+6BZQmqVqT4
	 Xamz5GwK6aZBA==
Received: from [IPv6:2606:6d00:15:9913::c41] (unknown [IPv6:2606:6d00:15:9913::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23F2B17E0F85;
	Thu, 17 Apr 2025 22:03:26 +0200 (CEST)
Message-ID: <dd9ec68a0a36366b85c65060da050e794ed6948c.camel@collabora.com>
Subject: Re: [PATCH v8 2/3] media: rkvdec: Add get_image_fmt ops
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>, Christopher Obbard
	 <christopher.obbard@linaro.org>
Date: Thu, 17 Apr 2025 16:03:24 -0400
In-Reply-To: <20250417-b4-rkvdec_h264_high10_and_422_support-v8-2-423fe0a2ee7e@collabora.com>
References: 
	<20250417-b4-rkvdec_h264_high10_and_422_support-v8-0-423fe0a2ee7e@collabora.com>
	 <20250417-b4-rkvdec_h264_high10_and_422_support-v8-2-423fe0a2ee7e@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Le jeudi 17 avril 2025 à 13:14 -0400, Nicolas Dufresne a écrit :
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> Add support for a get_image_fmt() ops that returns the required image
> format.
> 
> The CAPTURE format is reset when the required image format changes and
> the buffer queue is not busy.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Christopher Obbard <chris.obbard@collabora.com>
> Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 44 +++++++++++++++++++++++++++++++++--
>  drivers/staging/media/rkvdec/rkvdec.h |  2 ++
>  2 files changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 65c6f1d07a493e017ae941780b823d41314a49b8..db01cc64f1ba2dcd5914537db41e2f51f454b186 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -72,6 +72,15 @@ static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ctx, u32 fourcc,
>  	return false;
>  }
>  
> +static bool rkvdec_fmt_changed(struct rkvdec_ctx *ctx,
> +			       enum rkvdec_image_fmt image_fmt)
> +{
> +	if (image_fmt == RKVDEC_IMG_FMT_ANY)
> +		return false;
> +
> +	return ctx->image_fmt != image_fmt;
> +}
> +
>  static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
>  				       struct v4l2_pix_format_mplane *pix_mp)
>  {
> @@ -111,15 +120,46 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
>  	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +	int ret;
> +
> +	if (desc->ops->try_ctrl) {
> +		ret = desc->ops->try_ctrl(ctx, ctrl);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
> +	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +	enum rkvdec_image_fmt image_fmt;
> +	struct vb2_queue *vq;
>  
> -	if (desc->ops->try_ctrl)
> -		return desc->ops->try_ctrl(ctx, ctrl);
> +	/* Check if this change requires a capture format reset */
> +	if (!desc->ops->get_image_fmt)
> +		return 0;
> +
> +	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
> +	if (rkvdec_fmt_changed(ctx, image_fmt)) {
> +		/* Format changes are not allowed when capture queue is busy */
> +		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +				     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +		if (vb2_is_busy(vq))
> +			return -EINVAL;

Sad to say, but this patch is bad, I've been testing the wrong kernel
all along. This condition is reached before the queue is set (while the
default control value is set). At the point, vq is null. I also came to
realize the rkvdec_fmt_changed() is quite similar to the format match.
I also assumed that if ctx->image_fmt is ANY, we should always reset,
that's why the old code didn't not stumble on this issue.

Please disregard this series, I'll make a v9.

Nicolas

> +
> +		ctx->image_fmt = image_fmt;
> +		rkvdec_reset_decoded_fmt(ctx);
> +	}
>  
>  	return 0;
>  }
>  
>  static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
>  	.try_ctrl = rkvdec_try_ctrl,
> +	.s_ctrl = rkvdec_s_ctrl,
>  };
>  
>  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> index 6f8cf50c5d99aad2f52e321f54f3ca17166ddf98..e466a2753ccfc13738e0a672bc578e521af2c3f2 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.h
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -73,6 +73,8 @@ struct rkvdec_coded_fmt_ops {
>  		     struct vb2_v4l2_buffer *dst_buf,
>  		     enum vb2_buffer_state result);
>  	int (*try_ctrl)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
> +	enum rkvdec_image_fmt (*get_image_fmt)(struct rkvdec_ctx *ctx,
> +					       struct v4l2_ctrl *ctrl);
>  };
>  
>  enum rkvdec_image_fmt {

-- 
Nicolas Dufresne
Principal Engineer at Collabora

