Return-Path: <linux-media+bounces-17322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE31968261
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83D3FB22CC8
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 08:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D6F178388;
	Mon,  2 Sep 2024 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uz6KUopG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE4C1E48A
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 08:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725266985; cv=none; b=LWlQHLOMbjhdTenNrCbMfk9n8cuJw0wVSxSg4xszf7K2UxdOttB5lLPNDlfj+G79KSLIEke1fjd22isQs76vub4k32CEptzWYCzB3U7pQXvYf0TFMiaon+Dqt9htO2EgnO61I+lnS0XYdK/H+3EFFOHXQOXN/HwxUAgaOIdqmOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725266985; c=relaxed/simple;
	bh=UM1XvblcCWqIHDH3ssKb8Gc8JaL2iH0+502cZaeDXSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/PQYhYMYxfU048A+shBsYA38Pip/eWh/LF7d+ArRPHhD/ufPHlXOQjJtX6F0GiNEozBkpL9c6c3yeOR9uwG8Z4Gqpn2Qq6DTR8vN2EgsKmYHY/O4rSm8jmmDZ3Ndn5Wfe7hNs/iHQWYbhvt2At12B0DCimHr+6Qdwcj+aCsIZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uz6KUopG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C81184CE;
	Mon,  2 Sep 2024 10:48:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725266904;
	bh=UM1XvblcCWqIHDH3ssKb8Gc8JaL2iH0+502cZaeDXSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uz6KUopGC4jDN676rKZHGM1sAUVVItu98R3MP6BIbuUIQ9QQDUgyVk2SmCRiNsgHM
	 vJFjTie7lotMc32Zeg7nObwo0aM8AroAbqHGQEJtGWrp0YeofsvYk6lizg+k5M9sq3
	 F1xSOirSTeGMjW8X5B4d44FWyyXlMjME00arWDi0=
Date: Mon, 2 Sep 2024 11:49:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: staging: drop omap4iss
Message-ID: <20240902084903.GA4313@pendragon.ideasonboard.com>
References: <815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Mon, Sep 02, 2024 at 10:42:31AM +0200, Hans Verkuil wrote:
> The omap4 camera driver has seen no progress since forever, and
> now OMAP4 support has also been dropped from u-boot (1). So it is
> time to retire this driver.
> 
> (1): https://lists.denx.de/pipermail/u-boot/2024-July/558846.html
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

RIP OMAP4 ISS.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../admin-guide/media/omap4_camera.rst        |   62 -
>  .../admin-guide/media/v4l-drivers.rst         |    1 -
>  MAINTAINERS                                   |    8 -
>  drivers/staging/media/Kconfig                 |    2 -
>  drivers/staging/media/Makefile                |    1 -
>  drivers/staging/media/omap4iss/Kconfig        |   12 -
>  drivers/staging/media/omap4iss/Makefile       |    9 -
>  drivers/staging/media/omap4iss/TODO           |    3 -
>  drivers/staging/media/omap4iss/iss.c          | 1354 ----------------
>  drivers/staging/media/omap4iss/iss.h          |  247 ---
>  drivers/staging/media/omap4iss/iss_csi2.c     | 1379 -----------------
>  drivers/staging/media/omap4iss/iss_csi2.h     |  155 --
>  drivers/staging/media/omap4iss/iss_csiphy.c   |  277 ----
>  drivers/staging/media/omap4iss/iss_csiphy.h   |   47 -
>  drivers/staging/media/omap4iss/iss_ipipe.c    |  579 -------
>  drivers/staging/media/omap4iss/iss_ipipe.h    |   63 -
>  drivers/staging/media/omap4iss/iss_ipipeif.c  |  844 ----------
>  drivers/staging/media/omap4iss/iss_ipipeif.h  |   89 --
>  drivers/staging/media/omap4iss/iss_regs.h     |  899 -----------
>  drivers/staging/media/omap4iss/iss_resizer.c  |  884 -----------
>  drivers/staging/media/omap4iss/iss_resizer.h  |   72 -
>  drivers/staging/media/omap4iss/iss_video.c    | 1274 ---------------
>  drivers/staging/media/omap4iss/iss_video.h    |  203 ---
>  include/linux/platform_data/media/omap4iss.h  |   66 -
>  24 files changed, 8530 deletions(-)
>  delete mode 100644 Documentation/admin-guide/media/omap4_camera.rst
>  delete mode 100644 drivers/staging/media/omap4iss/Kconfig
>  delete mode 100644 drivers/staging/media/omap4iss/Makefile
>  delete mode 100644 drivers/staging/media/omap4iss/TODO
>  delete mode 100644 drivers/staging/media/omap4iss/iss.c
>  delete mode 100644 drivers/staging/media/omap4iss/iss.h
>  delete mode 100644 drivers/staging/media/omap4iss/iss_csi2.c
>  delete mode 100644 drivers/staging/media/omap4iss/iss_csi2.h
>  delete mode 100644 drivers/staging/media/omap4iss/iss_csiphy.c
>  delete mode 100644 drivers/staging/media/omap4iss/iss_csiphy.h
>  delete mode 100644 drivers/staging/media/omap4iss/iss_ipipe.c
>  delete mode 100644 drivers/staging/media/omap4iss/iss_ipipe.h
>  delete mode 100644 drivers/staging/media/omap4iss/iss_ipipeif.c
>  delete mode 100644 drivers/staging/media/omap4iss/iss_ipipeif.h
>  delete mode 100644 drivers/staging/media/omap4iss/iss_regs.h
>  delete mode 100644 drivers/staging/media/omap4iss/iss_resizer.c
>  delete mode 100644 drivers/staging/media/omap4iss/iss_resizer.h
>  delete mode 100644 drivers/staging/media/omap4iss/iss_video.c
>  delete mode 100644 drivers/staging/media/omap4iss/iss_video.h
>  delete mode 100644 include/linux/platform_data/media/omap4iss.h

[snip]

-- 
Regards,

Laurent Pinchart

