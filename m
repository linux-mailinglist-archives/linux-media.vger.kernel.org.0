Return-Path: <linux-media+bounces-37171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3A4AFDF34
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 07:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 004DE1BC672B
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 05:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D96F26A1BB;
	Wed,  9 Jul 2025 05:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PMYaiw+w"
X-Original-To: linux-media@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC94220010C
	for <linux-media@vger.kernel.org>; Wed,  9 Jul 2025 05:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752038716; cv=none; b=rnK4loEgGxDWAXyZPc8kL2Pcc/iDMyWYXbc85zLWjWP9Aau1u4prD9kwAnnFwO9uWCNOcGbsCVnjIwKtIhB4Ef76zWuCFRzPbwwDia3N1zuWPAdeqNgT9jdNNiNoOQ4rbX3rOuDq6ec9fe5CinKH2rP2I/fOZOXrd46Wxz+8ZFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752038716; c=relaxed/simple;
	bh=WodqCRbyHCoG9/rv9DcIweeSuS1a0gF6AJU577W+mNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSpMMrvhdcuH9qLRO0A8J2TzEsV4HWQFCJfMXLyEtcm0TbNLDT/XCYmRtBGBeV552G7uFtKfQWTAH+IJHIInBpDmxHpByLvF69VDPxuoP9tGXz+Ccztw0C/zQulYphiNrcfCfAhPhY5fZzFWaxK6FlQ+KE4XnksU+7ZH16lKb+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PMYaiw+w; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 9 Jul 2025 07:24:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752038701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MB0wSYD4aTt2qOL0P3f18klNqmKxL2CUFBvEfl1NWEk=;
	b=PMYaiw+w5Bes5alPFwEHYd73K9GD2Jxn1XW2naBEn8TSXfJAqzLfflPYPhCVaoGsL/+l5u
	Sl0r6jbjRJBW4iS4yLK9lth8fY/mBEWyFHQ0IZmm8gpOqIP5T/Und0suqskUO+IIqHYWb4
	mFgreO9m4+7PdNIufFF5u62uxfUsqc8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 00/10] Add strobe/flash duration v4l2 ctrl & use it
 for ov9282
Message-ID: <h43ffbhrelzbc5bgl3utp6o7lyxozhm756vyx2lqsuphjtllqo@epsedvjhbsqc>
References: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
X-Migadu-Flow: FLOW_OUT

Hi,

just a friendly ping on this series.

Any feedback/reviews/ack or suggestions for improvement are greatly appreciated.

Thanks!

regards;rl

On Tue, Jun 17, 2025 at 09:31:34AM +0200, Richard Leitner wrote:
> This series adds a new v4l2 controls named "strobe duration" with id
> V4L2_CID_FLASH_DURATION. This control enables setting a desired
> flash/strobe length/duration in µs.
> 
> As a first user of this new control add basic flash/strobe support for
> ov9282 sensors using their "hardware strobe output". The duration
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
> Richard Leitner (10):
>       media: v4l: ctrls: add a control for flash/strobe duration
>       media: v4l2-flash: add support for flash/strobe duration
>       media: v4l2-flash: fix flash_timeout comment
>       Documentation: uAPI: media: add V4L2_CID_FLASH_DURATION
>       media: i2c: ov9282: add output enable register definitions
>       media: i2c: ov9282: add led_mode v4l2 control
>       media: i2c: ov9282: add strobe_duration v4l2 control
>       media: i2c: ov9282: add strobe_source v4l2 control
>       media: i2c: ov9282: implement try_ctrl for strobe_duration
>       media: i2c: ov9282: dynamic flash_duration maximum
> 
>  .../userspace-api/media/v4l/ext-ctrls-flash.rst    |   5 +
>  drivers/media/i2c/ov9282.c                         | 172 ++++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   1 +
>  drivers/media/v4l2-core/v4l2-flash-led-class.c     |  25 +++
>  include/linux/led-class-flash.h                    |   2 +-
>  include/uapi/linux/v4l2-controls.h                 |   1 +
>  6 files changed, 199 insertions(+), 7 deletions(-)
> ---
> base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
> change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6
> 
> Best regards,
> -- 
> Richard Leitner <richard.leitner@linux.dev>
> 
> 

