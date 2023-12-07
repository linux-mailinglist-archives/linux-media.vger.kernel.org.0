Return-Path: <linux-media+bounces-1905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C02B8092ED
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 22:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 936281C20878
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 21:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E8E51C23;
	Thu,  7 Dec 2023 21:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QaNKOo9s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66AC91713
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 13:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701982981; x=1733518981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0j1fnbhtt8O4OEiV3lSGBFRU02Dr3jEm2SvsUHtiGvs=;
  b=QaNKOo9svYkCk7l80QL07Hq/k+Z0NQOlR3ebmMX9XW9pXuWkVFwlVOiP
   WOl2KpsEYFpNlD2XOhypL1vLLh67VvfMWaSTQDw9MvbAzk1GjzQqtqGZY
   7u0rzsNRdyYx5zSg0E5FBL1rvR4z9PsobD96IvEEF9Pxjg+OKruW9vyp4
   SK4uLHSbw8JcCht/19/oXBbrT+yr0MNcahGgJAGCk1NaDcidHWsqSb9W4
   JEDDfcAvluWr02HfWdxaZkP3D6vlkCI0BMOTA/SI+2QvE0O52APiVijey
   2hNUPSa9qzttK1byc1oO2PfwqeGzVdQl0rWgzIMFlVK0xKGclXFEBRNPl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="384703641"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="384703641"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 13:03:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="800866695"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="800866695"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 13:02:58 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D016611FB5E;
	Thu,  7 Dec 2023 23:02:55 +0200 (EET)
Date: Thu, 7 Dec 2023 21:02:55 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: i2c: imx415: Convert to new CCI register
 access helpers
Message-ID: <ZXIy_-BxyiTi63yR@kekkonen.localdomain>
References: <20231205090557.298680-1-alexander.stein@ew.tq-group.com>
 <20231205090557.298680-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205090557.298680-2-alexander.stein@ew.tq-group.com>

Hi Alexander,

Thanks for the patch.

On Tue, Dec 05, 2023 at 10:05:55AM +0100, Alexander Stein wrote:
> Use the new common CCI register access helpers to replace the private
> register access helpers in the imx415 driver.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/i2c/Kconfig  |   2 +
>  drivers/media/i2c/imx415.c | 396 +++++++++++++++----------------------
>  2 files changed, 162 insertions(+), 236 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 59356eded339..71f8128f2df9 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -194,6 +194,8 @@ config VIDEO_IMX412
>  config VIDEO_IMX415
>  	tristate "Sony IMX415 sensor support"
>  	depends on OF_GPIO
> +	select REGMAP_I2C

No need to select REGMAP_I2C---V4L2_CCI_I2C already does it.

> +	select V4L2_CCI_I2C
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX415 camera.

-- 
Regards,

Sakari Ailus

