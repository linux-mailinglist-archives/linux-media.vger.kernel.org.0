Return-Path: <linux-media+bounces-11288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0CA8C1FA5
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1194C1C2167E
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFF515FA7D;
	Fri, 10 May 2024 08:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N/gmea/A"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6FA1BC2A
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715329578; cv=none; b=flRVl7YvqN8NXoxXuxLZwipfI/Y7DdTrr4Qqns9vexiIgOLLSbxn8zlBTdV1z0+Qgxf10DCutwyavusjOSjC764CvW6R2ZBAe8tw6lcjM+kP1OdgPPxplDMQS42W7qX5LsvQ9AOxKBNwUnt0LpCVt6zF029wS/OS26Xy+FrlbsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715329578; c=relaxed/simple;
	bh=ClIEYxTgwOUgZsHNVMzN+Pja2tA2RfdfQ5cF4lfrJks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LR0AieGbE7cZ6uh1lFckvuZe6ajB3+d5Bx5d7dF38rUeSUziT1RNnu5hU0TSkv7pIGwjJZ8NespglAOfmm2MBVsvFXlVDFP3t3v5nmp0w8X2Ac/UdeQ/IHmyIuIRyToehdIrMR7dH5kQEkWQV22L9volg9qmdMD9rC60sA9ZH7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N/gmea/A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1A36899;
	Fri, 10 May 2024 10:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715329571;
	bh=ClIEYxTgwOUgZsHNVMzN+Pja2tA2RfdfQ5cF4lfrJks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/gmea/AJT7z1M3LdW9Kinx9D7/Pg1m2mH7nenwHeGM+riFYaWRX1G9e939LdrPcm
	 OWnxYS/4FRdprNh+Ubr68zLBw4z3hb6MTVwkhmHKudyz8N1Ims2RyHIlCS6XFvGHej
	 OTStqMc27h6zqqaUsmPshKK+1yuDhNXQxmWeOToc=
Date: Fri, 10 May 2024 11:26:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH for v6.10] Revert "media: v4l2-ctrls: show all owned
 controls in log_status"
Message-ID: <20240510082607.GF6407@pendragon.ideasonboard.com>
References: <04b7c48c-eb68-44bb-8bd3-b85647dbbf91@xs4all.nl>
 <20240510082507.GE6407@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240510082507.GE6407@pendragon.ideasonboard.com>

On Fri, May 10, 2024 at 11:25:09AM +0300, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Fri, May 10, 2024 at 09:11:46AM +0200, Hans Verkuil wrote:
> > This reverts commit 9801b5b28c6929139d6fceeee8d739cc67bb2739.
> > 
> > This patch introduced a potential deadlock scenario:
> > 
> > [Wed May  8 10:02:06 2024]  Possible unsafe locking scenario:
> > 
> > [Wed May  8 10:02:06 2024]        CPU0                    CPU1
> > [Wed May  8 10:02:06 2024]        ----                    ----
> > [Wed May  8 10:02:06 2024]   lock(vivid_ctrls:1620:(hdl_vid_cap)->_lock);
> > [Wed May  8 10:02:06 2024]                                lock(vivid_ctrls:1608:(hdl_user_vid)->_lock);
> > [Wed May  8 10:02:06 2024]                                lock(vivid_ctrls:1620:(hdl_vid_cap)->_lock);
> > [Wed May  8 10:02:06 2024]   lock(vivid_ctrls:1608:(hdl_user_vid)->_lock);
> > 
> > For now just revert.
> > 
> > Fixes: 9801b5b28c69 ("media: v4l2-ctrls: show all owned controls in log_status")
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

There should be a

Cc: stable@vger.kernel.org

too, as this should be backported to v6.9.x.

> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 18 +++++-------------
> >  1 file changed, 5 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index c59dd691f79f6..eeab6a5eb7bac 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -2507,8 +2507,7 @@ int v4l2_ctrl_handler_setup(struct v4l2_ctrl_handler *hdl)
> >  EXPORT_SYMBOL(v4l2_ctrl_handler_setup);
> > 
> >  /* Log the control name and value */
> > -static void log_ctrl(const struct v4l2_ctrl_handler *hdl,
> > -		     struct v4l2_ctrl *ctrl,
> > +static void log_ctrl(const struct v4l2_ctrl *ctrl,
> >  		     const char *prefix, const char *colon)
> >  {
> >  	if (ctrl->flags & (V4L2_CTRL_FLAG_DISABLED | V4L2_CTRL_FLAG_WRITE_ONLY))
> > @@ -2518,11 +2517,7 @@ static void log_ctrl(const struct v4l2_ctrl_handler *hdl,
> > 
> >  	pr_info("%s%s%s: ", prefix, colon, ctrl->name);
> > 
> > -	if (ctrl->handler != hdl)
> > -		v4l2_ctrl_lock(ctrl);
> >  	ctrl->type_ops->log(ctrl);
> > -	if (ctrl->handler != hdl)
> > -		v4l2_ctrl_unlock(ctrl);
> > 
> >  	if (ctrl->flags & (V4L2_CTRL_FLAG_INACTIVE |
> >  			   V4L2_CTRL_FLAG_GRABBED |
> > @@ -2541,7 +2536,7 @@ static void log_ctrl(const struct v4l2_ctrl_handler *hdl,
> >  void v4l2_ctrl_handler_log_status(struct v4l2_ctrl_handler *hdl,
> >  				  const char *prefix)
> >  {
> > -	struct v4l2_ctrl_ref *ref;
> > +	struct v4l2_ctrl *ctrl;
> >  	const char *colon = "";
> >  	int len;
> > 
> > @@ -2553,12 +2548,9 @@ void v4l2_ctrl_handler_log_status(struct v4l2_ctrl_handler *hdl,
> >  	if (len && prefix[len - 1] != ' ')
> >  		colon = ": ";
> >  	mutex_lock(hdl->lock);
> > -	list_for_each_entry(ref, &hdl->ctrl_refs, node) {
> > -		if (ref->from_other_dev ||
> > -		    (ref->ctrl->flags & V4L2_CTRL_FLAG_DISABLED))
> > -			continue;
> > -		log_ctrl(hdl, ref->ctrl, prefix, colon);
> > -	}
> > +	list_for_each_entry(ctrl, &hdl->ctrls, node)
> > +		if (!(ctrl->flags & V4L2_CTRL_FLAG_DISABLED))
> > +			log_ctrl(ctrl, prefix, colon);
> >  	mutex_unlock(hdl->lock);
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_handler_log_status);

-- 
Regards,

Laurent Pinchart

