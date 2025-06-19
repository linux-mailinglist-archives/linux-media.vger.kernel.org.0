Return-Path: <linux-media+bounces-35443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA8AE0F18
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 23:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8831A1892DF1
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 21:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051C6230BE4;
	Thu, 19 Jun 2025 21:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KQ/2cDXK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD4F30E85D;
	Thu, 19 Jun 2025 21:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750369648; cv=none; b=TrSGkmuNNYqlmBZFbiH43DhmjEBeMVvt4DJW7ypxqLVD9t+rEiiECmrSjXwGxDRfM+tm0LKok9Lo1gqXvFF818LEfunvKePcYhJBDHUTMGHiEfhabTY6bSZE7BgTbQzdGyA0hXrN8Hi7keWBQ5OriANiQ6e7utaltl10WYcLJ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750369648; c=relaxed/simple;
	bh=m4oDBPzsVwFn306XKjJaQFlsPXy8FWKdTSj8uorHUCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hea1zL12okgFFOcOev2pG1N6q0w7P0qZ5rtYFABV/KOJEN8droVAv/NwaiEs2pkvaprygqTMnEYTld629klTxzkRzBAqIOiKdMdQ541H568e2ymWBvDlVzyHueaMcxmUliQQDVANmmzKdRO7VVZlX6h+54PCsFbLVinHgqzjgb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KQ/2cDXK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9873725;
	Thu, 19 Jun 2025 23:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750369629;
	bh=m4oDBPzsVwFn306XKjJaQFlsPXy8FWKdTSj8uorHUCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQ/2cDXKWujuFsgJFOvr4ZmThNJOzuYAcScgYISt4y6sX8M5M2eYTw3+2JaSqGWBE
	 rLfBOMJ+Oi6IHHr8TUBS4qvqTFI0Rm8txd25WN1/m3Y8Gfj/Pvb5HWqPEJflp5Nitu
	 n6iGLW7sLhkRpxjUK2E9euaW7i3JCPQzNZblIaHo=
Date: Fri, 20 Jun 2025 00:47:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: sakari.ailus@linux.intel.com, akinobu.mita@gmail.com,
	stanislaw.gruszka@linux.intel.com, hdegoede@redhat.com,
	arnd@arndb.de, alain.volmat@foss.st.com, andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com,
	hansg@kernel.org, hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com,
	jonas@kwiboo.se, kieran.bingham@ideasonboard.com, khalasa@piap.pl,
	prabhakar.csengg@gmail.com, mani@kernel.org,
	m.felsch@pengutronix.de, martink@posteo.de, mattwmajewski@gmail.com,
	matthias.fend@emfend.at, mchehab@kernel.org,
	michael.riesch@collabora.com, naush@raspberrypi.com,
	nicholas@rothemail.net, nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com, dan.scally@ideasonboard.com,
	pavel@kernel.org, petrcvekcz@gmail.com, rashanmu@gmail.com,
	ribalda@chromium.org, rmfrfs@gmail.com, zhengsq@rock-chips.com,
	slongerbeam@gmail.com, sylvain.petinot@foss.st.com,
	s.nawrocki@samsung.com, tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 02/55] Documentation: media: camera-sensor: Mention
 v4l2_devm_sensor_clk_get() for obtaining the clock
Message-ID: <20250619214705.GR22102@pendragon.ideasonboard.com>
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
 <1261f41358da597fb9900b7880618ebcc392160d.1750352394.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1261f41358da597fb9900b7880618ebcc392160d.1750352394.git.mehdi.djait@linux.intel.com>

Hi Mehdi,

Thank you for the patch.

On Thu, Jun 19, 2025 at 07:58:55PM +0200, Mehdi Djait wrote:
> Add the new v4l2 helper devm_v4l2_sensor_clk_get() to Documentation. the
> helper works on both DT- and ACPI-based platforms to retrieve a
> reference to the clock producer from firmware.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index c290833165e6..c82c018a5f40 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -32,7 +32,8 @@ user.
>  ACPI
>  ~~~~
>  
> -Read the ``clock-frequency`` _DSD property to denote the frequency. The driver
> +Use ``devm_v4l2_sensor_clk_get()`` to get the clock. The function will read the
> +``clock-frequency`` _DSD property to denote the frequency. The driver
>  can rely on this frequency being used.

This isn't specific to ACPI anymore. I think the documentation should be
refactored further. Here's a proposal.


Handling clocks
---------------

Camera sensors have an internal clock tree including a PLL and a number of
divisors. The clock tree is generally configured by the driver based on a few
input parameters that are specific to the hardware: the external clock frequency
and the link frequency. The two parameters generally are specified by system
firmware. **No other frequencies should be used in any circumstances.**

The reason why the clock frequencies are so important is that the system is
usually designed to use specific external clock and link frequencies to ensure
electro-magnetic compatibility. Using other frequencies may cause harmful
effects elsewhere. Therefore only the pre-determined frequencies are
configurable by the user.

The external clock frequency shall be retrieved by obtaining the external clock
using the ``devm_v4l2_sensor_clk_get()`` helper function, and then getting its
frequency with ``clk_get_rate()``. Usage of the helper function guarantees
correct behaviour regardless of whether the sensor is integrated in a DT-based
or ACPI-based system.

ACPI
~~~~

ACPI-based systems typically don't register the sensor external clock with the
kernel, but specify the external clock frequency in the ``clock-frequency``
_DSD property. The ``devm_v4l2_sensor_clk_get()`` helper creates and returns a
fixed clock set at that rate.

Devicetree
~~~~~~~~~~

Devicetree-based systems declare the sensor external clock in the device tree
and reference it from the sensor node. The preferred way to select the external
clock frequency is to use the ``assigned-clocks``, ``assigned-clock-parents``
and ``assigned-clock-rates`` properties in the sensor node to set the clock
rate. See the `clock device tree bindings
<https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml>`_
for more information. The ``devm_v4l2_sensor_clk_get()`` helper retrieves and
returns that clock.

This approach has the drawback that there's no guarantee that the frequency
hasn't been modified directly or indirectly by another driver, or supported by
the board's clock tree to begin with. Changes to the Common Clock Framework API
are required to ensure reliability.


>  
>  Devicetree

-- 
Regards,

Laurent Pinchart

