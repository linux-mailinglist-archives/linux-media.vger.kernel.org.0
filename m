Return-Path: <linux-media+bounces-20723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A01279BA334
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2024 01:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58E371F2274F
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2024 00:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB982582;
	Sun,  3 Nov 2024 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L0t/0DLY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36F04A08
	for <linux-media@vger.kernel.org>; Sun,  3 Nov 2024 00:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730592826; cv=none; b=IQ/PdmnoFBOe9z9Sqyr6jrSTlG14D5+yrLq7oqzbaGYheNbyFLJKUlaw/tgJr74oejs7lHfUSjosAxrvMMuo+crIdP9SPbrs8gmHFwzaEBhPc0m7eskymYbF5CKz0m0hQEy3sdlm4K6O0i/+NFY+3Y+q+w8M7pemz/aebF78lcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730592826; c=relaxed/simple;
	bh=zCnDDz52NqgxQ2AWlxvkj+8FAJODQnyWcRpOUbzYZPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZX3BRD3kL5xl7U2/K9yayzuFM4WiPj6ID39djYfYaa4YAV+P86frjsQXoRF0zFOIChfT5z0Zm0hnPpMMRJkWrqLwbY6dtaoJL/Iwym8C9jp/ldcNs4wXjPxjud2QPzuTdWEldyXeO+EJLu5TvkSfKxCeNOcAsk5Wf2GhCPeELuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L0t/0DLY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B167E55;
	Sun,  3 Nov 2024 01:13:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730592810;
	bh=zCnDDz52NqgxQ2AWlxvkj+8FAJODQnyWcRpOUbzYZPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0t/0DLYVJk39B5ZF9HtvIvgPIfdRA1ZP9XlQIVpfl+stN08VTZ6040BPIQ+1MKf3
	 0Tllzl/6OVC/HdxHD/Pz0PY0b9f56rnVcdVZTGiWRX0GCztTa31UifxmqJbsp6upmW
	 CreEII/PmEy0Zu4dCuT8bdD3d4rk2gJnKMZcojG0=
Date: Sun, 3 Nov 2024 02:13:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: mc: Rename pad as origin in
 __media_pipeline_start()
Message-ID: <20241103001330.GN2473@pendragon.ideasonboard.com>
References: <20241031141747.4697-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241031141747.4697-1-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Oct 31, 2024 at 04:17:47PM +0200, Sakari Ailus wrote:
> Rename the pad field in __media_pipeline_start() to both better describe
> what it is and avoid masking it during the loop.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-entity.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 96dd0f6ccd0d..0df9fc90cf33 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -768,10 +768,10 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
>  	return ret;
>  }
>  
> -__must_check int __media_pipeline_start(struct media_pad *pad,
> +__must_check int __media_pipeline_start(struct media_pad *origin,
>  					struct media_pipeline *pipe)

You need to also update the documentation in
include/media/media-entity.h. With that fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I believe the media CI builds the documentation, did it fail to catch
the issue ?

>  {
> -	struct media_device *mdev = pad->graph_obj.mdev;
> +	struct media_device *mdev = origin->graph_obj.mdev;
>  	struct media_pipeline_pad *err_ppad;
>  	struct media_pipeline_pad *ppad;
>  	int ret;
> @@ -782,7 +782,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
>  	 * If the pad is already part of a pipeline, that pipeline must be the
>  	 * same as the pipe given to media_pipeline_start().
>  	 */
> -	if (WARN_ON(pad->pipe && pad->pipe != pipe))
> +	if (WARN_ON(origin->pipe && origin->pipe != pipe))
>  		return -EINVAL;
>  
>  	/*
> @@ -799,7 +799,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
>  	 * with media_pipeline_pad instances for each pad found during graph
>  	 * walk.
>  	 */
> -	ret = media_pipeline_populate(pipe, pad);
> +	ret = media_pipeline_populate(pipe, origin);
>  	if (ret)
>  		return ret;
>  

-- 
Regards,

Laurent Pinchart

