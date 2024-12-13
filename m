Return-Path: <linux-media+bounces-23363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B02C9F07F8
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 10:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3AB51682D4
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 09:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258551B3950;
	Fri, 13 Dec 2024 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FPS6igd5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D56364D6;
	Fri, 13 Dec 2024 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734082473; cv=none; b=nYRk+IPh6/GWpHLu8j5Aj5aH8YlWOtz2Rt5UyKqNUXaBhWbpfEifwUmYOIy/dDF1n4/DiJ5BUDzT+NzM0Md9VEry6eDJP0dI2bB3W6ufzYk8Iq2LXn0XXR8uCD+q4y6nJ/psKvlnPNhzB1Ww7XysYMS1ydnSsGuJXELb/V8LH1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734082473; c=relaxed/simple;
	bh=pgCK4GDDXjPzcmcfY2qoLfzG9vozEGd+0DlmEDRuIhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LF6AA1Nn49WHPA2R+uhMKOrNAVtlExsDG3+0j7seu+wqbiLnOlNf4SC7MA0uMR6rnd1/MxDETkQfis0wVxpFHcrVaOqdgmCA06ZQ2AyAK4FJR6kkB+lLPObZj6LK2wteABpCVf5AsRQSSPxQSBacnIck8ahPG3WM22mF2quT3lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FPS6igd5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBB70520;
	Fri, 13 Dec 2024 10:33:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734082436;
	bh=pgCK4GDDXjPzcmcfY2qoLfzG9vozEGd+0DlmEDRuIhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FPS6igd5UT9uW7x6KYbZ9rJbiTtlZioEz6Cx9hnVRy5NGvzgN82r95m74UlrgHHEV
	 8k5Bnc85lqy6XDOhuf2d9xThNFvkEPTJMSfpGDX4dGsuyExDPC6sdfWeR8Rv9lSeYX
	 hEG/UNv+4bDUF5hCVb77+nw9VkIAvJ0QLWD0pUJw=
Date: Fri, 13 Dec 2024 11:34:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Cosmin Tanislav <demonsingur@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: subdev: Use dev_err() to print errors and
 clarify
Message-ID: <20241213093413.GB19755@pendragon.ideasonboard.com>
References: <20241122153343.237308-1-demonsingur@gmail.com>
 <20241123213203.GC19573@pendragon.ideasonboard.com>
 <09aac96d-554c-400d-9ec1-c87617d9df65@gmail.com>
 <20241127072033.GU5461@pendragon.ideasonboard.com>
 <Z1vxRYy9tRqvT824@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z1vxRYy9tRqvT824@kekkonen.localdomain>

On Fri, Dec 13, 2024 at 08:33:09AM +0000, Sakari Ailus wrote:
> On Wed, Nov 27, 2024 at 09:20:33AM +0200, Laurent Pinchart wrote:
> > On Mon, Nov 25, 2024 at 10:34:40PM +0200, Cosmin Tanislav wrote:
> > > On 11/23/24 11:32 PM, Laurent Pinchart wrote:
> > > > On Fri, Nov 22, 2024 at 05:33:39PM +0200, Cosmin Tanislav wrote:
> > > >> The error values end up being returned to userspace, it makes sense to
> > > >> have some useful information printed when debugging them, even if the
> > > >> reason for the errors are bad configs or internal driver issues.
> > > >>
> > > >> Replace dev_dbg() with dev_err() for errors.
> > > > 
> > > > We use dev_dbg() on purpose for all errors that can be triggered
> > > > directly by applications. This includes in particular all pipeline
> > > > validation errors.
> > > > 
> > > > The error paths in this specific patch shouldn't be in that category, as
> > > > all the validation should have been performed before starting subdevs
> > > > (assuming all drivers are correctly implemented, which is of course not
> > > > a given, but those issues should be fixed). I think we could therefore
> > > > switch to dev_err() here. However, I'm wondering what kind of issues
> > > > triggered this patch. What errors did you run into that would have
> > > > benefited from being reported more loudly, and were they caused by
> > > > driver bugs or userspace misconfiguring the device ?
> > > 
> > > I've had this patch in my GMSL2 tree for some time now, I believe indeed
> > > the reasons why I've hit these error cases were the drivers being
> > > slightly broken, but I still think it is worthwhile to show an error
> > > message, to aid with debugging. Adding the entity name to the messages
> > > makes it even more clear where exactly the code is breaking.
> > > 
> > > I can split it up into separate patches for dev_dbg() -> dev_err() and
> > > adding the entity name to the print statements for V2.
> > 
> > I'm OK either way. If other people prefer keeping dev_dbg() then
> > splitting the patch in two would make sense.
> 
> dev_dbg() seems the correct function here: these are user-triggerable
> errors that aren't related to hardware conditions.

Are these user-triggerable in the absence of bugs in drivers ?

> > > >> Also, when using complex pipelines with multiple bridges between the
> > > >> video device and multiple source sub devices, printing just the video
> > > >> device name for each error does not provide enough context as to which
> > > >> operation failed.
> > > >>
> > > >> Add sub device entity name to the messages where possible to clarify the
> > > >> source of the errors.
> > > > 
> > > > This can be considered as a standalone patch.
> > > > 
> > > >> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> > > >> ---
> > > >>   drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++----------
> > > >>   1 file changed, 12 insertions(+), 10 deletions(-)
> > > >>
> > > >> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > >> index 4f0eecd7fd66f..d51b4594d11c5 100644
> > > >> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > >> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > >> @@ -2303,20 +2303,21 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
> > > >>   				    &found_streams, &enabled_streams);
> > > >>   
> > > >>   	if (found_streams != streams_mask) {
> > > >> -		dev_dbg(dev, "streams 0x%llx not found on %s:%u\n",
> > > >> +		dev_err(dev, "streams 0x%llx not found on %s:%u\n",
> > > >>   			streams_mask & ~found_streams, sd->entity.name, pad);
> > > >>   		ret = -EINVAL;
> > > >>   		goto done;
> > > >>   	}
> > > >>   
> > > >>   	if (enabled_streams) {
> > > >> -		dev_dbg(dev, "streams 0x%llx already enabled on %s:%u\n",
> > > >> +		dev_err(dev, "streams 0x%llx already enabled on %s:%u\n",
> > > >>   			enabled_streams, sd->entity.name, pad);
> > > >>   		ret = -EALREADY;
> > > >>   		goto done;
> > > >>   	}
> > > >>   
> > > >> -	dev_dbg(dev, "enable streams %u:%#llx\n", pad, streams_mask);
> > > >> +	dev_dbg(dev, "enable streams %s:%u:%#llx\n",
> > > >> +		sd->entity.name, pad, streams_mask);
> > > >>   
> > > >>   	already_streaming = v4l2_subdev_is_streaming(sd);
> > > >>   
> > > >> @@ -2333,8 +2334,8 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
> > > >>   	}
> > > >>   
> > > >>   	if (ret) {
> > > >> -		dev_dbg(dev, "enable streams %u:%#llx failed: %d\n", pad,
> > > >> -			streams_mask, ret);
> > > >> +		dev_err(dev, "enable streams %s:%u:%#llx failed: %d\n",
> > > >> +			sd->entity.name, pad, streams_mask, ret);
> > > >>   		goto done;
> > > >>   	}
> > > >>   
> > > >> @@ -2403,20 +2404,21 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
> > > >>   				    &found_streams, &enabled_streams);
> > > >>   
> > > >>   	if (found_streams != streams_mask) {
> > > >> -		dev_dbg(dev, "streams 0x%llx not found on %s:%u\n",
> > > >> +		dev_err(dev, "streams 0x%llx not found on %s:%u\n",
> > > >>   			streams_mask & ~found_streams, sd->entity.name, pad);
> > > >>   		ret = -EINVAL;
> > > >>   		goto done;
> > > >>   	}
> > > >>   
> > > >>   	if (enabled_streams != streams_mask) {
> > > >> -		dev_dbg(dev, "streams 0x%llx already disabled on %s:%u\n",
> > > >> +		dev_err(dev, "streams 0x%llx already disabled on %s:%u\n",
> > > >>   			streams_mask & ~enabled_streams, sd->entity.name, pad);
> > > >>   		ret = -EALREADY;
> > > >>   		goto done;
> > > >>   	}
> > > >>   
> > > >> -	dev_dbg(dev, "disable streams %u:%#llx\n", pad, streams_mask);
> > > >> +	dev_dbg(dev, "disable streams %s:%u:%#llx\n",
> > > >> +		sd->entity.name, pad, streams_mask);
> > > >>   
> > > >>   	if (!use_s_stream) {
> > > >>   		/* Call the .disable_streams() operation. */
> > > >> @@ -2432,8 +2434,8 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
> > > >>   	}
> > > >>   
> > > >>   	if (ret) {
> > > >> -		dev_dbg(dev, "disable streams %u:%#llx failed: %d\n", pad,
> > > >> -			streams_mask, ret);
> > > >> +		dev_err(dev, "disable streams %s:%u:%#llx failed: %d\n",
> > > >> +			sd->entity.name, pad, streams_mask, ret);
> > > >>   		goto done;
> > > >>   	}
> > > >>   

-- 
Regards,

Laurent Pinchart

