Return-Path: <linux-media+bounces-14684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F160B9287FE
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 13:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BEED1F2494F
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 11:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BEEC14A0B3;
	Fri,  5 Jul 2024 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MYuWJaKy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339B1145FFE
	for <linux-media@vger.kernel.org>; Fri,  5 Jul 2024 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720179102; cv=none; b=kKD46mQVpgJEdekGtURVCqahjpgjdUG+wRokMHWPLNAn+lTT8+ZE3wsfq5uVZHHQiyrjvHSl5WNfHtceQ66+IyxUuN+srPS11v12Wheexy8Az63jfA7fQ+SPwe5P8jBDaU65qB8bVzk/7O4bAa8W7idVUwflYGnQZP477tBtO9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720179102; c=relaxed/simple;
	bh=6nAZ56tZ8Xajf/zgxrvCuujmdT2G6Y15Yvof0kUsHJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMt6u59KahXlIxZ8C0IC97C/1Iy6aY2jt5rWmP5uwlY1fbgpl/vepmQzuiyowUPOteLZ/1pgFkuAdo7wFxd7kIaHUMnV/fO1q7OmNBqU8Z9G9eOcm/hrVUMsaH0l+dx521eOZSjZPF+TMr9NmvHJ6b0IMmT24a2ghPHQnlWvJ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MYuWJaKy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BF6B541;
	Fri,  5 Jul 2024 13:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720179070;
	bh=6nAZ56tZ8Xajf/zgxrvCuujmdT2G6Y15Yvof0kUsHJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MYuWJaKyt5/GXdrDpgpQo68Do9LeImY0hJB1eKvvmbGnzqVydKY1bOzXI20P052xr
	 /juN1N0yk+K2a1fqul6GS/O8bDJTdsuCt2lGTWcWe5b4iFg7o+JnM52EVLdumV8fHQ
	 Cr/BEI4An4fK54of6LULAhJW/mMRc9fMoDTz2168=
Date: Fri, 5 Jul 2024 20:31:31 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/5] media: rkisp1: Add features mask to extensible
 block handlers
Message-ID: <ZofZk0yD40Hsgbrl@pyrite.rasen.tech>
References: <20240704154932.6686-1-laurent.pinchart@ideasonboard.com>
 <20240704154932.6686-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704154932.6686-3-laurent.pinchart@ideasonboard.com>

On Thu, Jul 04, 2024 at 06:49:29PM +0300, Laurent Pinchart wrote:
> Future ISP parameter blocks for i.MX8MP-specific features will not
> support on Rockchip platforms as they lack the corresponding hardware.
> Introduce a features mask in the extensible block handlers to indicate
> which device features a block require, and ignore blocks that require
> unavailable features.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

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

