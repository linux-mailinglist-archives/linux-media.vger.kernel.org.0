Return-Path: <linux-media+bounces-37775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC833B058E0
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B7351891291
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 11:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC8F27464A;
	Tue, 15 Jul 2025 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKhtKCjL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF688462
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752579142; cv=none; b=N6V+9WQSZZqaMVAmcXhDg+NNyo+zrO0HWk18yRLm3aFGzxHjFJ0syPG6hy+Fp1kYFTBJcAAsMQa3821jvouPEyEGcnlo7UwitOfy8N7p4/O3kA13+EmYyBLN3yeiT0kuc9PjOkAyyvD2ldzf5Rdoyv0zWMVuS8oLKT5Aspb2aBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752579142; c=relaxed/simple;
	bh=RsvgqTOa+0U/iDGF++YXgywCmvEv7pUyGy7VjfbJirY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5GtrjAlni1uMnyTLhhWMOyC8XDqZWFCBX22UwxIufA8FNHUnSokbU/hO/YMju2zxycSi1sxRdjRCd2xZA9KF5Ie0wSPQjZTSdGHtfRe0VVNW0a4uIG6c77YrAthWLR2WVpuvBXsUk8l0C5j2mIHUAS37TTS/IVgI6MCcmKgK8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKhtKCjL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752579140; x=1784115140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RsvgqTOa+0U/iDGF++YXgywCmvEv7pUyGy7VjfbJirY=;
  b=GKhtKCjLZrPUrfxRcbupIa28BDMIx1sa59GkSvHH6P5nfefNJnBqg8YS
   Tp9vDEt+ooSTW4KDTsNjKwqCK0wVnDwEx5yjKoCDB+NDFua1BYmLPj5SQ
   UHtA0JSepmAA9ytc+CbrpKqvm45oMVVrwZFYTrLR1PrRi+5nKukrrTUbR
   vkSPPxZ8ZOVbubWQ7MXCjzkldvJGCIwXPSadt6NrxFZbmVkJwMApD5kOX
   hAB5e8EF8csulWvla3vgrP6KOZh4mB/6KuTubxgM359ywrABA4sv2v9Z6
   gJbN/YhykOy9lpqoBbBu5/hF2n9r4QYlaWZ+lZW/4pv6WwT9BX4SYTo2y
   A==;
X-CSE-ConnectionGUID: rCOgg8yKQDuuA+lKCGPURA==
X-CSE-MsgGUID: hk9QxFuARs6KLQQiLQxWUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="57404121"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="57404121"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 04:32:19 -0700
X-CSE-ConnectionGUID: 8zf7B/tgRCmfbNvArRktqw==
X-CSE-MsgGUID: zgDh5baNSjm9yf00M6Gaow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="161514241"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.145])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 04:32:17 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A292A11F8D4;
	Tue, 15 Jul 2025 14:32:14 +0300 (EEST)
Date: Tue, 15 Jul 2025 11:32:14 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 12/13] media: v4l2-mc: Introduce
 v4l2_mc_pipeline_enabled()
Message-ID: <aHY8PgcfOMRVPsBQ@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-13-sakari.ailus@linux.intel.com>
 <zubhgen5vcjeadujrufagjd3h6rp5va7d7n27fqisc23kr35sn@sg4mwenwnbmc>
 <aHYyPMcwt3WBzJur@kekkonen.localdomain>
 <20250715112520.GH20231@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715112520.GH20231@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Jul 15, 2025 at 02:25:20PM +0300, Laurent Pinchart wrote:
> On Tue, Jul 15, 2025 at 10:49:32AM +0000, Sakari Ailus wrote:
> > On Fri, Jun 20, 2025 at 10:53:13AM +0200, Jacopo Mondi wrote:
> > > On Thu, Jun 19, 2025 at 11:15:45AM +0300, Sakari Ailus wrote:
> > > > v4l2_mc_pipeline_enabled() helps solving a problem known for long but
> > > > lacked any sort of general solution: with multiple streams, when streaming
> > > > is started on video nodes one by one, when should streaming be started in
> > > > the source?
> > > 
> > > I tried quite some time to understand this, but if I'm not mistaken,
> > > a stream-aware subdev, which links to vdev, will always "demux"
> > > streams to different pads and will connect to the vdev from there
> > > 
> > > 
> > >      Source
> > >      subdev
> > >  +-----------------+
> > >  |                (1/0) ------> vdev0
> > >  |                 |
> > > (0)[1,2,3]        (2/0  ------> vdev1
> > >  |                 |
> > >  |                (3/0) ------> vdev2
> > >  +-----------------+
> > > 
> > > With
> > > 
> > > (0) multiplexed sink pad with 3 streams
> > > (1) (2) and (3) source pad with a single stream
> > > 
> > > Can't we relay on the media-link state between the source pads and the
> > > video devices with something like what Dan has proposed here ?
> > > https://patchwork.linuxtv.org/project/linux-media/patch/20250519140403.443915-2-dan.scally@ideasonboard.com/
> > 
> > This isn't entirely the same thing: pipeline is specific to the pad but not
> > streams, ad here we're interested in streams. Two streams may start at
> > different points of time even if both are part of the same pipeline.
> > 
> > We definitely should have just one way to figure this out.
> 
> But can we ? Isn't it dependent on use cases ? I can imagine an
> application wanting to capture two image streams where one of them is
> enabled all the time and the other one is regularly turned on and off,
> in which case you would need to start the pipeline when the first stream
> starts. A different application may instead want to capture the same two
> streams and make sure it gets all frames on both, which possibly
> requires delaying the start of capture until both video capture devices
> are started.

Exactly. It's indeed dependent on the use case but the driver is the same
in both cases. This is why the generic solution needs more information from
the user space but I think we can work out how to support this after
merging the metadata series.

-- 
Regards,

Sakari Ailus

