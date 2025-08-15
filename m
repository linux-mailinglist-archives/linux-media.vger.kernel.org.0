Return-Path: <linux-media+bounces-39946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91380B278BA
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 08:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCC4E1C88220
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 06:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818EA218AAA;
	Fri, 15 Aug 2025 06:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Obr7DREU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF121ADA3
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 06:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755237625; cv=none; b=TZW469/bimGJFfTzLMRJygcn53I0f0nYVyMSeFVnqZOMs6xkawHbo/InC7GOgProHXn0a6ZcSotlhwi8VIn4ZHK/aMEMS13g3FSbh10ntoNkKAFtbOWB3VxBxE4cgOlKlJn2VGUlO1yoFlYRySZKrTl8LI5TKreRQ+AgFIRpUUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755237625; c=relaxed/simple;
	bh=smynzTqr6I5P9uZQxu34mgJdXqdYmlQj5m05zEclwdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRpAKCUeESFtkNzGaJ0+otKhHW1gwJ7B9/LK3J8lLJ9tC5XZOJs7mIYbw2cZwzRqOrrl1rNvrrZ3jE51kNVdMMLwShbpR3PGT3NApMpni6cAy9ZR2QD/Q1kl8Sb0vyWf5UJLqsXmchip4mTCzZGNSqolBOzs9LhtsPxx4eOkzgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Obr7DREU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755237623; x=1786773623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=smynzTqr6I5P9uZQxu34mgJdXqdYmlQj5m05zEclwdE=;
  b=Obr7DREUVG4wtoyKwwUI+3p+vIdChuERe+kObVGVVvvt2ZjQ2Oq2Tt2M
   /gOBEA1EdJ86f+F9uZqqqM4wQ7k688BVO8YtTBnyZnPZaoG3cbGR9Ox58
   jwisp+Vp+MWmCau6sLNEVS9UNhb6q1prMNgdeu2+vB6odgsBTjG1YsOfl
   ILhqk7jNcR+JEzAu89L+8WkgwSjRXzxBzBNsCkjX3q3gTlsj97VG+LAyL
   GRz8SGkiFn5vxma02C7GlD0sU6yQof3S/ZtHMK7KwpW0Vz2ZXQWHIP48w
   fyugWryHYS3xusmXTuxLPYeHTYuStMn5nCMgkfn4bIdvXhAJxN+Rg38pZ
   A==;
X-CSE-ConnectionGUID: KZ/EPQpSSpib1nhZ2UM1Ng==
X-CSE-MsgGUID: kyd7R1Z+TduvPymiV6Ranw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68167251"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68167251"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 23:00:20 -0700
X-CSE-ConnectionGUID: vI+u1/KST02IlU9WzxegxQ==
X-CSE-MsgGUID: bxApSLr9R92EddcoF+KeXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="167298298"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.6])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 23:00:14 -0700
Date: Fri, 15 Aug 2025 08:00:06 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com, 
	andrzej.hajda@intel.com, benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com, 
	hansg@kernel.org, jacopo.mondi@ideasonboard.com, kieran.bingham@ideasonboard.com, 
	khalasa@piap.pl, mani@kernel.org, m.felsch@pengutronix.de, 
	matthias.fend@emfend.at, mchehab@kernel.org, michael.riesch@collabora.com, 
	naush@raspberrypi.com, nicholas@rothemail.net, nicolas.dufresne@collabora.com, 
	paul.elder@ideasonboard.com, dan.scally@ideasonboard.com, pavel@kernel.org, 
	rashanmu@gmail.com, ribalda@chromium.org, slongerbeam@gmail.com, 
	tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/1] media: v4l2-common: Improve
 devm_v4l2_sensor_clk_get() documentation
Message-ID: <p34vy7ioby56z7qmfvhyqmbyrln2fpy2djsmv5a5ergwks7ppr@h2kurip4uouo>
References: <46b76530-023f-4f36-bec3-1d3ab79c682c@kernel.org>
 <20250814135007.273084-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814135007.273084-1-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch!

On Thu, Aug 14, 2025 at 04:50:07PM +0300, Sakari Ailus wrote:
> Remove the extra leading period and provide more elaborate explanation for
> why devm_v4l2_sensor_clk_get() is only allowed to be used on camera sensor
> devices.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-common.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 9d6c236e8f14..39dd0c78d70f 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -623,7 +623,7 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  
>  /**
>   * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
> - *	for a camera sensor.
> + *	for a camera sensor
>   *
>   * @dev: device for v4l2 sensor clock "consumer"
>   * @id: clock consumer ID
> @@ -643,6 +643,14 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>   *
>   * In this case try to set the clock-frequency value to the provided clock.
>   *
> + * As the name indicates, this function may only be used on camera sensor
> + * devices. This is because generally only camera sensors do need a clock to
> + * query the frequency from, due to the requirement to configure the PLL for a
> + * given CSI-2 interface frequency where the sensor's external clock frequency
> + * is a factor. Additionally, the clock frequency tends to be available on ACPI
> + * firmware based systems for camera sensors specifically (if e.g. DisCo for
> + * Imaging compliant).
> + *

I don't know about the last sentence about ACPI. Does it help explain
why this helper is intended only for camera sensors ?

--
Kind Regards
Mehdi Djait

