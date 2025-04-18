Return-Path: <linux-media+bounces-30542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D03DA9370C
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 14:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C749217678D
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 12:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DBA2749ED;
	Fri, 18 Apr 2025 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hvAAh2qT"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1451A3168;
	Fri, 18 Apr 2025 12:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744979329; cv=none; b=dIXbIg5s+pqgxn3BEywNdrVWi3oSP5UlQxYop94xlaw+sJmedGfy3h5DcfNDYHZMb7j1ql+Mr7VxpuxNQwTC2xvsCsxnj+cJy2h8m5jqBpI/4AUTV8nJuiODYmrsbuMabR6F0FDpBbUCo3ErG5DxIZ8u8ngBecK0HXdktJ2XwNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744979329; c=relaxed/simple;
	bh=lYG0KfV33Uwr1Ob7HNyhn/2xoAxGlPJZBkB55E4P6aQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A3iob2GsmHJ+NRpouKJWi14S71c6/1GyXPhPTHTsrDAIYgg2PaQjF34+91tt7M5DrgS8ybuMkXPGrMCz3jf3E+r9ndJXubCf2g4F9l/ECxw2XuHYxxl03E5R0jdMnoZqYjBSsLb3+cV1qhLzap4SHc8UsgypxRMWDrZ+zjlzh3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hvAAh2qT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744979318;
	bh=lYG0KfV33Uwr1Ob7HNyhn/2xoAxGlPJZBkB55E4P6aQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hvAAh2qTxnkbKjOiu3fdw6pfGvlvVlSa81V9eaDcW/iMjRXjaPRNwCzkI7IKmGqWn
	 /XkHnGx77ddnC86k8vzo12qipvxl9Pf9Lq53hLZJ1/1J3rwtykKnuBYYjY2y6K00p4
	 mKPk4XG8tz7HBrI/HasI09Tj3MCf6h9ChCx+p4NyxB2oc1ye4ib/jxN9mgNzKBQ6+c
	 HDFeK35qHjTSy3gdfDiTibNnfpw4By7l0TRVGNGlUZOHfMWpkvt699QOMhHcLoyObt
	 f27iDZrKtEUKQ1yEJNtl7jnFAZ3h2n63uMHQXBxl8LlsLCMkMEOVPQTZgnNSm3bqSg
	 Ymgd+X9iESMog==
Received: from [IPv6:2606:6d00:15:9913::5ac] (unknown [IPv6:2606:6d00:15:9913::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ABD8D17E00F0;
	Fri, 18 Apr 2025 14:28:37 +0200 (CEST)
Message-ID: <4be400281b3fe53b724025ffa837ceed777d7699.camel@collabora.com>
Subject: Re: [PATCH v9 3/4] media: rkvdec: Add get_image_fmt ops
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 18 Apr 2025 08:28:35 -0400
In-Reply-To: <8d1c3c82-dbdc-4064-8188-bab586996302@kwiboo.se>
References: 
	<20250417-b4-rkvdec_h264_high10_and_422_support-v9-0-0e8738ccb46b@collabora.com>
	 <20250417-b4-rkvdec_h264_high10_and_422_support-v9-3-0e8738ccb46b@collabora.com>
	 <8d1c3c82-dbdc-4064-8188-bab586996302@kwiboo.se>
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

Le vendredi 18 avril 2025 à 08:22 +0200, Jonas Karlman a écrit :
> Hi Nicolas,
> 
> On 2025-04-17 23:58, Nicolas Dufresne wrote:
> > From: Jonas Karlman <jonas@kwiboo.se>
> > 
> > Add support for a get_image_fmt() ops that returns the required image
> > format.
> > 
> > The CAPTURE format is reset when the required image format changes and
> > the buffer queue is not busy.
> > 
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> >  drivers/staging/media/rkvdec/rkvdec.c | 35 +++++++++++++++++++++++++++++++++++
> >  drivers/staging/media/rkvdec/rkvdec.h |  2 ++
> >  2 files changed, 37 insertions(+)
> > 
> > diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> > index 7b780392bb6a63cc954655ef940e87146d2b852f..6c6fe411f48772419e1810d869ab40d168848e65 100644
> > --- a/drivers/staging/media/rkvdec/rkvdec.c
> > +++ b/drivers/staging/media/rkvdec/rkvdec.c
> > @@ -72,6 +72,15 @@ static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ctx, u32 fourcc,
> >  	return false;
> >  }
> >  
> > +static bool rkvdec_fmt_changed(struct rkvdec_ctx *ctx,
> > +			       enum rkvdec_image_fmt image_fmt)
> 
> Just a small nitpick:
> 
> Maybe this function should be called rkvdec_image_fmt_changed() and
> could be moved closer to rkvdec_image_fmt_match() as those two are
> related to image_fmt and not the pixfmt/fourcc.

Applied locally. With this change, may I have your Rb ?

thanks,
Nicolas

> 
> Regards,
> Jonas
> 
> > +{
> > +	if (image_fmt == RKVDEC_IMG_FMT_ANY)
> > +		return false;
> > +
> > +	return ctx->image_fmt != image_fmt;
> > +}
> > +
> >  static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
> >  				       struct v4l2_pix_format_mplane *pix_mp)
> >  {
> > @@ -118,8 +127,34 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
> >  	return 0;
> >  }
> >  
> > +static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
> > +	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> > +	enum rkvdec_image_fmt image_fmt;
> > +	struct vb2_queue *vq;
> > +
> > +	/* Check if this change requires a capture format reset */
> > +	if (!desc->ops->get_image_fmt)
> > +		return 0;
> > +
> > +	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
> > +	if (rkvdec_fmt_changed(ctx, image_fmt)) {
> > +		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> > +				     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > +		if (vb2_is_busy(vq))
> > +			return -EBUSY;
> > +
> > +		ctx->image_fmt = image_fmt;
> > +		rkvdec_reset_decoded_fmt(ctx);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
> >  	.try_ctrl = rkvdec_try_ctrl,
> > +	.s_ctrl = rkvdec_s_ctrl,
> >  };
> >  
> >  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
> > diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> > index 6f8cf50c5d99aad2f52e321f54f3ca17166ddf98..e466a2753ccfc13738e0a672bc578e521af2c3f2 100644
> > --- a/drivers/staging/media/rkvdec/rkvdec.h
> > +++ b/drivers/staging/media/rkvdec/rkvdec.h
> > @@ -73,6 +73,8 @@ struct rkvdec_coded_fmt_ops {
> >  		     struct vb2_v4l2_buffer *dst_buf,
> >  		     enum vb2_buffer_state result);
> >  	int (*try_ctrl)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
> > +	enum rkvdec_image_fmt (*get_image_fmt)(struct rkvdec_ctx *ctx,
> > +					       struct v4l2_ctrl *ctrl);
> >  };
> >  
> >  enum rkvdec_image_fmt {
> > 
> 

