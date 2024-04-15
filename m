Return-Path: <linux-media+bounces-9313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A098A49D3
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 10:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D7D4285C01
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 08:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64E3364BE;
	Mon, 15 Apr 2024 08:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7N7CSQQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285252C6B7
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 08:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713168661; cv=none; b=hpt7ElhG8nV45Z9eAQSlccc2AFKSQIi7vs0Zk008JvD3NToeJHA2LLc4jsrjCY7c5DPSxlOJQxfcWCNnHXwWwm7vTLI6v4WQubdodpldcN8vjzEQ39k0NsLFxM9wsXzrDCqDgH+5jYTJNXrlql8H3XT4LMliBw0LLL5Y52lKYkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713168661; c=relaxed/simple;
	bh=MNErUWV9jVz3ysxEA6IhQ7FCosGbLqS8UnesAC8GMcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rofTFfeaQCaMojLAH8BT/VRA/vAMEbTq3McdTmdRY7O6ZXiOUczu3bG4kHXAbecwFAM3KMYWFyJE+NRYqwdq7pHkibrFGsx4auUTkQtmBu3c/ldON0RUpeFIxMV2MHThCZx+d2NEMGcMj9QhlPr2Ltpq/KI/O4RGzvzNFbDnOMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7N7CSQQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713168659; x=1744704659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MNErUWV9jVz3ysxEA6IhQ7FCosGbLqS8UnesAC8GMcc=;
  b=f7N7CSQQaxNylIHV3Y2rUFWt0eMxsuqCHY3kAFvYwLhekd3+gwseY/CZ
   4Kmr2DZkGhW9lVcGtZg+S1Whdgx2/UHCBzZB+wP+xn6np/ELL1KmFXjGI
   Osd+22mteResobn/JbFQkIQD4wN6JDQVDVuarJ2Z+S9r8kWWCY+HiOdG+
   VzsgrQs5p+fpXHLJSXnrl1zNkpLNbW4tjfUkkh8/QRBVxNQ+RSKAFKDvk
   n+Odxz0P9BS9nZYEiv/4Feema2/g4NRphyxrQoIHm51f+pxKe04qxdxR5
   UmvUH1pK8eB58j355xEsh4OxkszkoudKc8B6Dw2NJuTzZOmWn7ZO2/JUF
   g==;
X-CSE-ConnectionGUID: CJd4y8tuSNu8M0+gc5k59g==
X-CSE-MsgGUID: 2kEkAYCNR2qN5lQuDmq/pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8764332"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8764332"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 01:10:58 -0700
X-CSE-ConnectionGUID: 3wCkGdCNRfCIz1oiWG6X8Q==
X-CSE-MsgGUID: SqgC0+qnRw6Y6usmFvCZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="53051104"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 01:10:56 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3143611F8AF;
	Mon, 15 Apr 2024 11:10:53 +0300 (EEST)
Date: Mon, 15 Apr 2024 08:10:53 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 17/38] media: v4l: subdev: Add trivial set_routing
 support
Message-ID: <ZhzhDXEOVvBLqLqL@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-18-sakari.ailus@linux.intel.com>
 <20240320015558.GV8501@pendragon.ideasonboard.com>
 <20240401234105.GA2492@pendragon.ideasonboard.com>
 <Zhebq7FxeDolVDTp@kekkonen.localdomain>
 <20240412191035.GP31122@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412191035.GP31122@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Apr 12, 2024 at 10:14:26PM +0300, Laurent Pinchart wrote:
> > > I think this should be done after the next code block that validates the
> > > arguments. Otherwise the S_ROUTING ioctl will behave differently with
> > > regard to blatantly invalid arguments, depending on whether or not the
> > > subdev implements the .set_routing() operation. This can confuse
> > > userspace, and does confuse v4l2-compliance.
> > > 
> > > I have the following change in my tree that fixes the problem, feel free
> > > to squash it with this patch in v9.
> > > 
> > > commit 1e1f03eb8bc118c53a9deab05063d71a2fe7aa5f
> > > Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Date:   Tue Apr 2 02:06:01 2024 +0300
> > > 
> > >     fixup! media: v4l: subdev: Add trivial set_routing support
> > > 
> > >     Validate arguments before handling the trivial set_routing support to
> > >     expose a consistent behaviour to userspace. This fixes an issue with
> > >     v4l2-compliance.
> > > 
> > >     Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Thanks, I'll squash this into the patch.
> > 
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index def91ab32c07..129867ed2bad 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -933,19 +933,12 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >  		memset(routing->reserved, 0, sizeof(routing->reserved));
> > > 
> > >  		/*
> > > -		 * If the driver doesn't support setting routing, just return
> > > -		 * the routing table here.
> > > +		 * Perform argument validation first, or subdevs that don't
> > > +		 * support setting routing will not return an error when
> > > +		 * arguments are blatantly wrong. The difference in behaviour
> > > +		 * could be confusing for userspace, and in particular for API
> > > +		 * compliance checkers.
> > 
> > This is more fit for development time discussion, not something that should
> > be left in the code IMO.
> 
> I added that comment to make sure that the next developer who refactors
> the code will not end up changing the order and introducing subtle
> breakages without realizing it. There's a high chance we wouldn't catch
> the problem during review if this happens after our brain caches get
> flushed.

We don't have other comments like that in the code either. Input validation
is generally needed, in this case it wasn't needed to carry out the task
but to align the API behaviour with the drivers that do and don't support
setting routing. It's not worth a comment here: it's the same for other
IOCTLs as well. So if a comment were to be added, I'd add it before the
switch.

-- 
Regards,

Sakari Ailus

