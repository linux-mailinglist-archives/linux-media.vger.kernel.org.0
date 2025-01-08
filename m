Return-Path: <linux-media+bounces-24401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3211BA05C18
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 13:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EE76188941E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 12:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7209B1FC10C;
	Wed,  8 Jan 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9k2RSoz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDC01FBEA6
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340662; cv=none; b=lbchaNPgpOCynqP9N2seb9gYIKhzufYrpkjV6U8UJ0N0EUZRfIoFT5hqKDJmDNw3a/s5f0KVvF5PH7S0mofW+/Mw9wXMZK41XIzFgSUvLoKSVBxG68tr046jK78pNfNpjbAWIuBtjqpLVvK36KcNnRxrpte9aiZe1lq2jx9c/HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340662; c=relaxed/simple;
	bh=RknLEfW/PURoIjEcW0Jx6sjIUxXXyfztL6AysqsS5IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2UJDAxYUWr5fZHtY1p+VPDB453Gc0hFJUiPQlrn3bmpzdxEpCXFFuH1jp/IyO+y09FPAvxDaA+omCC4uz1ncer26G6/2cujUiZzxu25nUb+I7zP1lYRkliBt8SLCGx9MO01aKXE8e6Yk3Vuifsob4BsDWpYx4iM/CRSqlji4MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9k2RSoz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736340661; x=1767876661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RknLEfW/PURoIjEcW0Jx6sjIUxXXyfztL6AysqsS5IE=;
  b=Q9k2RSozjko0ULP0uigCcML521EHZQF6QWItYV1GMbbeiv01pZqsD06r
   AP/hzbis1lvh2DW7qSlyS0QOSNoe6Ko+YgXV5x0c8ZPnUZQlo/TTVSjf1
   wPwHdLZ1pYW/67lSON4zSBRO+arCA+AsUl3nfYZqHQvzPH38M9azReFp8
   zBos5hY2KSXOWMTdJUKgND3w6eQykZJ+/BvDrEMr3RdEm4N8XwL6muJGt
   s9029CFB8PLqvmUw3fnAyjuz8jx5TF3KXhDE6HtX5PfvY6AVmJDDJ8Oue
   vH4TUzkQOXfgdUPvqGFLTK1p/pJ9spoFYZXZq/8EKpa5WfYUYT13KaCEO
   w==;
X-CSE-ConnectionGUID: 5YKFEzEEQnGhxMYSiH1moQ==
X-CSE-MsgGUID: PZFWsfxGTf6niBZQ1xtnSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36784448"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36784448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 04:51:00 -0800
X-CSE-ConnectionGUID: L4aca+tVRx6z8TeFP8ocwQ==
X-CSE-MsgGUID: zLYnADdTTtOJd1kO1ail/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103580757"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 04:50:58 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2093411F8DF;
	Wed,  8 Jan 2025 14:50:56 +0200 (EET)
Date: Wed, 8 Jan 2025 12:50:56 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com
Subject: Re: [PATCH v8 9/9] media: v4l: Convert the users of
 v4l2_get_link_freq to call it on a pad
Message-ID: <Z350sEwO5HAhSY-x@kekkonen.localdomain>
References: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
 <20241217215445.901459-10-sakari.ailus@linux.intel.com>
 <232606b3-6f6f-4932-a9f5-44c2f89e99fb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <232606b3-6f6f-4932-a9f5-44c2f89e99fb@ideasonboard.com>

Moi,

On Fri, Dec 20, 2024 at 03:19:09PM +0200, Tomi Valkeinen wrote:
> Hi,

Thanks for the review.

> 
> On 17/12/2024 23:54, Sakari Ailus wrote:
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> > index 380c99321030..cc93f79179dd 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> > @@ -443,16 +443,18 @@ static int vfe_enable_output(struct vfe_line *line)
> >   	struct vfe_device *vfe = to_vfe(line);
> >   	struct vfe_output *output = &line->output;
> >   	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
> > -	struct media_entity *sensor;
> > +	struct media_pad *sensor;
> >   	unsigned long flags;
> >   	unsigned int frame_skip = 0;
> >   	unsigned int i;
> >   	sensor = camss_find_sensor(&line->subdev.entity);
> >   	if (sensor) {
> > -		struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(sensor);
> > +		struct v4l2_subdev *subdev =
> > +			media_entity_to_v4l2_subdev(sensor->entity);
> > -		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
> > +		v4l2_subdev_call(subdev, sensor, g_skip_frames,
> > +				 &frame_skip);
> 
> This looks a bit odd... The sensor parameter was media_entity, but now it's
> media_pad, but I don't think the called op has changed. Is that right?

"sensor" in this case is the name of the operations struct, it's unrelated
to the variable with the same name. :-)

But the second line wrap is unnecessary, I'll fix it.

> 
> >   		/* Max frame skip is 29 frames */
> >   		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
> >   			frame_skip = VFE_FRAME_DROP_VAL - 1;
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
> > index eb33c03df27e..1970f7aa6d4d 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
> > @@ -170,7 +170,7 @@ static int vfe_enable_output(struct vfe_line *line)
> >   	struct vfe_device *vfe = to_vfe(line);
> >   	struct vfe_output *output = &line->output;
> >   	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
> > -	struct media_entity *sensor;
> > +	struct media_pad *sensor;
> >   	unsigned long flags;
> >   	unsigned int frame_skip = 0;
> >   	unsigned int i;
> > @@ -182,9 +182,11 @@ static int vfe_enable_output(struct vfe_line *line)
> >   	sensor = camss_find_sensor(&line->subdev.entity);
> >   	if (sensor) {
> > -		struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(sensor);
> > +		struct v4l2_subdev *subdev =
> > +			media_entity_to_v4l2_subdev(sensor->entity);
> > -		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
> > +		v4l2_subdev_call(subdev, sensor, g_skip_frames,
> > +				 &frame_skip);
> 
> Here too.

Ditto.

> 
> >   		/* Max frame skip is 29 frames */
> >   		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
> >   			frame_skip = VFE_FRAME_DROP_VAL - 1;
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> > index 004a74f6b2f6..e86de4b59723 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -1996,12 +1996,12 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock)
> >   }
> >   /*
> > - * camss_find_sensor - Find a linked media entity which represents a sensor
> > + * camss_find_sensor - Find the media pad via which the sensor is linked
> >    * @entity: Media entity to start searching from
> >    *
> >    * Return a pointer to sensor media entity or NULL if not found
> >    */
> > -struct media_entity *camss_find_sensor(struct media_entity *entity)
> > +struct media_pad *camss_find_sensor(struct media_entity *entity)
> 
> I don't like this change. Maybe rename the function to
> camss_find_sensor_pad(), and rename the "sensor" variables to "sensor_pad".
> That would make the diff more readable, too, to show all the places where we
> used to have a media_entity, but now have media_pad.
> 
> But even then, after this change, I think mostly the callers of
> camss_find_sensor() will just end up changing it back to entity. Maybe
> that's fine, but is there a way to keep the camss_find_sensor as it is now,
> and just do something extra when calling v4l2_get_link_freq() to get the
> media_pad...

There are just a few callers of this function, we don't need a specific
helper for that reason within a driver. I'll rename the function.

-- 
Ystävällisin terveisin,

Sakari Ailus

