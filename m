Return-Path: <linux-media+bounces-35636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE37AAE4046
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60C3418861DC
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEE623C390;
	Mon, 23 Jun 2025 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QDOYLmwm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955B5374EA
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681660; cv=none; b=gaDd5KVIf03+DCdHvfJl+gEJEIrppNzGklQ44CuEdi6w263u8C+OSwvUP05JJjYhrvGAoG9zQvXXGdZjaPgzp6ZhpxUOFXfvRAkUUa/7XQSO+jAjzbzauhQ6nsAsiWDRgtHLuOoT2vEYDyNVa5V8jeZL3qPiOmJOm9C6z/To0kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681660; c=relaxed/simple;
	bh=rGSxPCiEcZUhlPE4MExXm1E87zE1sC3+Z3k8KnzVaq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGbrqsMykFlPg/v88+9tkYZVxu95RFPKM2877RSXhaQjMcKHH6Q76GQBWXD/lQJDK0IbJfGYJrqaI2ED+TaV+otTPcMkFc23KbHii2Jh2+19XxiNvNjkP2biMU1ZdSInlTEMxt7nnGzxS0RpHHxNbbY3J4NYKM2QYpt5Lef6dIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QDOYLmwm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 86B31D77;
	Mon, 23 Jun 2025 14:27:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750681640;
	bh=rGSxPCiEcZUhlPE4MExXm1E87zE1sC3+Z3k8KnzVaq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QDOYLmwmJD0yQQl5Q2u3YptgdE+ZUQPacMdK09il37psh1S+tDzpzzPbnwLElBTai
	 eZrmxRlmMV01DPddjL3UAsm7Qc/1hiWvCWkiOeU35k+Q2WuKSBj30uxpmjBPGRDWmC
	 JdyW/QS82/sc2sDJUJ3yHRGyEVrG0jArjWNM4/AM=
Date: Mon, 23 Jun 2025 15:27:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH v4 2/3] media: v4l2-ctrls: Return the handler's error in
 v4l2_ctrl_handler_free()
Message-ID: <20250623122717.GG826@pendragon.ideasonboard.com>
References: <20250623122314.2346635-1-sakari.ailus@linux.intel.com>
 <20250623122314.2346635-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623122314.2346635-3-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Jun 23, 2025 at 03:23:13PM +0300, Sakari Ailus wrote:
> v4l2_ctrl_handler_free() used to return void but changing this to int,
> returning the handler's error code, enables the drivers to simply return
> the handler's error in this common error handling pattern:
> 
> 	if (handler->error)
> 		return v4l2_ctrl_handler_free(handler);
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 11 ++++++++---
>  include/media/v4l2-ctrls.h                |  4 +++-
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index d28596c720d8..98b960775e87 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1631,14 +1631,17 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
>  EXPORT_SYMBOL(v4l2_ctrl_handler_init_class);
>  
>  /* Free all controls and control refs */
> -void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
> +int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>  {
>  	struct v4l2_ctrl_ref *ref, *next_ref;
>  	struct v4l2_ctrl *ctrl, *next_ctrl;
>  	struct v4l2_subscribed_event *sev, *next_sev;
>  
> -	if (hdl == NULL || hdl->buckets == NULL)
> -		return;
> +	if (!hdl)
> +		return 0;
> +
> +	if (!hdl->buckets)
> +		return hdl->error;

!hdl->buckets means the handler has been freed, or is not initialized.
I'd return 0 in that case.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	v4l2_ctrl_handler_free_request(hdl);
>  
> @@ -1663,6 +1666,8 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>  	hdl->cached = NULL;
>  	mutex_unlock(hdl->lock);
>  	mutex_destroy(&hdl->_lock);
> +
> +	return hdl->error;
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_handler_free);
>  
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 3a87096e064f..c32c46286441 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -579,8 +579,10 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
>   * @hdl:	The control handler.
>   *
>   * Does nothing if @hdl == NULL.
> + *
> + * Return: @hdl's error field or 0 if @hdl is NULL.
>   */
> -void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
> +int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
>  
>  /**
>   * v4l2_ctrl_lock() - Helper function to lock the handler

-- 
Regards,

Laurent Pinchart

