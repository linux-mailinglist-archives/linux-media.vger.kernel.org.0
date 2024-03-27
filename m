Return-Path: <linux-media+bounces-8015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C2A88F2B0
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 00:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09D851F291EC
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 23:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4A8153BD6;
	Wed, 27 Mar 2024 23:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="lk1el4ST"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta159.mxroute.com (mail-108-mta159.mxroute.com [136.175.108.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFD2433D8
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 23:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581465; cv=none; b=uLHur0beaXkwNXfQKC8HzyNinWgTjf4U475XdyOqgcZ3nFQ1vzg44pLLrKBp0wjQVSnoOc+OfjLApN7GBhkUuOn7XGRVqnzGAZqGLWj6aGSkAkvoQes9hCQVjPM8+WFHipgTplaBX4xlA1f4beyUdjmBT6QHpy/A9SLAoVp4FxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581465; c=relaxed/simple;
	bh=0AR7aTfvPPDRcyFbqZXD6QN2Qvc8q+gNMHQ9U+KtZds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uolLRLAMehLsAN6TAmyLIrOO1Pe8r1lRLGwrZxLnmMgzMlwQfTK6C6sphSH9xkWvLGMkqhfqBnggU2llVv1F/Tl2fZokGfirTJZBdpPBLA9dX1oRcCXaVMNnVfp8JI7f87fGKu9t/UtzlKd+gCb7KjnjtY7/F8pj+RoiEt71ptQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=lk1el4ST; arc=none smtp.client-ip=136.175.108.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta159.mxroute.com (ZoneMTA) with ESMTPSA id 18e82343b920003bea.010
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Mar 2024 23:17:25 +0000
X-Zone-Loop: 0b52700beb2b94f6f0a5eef982363e988e619c67fcdd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tpB1Ez1g+AZl5woGHDYExbL0oNyju9MoU0QRikUtEQY=; b=lk1el4ST7yqVizfHKbtYV9aJEq
	VN0CnkjuEnrARV9EljdVN4+v08nGOLF1+wD1BBnZJrkyyL6JQlKjunHL97qV/S3EE7jIrybNCX6KZ
	DcSubBiX74/3/amipO1ix0xsqTuKOqStB7NZuLaJB4EyTjTYxyC5zBP1bs6mUN3Su2At+JsXTiR5N
	9C6xMZNs6dhg+I2CBoBrslXy+nSFZ2vXJMsFfncF1TVDuRgRrl/9qiCnSinnMHrxU2leToYZRpj0z
	UuukFjZSmwp8LUeiMh37jXxiu/MW9MXlbLyS15gBcN2PmChPi3DC52bNfLzuu1DMC8FOQlyTMkq5a
	WfNsz8eQ==;
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
	Luigi311 <git@luigi311.com>
Subject: [PATCH 00/23] v2: imx258 improvement series
Date: Wed, 27 Mar 2024 17:16:46 -0600
Message-ID: <20240327231710.53188-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Luigi311 <git@luigi311.com>

Resend due to email message limits being exceeded.

v2 changes:
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

This adds a few more patches and drops one. The long exposure mode patch was
dropped due to the bug that Jacopo found. The powerdown and reset gpio patches
were added as that fixes support for the Pinephone Pro, without them the sensor
doesnt initialize correctly.

Tested on a Pinephone Pro by forcing 24 mhz clock and was able to access all 3
resolutions. The two lower resolutions had some artifacts but that is expected
as more changes are required to fix them for the Pinephone Pro specifically,
kept all registers the same as Dave's original patch since that works on
dedicated imx258 hardware and the artifacts are PPP specific so it shouldnt be
a regression.


v1

This is a set of patches for imx258 that allow it to work with alternate clock
frequencies, over either 2 or 4 lanes, and generally adding flexibility to the
driver.

Tested with an IMX258 module from Soho Enterprises that has a 24MHz oscillator.
Both 2 and 4 lane configurations work with correct link frequencies and pixel
rates.

Jacopo has tested on a PinePhone Pro which has an ~19.2MHz clock fed from the SoC,
He confirms that the two lower resolution modes work, but not the full res mode.
Comparing to the BSP it looks like they have some weird clock configuration in
the 4208x3120 mode (nominally 1224Mb/s/lane instead of 1267).
As it has never previously worked directly with the mainline driver this isn't a
regression but may indicate that there is a need for support of additional link
frequencies in the future.

The last patch that makes HFLIP and VFLIP configurable may be contentious as I've
retained the default configuration of inverted from the original driver. I know
this was discussed recently, but I can't recall the final outcome.

I am relying on someone from Intel testing this out, as correcting the cropping
and supporting flips has changed the Bayer order. Seeing as this is all above
board in V4L2 terms I really hope that the layers above it behave themselves.

Cheers
  Dave


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

Luigi311 (3):
  drivers: media: i2c: imx258: Use macros
  drivers: media: i2c: imx258: Add support for powerdown gpio
  drivers: media: i2c: imx258: Add support for reset gpio

 .../i2c/{imx258.yaml => sony,imx258.yaml}     |   12 +-
 MAINTAINERS                                   |    2 +-
 drivers/media/i2c/imx258.c                    | 1147 +++++++++++------
 3 files changed, 744 insertions(+), 417 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{imx258.yaml => sony,imx258.yaml} (88%)

-- 
2.42.0


