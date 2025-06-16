Return-Path: <linux-media+bounces-34990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C78EAADB724
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D37916A939
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAE428853B;
	Mon, 16 Jun 2025 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p4SSuKfm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE0C2868BA;
	Mon, 16 Jun 2025 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091941; cv=none; b=ujahZYPfNpEOVsmacAJLvdS1xzCKPBKCl3XGAVncj3KswrsvSylJXw23ViY+814S7z1a4v6agFlzi3VjYDlQuBzfrxp7Nm8//dz5ShI0I/cGxhE1RJs6dANxZiMgvajaagZsXKSUYYwjSxELk55Z6atzXbedeCrL5bjZxrlFdo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091941; c=relaxed/simple;
	bh=EuGE6cVVcNxYoaYzKhSm7D16Dh0B6LSSokYcBxJ+QtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFzGPsxMnspSfa2LjYDotYzfSxr6RWcq0tIlEhVyBJmsUOEfarIPniaZxT7w55z1eMHFMiCvsmFYXP8PdM+p+YCBgJ3zu3UEjjSU1ZzanOwprWbw3Pt7Nsjyiz39KeFVx/6i0MrYwTP6MQRR4DxV0WyObmVl6oqbGJEzKWJEhDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p4SSuKfm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53C9A752;
	Mon, 16 Jun 2025 18:38:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750091926;
	bh=EuGE6cVVcNxYoaYzKhSm7D16Dh0B6LSSokYcBxJ+QtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4SSuKfmKzJyQXEwCW2yutLQyaMWFS+h3GRdy9JtmvGU4KXeklLwb5pGUW1rPcQmw
	 idacuv7LMt/ds1R4XkUfOldJcQriu9CASSqhzsYmLNXFvVh321oj43UpA2dHXQw9vS
	 kh0G18kO+bZ5T8/7axr0CzsoLyabD5tbWLMouzDc=
Date: Mon, 16 Jun 2025 19:38:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: vsp1: vsp1_dl: Detect double list release
Message-ID: <20250616163842.GK10542@pendragon.ideasonboard.com>
References: <20250616-vsp1_dl_list_count-v2-0-7d3f43fb1306@ideasonboard.com>
 <20250616-vsp1_dl_list_count-v2-1-7d3f43fb1306@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616-vsp1_dl_list_count-v2-1-7d3f43fb1306@ideasonboard.com>

Hi Jacopo,

On Mon, Jun 16, 2025 at 06:30:37PM +0200, Jacopo Mondi wrote:
> In order to detect invalid usage pattern such as double list_put()
> calls, add an 'allocated' flag to each display list. Set the flag
> whenever a list is get() and clear it when the list is put(). Warn if a
> list not marked as allocated is returned to the pool of available
> display lists.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_dl.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> index bb8228b198249943399719b5f37c337fc43eed5b..18617cbb168703b851a9b437fa62f18425934c68 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> @@ -176,6 +176,7 @@ struct vsp1_dl_cmd_pool {
>   * @bodies: list of extra display list bodies
>   * @pre_cmd: pre command to be issued through extended dl header
>   * @post_cmd: post command to be issued through extended dl header
> + * @allocated: flag to detect double list release
>   * @has_chain: if true, indicates that there's a partition chain
>   * @chain: entry in the display list partition chain
>   * @flags: display list flags, a combination of VSP1_DL_FRAME_END_*
> @@ -194,6 +195,8 @@ struct vsp1_dl_list {
>  	struct vsp1_dl_ext_cmd *pre_cmd;
>  	struct vsp1_dl_ext_cmd *post_cmd;
>  
> +	bool allocated;
> +
>  	bool has_chain;
>  	struct list_head chain;
>  
> @@ -617,6 +620,7 @@ struct vsp1_dl_list *vsp1_dl_list_get(struct vsp1_dl_manager *dlm)
>  		 * display list can assert list_empty() if it is not in a chain.
>  		 */
>  		INIT_LIST_HEAD(&dl->chain);
> +		dl->allocated = true;
>  	}
>  
>  	spin_unlock_irqrestore(&dlm->lock, flags);
> @@ -657,6 +661,13 @@ static void __vsp1_dl_list_put(struct vsp1_dl_list *dl)
>  	 */
>  	dl->body0->num_entries = 0;
>  
> +	/*
> +	 * Return the display list to the 'free' pool. If the list had already
> +	 * been returned be loud about it.
> +	 */
> +	WARN_ON_ONCE(!dl->allocated);
> +	dl->allocated = false;
> +
>  	list_add_tail(&dl->list, &dl->dlm->free);
>  }
>  

-- 
Regards,

Laurent Pinchart

