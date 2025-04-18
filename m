Return-Path: <linux-media+bounces-30514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAE1A93225
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 08:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C9A98E2AB3
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 06:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFDC26A0B1;
	Fri, 18 Apr 2025 06:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="rhvzCAfX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0546626A090
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 06:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744958001; cv=none; b=uXbeb9Ik8N7qDHxthIyPg+hnvnoUW5wcH0AUSyYlhUkG8YX1v/zlPbbLOz8xzJzX+UfH4UZcTGaXS8VJx9VsonUGcE1J67TNa9eYpyqtAVJyRIhi/u0NZfPR1v+w7poXDRyRWdgTwe45LuGxb9gN0arTJqlKg42M2QJJ9YD/vds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744958001; c=relaxed/simple;
	bh=ZlP6EPK4+fZnrQcl5kjy+YB9vBk4s18QuHHhKRtoZmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0KbYO0cqUDyEu8NIXy7LP5oK6LnJeoo+ktbctxU3KtowXqAYb8k4cBm60W27jc4YuAPSB40kW1n/TT5uL3P4yf+9jIbBzU1bpf8gc0o8DbuvBLxTS2fbSq6pXn/yKCRcTAoVTsqzo9RtAaEhu5BXd2/MgxD8e0yjw8dbHip+g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=rhvzCAfX; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1744957991;
 bh=LWB/lzW41QdtP1PkM2f6gfH2fV5BGNGd/A9YQFiDNfw=;
 b=rhvzCAfXV839+8f9YwCX+XOQEkNgiszueHyowH/X0ELG+3AEodFwtgXGfh7Pm5vylfS7Z+MkF
 kKID1V/rIlnLgNg1/DnI8wVJB9igXpsk2Vp6j209dLOW7GwivVxGxvT7+HTjIGwpNQTSyycfqHI
 f9VODWhbcjvedZWBatzW8gzMSc1gVyEJSMlm4wdTia9GZKjeyfNyFzq8uGRYwwEssmPO312qGn/
 tiTgR579zzRFtJuVka6MpWqQrmOcrsxHlQrkkPryuONG/aHWBQKj8uvhFpKWhAsSevE+SAOyXV7
 rtX+67JM70SYM0/CC3SC3GvJjT6nuJrNYPIJeCIHmnJg==
X-Forward-Email-ID: 6801efb8c6b251c2d5bebe82
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <8d1c3c82-dbdc-4064-8188-bab586996302@kwiboo.se>
Date: Fri, 18 Apr 2025 08:22:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] media: rkvdec: Add get_image_fmt ops
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250417-b4-rkvdec_h264_high10_and_422_support-v9-0-0e8738ccb46b@collabora.com>
 <20250417-b4-rkvdec_h264_high10_and_422_support-v9-3-0e8738ccb46b@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250417-b4-rkvdec_h264_high10_and_422_support-v9-3-0e8738ccb46b@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nicolas,

On 2025-04-17 23:58, Nicolas Dufresne wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> Add support for a get_image_fmt() ops that returns the required image
> format.
> 
> The CAPTURE format is reset when the required image format changes and
> the buffer queue is not busy.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 35 +++++++++++++++++++++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec.h |  2 ++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 7b780392bb6a63cc954655ef940e87146d2b852f..6c6fe411f48772419e1810d869ab40d168848e65 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -72,6 +72,15 @@ static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ctx, u32 fourcc,
>  	return false;
>  }
>  
> +static bool rkvdec_fmt_changed(struct rkvdec_ctx *ctx,
> +			       enum rkvdec_image_fmt image_fmt)

Just a small nitpick:

Maybe this function should be called rkvdec_image_fmt_changed() and
could be moved closer to rkvdec_image_fmt_match() as those two are
related to image_fmt and not the pixfmt/fourcc.

Regards,
Jonas

> +{
> +	if (image_fmt == RKVDEC_IMG_FMT_ANY)
> +		return false;
> +
> +	return ctx->image_fmt != image_fmt;
> +}
> +
>  static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
>  				       struct v4l2_pix_format_mplane *pix_mp)
>  {
> @@ -118,8 +127,34 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>  	return 0;
>  }
>  
> +static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
> +	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +	enum rkvdec_image_fmt image_fmt;
> +	struct vb2_queue *vq;
> +
> +	/* Check if this change requires a capture format reset */
> +	if (!desc->ops->get_image_fmt)
> +		return 0;
> +
> +	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
> +	if (rkvdec_fmt_changed(ctx, image_fmt)) {
> +		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +				     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +		if (vb2_is_busy(vq))
> +			return -EBUSY;
> +
> +		ctx->image_fmt = image_fmt;
> +		rkvdec_reset_decoded_fmt(ctx);
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
>  	.try_ctrl = rkvdec_try_ctrl,
> +	.s_ctrl = rkvdec_s_ctrl,
>  };
>  
>  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> index 6f8cf50c5d99aad2f52e321f54f3ca17166ddf98..e466a2753ccfc13738e0a672bc578e521af2c3f2 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.h
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -73,6 +73,8 @@ struct rkvdec_coded_fmt_ops {
>  		     struct vb2_v4l2_buffer *dst_buf,
>  		     enum vb2_buffer_state result);
>  	int (*try_ctrl)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
> +	enum rkvdec_image_fmt (*get_image_fmt)(struct rkvdec_ctx *ctx,
> +					       struct v4l2_ctrl *ctrl);
>  };
>  
>  enum rkvdec_image_fmt {
> 


