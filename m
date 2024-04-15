Return-Path: <linux-media+bounces-9398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA578A53AD
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 16:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FC7C1F21A9E
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28937F476;
	Mon, 15 Apr 2024 14:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVw6jYBC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D7A7E785
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713191279; cv=none; b=URbHLCuX855NAnM9FdztaBMZpjpUqEvg84rDMF4Q0qJluyyOp3aDhKEodNbWuXgqteWpOMBppHBZoGg8QcMgTn2xdRNFAhMCX1FllYK1CvoycwHuROAjqH9BFuAIH1MY2Y4jUa0CwLIrvQEbT3LdOJWcIZD9gn3J5OpG/Ge2lbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713191279; c=relaxed/simple;
	bh=2gQC+7lnYuUxaP3r0vC9gr66jI5FvDyaVwkpyj5WfBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdlHqOmhIsHf2MVcqusq90PyK5iTmRiLBkA1oZFlJOFuHLUy32yHiW8qoA/QdzIGf0KLMhJuanBdyaivcE12gggVL/r+sSCI+TneH7wwj5MerVt6mcBFkd3rs9oDx9nIAc7dMLtdWmXocElt31IbSoDUwRolWIRQnZUnuqk/fbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVw6jYBC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713191278; x=1744727278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2gQC+7lnYuUxaP3r0vC9gr66jI5FvDyaVwkpyj5WfBk=;
  b=EVw6jYBCzw5hGIc3F0CeXzJMHmQOeCy29nY138m9bDQn2dwDynouGfpY
   Hawd3W/QcZJ6S74XpIV5gADrHsY7/ixrSpgqiVYLYsTODHHc36pyLiN/y
   sCnVZ/Uw1aBU/4UbgPWfsB9skGA0nJEFJUntHX7/nn/8t36vf1ad0ZnJF
   H2sbrjqsdluBJ61ILWUbHY5dD4Y4jbTqFkdeV/SOX9CeYMBPodE9Jc9uX
   QUdTKiNwaCFDhpPZ/5R44dFEpWfsujEQdMdTbgHAGTvJjj3YQLXadWYIi
   jkX++BU4T7ndTr4TXLNAoyrfrrR/txNzfagiGZpERlYt0pFIGL81Zq4sv
   Q==;
X-CSE-ConnectionGUID: RhuUkPggTa6bADO3RF+DCA==
X-CSE-MsgGUID: n2cPC5f1QQqRxLRZW3vIkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8444621"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8444621"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:27:57 -0700
X-CSE-ConnectionGUID: E3DNcbK6QD6Lc6uv/URXxw==
X-CSE-MsgGUID: Pya8uf1LTO6xKDx27qEYFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="52876329"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:27:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B357C11FCCF;
	Mon, 15 Apr 2024 17:27:51 +0300 (EEST)
Date: Mon, 15 Apr 2024 14:27:51 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 07/38] media: Documentation: Additional streams
 generally don't harm capture
Message-ID: <Zh05ZyZFxdLy4WG9@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-8-sakari.ailus@linux.intel.com>
 <20240319234831.GL8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319234831.GL8501@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Mar 20, 2024 at 01:48:31AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:24:45AM +0200, Sakari Ailus wrote:
> > Having extra streams on the source end of the link that cannot be captured
> > by the sink sub-device generally are not an issue, at least not on CSI-2
> > bus. Still document that there may be hardware specific limitations. For
> 
> s/hardware specific/hardware-specific/

Yes.

> 
> > example on parallel bus this might not work on all cases.
> 
> s/bus/buses/

Works for me. We should probably consider renaming "the parallel bus" as
DVP (a spec exists) or something alike, outside this context naturally.

> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  Documentation/userspace-api/media/v4l/dev-subdev.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index f375b820ab68..a387e8a15b8d 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -529,9 +529,9 @@ the its sink pad and allows to route them individually to one of its source
> >  pads.
> >  
> >  Subdevice drivers that support multiplexed streams are compatible with
> > -non-multiplexed subdev drivers, but, of course, require a routing configuration
> > -where the link between those two types of drivers contains only a single
> > -stream.
> > +non-multiplexed subdev drivers. However, if the driver at the sink end of a link
> > +does not support streams, then only the stream 0 on source end may be
> 
> s/the stream 0 on source end/stream 0 of the source/
> 
> > +captured. There may be additional hardware specific limitations.
> 
> s/hardware specific/hardware-specific/
> 
> Or maybe
> 
> There may be additional limitations specific to the sink device.

Sounds good.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks!

> 
> >  
> >  Understanding streams
> >  ^^^^^^^^^^^^^^^^^^^^^
> 

-- 
Kind regards,

Sakari Ailus

