Return-Path: <linux-media+bounces-4549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 620FF8455F1
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 12:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949361C22F84
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 11:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A59C15B990;
	Thu,  1 Feb 2024 11:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jb+q/RiB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E1DF51A
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706785515; cv=none; b=HMmNmGIB5NVODldO0MUufzxY/glRzRJRwXRC0J88DcbDU5HEvHEnh3UzseSibLcIpX6ictatZjRabGP2UzLEmfCDG0Rds+gUcSXZoNxVzZNhqDlYUEX97DIZqRIO206JEHsj0eTv69A81nlbDCaNZCIhtnHhi/YP4bE+cV8/72M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706785515; c=relaxed/simple;
	bh=yctZqXQJxJCDoxPWNIICxGWlhd2FYPLGkl43fug182A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXfcP9xN8vy1sCV1x71/4P/xjhsNjYhoXdmfbk1hIHnB1bc2CLxVkWE6l/Y/JSyHEWC4JvuTYwPF7u+mqmAy9vPEyQ0VX4Q6XUD7Q6Z9qRYL/MHfSycJ/YNZcUvMHgKJKNgBgS487Vvl1/+xbxwUtNP1FjFN4ZMV6ox2hkwBIPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jb+q/RiB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706785513; x=1738321513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yctZqXQJxJCDoxPWNIICxGWlhd2FYPLGkl43fug182A=;
  b=Jb+q/RiB964d7z9pzU5MXHmgbjQKH5ql5xZnCCrYW5j+KWtF/uEaxa9e
   POG8Hsb5cQ5hmwK3Qoc8yIQHnINokY0YutYUgNMnEVqxuHqj16GTLe/7x
   igbATAoyW+l+0uIqJRU+AgK/KNsl1xXu4Zyd+oWYcd+HSMCcg4DDyy452
   tnQUCSH+Zu48/1IzpBWp92SD94hHVeCPE6qAzRZ1nopl5ZDCZN9C/m+Cl
   Ek0c5FbqVLtem/UQx3KAPviDHzw8nr89lcFatDccgFS1CCqDNp+r0qYLy
   Y14N6WqPbzo2l/VX6BRz6sfsQSfmS6bXKSpwCT4UcrlOS8e9sNCfIBmOh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="67309"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="67309"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 03:05:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="932152730"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="932152730"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 03:05:09 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3A05511FA94;
	Thu,  1 Feb 2024 13:05:07 +0200 (EET)
Date: Thu, 1 Feb 2024 11:05:07 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v7 17/19] media: mc: Check pad flag validity
Message-ID: <Zbt645NhD4Gv3t1c@kekkonen.localdomain>
References: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
 <20231002105557.28972-18-sakari.ailus@linux.intel.com>
 <20240201091713.GA69174@google.com>
 <Zbtiucur0Y_gSEQc@kekkonen.localdomain>
 <20240201093313.GB69174@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201093313.GB69174@google.com>

On Thu, Feb 01, 2024 at 06:33:13PM +0900, Sergey Senozhatsky wrote:
> On (24/02/01 09:22), Sakari Ailus wrote:
> > Hi Sergey,
> > 
> > Thanks for the review.
> 
> Hi Sakari,
> 
> > On Thu, Feb 01, 2024 at 06:17:13PM +0900, Sergey Senozhatsky wrote:
> > > On (23/10/02 13:55), Sakari Ailus wrote:
> [..]
> > > > @@ -197,6 +197,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > > >  	struct media_device *mdev = entity->graph_obj.mdev;
> > > >  	struct media_pad *iter;
> > > >  	unsigned int i = 0;
> > > > +	int ret = 0;
> > > >  
> > > >  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
> > > >  		return -E2BIG;
> > > > @@ -210,15 +211,27 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > > >  	media_entity_for_each_pad(entity, iter) {
> > > >  		iter->entity = entity;
> > > >  		iter->index = i++;
> > > > +
> > > > +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > > > +					     MEDIA_PAD_FL_SOURCE)) != 1) {
> > > > +			ret = -EINVAL;
> > > 
> > > Can we please have some sort of WARN_ON() or pr_err() here?
> > > This is a pretty big change.
> > 
> > Doing proper input validation is hardly anything unusual, is it?
> 
> Well, function requirements change quite significantly, to the point
> that drivers that worked before won't work after.
> 
> > I'm fine with a WARN_ON() though, I'll add that to v8.
> 
> Thanks!

Actually this was a patchset that was merged quite some time ago. I'll
post separate patch on this.

-- 
Sakari Ailus

