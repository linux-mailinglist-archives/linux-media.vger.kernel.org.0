Return-Path: <linux-media+bounces-2113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F32CE80D009
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 16:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68601B215AA
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 15:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59614BABD;
	Mon, 11 Dec 2023 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ob70BI/b"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72387BD;
	Mon, 11 Dec 2023 07:48:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6C3B842;
	Mon, 11 Dec 2023 16:47:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702309650;
	bh=usacIR9MpBzDyrH2XKzlytv8V55s5MTOhf7tWpvrlL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ob70BI/b6sBhBv8KNfh/dp68dpuUgfrdx/+QYcgnvtsCl//GpXJLKi4icTTyOpgu3
	 S6otT860YpuAAobRckRAa38AEjfnYL7bTpaxybtYuO9nBzV/GQ2dYkqSyA5Gn9XoNI
	 N0Ey35UYT9MHcZh7Oo7cVrWXm35dM8JM3y2IOie4=
Date: Mon, 11 Dec 2023 17:48:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Leon Luo <leonl@leopardimaging.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Pavel Machek <pavel@ucw.cz>, Philipp Zabel <p.zabel@pengutronix.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 3/8] media: v4l2-subdev: Add which field to struct
 v4l2_subdev_frame_interval
Message-ID: <20231211154820.GA16418@pendragon.ideasonboard.com>
References: <20231208181648.13568-3-laurent.pinchart@ideasonboard.com>
 <20231209065501.3e989d9a@coco.lan>
 <20231209111153.GB13421@pendragon.ideasonboard.com>
 <2a656afd-0ea8-4db2-a7bf-68c3a0300988@xs4all.nl>
 <20231211125343.25e6e543@coco.lan>
 <370e6529-9edc-4f1c-ac25-f250597b56ca@xs4all.nl>
 <20231211142119.0e933e30@coco.lan>
 <20231211150703.GF12450@pendragon.ideasonboard.com>
 <d7b081b9-0967-4854-91dc-8033f181edb7@xs4all.nl>
 <20231211154233.GD13421@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231211154233.GD13421@pendragon.ideasonboard.com>

On Mon, Dec 11, 2023 at 05:42:37PM +0200, Laurent Pinchart wrote:
> On Mon, Dec 11, 2023 at 04:27:27PM +0100, Hans Verkuil wrote:
> > On 11/12/2023 16:07, Laurent Pinchart wrote:
> > > On Mon, Dec 11, 2023 at 02:21:19PM +0100, Mauro Carvalho Chehab wrote:
> > >> Em Mon, 11 Dec 2023 13:25:23 +0100 Hans Verkuil escreveu:
> > >>> On 11/12/2023 12:53, Mauro Carvalho Chehab wrote:
> > >>>> Em Mon, 11 Dec 2023 09:59:25 +0100 Hans Verkuil escreveu:
> > >>>>> On 09/12/2023 12:11, Laurent Pinchart wrote:  
> > >>>>>> On Sat, Dec 09, 2023 at 06:55:01AM +0100, Mauro Carvalho Chehab wrote:    
> > >>>>>>> Em Fri,  8 Dec 2023 20:16:43 +0200
> > >>>>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> > >>>>>>>    
> > >>>>>>>> Due to a historical mishap, the v4l2_subdev_frame_interval structure
> > >>>>>>>> is the only part of the V4L2 subdev userspace API that doesn't contain a
> > >>>>>>>> 'which' field. This prevents trying frame intervals using the subdev
> > >>>>>>>> 'TRY' state mechanism.
> > >>>>>>>>
> > >>>>>>>> Adding a 'which' field is simple as the structure has 8 reserved fields.
> > >>>>>>>> This would however break userspace as the field is currently set to 0,
> > >>>>>>>> corresponding to V4L2_SUBDEV_FORMAT_TRY, while the corresponding ioctls
> > >>>>>>>> currently operate on the 'ACTIVE' state. We thus need to add a new
> > >>>>>>>> subdev client cap, V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL, to indicate
> > >>>>>>>> that userspace is aware of this new field.
> > >>>>>>>>
> > >>>>>>>> All drivers that implement the subdev .get_frame_interval() and
> > >>>>>>>> .set_frame_interval() operations are updated to return -EINVAL when
> > >>>>>>>> operating on the TRY state, preserving the current behaviour.
> > >>>>>>>>
> > >>>>>>>> While at it, fix a bad copy&paste in the documentation of the struct
> > >>>>>>>> v4l2_subdev_frame_interval_enum 'which' field.    
> > >>>>>>>
> > >>>>>>> The uAPI change looks ok to me. However, having to add an special
> > >>>>>>> logic on every client using (get/set)_time_interval seems risky,
> > >>>>>>> as it will require an extra check before accepting new subdev
> > >>>>>>> drivers.
> > >>>>>>>
> > >>>>>>> Please move such check to drivers/media/v4l2-core/v4l2-subdev.c:
> > >>>>>>>
> > >>>>>>> 	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> > >>>>>>> 		return -EINVAL;    
> > >>>>>>
> > >>>>>> But then no new driver will be able to use this API. Look at patch 8/8
> > >>>>>> in this series, the whole point of this exercise is to support
> > >>>>>> V4L2_SUBDEV_FORMAT_TRY in drivers. The added checks in existing drivers
> > >>>>>> is because they don't support V4L2_SUBDEV_FORMAT_TRY. Moving forward,
> > >>>>>> the drivers that are still maintained should be converted eventually.  
> > >>>>
> > >>>> Then please add a FIXME note there warning that the logic there
> > >>>> exists just because the driver doesn't yet support V4L2_SUBDEV_FORMAT_TRY.  
> > >>>
> > >>> I think there are two types of cases here: the first case is when the subdev
> > >>> does not support TRY at all for any of the pad ops, i.e. it can't be used by
> > >>> MC-centric drivers.
> > >>>
> > >>> In that case a top-level comment to that effect might be useful (that can be
> > >>> done in a separate patch).
> > >>
> > >> Agreed.
> > > 
> > > Recording the need to convert those drivers in a TODO comment seems fine
> > > to me. Whether or not someone will address those comments is another
> > > question... I'd like that to be the case, but most (if not all) of those
> > > drivers are for old devices, so the incentive will be very low, not even
> > > mentioning the lack of hardware availability for testing.
> > > 
> > > We can add TODO comments in a separate patch on top. Or would it be
> > > better to add a single TODO file in drivers/media/i2c/, like done in
> > > staging ? Or a todo.rst in Documentation, like done in
> > > Documentation/gpu/todo.rst ?
> > 
> > Definitely add it to the source code itself since nobody reads those TODO
> > or todo.rst files :-)
> > 
> > > Update: I checked the drivers touched by this patch, and they all
> > > implement TRY support for the pad ops, so there's no TODO to record :-)
> > 
> > OK, good.
> > 
> > I think it would be useful to record in a comment which drivers need work
> > in order to be MC-centric capable. But it is a nice-to-have patch and can be
> > done separately from this series.
> > 
> > For the g/s_frame_interval drivers a FIXME is needed for those that do
> > not support TRY (all except thp7312).
> 
> OK, I can handle that easily. I will add
> 
> 	/* FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY. */

Actually I'll expand that to

 	/*
	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
	 * subdev active state API.
	 */

> above all the checks.
> 
> > >>> The second case is where it does support TRY for the other pad ops, just not
> > >>> for g/s_frame_intervals. I checked the updated documentation in patch 3/8, but
> > >>> it is not clear whether that would be considered a bug or not. That is something
> > >>> that should be clarified.
> > >>>
> > >>> Frankly, it is not clear to me if, for an MC-centric capable subdev, support
> > >>> for FORMAT_TRY is required to be present for all pad ops, or not. And if not,
> > >>> for which pad ops is it optional and what does that mean for applications.
> > >>
> > >> Agreed.
> > >>
> > >> Ideally, the best would be to add support for this feature for all subdevs
> > >> at the same patch series, but I understand that this will require tests 
> > >> from the developers proposing the uAPI change and/or tested-by.
> > >>
> > >> So, I can accept merging this series and enforcing for new drivers without
> > >> requiring a conversion of all existing ones at the same patch series, but
> > >> someone (the ones behind this change) should work to have existing drivers
> > >> with g/s_frame_interval subdev uAPI also supporting TRY_.
> > > 
> > > Many of the drivers are unmaintained :-( Nobody has the hardware
> > > anymore, or the time to test it. Some drivers can be converted, but not
> > > all of them unfortunately.
> > > 
> > > This series addresses the thp7312 already. I can address the mt9m114
> > > too. I think we can try to also address the other three drivers for
> > > sensors supported by libcamera, namely the ov5640, ov5693 and ov8865.
> > > The rest will need other volunteers.
> > 
> > So the main question is: what is userspace (esp. libcamera) supposed to
> > do if a subdev supports TRY for all ops except g/s_frame_interval? Does that
> > mean it is not suitable for MC-centric use anymore? Or is userspace required
> > to work around that? At the very least that should be documented.
> 
> Existing userspace isn't supposed to do anything, it will continue
> working as it does today.
> 
> libcamera doesn't use those ioctls yet, so there will be no change in
> behaviour there. Once we start using them, we will likely require
> support for TRY, and consider the driver not supported if it doesn't
> implement that feature. I would encourage other future userspace users
> of the ioctls to do the same, but I don't think we need to enforce any
> specific behaviour there.
> 
> > >>>> With that, feel free to add: 
> > >>>>
> > >>>> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > >>>>   
> > >>>>>> All new drivers should use the V4L2 subdev active state API and support
> > >>>>>> V4L2_SUBDEV_FORMAT_TRY right away.    
> > >>>>
> > >>>> OK.
> > >>>>   
> > >>>>> I agree with Laurent here. Note that the logic isn't 'special', it is standard
> > >>>>> handling of the 'which' field. It was never there for g/s_frame_interval
> > >>>>> because that was the only one that didn't have a 'which' field, but now that
> > >>>>> it does, the drivers need to be adapted to handle this new field.
> > >>>>>
> > >>>>> It shouldn't be hidden in some core code, that would only confuse matters.  
> > >>>>
> > >>>> If the idea is to move forward without implementing support for such
> > >>>> features at the existing drivers, we should at least have something
> > >>>> annotated at the drivers that this is something that will require
> > >>>> further changes in the future to support the current behavior.
> > >>>>
> > >>>> I also expect that the API compliance tool to produce warnings
> > >>>> on drivers using the old behavior.  
> > >>>
> > >>> Yeah, I think I should add this. If a /dev/v4l-subdevX exists, then that means
> > >>> it is very likely created through an MC-centric driver and TRY support should
> > >>> be there.
> > >>
> > >> Yes.
> > > 
> > > Hans, would you be able to handle v4l2-compliance ?
> > 
> > Sure. Although that likely will be in January.
> 
> Thank you :-)

-- 
Regards,

Laurent Pinchart

