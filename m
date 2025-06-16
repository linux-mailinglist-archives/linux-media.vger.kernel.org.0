Return-Path: <linux-media+bounces-34991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB57BADB730
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45C3416A36A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7268C2877F3;
	Mon, 16 Jun 2025 16:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sbHo1M+o"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657D320FAA4;
	Mon, 16 Jun 2025 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750092007; cv=none; b=MQzeAbD526FvBJK3UmFcst91FJBOLa5fTgbg5sml1TJJYU1BHq1XYJ5ViDnCAL6ELvTE/yLpwzKQzSiv2uplcS9YD4ZkIaTFAEo3ybBqkdAKwDBLrvGM5gGWhlEKesARRQQdkVMKcR1jWgvLMLN3hi54IiC5bMZvA4S9iHIcROo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750092007; c=relaxed/simple;
	bh=XfFyFp4FrIaLnJZ5bwtNOzQyxcUbSQvT+2H+xGDEpn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=st982/UuPBvuFzj11zee5yh7sYBaFxmRalHDnqVL1/VlWSFZg3Ju0EvPRPOd4PdNeLEzTqoiM1yqLCbnmh5sKnfhL2JfBJyjyIgWRhLqdo2bjjiuydMPD2cCU7j3OpWL5K+BDSqCa3NGO4J/At6wBa5oVJNSD3ydbdlvOPOk1KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sbHo1M+o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BE6E752;
	Mon, 16 Jun 2025 18:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750091993;
	bh=XfFyFp4FrIaLnJZ5bwtNOzQyxcUbSQvT+2H+xGDEpn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sbHo1M+oN7X6tv/QDVfkjS4ZW63z/ymSOa3MDIpraEBrzcDTlWtqFGmMBjB82Z5iY
	 79DEwxGbko5+TCefxG+AKRzqQi1SG8+jWIQGMDaRWy7tgpR/xeEphN+ZSE8xNTSFBU
	 IaMOtpz3NI2kHoJ4z1jCuwG1EWAmLpThjZC/6UAI=
Date: Mon, 16 Jun 2025 19:39:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: vsp1: vsp1_dl: Count display lists
Message-ID: <20250616163949.GL10542@pendragon.ideasonboard.com>
References: <20250616-vsp1_dl_list_count-v2-0-7d3f43fb1306@ideasonboard.com>
 <20250616-vsp1_dl_list_count-v2-2-7d3f43fb1306@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616-vsp1_dl_list_count-v2-2-7d3f43fb1306@ideasonboard.com>

On Mon, Jun 16, 2025 at 06:30:38PM +0200, Jacopo Mondi wrote:
> To detect leaks of display lists, store in the display list manager the
> number of allocated display lists when the manager is created and verify
> that when the display manager is reset the same number of lists is
> allocated.

"is available in the free list".

> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

I'll update the above when applying.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_dl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> index 18617cbb168703b851a9b437fa62f18425934c68..3713730c6ad8739935851e4da464fc8f23da6180 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> @@ -215,6 +215,7 @@ struct vsp1_dl_list {
>   * @pending: list waiting to be queued to the hardware
>   * @pool: body pool for the display list bodies
>   * @cmdpool: commands pool for extended display list
> + * @list_count: number of allocated display lists
>   */
>  struct vsp1_dl_manager {
>  	unsigned int index;
> @@ -229,6 +230,8 @@ struct vsp1_dl_manager {
>  
>  	struct vsp1_dl_body_pool *pool;
>  	struct vsp1_dl_cmd_pool *cmdpool;
> +
> +	size_t list_count;
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -1078,6 +1081,7 @@ void vsp1_dlm_setup(struct vsp1_device *vsp1)
>  void vsp1_dlm_reset(struct vsp1_dl_manager *dlm)
>  {
>  	unsigned long flags;
> +	size_t list_count;
>  
>  	spin_lock_irqsave(&dlm->lock, flags);
>  
> @@ -1085,8 +1089,11 @@ void vsp1_dlm_reset(struct vsp1_dl_manager *dlm)
>  	__vsp1_dl_list_put(dlm->queued);
>  	__vsp1_dl_list_put(dlm->pending);
>  
> +	list_count = list_count_nodes(&dlm->free);
>  	spin_unlock_irqrestore(&dlm->lock, flags);
>  
> +	WARN_ON_ONCE(list_count != dlm->list_count);
> +
>  	dlm->active = NULL;
>  	dlm->queued = NULL;
>  	dlm->pending = NULL;
> @@ -1155,6 +1162,7 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
>  
>  		list_add_tail(&dl->list, &dlm->free);
>  	}
> +	dlm->list_count = prealloc;
>  
>  	if (vsp1_feature(vsp1, VSP1_HAS_EXT_DL)) {
>  		dlm->cmdpool = vsp1_dl_cmd_pool_create(vsp1,

-- 
Regards,

Laurent Pinchart

