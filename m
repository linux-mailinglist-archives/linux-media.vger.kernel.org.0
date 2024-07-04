Return-Path: <linux-media+bounces-14663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6517C927E00
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 21:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EB0D285633
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 19:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2124B13CF86;
	Thu,  4 Jul 2024 19:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h54sBJvX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE149651
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 19:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720122719; cv=none; b=Y0pI5fWxjHHW46fsECOWF7E7+NJkppc7LmHVDsdpPcDYSgjYCsNkhGTkMAQZtI+u02CNT8RbW7IqPh6LqFv5cuffCs9g6Xw4VnId66K4qJz08aSqrhjXVrO+s6CnhoMj1b40F844e2RBzkkQPnzhhUx8QcVtqPPtJ2jvINrHgkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720122719; c=relaxed/simple;
	bh=aZf3CNzMGElIX0aMZ/4FEEdMWi82BaR9zhQJ3hhURsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLxvOXA2LlFiRB1+U4ZhU8p9hVBjFrwwvqwhOSytJN+THY2FkwqLldMQZKqp8f1X+qqepBf6R1UlreNycVOCGOq5n9TBWD5rH4CATwKaZ8lmwBzqu5zfB7iGi0dLaXZ1MujRXrI48fb7tFighvTw/b29akAZqw39RVAGLJRhSWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h54sBJvX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-52-146.net.vodafone.it [5.90.52.146])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1402A63D;
	Thu,  4 Jul 2024 21:51:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720122687;
	bh=aZf3CNzMGElIX0aMZ/4FEEdMWi82BaR9zhQJ3hhURsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h54sBJvXdmkRS9RXSMzTlGUMRlUTfZy5X1cRnS9DMffGzXse1Mw6GfNAVw5/CcaXK
	 sOzdM/mtflDDX8r/CPU6wBBcdeOST/PbwGkmOfqQLnLopXGyCeb2a7DfBkURKdRJym
	 7rcVDxH5WG/8DWnwbqvAmJUY84JNdehX8P/f6NYs=
Date: Thu, 4 Jul 2024 21:51:52 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/5] media: rkisp1: Add features mask to extensible
 block handlers
Message-ID: <3pdirik7gkbmjilqjfon7m3clxay2466uimc3htke4mowhjtha@dx24q24f3o5r>
References: <20240704154932.6686-1-laurent.pinchart@ideasonboard.com>
 <20240704154932.6686-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240704154932.6686-3-laurent.pinchart@ideasonboard.com>

On Thu, Jul 04, 2024 at 06:49:29PM GMT, Laurent Pinchart wrote:
> Future ISP parameter blocks for i.MX8MP-specific features will not
> support on Rockchip platforms as they lack the corresponding hardware.
> Introduce a features mask in the extensible block handlers to indicate
> which device features a block require, and ignore blocks that require
> unavailable features.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
> Changes since v1:
>
> - Expand comment
> - Fix feature check test
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index c56365c7c51f..d3a7c7f55db0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1845,6 +1845,7 @@ static const struct rkisp1_ext_params_handler {
>  	size_t size;
>  	rkisp1_block_handler handler;
>  	unsigned int group;
> +	unsigned int features;
>  } rkisp1_ext_params_handlers[] = {
>  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
>  		.size		= sizeof(struct rkisp1_ext_params_bls_config),
> @@ -1951,11 +1952,18 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
>  			&cfg->data[block_offset];
>  		block_offset += block->header.size;
>
> -		/* Make sure the block is in the list of groups to configure. */
> +		/*
> +		 * Make sure the block is supported by the platform and in the
> +		 * list of groups to configure.
> +		 */
>  		block_handler = &rkisp1_ext_params_handlers[block->header.type];
>  		if (!(block_handler->group & block_group_mask))
>  			continue;
>
> +		if ((params->rkisp1->info->features & block_handler->features) !=
> +		    block_handler->features)
> +			continue;
> +
>  		block_handler->handler(params, block);
>
>  		if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE)
> --
> Regards,
>
> Laurent Pinchart
>

