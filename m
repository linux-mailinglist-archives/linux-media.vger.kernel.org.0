Return-Path: <linux-media+bounces-42909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1774B8F69B
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 10:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69308175B7F
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 08:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC12C2FD1B2;
	Mon, 22 Sep 2025 08:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jVy1UK05"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DFD2472A5;
	Mon, 22 Sep 2025 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528617; cv=none; b=GQTa3/HBYrcgj1wWPVZxQy+XJitenh9V0mqRUtv6upQBLCHO2L1HBD15vpPMnfXBDLEATHhY2xLxV692FFzbtpXFahF1gNSsaIBXvDATDBRxalM3DFMSnPgvdke9uHAa1L1a9Zox9WS+cS79BGff4mNTLY3ZTwSfTl8LOJLJxNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528617; c=relaxed/simple;
	bh=18f5YMsjYZt/JpwSvP2ZKdCGT3Fnxm5o02Bv+/atmq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MY8LocXVp8qRGnhy9a/5tgHX+9EfIHt+d2oVkV/mhnzpLmZsaXvyzQwj0T0kS5RuIKTtDQHFVftWhg91H3TmHm1B4mWB3G93+CtV84exZDm4+Sq1BQW2dxNDqt2pVwk/s4KdAIn+RXf2ekmwqcTdnezM5uda9D7NvhtbEXvOdfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jVy1UK05; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9F127F89;
	Mon, 22 Sep 2025 10:08:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758528530;
	bh=18f5YMsjYZt/JpwSvP2ZKdCGT3Fnxm5o02Bv+/atmq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jVy1UK05TYd2fa94+IeDgPM1EOXE0rfftB6gdSDd0BrAR2UCLtWeCZ6GUmL1c9HYS
	 6fBBr7CnlWx/EL+J16yScsAC6xdqG6Qd41aCIQC3AJtwimqY7RWP4qAT6VmdO9cm0B
	 gnj/P35YRjLORqT9Fsz8sX66rUrgX4DmXSrah2/Q=
Date: Mon, 22 Sep 2025 11:09:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] media: imx-mipi-csis: Get number of active lanes
 via mbus_config
Message-ID: <20250922080935.GJ10540@pendragon.ideasonboard.com>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
 <20250915-mbus-config-active-lanes-v3-3-97a1282a410b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250915-mbus-config-active-lanes-v3-3-97a1282a410b@ideasonboard.com>

Hi Isaac,

Thank you for the patch.

On Mon, Sep 15, 2025 at 02:18:35PM +0100, Isaac Scott wrote:
> The number of lanes actively used by a MIPI CSI transmitter may differ
> from that which is defined in device tree. As such, call on
> v4l2_get_active_data_lanes() to check if the driver reports a
> differing number of lanes to device tree, and use that number of active
> lanes.

It would be useful to explain there that the difference would be caused
by the source using less data lanes than the number of connected lanes
on the board.

> If the number of active data lanes is invalid, or the op is not
> supported, use the number of lanes defined in device tree.

Is this still true ?

> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 6afbedfe131e..d3424ad54b4e 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -967,6 +967,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>  	csis_fmt = find_csis_format(format->code);
>  
> +	csis->num_data_lanes = v4l2_get_active_data_lanes(csis->source.pad,
> +							  csis->bus.num_data_lanes);
> +

If the function returns an error you'll have a problem.

>  	ret = mipi_csis_calculate_params(csis, csis_fmt);
>  	if (ret < 0)
>  		goto err_unlock;

-- 
Regards,

Laurent Pinchart

