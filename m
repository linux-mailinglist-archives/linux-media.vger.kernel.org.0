Return-Path: <linux-media+bounces-16806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A099B95F21F
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51D09285717
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E061925B8;
	Mon, 26 Aug 2024 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BGaWBBCB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF04017C9BE;
	Mon, 26 Aug 2024 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676639; cv=none; b=IXRXfakTG9emT/Nn0sQhUYo6yAGiadIRbbYrx77CdUKFjWFQt1AY6PAWCgxLlVDPuXgKIz6+Fjf4Jk/S82Jf1wzULezCVcQVT5g6wplD+M8yBGpNv+pYlY/HX7dASw9PPu8VDks6TVz2EaQDmyK0zXyxEi40nCpfGrBu9+OYneA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676639; c=relaxed/simple;
	bh=h+V4E/9SmYyljfZPAboxZTVtV8o4lOGiPMRBdTHLaMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3PFX8Z9KDirKC0MLlPUgxb0lRO+mpgnBRpCMEIsyRSA64evCdX+4N7OyVhMW1Q9ZrXok4hzrhu4jnd4rNhuAgZjYqkvKmf2L6oC9so1TDXN3T6QlLSdTrMgSj8z9qfxYitdn8c8ARDEEtZLgZZzhId2P6Pte/IcSQJGK0i4K3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BGaWBBCB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EAD26CA;
	Mon, 26 Aug 2024 14:49:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724676569;
	bh=h+V4E/9SmYyljfZPAboxZTVtV8o4lOGiPMRBdTHLaMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BGaWBBCBI+hPYAWMqXDRUyWllYucz09O4P7TXFQkbrU0l8558bj8SP+uimtZ0bhAZ
	 QIQ54fncz0g9kBQNAtuc23mN8N67MES4xeEx6FaUiXbXaKzXQz12Oe+5bh3LZ5qI93
	 Mr0d1+nqXPqR7Fk/CoqgwIlc9+9OrTJUCzDdOqQU=
Message-ID: <f1b1685e-dc09-4dc0-bca8-1f75899b77df@ideasonboard.com>
Date: Mon, 26 Aug 2024 15:50:31 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] media: v4l2: Improve media link validation
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Eugen Hristev
 <eugen.hristev@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/08/2024 15:40, Laurent Pinchart wrote:
> Hello,
> 
> This patch series improves the link validation helpers to make it easier
> for drivers to validate all links in a pipeline.

For the ones still missing my Rb:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi

> The vast majority of drivers use the v4l2_subdev_link_validate()
> function as their .link_validate() handler for subdevs. This correctly
> validates subdev-to-subdev links. For links between subdevs and video
> capture devices, a few drivers implement the .link_validate() operation
> of their video devices, while others implement manual validation in
> their .streamon() handler, or don't implement validation at all. Links
> between video output devices are in an even worse state, as the link
> validation logic at pipeline start time does not call the
> .link_validate() operation on the source side of a link, leaving manual
> validation in .streamon() the only option. Adding insult to injury,
> v4l2_subdev_link_validate() prints a warning when the link's source is
> not a subdev, which forces drivers to implement a manual subdev link
> validation handler for subdevs connected to output video nodes.
> 
> It turns out that v4l2_subdev_link_validate() is even used in the
> .link_validate() implementation of video devices by two drivers. This is
> clearly wrong, and is addressed by patches 1/7 to 3/7. Note that patch
> 3/7 should ideally implement real validation of the link between the
> subdev and video capture device, but that requires understanding of the
> driver's logic as well as testing, so I have left it out as an exercise
> for the driver's maintainer. The patch doesn't introduce any regression.
> 
> Patch 4/7 then starts refactoring the v4l2_subdev_link_validate() to
> separate the current warning in two categories, with a WARN_ON() for an
> issue that indicates a clear driver bug (and does not occur in any
> driver in mainline at the moment), and keeping the pr_warn_once() for
> other issues that are present in multiple drivers.
> 
> Patch 5/7 continues with expanding v4l2_subdev_link_validate() to better
> support links from video output devices to subdevs, delegating the
> validation to the video output device's .link_validate() operation. This
> allows using v4l2_subdev_link_validate() for all subdevs in a driver,
> regardless of whether they are connected to other subdevs, video capture
> devices or video output devices, and implementing all the link
> validation for video devices in their .link_validate() operation.
> 
> Patches 6/7 and 7/7 then address the v4l2_subdev_link_validate() warning
> for the vsp1 driver. Patch 6/7 silences the warning. This is
> unfortunately done with a workaround, as the ideal implementation,
> moving all validation for video devices to their .link_validate()
> operation as showcased in patch 7/7, breaks operation of the vsp1 unit
> test suite. While that is fixable in the test suite, it indicates that
> other userspace applications may also break as a result.
> 
> To my great sadness, I had to mark patch 7/7 as [DNI]. This does not
> make the v4l2_subdev_link_validate() improvements in patch 5/7
> pointless, as they are useful for new drivers, as well as drivers that
> don't include multiple video devices in a pipeline.
> 
> Laurent Pinchart (7):
>    media: microchip-isc: Drop v4l2_subdev_link_validate() for video
>      devices
>    media: sun4i_csi: Implement link validate for sun4i_csi subdev
>    media: sun4i_csi: Don't use v4l2_subdev_link_validate() for video
>      device
>    media: v4l2-subdev: Refactor warnings in v4l2_subdev_link_validate()
>    media: v4l2-subdev: Support hybrid links in
>      v4l2_subdev_link_validate()
>    media: renesas: vsp1: Implement .link_validate() for video devices
>    [DNI] media: renesas: vsp1: Validate all links through
>      .link_validate()
> 
>   .../platform/microchip/microchip-isc-base.c   |  19 +---
>   .../media/platform/renesas/vsp1/vsp1_video.c  | 104 +++++++++---------
>   .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  12 ++
>   drivers/media/v4l2-core/v4l2-subdev.c         |  53 +++++++--
>   include/media/v4l2-subdev.h                   |   6 +
>   5 files changed, 118 insertions(+), 76 deletions(-)
> 
> 
> base-commit: a043ea54bbb975ca9239c69fd17f430488d33522


