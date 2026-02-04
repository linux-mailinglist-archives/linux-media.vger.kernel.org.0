Return-Path: <linux-media+bounces-52176-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLFdLZMvg2kwjAMAu9opvQ
	(envelope-from <linux-media+bounces-52176-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 12:37:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4EBE5359
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 12:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA323301BF76
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 11:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AC43E9583;
	Wed,  4 Feb 2026 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ksSdqiXU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085243D5259;
	Wed,  4 Feb 2026 11:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205034; cv=none; b=t03xHwT6YhIyZN0ZF4ooa3c843eSTxmuwcZTxZ6KiTtOo3Lt8lwMdQ15Q1JE12RmvkW1Q7Ox+yowYFcJgjYUagUg80hpmEq/njqyfOgJnTjrT/bzmgDEFim4XhpPWrsTExvVBs3bk0rM3E4qAgpochT+qjaB7KfuPyWHahNzfxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205034; c=relaxed/simple;
	bh=Ej3KL0sC5zb1ZESyYIKgtPgiVBwvQfrer86L8393e4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAkeqsvhKyfc8RMFg3QUZSINlNCUXyKzu4m7MNxGxxcXHcbI5vZBNFgOFfLYizcBNwB/dcuEks+g2RszAmCk0jFG0hMBvyW13TfTUJ97ovCLmqwfu+kGQqjWUPvZmA8Zwl1ObSrFHRnSJk5mSv/xe4mEdOfIyCTtRpADJtYxHrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ksSdqiXU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4214F13D7;
	Wed,  4 Feb 2026 12:36:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770204990;
	bh=Ej3KL0sC5zb1ZESyYIKgtPgiVBwvQfrer86L8393e4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ksSdqiXUzolRSKMLCYomaVvVwE+l7IeexfwSYN6Wlwg3ZWoQcu0//VYNIwC+X7C7I
	 cfgi6sPYE1KFn0HD9mmPL1Eokc6NsxMcwPpgWbxfeV+qqci1Hma3MpHW9c2Ei+9w9o
	 rYhJKaSL1/Zy1glZPcsKqROqZPvH5yEShYSOvFCo=
Date: Wed, 4 Feb 2026 13:37:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dafna@fastmail.com, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/6] media: rkisp1-isp: Add target_format
Message-ID: <20260204113710.GA156228@killaraus>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
 <20260204112506.3706049-4-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204112506.3706049-4-isaac.scott@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52176-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,fastmail.com,kernel.org,sntech.de,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A4EBE5359
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 11:25:03AM +0000, Isaac Scott wrote:
> In passthough mode, we want to make sure the output format of the ISP is
> identical to the input format. Add logic to ensure the format we
> configure the output of the ISP with is the sink format when we are in
> bypass, and the source format if we are not.

I don't think that's right. In bypass mode, userspace needs to configure
the same format on the image sink and image source pads of the ISP, and
not set any cropping. The crop rectangle on the source pad should
contain the information you need.

> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index f636d738b7e8..716bd7f3c66d 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -175,9 +175,10 @@ static void rkisp1_gasket_disable(struct rkisp1_device *rkisp1)
>  static void rkisp1_config_ism(struct rkisp1_isp *isp,
>  			      const struct v4l2_subdev_state *sd_state)
>  {
> -	const struct v4l2_rect *src_crop =
> +	const struct v4l2_rect *target_crop =
>  		v4l2_subdev_state_get_crop(sd_state,
> -					   RKISP1_ISP_PAD_SOURCE_VIDEO);
> +			(isp->rkisp1->in_bypass ?
> +				RKISP1_ISP_PAD_SINK_VIDEO : RKISP1_ISP_PAD_SOURCE_VIDEO));
>  	struct rkisp1_device *rkisp1 = isp->rkisp1;
>  	u32 val;
>  
> @@ -185,10 +186,10 @@ static void rkisp1_config_ism(struct rkisp1_isp *isp,
>  	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_MAX_DX, 0);
>  	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_MAX_DY, 0);
>  	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_DISPLACE, 0);
> -	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_OFFS, src_crop->left);
> -	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_OFFS, src_crop->top);
> -	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_SIZE, src_crop->width);
> -	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_SIZE, src_crop->height);
> +	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_OFFS, target_crop->left);
> +	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_OFFS, target_crop->top);
> +	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_SIZE, target_crop->width);
> +	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_SIZE, target_crop->height);
>  
>  	/* IS(Image Stabilization) is always on, working as output crop */
>  	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_CTRL, 1);

-- 
Regards,

Laurent Pinchart

