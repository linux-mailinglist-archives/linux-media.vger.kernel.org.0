Return-Path: <linux-media+bounces-41540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271EB3FACE
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29961164BAD
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A032EB86C;
	Tue,  2 Sep 2025 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/W8N2vK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322FB27FD40
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805921; cv=none; b=GslJfrgaP1+wcOq01QxEM4zg2Fo54l9ydymX5i644hioHWWi/Hf+vIFoJ7yY8S1Ieu2OZi24Shiz7lYd0cCNg8h2o8OW6cT4EoD5+x2sHzWLK1R3mggkCnCgx40hxA78pv2wWc3oTInuQvfYpxwZ0zCHyl8AaAFQeThDVRCeL5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805921; c=relaxed/simple;
	bh=Kber4A7YkQ4Kobye4jnnWr0rZnIA5qevapqSQTumlxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2rEbcqT1WttQrjZjhspUSalVSGWeW6P00XYjF0wWPMv3ED05nCJmGg8t0qCuGQob+HEgBfz15DJz3wyonmdDs7kjueC+SNDNshpVzI2RgSdx6DXveEatosE2jr0ENKqyoNaZtN6k23s0O8zfbuPYuN02losdfOGX7DVpNIxa4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/W8N2vK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805920; x=1788341920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kber4A7YkQ4Kobye4jnnWr0rZnIA5qevapqSQTumlxo=;
  b=A/W8N2vKmLqUYm9Lz8wpwpwJrD4NpRA+fgdyV0vS22V1/IMyy7wGmTlx
   7fiuWtPXX2IyGuTK2Vr/Ke1h9uZ5PFzJjQWr7psc0BSjuEyjtSUzexhtY
   Cf5rwjBXhWukvZHh2thQi2NuA1Ua0ECJI6pVhyrA++2TsuE35YBObE74W
   SlsdIYB8KvF+tesKTrlS802QmhjQPqb78q4eVF2uyeY8vyFd34z7ot3y3
   A8DMBGZ5RqGIlgUpgXZpa4VyT+iVWu+fx1VIqpVNdXyHkQ+YfnFEdeSJj
   1+dBCb7gi7/J1cr02hhnim2h3iG3b6Ss3Zk7WXG8aUiRl/FOIqp5Yx1W5
   g==;
X-CSE-ConnectionGUID: 7DbbIXHZRhai9uWg7KJkBw==
X-CSE-MsgGUID: M1VU30AkQ3iCBdCBFdWQeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="69779381"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="69779381"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:38:39 -0700
X-CSE-ConnectionGUID: aHBbgywkSOGmd+oTTy+yNg==
X-CSE-MsgGUID: CqJlcLzGTi6jgPMc/GDbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170798498"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:38:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AD60E11F739;
	Tue, 02 Sep 2025 12:38:30 +0300 (EEST)
Date: Tue, 2 Sep 2025 12:38:30 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 03/66] media: Documentation: There are either
 immutable or mutable routes
Message-ID: <aLa7FskB6a-xgEWc@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-4-sakari.ailus@linux.intel.com>
 <natrdubf73v3vfyfhsiympdnykr546ighnvcqsoddqz7s7eif3@bhgd25gvdqea>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <natrdubf73v3vfyfhsiympdnykr546ighnvcqsoddqz7s7eif3@bhgd25gvdqea>

Hi Jacopo,

Thank you for the review.

On Mon, Sep 01, 2025 at 01:18:58PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:04PM +0300, Sakari Ailus wrote:
> > Document that each sub-device may have either immutable or mutable routes,
> > not both of them.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/userspace-api/media/v4l/dev-subdev.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index f30a98a9cf78..4da67ee0b290 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -594,6 +594,11 @@ and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
> >  called on the sub-device. Such newly created routes have the device's default
> >  configuration for format and selection rectangles.
> >
> > +A sub-device may only have either immutable routes (routes that have
> > +``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``) flag set or routes that are all user-created
> 
> The closing ) should go after 'flag set'

Ack.

> 
> > +or user-removable (routes that do not have ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``
> > +flag). This is subject to change in the future.
> 
> I take this as:
> 1) Either all routes are created by the driver and have the
>   V4L2_SUBDEV_ROUTE_FL_IMMUTABLE flag set
> 2) Or all routes are user created (and do not have the
>    V4L2_SUBDEV_ROUTE_FL_IMMUTABLE flag set)
> 
> Is this intended ? Can't we have routes that are driver created and
> are immutable and routes created by the user on the same sub-device ?

We could allow that later on but as I don't think we have a use case yet,
I'd explicitly deny that for the time being.

-- 
Kind regards,

Sakari Ailus

