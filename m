Return-Path: <linux-media+bounces-36405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0540DAEF606
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F4E517A794
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D57D270EBC;
	Tue,  1 Jul 2025 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oeatJp9N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D7B27057D
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367847; cv=none; b=r44to9yHmBMUlEkzbnWr0H0yDxy5LBRf/ZVy5fLyN6Ntjn8XzSrnRKBhJ6aCP5X+U9w57LRGv3tEJw+k9bNQ+wtNez35/Pz8+549A8k1911lsUH1udnqK3uCnnyt2qgGGmjaQHUY9Hf7aAM8vmJXClWsOtcmalzjKElesx2Y94A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367847; c=relaxed/simple;
	bh=ymH2AkFiWIUmWFvALbJr0OAinhK1NlPRxjR2AO+B4wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZb5gVGcj2pqGOeCdKiSwU/gMznnmeqTLQTuImV1153/uZCWw41EeKzkyA7UmDtKD8lQd/hxGteiVjvn3depvgJPTlEuyH99jY9NQhrmQ1yTL0fwGQjqlS9jJ7+lnchbcFb/zzu2XMWEOCeP2zheorXjUQrRWBWgWl5lgFdceTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oeatJp9N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DCD8F78C;
	Tue,  1 Jul 2025 13:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751367819;
	bh=ymH2AkFiWIUmWFvALbJr0OAinhK1NlPRxjR2AO+B4wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oeatJp9NQ7pjoZydftLhIulYr3SRn8AqcMOnjEut9QjyLsa4fCbMQcUpcJhXVil87
	 D8cv6mPvpCS940+JcdKW68Q0W1Wcg3aNWtmNdXWn1GF8SvSDRtLDJMu95vW8xXyDOK
	 2Z8JwCaSfxm2Kbio6C0pkGiakrddxXM3DJte2qAk=
Date: Tue, 1 Jul 2025 14:03:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: sakari.ailus@linux.intel.com, stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com,
	andrzej.hajda@intel.com, benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com, hansg@kernel.org,
	hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com, khalasa@piap.pl, mani@kernel.org,
	m.felsch@pengutronix.de, matthias.fend@emfend.at,
	mchehab@kernel.org, michael.riesch@collabora.com,
	naush@raspberrypi.com, nicholas@rothemail.net,
	nicolas.dufresne@collabora.com, paul.elder@ideasonboard.com,
	dan.scally@ideasonboard.com, pavel@kernel.org, rashanmu@gmail.com,
	ribalda@chromium.org, slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 02/48] Documentation: media: camera-sensor: Mention
 v4l2_devm_sensor_clk_get() for obtaining the clock
Message-ID: <20250701110335.GA28643@pendragon.ideasonboard.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <095af35c322e523aba8ea8f70157077f4196feb5.1750942967.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <095af35c322e523aba8ea8f70157077f4196feb5.1750942967.git.mehdi.djait@linux.intel.com>

On Thu, Jun 26, 2025 at 03:33:53PM +0200, Mehdi Djait wrote:
> Add the new v4l2 helper devm_v4l2_sensor_clk_get() to Documentation. the
> helper works on both DT- and ACPI-based platforms to retrieve a
> reference to the clock producer from firmware.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---
>  .../driver-api/media/camera-sensor.rst        | 24 +++++++++++++------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index c290833165e6..94bd1dae82d5 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -29,21 +29,31 @@ used in the system. Using another frequency may cause harmful effects
>  elsewhere. Therefore only the pre-determined frequencies are configurable by the
>  user.
>  
> +The external clock frequency shall be retrieved by obtaining the external clock
> +using the ``devm_v4l2_sensor_clk_get()`` helper function, and then getting its
> +frequency with ``clk_get_rate()``. Usage of the helper function guarantees
> +correct behaviour regardless of whether the sensor is integrated in a DT-based
> +or ACPI-based system.
> +
>  ACPI
>  ~~~~
>  
> -Read the ``clock-frequency`` _DSD property to denote the frequency. The driver
> -can rely on this frequency being used.
> +ACPI-based systems typically don't register the sensor external clock with the
> +kernel, but specify the external clock frequency in the ``clock-frequency``
> +_DSD property. The ``devm_v4l2_sensor_clk_get()`` helper creates and returns a
> +fixed clock set at that rate.
>  
>  Devicetree
>  ~~~~~~~~~~
>  
> -The preferred way to achieve this is using ``assigned-clocks``,
> -``assigned-clock-parents`` and ``assigned-clock-rates`` properties. See the
> -`clock device tree bindings
> +Devicetree-based systems declare the sensor external clock in the device tree
> +and reference it from the sensor node. The preferred way to select the external
> +clock frequency is to use the ``assigned-clocks``, ``assigned-clock-parents``
> +and ``assigned-clock-rates`` properties in the sensor node to set the clock
> +rate. See the `clock device tree bindings
>  <https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml>`_
> -for more information. The driver then gets the frequency using
> -``clk_get_rate()``.
> +for more information. The ``devm_v4l2_sensor_clk_get()`` helper retrieves and
> +returns that clock.
>  
>  This approach has the drawback that there's no guarantee that the frequency
>  hasn't been modified directly or indirectly by another driver, or supported by

-- 
Regards,

Laurent Pinchart

