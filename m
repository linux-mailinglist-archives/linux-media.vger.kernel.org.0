Return-Path: <linux-media+bounces-39132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD7B1EC57
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 17:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA81A3AF89D
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 15:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9F7285068;
	Fri,  8 Aug 2025 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JgFSxP5u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE0E27FD5D;
	Fri,  8 Aug 2025 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754668162; cv=none; b=g77DNfOL5zQRYw0RuTiNHtqVjjXlcPG5g8dB2nCYie2tqmPG6dn83P2xULR6Le92sBLqmn0DfzrB25movTfZ6CkUKpNmVhpMkbO3yQ0KZet8nSvUOCqftNY6aKRK7bMvuOzQ3vy4zRucOXqqraKL61LPcSQKFP3k+tH4Q/RvVNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754668162; c=relaxed/simple;
	bh=pIQ6vU9w4UeLwbTT6Kv7fzi6LGvzo6PScYYE6GGKNHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QECY9oIsAg3ju77n2OGufI9ZtagL/SogX7nJa0QrinPjSFCRCjIb5jeNBvGgJN15LNBNOJX57ta69F94KYDIEL7OOSDRBrD1SjtVKSLDbktdi1YvMB0N8I+K8l0I7GAR4Aa5NxCZ9nHpQ5K9u0gF+WecX3Ap8N7li5sQ4U2PgfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JgFSxP5u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 735471920;
	Fri,  8 Aug 2025 17:48:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754668108;
	bh=pIQ6vU9w4UeLwbTT6Kv7fzi6LGvzo6PScYYE6GGKNHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgFSxP5u0D5a7n575+BtZgqmGSG/DS7CroG5hZjniD9UY5xdum3+cwmoKt7/AnutS
	 51hMn7kk9za5whdbDm2R6wxCcKcQ5W7vbVb+xOonf4tYuYdJAROac2qMx3A+dbHFBJ
	 zOSj8waUlLUV7Y3hjZy7qULUfEZx+ljUNucDQets=
Date: Fri, 8 Aug 2025 18:49:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux@treblig.org
Cc: arnd@arndb.de, lee@kernel.org, mchehab@kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	linux-media@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Remove the wl1273 FM Radio
Message-ID: <20250808154903.GB23187@pendragon.ideasonboard.com>
References: <20250625133258.78133-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625133258.78133-1-linux@treblig.org>

On Wed, Jun 25, 2025 at 02:32:54PM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> I noticed that the wl1273 radio had an unused symbol, but then noticed
> it is on Arnd's unused driver list:
>   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> 
> So, delete it.
> The components seem pretty separable, except for Kconfig dependencies.
> 
> That lore URL is over 75 chars, which checkpatch warns about,
> suggestions welcome.
> 
> Dave
> 
> Dr. David Alan Gilbert (4):
>   media: radio-wl1273: Remove
>   ASoC: wl1273: Remove
>   mfd: wl1273-core: Remove
>   mfd: wl1273-core: Remove the header

Mark, Lee, how would you like this to be merged ? I have a large patch
series targetting v6.18 that depends on 1/4, and I would like to merge
it in the media tree as soon as possible after -rc1 gets released.
Patches 1/4, 2/4 and 3/4 are independent of each other, but patch 4/4
depends on the first three. Can we merge 1/4 in the media tree and
provide a stable branch right on top of -rc1 ?

>  .../admin-guide/media/radio-cardlist.rst      |    1 -
>  drivers/media/radio/Kconfig                   |   17 -
>  drivers/media/radio/Makefile                  |    1 -
>  drivers/media/radio/radio-wl1273.c            | 2159 -----------------
>  drivers/mfd/Kconfig                           |   10 -
>  drivers/mfd/Makefile                          |    1 -
>  drivers/mfd/wl1273-core.c                     |  262 --
>  include/linux/mfd/wl1273-core.h               |  277 ---
>  sound/soc/codecs/Kconfig                      |    4 -
>  sound/soc/codecs/Makefile                     |    4 +-
>  sound/soc/codecs/wl1273.c                     |  500 ----
>  sound/soc/codecs/wl1273.h                     |   16 -
>  12 files changed, 1 insertion(+), 3251 deletions(-)
>  delete mode 100644 drivers/media/radio/radio-wl1273.c
>  delete mode 100644 drivers/mfd/wl1273-core.c
>  delete mode 100644 include/linux/mfd/wl1273-core.h
>  delete mode 100644 sound/soc/codecs/wl1273.c
>  delete mode 100644 sound/soc/codecs/wl1273.h

-- 
Regards,

Laurent Pinchart

