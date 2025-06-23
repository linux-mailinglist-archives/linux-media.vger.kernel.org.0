Return-Path: <linux-media+bounces-35638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C57AE4051
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA8ED18875D3
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0767A2459FF;
	Mon, 23 Jun 2025 12:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PMxdrFvv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAEA23F409
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681796; cv=none; b=GIFZvsPztX6GKVM3utT+amNxy1NMzxTdhMLnQLN8zF3afpWXKrFTY2aknz9mIjZqjFykNKQvpS9kLBAv6dYm3h30eNePcPMNw9ZHgBnCpcjFI05WHJXYRINMz75s4B+8PDl57Wy371Dz20iLv6FV795RtGiWPYZnpVgalhbTps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681796; c=relaxed/simple;
	bh=xCUqotNHM219f/qh5QnASL5NCpV4pReppXM/zZv+7d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKkvdJZOwHWtxbIHVvwe8zQAVo3GDIZmZV5exX3Ewu4Ey7CIh+LDL4xKU5m1mUAvp+DtwUsFlMiTcRl6qze2kwsTu2w7yHsXjXSLW5jFnCMqH/r+wDRlfFm7ue1Rcl5WOPpVxPZqmroM5V3hC9Md4XtiSH3hmO+UVLBWTfvagVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PMxdrFvv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C99B8D77;
	Mon, 23 Jun 2025 14:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750681777;
	bh=xCUqotNHM219f/qh5QnASL5NCpV4pReppXM/zZv+7d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMxdrFvvXPgktL8UfeMgIpqshzuH9wpGfzp6KjLBY6HJB/RJvHAD7x5Ru+wecQHvZ
	 jHeg0rNoSapBwSortQWzZ+GQjOKQEDbtP7pZeBKuW3UimuRrimv5yqO9vB/cy0miZD
	 AdNvbvNMS3t7dpyO6DojZ+A/GGsuRQyG+j0Ipa/c=
Date: Mon, 23 Jun 2025 15:29:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH v4 2/3] media: v4l2-ctrls: Return the handler's error in
 v4l2_ctrl_handler_free()
Message-ID: <20250623122933.GI826@pendragon.ideasonboard.com>
References: <20250623122314.2346635-1-sakari.ailus@linux.intel.com>
 <20250623122314.2346635-3-sakari.ailus@linux.intel.com>
 <20250623122717.GG826@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623122717.GG826@pendragon.ideasonboard.com>

On Mon, Jun 23, 2025 at 03:27:19PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Jun 23, 2025 at 03:23:13PM +0300, Sakari Ailus wrote:
> > v4l2_ctrl_handler_free() used to return void but changing this to int,
> > returning the handler's error code, enables the drivers to simply return
> > the handler's error in this common error handling pattern:
> > 
> > 	if (handler->error)
> > 		return v4l2_ctrl_handler_free(handler);
> > 
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 11 ++++++++---
> >  include/media/v4l2-ctrls.h                |  4 +++-
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index d28596c720d8..98b960775e87 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -1631,14 +1631,17 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
> >  EXPORT_SYMBOL(v4l2_ctrl_handler_init_class);
> >  
> >  /* Free all controls and control refs */
> > -void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
> > +int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
> >  {
> >  	struct v4l2_ctrl_ref *ref, *next_ref;
> >  	struct v4l2_ctrl *ctrl, *next_ctrl;
> >  	struct v4l2_subscribed_event *sev, *next_sev;
> >  
> > -	if (hdl == NULL || hdl->buckets == NULL)
> > -		return;
> > +	if (!hdl)
> > +		return 0;
> > +
> > +	if (!hdl->buckets)
> > +		return hdl->error;
> 
> !hdl->buckets means the handler has been freed, or is not initialized.
> I'd return 0 in that case.

Actually it can also mean init failed due to an allocation error, in
which case error is set to -ENOMEM. Please ignore this comment.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

You can keep this.

> >  
> >  	v4l2_ctrl_handler_free_request(hdl);
> >  
> > @@ -1663,6 +1666,8 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
> >  	hdl->cached = NULL;
> >  	mutex_unlock(hdl->lock);
> >  	mutex_destroy(&hdl->_lock);
> > +
> > +	return hdl->error;
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_handler_free);
> >  
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index 3a87096e064f..c32c46286441 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -579,8 +579,10 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
> >   * @hdl:	The control handler.
> >   *
> >   * Does nothing if @hdl == NULL.
> > + *
> > + * Return: @hdl's error field or 0 if @hdl is NULL.
> >   */
> > -void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
> > +int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
> >  
> >  /**
> >   * v4l2_ctrl_lock() - Helper function to lock the handler

-- 
Regards,

Laurent Pinchart

