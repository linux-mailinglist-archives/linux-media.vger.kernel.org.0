Return-Path: <linux-media+bounces-3304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F59F826BE2
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 11:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBC88B21C86
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 10:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299F813FFC;
	Mon,  8 Jan 2024 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XdBsa7a9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0278425757
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 10:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B04A7524;
	Mon,  8 Jan 2024 11:51:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704711089;
	bh=CxJ5cKxSmEEtfTeS+pySe0Ks99FC4ct6GthkJ9lw9A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XdBsa7a9jxdFvgTTaSOWYislA8PW7UGwPeAYvUXwJ0Fc7W1ljtZz2+vZoPmAKfC84
	 AlwpA74jhY8+tIdf1jsRlIxlQV5PTsjbPI5A8Cs0JwlZZBvrmL5CJKr20vNdH9Ycwd
	 7bKYs45Un8ro9YKT8cO8gjqKuSm7v4ZAvAL3gyeY=
Date: Mon, 8 Jan 2024 12:52:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: imx415: Add more clock configurations
Message-ID: <20240108105242.GC20868@pendragon.ideasonboard.com>
References: <20231212072637.67642-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231212072637.67642-1-alexander.stein@ew.tq-group.com>

On Tue, Dec 12, 2023 at 08:26:35AM +0100, Alexander Stein wrote:
> Hi,
> 
> this small series converts the driver to using CCI helpers.
> On top of that more clock setups are added to the driver.
> These are all taken from the datasheet. I suspect they all can be calculated
> dynamically later on.
> Tested on TQMa8MPxL + MBa8MPxL + ISP + Vision Components IMX415 camera.
> 
> While working on the driver I notived that imx415 sets mbus code to
> MEDIA_BUS_FMT_SGBRG10_1X10, while imx290 uses MEDIA_BUS_FMT_SRGGB10_1X10.
> But the datasheets show the same color coding pattern. But both settings seem
> to be correct, e.g. the resulting image has correct colors.

The difference may be in the crop settings, of possibly flipping.

> I had to remove the identity check locally. I suspect that Vision Components
> interjects reading some registers.

:-(

I'm getting increasingly annoyed by vendors who play such tricks.

> Changes in v2:
> * Removed explicit selection of REGMAP_I2C
> * Dropped patch 3 for now. Mode selection shall be done by dynamic VMAX/HMAX
>   calculations later on
> 
> Best regards,
> Alexander
> 
> Alexander Stein (2):
>   media: i2c: imx415: Convert to new CCI register access helpers
>   media: i2c: imx415: Add more clock configurations
> 
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/imx415.c | 651 +++++++++++++++++++++++--------------
>  2 files changed, 416 insertions(+), 236 deletions(-)

-- 
Regards,

Laurent Pinchart

