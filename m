Return-Path: <linux-media+bounces-32622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11A4AB9658
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 09:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E5B63B8107
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 07:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004C21F4C98;
	Fri, 16 May 2025 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gY9mL1fr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E57442C
	for <linux-media@vger.kernel.org>; Fri, 16 May 2025 07:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747378910; cv=none; b=C9cGQZwZuUdrvOrAmOu3c4ZvQPXtT4k2kdoWe4TL2KqC0X9DdXDMLI9fsVf8DK1WIPBH82ExR8o3yhanK5F47/frLNkSVn26TKPkm6UkUKIP6cpvD5cWXS8TDdWxpDgp9C4ayjAoYAeomYq0xr3CuZCEuT1hr3ZPMjk9o81xojc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747378910; c=relaxed/simple;
	bh=qxibGpTgUK9cQkLGloloSw+ivScwBGN3vMSf/xy8m4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psc+znYBCr/KUqlbs9JUikp6mA8m9Kw9o+S5nGbuWy1ptyq+wO2R4jHJTmwrjQrOzLJmFcZ1nfgnyw2Ssm577ysQqIt7zbZ5mBb6RwdU/BjLAT0spEaCGmfgc3VrEZE97C320dbg+kf+HdYrr05rOmPdsS8NRLEOVf3fmotw4+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gY9mL1fr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (37.46.124.80.rev.sfr.net [80.124.46.37])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21C5B4AD;
	Fri, 16 May 2025 09:01:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747378887;
	bh=qxibGpTgUK9cQkLGloloSw+ivScwBGN3vMSf/xy8m4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gY9mL1frBdFkx3NTmt+J+jsVj2mcpEtvSY6a+xvZI1CczCmntFztqy0xl3B5owZq2
	 XA9ikc2L76GQ9dgtZLW7jOnFPuOtTCRooVFFE6p14+YE7GE7tPWJFgH2Sg7PebvT6U
	 JU3XSjWn1AN5fzRl/9GWGQFbWvkC6hQKq2kdEJ74=
Date: Fri, 16 May 2025 09:01:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Andrej Gardijan <andrej.gardijan@tuta.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jerry Wu <jerry.w.hu@intel.com>,
	Jesper =?utf-8?Q?Taxb=C3=B8l?= <jesper@taxboel.dk>,
	Josuah Demangeon <me@josuah.net>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Naush Patuck <naush@raspberrypi.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Ricardo Ribalda <ricardo.ribalda@gmail.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Will Robertson <w.robertson@cairnwater.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Logistics and agenda
Message-ID: <20250516070137.GA20271@pendragon.ideasonboard.com>
References: <20250512154445.GA4523@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512154445.GA4523@pendragon.ideasonboard.com>

Hello everybody,

Here's a link to the etherpad we will use to take notes today.

https://pad.systemli.org/p/libcamera-workshop-nice-2025

On Mon, May 12, 2025 at 05:44:45PM +0200, Laurent Pinchart wrote:
> Hello everybody,
> 
> I'm looking forward to seeing you all on Friday the 16th of May for the
> libcamera workshop. Here is the first agenda draft, along with logistic
> information for on-site and remote attendees.
> 
> As all workshop agendas, this is tentative and we will adjust the exact
> timing depending on how the discussions progress.
> 
> 09:00 - 09:10  Welcome and agenda bashing
> 09:10 - 09:40  Software ISP status and future plans (Hans de Goede)
> 09:40 - 10:00  Slowing down the soft ISP CPU implementation (Laurent Pinchart)
> 10:00 - 10:30  Using a single IPA with multiple pipeline handlers (Hans de Goede)
> 10:30 - 11:00  Break
> 11:00 - 11:45  Bayer reprocessing (David Plowman)
> 11:45 - 12:30  Startup frames (David Plowman)
> 12:30 - 13:30  Lunch
> 13:30 - 14:00  State of gstreamer support (Nicolas Dufresne)
> 14:00 - 14:30  Multi-context support (Nicolas Dufresne)
> 14:30 - 15:30  Per frame control (David Plowman)
> 15:30 - 16:00  Break
> 16:00 - 16:45  libcamera on Zephyr (Josuah Demangeon)
> 16:45 - 17:15  The importance of libcamera to WildCamera
> 17:15 - 17:45  TBD
> 
> Each agenda item is listed with the name of the person who proposed it.
> We expect those persons to introduce the topic (orally or with slides,
> at your discretion) and drive the discussion.
> 
> We will use Jitsi Meet for remote access. The event will be accessible
> at https://meet.jit.si/libcamera-workshop-nice-2025. We can however
> not guarantee the quality of the network connection on site.
> 
> All times are in the CEST (UTC+2) time zone. If you plan to attend
> remotely and are located in a time zone that makes the agenda items you
> are most interested in occur at an inconvenient time, please let me know
> and we will try to reorder the discussion topics.
> 
> Discussions will not be recorded, but the minutes of the workshop will
> be posted to the mailing list after the event.
> 
> The workshop will be hosted by Embedded Recipes as part of their
> workshop day (https://embedded-recipes.org/2025/workshops/) and will be
> located at the Sheraton Nice Airport (https://www.openstreetmap.org/way/1084319591)
> a few minutes away from the Embedded Recipes location. For more
> information refer to https://embedded-recipes.org/2025/attend/#getting-there-block.
> 
> Lunch is included and complimentary for attendees. We will go off-site
> to Fragrance Culinaire - Arénas (https://maps.app.goo.gl/cKuspzV8PSKeWuqD9).
> The restaurant offers salads and sandwiches and can cater for vegetarian
> diets. If you have a more restrictive diet, please let me know.

-- 
Regards,

Laurent Pinchart

