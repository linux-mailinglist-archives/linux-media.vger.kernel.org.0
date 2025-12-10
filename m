Return-Path: <linux-media+bounces-48513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEF6CB17B4
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8C06302146F
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6869C192D97;
	Wed, 10 Dec 2025 00:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ad/EjSEv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3711990C7;
	Wed, 10 Dec 2025 00:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765326383; cv=none; b=IuZI+UsG2GvMwUQwHKEdyFtE+qKwZJwRUsuJsALlvQ9kDny6/LCZNhrh9V7sMEjo0g5r4KqAkb/Z3zeiuH5Yod8o80BXW/o36AhZEvyej3WLVfxGWVb8qrZJJXEW3Jul5NmS27WBeF7S5Xi/uewCvRmjpHWYY0HEXWijjIH4qoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765326383; c=relaxed/simple;
	bh=msSANicIl1BxlqNglf91NsQFXO72611zls0DNZxGl04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJh1LaO1cvvehyIM1FTptwFs/DgYE92lMoUWlLupURgUl5q+WVQzqOYJ1vIIjxLrFF+vYgmaLggFRQ/rR/QdqUnIo/K7+L8g9PCaFAnAlTAUK6Ya8jxBj5gsqCBV9DGLxgPrAZIG9YoqwrQY0pGsqC9lX4D2BTvsW4YWpXZ2BHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ad/EjSEv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD05C4CEF5;
	Wed, 10 Dec 2025 00:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765326382;
	bh=msSANicIl1BxlqNglf91NsQFXO72611zls0DNZxGl04=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ad/EjSEvQ0mpBLS0iAyFvgXq/ukXtLhzCUtPVqmqhujsZNhItso7p0QBZsGmYGUS4
	 X0K2ylMZvM13S3SJ8b+j5BlyvtJFJ13v74qm6OqEuc11zqRYhlNFYhMGizY5mn0/Ej
	 xv4c1v2lphG5PSxPKo+zZasCo0FjO1++drbm4g8sqb9PTsRsOxOvXtp0YkZGDib2nM
	 LANHB11X6D9sNSjuyt4K0URbxNTovNH9KhQNPeuJOgpwpWjN5O2krPAzGfLJTdRwcH
	 WphPMgcIyzsWSo+yUM9lmK8r1ZW8Pp4Pif6ndOMdlTTivtVn1xjCGnLWiFd9cTJU27
	 EPnJ697fYBxVw==
Message-ID: <a3050a55-5831-421d-bc92-e1cc4470fe7b@kernel.org>
Date: Wed, 10 Dec 2025 00:26:15 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] media: ipu-bridge: Add DMI quirk for Dell XPS laptops
 with upside down sensors
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 linux-media@vger.kernel.org, stable@vger.kernel.org
References: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
 <1Us6sqLjM0IJE_S07NfMH2tUvbrEpDZRSOuDlMUphEsyvBIGo5AXiobdPuBAVsNp-38ajw4OQtNGVJrpsZSD0w==@protonmail.internalid>
 <20251209160621.6854-5-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251209160621.6854-5-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/12/2025 16:06, Hans de Goede wrote:
> The Dell XPS 13 9350 and XPS 16 9640 both have an upside-down mounted
> OV02C10 sensor. This rotation of 180° is reported in neither the SSDB nor
> the _PLD for the sensor (both report a rotation of 0°).
> 
> Add a DMI quirk mechanism for upside-down sensors and add 2 initial entries
> to the DMI quirk list for these 2 laptops.
> 
> Note the OV02C10 driver was originally developed on a XPS 16 9640 which
> resulted in inverted vflip + hflip settings making it look like the sensor
> was upright on the XPS 16 9640 and upside down elsewhere this has been
> fixed in commit 69fe27173396 ("media: ov02c10: Fix default vertical flip").
> This makes this commit a regression fix since now the video is upside down
> on these Dell XPS models where it was not before.

Nasty.

> 
> Fixes: 69fe27173396 ("media: ov02c10: Fix default vertical flip")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/media/pci/intel/ipu-bridge.c | 29 ++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 58ea01d40c0d..6463b2a47d78 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -5,6 +5,7 @@
>   #include <acpi/acpi_bus.h>
>   #include <linux/cleanup.h>
>   #include <linux/device.h>
> +#include <linux/dmi.h>
>   #include <linux/i2c.h>
>   #include <linux/mei_cl_bus.h>
>   #include <linux/platform_device.h>
> @@ -99,6 +100,28 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>   	IPU_SENSOR_CONFIG("XMCC0003", 1, 321468000),
>   };
> 
> +/*
> + * DMI matches for laptops which have their sensor mounted upside-down
> + * without reporting a rotation of 180° in neither the SSDB nor the _PLD.
> + */
> +static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 13 9350"),
> +		},
> +		.driver_data = "OVTI02C1",
> +	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 16 9640"),
> +		},
> +		.driver_data = "OVTI02C1",
> +	},
> +	{} /* Terminating entry */
> +};
> +
>   static const struct ipu_property_names prop_names = {
>   	.clock_frequency = "clock-frequency",
>   	.rotation = "rotation",
> @@ -249,6 +272,12 @@ static int ipu_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
>   static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
>   				     struct ipu_sensor_ssdb *ssdb)
>   {
> +	const struct dmi_system_id *dmi_id;
> +
> +	dmi_id = dmi_first_match(upside_down_sensor_dmi_ids);
> +	if (dmi_id && acpi_dev_hid_match(adev, dmi_id->driver_data))
> +		return 180;
> +
>   	switch (ssdb->degree) {
>   	case IPU_SENSOR_ROTATION_NORMAL:
>   		return 0;
> --
> 2.52.0
> 

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

