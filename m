Return-Path: <linux-media+bounces-37800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D68B065DC
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28481AA6B8F
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 18:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC1F2BDC2B;
	Tue, 15 Jul 2025 18:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BOxWgBjl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C201DF98D
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 18:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752603489; cv=none; b=ips7Vsgyb7q5OeqJPBhizvs4+xSKHu2PnDDfBEUPNd1ETRO8BGTAVsaGKYgH8PFpLHs8IJnJgxR8vxDk71QC2Vb2VPiX6/rZgySTtB/qmskEq0O09NtzWFVx4f6PwIAPtXtMGbQ/juIjmMqsFr3cS+RnobiKiNXy1bPAueXwYXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752603489; c=relaxed/simple;
	bh=MfBXYTLZ376Eb3B4UztNhAn0lb3h9+qkgj2XeOupybw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkY9CPIOPLcTgPWPxw0TBK9q6xG96JV5SIs6tmhyTHVqJcTuZ4SshOFjofIU02f2jY0jyomu4N+Bngm73H2xYhMdHsJj1apViGLGIpoiLG5aiitZZqvfsbydTX+3j9te28W4ijfdPASgHIekDCnrOeQzAVwGOMaUxx9wdXbU2/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BOxWgBjl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B158878E;
	Tue, 15 Jul 2025 20:17:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752603453;
	bh=MfBXYTLZ376Eb3B4UztNhAn0lb3h9+qkgj2XeOupybw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOxWgBjl4t07F7vDE+MwSBq1iHLP6NzgcDMgBfer6UFAuXejsJyfqTzjyqz0t+wAW
	 C3qOHNj4TluZjbpYLaIIaZkZD/d30H5ZK6C74XiiS7mt3TopjRLN8hyUo28TWj5405
	 gq4CTDzEMwLx5YBcs7Je2C0FMdYLKlJbXa4ZH3GE=
Date: Tue, 15 Jul 2025 21:18:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 12/13] media: v4l2-mc: Introduce
 v4l2_mc_pipeline_enabled()
Message-ID: <20250715181804.GJ20231@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-13-sakari.ailus@linux.intel.com>
 <zubhgen5vcjeadujrufagjd3h6rp5va7d7n27fqisc23kr35sn@sg4mwenwnbmc>
 <aHYyPMcwt3WBzJur@kekkonen.localdomain>
 <20250715112520.GH20231@pendragon.ideasonboard.com>
 <aHY8PgcfOMRVPsBQ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aHY8PgcfOMRVPsBQ@kekkonen.localdomain>

On Tue, Jul 15, 2025 at 11:32:14AM +0000, Sakari Ailus wrote:
> On Tue, Jul 15, 2025 at 02:25:20PM +0300, Laurent Pinchart wrote:
> > On Tue, Jul 15, 2025 at 10:49:32AM +0000, Sakari Ailus wrote:
> > > On Fri, Jun 20, 2025 at 10:53:13AM +0200, Jacopo Mondi wrote:
> > > > On Thu, Jun 19, 2025 at 11:15:45AM +0300, Sakari Ailus wrote:
> > > > > v4l2_mc_pipeline_enabled() helps solving a problem known for long but
> > > > > lacked any sort of general solution: with multiple streams, when streaming
> > > > > is started on video nodes one by one, when should streaming be started in
> > > > > the source?
> > > > 
> > > > I tried quite some time to understand this, but if I'm not mistaken,
> > > > a stream-aware subdev, which links to vdev, will always "demux"
> > > > streams to different pads and will connect to the vdev from there
> > > > 
> > > > 
> > > >      Source
> > > >      subdev
> > > >  +-----------------+
> > > >  |                (1/0) ------> vdev0
> > > >  |                 |
> > > > (0)[1,2,3]        (2/0  ------> vdev1
> > > >  |                 |
> > > >  |                (3/0) ------> vdev2
> > > >  +-----------------+
> > > > 
> > > > With
> > > > 
> > > > (0) multiplexed sink pad with 3 streams
> > > > (1) (2) and (3) source pad with a single stream
> > > > 
> > > > Can't we relay on the media-link state between the source pads and the
> > > > video devices with something like what Dan has proposed here ?
> > > > https://patchwork.linuxtv.org/project/linux-media/patch/20250519140403.443915-2-dan.scally@ideasonboard.com/
> > > 
> > > This isn't entirely the same thing: pipeline is specific to the pad but not
> > > streams, ad here we're interested in streams. Two streams may start at
> > > different points of time even if both are part of the same pipeline.
> > > 
> > > We definitely should have just one way to figure this out.
> > 
> > But can we ? Isn't it dependent on use cases ? I can imagine an
> > application wanting to capture two image streams where one of them is
> > enabled all the time and the other one is regularly turned on and off,
> > in which case you would need to start the pipeline when the first stream
> > starts. A different application may instead want to capture the same two
> > streams and make sure it gets all frames on both, which possibly
> > requires delaying the start of capture until both video capture devices
> > are started.
> 
> Exactly. It's indeed dependent on the use case but the driver is the same
> in both cases. This is why the generic solution needs more information from
> the user space but I think we can work out how to support this after
> merging the metadata series.

Yes, we need more information from userspace.

It's also a driver-dependent behaviour. If the streams come from
multiple cameras that all go through the same deserializer (e.g. a quad
FPD-Link or GMSL deserializer), then the decision on when to start
streaming on some of the components in the pipeline could depend on
which deserializer is used. Some will require all cameras to be started
together, while other could allow starting and stopping sources
independently. The nature of upstream elements could influence when
downstream elements will need to be started, for the same
userspace-facing behaviour.

-- 
Regards,

Laurent Pinchart

