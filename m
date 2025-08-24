Return-Path: <linux-media+bounces-40844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 978C2B33230
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 21:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FD7F188FDE0
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 19:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC5021C19E;
	Sun, 24 Aug 2025 19:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Kz1qgWdt"
X-Original-To: linux-media@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7223A2D7BF;
	Sun, 24 Aug 2025 19:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756062245; cv=none; b=AsI5Cbq7HX0FiLBCZFfqKoWB7FR9HU+t5XJMPix3WcWV4VGwZfgBA9CzGKJZxUSB2oN5sdc/8RUH4uqemf8MQRMtDrGFNkm6bqyGLZnCCBemURn0rjAce9amONKFvHQb1WR0KMe0AC7T6PvlbxhZ1BnUg419r2pbo1goc7UCLAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756062245; c=relaxed/simple;
	bh=LbCSL0JUXhcgqo4DhGgx+tjXiUW4uz43lv3+o0wMz9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIj4q02rexyPnb4K4490XrbkGwTLJpgzvRuMOglNq9KQR2VgoJcYcGYDFj7u+S7tGxu7ogh1GIW1oIzQr+iUDBayNRlzPhj0SdUza2RQ9WE2RoqHbXHBlG0qN7rcJ0A5Wa93M6qOYwSYcPGDrnw9IfmwJK0e16Rcufd9QF+MKWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Kz1qgWdt; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sun, 24 Aug 2025 21:03:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756062241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+OMTXb8xV65AsMAQFCAVr8lkgH43yIjoS3w8xxZJ7uA=;
	b=Kz1qgWdtIVswsTXzRnVx1J4koUgL4YK2tPbRZZBel+5aCtvDNO2aK8DGALuzD6ws5wymHl
	G82DCU9iOLpNy+05CS4HiZfptJpK2F7eYlUzoWLCetDOqjSGefqtV1tec9k3pDROdzBtTx
	DVtMcALSoU67/HyIpejoOefn73kLFZc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 00/11] Add strobe duration and hw strobe signal v4l2
 ctrl & use it for ov9282
Message-ID: <45sorlyc3rpwgslyqal7fnq7dcrdkbutuzcz6jbumxvci4mgrw@cvx2qi3ty4zz>
References: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
X-Migadu-Flow: FLOW_OUT

Hi,

just a friendly ping on this series.

I know its ELCE/OSS week, but as I'm unfortunately unable to attend I
thought I send you guys a friendly ping (and wish a lot of fun in
amsterdam to those who are there) :-)

thanks & regards;rl

On Wed, Jul 16, 2025 at 11:06:50AM +0200, Richard Leitner wrote:
> This series adds two new v4l2 controls:
> - V4L2_CID_FLASH_DURATION: "Strobe duration": This control enables
>   setting a desired flash/strobe length/duration in µs.
> - V4L2_CID_FLASH_HW_STROBE_SIGNAL: "Hardware strobe signal": This
>   control enables the hardware strobe output signal of a v4l2 device.
> 
> As a first user of these new controls add basic flash/strobe support
> for ov9282 sensors using their "hardware strobe output". The duration
> calculation is only interpolated from various measurements, as no
> documentation was found.
> 
> Further flash/strobe-related controls as well as a migration to v4l2-cci
> helpers for ov9282 will likely be implemented in future series.
> 
> All register addresses/values are based on the OV9281 datasheet v1.53
> (january 2019). This series was tested using an ov9281 VisionComponents
> camera module.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
> Changes in v6:
> - Fix "Alignment should match open parenthesis" by Media-CI bot in v4l2-flash-led-class.c
> - Fix "format string contains non-ascii character (µ)" by Media-CI bot in ov9282.c
> - Introduce new V4L2_CID_FLASH_HW_STROBE_SIGNAL control (as suggested by Sakari)
> - Implement V4L2_CID_FLASH_HW_STROBE_SIGNAL instead of
>   V4L2_CID_FLASH_LED_MODE in ov9282.c (as suggested by Sakari)
> - Drop "media: v4l2-flash: fix flash_timeout comment" as this was
>   applied (thanks Lee)
> - Link to v5: https://lore.kernel.org/r/20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev
> 
> Changes in v5:
> - Improve try_ctrl for flash_duration by using DIV_ROUND_UP() and abs() (thanks Sakari)
> - Drop "leds: flash: Add support for flash/strobe duration" as this was applied upstream
> - Add "media: i2c: ov9282: dynamic flash_duration maximum" (thanks Sakari)
> - Link to v4: https://lore.kernel.org/r/20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev
> 
> Changes in v4:
> - Fix FLASH_DURATION implementation in v4l2-flash-led-class.c by adding a
>   missing brace and enum entry (thanks Sakari)
> - Fix format of multiline comment in ov9282.c (thanks Sakari)
> - Add missing NULL check in ov9282.c (thanks Sakari)
> - Adapt nr_of_controls_hint for v4l2 handler in ov9282.c (thanks Sakari)
> - Add patch for implementing try_ctrl for strobe_duration (thanks Sakari)
> - Link to v3: https://lore.kernel.org/r/20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev
> 
> Changes in v3:
> - create separate patch for leds driver changes (thanks Lee)
> - Link to v2: https://lore.kernel.org/r/20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev
> 
> Changes in v2:
> - remove not needed controls in struct ov9282 (thanks Dave)
> - Fix commit message of 3/3 regarding framerate get/set (thanks Dave)
> - Add V4L2_CID_FLASH_STROBE_SOURCE impementation to ov9282
> - Add new V4L2_CID_FLASH_DURATION control (as suggested by Laurent)
> - Use FLASH_DURATION instead of FLASH_TIMEOUT for ov9282
> - Link to v1: https://lore.kernel.org/r/20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev
> 
> ---
> Richard Leitner (11):
>       media: v4l: ctrls: add a control for flash/strobe duration
>       media: v4l2-flash: add support for flash/strobe duration
>       Documentation: uAPI: media: add V4L2_CID_FLASH_DURATION
>       media: v4l: ctrls: add a control for enabling hw strobe signal
>       Documentation: uAPI: media: add V4L2_CID_FLASH_HW_STROBE_SIGNAL
>       media: i2c: ov9282: add output enable register definitions
>       media: i2c: ov9282: add hardware strobe signal v4l2 control
>       media: i2c: ov9282: add strobe_duration v4l2 control
>       media: i2c: ov9282: add strobe_source v4l2 control
>       media: i2c: ov9282: implement try_ctrl for strobe_duration
>       media: i2c: ov9282: dynamic flash_duration maximum
> 
>  .../userspace-api/media/v4l/ext-ctrls-flash.rst    |  11 ++
>  drivers/media/i2c/ov9282.c                         | 168 ++++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   3 +
>  drivers/media/v4l2-core/v4l2-flash-led-class.c     |  25 +++
>  include/uapi/linux/v4l2-controls.h                 |   2 +
>  5 files changed, 203 insertions(+), 6 deletions(-)
> ---
> base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
> change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6
> 
> Best regards,
> -- 
> Richard Leitner <richard.leitner@linux.dev>
> 
> 

