Return-Path: <linux-media+bounces-32312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBF2AB3EFB
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 19:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB66C3AFB2D
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 17:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88E11D5178;
	Mon, 12 May 2025 17:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xz/F5z9s"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B94129345A
	for <linux-media@vger.kernel.org>; Mon, 12 May 2025 17:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070803; cv=none; b=n3NgZ1d0m1Y+iVTLU1k0EwmK+mnRltLWjPdMYjrARS35NqF66iUVUYeuDLDug+aseeDHEhsaCkP0I+W9c8SmEWZzjDK4DFwdcf/j+7dkLjr+RSRNHsH7s1WP1+hfDZxkTTh0gB6ogno8UJZSAwJFkae6b92fTqxRwTyLq1J5FgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070803; c=relaxed/simple;
	bh=q7/ivpe5om0eCgjXqslDebWWnfk6XktLP6fP4Wo+3M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtejuFHiUvGbc2sEs+Os7nG9mUlVBcoR2ChN/MMeKXz8sO7+gL/+KFE624aoJdmDe90dU6Wu1+SMNzXXeusLFWTaLIp/Xjh9O6gPNtNED/QbtzpSu/o/IuxZHjEy3niNaae/6oiLANQJRdnvk40JGuVlwOx6CMsHzgvxCSOF/Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xz/F5z9s; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (static-176-133-119-130.ftth.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F171E8CB;
	Mon, 12 May 2025 19:26:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747070783;
	bh=q7/ivpe5om0eCgjXqslDebWWnfk6XktLP6fP4Wo+3M0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xz/F5z9sV2CsQmXatoN8DaC8cExLw8g7M1Il+83HcD+CsomTshQ84jxPeL/WzJmQz
	 P7CtdlVBNN1p1OrxMpAM6/Gws9NYWZXo7YZ8Nt7a2JSYB2+0Fk7jKVAUrhDnKc0m8z
	 vnSuY1I8HVFDJv2DzSXfHgbn+8KIp9e1XNRAu8EU=
Date: Mon, 12 May 2025 19:26:30 +0200
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
Message-ID: <20250512172630.GA12932@pendragon.ideasonboard.com>
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

Two small corrections already. The first one fixes Devarsh e-mail
address in the recipients list, the second one is for the agenda below.

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

This topic was requested by Nicolas, but Jacopo will drive the
discussion, following up on his presentation at the Linux media summit
tomorrow.

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

