Return-Path: <linux-media+bounces-49600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0257CDFCA9
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 14:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DCA23011402
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 13:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F010131DD90;
	Sat, 27 Dec 2025 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v4nZdIsh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7014E20DD48;
	Sat, 27 Dec 2025 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766840735; cv=none; b=RmhlBmdApHCBdslg+u2SohAeaumBLFgBm1PfaiYlKsosYcwEjz/DzSJDqZjavIvzBFGPcTuvtPOB87rhxLJAetCzJ78JPB2ypeQB2Ye5s7HS9Em2lR1/dTOu1+mi866FDyQ4RzAyqOq8ajaduSpZk1VsPdUWihBMgrHuByUHNWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766840735; c=relaxed/simple;
	bh=IUFXjRD42LkMq41oQTfGOgsCntXLWjfSd8D8t/Qbfxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSyPHKkqC5TiN/ygnkB5AjXyO1cS7msJqy4zNteNAkeP3smlDhtAbZmenTDIg67l70RdxP+5lOmzKm+fqGWvkhrWN3wuG6kE3XUKH6ajpjOPiDd6wSDvY7qInEvYzAF+2sp3Ted3x/j2zQtdAL5nltmpqS/jvJVgP7YUYMIkqLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v4nZdIsh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 76D4BBB;
	Sat, 27 Dec 2025 14:05:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766840717;
	bh=IUFXjRD42LkMq41oQTfGOgsCntXLWjfSd8D8t/Qbfxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v4nZdIsh72hj9xST3eH373h1GaYQ2ctXOniUGts3AAs7txUH6dFpI52fmYJOqCuw+
	 q9MAffMIPVz1amBg60hKOfnOrzJEkJM7H8NvJXie1dk9eLImqJWbV1gJYNqR5FPqmB
	 1MZwqdqFgWNpsrNrz3JoVZLY97oM7Cnnggh+n0LM=
Date: Sat, 27 Dec 2025 15:05:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: renesas: rzg2l-cru: Fix possible ERR_PTR
 dereference in rzg2l_cru_get_virtual_channel()
Message-ID: <20251227130514.GA21104@pendragon.ideasonboard.com>
References: <20251227121946.67935-1-alperyasinak1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251227121946.67935-1-alperyasinak1@gmail.com>

On Sat, Dec 27, 2025 at 03:19:44PM +0300, Alper Ak wrote:
> media_pad_remote_pad_unique() can return ERR_PTR(-ENOTUNIQ) or
> ERR_PTR(-ENOLINK) on error situation.
> 
> The current code dereferences remote_pad without checking for
> these error cases, which could lead to invalid memory access.

What makes you think this can happen ?

> Add IS_ERR() check before dereferencing the pointer.
> 
> Fixes: d7d72dae81d5 ("media: rzg2l-cru: Retrieve virtual channel information")
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 162e2ace6931..bf7d96841c78 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -411,6 +411,9 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
>  	int ret;
>  
>  	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
> +	if (IS_ERR(remote_pad))
> +		return PTR_ERR(remote_pad);
> +
>  	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
>  	if (ret < 0 && ret != -ENOIOCTLCMD) {
>  		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");

-- 
Regards,

Laurent Pinchart

