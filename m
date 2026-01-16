Return-Path: <linux-media+bounces-50828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFA2D2CF4A
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC6BC307B3D0
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 07:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAD13502AA;
	Fri, 16 Jan 2026 07:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ePD5Vn6h"
X-Original-To: linux-media@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4529734FF7D
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547300; cv=none; b=ZEli8gVr/4odnUsfUC78UwID9rbYwbH/+OnGKePPRigV2nbn3wMU5ZuJVqkJxAcqASjYnrNB0l9ENTRI5gDi4mqDi6EAUVBP8m7W+uDkguylby/ZO4YG1FUaw/ZKRGW5PPsjZ6UQnzfqloqdn75ShjwPCW84i8llachTdrFTrv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547300; c=relaxed/simple;
	bh=2qbze2vG4GkljdlYia7bGU4A6StztMWJlZ+y3rJr8CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NriDuo60LvPWFSBWSqgKtYibNqzdgB9s8Db7CkWtWY60RNpC1D1kwGOiUyRQtQbqZdhKdqOHcSxEerYSgPG9m6mDT83aObR6lokmcYAZKRxyIlJQenlozJzxTHk2bQfC4LlXjoepoQ+0EQ/cGRt2o7RpcByFV4B25G2LRdOLjEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ePD5Vn6h; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 16 Jan 2026 08:08:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768547296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lX8Quj5zLIwlBRCtydms5VODe9H7C/DISErb8QOSaWs=;
	b=ePD5Vn6hxhqRLbPfaTMwFetHnEhOOX+IYE+T3Z1W59nUPUFU9tbpHJWsKbM7OhC/9kUWJI
	yDMXG1VKTbtd8Mlkk27siqfAgPR7vTfbUVfWbnTfDD1XoG0DIDGHgl3Yfpp0ixXEOdSkAd
	ISEiEkrLDygWQYZ0Z8tVfBcseMqP0fY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v10 0/8] Add strobe duration and strobe output enable
 v4l2 ctrl
Message-ID: <w43pelg4dzxxswklhnlpmql5snvyjfvvc2hzl4ihvjkklvg2ei@6veozvnjc7pw>
References: <20251209-ov9282-flash-strobe-v10-0-0117cab82e2d@linux.dev>
 <h4ecxwe27hzelohvwhhosvdz5b6ybi25yopicatp54prrkaaai@sir4kskvxza5>
 <lwib4og3xnpmqrvmkenp5m6qywuzwmzilpdh74ugx2jfbm2s2o@zyvplzxtkepo>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lwib4og3xnpmqrvmkenp5m6qywuzwmzilpdh74ugx2jfbm2s2o@zyvplzxtkepo>
X-Migadu-Flow: FLOW_OUT

Hi Sakari, Hi Laurent,

first of all, happy new year 2026 to all of you.
I hope you had a good start to the new year?

Regarding this series: Perhaps you've made it your New Year's resolution
to give it another round of review? ;-) Would be great to get some more
feedback (or Reviewed-By's).

regards;rl

On Tue, Dec 30, 2025 at 11:09:02AM +0100, Richard Leitner wrote:
> Hi again,
> 
> just wanted to mention that I'll be doing a short (10 min) talk on this
> topic at FOSDEM 2026 in the Embedded, Mobile and Automotive devroom on
> sunday: https://fosdem.org/2026/schedule/event/A7P7XE-v4l2-flash-control/
> 
> Would be great if I could get some more - maybe final ;) - review on
> this series before FOSDEM. Thanks!
> 
> regards;rl
> 
> On Thu, Dec 18, 2025 at 08:22:53AM +0100, Richard Leitner wrote:
> > Hi everybody,
> > 
> > just a friendly ping before the holiday season kicks in :-)
> > 
> > regards;rl
> > 
> > On Tue, Dec 09, 2025 at 11:44:35PM +0100, Richard Leitner wrote:
> > > This series adds two new v4l2 controls:
> > > - V4L2_CID_FLASH_DURATION: "Strobe duration": This control enables
> > >   setting a desired flash/strobe length/duration in µs.
> > > - V4L2_CID_FLASH_STROBE_OE: "Strobe output enable": This
> > >   control enables the hardware strobe output signal of a v4l2 device.
> > > 
> > > As a first user of these new controls add basic flash/strobe support
> > > for ov9282 sensors using their "hardware strobe output". The duration
> > > calculation is only interpolated from various measurements, as no
> > > documentation was found.
> > > 
> > > Further flash/strobe-related controls as well as a migration to v4l2-cci
> > > helpers for ov9282 will likely be implemented in future series.
> > > 
> > > All register addresses/values are based on the OV9281 datasheet v1.53
> > > (january 2019). This series was tested using an ov9281 VisionComponents
> > > camera module.
> > > 
> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > ---
> > > Changes in v10:
> > > - Avoid bitwise or on error codes in ov9282_set_ctrl_flash_duration() (Thanks Sakari)
> > > - Link to v9: https://patch.msgid.link/20251120-ov9282-flash-strobe-v9-0-6c9e3a4301d7@linux.dev
> > > 
> > > Changes in v9:
> > > - Avoid needless multiplication/division in ov9282.c (Thanks Sakari)
> > > - Avoid possible u32 overflow in ov9282.c (Thanks Sakari)
> > > - Link to v8: https://patch.msgid.link/20251104-ov9282-flash-strobe-v8-0-b91dfef1c65a@linux.dev
> > > 
> > > Changes in v8:
> > > - Minor styling changes across the set
> > > - Add missing error handling for ov9282 strobe_frame_span writing
> > > - Rename V4L2_CID_FLASH_HW_STROBE_SIGNAL to V4L2_CID_FLASH_STROBE_OE
> > > - Drop 02/10: FLASH_DURATION handling in v4l2-flash
> > > - Drop 08/10: strobe_source in ov9282
> > > - Link to v7: https://lore.kernel.org/r/20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev
> > > 
> > > Changes in v7:
> > > - Improved v4l2 uAPI documentation (thanks Sakari)
> > > - Link to v6: https://lore.kernel.org/r/20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev
> > > 
> > > Changes in v6:
> > > - Fix "Alignment should match open parenthesis" by Media-CI bot in v4l2-flash-led-class.c
> > > - Fix "format string contains non-ascii character (µ)" by Media-CI bot in ov9282.c
> > > - Introduce new V4L2_CID_FLASH_HW_STROBE_SIGNAL control (as suggested by Sakari)
> > > - Implement V4L2_CID_FLASH_HW_STROBE_SIGNAL instead of
> > >   V4L2_CID_FLASH_LED_MODE in ov9282.c (as suggested by Sakari)
> > > - Drop "media: v4l2-flash: fix flash_timeout comment" as this was
> > >   applied (thanks Lee)
> > > - Link to v5: https://lore.kernel.org/r/20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev
> > > 
> > > Changes in v5:
> > > - Improve try_ctrl for flash_duration by using DIV_ROUND_UP() and abs() (thanks Sakari)
> > > - Drop "leds: flash: Add support for flash/strobe duration" as this was applied upstream
> > > - Add "media: i2c: ov9282: dynamic flash_duration maximum" (thanks Sakari)
> > > - Link to v4: https://lore.kernel.org/r/20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev
> > > 
> > > Changes in v4:
> > > - Fix FLASH_DURATION implementation in v4l2-flash-led-class.c by adding a
> > >   missing brace and enum entry (thanks Sakari)
> > > - Fix format of multiline comment in ov9282.c (thanks Sakari)
> > > - Add missing NULL check in ov9282.c (thanks Sakari)
> > > - Adapt nr_of_controls_hint for v4l2 handler in ov9282.c (thanks Sakari)
> > > - Add patch for implementing try_ctrl for strobe_duration (thanks Sakari)
> > > - Link to v3: https://lore.kernel.org/r/20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev
> > > 
> > > Changes in v3:
> > > - create separate patch for leds driver changes (thanks Lee)
> > > - Link to v2: https://lore.kernel.org/r/20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev
> > > 
> > > Changes in v2:
> > > - remove not needed controls in struct ov9282 (thanks Dave)
> > > - Fix commit message of 3/3 regarding framerate get/set (thanks Dave)
> > > - Add V4L2_CID_FLASH_STROBE_SOURCE impementation to ov9282
> > > - Add new V4L2_CID_FLASH_DURATION control (as suggested by Laurent)
> > > - Use FLASH_DURATION instead of FLASH_TIMEOUT for ov9282
> > > - Link to v1: https://lore.kernel.org/r/20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev
> > > 
> > > ---
> > > Richard Leitner (8):
> > >       media: v4l: ctrls: add a control for flash/strobe duration
> > >       media: v4l: ctrls: add a control for enabling strobe output
> > >       Documentation: uAPI: media: add V4L2_CID_FLASH_{DURATION,STROBE_OE}
> > >       media: i2c: ov9282: add output enable register definitions
> > >       media: i2c: ov9282: add strobe output enable v4l2 control
> > >       media: i2c: ov9282: add strobe_duration v4l2 control
> > >       media: i2c: ov9282: implement try_ctrl for strobe_duration
> > >       media: i2c: ov9282: dynamic flash_duration maximum
> > > 
> > >  .../userspace-api/media/v4l/ext-ctrls-flash.rst    |  42 +++++
> > >  drivers/media/i2c/ov9282.c                         | 174 ++++++++++++++++++++-
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   3 +
> > >  include/uapi/linux/v4l2-controls.h                 |   2 +
> > >  4 files changed, 215 insertions(+), 6 deletions(-)
> > > ---
> > > base-commit: 2f112b1c25da9f5346c2261ed35c5b1e0b906471
> > > change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6
> > > 
> > > Best regards,
> > > --  
> > > Richard Leitner <richard.leitner@linux.dev>
> > > 
> > > 

