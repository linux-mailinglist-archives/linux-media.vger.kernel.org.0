Return-Path: <linux-media+bounces-10542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E88B8CFB
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 17:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A2C22816ED
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 15:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2BF12F5A0;
	Wed,  1 May 2024 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="gB9JxAcj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta224.mxroute.com (mail-108-mta224.mxroute.com [136.175.108.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB3012F59D
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714577403; cv=none; b=fbr4vE6AGcZK9zQiDbyOJc+HFYF+p04buLHOxrErAyRNmTSsL1L2WPUI7JG9JWgi43IWw/iqQLh/kvQ93HT2ZgTLAnSvZjEWFV1JJ4tl63BUD6BuZoKvxSFwp1m1IeiQ3BsIKt4MdA+fL5whbIcAkvu+RM7lDCI4kV3IMN6xJDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714577403; c=relaxed/simple;
	bh=/pRCtSseLzYkCvXz7LcflhT9f5jyHTqpeVpOZcybRX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qEprLpvOx689gtdulSdogkUP4W6jj9oV+YAsLbU6cOz4fBF1cN/UYdhJlo8H6COzRn9cT8zAw4uKwlAaCWEUVhaeJ4zeKIQvFoZfLkyNhYMf21adVCsnQWyXyI6Myvg/6M6ZG/seeT5CFuwjkWXt8RIGaWS2pmK75FLVpy9SKVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=gB9JxAcj; arc=none smtp.client-ip=136.175.108.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta224.mxroute.com (ZoneMTA) with ESMTPSA id 18f34c228370008ca2.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 May 2024 15:24:50 +0000
X-Zone-Loop: 5d5b1ce4487f3f27f96fd9ca65fdb850c57d7de1b92b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9fd1WG4wcM9VhDUCqkT94Cc+eRxvqfQ5BlXSqcGrRWY=; b=gB9JxAcjgsgJGpTreOxML+Glj+
	g4//pBQBOvFdzLV2baYfGNX2hv6xYVPH86yvkkoRdt/emmeNz2OINfVEu/caOcSQSn4448U/g7qrZ
	lp8VO9awzTsz9UepRJ7gPyBUwQ5OzqYjFKbQLUt0RJs8BRtGkaEzjG6cwHDW/2mRRCszEMYCi80jy
	4ikjmUpKZ8ttClAHewrJZopsN5PUIlgYpNpi8rzB5Ffd0m7sxps98tGFtx/lt9eQSlNWVihTbKYwi
	utFfF2M5Jpsw4pu4+vav2tKG6fqALqk+tl9dEl3MQFhuxHPzLHIe3EuJf4g7DE5JUkYI3anQbA8Af
	sS2cCxaw==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v5 00/25] imx258 improvement series
Date: Wed,  1 May 2024 09:24:17 -0600
Message-ID: <20240501152442.1072627-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Luis Garcia <git@luigi311.com>

v5:
  - Changed ownership of a few patches to Ondrej Jirman
  - Implement feedback from Tommy Merciai
    - media: i2c: imx258: Add support for reset gpio
    - media: i2c: imx258: Use v4l2_link_freq_to_bitmap helper
    - media: i2c: imx258: Convert to new CCI register access helpers

v4:
  - Swapped out the use macro patch for a patch that uses the new
    CCI register access helpers per Sakari Ailus
  - Fix order of reset and powerdown gpio before disable regulators
  - Fix formating of all patches
  
  - Implemented feedback from Pavel Machek
    - media: i2c: imx258: Follow normal V4L2 behaviours
    - media: i2c: imx258: Allow configuration of clock
  - Implemented feedback from Sakari Ailus
    - media: i2c: imx258: Add support for powerdown gpio


v3 Luis Garcia

- Add Use v4l2_link_freq_to_bitmap helper patch per Sakari Ailus
- Separate dt-bindings for powerdown per Rob Herring
- Fix dt-bindings for imx258.yaml
- Fix sign offs per Dang Huynh 
- Fix versioning per Conor Dooley and Kieran Bingham
- Use scripts to validate and fix patches
- Implemented feedback from Sakari Ailus
  - media: i2c: imx258: Add support for 24MHz clock
  - media: i2c: imx258: Add support for running on 2 CSI data lanes

- Implemented feedback from Rob Herring
  - dt-bindings: media: imx258: Add alternate compatible strings



v2 Luis Garcia

- Add use macros patch 
- Add support for powerdown gpio patch
- Add support for reset gpio patch
- Dropped Add support for long exposure modes patch
- Implemented feedback from Jacopo Mondi
  - media: i2c: imx258: Add regulator control
  - media: i2c: imx258: Add support for 24MHz clock
  - media: i2c: imx258: Add support for running on 2 CSI data lanes
  - media: i2c: imx258: Add get_selection for pixel array information
  - media: i2c: imx258: Issue reset before starting streaming
  - media: i2c: imx258: Set pixel_rate range to the same as the value
  - dt-bindings: media: imx258: Add alternate compatible strings
  - media: i2c: imx258: Change register settings for variants of the sensor
  - media: i2c: imx258: Make HFLIP and VFLIP controls writable

This adds a few more patches and drops one. The long exposure mode patch
was dropped due to the bug that Jacopo found. The powerdown and reset gpio
patches were added as that fixes support for the Pinephone Pro, without
them the sensor doesn't initialize correctly.

Tested on a Pinephone Pro by forcing 24 mhz clock. The two lower 
resolutions had some artifacts but that is expected as more changes are 
required to fix them for the Pinephone Pro specifically, kept all 
registers the same as Dave's original patch since that works on dedicated
imx258 hardware and the artifacts are PPP specific so it shouldn't 
be a regression.



v1 Dave Stevenson

This is a set of patches for imx258 that allow it to work with alternate
clock frequencies, over either 2 or 4 lanes, and generally adding
flexibility to the driver.

Tested with an IMX258 module from Soho Enterprises that has a 24MHz
oscillator. Both 2 and 4 lane configurations work with correct link
frequencies and pixel rates.

Jacopo has tested on a PinePhone Pro which has an ~19.2MHz clock fed from
the SoC, He confirms that the two lower resolution modes work, but not the
full res mode. Comparing to the BSP it looks like they have some weird
clock configuration in the 4208x3120 mode (nominally 1224Mb/s/lane instead
of 1267). As it has never previously worked directly with the mainline
driver this isn't a regression but may indicate that there is a need for
support of additional link frequencies in the future.

The last patch that makes HFLIP and VFLIP configurable may be contentious
as I've retained the default configuration of inverted from the original
driver. I know this was discussed recently, but I can't recall the final
outcome.

I am relying on someone from Intel testing this out, as correcting the
cropping and supporting flips has changed the Bayer order. Seeing as this
is all above board in V4L2 terms I really hope that the layers above it
behave themselves.

Dave Stevenson (20):
  media: i2c: imx258: Remove unused defines
  media: i2c: imx258: Make image geometry meet sensor requirements
  media: i2c: imx258: Disable digital cropping on binned modes
  media: i2c: imx258: Remove redundant I2C writes.
  media: i2c: imx258: Add regulator control
  media: i2c: imx258: Make V4L2_CID_VBLANK configurable.
  media: i2c: imx258: Split out common registers from the mode based
    ones
  media: i2c: imx258: Add support for 24MHz clock
  media: i2c: imx258: Add support for running on 2 CSI data lanes
  media: i2c: imx258: Follow normal V4L2 behaviours for clipping
    exposure
  media: i2c: imx258: Add get_selection for pixel array information
  media: i2c: imx258: Allow configuration of clock lane behaviour
  media: i2c: imx258: Correct max FRM_LENGTH_LINES value
  media: i2c: imx258: Issue reset before starting streaming
  media: i2c: imx258: Set pixel_rate range to the same as the value
  media: i2c: imx258: Support faster pixel rate on binned modes
  dt-bindings: media: imx258: Rename to include vendor prefix
  dt-bindings: media: imx258: Add alternate compatible strings
  media: i2c: imx258: Change register settings for variants of the
    sensor
  media: i2c: imx258: Make HFLIP and VFLIP controls writable

Luis Garcia (2):
  media: i2c: imx258: Use v4l2_link_freq_to_bitmap helper
  media: i2c: imx258: Convert to new CCI register access helpers

Ondrej Jirman (3):
  dt-bindings: media: imx258: Add binding for powerdown-gpio
  media: i2c: imx258: Add support for powerdown gpio
  media: i2c: imx258: Add support for reset gpio

 .../i2c/{imx258.yaml => sony,imx258.yaml}     |   15 +-
 MAINTAINERS                                   |    2 +-
 drivers/media/i2c/Kconfig                     |    1 +
 drivers/media/i2c/imx258.c                    | 1451 ++++++++++-------
 4 files changed, 850 insertions(+), 619 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{imx258.yaml => sony,imx258.yaml} (86%)

-- 
2.44.0


