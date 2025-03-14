Return-Path: <linux-media+bounces-28258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4458CA615E2
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 17:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 888A716FD45
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8244820408D;
	Fri, 14 Mar 2025 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fvn3jhaW"
X-Original-To: linux-media@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8EE20299A
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741968516; cv=none; b=f8R6qht1qI93RVQ5wbj9qalxWeW2+mjZxDBNaX9gTT1FDFRfpgGbW2+/i8BMKYSPlIOYP3nRsnMsGZqdnZq3Nyyrunym//i9WpH+IxhY0iiHd3UjXxj3rfwi1roZGgsuJARXLmFedzoluSmc6INbMxWX1EQQOIjx7taZsloVZ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741968516; c=relaxed/simple;
	bh=Gdtm/ZFzFHmNDH+zYXX/URlTgeHJuw4bEaQLs3cOBkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6qicHkWeULoqaRabv6h5HqxuRoDuBxP+OQR3dQfnS8V7yh4a+ywVEgvxmPg4ZLUbP6GjL/iqW20LummtAT8y/X/k5/G0zhSwLUbf/S+ncOU9tsbVlPoFvMyyD/4avhKsskaDsrUphpQENipXrulf+8tKFlls/RqCvRn2lz84QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fvn3jhaW; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 14 Mar 2025 17:08:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741968503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6F73qFo7dhlEvHBdRvalkfpkuBt+veVvf8M0VIHnfg=;
	b=fvn3jhaWGCUIhKZ8Bw+Hxv7I1K00R3L7Fm27ApIu9GJjsQvNf1MlMoV+jOY6BKlkNgwGa8
	wXpu7caTy06VAt+6BS3IGCjhewNy6eXJbIjulDaz7wf98uZEl2YscAIZd2+iDJpXCoR2Z3
	GUnBxNMdtvGj0eXba7Aiy9ujMbbxP/A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: v4l: ctrls: add a control for flash/strobe
 duration
Message-ID: <3dkwhfqxjhu3w4hpcl4gfsi22kwauo6s5urxrorezaw323yygq@nujmlkie5rpd>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
 <20250314-ov9282-flash-strobe-v2-1-14d7a281342d@linux.dev>
 <Z9P01zU_Kg0U62wa@kekkonen.localdomain>
 <bx4p2hycva2rqywgglqluus6o7jbmfa2jjbc4k5d6aw6wsfkxd@zrtckmwtphuq>
 <Z9QwT7n7D09BEfqa@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9QwT7n7D09BEfqa@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

On Fri, Mar 14, 2025 at 01:34:07PM +0000, Sakari Ailus wrote:
> Hi Richard,
> 
> On Fri, Mar 14, 2025 at 11:25:09AM +0100, Richard Leitner wrote:
> > On Fri, Mar 14, 2025 at 09:20:23AM +0000, Sakari Ailus wrote:
[...]
> > > On Fri, Mar 14, 2025 at 09:49:55AM +0100, Richard Leitner wrote:
> > > > Add a control V4L2_CID_FLASH_DURATION to set the duration of a
> > > > flash/strobe pulse. This is different to the V4L2_CID_FLASH_TIMEOUT
> > > > control, as the timeout defines a limit after which the flash is
> > > > "forcefully" turned off again.
> > > > 
> > > > On the other hand the new V4L2_CID_FLASH_DURATION is the desired length
> > > > of the flash/strobe pulse
> > > 
> > > What's the actual difference between the two? To me they appear the same,
> > > just expressed in a different way.
> > 
> > According to FLASH_TIMEOUT documentation:
> > 
> > 	Hardware timeout for flash. The flash strobe is stopped after this
> > 	period of time has passed from the start of the strobe. [1]
> > 
> > This is a little bit unspecific, but as also discussed with Dave [2]
> > according to the documentation of V4L2_FLASH_FAULT_TIMEOUT it seems to
> > be targeted at providing a "real timeout" control, not settings the
> > desired duration:
> > 
> > 	The flash strobe was still on when the timeout set by the user
> > 	--- V4L2_CID_FLASH_TIMEOUT control --- has expired. Not all flash
> > 	controllers may set this in all such conditions. [1]
> > 
> > If I understood that wrong, I'm also happy to use FLASH_TIMEOUT for this
> > use-case. But tbh I think FLASH_DURATION would be more specific.
> > 
> > As this still seems unclear: Should the documentation be
> > changed/rewritten if we stick with the FLASH_DURATION approach?
> > 
> > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-flash.html
> > [2] https://lore.kernel.org/lkml/CAPY8ntB8i4OyUWAL8k899yUd5QsRifJXiOfWXKceGQ7TNZ4OUw@mail.gmail.com/
> 
> Right, I think I can see what you're after.
> 
> How does the sensor determine when to start the strobe, i.e. on which frame
> and which part of the exposure of that frame?

In general I think it's not part of V4L2_CID_FLASH_DURATION to take any
assumptions on that, as that's sensor/flash specific IMHO.

In case of the ov9282 sensor driver (which is also part of this series)
the strobe is started synchronously with the exposure on each frame
start.
Being even more specific on the ov9292, the sensor also offers the
possibility to shift that strobe start in in either direction using a
register. Implementing this "flash shift" (as it's called in the sensors
datasheet) is currently under test on my side. I will likely send a
series for that in the coming weeks.

> > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
> > > >  include/uapi/linux/v4l2-controls.h        | 1 +
> > > >  2 files changed, 2 insertions(+)
[...]
> 
> -- 
> Regards,
> 
> Sakari Ailus

Thanks!
Richard

