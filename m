Return-Path: <linux-media+bounces-16573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 337DA959F32
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 16:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E560D284ACE
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 14:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09AF1AF4F8;
	Wed, 21 Aug 2024 14:02:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCA3196D90
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724248920; cv=none; b=CD/rTw9xr4CCX7XFhoUbCeszNI4sAXNOQvX6YHSGXzBHsWvTuEAH60I1U1cDHO96Fm+t/eaD5gfu7nG5BFeTxY4hEIrQ9utbq1CfPemN6TapKyE6GZ7try6f3jiY0mDEVKGH3rru5XmVaEUE3244tCJCS5hfIGVvesNQ63RWpMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724248920; c=relaxed/simple;
	bh=Nw9PoAbCvr06Wovy5osXjCkAI3zmdjWQSgqsT0lYhyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUhBcTboUY6WroT0BLAQIc8D17s4fWDBLK08iboCFI4tSPV2YKGmH0uelmMzv20GvxecgBD+CPp9u1YYpI/jteqMAsFgS2FnFYe22XYKcEvlhZZFvOpSQgrSQspUCaWdW1TAFHFdlttIkOog0CQnyt7G2m3OqLJdbIYpdYm7ZTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1sglu2-0005TZ-Nm; Wed, 21 Aug 2024 16:01:34 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1sgltz-0021bs-PB; Wed, 21 Aug 2024 16:01:31 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1sgltz-00FXH2-26;
	Wed, 21 Aug 2024 16:01:31 +0200
Date: Wed, 21 Aug 2024 16:01:31 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: linux-media@vger.kernel.org, Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v2] media: rockchip: rga: fix rga offset lookup
Message-ID: <ZsXzO_Db_OmV4aW2@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	John Keeping <jkeeping@inmusicbrands.com>,
	linux-media@vger.kernel.org, Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
References: <20240810130254.3338363-1-jkeeping@inmusicbrands.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240810130254.3338363-1-jkeeping@inmusicbrands.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Sat, 10 Aug 2024 14:02:54 +0100, John Keeping wrote:
> The arguments to rga_lookup_draw_pos() are passed in the wrong order,
> rotate mode should be before mirror mode.

Thanks for the patch!

> 
> Fixes: 558c248f930e6 ("media: rockchip: rga: split src and dst buffer setup")
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 11c3d72347572..b2ef3beec5258 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -376,7 +376,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
>  	 * Configure the dest framebuffer base address with pixel offset.
>  	 */
>  	offsets = rga_get_addr_offset(&ctx->out, offset, dst_x, dst_y, dst_w, dst_h);
> -	dst_offset = rga_lookup_draw_pos(&offsets, mir_mode, rot_mode);
> +	dst_offset = rga_lookup_draw_pos(&offsets, rot_mode, mir_mode);
>  
>  	dest[(RGA_DST_Y_RGB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
>  		dst_offset->y_off;
> -- 
> 2.46.0
> 
> 

