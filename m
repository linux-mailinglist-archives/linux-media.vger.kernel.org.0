Return-Path: <linux-media+bounces-34331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07387AD1ACF
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 11:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E98283A408A
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 09:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581512512DD;
	Mon,  9 Jun 2025 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjTsqdcT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1624EF88;
	Mon,  9 Jun 2025 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749461987; cv=none; b=uc0Y2fJyycV6BAvgbfxWxe9BY/UXLYtD6nbKuuDAoA+kMMj/f8BCUenU8kP4UAkUIVxgQpQxDdStzNNCTfEtRRVXUA/VJszC7brzTOQytcvd+ylz8gGgr8yL/zAnx8qHPZHA/VOQDJUS2BfvvmiuudfubAAQJHFIMkjiyb//Fxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749461987; c=relaxed/simple;
	bh=EzGs89dOGtEqrPdOnufb21WxYm/0w8IlNEbI9J/Xnwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAMsT8ChVIkLsUFmv2XNQY5WXMDeIwLE8rJzcqCOP6r3mFKaqhdSCi2PbEIs8SjgdHymXQ27Phepkx5k8l2b/Or58k6x8HvCtGIRXfoo74u/OGpE/oZu8pFroPCmwNYiwsY/N2urKwve5x695hsLQ+d62PZHQmIbr1XiDqG/ZbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjTsqdcT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749461986; x=1780997986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EzGs89dOGtEqrPdOnufb21WxYm/0w8IlNEbI9J/Xnwc=;
  b=IjTsqdcTBdXyiQg9rBhbX2d7oDZR0+jP/QryElIdPb9R8e/EEHLPXsqD
   XQnOspBNWBN+SKt0Us1uX6qSrapzosp7ZrtYwMWjtFtFomxbzeAmE0KLB
   bs4BU3Ud7xt5eKYu5Wy23b8Uz598S50+aVsIO2MPoWnbXAw3g2NzGH0fL
   tcJquavpy75ZQSgH5fDVTleWWDsDzDphP6+m5I+mJ0KmBVthriiLG6/6l
   amJdknNv5lFeve5gqYWYVPadzAj1J7Tss4HFId0Oh4k51E98ugiClChhx
   5kBI82ANcpczwBC134OoWDv2IZxIsZ/KvlNAK6EKYOlsO9YFOjbcNHY3m
   g==;
X-CSE-ConnectionGUID: 2C7IIwN/Rb+zhi+P/2StZw==
X-CSE-MsgGUID: oJre2GBXRhagpozwfrFZ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="55334837"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="55334837"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 02:39:44 -0700
X-CSE-ConnectionGUID: p2g49X2TTZeY6APld6ttKQ==
X-CSE-MsgGUID: RTtVXp2dS2m38lvdbz12Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="151336231"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.36])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 02:39:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0709C11FC22;
	Mon,  9 Jun 2025 12:39:40 +0300 (EEST)
Date: Mon, 9 Jun 2025 09:39:40 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 01/12] media: rcar-vin: Use correct count of remote
 subdevices
Message-ID: <aEar3NonNYosp4Nm@kekkonen.localdomain>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606182606.3984508-2-niklas.soderlund+renesas@ragnatech.se>

Hejssan,

On Fri, Jun 06, 2025 at 08:25:55PM +0200, Niklas Söderlund wrote:
> When extending the driver with Gen4 support the iteration of over
> possible remote subdevices changed from being R-Car CSI-2 Rx only to
> also cover R-Car CSISP instances. In two loops updating the bounds
> variable was missed.
> 
> This had no ill effect as the count the two values have always been the
> same in the past. Fix it by looking at the array size.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> * Changes since v4
> - Use ARRAY_SIZE() instead of updating the incorrect define to
>   RVIN_REMOTES_MAX.

Do you still need RVIN_REMOTES_MAX()? Couldn't you use ARRAY_SIZE()
elsewhere, too?

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 846ae7989b1d..cf5830d7d7b1 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -213,7 +213,7 @@ static int rvin_group_entity_to_remote_id(struct rvin_group *group,
>  
>  	sd = media_entity_to_v4l2_subdev(entity);
>  
> -	for (i = 0; i < RVIN_REMOTES_MAX; i++)
> +	for (i = 0; i < ARRAY_SIZE(group->remotes); i++)
>  		if (group->remotes[i].subdev == sd)
>  			return i;
>  
> @@ -262,7 +262,7 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
>  
>  	mutex_lock(&vin->group->lock);
>  
> -	for (i = 0; i < RVIN_CSI_MAX; i++) {
> +	for (i = 0; i < ARRAY_SIZE(vin->group->remotes); i++) {
>  		if (vin->group->remotes[i].asc != asc)
>  			continue;
>  		vin->group->remotes[i].subdev = NULL;
> @@ -284,7 +284,7 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
>  
>  	mutex_lock(&vin->group->lock);
>  
> -	for (i = 0; i < RVIN_CSI_MAX; i++) {
> +	for (i = 0; i < ARRAY_SIZE(vin->group->remotes); i++) {
>  		if (vin->group->remotes[i].asc != asc)
>  			continue;
>  		vin->group->remotes[i].subdev = subdev;

-- 
Kind regards,

Sakari Ailus

