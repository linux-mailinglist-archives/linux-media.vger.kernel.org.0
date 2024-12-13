Return-Path: <linux-media+bounces-23355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 462659F0660
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 09:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53486167AED
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 08:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8480E1A8F9A;
	Fri, 13 Dec 2024 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImKnIaZY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005CF1925A4;
	Fri, 13 Dec 2024 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734078796; cv=none; b=FR+hAVsNalDkGhULYX4ZjkrV2S8HZYQyM4imTE2lU7sLXe4edyutSYLYg7in0+6MIoeaiOZxh+VtpEsXo+nT3T+Ug8xtkMgtpP6HWWSCrZ0t5iWZZ94lEZfFq0UClY4OrCt+6az9xJboFJqroYKwtgSkx91xgf1dLgSfzGmpFfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734078796; c=relaxed/simple;
	bh=Y8gD1J9C2ITWU+fbTWdWhOxzqgkl4wmueD0OO1J0eX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h77DPxQJiS4UPWnAdr2r1bpCRdFrkUAt/kQEJV4FMI1SdNu2NKzlY4j2dxQ3HJPhNZ6LmMDJvD2O0xxxFOoeGftEESEioHoGsHG/IPkwyqvTvk/T6mrJC/Am+rwIimmr4/s8Jp22K/bYZf7FO289vZuExETOI8sr3VIwfqe66XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImKnIaZY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734078795; x=1765614795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y8gD1J9C2ITWU+fbTWdWhOxzqgkl4wmueD0OO1J0eX4=;
  b=ImKnIaZYEZ77y7bB+L1KXdVJNJIkhZ2rafTvc84spG1bs65k9XsokUZP
   xzXX5RdMZfbxv+o6hiCFIbPCFpLcWyyqCgUbU/L5sDev0FQQ02Z734KYg
   cWryOkwEUHbV1GGpmYAk9LOHPk6yVfYlgFhgu9BOIHR5F3suRAhiOhuH4
   CT6asNgFs5PfdeomFSoxf4IzBaWmabpCHh6khDYK4wCAQMPtSKG7fDtRX
   ME8KX3fNazaGyupzJGa5v0CWTnisT9psYrYrSkrNIvf75niDqOz/bqrz3
   IoTvoCBwoES85nA9chvLwqZxihUJhbiYshPp2bVjZ+QtBAekmLJmj/XkK
   g==;
X-CSE-ConnectionGUID: bucK5MCfR4+NYU1kNUGVDw==
X-CSE-MsgGUID: dhFTvEBeQbqGb7pvI7Y8bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="38303899"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="38303899"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 00:33:14 -0800
X-CSE-ConnectionGUID: XZisft2nR9WQKzKD74USpw==
X-CSE-MsgGUID: YgZdQM1gRVev/xh95FS1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133857251"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 00:33:12 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 68A9C12034A;
	Fri, 13 Dec 2024 10:33:09 +0200 (EET)
Date: Fri, 13 Dec 2024 08:33:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Cosmin Tanislav <demonsingur@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: subdev: Use dev_err() to print errors and
 clarify
Message-ID: <Z1vxRYy9tRqvT824@kekkonen.localdomain>
References: <20241122153343.237308-1-demonsingur@gmail.com>
 <20241123213203.GC19573@pendragon.ideasonboard.com>
 <09aac96d-554c-400d-9ec1-c87617d9df65@gmail.com>
 <20241127072033.GU5461@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127072033.GU5461@pendragon.ideasonboard.com>

Hi Cosmin, Laurent,

On Wed, Nov 27, 2024 at 09:20:33AM +0200, Laurent Pinchart wrote:
> On Mon, Nov 25, 2024 at 10:34:40PM +0200, Cosmin Tanislav wrote:
> > On 11/23/24 11:32 PM, Laurent Pinchart wrote:
> > > On Fri, Nov 22, 2024 at 05:33:39PM +0200, Cosmin Tanislav wrote:
> > >> The error values end up being returned to userspace, it makes sense to
> > >> have some useful information printed when debugging them, even if the
> > >> reason for the errors are bad configs or internal driver issues.
> > >>
> > >> Replace dev_dbg() with dev_err() for errors.
> > > 
> > > We use dev_dbg() on purpose for all errors that can be triggered
> > > directly by applications. This includes in particular all pipeline
> > > validation errors.
> > > 
> > > The error paths in this specific patch shouldn't be in that category, as
> > > all the validation should have been performed before starting subdevs
> > > (assuming all drivers are correctly implemented, which is of course not
> > > a given, but those issues should be fixed). I think we could therefore
> > > switch to dev_err() here. However, I'm wondering what kind of issues
> > > triggered this patch. What errors did you run into that would have
> > > benefited from being reported more loudly, and were they caused by
> > > driver bugs or userspace misconfiguring the device ?
> > 
> > I've had this patch in my GMSL2 tree for some time now, I believe indeed
> > the reasons why I've hit these error cases were the drivers being
> > slightly broken, but I still think it is worthwhile to show an error
> > message, to aid with debugging. Adding the entity name to the messages
> > makes it even more clear where exactly the code is breaking.
> > 
> > I can split it up into separate patches for dev_dbg() -> dev_err() and
> > adding the entity name to the print statements for V2.
> 
> I'm OK either way. If other people prefer keeping dev_dbg() then
> splitting the patch in two would make sense.

dev_dbg() seems the correct function here: these are user-triggerable
errors that aren't related to hardware conditions.

> 
> > >> Also, when using complex pipelines with multiple bridges between the
> > >> video device and multiple source sub devices, printing just the video
> > >> device name for each error does not provide enough context as to which
> > >> operation failed.
> > >>
> > >> Add sub device entity name to the messages where possible to clarify the
> > >> source of the errors.
> > > 
> > > This can be considered as a standalone patch.
> > > 
> > >> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> > >> ---
> > >>   drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++----------
> > >>   1 file changed, 12 insertions(+), 10 deletions(-)
> > >>
> > >> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > >> index 4f0eecd7fd66f..d51b4594d11c5 100644
> > >> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > >> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > >> @@ -2303,20 +2303,21 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
> > >>   				    &found_streams, &enabled_streams);
> > >>   
> > >>   	if (found_streams != streams_mask) {
> > >> -		dev_dbg(dev, "streams 0x%llx not found on %s:%u\n",
> > >> +		dev_err(dev, "streams 0x%llx not found on %s:%u\n",
> > >>   			streams_mask & ~found_streams, sd->entity.name, pad);
> > >>   		ret = -EINVAL;
> > >>   		goto done;
> > >>   	}
> > >>   
> > >>   	if (enabled_streams) {
> > >> -		dev_dbg(dev, "streams 0x%llx already enabled on %s:%u\n",
> > >> +		dev_err(dev, "streams 0x%llx already enabled on %s:%u\n",
> > >>   			enabled_streams, sd->entity.name, pad);
> > >>   		ret = -EALREADY;
> > >>   		goto done;
> > >>   	}
> > >>   
> > >> -	dev_dbg(dev, "enable streams %u:%#llx\n", pad, streams_mask);
> > >> +	dev_dbg(dev, "enable streams %s:%u:%#llx\n",
> > >> +		sd->entity.name, pad, streams_mask);
> > >>   
> > >>   	already_streaming = v4l2_subdev_is_streaming(sd);
> > >>   
> > >> @@ -2333,8 +2334,8 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
> > >>   	}
> > >>   
> > >>   	if (ret) {
> > >> -		dev_dbg(dev, "enable streams %u:%#llx failed: %d\n", pad,
> > >> -			streams_mask, ret);
> > >> +		dev_err(dev, "enable streams %s:%u:%#llx failed: %d\n",
> > >> +			sd->entity.name, pad, streams_mask, ret);
> > >>   		goto done;
> > >>   	}
> > >>   
> > >> @@ -2403,20 +2404,21 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
> > >>   				    &found_streams, &enabled_streams);
> > >>   
> > >>   	if (found_streams != streams_mask) {
> > >> -		dev_dbg(dev, "streams 0x%llx not found on %s:%u\n",
> > >> +		dev_err(dev, "streams 0x%llx not found on %s:%u\n",
> > >>   			streams_mask & ~found_streams, sd->entity.name, pad);
> > >>   		ret = -EINVAL;
> > >>   		goto done;
> > >>   	}
> > >>   
> > >>   	if (enabled_streams != streams_mask) {
> > >> -		dev_dbg(dev, "streams 0x%llx already disabled on %s:%u\n",
> > >> +		dev_err(dev, "streams 0x%llx already disabled on %s:%u\n",
> > >>   			streams_mask & ~enabled_streams, sd->entity.name, pad);
> > >>   		ret = -EALREADY;
> > >>   		goto done;
> > >>   	}
> > >>   
> > >> -	dev_dbg(dev, "disable streams %u:%#llx\n", pad, streams_mask);
> > >> +	dev_dbg(dev, "disable streams %s:%u:%#llx\n",
> > >> +		sd->entity.name, pad, streams_mask);
> > >>   
> > >>   	if (!use_s_stream) {
> > >>   		/* Call the .disable_streams() operation. */
> > >> @@ -2432,8 +2434,8 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
> > >>   	}
> > >>   
> > >>   	if (ret) {
> > >> -		dev_dbg(dev, "disable streams %u:%#llx failed: %d\n", pad,
> > >> -			streams_mask, ret);
> > >> +		dev_err(dev, "disable streams %s:%u:%#llx failed: %d\n",
> > >> +			sd->entity.name, pad, streams_mask, ret);
> > >>   		goto done;
> > >>   	}
> > >>   

-- 
Regards,

Sakari Ailus

