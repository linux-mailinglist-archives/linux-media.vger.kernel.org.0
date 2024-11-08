Return-Path: <linux-media+bounces-21143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CEA9C1A4B
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 11:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28F711F22838
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E381E1C13;
	Fri,  8 Nov 2024 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="oau9ixel"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3B1188CC6
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060924; cv=pass; b=JQwkiubI8shigNc2ZHdMA+6mcDCF+0KrPpec3pxPxBVytpPPHjIRqkaMNzNGSnuq/+in2TK6XBnVsiIafTPDJnSHsHq2IweyWONEv4rIiwO/RjHKo2tIcNWYIQFjY/c3WZqOCAuQkLqE8YCxc4stZhzizESWa5bKXTWRsdXKJow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060924; c=relaxed/simple;
	bh=qUsQQmJ0IYFbYQuuWJjPjAzQ6V+dAaF8LfqS2oYY6qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=El4T6RHlikgIVnzIXZ3XjUJL1bgGV9v4iT1Oe7BA4LBF2TChO9H3F/YcYWsfyc88JKytqOxihWaQV4pLTlBWbKw0LxY3Kt0lzS3Hx4rTo/g2pZme2lfJIS/73/D/ty99qKVbuOqNm9JUzspdO3/tAC5TI6LJZV4TzyRM0ANa0pY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=oau9ixel; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4XlFF24SJTzyRB;
	Fri,  8 Nov 2024 12:15:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1731060918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HbVftseWLbM0REPVK96DiRK/oZIJu5q2R+yp5pNVrRs=;
	b=oau9ixelNmJqbLl994pmt+hLnUJButG5XXoihqc5aY3TLdW8OD6EiZdrOhU0yECbnO+A+m
	5mfiGq4VoNsnqvagznSNGF+iK8BDcZSAqfBkbeDp6JKZ7wayMf6c3BTBUOKMCad5Y2LrDa
	UmPCgtBRF3/I599uQM5vB1URE57U21U=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1731060918; a=rsa-sha256; cv=none;
	b=LnqCNeBM6zfVrF4lTrd423EN7C+xKIMLkhnmcRNlXB5AfDU/4gbuSPAJQAx7TDq98moCoY
	IuHaa8oFPLo14UkgNN4LTu0jchDlbHiMWH5EOXIzDfwo/Brl1FvycEZs20I0Pscilq6A+I
	gG4drS6+S+AsB1rSb8wXM4OFRsmZCr8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1731060918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HbVftseWLbM0REPVK96DiRK/oZIJu5q2R+yp5pNVrRs=;
	b=X6ZE4DYWooQ29mcY7oasDQ1isRVceEeK7GyvogIjLR7WCBKDOvLNbKS6dCzPQH/BwDNnVp
	a9ZL0JsNJ7GD7i97rOUU4sxciPulESCczcxrVNPZ60bv4LRR1o9qqsjAmeABGdxuW28v5D
	aLqKiY+ET+8CA7WHqBb/Ku+nfLA3TmM=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3EFD2634C93;
	Fri,  8 Nov 2024 12:15:17 +0200 (EET)
Date: Fri, 8 Nov 2024 10:15:17 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCHv2] media: v4l2-core: v4l2-ctrls: check for
 handler_new_ref misuse
Message-ID: <Zy3ktRUxfYoylLvB@valkosipuli.retiisi.eu>
References: <ddb6e006-7440-41c5-8aaa-685b058418b4@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddb6e006-7440-41c5-8aaa-685b058418b4@xs4all.nl>

Hi Hans,

On Tue, Nov 05, 2024 at 08:42:04AM +0100, Hans Verkuil wrote:
> An out-of-tree driver created a control handler, added controls, then
> called v4l2_ctrl_add_handler to add references to controls from another
> handler, and finally added another control that happened to have the same
> control ID as one of the controls from that other handler.
> 
> This caused a NULL pointer crash when an attempt was made to use that last
> control.
> 
> Besides the fact that two out-of-tree drivers used the same control ID for
> different (private) controls, which is obviously a bug, this specific
> scenario should have been caught. The root cause is the 'duplicate ID'
> check in handler_new_ref(): it expects that drivers will first add all
> controls to a control handler before calling v4l2_ctrl_add_handler. That
> way the local controls will always override references to controls from
> another handler.

Do we support adding new controls after adding the handler or is there a
valid use case for it? I'd rather say it's not supported and prevent it,
for simplicity. Things like this will likely make it more difficult to move
the controls to the device state.

Cc Laurent and Jacopo.

> 
> It never considered the case where new local controls were added after
> calling v4l2_ctrl_add_handler. Add a check to handler_new_ref() to return
> an error in the case that a new local control is added with the same ID as
> an existing control reference. Also use WARN_ON since this is a driver bug.
> 
> This situation can only happen when out-of-tree drivers are used or during
> driver development, since mainlined drivers all have their own control
> ranges reserved in v4l2-controls.h, thus preventing duplicate control IDs.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> ---
> Changes since v1:
> Improved the comment.
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 34 +++++++++++++++++++----
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index eeab6a5eb7ba..8fac12e78481 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1676,6 +1676,7 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
>  	u32 class_ctrl = V4L2_CTRL_ID2WHICH(id) | 1;
>  	int bucket = id % hdl->nr_of_buckets;	/* which bucket to use */
>  	unsigned int size_extra_req = 0;
> +	int ret = 0;
> 
>  	if (ctrl_ref)
>  		*ctrl_ref = NULL;
> @@ -1719,13 +1720,32 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
>  	list_for_each_entry(ref, &hdl->ctrl_refs, node) {
>  		if (ref->ctrl->id < id)
>  			continue;
> -		/* Don't add duplicates */
> -		if (ref->ctrl->id == id) {
> -			kfree(new_ref);
> -			goto unlock;
> +		/* Check we're not adding a duplicate */
> +		if (ref->ctrl->id != id) {
> +			list_add(&new_ref->node, ref->node.prev);
> +			break;
>  		}
> -		list_add(&new_ref->node, ref->node.prev);
> -		break;
> +
> +		/*
> +		 * If we add a new control to this control handler, and we find
> +		 * that it is a duplicate, then that is a driver bug. Warn and
> +		 * return an error.
> +		 *
> +		 * It can be caused by either adding the same control twice, or
> +		 * by first calling v4l2_ctrl_add_handler, and then adding a new
> +		 * control to this control handler.
> +		 *
> +		 * Either sequence is incorrect.
> +		 *
> +		 * However, if the control is owned by another handler, and
> +		 * a control with that ID already exists in the list, then we
> +		 * can safely skip it: in that case it the control is overridden
> +		 * by the existing control.
> +		 */
> +		if (WARN_ON(hdl == ctrl->handler))
> +			ret = -EEXIST;
> +		kfree(new_ref);
> +		goto unlock;
>  	}
> 
>  insert_in_hash:
> @@ -1746,6 +1766,8 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
> 
>  unlock:
>  	mutex_unlock(hdl->lock);
> +	if (ret)
> +		return handler_set_err(hdl, ret);
>  	return 0;
>  }
> 

-- 
Regards,

Sakari Ailus

