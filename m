Return-Path: <linux-media+bounces-1839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC180884B
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB4E51C20B27
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991073D0BD;
	Thu,  7 Dec 2023 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="StZhzpdt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A2B11F
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 04:48:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7425669;
	Thu,  7 Dec 2023 13:47:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701953275;
	bh=0lm+bxEMOVWRTtH1ivBF2nfxPkTMJTSRMcFVUWaBwYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=StZhzpdtvaddJRBKAgblB1BVpXjzYs80m8ugeEn/fJq7dVu0pMx+VJmmElQgDafNM
	 ebCyBdHK6UfULBMPzppXD+hBDLwE4YlDcP7cTNtj+oobXokP07eAsI2a8lTJDRjtlP
	 fiu5bFAjE4eqO7gvvQa/UMtfN7+FPvFiX2OOMis0=
Date: Thu, 7 Dec 2023 14:48:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	hverkuil@xs4all.nl
Subject: Re: [PATCH 0/6] Old non-MC-aware drivers have no sub-device state
Message-ID: <20231207124842.GI9675@pendragon.ideasonboard.com>
References: <20231207120912.270716-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231207120912.270716-1-sakari.ailus@linux.intel.com>

On Thu, Dec 07, 2023 at 02:09:06PM +0200, Sakari Ailus wrote:
> Hi folks,
> 
> This set replaces the earlier attempt to fix non-MC-aware sub-device
> drivers that still use the set_fmt and similar sub-device ops. These
> drivers have been converted from the olf set_fmt etc. video ops.
> 
> The issue here is that the caller does not initialise the full sub-device
> state so the sd field of struct v4l2_subdev_state is NULL, leading
> currently to NULL pointer dereference, even if the code compiles. This was
> not the case before commit fd17e3a9a7886ec949ce269a396b67875b51ff45 .
> 
> Even then, there's no need to access the sub-device state as the format
> (or selection rectangle) won't be stored for a longer period of time: the
> caller (saa7134 driver) simply uses the original configuration to obtain
> the changed value.

Just a note that he caller for the other subdev drivers, renesas-ceu,
does exactly the same thing, so the same fix is applicable.

> This patchset does not address similar issues in the ov6650 driver.

The driver is not used in mainline anymore. It was merged for an old
OMAP1 device that has been dropped from the kernel.

I wonder if we should start moving some sensor drivers to staging...

> Sakari Ailus (6):
>   media: saa6752hs: Don't set format in sub-device state
>   media: adv7183: Don't set format in sub-device state
>   media: mt9t112: Don't set format in sub-device state
>   media: rj54n1cb0c: Don't set format in sub-device state
>   media: tw9910: Don't set format in sub-device state
>   media: ov9640: Don't set format in sub-device state
> 
>  drivers/media/i2c/adv7183.c    | 2 --
>  drivers/media/i2c/mt9t112.c    | 1 -
>  drivers/media/i2c/ov9640.c     | 2 --
>  drivers/media/i2c/rj54n1cb0c.c | 4 +---
>  drivers/media/i2c/saa6752hs.c  | 4 +---
>  drivers/media/i2c/tw9910.c     | 2 --
>  6 files changed, 2 insertions(+), 13 deletions(-)

-- 
Regards,

Laurent Pinchart

