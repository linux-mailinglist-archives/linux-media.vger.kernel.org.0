Return-Path: <linux-media+bounces-22582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF129E3642
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 10:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E117168A80
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 09:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAA61632FE;
	Wed,  4 Dec 2024 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DYdwgcEz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D7D190058
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733303421; cv=none; b=JIYlEOPZdF5AbH0qor6/irXqF8ZzgR36QhQaDftwOuupqYx1HOG9i0g9mFab73M/VJXSeXyON0Om4UekRn0Hp0LbB15GaB259dY5FUFJ7mKIx0WRI3U7jUragU3/lErpd9ao4dM3qQke+hInEQHC2AI2XhZPNauriDZ9F/k/ImE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733303421; c=relaxed/simple;
	bh=BEhVycsloBf55sOsxcIUajstV81Ur6DdEnSsEmAnaao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wyc11bFIunPuFdj7LXWjmbplMXIAFVxDRVfMwom4BVauoUXNhGSyOfD87pbzPYPK1CXEoWQ6Hh6L6At4XzetyDUUL57JnVEINtCSgfVZa/c7jrWjAIZC5yGX4m4aroDWgv6O1CbjF0S9sPi8QTgSCDAT+IB45RjSoLuVJOWB47A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DYdwgcEz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DCAE4D4;
	Wed,  4 Dec 2024 10:09:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733303390;
	bh=BEhVycsloBf55sOsxcIUajstV81Ur6DdEnSsEmAnaao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYdwgcEzNyDU6WOI7xacLdW5SKExhAU7ss0gtYYjUvq1RJoSKgCllUersXsslthgU
	 o5sCnjTwyfGKZ2pYbycxfc1rcPQrmQ/MtIsOuvk1vVEgcW7qZnESgnaAkLVBaxULug
	 DTOpEP0ZKQLh8on3xOkGigwQgx0oRbfkxqL6tl08=
Date: Wed, 4 Dec 2024 11:10:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [RFC] TRY state for V4L2 controls (was Re: [PATCH v2 2/4] media:
 uvcvideo: Do not set an async control owned by other fh)
Message-ID: <20241204091007.GZ10736@pendragon.ideasonboard.com>
References: <CANiDSCsXi-WQLpbeXMat5FoM8AnYoJ0nVeCkTDMvEus8pXCC3w@mail.gmail.com>
 <20241202001846.GD6105@pendragon.ideasonboard.com>
 <fb321ade-40e7-4b1e-8fcd-c6475767239d@xs4all.nl>
 <20241202081157.GB16635@pendragon.ideasonboard.com>
 <445e551c-c527-443c-8913-6999455bd366@xs4all.nl>
 <633ca07b-6795-429f-874d-474a68396f45@redhat.com>
 <9b3e21b7-1b15-4c27-9df0-0b9f31858721@xs4all.nl>
 <20241203171818.GA30248@pendragon.ideasonboard.com>
 <70a3a985-4484-4016-a383-49d084970b80@xs4all.nl>
 <20241204090205.GY10736@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204090205.GY10736@pendragon.ideasonboard.com>

Hi Hans,

Repurposing the mail thread, trimming the CC list, and adding a few
people who I expect to be interested in the new topic.

On Wed, Dec 04, 2024 at 11:02:07AM +0200, Laurent Pinchart wrote:
> On Wed, Dec 04, 2024 at 08:59:04AM +0100, Hans Verkuil wrote:
> > On 03/12/2024 18:18, Laurent Pinchart wrote:

[snip]

> > > My experience with the V4L2 control API is that we've overdesigned quite
> > > a few things, and in particular control events. The independent
> > > "capture" and "control panel" application model that V4L2 controls were
> > > designed for is not really a good fit for the 21st century anymore. The
> > > V4L2 API isn't rich enough to arbitrate between applications that are
> > > not designed to collaborate, and way too rich when applications do
> > > collaborate. The only two real use cases I found for control events are
> > > async set completion notification, and notification of automatic changes
> > > to other controls (and in particular changes to control limits) when a
> > > control is set. The second use case isn't even something that we support
> > > well today: to make it really usable, the change notification should be
> > > *synchronous* with the control set ioctl, returning the information from
> > > the same ioctl, not through asynchronous control events.

[snip]

> > Regarding the second use case: it's perfectly doable, but it would require a
> > new ioctl. You would need really good arguments for doing that.
> 
> I'm not sure I'd consider it doable. To make this trully useful we would
> need to also report the value of changed controls (including limits)
> from a S_FMT or S_SELECTION call. Yes, it could be achieved, but the
> cost of doing so is probably not worth it.

There's another change that would hopefully be simpler (but not simple),
and would bring important improvements. Controls and subdev
format/selection rectangles use a very different try model: the former
use a TRY ioctl, while the latter use a TRY context. The TRY context
makes it possible to try a full configuration of a subdev without
changing its state, where the TRY ioctl can only support trying a
control in isolation of all other parameters. This is blocking quite a
few subdev features for which we would like to use controls, and is also
problematic for existing controls (such as h/v flip or rotation, as they
affect the format). Extending the control get/set ioctls with a "which"
parameter shouldn't be difficult, but wiring that to the control
framework is the part that scares me.

To make this possible, we will need to store information about controls
in the v4l2_subdev_state. I would like to minimize the amount of
information stored there, and the complexity required to instantiate a
new state, as that should be as lightweight as possible. To that end, we
can limit the mechanism to, for instance, forbid adding new controls to
a control handler after its initialization phase. Ideally, we shouldn't
duplicate in the subdev state any information that can't change, such as
the type of a control. Only the current value and the limits should be
stored there.

We will also need to be careful about locking. This mechanism should
protect access to control information using a state-level lock and not
locks embedded deep in the control framework, as we would then suffer
from AB-BA deadlock issues.

This new mechanism would be primarily used for subdevs in a first step,
but it should be implemented in such a way to also be usable for video
devices.

Now, the real question: how can we make this happen ? :-)

-- 
Regards,

Laurent Pinchart

