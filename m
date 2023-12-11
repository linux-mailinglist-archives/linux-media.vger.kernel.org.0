Return-Path: <linux-media+bounces-2096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECD380CAC2
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E352C1F21083
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 13:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4613DB9B;
	Mon, 11 Dec 2023 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WywLRLWX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413263D96A;
	Mon, 11 Dec 2023 13:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910E6C433C9;
	Mon, 11 Dec 2023 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702300887;
	bh=upWgE5QSQ4g/BtCPTkYofR5vsRkz3TR11WMtHknaiOw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WywLRLWXcq1FcFf9udv+teHxqK6etN63D2g1kC8pihoHhxk2pwbeXloSlXA63WOrY
	 1wpurKzmKdqNARmF7EA6M11fwPvHx9sa3ZgQqh84k6+eow9taqS7IKIlpzFY3hhGnH
	 Zy+PZwW6R4htQP3V8SsoM7j/fFvmxLcUSsJVSm1YukuC/icqQhGFvSuRKmgWDV5Tzx
	 01aEXt0cPaFBg503MLId/KGXWodg3N0mRnuOFWJJ0uP/VrlkIyoDEKnDFHtL8xSEmV
	 C+HOUAuF4MnQCrIZkZB3lLZJSITV5m6MuFegD6iV8Om7EZ+0LUF7KtcLnwLpuVJaKz
	 FE37sIODug5Fw==
Date: Mon, 11 Dec 2023 14:21:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Daniel Scally <djrscally@gmail.com>, Hans
 de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Leon Luo <leonl@leopardimaging.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>, Paul Elder
 <paul.elder@ideasonboard.com>, Pavel Machek <pavel@ucw.cz>, Philipp Zabel
 <p.zabel@pengutronix.de>, Ricardo Ribalda <ribalda@kernel.org>, Rui Miguel
 Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, Steve Longerbeam
 <slongerbeam@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 3/8] media: v4l2-subdev: Add which field to struct
 v4l2_subdev_frame_interval
Message-ID: <20231211142119.0e933e30@coco.lan>
In-Reply-To: <370e6529-9edc-4f1c-ac25-f250597b56ca@xs4all.nl>
References: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
	<20231208181648.13568-3-laurent.pinchart@ideasonboard.com>
	<20231209065501.3e989d9a@coco.lan>
	<20231209111153.GB13421@pendragon.ideasonboard.com>
	<2a656afd-0ea8-4db2-a7bf-68c3a0300988@xs4all.nl>
	<20231211125343.25e6e543@coco.lan>
	<370e6529-9edc-4f1c-ac25-f250597b56ca@xs4all.nl>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 11 Dec 2023 13:25:23 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> On 11/12/2023 12:53, Mauro Carvalho Chehab wrote:
> > Em Mon, 11 Dec 2023 09:59:25 +0100
> > Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:
> >   
> >> On 09/12/2023 12:11, Laurent Pinchart wrote:  
> >>> On Sat, Dec 09, 2023 at 06:55:01AM +0100, Mauro Carvalho Chehab wrote:    
> >>>> Em Fri,  8 Dec 2023 20:16:43 +0200
> >>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> >>>>    
> >>>>> Due to a historical mishap, the v4l2_subdev_frame_interval structure
> >>>>> is the only part of the V4L2 subdev userspace API that doesn't contain a
> >>>>> 'which' field. This prevents trying frame intervals using the subdev
> >>>>> 'TRY' state mechanism.
> >>>>>
> >>>>> Adding a 'which' field is simple as the structure has 8 reserved fields.
> >>>>> This would however break userspace as the field is currently set to 0,
> >>>>> corresponding to V4L2_SUBDEV_FORMAT_TRY, while the corresponding ioctls
> >>>>> currently operate on the 'ACTIVE' state. We thus need to add a new
> >>>>> subdev client cap, V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL, to indicate
> >>>>> that userspace is aware of this new field.
> >>>>>
> >>>>> All drivers that implement the subdev .get_frame_interval() and
> >>>>> .set_frame_interval() operations are updated to return -EINVAL when
> >>>>> operating on the TRY state, preserving the current behaviour.
> >>>>>
> >>>>> While at it, fix a bad copy&paste in the documentation of the struct
> >>>>> v4l2_subdev_frame_interval_enum 'which' field.    
> >>>>
> >>>> The uAPI change looks ok to me. However, having to add an special
> >>>> logic on every client using (get/set)_time_interval seems risky,
> >>>> as it will require an extra check before accepting new subdev
> >>>> drivers.
> >>>>
> >>>> Please move such check to drivers/media/v4l2-core/v4l2-subdev.c:
> >>>>
> >>>> 	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> >>>> 		return -EINVAL;    
> >>>
> >>> But then no new driver will be able to use this API. Look at patch 8/8
> >>> in this series, the whole point of this exercise is to support
> >>> V4L2_SUBDEV_FORMAT_TRY in drivers. The added checks in existing drivers
> >>> is because they don't support V4L2_SUBDEV_FORMAT_TRY. Moving forward,
> >>> the drivers that are still maintained should be converted eventually.  
> > 
> > Then please add a FIXME note there warning that the logic there
> > exists just because the driver doesn't yet support V4L2_SUBDEV_FORMAT_TRY.  
> 
> I think there are two types of cases here: the first case is when the subdev
> does not support TRY at all for any of the pad ops, i.e. it can't be used by
> MC-centric drivers.
> 
> In that case a top-level comment to that effect might be useful (that can be
> done in a separate patch).

Agreed.

> The second case is where it does support TRY for the other pad ops, just not
> for g/s_frame_intervals. I checked the updated documentation in patch 3/8, but
> it is not clear whether that would be considered a bug or not. That is something
> that should be clarified.
>
> Frankly, it is not clear to me if, for an MC-centric capable subdev, support
> for FORMAT_TRY is required to be present for all pad ops, or not. And if not,
> for which pad ops is it optional and what does that mean for applications.

Agreed.

Ideally, the best would be to add support for this feature for all subdevs
at the same patch series, but I understand that this will require tests 
from the developers proposing the uAPI change and/or tested-by.
So, I can accept merging this series and enforcing for new drivers without
requiring a conversion of all existing ones at the same patch series, but
someone (the ones behind this change) should work to have existing drivers
with g/s_frame_interval subdev uAPI also supporting TRY_.


> > 
> > With that, feel free to add: 
> > 
> > Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> >   
> >>> All new drivers should use the V4L2 subdev active state API and support
> >>> V4L2_SUBDEV_FORMAT_TRY right away.    
> > 
> > OK.
> >   
> >> I agree with Laurent here. Note that the logic isn't 'special', it is standard
> >> handling of the 'which' field. It was never there for g/s_frame_interval
> >> because that was the only one that didn't have a 'which' field, but now that
> >> it does, the drivers need to be adapted to handle this new field.
> >>
> >> It shouldn't be hidden in some core code, that would only confuse matters.  
> > 
> > If the idea is to move forward without implementing support for such
> > features at the existing drivers, we should at least have something
> > annotated at the drivers that this is something that will require
> > further changes in the future to support the current behavior.
> > 
> > I also expect that the API compliance tool to produce warnings
> > on drivers using the old behavior.  
> 
> Yeah, I think I should add this. If a /dev/v4l-subdevX exists, then that means
> it is very likely created through an MC-centric driver and TRY support should
> be there.

Yes.

Thanks,
Mauro

