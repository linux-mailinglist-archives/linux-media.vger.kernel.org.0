Return-Path: <linux-media+bounces-37102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 638C4AFC9ED
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 13:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E09D13A8A2F
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 11:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146312D876B;
	Tue,  8 Jul 2025 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JTZKFYDl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4DB27D776
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751975808; cv=none; b=V6BxHDzOdh2sVwJuKXJ/0tG/d26WrovlruZgYuDkMmqURnhvESF/yzJq4e7FbzTfztIeDyWKz/yrAnkvxaNwGCgQ0kenj/jK+oWAnpt4ZaK+Ptmyg4WNPCDTX+Z/kXB9ZuQWX1M/Exe21CQ3KXvhh3hMoAf96419NNxkPBlKBnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751975808; c=relaxed/simple;
	bh=fqWpgCO7XaJqYKwQgpBFHOSH0XJc7am93ErSrhWOifc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyksAxuLTgcw4fNNC2cCdSw26I8n4rsd0809mpt8s2uLuE31/RmvWFhZxzKgeN1ZinOJ4LpnEco65rM4Spo9Ir4kVpX67yDOQhoyToaMYs492Yg835zjJkymns8gBRIugpFZ2qBpOJnznVKM25s9XdlcixF/MCO2GjsD4lUJh/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JTZKFYDl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 779F27E4;
	Tue,  8 Jul 2025 13:56:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751975777;
	bh=fqWpgCO7XaJqYKwQgpBFHOSH0XJc7am93ErSrhWOifc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JTZKFYDlbaUt/EZg065gAaIlrR/pmMT9YjuHFM8EfrHu9PwRD/836vlxCXjqgg/JJ
	 Mt2F2dbX+DDb/z56n1lSphyhQVFnjhy7XZRNdHSl68mCBuBndQFWzmHyXCuUYen+WK
	 oafK09w870SAnGToDn6q/fNIXMRAebHQQd1TDfZQ=
Date: Tue, 8 Jul 2025 14:56:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 05/13] media: v4l: Make media_entity_to_video_device()
 NULL-safe
Message-ID: <20250708115616.GE1821@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-6-sakari.ailus@linux.intel.com>
 <20250619152033.GG32166@pendragon.ideasonboard.com>
 <aFQ3c-fI29YZ7dEe@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFQ3c-fI29YZ7dEe@kekkonen.localdomain>

On Thu, Jun 19, 2025 at 04:14:43PM +0000, Sakari Ailus wrote:
> On Thu, Jun 19, 2025 at 06:20:33PM +0300, Laurent Pinchart wrote:
> > On Thu, Jun 19, 2025 at 11:15:38AM +0300, Sakari Ailus wrote:
> > > Make media_entity_to_video_device(NULL) return NULL, instead of an invalid
> > > pointer value.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  include/media/v4l2-dev.h | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > > index 1b6222fab24e..069c2f14b473 100644
> > > --- a/include/media/v4l2-dev.h
> > > +++ b/include/media/v4l2-dev.h
> > > @@ -313,10 +313,16 @@ struct video_device {
> > >   * media_entity_to_video_device - Returns a &struct video_device from
> > >   *	the &struct media_entity embedded on it.
> > >   *
> > > - * @__entity: pointer to &struct media_entity
> > > - */
> > > -#define media_entity_to_video_device(__entity) \
> > > -	container_of(__entity, struct video_device, entity)
> > > + * @__entity: pointer to &struct media_entity, may be NULL
> > > + */
> > > +#define media_entity_to_video_device(__entity)				\
> > > +	({								\
> > > +		typeof (__entity) __me_to_vdev_ent = __entity;		\
> > > +									\
> > > +		__me_to_vdev_ent ? container_of(__me_to_vdev_ent,	\
> > > +						struct video_device, entity) : \
> > > +			NULL;						\
> > > +	})
> > 
> > This makes the macro safer, it's a good idea. Wouldn't it be better
> > implemented as a container_of_null() (name to be bikeshedded) though ? I
> > don't think media_entity_to_video_device() is the only macro that could
> > benefit from this. It could even be integrated in container_of(), but I
> > fear that could introduce issues.
> 
> That sounds like a good idea. I'll first see how this would look like with
> container_of_const()...

Thinking some more about this, I think we can move forward without
waiting for container_of_null().

Should we however add a check to ensure the entity is a video device (by
checking that the function is MEDIA_ENT_F_IO_V4L), and return NULL if
it's not ? It would make the macro even safer to use. There would be a
small additional runtime cost for call sites that guarantee the entity
is a video device.

I checked the current users of the macro, and the vast majority of them
are in the .link_validate() operation, where they know that the entity
is a video device. There are just a handful of locations where a check
precedes the media_entity_to_video_device() call. So maybe it's not
worth it ?

I also found no caller that checks for entity != NULL before calling the
macro. Is this change actually needed ?

-- 
Regards,

Laurent Pinchart

