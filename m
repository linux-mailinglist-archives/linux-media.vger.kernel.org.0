Return-Path: <linux-media+bounces-60395-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHmxOJzK+WmFEAMAu9opvQ
	(envelope-from <linux-media+bounces-60395-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 12:46:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB8D4CBC42
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 12:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C8AF304A889
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 10:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22222D8DC3;
	Tue,  5 May 2026 10:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cwz9iEZJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4A319871;
	Tue,  5 May 2026 10:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976948; cv=none; b=cIEAuox9KM5Bu+VpgsttfXVKyPCGAAghDwRx0JUt8Ea4cNH0qmIcwkp5YhIaL7YPL9TFI0WBC1TAR97TWt3FOr3Mg+itdxzcQWtm7Ds8N/J13cEOP7UDCDQ9qZc9+FhK8p0hBzjxYE9X+373aDVlyg3dWptF6uIaPUR0K01U3VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976948; c=relaxed/simple;
	bh=cxGWlzlELOhdabZ340UknooccM2YL8sXPTlYRnoEU8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCa2Y4u035fi7q/A1CQpBWqiz1M5BjqnCOUHwdROoF+KX8nb+M4pL8AXIMaxbThEZgJyi1cfV5K749H6axImRUYPiNw15b3k+J8amPJKeGopfX2M5bVx/EJ8J0CMSLrOzVvqlkfvSgTAWnnvMhEzSl7CL7e+jauazYUUQ2xEhyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cwz9iEZJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7955BC71;
	Tue,  5 May 2026 12:29:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777976941;
	bh=cxGWlzlELOhdabZ340UknooccM2YL8sXPTlYRnoEU8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwz9iEZJN3op+x+2Wyvus7lCeQBOeM9H89qe42QQoS6IAE/aj5XMRbHalgz27WHyF
	 uAyZbZ7ajF9LtuJa3baOV6TzM0hrJMxtJ46ymJxRNVeQErCtnJkHlDlxOg5P7QYIBr
	 6hTE3/xtIWSjR64Cd/0q0+wParWra8byoLB/GMOY=
Date: Tue, 5 May 2026 13:29:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>, devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [RFC PATCH v3 0/2] media: i2c: Add onsemi AR0234 camera sensor
 driver
Message-ID: <20260505102902.GC1547435@killaraus.ideasonboard.com>
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
X-Rspamd-Queue-Id: ECB8D4CBC42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60395-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,raspberrypi.com,intel.com,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]

On Fri, Mar 06, 2026 at 01:36:12PM +0300, Alexander Shiyan wrote:
> This series adds a driver for the onsemi AR0234 CMOS image sensor.
> The AR0234 is a 1/2.6-inch global-shutter sensor with a 1940x1220
> pixel array, capable of 1920x1200 resolution at up to 120 fps.
> It supports MIPI CSI-2 output with 1 to 4 data lanes, raw Bayer
> (8/10-bit) and monochrome formats, as well as DPCM 10->8 compression.
> 
> The driver has been tested with 2 and 4 lanes on an ARM64 Rockchip
> RK3568 platform with a 27 MHz external clock. Both 8-bit and 10-bit
> raw Bayer modes are functional.
> 
> Notes:
> - 1-lane mode is currently disabled; attempts to use it produced no
>   valid image. Further investigation is needed.

That's a fair limitation for the time being.

> - The driver uses a private streaming flag to protect cropping changes
>   during streaming. Is this the recommended approach, or should we
>   rely solely on the subdev state?

Is there a reason not to use v4l2_subdev_is_streaming() ?

> - The DPCM (10->8 compression) mode is included in the code but could
>   not be tested due to lack of suitable hardware; any testing help
>   would be appreciated.

The only upstream drivers that implement DPCM support are omap3isp and
atomisp. It will be difficult to get hold of a hardware setup that
include an AR0234 :-(

> Changes since v2:
> - Added devicetree binding documentation for the onsemi AR0234 sensor.
> - Added support for 8-bit raw Bayer output (verified working).
> - Added DPCM 10->8 compression mode (untested, included for
>   completeness).
> - Reworked mode handling: each mode now specifies input/output bpp,
>   DPCM flag, MIPI data type, and link frequency index.
> - Reworked link frequency handling: the driver now accepts any valid
>   link frequencies from the device tree. It expects two frequencies -
>   one for 8-bit mode and one for 10-bit mode - but does not enforce
>   a fixed set; frequencies are validated by attempting PLL calculation.
>   This makes the driver compatible with a wider range of system
>   configurations.
> - Updated ar0234_calculate_pll() to use a temporary structure and
>   update cached PLL only on success.
> 
> Changes since v1:
> - Improved error handling: use cci_write() with &ret chaining for
>   sequential register writes, as suggested by Isaac Scott.
> - Refactored format and cropping support:
>   Replaced static format list with dynamic cropping rectangle
>   (struct v4l2_rect crop).
>   Implemented get_selection and set_selection for V4L2_SEL_TGT_CROP,
>   allowing runtime selection of the active sensor area.
> - Migrated to modern streaming model: replaced s_stream with
>   enable_streams/disable_streams using v4l2_subdev_s_stream_helper.
> - Corrected blanking constants: replaced ambiguous AR0234_HBLANK_DEF
>   with AR0234_LINE_LENGTH_PCK_MIN; updated min/max ranges.
> - Added ACPI match table (untested).
> - Style fixes.
> 
> Any further comments or test results would be greatly appreciated.
> 
> Alexander Shiyan (2):
>   dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding
>   media: i2c: Add onsemi AR0234 image sensor driver
> 
>  .../bindings/media/i2c/onnn,ar0234.yaml       |  109 ++
>  drivers/media/i2c/Kconfig                     |   12 +
>  drivers/media/i2c/Makefile                    |    1 +
>  drivers/media/i2c/ar0234.c                    | 1309 +++++++++++++++++
>  4 files changed, 1431 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
>  create mode 100644 drivers/media/i2c/ar0234.c

-- 
Regards,

Laurent Pinchart

