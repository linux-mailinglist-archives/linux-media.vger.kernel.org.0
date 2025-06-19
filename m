Return-Path: <linux-media+bounces-35448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D2CAE0F86
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 00:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4660418950C7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3007221D96;
	Thu, 19 Jun 2025 22:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HeU5r18v"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882E930E826
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 22:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750371559; cv=none; b=qR1qXHM9qZKNze7cqzLe3a/JL7FiC5tLCIs9XzTgxOYVwJmU0fPBidwVOWXCxg3AElGD4evy/2P2SCqu3bHM5Tk9yUKpFu5/4umWNqYWAhcfmly4TtAf9PiZFMWY5ejCcp1x2oPy2zbaFI5xPNoHzuF9BQlPwl1jIndEPyI0sJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750371559; c=relaxed/simple;
	bh=35Bak+JQaB8hibA9WRTb826vXr9lcB2WKciECVVlvqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8FiSTh7fU+cFCTeEMOHAoQI2TZS2Y+ct5+YohTDUPSl7G/j6nBbKHNi2fyNJnqC3XlTprpqrWTXjSwt5M74Ajb7fzz0f9zDkcJIghkHRMKVxktjHqOHhh9+w9WSP0HqvVkJzkoEQiR2+n7PSYxku6RMYI5Qx60lQpcwN9JLTFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HeU5r18v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAD35E45;
	Fri, 20 Jun 2025 00:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750371542;
	bh=35Bak+JQaB8hibA9WRTb826vXr9lcB2WKciECVVlvqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HeU5r18vXam1HwlrcyaSsJ4lkCfewFInnVDFcqk2GS5y+78d7CvJvchxMzja5UzCa
	 ZigqmIDTkUfjd7dyVvjGdmn3PYgp9Z3aPwLgdakX1NMYzcKoBj1LPbD20Sw/IzTRE3
	 tvduYsBYBYKNH/aMc4gRC4W/jz+Rc8zHaXwxAldY=
Date: Fri, 20 Jun 2025 01:18:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 06/13] media: v4l2-subdev: Mark both streams of a route
 enabled
Message-ID: <20250619221857.GM32166@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-7-sakari.ailus@linux.intel.com>
 <20250619165604.GH32166@pendragon.ideasonboard.com>
 <aFRYMWoi9vpsdYKa@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFRYMWoi9vpsdYKa@kekkonen.localdomain>

On Thu, Jun 19, 2025 at 06:34:25PM +0000, Sakari Ailus wrote:
> On Thu, Jun 19, 2025 at 07:56:04PM +0300, Laurent Pinchart wrote:
> > On Thu, Jun 19, 2025 at 11:15:39AM +0300, Sakari Ailus wrote:
> > > Streams are stored in sink-source pairs in sub-device state.
> > 
> > Is it really this simple ? Don't we support for instance stream merging
> > where two streams on possibly different sink pads are routed to a single
> > stream on a source pad ?
> 
> As far as I'm concerned, yes. Each route has a sink and a source pad, you
> may have multiple routes from a pad or to a pad, but these are all separate
> routes. The UAPI as well as v4l2-subdev.c is aligned with this and I
> wouldn't expect it to be otherwise.

Should we then refactor v4l2_subdev_stream_configs to contain a list of
route configs, with each route config containing two stream configs, one
for the sink pad and one for the source pad ? We would still have
duplicated entries when multiple routes originate from or end at the
same pad/stream, but the data structures would be more explicit and we
would rely less on the fact that each route has a pair of consecutive
stream configs.

> I'd like to have Tomi's view on this, too.
> 
> > > When a stream
> > > was marked enabled (or disabled), only the state of one end of the stream
> > > was modified, leaving the stream in an incoherent state. Mark both ends of
> > > the stream enabled (or disabled).
> 
> This should discuss "route" in fact, not "stream".

That would make it a bit clearer.

-- 
Regards,

Laurent Pinchart

