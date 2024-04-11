Return-Path: <linux-media+bounces-9092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EFF8A0BE9
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 11:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76DBEB27459
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 09:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194CF1448C7;
	Thu, 11 Apr 2024 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2MPE7Od"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB51E143C77
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712826424; cv=none; b=qMLd9GJxHhT3tOxyTLNHkfH2CDdnGLpOH14kKhCEbiDy7FWlBjzUm51+lpQK1ZJYCzEa3rPTWAFVOrjj9Q/Y3sMIB0V5JBWqzCZUPsHkMb5fZM7oks025oC61B4UuaYAKF2tMpaW0zRBIR4/yXvjRGYEjbuAIyqZvQ4PlvEqHbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712826424; c=relaxed/simple;
	bh=b3qZaVC9dRSq+6WuN3IDV3AJj3u5s8na30I+/Y6pGLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnsEN7gEMU7YNV6O5hlkGzFfBCCJ+pfYP5tUBskv2HlUoK3PJEW6PkV+9aK8zltZfsoDxX28SKefcWzMIFxCyq97bMnmMCRbwGu+WMpXa+XlN49wH7G1G49sBh+N0LUW4Bfcdoa0uBe0IC1BIAIPMKRoVZynnk9SOdNvQ6EqD2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2MPE7Od; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712826422; x=1744362422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b3qZaVC9dRSq+6WuN3IDV3AJj3u5s8na30I+/Y6pGLw=;
  b=e2MPE7OdRFTsZ2qU9WLXG4Iqu+XTpLnuYBkv2gfOaMBHQsv72Ko0jZTk
   /Mxq8QnPSBTbNAKSY9Lblag5p9aRZgZYP7zGkdHCdBALFgYwhUmFfREBD
   Js9fma51NFmhgjfUqMp5K6RElfd/QNGOzTVYkPByj/sc0vKzcy1ibrsW9
   JBEYa0lOM2goEAvh0mM52Q0Jw06VWU1TRzp/RK+9Mu78fw55EcorbHYkZ
   iODXFafX3Wmh5BrIk82A3ljs00ouye0Ds+2JIdE2aVdfDCecRUW7vAbLr
   kcO9sQ6XwePFjA0z87cJdsArUfEiNVVNqqzVyXdkk/oBrQ1Rt75KJawkJ
   g==;
X-CSE-ConnectionGUID: w/WBFGaTSnCiGxP+T3LZiw==
X-CSE-MsgGUID: 7QHKwlsiQjSQrIouK+ccBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11186736"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="11186736"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:07:02 -0700
X-CSE-ConnectionGUID: GdlxCIYzRNOMaA7VQFeKVA==
X-CSE-MsgGUID: hygU7aRGQsWpsm4UTR2Ayg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20801120"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:06:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 72BD212035C;
	Thu, 11 Apr 2024 12:06:56 +0300 (EEST)
Date: Thu, 11 Apr 2024 09:06:56 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 37/38] media: ccs: Add IMMUTABLE route flag
Message-ID: <ZheoMEigfH4dTkEs@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-38-sakari.ailus@linux.intel.com>
 <20240321165935.GI9582@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321165935.GI9582@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Mar 21, 2024 at 06:59:35PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:25:15AM +0200, Sakari Ailus wrote:
> > Add immutable route flag to the routing table.
> 
> I would write here that the metadata stream route is immutable as CCS
> sensors don't offer a way to disable embedded data. Or if they do, that
> it's currently unimplemented :-) I would then also possibly add a todo
> comment to the code.

They don't. Probably because it's mandatory and there are no important
reasons to disable it.

> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks!

> 
> > ---
> >  drivers/media/i2c/ccs/ccs-core.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > index 838daab212f2..5205d1ecf8f2 100644
> > --- a/drivers/media/i2c/ccs/ccs-core.c
> > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > @@ -3368,12 +3368,14 @@ static int ccs_src_init_state(struct v4l2_subdev *sd,
> >  			.sink_pad = CCS_PAD_SINK,
> >  			.source_pad = CCS_PAD_SRC,
> >  			.source_stream = CCS_STREAM_PIXEL,
> > -			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> > +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
> >  		}, {
> >  			.sink_pad = CCS_PAD_META,
> >  			.source_pad = CCS_PAD_SRC,
> >  			.source_stream = CCS_STREAM_META,
> > -			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> > +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
> >  		}
> >  	};
> >  	struct v4l2_subdev_krouting routing = {
> 

-- 
Regards,

Sakari Ailus

