Return-Path: <linux-media+bounces-33410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C539AC43E1
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 20:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3896F3ACEF1
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 18:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D07623ED6A;
	Mon, 26 May 2025 18:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ICp9nTJQ"
X-Original-To: linux-media@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E931B4236
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748284910; cv=none; b=nmXTXa3JOzZyrHZYmAVKb3SSvZKdSMrq7/ee6bM/nxPmciYeCv/UwetseQSyIhm8Nb86Q0fY3K5emEfAfK/qoesn4mnaEzRPwy/blWUxhngZo3/vCsCYkSpbTpJ+SNk129vQun8KUZcfurJ4jKQ+ZkpN1AIZbYTZ9ERzd9/p8nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748284910; c=relaxed/simple;
	bh=gCWLJXPUdN7SbsvQhoScbIfa0JccmKZuImwSO62Gkjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXgDD6DepTPKYehB3GHS5gLF3BdtGZGW1/gCrAaRfZXm499NoDmt0r508HPtXeGijtGLMOD3CHZF1PjFxo5tXa6AIaJnCcTkv/48ReXXis/nw++pN25T9mlS74POIzh1duqaqP+Gs0B3LplFxjHQEOa1rVq/Dvn2KDS/fMf+5k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ICp9nTJQ; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 26 May 2025 20:41:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748284904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//3/4X1smOTo9euxVEzxPhU9KUsw8GBWxPVsUHdLyyQ=;
	b=ICp9nTJQnuxWSIdzUsh0s7zukSsXAjgwAi5llaPPxzco7xWEkEo6SHVbtIGZsJcAc22E9Z
	IDsxwjFLF79ggT+HholkwP3OMfGm8/dAz0P8J0vmIpGNLmdTcagiWfjskFTHZxl8ce96Tx
	/iyD4pD57StExoWa9bVT0i5/puCFU3Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 00/10] Add strobe/flash duration v4l2 ctrl & use it
 for ov9282
Message-ID: <kcobmtzu4zseepn5y6mf2kbnmmsqfewxkzpy5twvm32k6jr3iz@y2clbikgcxcw>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
X-Migadu-Flow: FLOW_OUT

Hi everybody,

this is a friendly ping :-)

Any feedback on this version of the series?
(except for that one approved patch ;-) )

Thanks & regards;
rl

On Wed, May 07, 2025 at 09:51:29AM +0200, Richard Leitner wrote:
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
>       leds: flash: add support for flash/stobe duration
>       media: v4l2-flash: add support for flash/strobe duration
>       media: v4l2-flash: fix flash_timeout comment
>       Documentation: uAPI: media: add V4L2_CID_FLASH_DURATION
>       media: i2c: ov9282: add output enable register definitions
>       media: i2c: ov9282: add led_mode v4l2 control
>       media: i2c: ov9282: add strobe_duration v4l2 control
>       media: i2c: ov9282: add strobe_source v4l2 control
>       media: i2c: ov9282: implement try_ctrl for strobe_duration
> 
>  .../userspace-api/media/v4l/ext-ctrls-flash.rst    |   5 +
>  drivers/leds/led-class-flash.c                     |  15 +++
>  drivers/media/i2c/ov9282.c                         | 148 ++++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   1 +
>  drivers/media/v4l2-core/v4l2-flash-led-class.c     |  25 ++++
>  include/linux/led-class-flash.h                    |  18 ++-
>  include/uapi/linux/v4l2-controls.h                 |   1 +
>  7 files changed, 208 insertions(+), 5 deletions(-)
> ---
> base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
> change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6
> prerequisite-change-id: 20250225-b4-ov9282-gain-ef1cdaba5bfd:v1
> prerequisite-patch-id: 86f2582378ff7095ab65ce4bb25a143eb639e840
> prerequisite-patch-id: b06eb6ec697aaf0b3155b4b2370f171d0d304ae2
> prerequisite-patch-id: b123047d71bfb9b93f743bbdd6893d5a98495801
> 
> Best regards,
> -- 
> Richard Leitner <richard.leitner@linux.dev>
> 
> 

