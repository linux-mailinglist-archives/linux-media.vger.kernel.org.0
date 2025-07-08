Return-Path: <linux-media+bounces-37137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DB1AFD070
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 18:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F8A117050E
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 16:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E30C2E2F0E;
	Tue,  8 Jul 2025 16:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kMrjjsKd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9C52DC321
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751991501; cv=none; b=R0ckVU76o6YJXAaU2hEbCaxoCE1SAwRIHpCLpAQZ8K/4xLPf8eFkzjpPQ+YsmgQXPu3Lg5kxEKTypzFu6Vyhy9DXtl8J6/8h6MpkmROfWt/azrvzEvXd4+OlgBd0Gc447C1J85NfyHZ1b+Ak/bOksTrfskM7Ev2OZiJzszOu/lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751991501; c=relaxed/simple;
	bh=T1omWFoim/zxeYBtt68cXwsaank/AxXNoUBKLPnc/Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nz8IoRZsyR+xSquqlOYYPbUipjoPGQg6boHtVRXpjsU45FRtitIosa9S32a0nbIEmyoON8L8eqd0PMDv6iAkftjRmZaon8IZ6dAHLIB11p5Roh4ud1uMBp8L8W/ZKvWvxh6lMLl/vi/So+A9ghF13TG7Ax3ovG9jon0cbQVnbCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kMrjjsKd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C9B68526;
	Tue,  8 Jul 2025 18:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751991468;
	bh=T1omWFoim/zxeYBtt68cXwsaank/AxXNoUBKLPnc/Lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kMrjjsKdpYOaUHwhJ/8cMtM9DCgOr/I2WQtzdwWXJb3MOEo6MJZX8Ouje17IxUmAM
	 nSrfIboeh5ef6dJYkyMgZoNNQkqJTzsYHi7QwaxWCl5WiNunDZzn1oV/aWuUbsuUr3
	 aWtKVV9tTt45aod80LO0cNsSg9oc/YyCwWQd/zG8=
Date: Tue, 8 Jul 2025 19:17:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 05/13] media: v4l: Make media_entity_to_video_device()
 NULL-safe
Message-ID: <20250708161747.GA23181@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-6-sakari.ailus@linux.intel.com>
 <20250619152033.GG32166@pendragon.ideasonboard.com>
 <aFQ3c-fI29YZ7dEe@kekkonen.localdomain>
 <20250708115616.GE1821@pendragon.ideasonboard.com>
 <aG0I1eoY0gwgE85O@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aG0I1eoY0gwgE85O@kekkonen.localdomain>

On Tue, Jul 08, 2025 at 12:02:29PM +0000, Sakari Ailus wrote:
> On Tue, Jul 08, 2025 at 02:56:16PM +0300, Laurent Pinchart wrote:
> > On Thu, Jun 19, 2025 at 04:14:43PM +0000, Sakari Ailus wrote:
> > > On Thu, Jun 19, 2025 at 06:20:33PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Jun 19, 2025 at 11:15:38AM +0300, Sakari Ailus wrote:
> > > > > Make media_entity_to_video_device(NULL) return NULL, instead of an invalid
> > > > > pointer value.
> > > > > 
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  include/media/v4l2-dev.h | 14 ++++++++++----
> > > > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > > > > index 1b6222fab24e..069c2f14b473 100644
> > > > > --- a/include/media/v4l2-dev.h
> > > > > +++ b/include/media/v4l2-dev.h
> > > > > @@ -313,10 +313,16 @@ struct video_device {
> > > > >   * media_entity_to_video_device - Returns a &struct video_device from
> > > > >   *	the &struct media_entity embedded on it.
> > > > >   *
> > > > > - * @__entity: pointer to &struct media_entity
> > > > > - */
> > > > > -#define media_entity_to_video_device(__entity) \
> > > > > -	container_of(__entity, struct video_device, entity)
> > > > > + * @__entity: pointer to &struct media_entity, may be NULL
> > > > > + */
> > > > > +#define media_entity_to_video_device(__entity)				\
> > > > > +	({								\
> > > > > +		typeof (__entity) __me_to_vdev_ent = __entity;		\

This should be __me_vdev_ent to align the naming with
media_entity_to_v4l2_subdev().

> > > > > +									\
> > > > > +		__me_to_vdev_ent ? container_of(__me_to_vdev_ent,	\
> > > > > +						struct video_device, entity) : \

And here you should write

	__me_to_vdev_ent ?						   \
		container_of(__me_vdev_ent, struct video_device, entity) : \
		NULL;							   \

> > > > > +			NULL;						\
> > > > > +	})
> > > > 
> > > > This makes the macro safer, it's a good idea. Wouldn't it be better
> > > > implemented as a container_of_null() (name to be bikeshedded) though ? I
> > > > don't think media_entity_to_video_device() is the only macro that could
> > > > benefit from this. It could even be integrated in container_of(), but I
> > > > fear that could introduce issues.
> > > 
> > > That sounds like a good idea. I'll first see how this would look like with
> > > container_of_const()...
> > 
> > Thinking some more about this, I think we can move forward without
> > waiting for container_of_null().
> > 
> > Should we however add a check to ensure the entity is a video device (by
> > checking that the function is MEDIA_ENT_F_IO_V4L), and return NULL if
> > it's not ? It would make the macro even safer to use. There would be a
> > small additional runtime cost for call sites that guarantee the entity
> > is a video device.
> > 
> > I checked the current users of the macro, and the vast majority of them
> > are in the .link_validate() operation, where they know that the entity
> > is a video device. There are just a handful of locations where a check
> > precedes the media_entity_to_video_device() call. So maybe it's not
> > worth it ?
> > 
> > I also found no caller that checks for entity != NULL before calling the
> > macro. Is this change actually needed ?
> 
> We have a similar check in media_entity_to_v4l2_subdev() macro.

That's a good point. Different behaviours for the two macros would be
confusing I suppose, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'm tempted to convert the macro to an inline function, but that would
make it more difficult to switch to container_of_const().

> In the
> patches for streaming control there's a need for an explicit check without
> this patch. That's of course fine as well if we decide so.

-- 
Regards,

Laurent Pinchart

