Return-Path: <linux-media+bounces-34918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE9FADB19E
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F2B9165135
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFFE2BEC28;
	Mon, 16 Jun 2025 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RwNE0IMo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CEA322A;
	Mon, 16 Jun 2025 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080068; cv=none; b=ZF1mGUPGGs0hX692V4UIem86HvM2QSsymFxtgBpvtZzrL02A4LiVFMP0YJhbspLogZpCIFoha32XTn2uqNpx+Rtp8e51Y0RS4qim83+rOTsnw03OflqSwNq5qIhw6lITyUNiW+5d9VdXz+un10CIeBabzr04W2NFxDFj49+NhXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080068; c=relaxed/simple;
	bh=b7y+6QUg1+vDkF1/CRKNKxBZL1lupknT8gYBU+POvFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PggSdhMjyvnvWqfaz0Toqk+N/mZ48iJ+JFe19whWZzmVz/059K35dPg9dGt2rvlzVJCtqnyv5s/wpAatzgHJ9OstOIhHxcHkcJie7KnO6YU9JGAFIi3Luq4Chqa+53UAywng0Lo1o6DgDk1BLtLplRKNqnrH95roxnyHdm448no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RwNE0IMo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BB1322A;
	Mon, 16 Jun 2025 15:20:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750080053;
	bh=b7y+6QUg1+vDkF1/CRKNKxBZL1lupknT8gYBU+POvFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RwNE0IMop4TPix+EjU/G9543Zalt6JLwSKPJzemhWlSVkQIWU3BKH7o2AGdBXzVym
	 CTtsAf5heAvSDeXDTfP8YEBzFao3LnEAAChPTJkDsqslVFT4DpzWr7NECQTr7cX5jO
	 LS6aearXskTBj4GYrGycloL+WAR09oYpqdwTyhXk=
Date: Mon, 16 Jun 2025 16:20:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: vsp1: vsp1_dl: Add usage counter
Message-ID: <20250616132049.GA10542@pendragon.ideasonboard.com>
References: <20250529-vsp1_dl_list_count-v1-0-40c6d0e20592@ideasonboard.com>
 <20250529-vsp1_dl_list_count-v1-1-40c6d0e20592@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250529-vsp1_dl_list_count-v1-1-40c6d0e20592@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Thu, May 29, 2025 at 06:36:30PM +0200, Jacopo Mondi wrote:
> In order to detect invalid usage pattern such as double list_put()
> calls, add a usage counter to each display list. Increment it whenever
> a list is get() and decrement it when the list is put(). Warn if the
> usage counter goes below 0.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_dl.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> index bb8228b19824..8a3c0274a163 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> @@ -179,6 +179,7 @@ struct vsp1_dl_cmd_pool {
>   * @has_chain: if true, indicates that there's a partition chain
>   * @chain: entry in the display list partition chain
>   * @flags: display list flags, a combination of VSP1_DL_FRAME_END_*
> + * @usage: usage counter to detect double list free
>   */
>  struct vsp1_dl_list {
>  	struct list_head list;
> @@ -198,6 +199,7 @@ struct vsp1_dl_list {
>  	struct list_head chain;
>  
>  	unsigned int flags;
> +	int usage;

If you have no objection, I'd like to include "count" in the name. This
could be usage_count, ref_count or refcount.

>  };
>  
>  /**
> @@ -617,6 +619,7 @@ struct vsp1_dl_list *vsp1_dl_list_get(struct vsp1_dl_manager *dlm)
>  		 * display list can assert list_empty() if it is not in a chain.
>  		 */
>  		INIT_LIST_HEAD(&dl->chain);
> +		dl->usage++;

The usage count will never go above 1, as there's not real reference
counting for display lists. Better than including "count" in the field
name, we could replace

	int usage;

with

	bool allocated;

(right after has_chain to avoid increasing the structure size).

>  	}
>  
>  	spin_unlock_irqrestore(&dlm->lock, flags);
> @@ -657,6 +660,10 @@ static void __vsp1_dl_list_put(struct vsp1_dl_list *dl)
>  	 */
>  	dl->body0->num_entries = 0;
>  
> +	/* decrement usage count to detect invalid usage pattern. */

s/decrement/Decrement/

> +	if (WARN_ON_ONCE(--dl->usage < 0))
> +		dl->usage = 0;
> +
>  	list_add_tail(&dl->list, &dl->dlm->free);
>  }
>  

-- 
Regards,

Laurent Pinchart

