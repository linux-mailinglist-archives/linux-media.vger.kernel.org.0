Return-Path: <linux-media+bounces-25186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20DA19F14
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 08:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA9D1188ED6D
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 07:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B88F20B813;
	Thu, 23 Jan 2025 07:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uu1X1r25"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAA520B7FC;
	Thu, 23 Jan 2025 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617710; cv=none; b=tEHibxCWc5BSBN4WCrRzxRZZw1lijP9I5bP5SrZRVWnPoiZzdwc9EH38HmIQAXIPulMSNCVfMIO0tCzgl62j0MWY8yMd596quDzi01df6pOjC1XV41uLdePvERI9exS7ZGu5b6y64YCwwRF6jrVWR6a1xHLDB+iREMs2fY8EVZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617710; c=relaxed/simple;
	bh=XyY/nHGMCRKgluV7H4DjTZ0tdLlE+I9C1S/Xn0fqVMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LiYp4+QS0905zd92MiRauybKrZQgCC0lRWol9BUxNsBYJm6IlVq6iu6ZXkKk19udUn+GmKaTcQ3fZ4GS+wrQcvSTe9op+8zuF6BN1e2Ra5+1eleB2MqH07boxwkjRzP97VphA2UTCzahzt5dVztfUyhfdGQn4nrm0FCQjvi1RuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uu1X1r25; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3014189A;
	Thu, 23 Jan 2025 08:34:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737617643;
	bh=XyY/nHGMCRKgluV7H4DjTZ0tdLlE+I9C1S/Xn0fqVMk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=uu1X1r25/oaRdnFRroJbYozdkylBYUgKZ5K4CG/lR8faASfSMfldd/HCo2X8zRjSV
	 ar9mvLH3G7+a5iLt0lXZiyB9hvX4GY7RoI+zpNOdhfOe4cNl1H0j5/3qf/Wv4lQvwg
	 bTok6pzuvzg2eZ/2NGBFxjD7MMqy0PGqvKhAVy40=
Message-ID: <f2fdb4d8-c1b3-4671-9a04-7fb325c5fc68@ideasonboard.com>
Date: Thu, 23 Jan 2025 09:35:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] media: rcar-vin: Remove emulated SEQ_{TB,BT}
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/01/2025 18:53, Niklas Söderlund wrote:
> Hello,
> 
> When the driver was converted from soc_camera emulated support for
> V4L2_FIELD_SEQ_TB and V4L2_FIELD_SEQ_BT where added. This was done by
> capturing twice to the same VB2 buffer, but at different offsets.
> 
> This trend out to be a bad idea and the wrong place to try and emulate
> this kind of thing. Further more it is fragile when it comes to things
> like suspend/resume and scaling. Just how fragile it was have been made
> more apparent when more features where added to the driver for things
> the hardware really can do.
> 
> If user-space really want to capture things in a SEQ_{TB,BT} fashion
> this emulation of capturing twice to the same buffer with a different
> offset can be emulated their instead of the kernel, where it always
> should have been.
> 
> This series removes this emulation in patch 1/5 and then proceeds to
> remove a lot of cruft code needed to support it. The primary cleanups in
> patch 2/5 - 4/5 revolve around simplifying the VIN internal state
> tracking from 5 to 2 states needed to support the emulation.
> 
> Finally patch 5/5 removes a hack in the R-Car CSI-2 driver which was
> added to support this emulation, and is no longer needed.
> 
> I have tested this on Gen2, Gen3 and Gen4 without hitting any
> regressions or other issues, other then of course SEQ_{TB,BT} are no
> longer enumerated as output formats.
> 
> For changelog see individual patches.
> 
> Niklas Söderlund (5):
>    media: rcar-vin: Remove emulated SEQ_{TB,BT}
>    media: rcar-vin: Remove superfluous suspended state
>    media: rcar-vin: Remove superfluous starting state
>    media: rcar-vin: Simplify the shutdown process
>    media: rcar-csi2: Remove hack to detect NTSC content
> 
>   drivers/media/platform/renesas/rcar-csi2.c    |   8 +-
>   .../platform/renesas/rcar-vin/rcar-core.c     |   6 +-
>   .../platform/renesas/rcar-vin/rcar-dma.c      | 132 ++++--------------
>   .../platform/renesas/rcar-vin/rcar-v4l2.c     |   7 -
>   .../platform/renesas/rcar-vin/rcar-vin.h      |  40 +-----
>   5 files changed, 33 insertions(+), 160 deletions(-)
> 

I've been testing these with V4H and a GMSL setup, no issues:

Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi


