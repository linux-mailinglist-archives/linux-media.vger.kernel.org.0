Return-Path: <linux-media+bounces-34552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80885AD6465
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 02:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A353AC2D1
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 00:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E78182BC;
	Thu, 12 Jun 2025 00:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YDhQwL46"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAC017BD9;
	Thu, 12 Jun 2025 00:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749687577; cv=none; b=Wp56T2LgeTwSjB6qtxQYBJVBaW++FxjcBUWK++mUYx0WYrVQIrdeVCL8ayYfzU0XBkobTBNPsC9i7DU8qCcUyOunNCHYo6f3KxO7a7GKJ8XLpkWpQxSh6iTNbLf2PjYppef8ZabpoEMcwjLy/WtGcipYFtsE/06msy/BqrFDlQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749687577; c=relaxed/simple;
	bh=LxmubzUFNH7NncVeBtOHrRlZNOQFcTp7zZOWL4UieJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lo05s9LLHsuMQvwI5yMt1jw4SWuoiAfzOTyV33fStndCj57UkDThDgLaUoiqPJLytZQ4uexpgY8UlpgtaEDT1X35uqcHu6FWIyPcdPD0vVFXkOd2Bu6gkp5/U8u0MsHIbRmbf/AjYcea6uoY4GqO+4mZ8aFXQmOl0d8qBnuCgs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YDhQwL46; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56EB1EA0;
	Thu, 12 Jun 2025 02:19:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749687565;
	bh=LxmubzUFNH7NncVeBtOHrRlZNOQFcTp7zZOWL4UieJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YDhQwL46qlk+yANy3NYWFulx6Q/qAKyFEY/0LF4vVbHfLla31jtQnMk04qCpTnF02
	 lU+BWpeVLjr+uVXgor+HMZjWw8Ab/G1BIU55F1B7P8LVhepfUSEfsstW7EWKURgmdi
	 3RwKkDU28XlVsKwvYgdL20gCX6YrlhR+bNqT4cIA=
Date: Thu, 12 Jun 2025 03:19:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 02/12] media: rcar-vin: Store platform info with group
 structure
Message-ID: <20250612001920.GA22977@pendragon.ideasonboard.com>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606182606.3984508-3-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, Jun 06, 2025 at 08:25:56PM +0200, Niklas Söderlund wrote:
> When the transition of Gen2 to use groups are complete the platform
> specific information can be retrieved from the group instead of being
> duplicated in each VIN's private data structure.
> 
> Prepare for this by already adding the information to the group
> structure so it can be used without first having to find the group from
> a VIN instances private data.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v4
> - New in v5.
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 1 +
>  drivers/media/platform/renesas/rcar-vin/rcar-vin.h  | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index cf5830d7d7b1..66efe075adae 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -156,6 +156,7 @@ static int rvin_group_get(struct rvin_dev *vin,
>  		}
>  
>  		kref_init(&group->refcount);
> +		group->info = vin->info;
>  
>  		rvin_group_data = group;
>  	}
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> index 83d1b2734c41..313703cd1103 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> @@ -242,6 +242,7 @@ struct rvin_dev {
>   * @lock:		protects the count, notifier, vin and csi members
>   * @count:		number of enabled VIN instances found in DT
>   * @notifier:		group notifier for CSI-2 async connections
> + * @info:		Platform dependent information about the VIN instances
>   * @vin:		VIN instances which are part of the group
>   * @link_setup:		Callback to create all links for the media graph
>   * @remotes:		array of pairs of async connection and subdev pointers
> @@ -255,6 +256,7 @@ struct rvin_group {
>  	struct mutex lock;
>  	unsigned int count;
>  	struct v4l2_async_notifier notifier;
> +	const struct rvin_info *info;
>  	struct rvin_dev *vin[RCAR_VIN_NUM];
>  
>  	int (*link_setup)(struct rvin_dev *vin);

-- 
Regards,

Laurent Pinchart

