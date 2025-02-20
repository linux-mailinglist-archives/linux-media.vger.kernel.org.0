Return-Path: <linux-media+bounces-26479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D630FA3DD17
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A71E47A75E8
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881B51FCCF8;
	Thu, 20 Feb 2025 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ix5yJ1MN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4987A1F9A8B;
	Thu, 20 Feb 2025 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740062362; cv=none; b=hBq+yi00Adkqtz90HXQPKDguMKP708BHw2auEL5PzjwPQYfcudj1gv1KefD+lweLJVz87vMhK1AL20/dU6dezKRuitwRJRercLCD1O4WwP5hKi4eMVrJ2/2qOaDJ9gYvhfCX4utkBzHiG06yGrk1mdk2O+JoyRTanPKqwptrj9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740062362; c=relaxed/simple;
	bh=iLN8B9ksN1GWWVoWVQYBbBJYJyiBr+s/2FAxSdsnkwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouHhBYhNV13Iw6gr3bc72kxoK5W4YyBNcCXn/ANfL5pUE3CCjcVSAk6afeHT4oNrugcbphLCQYSOnEnoJCF8M0caUOLkkT8SWV+3wP46FKbxtczJgsOM+z4finQV2j5EeUhR5UO3bSARs8+skZHAkeBPS07TUUtr1qeI9wP5V5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ix5yJ1MN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 716881193;
	Thu, 20 Feb 2025 15:37:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740062274;
	bh=iLN8B9ksN1GWWVoWVQYBbBJYJyiBr+s/2FAxSdsnkwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ix5yJ1MNLbToTzjhWXv1kPGV+NribVBMxOfjCISY3kBKoor1qeqmue2KOaVn9Elun
	 yAZX8xvnBq34+BFHbklcx77G6lqUeyCL8CqExMt9c4jWKJkpp8weUbzT0+S/9pMA3+
	 iAhC+RUnOTS7ms8NZiaJSnCW2R9nxIGz2uGKgKfY=
Date: Thu, 20 Feb 2025 16:39:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Cosmin Tanislav <demonsingur@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
Message-ID: <20250220143902.GA17500@pendragon.ideasonboard.com>
References: <20250220092036.6757-1-demonsingur@gmail.com>
 <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
 <c94580f0-3ab0-4a19-a996-9bb37e23dd39@gmail.com>
 <Z7c5U6u5rr0-X0aK@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z7c5U6u5rr0-X0aK@kekkonen.localdomain>

On Thu, Feb 20, 2025 at 02:16:51PM +0000, Sakari Ailus wrote:
> On Thu, Feb 20, 2025 at 03:01:41PM +0200, Cosmin Tanislav wrote:
> > On 2/20/25 1:38 PM, Jacopo Mondi wrote:
> > > On Thu, Feb 20, 2025 at 11:20:32AM +0200, Cosmin Tanislav wrote:
> > > > Currently, the v4l2_subdev_state_xlate_streams() function is used
> > > > to translate streams from one pad to another.
> > > > This function takes the entire subdev state as argument, but only makes
> > > > use of the routing.
> > > 
> > > Correct, but is this a problem ?
> > > 
> > 
> > No, it's not a problem.
> 
> I think I have a slight preference to keep the pattern of referring to the
> state as other functions do.
> 
> I wonder what Laurent and Hans think, too.

I agree, I think the state should be passed everywhere. This lowers the
risk of subsystem-wide refactoring if a function that receives a pointer
to part of a state (such as v4l2_subdev_routing_xlate_streams()) is
later found to need more information from the state.

The situation would be different if the states were not monolithic, for
instance if the routing table could be locked separatly from other parts
of the state, but that's not the case and I don't foresee moving to
finer-grained objects.

> > > Is this the first step for a larger rework or is this a drive-by
> > > beautification ?
> > 
> > Mostly a drive-by beautification to avoid passing the whole state around
> > where we only need the routing. I'm planning to submit drivers for more
> > GMSL2/3 chips and we're using this just to not pass the whole state
> > around. I think I can just use v4l2_subdev_state_xlate_streams(),
> > but I had these patches in my tree and it would have been good to get
> > them upstream, in preparations for submitting the GMSL2/3 drivers.
> > 
> > > I'm asking because (and I know it's hard to strike a balance) this
> > > kind of changes tend to make back-porting a more painful, and if
> > > only justified by "it looks better" I would be a bit hesitant in
> > > taking them.
> > > 
> > > > Introduce a v4l2_subdev_routing_xlate_streams() function which can be
> > > > used without the entire subdev state, to avoid passing the entire state
> > > > around when not needed.
> > > > 
> > > > Convert all usages of v4l2_subdev_state_xlate_streams() to
> > > > v4l2_subdev_routing_xlate_streams().
> > > > 
> > > > Remove v4l2_subdev_state_xlate_streams().
> > > > 
> > > > V2:
> > > >    * Fix description of parameters
> > > > 
> > > > Cosmin Tanislav (3):
> > > >    media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
> > > >    media: use v4l2_subdev_routing_xlate_streams()
> > > >    media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
> > > > 
> > > >   drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
> > > >   drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
> > > >   drivers/media/i2c/max96714.c                  | 16 ++++++-------
> > > >   drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
> > > >   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
> > > >   .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
> > > >   drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
> > > >   include/media/v4l2-subdev.h                   | 10 ++++----
> > > >   8 files changed, 53 insertions(+), 47 deletions(-)

-- 
Regards,

Laurent Pinchart

