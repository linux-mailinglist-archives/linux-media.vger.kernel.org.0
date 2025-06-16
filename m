Return-Path: <linux-media+bounces-34925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D10ADB1FB
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BE92188C7A6
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5AA2877E4;
	Mon, 16 Jun 2025 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="edFZTSDf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A922877C3;
	Mon, 16 Jun 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080713; cv=none; b=Jux8vc5iQNXv3JhEdrfh9tsnF7LVoYQj7Bo90a+0GDxY5iKUnXqp29TIPnDMFekYr7B6tq8E6E03Au8Jt7qBHE66kjuHwXN9yh06mRwkHRAsaBKrjvLqioTbzDouvmuw9GzoxCsLll8n+p+kX4nR7vLGLu9jUoQK4kX+GGRyTe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080713; c=relaxed/simple;
	bh=YpM6x3pVZDq98sI2oYH3/tGiaLSYiy/AHMV6/X76vdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qk9lxM9v3FyNArtxTUppIq8qwlItIzbzUvBuQLVxgGUQew5q5MDOyLIJyIaDpVkeOjI41DkRMBCkp8JDb3f0tRXLSaLFboUk+IDc+0WOr4PhuCcdQ60NBRnP6ZsEOhLYYt25MRTuN8/DsGcy7YBy6VdO23q/ukH+fpno+MZyxck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=edFZTSDf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C30722A;
	Mon, 16 Jun 2025 15:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750080698;
	bh=YpM6x3pVZDq98sI2oYH3/tGiaLSYiy/AHMV6/X76vdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=edFZTSDfDpb+n/GAtPn9b8ktvswaT0Bq85r7H0riKjD4vvWn/kAB9kUSJ4/8yDc2x
	 DA2ohGehZFrv+ZXHbkpU5E2gAkdglkCspPw2Q6c+67VDGr9ZMYH6Kd061M+1qGlCcF
	 Ll9/dp4bue/9FhWsV3aGPibOT6dDZTnF8FKqRAyI=
Date: Mon, 16 Jun 2025 16:31:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: vsp1: vsp1_dl: Count display lists
Message-ID: <20250616133134.GC10542@pendragon.ideasonboard.com>
References: <20250529-vsp1_dl_list_count-v1-0-40c6d0e20592@ideasonboard.com>
 <20250529-vsp1_dl_list_count-v1-2-40c6d0e20592@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250529-vsp1_dl_list_count-v1-2-40c6d0e20592@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Thu, May 29, 2025 at 06:36:31PM +0200, Jacopo Mondi wrote:
> To detect invalid usage patterns of the display list helpers, store

We can be more precise:

"To detect leaks of display lists, ..."

> in the display list manager the number of available display lists

s/available/allocated/

> when the manager is created and verify that when the display manager
> is reset the same number of lists is available.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_dl.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> index 8a3c0274a163..5c4eeb65216f 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> @@ -214,6 +214,7 @@ struct vsp1_dl_list {
>   * @pending: list waiting to be queued to the hardware
>   * @pool: body pool for the display list bodies
>   * @cmdpool: commands pool for extended display list
> + * @list_count: display list counter

"number of allocated display lists"

>   */
>  struct vsp1_dl_manager {
>  	unsigned int index;
> @@ -228,6 +229,8 @@ struct vsp1_dl_manager {
>  
>  	struct vsp1_dl_body_pool *pool;
>  	struct vsp1_dl_cmd_pool *cmdpool;
> +
> +	size_t list_count;
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -1073,7 +1076,9 @@ void vsp1_dlm_setup(struct vsp1_device *vsp1)
>  
>  void vsp1_dlm_reset(struct vsp1_dl_manager *dlm)
>  {
> +	size_t dlm_list_count;
>  	unsigned long flags;
> +	size_t list_count;
>  
>  	spin_lock_irqsave(&dlm->lock, flags);
>  
> @@ -1081,8 +1086,13 @@ void vsp1_dlm_reset(struct vsp1_dl_manager *dlm)
>  	__vsp1_dl_list_put(dlm->queued);
>  	__vsp1_dl_list_put(dlm->pending);
>  
> +	list_count = list_count_nodes(&dlm->free);
> +	dlm_list_count = dlm->list_count;

dlm->list_count is not documented as protected by the lock. I don't
think that's an oversight, as it can only be set when the dlm is
created. You can drop the dlm_list_count variable and use
dlm->list_count below.

> +
>  	spin_unlock_irqrestore(&dlm->lock, flags);
>  
> +	WARN_ON_ONCE(list_count != dlm_list_count);
> +
>  	dlm->active = NULL;
>  	dlm->queued = NULL;
>  	dlm->pending = NULL;
> @@ -1150,6 +1160,7 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
>  				      + sizeof(*dl->header);
>  
>  		list_add_tail(&dl->list, &dlm->free);
> +		dlm->list_count = list_count_nodes(&dlm->free);

Does this need to be done inside the loop, can't you just write

	dlm->list_count = prealloc;

after the loop ?

>  	}
>  
>  	if (vsp1_feature(vsp1, VSP1_HAS_EXT_DL)) {

-- 
Regards,

Laurent Pinchart

