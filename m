Return-Path: <linux-media+bounces-35260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88980AE0297
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A5F11BC2632
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0944222578;
	Thu, 19 Jun 2025 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYe3YSP5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7742222C5
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 10:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750328742; cv=none; b=kVr/UmOsLcfEzEfFfbX79hxcwos/Cpb7yPaFlDFu3Iu7MgeRA0EZv21oV4TfpUTYbXcXZvIFeTZenvP6JCIRtfzeNaxj7KFI7ahb5CU6vucWJDNHG+nxT12ws5U5kZS5vg9ZcBxn5dDhej3fDJoLJmOKScDmOXBzvNu7CvFHctE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750328742; c=relaxed/simple;
	bh=5ihHNfpiz8NodoJ31+G9GipsGlbKh8ycU3sZSbcF2vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foCXEGjX+3pesQ9QxeslAusOLvCAmyL0VYo8tW0mXfo6L2YeLgI/yMLefu8PnEbS5+jCSvFPXmZWs1JhKOd04+U427ieMUxJL4ed/rYDlfcOibanvJRlSNpDGOIq4HGKDdS+g0x2Nn55o2CZN9WCarlsc73g4nDj6q0P2zPQ5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYe3YSP5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750328740; x=1781864740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ihHNfpiz8NodoJ31+G9GipsGlbKh8ycU3sZSbcF2vw=;
  b=YYe3YSP5y82AxzBnVw1tDRf4izfqWZwGkGOZMKHUJQ9VHq9ukxbBVLSr
   dRLUUzb8IbQneJ4Yry048JHvjEv9XUx9RtYFcD7dSsPjlR89CUGVcSR9d
   TuSmDSoJobLfMppjr/c7pnCY4C3cL/TyEN2d5Wrv3CY4os28RF+UVDQ9P
   GU/KH+Ek5pKb8drUGg49jFyqj/ftpIK1u3hjE/K20OM4MsofOJ3SGQXVH
   ARYAfG3SL+eM8uoR2nPKrzXWygfeGItM/lQvitiFUJByAdHzZLVAWkNSN
   7cF0eHoi+8MwoF5DyWUtrVChpONfAu0H96U02Wg0HDOVWBrNLOeM/XP/O
   Q==;
X-CSE-ConnectionGUID: 6iEY57weS4O3f4SzgK4l8A==
X-CSE-MsgGUID: bKKjipHIS7uwUbeQiXlsbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64008289"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64008289"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:25:39 -0700
X-CSE-ConnectionGUID: t85S76B7TKKd2MsjCusY5Q==
X-CSE-MsgGUID: ROOHpkhuSM2SFbjrftaAkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="181640664"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:25:39 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C493211F8AE;
	Thu, 19 Jun 2025 13:25:35 +0300 (EEST)
Date: Thu, 19 Jun 2025 10:25:35 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/3] media: v4l2-ctrls: Return the handler's error in
 v4l2_ctrl_handler_free()
Message-ID: <aFPln8xXyh1drcdO@kekkonen.localdomain>
References: <20250619095227.1939114-1-sakari.ailus@linux.intel.com>
 <20250619095227.1939114-3-sakari.ailus@linux.intel.com>
 <7cee1db5-363f-445d-91fc-f0ff36351cc6@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cee1db5-363f-445d-91fc-f0ff36351cc6@xs4all.nl>

Hi Hans,

On Thu, Jun 19, 2025 at 12:04:48PM +0200, Hans Verkuil wrote:
> On 19/06/2025 11:52, Sakari Ailus wrote:
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
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 6 ++++--
> >  include/media/v4l2-ctrls.h                | 4 +++-
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index 932aedc26049..eb008a2e829c 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -1631,14 +1631,14 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
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
> >  	if (hdl == NULL || hdl->buckets == NULL)
> > -		return;
> > +		return hdl->error;
> 
> Hmm, that will crash if hdl == NULL!

Oops. Indeed it does.

> 
> I'm not really sure what this should return if hdl == NULL: 0 or some error code.
> 
> I'm inclined to just return 0 in that case. If hdl can be NULL, then presumably
> it is intentional and not an error.
> 
> >  
> >  	v4l2_ctrl_handler_free_request(hdl);
> >  
> > @@ -1663,6 +1663,8 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
> >  	hdl->cached = NULL;
> >  	mutex_unlock(hdl->lock);
> >  	mutex_destroy(&hdl->_lock);
> > +
> > +	return hdl->error;
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_handler_free);
> >  
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index 3a87096e064f..9e1693ecc283 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -579,8 +579,10 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
> >   * @hdl:	The control handler.
> >   *
> >   * Does nothing if @hdl == NULL.
> 
> Also here it states that it does nothing. So returning 0 is probably best.
> And document here that it does in fact return 0 if hdl == NULL.

Ack. I'll send v2 with these changes.

-- 
Regards,

Sakari Ailus

