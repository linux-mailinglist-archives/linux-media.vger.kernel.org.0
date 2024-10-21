Return-Path: <linux-media+bounces-19968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D10A9A5CE7
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 09:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 628A01C219FA
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 07:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1801D175D;
	Mon, 21 Oct 2024 07:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/khpjkP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BD31D1736;
	Mon, 21 Oct 2024 07:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495608; cv=none; b=ZgoynWBs3+ngEzrDAmgb7nBUVW2tVHo181GBILbh+stYO97E3kMvfxG5dZJjbCLZu8RN0VuMp67dk8bd9i6echcbwY/BeoXOT+H0gYXkUN54YAUHsxeazke0PjV0RULD6kMOBo0rSv6TzX5LuhqUGX5NbjNbiKWmAKNp6wg/MCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495608; c=relaxed/simple;
	bh=Bm6WJg0Qzq1R620qWDBrfgVNeFFDdZbjEKSrJP0Gfm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqfCGg+CL12uxd5JjUFYT6OXg71M9o7xePdvx0bc/fEs+K4FVD5f1f2pdnMKmeqI9V6AayY0y2ERq05JiSF8DxnFG11hIkMf2XLDtLeyBMxbUNQ6BJx39kbMfJlB2M2DFR5IkV5YhrSpIsqn4Py/BmyXje10+gt+uszXKYndTfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/khpjkP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729495607; x=1761031607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bm6WJg0Qzq1R620qWDBrfgVNeFFDdZbjEKSrJP0Gfm8=;
  b=S/khpjkPLw8fnOMDLljbS/Q29mHijAtqrF5RF2rAYgFc8KD+asuuPwOo
   GDfeG9vyXHQ4kLvZaE79xaJU3B3/93HKCKWQ4cEsR+BGPQvBTpPYoD7FL
   1DVArTX8zmoZ+3Vy0qUSpsU1xi7Zk6qHAKJ7jU+4zAO7MeSae97TomguZ
   eDYVt9uLxfIQh9bENIgTHmWK1CUg56uqEkQETGPT36eekwAyZ4XswynSO
   qPtGchEDPJxOs6Jq+yeV9Id4YTAOsQUoWxETBPCrRTD612eHAyge/dSeo
   gJLfhRS6UJig5m0EtuUny1rgrE8GUBt4UWFJ5TrHWJmcYOrqIKfjsW2st
   w==;
X-CSE-ConnectionGUID: 3HwINZshQQimFl3OJubRFg==
X-CSE-MsgGUID: GLayksqrQvipVjaEVIRKkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46432084"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46432084"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 00:26:47 -0700
X-CSE-ConnectionGUID: WAL+t0/XSe+r153+bJCkKQ==
X-CSE-MsgGUID: 1lj+PbORSlymnD33xCfbBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="84229174"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 00:26:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6885211F7E7;
	Mon, 21 Oct 2024 10:26:41 +0300 (EEST)
Date: Mon, 21 Oct 2024 07:26:41 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-subdev: Refactor events
Message-ID: <ZxYCMWryQl6lZxf9@kekkonen.localdomain>
References: <20241020163534.1720297-1-tomm.merciai@gmail.com>
 <20241020164354.GG7770@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020164354.GG7770@pendragon.ideasonboard.com>

Hi Laurent, Tommaso,

On Sun, Oct 20, 2024 at 07:43:54PM +0300, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> On Sun, Oct 20, 2024 at 06:35:32PM +0200, Tommaso Merciai wrote:
> > Controls can be exposed to userspace via a v4l-subdevX device, and
> > userspace has to be able to subscribe to control events so that it is
> > notified when the control changes value.
> > If a control handler is set for the subdev then set the HAS_EVENTS
> > flag automatically into v4l2_subdev_init_finalize() and use
> > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > as default if subdev don't have .(un)subscribe control operations.
> 
> I would add here
> 
> This simplifies subdev drivers by avoiding the need to set the
> V4L2_SUBDEV_FL_HAS_EVENTS flag and plug the event handlers, and ensures
> consistency of the API exposed to userspace.
> 
> And you can also add
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

I've picked this to my tree.

Please try to properly wrap the commit message the next time, most editors
can do that automatically.

-- 
Sakari Ailus

