Return-Path: <linux-media+bounces-37230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1F9AFF342
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 22:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C8531C46E13
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 20:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32B223BCFD;
	Wed,  9 Jul 2025 20:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZKzROtTe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A123814D
	for <linux-media@vger.kernel.org>; Wed,  9 Jul 2025 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752094523; cv=none; b=q7C9u03Ehusn/nwoEpISiqvnGEkHUgc6iiMuvSsUP5sckgzypaj4U7vZGD8wP2r4NQVo34TZqxPp2k+sboPNCIewTbAxeeD16lRtApAaHPJ3YjcVN+cFPstp1U4mVIYOuEaF17hdkvelSX7RWwGA7TA6OtPoJGlSnTFdiwv7gBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752094523; c=relaxed/simple;
	bh=+bkZdhZGUZn/WJzAJFQp8Ws5/51VRSq3KTfoMmBAs24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0xGYlysNlfNWELirwr51a3RHB9X26W7obQ5mp1AX4fiXt3UFMleCVMbmrkHw6jqmmGia/bpTG4v5MF7dkxDMOc36dhy399JcoDzepC/SapfLywKqnxCrtOVoZfSWW1R4TMgpe+XlUhrMJ1wRZQZXjMI4NBCtAqoPiEainV3EPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZKzROtTe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9250250A;
	Wed,  9 Jul 2025 22:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752094490;
	bh=+bkZdhZGUZn/WJzAJFQp8Ws5/51VRSq3KTfoMmBAs24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZKzROtTe7z6Lugun2d6Bgdd9sNv/AUhtVHnblijTA35d/8u16XkMVwIgBV3yHTyRf
	 H5mNqTIOxkU9WC3jOBsvQeEtJS26diOPz4LAB1p/hSznPwVCtySmlm/9OFIMGihIOY
	 V6NJOl4apM0PewwStryFSZwvEI4rL9Ihd/0uJ/8c=
Date: Wed, 9 Jul 2025 23:54:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 05/13] media: v4l: Make media_entity_to_video_device()
 NULL-safe
Message-ID: <20250709205449.GA22436@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-6-sakari.ailus@linux.intel.com>
 <20250619152033.GG32166@pendragon.ideasonboard.com>
 <aFQ3c-fI29YZ7dEe@kekkonen.localdomain>
 <20250708115616.GE1821@pendragon.ideasonboard.com>
 <aG0I1eoY0gwgE85O@kekkonen.localdomain>
 <20250708161747.GA23181@pendragon.ideasonboard.com>
 <aG7K-xBVC8cmg3z6@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aG7K-xBVC8cmg3z6@kekkonen.localdomain>

On Wed, Jul 09, 2025 at 08:03:07PM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Tue, Jul 08, 2025 at 07:17:47PM +0300, Laurent Pinchart wrote:
> > On Tue, Jul 08, 2025 at 12:02:29PM +0000, Sakari Ailus wrote:
> > > On Tue, Jul 08, 2025 at 02:56:16PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Jun 19, 2025 at 04:14:43PM +0000, Sakari Ailus wrote:
> > > > > On Thu, Jun 19, 2025 at 06:20:33PM +0300, Laurent Pinchart wrote:
> > > > > > On Thu, Jun 19, 2025 at 11:15:38AM +0300, Sakari Ailus wrote:
> > > > > > > Make media_entity_to_video_device(NULL) return NULL, instead of an invalid
> > > > > > > pointer value.
> > > > > > > 
> > > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > ---
> > > > > > >  include/media/v4l2-dev.h | 14 ++++++++++----
> > > > > > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > > > > > > index 1b6222fab24e..069c2f14b473 100644
> > > > > > > --- a/include/media/v4l2-dev.h
> > > > > > > +++ b/include/media/v4l2-dev.h
> > > > > > > @@ -313,10 +313,16 @@ struct video_device {
> > > > > > >   * media_entity_to_video_device - Returns a &struct video_device from
> > > > > > >   *	the &struct media_entity embedded on it.
> > > > > > >   *
> > > > > > > - * @__entity: pointer to &struct media_entity
> > > > > > > - */
> > > > > > > -#define media_entity_to_video_device(__entity) \
> > > > > > > -	container_of(__entity, struct video_device, entity)
> > > > > > > + * @__entity: pointer to &struct media_entity, may be NULL
> > > > > > > + */
> > > > > > > +#define media_entity_to_video_device(__entity)				\
> > > > > > > +	({								\
> > > > > > > +		typeof (__entity) __me_to_vdev_ent = __entity;		\
> > 
> > This should be __me_vdev_ent to align the naming with
> > media_entity_to_v4l2_subdev().
> > 
> > > > > > > +									\
> > > > > > > +		__me_to_vdev_ent ? container_of(__me_to_vdev_ent,	\
> > > > > > > +						struct video_device, entity) : \
> > 
> > And here you should write
> > 
> > 	__me_to_vdev_ent ?						   \
> > 		container_of(__me_vdev_ent, struct video_device, entity) : \
> > 		NULL;							   \
> 
> I'm fine wrap after '?' as well, but another wrap is needed due to
> indentation in any case.

I didn't make it clear, my comment was about replicating the style of
media_entity_to_v4l2_subdev().

> > > > > > > +			NULL;						\
> > > > > > > +	})
> > > > > > 
> > > > > > This makes the macro safer, it's a good idea. Wouldn't it be better
> > > > > > implemented as a container_of_null() (name to be bikeshedded) though ? I
> > > > > > don't think media_entity_to_video_device() is the only macro that could
> > > > > > benefit from this. It could even be integrated in container_of(), but I
> > > > > > fear that could introduce issues.
> > > > > 
> > > > > That sounds like a good idea. I'll first see how this would look like with
> > > > > container_of_const()...
> > > > 
> > > > Thinking some more about this, I think we can move forward without
> > > > waiting for container_of_null().
> > > > 
> > > > Should we however add a check to ensure the entity is a video device (by
> > > > checking that the function is MEDIA_ENT_F_IO_V4L), and return NULL if
> > > > it's not ? It would make the macro even safer to use. There would be a
> > > > small additional runtime cost for call sites that guarantee the entity
> > > > is a video device.
> > > > 
> > > > I checked the current users of the macro, and the vast majority of them
> > > > are in the .link_validate() operation, where they know that the entity
> > > > is a video device. There are just a handful of locations where a check
> > > > precedes the media_entity_to_video_device() call. So maybe it's not
> > > > worth it ?
> > > > 
> > > > I also found no caller that checks for entity != NULL before calling the
> > > > macro. Is this change actually needed ?
> > > 
> > > We have a similar check in media_entity_to_v4l2_subdev() macro.
> > 
> > That's a good point. Different behaviours for the two macros would be
> > confusing I suppose, so
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thank you.
> 
> > I'm tempted to convert the macro to an inline function, but that would
> > make it more difficult to switch to container_of_const().
> 
> Let's not do that. Eventually container_of() should become what
> container_of_const() is at the moment.
> 
> But once this is in, I can introduce container_of_null() which we could
> later use. I wonder how it will look like.

-- 
Regards,

Laurent Pinchart

