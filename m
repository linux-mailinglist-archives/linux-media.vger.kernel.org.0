Return-Path: <linux-media+bounces-33446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F7EAC4CCA
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 13:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03C833B0FAB
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 11:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD1E255F31;
	Tue, 27 May 2025 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="alQJ1SvF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F1B1C5D61;
	Tue, 27 May 2025 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344327; cv=none; b=L4BS5Xo68Zpe63k2eLLscW+TWriBWdLqcHoIqfCAudmwYdAf3J/B1x9jYdv0RhaAW4h2QiGdrfyaCbsit3xz1UB0z56udi4BnurCIVaHNHPXdo7zDeT55kAMtsKo+vd24fo/oz7pfmHtM+4laLZgXdS1/68HseObhPDApLayiBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344327; c=relaxed/simple;
	bh=ZhDJ7At4XnRQnF2/Tp69H+tsTXGdDzw2FQX2pe0GHbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ij0XdQy8Fiajo2OUyz5CTfNgPK3jsVUlWCfVRMqIwWAx/Rd+jletr1S4hneUb5+u2t36QS0aZ3etUEYwamGWTHecT1r9WYG/JYE9ZeG6FXXluLZMKTQPRyQ/VwIZ2cVC7wj+RmlldJ1zLBcvV0LZrFYtpWpXPlNHpaxKXmywbJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=alQJ1SvF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [145.15.244.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEEC12B3;
	Tue, 27 May 2025 13:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748344298;
	bh=ZhDJ7At4XnRQnF2/Tp69H+tsTXGdDzw2FQX2pe0GHbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=alQJ1SvF5uiRA25+mwnfJznqlFQingb3fh18Uh9Kj2v5qI3kRuPHp1KM2wecNis7v
	 IcpcT8c48nkbCMXx7QhXbQAcUvO8r4zSKTpywq2vU0Ic3sFjRnOUKXayQwTwtLZbjl
	 kwlFszDOjE2QWmknmQ7A6RSpj5W7j0/2LxjHerp0=
Date: Tue, 27 May 2025 13:11:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/6] media: rcar-vin: Use correct count of remote
 subdevices
Message-ID: <20250527111157.GH12492@pendragon.ideasonboard.com>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
 <20250521132037.1463746-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521132037.1463746-2-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Wed, May 21, 2025 at 03:20:32PM +0200, Niklas Söderlund wrote:
> When extending the driver with Gen4 support the iteration of over
> possible remote subdevices changed from being R-Car CSI-2 Rx only to
> also cover R-Car CSISP instances. In two loops updating the bounds
> variable was missed.
> 
> This had no ill effect as the count the two values have always been the
> same in the past. Fix it before the two diverge.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 846ae7989b1d..b9ea5b8db559 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -262,7 +262,7 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
>  
>  	mutex_lock(&vin->group->lock);
>  
> -	for (i = 0; i < RVIN_CSI_MAX; i++) {
> +	for (i = 0; i < RVIN_REMOTES_MAX; i++) {

Using ARRAY_SIZE would be even better I think.

	for (i = 0; i < ARRAY_SIZE(vin->group->remotes); i++) {

Same below.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  		if (vin->group->remotes[i].asc != asc)
>  			continue;
>  		vin->group->remotes[i].subdev = NULL;
> @@ -284,7 +284,7 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
>  
>  	mutex_lock(&vin->group->lock);
>  
> -	for (i = 0; i < RVIN_CSI_MAX; i++) {
> +	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
>  		if (vin->group->remotes[i].asc != asc)
>  			continue;
>  		vin->group->remotes[i].subdev = subdev;

-- 
Regards,

Laurent Pinchart

