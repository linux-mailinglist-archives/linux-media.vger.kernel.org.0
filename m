Return-Path: <linux-media+bounces-36522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4B0AF1023
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD9B652081F
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 09:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7844A24A064;
	Wed,  2 Jul 2025 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OaQRH80s"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF392472B5;
	Wed,  2 Jul 2025 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449114; cv=none; b=UBtEDYnEf2Eji78G5JS4A+GgFND/egdZDX9SGr/ndtD0HJC2aFnGvCDucCIF30VGloX1WRw1/x2n/to61QFJEGZgJ65RO+dAIPnMKWcMs8HxcjEDGxbW6lWnqiW30KBrhgYzJIV2roz034WSSgWhk7a1SvLiIymAD7ZqF/baXLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449114; c=relaxed/simple;
	bh=DGKrttRsQr4Iev/uBW1PHry4ekiuQTspS65d9746Hfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxF6osuBjd7aOoerHPS1qCtox6aJETJQRYnPXaHZaioMrgOc0oXSoMjcLhADAAyhgHaTlDcVnqfrIFSJGtoM0FiWSV33zjFc1nbRyHbUftDkQ3b4jmwv7mLeo4W163C7QU6Cf1mT9yeHP8NcF8J/jeiEEd9ZHHkp0g8o7W/eoRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OaQRH80s; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 966C4E91;
	Wed,  2 Jul 2025 11:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751449088;
	bh=DGKrttRsQr4Iev/uBW1PHry4ekiuQTspS65d9746Hfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OaQRH80s6vm2oaq0DfRpQ8cCRCiwGUiKn9uTbKfY2N5A5lVPkpUNu2d23a80gt6kj
	 ZNipU0xVGKEARmwGwLxQve3e93XgPhXPlqa4QG1qZ0GEyo+pcKGpKPDLEGG1Z9DQTT
	 JGHs9kaLxL5FYJyPWFLq6nEjQDFhfcGOBwG1hLd0=
Date: Wed, 2 Jul 2025 12:38:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 5/7] media: nxp: add DesignWare MIPI CSI2 controller
 driver
Message-ID: <20250702093806.GF16835@pendragon.ideasonboard.com>
References: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
 <20250701-95_cam-v1-5-c5172bab387b@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701-95_cam-v1-5-c5172bab387b@nxp.com>

Hi Frank,

Thank you for the patch.

On Tue, Jul 01, 2025 at 06:06:10PM -0400, Frank Li wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Add V4L2 subdev driver for DesignWare MIPI CSI2 controller.

This seems to be at least the third instance of a driver for the CSI-2
receiver, the first two being
drivers/media/platform/raspberrypi/rp1-cfe/dphy.c and the second one
drivers/media/platform/renesas/rcar-csi2.c (the latter seems to support
multiple CSI-2 receivers). drivers/staging/media/imx/imx6-mipi-csi2.c
seem related too, likely for an old version of the IP.

Could we please try to avoid code duplication ?

> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  MAINTAINERS                                |    1 +
>  drivers/media/platform/nxp/Kconfig         |   11 +
>  drivers/media/platform/nxp/Makefile        |    1 +
>  drivers/media/platform/nxp/dwc-mipi-csi2.c | 1675 ++++++++++++++++++++++++++++

This should go to drivers/media/platform/synopsys/

>  4 files changed, 1688 insertions(+)

[snip]

-- 
Regards,

Laurent Pinchart

