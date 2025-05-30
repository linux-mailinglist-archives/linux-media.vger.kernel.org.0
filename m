Return-Path: <linux-media+bounces-33660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B737EAC8F37
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 520B3A43B38
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4894E26B0AE;
	Fri, 30 May 2025 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T6bKEan/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AA926B080;
	Fri, 30 May 2025 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748608881; cv=none; b=HYyx+Tybb4qlkKmvgpWPf8RVhemtfz2xQg9y0LQaPZOgorwBhTHlGxNWm9HWO/LXYgWxoSelZ6af0mcP/1hgFMudwJ0swtnVV3oN65ipK9fAkJa7vpPyu6lUXj5ulO/WW1Dx9YUo11nPpCtS4G12oCrjegRAnlOaU+S7ICBZtjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748608881; c=relaxed/simple;
	bh=SW+nol2ozZB7nq88SNNu1/0ChvF+TV5eWvLNJG3Ntzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aX1g/D746SMlUCWr8GUkpCOjAn+UcoCMLJcpI+gsamH71GzVuAzewGseV+rQB4B1TVq6UUTZdDJQFcuWdgAUAZ5JdoORExKGfVodwukmG03SaJW6DsPkXJ6LvU75TKRHDILcBt3J+/DNtin6PuNgQlh0hHtOfn6MvfPXR7L8TEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T6bKEan/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0933182E;
	Fri, 30 May 2025 14:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748608850;
	bh=SW+nol2ozZB7nq88SNNu1/0ChvF+TV5eWvLNJG3Ntzk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=T6bKEan/motHOEDxV9szShPnLmunKOYLGfXFInLTsoV44WnLB+uSay05cWeJKVxqv
	 FVLKOWqh+OTkeNKh6dW20Awlz0lebeKZ5GsskapArp3ZZFP2r7PdjGGfPTkhp7Cwso
	 hm9fVlXaeQcfGmAcXHJiYVUBe+1fqdEi5R1tihMM=
Message-ID: <95530176-d873-47ca-9799-cfb365aa8e45@ideasonboard.com>
Date: Fri, 30 May 2025 15:41:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: rcar-vin: Unify notifiers and enable MC on
 Gen2
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 21/05/2025 16:20, Niklas Söderlund wrote:
> Hello,
> 
> This series completes the conversion of the soc_camera VIN driver to a
> full fledge media-graph enabled driver for R-Car Gen2 devices, Gen3 and
> later have been media-graph centric from the start. Having a single
> driver supporting both MC and non-MC operation have lead do odd design
> decisions in the driver, and it have prevented improving the driver over
> all.
> 
> New features and bug fixes have always been more important then fixing
> this old generation to be MC-centric. But in order to start to play with
> libcamera support for the R-Car pipeline it have become more pressing to
> make take the time to make this driver MC-only, and more importantly
> test it to make sure nothing really breaks.
> 
> Patch 1/6 and 2/6 are drive-by fixes correcting issues in the existing
> design. Patch 3/6 prepares for Gen2 MC by making sure each VIN instance
> on Gen2 gets a unique ID which will be needed to support VIN groups.
> Compared to Gen3 and later the group ID does not match what it can do in
> the group and does not need to be set from DT, all that matters is that
> each VIN instance have a unique ID.
> 
> Patch 4/6 and 5/6 uses the fact that VIN instances on Gen2 now have
> unique IDs and greatly simplifies the unnecessarily complex vl4-async
> notifier usage in the VIN driver. This have in the past lead to some
> subtle bugs and having only a single notifier for all VIN will remove a
> lot of possibilities for this to go wrong in the future.
> 
> Finally patch 6/6 removes all non MC code paths and have the Gen2
> devices register a media device and configure links.
> 
> This have been tested on Gen3 and Gen4 devices without any regressions.
> And on Gen2 to make sure the media-graph behaves as it should. As a
> bonus the Gen2 devices can now join the VIN CI and any future issues
> should be caught as they are for Gen3 and Gen4.
> 
> See individual patches for changelog.
> 
> Niklas Söderlund (6):
>   media: rcar-vin: Use correct count of remote subdevices
>   media: rcar-vin: Change link setup argument
>   media: rcar-vin: Generate a VIN group ID for Gen2
>   media: rcar-vin: Prepare for unifying all v4l-async notifiers
>   media: rcar-vin: Merge all notifiers
>   media: rcar-vin: Enable media-graph on Gen2
> 
>  .../platform/renesas/rcar-vin/rcar-core.c     | 706 +++++++-----------
>  .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
>  .../platform/renesas/rcar-vin/rcar-v4l2.c     | 488 +-----------
>  .../platform/renesas/rcar-vin/rcar-vin.h      |  14 +-
>  4 files changed, 305 insertions(+), 919 deletions(-)
> 

On my V4H board, GMSL2, multistreams branch:

Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

 Tomi


