Return-Path: <linux-media+bounces-13796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F22C69103E2
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 999C41F21D26
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 12:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA0C1AC24E;
	Thu, 20 Jun 2024 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rGcAW5HN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2539FC0C;
	Thu, 20 Jun 2024 12:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718886240; cv=none; b=PBXhQx4h4/R82i5O8fsmJrjni8ITAHqzL5UJG3tM1e3kdWekmXYZPg/XA7NoPuUL1IvyRYaxplMpNDxg6vcDvqF15iHqB5CsxL68+ghg3i3NBA+wlGQtO9Ia6IsVZOqah+HB0OkgrCoOy+3Adclyn16CdWDLeuNnHy3IrVPsnyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718886240; c=relaxed/simple;
	bh=AW7DaSZCd1KDBTYJ8IgKl9VZdfL5b7uzrNFPFjz+b+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTVSMK/gApoF0PbmbU/mEhuwtaXdJqxQPFbJaLccV2K1m4gS6ZMqWqRmqgifzCPV96J4LWihWX8ZL48TLH+vhes3t6aFm2OeDVir5bKZeBpwngb2UGl1jZT1voxpZjlEYP7aSlGgOsZfpIlCRzWH+7XEOztLv+pw5yeCTkNrZEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rGcAW5HN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E9E6A4C;
	Thu, 20 Jun 2024 14:23:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718886218;
	bh=AW7DaSZCd1KDBTYJ8IgKl9VZdfL5b7uzrNFPFjz+b+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rGcAW5HNlyjJxdodt1YIqfiETn5M6V+KiJGSP6Yc6YtEvllXdtQBm0gJAJ/ctZvPP
	 R3icLqrOcxwczHZ98aumvuFwleohB2HsWeCA+R1O53sF256HtdRMoyiUeGAq7detwF
	 yFSg9ednfR1hjWcJjbQMVTlRNr0V9++tKAiY0SsA=
Date: Thu, 20 Jun 2024 21:23:49 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: i2c: Kconfig: Fix missing firmware upload config
 select
Message-ID: <ZnQfVX5bbmDSsFlK@pyrite.rasen.tech>
References: <20240620102544.1918105-1-kory.maincent@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620102544.1918105-1-kory.maincent@bootlin.com>

On Thu, Jun 20, 2024 at 12:25:43PM +0200, Kory Maincent wrote:
> FW_LOADER config only selects the firmware loader API, but we also need
> the sysfs_upload symbols for firmware_upload_unregister() and
> firmware_upload_register() to function properly.
> 
> Fixes: 7a52ab415b43 ("media: i2c: Add driver for THine THP7312")
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/i2c/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index c6d3ee472d81..742bc665602e 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -679,6 +679,7 @@ config VIDEO_THP7312
>  	tristate "THine THP7312 support"
>  	depends on I2C
>  	select FW_LOADER
> +	select FW_UPLOAD
>  	select MEDIA_CONTROLLER
>  	select V4L2_CCI_I2C
>  	select V4L2_FWNODE
> -- 
> 2.34.1
> 
> 

