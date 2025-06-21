Return-Path: <linux-media+bounces-35529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 353FBAE2972
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 16:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93DE23B29E5
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 14:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B570614A0B7;
	Sat, 21 Jun 2025 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="q0ziNUwC"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AF1134A8;
	Sat, 21 Jun 2025 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750516129; cv=none; b=SpA9pecp/BwPXE3/dZxv3TuJxMtc5k1E1Jjg0KCTqv8vDg0rkXBYc7Uld5Oywn7+WzMe/13kjjYqnJeXtBgjS/I3RRpxPvC6CBCLn+9WToqa72IXI76nzXXPJVxKF4enw+xWNrVbTVH+kSKJ8yo/dtvq2cPbvnrCNCozdt7o3OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750516129; c=relaxed/simple;
	bh=9VEdWgiOa9Te4oS7C2NDS9c3/iJUTKeIGL//sSuVztg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LjAhBqCUdt9EFPnGs5V1vSGLwCc6tih9WhSTtqjYyMONa5BYhooah96EhBlDsWG6k4TNTSeT2kCGVv8TEiM7s3qwNlEnfLco7qmV1WekYpvXiHaUyLys9evyRfVqVKkepGD7rLV6q0ngG7gDEBq2evrJpwEF7e85/fCK8G3Q69U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=q0ziNUwC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750516124;
	bh=9VEdWgiOa9Te4oS7C2NDS9c3/iJUTKeIGL//sSuVztg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q0ziNUwCMgy+tnv2vowuL2jAFDm39ylCV50cwn4UCbJfSDD9rDHylPVAcqz2mjdHQ
	 VinEysNAUirFPVMpRXy4H7rpJN7VJScfnYUZVHlwFIH8infU8TNKnU5SUnNj5kr2fR
	 gq9P/ErKRZZchq88XEGYxUvB82A5H8NfytDcBICzhaWYaKl1E4uTMQP2HGTY529JCM
	 NiHcx96EEINCCMiHr4UYms0BxV/04PpkLQ5sQXBl9TJw7kJ5gnNM43foQWuqix4PUF
	 CeePDRLCHzacEZW82qQC62EifhlkAB5DJjO8aRM8tokDJA92cDM+L7tyqMtxPN8GRP
	 m2AkNr/uLkSJQ==
Received: from [10.40.0.100] (185-251-200-162.lampert.tv [185.251.200.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3309117E090D;
	Sat, 21 Jun 2025 16:28:43 +0200 (CEST)
Message-ID: <f629be75-4019-4e5c-abcc-45dc8b7e1a8f@collabora.com>
Date: Sat, 21 Jun 2025 16:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/55] media: Add a helper for obtaining the clock
 producer
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com
Cc: akinobu.mita@gmail.com, stanislaw.gruszka@linux.intel.com,
 hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com,
 andrzej.hajda@intel.com, benjamin.mugnier@foss.st.com,
 dave.stevenson@raspberrypi.com, hansg@kernel.org, hverkuil@xs4all.nl,
 jacopo.mondi@ideasonboard.com, jonas@kwiboo.se,
 kieran.bingham@ideasonboard.com, khalasa@piap.pl,
 prabhakar.csengg@gmail.com, mani@kernel.org, m.felsch@pengutronix.de,
 martink@posteo.de, mattwmajewski@gmail.com, matthias.fend@emfend.at,
 mchehab@kernel.org, naush@raspberrypi.com, nicholas@rothemail.net,
 nicolas.dufresne@collabora.com, paul.elder@ideasonboard.com,
 dan.scally@ideasonboard.com, pavel@kernel.org, petrcvekcz@gmail.com,
 rashanmu@gmail.com, ribalda@chromium.org, rmfrfs@gmail.com,
 zhengsq@rock-chips.com, slongerbeam@gmail.com, sylvain.petinot@foss.st.com,
 s.nawrocki@samsung.com, tomi.valkeinen@ideasonboard.com,
 umang.jain@ideasonboard.com, zhi.mao@mediatek.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <cover.1750352394.git.mehdi.djait@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi,

Thanks for your work!

On 6/19/25 19:58, Mehdi Djait wrote:
> Hello everyone,
> 
> Here is my v1 for the new helper v4l2_devm_sensor_clk_get()
> 
> Any testing of the patches is GREATLY APPRECIATED! Especially the two
> drivers with the special ACPI case:
> 1) OV8865
> 2) OV2680
> 
> 
> Background
> ----------
> 
> A reference to the clock producer is not available to the kernel
> in ACPI-based platforms but the sensor drivers still need them.
> 
> devm_clk_get() will return an error and the probe function will fail.
> 
> 
> Solution
> --------
> 
> Introduce a generic helper for v4l2 sensor drivers on both DT- and ACPI-based
> platforms.

Out of curiosity: How is this problem specific to V4L2? Does one need a
similar helper in other subsystems?

Best regards,
Michael

> 
> This helper behaves the same as clk_get_optional() except where there is
> no clock producer like in ACPI-based platforms.
> 
> For ACPI-based platforms the function will read the "clock-frequency"
> ACPI _DSD property and register a fixed frequency clock with the frequency
> indicated in the property.
> 
> 
> Solution for special ACPI case
> ------------------------------
> 
> This function also handles the special ACPI-based system case where:
> 
> 1) The clock-frequency _DSD property is present.
> 2) A reference to the clock producer is present, where the clock is provided
> by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> 
> In this case try to set the clock-frequency value to the provided clock.
> 
> 
> RFC History
> -----------
> 
> RFC v4 -> RFC v5:
> Suggested by Arnd Bergmann:
> 	- removed IS_REACHABLE(CONFIG_COMMON_CLK). IS_REACHABLE() is actually
> 	discouraged [1]. COFIG_COMMON_CLK is a bool, so IS_ENABLED() will be the
> 	right solution here
> Suggested by Hans de Goede:
> 	- added handling for the special ACPI-based system case, where
> 	  both a reference to the clock-provider and the _DSD
> 	  clock-frequency are present.
> 	- updated the function's kernel-doc and the commit msg
> 	  to mention this special case.
> Link RFC v4: https://lore.kernel.org/linux-media/20250321130329.342236-1-mehdi.djait@linux.intel.com/
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/Documentation/kbuild/kconfig-language.rst?h=next-20250513&id=700bd25bd4f47a0f4e02e0a25dde05f1a6b16eea
> 
> RFC v3 -> RFC v4:
> Suggested by Laurent:
> 	- removed the #ifdef to use IS_REACHABLE(CONFIG_COMMON_CLK)
> 	- changed to kasprintf() to allocate the clk name when id is NULL and
> 	  used the __free(kfree) scope-based cleanup helper when
> 	  defining the variable to hold the allocated name
> Link v3: https://lore.kernel.org/linux-media/20250321093814.18159-1-mehdi.djait@linux.intel.com/
> 
> RFC v2 -> RFC v3:
> - Added #ifdef CONFIG_COMMON_CLK for the ACPI case
> Link v2: https://lore.kernel.org/linux-media/20250310122305.209534-1-mehdi.djait@linux.intel.com/
> 
> RFC v1 -> RFC v2:
> Suggested by Sakari:
>     - removed clk_name
>     - removed the IS_ERR() check
>     - improved the kernel-doc comment and commit msg
> Link v1: https://lore.kernel.org/linux-media/20250227092643.113939-1-mehdi.djait@linux.intel.com
> 
> Mehdi Djait (55):
>   media: v4l2-common: Add a helper for obtaining the clock producer
>   Documentation: media: camera-sensor: Mention
>     v4l2_devm_sensor_clk_get() for obtaining the clock
>   media: i2c: ar0521: Use the v4l2 helper for obtaining the clock
>   media: i2c: ds90ub913: Use the v4l2 helper for obtaining the clock
>   media: i2c: ds90ub960: Use the v4l2 helper for obtaining the clock
>   media: i2c: et8ek8: Use the v4l2 helper for obtaining the clock
>   media: i2c: gc05a2: Use the v4l2 helper for obtaining the clock
>   media: i2c: gc08a3: Use the v4l2 helper for obtaining the clock
>   media: i2c: gc2145: Use the v4l2 helper for obtaining the clock
>   media: i2c: hi846: Use the v4l2 helper for obtaining the clock
>   media: i2c: imx214: Use the v4l2 helper for obtaining the clock
>   media: i2c: imx219: Use the v4l2 helper for obtaining the clock
>   media: i2c: imx283: Use the v4l2 helper for obtaining the clock
>   media: i2c: imx290: Use the v4l2 helper for obtaining the clock
>   media: i2c: imx296: Use the v4l2 helper for obtaining the clock
>   media: i2c: imx334: Use the v4l2 helper for obtaining the clock
>   media: i2c: imx335: Use the v4l2 helper for obtaining the clock
>   media: i2c: imx412: Use the v4l2 helper for obtaining the clock
>   media: i2c: imx415: Use the v4l2 helper for obtaining the clock
>   media: i2c: max2175: Use the v4l2 helper for obtaining the clock
>   media: i2c: mt9m001: Use the v4l2 helper for obtaining the clock
>   media: i2c: mt9m111: Use the v4l2 helper for obtaining the clock
>   media: i2c: mt9m114: Use the v4l2 helper for obtaining the clock
>   media: i2c: mt9p031: Use the v4l2 helper for obtaining the clock
>   media: i2c: mt9t112: Use the v4l2 helper for obtaining the clock
>   media: i2c: mt9v032: Use the v4l2 helper for obtaining the clock
>   media: i2c: mt9v111: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov02a10: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov2659: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov2685: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov5640: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov5645: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov5647: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov5648: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov5695: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov64a40: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov6650: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov7740: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov8856: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov8858: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov8865: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov9282: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov9640: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov9650: Use the v4l2 helper for obtaining the clock
>   media: i2c: s5c73m3: Use the v4l2 helper for obtaining the clock
>   media: i2c: s5k5baf: Use the v4l2 helper for obtaining the clock
>   media: i2c: s5k6a3: Use the v4l2 helper for obtaining the clock
>   media: i2c: st-mipid02: Use the v4l2 helper for obtaining the clock
>   media: i2c: tc358743: Use the v4l2 helper for obtaining the clock
>   media: i2c: tc358746: Use the v4l2 helper for obtaining the clock
>   media: i2c: thp7312: Use the v4l2 helper for obtaining the clock
>   media: i2c: vd55g1: Use the v4l2 helper for obtaining the clock
>   media: i2c: vd56g3: Use the v4l2 helper for obtaining the clock
>   media: i2c: vgxy61: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov2680: Use the v4l2 helper for obtaining the clock
> 
>  .../driver-api/media/camera-sensor.rst        |  3 +-
>  drivers/media/i2c/ar0521.c                    |  2 +-
>  drivers/media/i2c/ds90ub913.c                 |  2 +-
>  drivers/media/i2c/ds90ub960.c                 |  2 +-
>  drivers/media/i2c/et8ek8/et8ek8_driver.c      |  2 +-
>  drivers/media/i2c/gc05a2.c                    |  2 +-
>  drivers/media/i2c/gc08a3.c                    |  2 +-
>  drivers/media/i2c/gc2145.c                    |  2 +-
>  drivers/media/i2c/hi846.c                     |  2 +-
>  drivers/media/i2c/imx214.c                    |  2 +-
>  drivers/media/i2c/imx219.c                    |  2 +-
>  drivers/media/i2c/imx283.c                    |  2 +-
>  drivers/media/i2c/imx290.c                    |  2 +-
>  drivers/media/i2c/imx296.c                    |  2 +-
>  drivers/media/i2c/imx334.c                    |  2 +-
>  drivers/media/i2c/imx335.c                    |  2 +-
>  drivers/media/i2c/imx412.c                    |  2 +-
>  drivers/media/i2c/imx415.c                    |  2 +-
>  drivers/media/i2c/max2175.c                   |  2 +-
>  drivers/media/i2c/mt9m001.c                   |  2 +-
>  drivers/media/i2c/mt9m111.c                   |  2 +-
>  drivers/media/i2c/mt9m114.c                   |  2 +-
>  drivers/media/i2c/mt9p031.c                   |  2 +-
>  drivers/media/i2c/mt9t112.c                   |  2 +-
>  drivers/media/i2c/mt9v032.c                   |  2 +-
>  drivers/media/i2c/mt9v111.c                   |  2 +-
>  drivers/media/i2c/ov02a10.c                   |  2 +-
>  drivers/media/i2c/ov2659.c                    |  2 +-
>  drivers/media/i2c/ov2680.c                    | 27 +++-------
>  drivers/media/i2c/ov2685.c                    |  2 +-
>  drivers/media/i2c/ov5640.c                    |  2 +-
>  drivers/media/i2c/ov5645.c                    |  2 +-
>  drivers/media/i2c/ov5647.c                    |  2 +-
>  drivers/media/i2c/ov5648.c                    |  2 +-
>  drivers/media/i2c/ov5695.c                    |  2 +-
>  drivers/media/i2c/ov64a40.c                   |  2 +-
>  drivers/media/i2c/ov6650.c                    |  2 +-
>  drivers/media/i2c/ov7740.c                    |  2 +-
>  drivers/media/i2c/ov8856.c                    |  2 +-
>  drivers/media/i2c/ov8858.c                    |  2 +-
>  drivers/media/i2c/ov8865.c                    | 32 ++----------
>  drivers/media/i2c/ov9282.c                    |  2 +-
>  drivers/media/i2c/ov9640.c                    |  2 +-
>  drivers/media/i2c/ov9650.c                    |  2 +-
>  drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  2 +-
>  drivers/media/i2c/s5k5baf.c                   |  2 +-
>  drivers/media/i2c/s5k6a3.c                    |  2 +-
>  drivers/media/i2c/st-mipid02.c                |  2 +-
>  drivers/media/i2c/tc358743.c                  |  2 +-
>  drivers/media/i2c/tc358746.c                  |  2 +-
>  drivers/media/i2c/thp7312.c                   |  2 +-
>  drivers/media/i2c/vd55g1.c                    |  2 +-
>  drivers/media/i2c/vd56g3.c                    |  2 +-
>  drivers/media/i2c/vgxy61.c                    |  2 +-
>  drivers/media/v4l2-core/v4l2-common.c         | 49 +++++++++++++++++++
>  include/media/v4l2-common.h                   | 25 ++++++++++
>  56 files changed, 136 insertions(+), 102 deletions(-)
> 


