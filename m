Return-Path: <linux-media+bounces-39579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F00F4B22635
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 13:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE8741B615DE
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112B12EE613;
	Tue, 12 Aug 2025 11:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="oVUQhijN"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D29923957D
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754999783; cv=pass; b=Xc+RgWXO/cLPqT5v99C3AAndAdHG/tmmRXkybbT9jI/Z61Vje236cNC7WVV6RegwYVWc5E/yRJR47af5Nb0C+8Jctz17G4MPquz+OMV7oQA5imF0Rs3vz/mhbB4CIXz0DlZBkCtSNBffC49BCVXmtYmVmA0wGjIyUVVSXgWglWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754999783; c=relaxed/simple;
	bh=bgVlrtPEYckxdapg1XeIdt6o3CxgZQwSKdA7RkX3Mpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8pssy6NYRU77MwrLl6PUM6FNE9NWDRLLFNWGQCbrk7FS+MgAaiLBfH4kK6/vWvzRqOXSDdGbDkW8uSWGN5+kYpv3yZBTfA8rjgMYxmss7+dTxBrFM3GA5q08l5po2tbjofEWri0mhUIJCmwnIogkRyF5/ZXlkuE/Iqoc7ro8hU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=oVUQhijN; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4c1VMj2ZzyzyQB;
	Tue, 12 Aug 2025 14:56:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1754999777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=3OIztsPZnslfrSXGEbRrWTnPDeWNgjL4qM0anZ22HpQ=;
	b=oVUQhijNKBFEaobpe6RP73Gaq2FDtQgxGhMQn1pW2P+LzU7KVSMLuGpgUBYn6HJLVYuk8P
	DXmPJcS6gPtgaiVODiFKsggU17yOphwNU0zAleXyvQfimbH61tAok+bsubL8kinjtdN8qP
	a2ubghj4idEgsTpOJlw6L0ZDIRqZHtA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1754999777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=3OIztsPZnslfrSXGEbRrWTnPDeWNgjL4qM0anZ22HpQ=;
	b=vrixmk4R1XndJbXQvkZ3D+5hIFKTDqHvjJoAkFuQa8Gg8AUROKdTlXfSsAwowVx3/JV5xg
	ilHFdKjkVjdvW1WXFbCbuuEgbwd/i5fmDpNu3QiIM6MUztR540TV2jKxWHO20iRlXwjMiL
	JqOGDPhKas6Kuj+69Pp6UCZ+Ie0p4Co=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1754999777; a=rsa-sha256; cv=none;
	b=wyHtqOaIyHop+UfLQIl1XhD31za4U8W3ceFLyJl1Q9wl9YWtfsmn7qjllKY+E0Z5nclnhB
	Y6jPsi7cEWiw/cf8R16ft4Fo8UNGnMsLed/ymEDZjLu6YgixajxfmeM7ol9WiexMwHLnmS
	I3fLDtFTeP7d45A33KlB9uOt5ftp9/w=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C18FC634C93;
	Tue, 12 Aug 2025 14:55:32 +0300 (EEST)
Date: Tue, 12 Aug 2025 11:55:33 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, mehdi.djait@linux.intel.com,
	laurent.pinchart@ideasonboard.com
Subject: [GIT PULL FOR 6.18] V4L2 clock helper
Message-ID: <aJsrtbv16Th9yAEB@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here's the V4L2 clock helper and conversion of drivers to use it, for 6.18.

Please pull.


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/v4l2-clk-helper-6.18

for you to fetch changes up to dee0ecc9eb7ccf7aa6c2e384f6fc8bd7ee252808:

  media: i2c: ov2680: Use the v4l2 helper for obtaining the clock (2025-08-11 13:38:45 +0300)

----------------------------------------------------------------
V4L2 clock helper and driver conversion for 6.18

----------------------------------------------------------------
Mehdi Djait (49):
      media: v4l2-common: Add a helper for obtaining the clock producer
      media: i2c: Kconfig: Ensure a dependency on HAVE_CLK for VIDEO_CAMERA_SENSOR
      Documentation: media: camera-sensor: Mention v4l2_devm_sensor_clk_get() for obtaining the clock
      media: i2c: ar0521: Use the v4l2 helper for obtaining the clock
      media: i2c: et8ek8: Use the v4l2 helper for obtaining the clock
      media: i2c: gc05a2: Use the v4l2 helper for obtaining the clock
      media: i2c: gc08a3: Use the v4l2 helper for obtaining the clock
      media: i2c: gc2145: Use the v4l2 helper for obtaining the clock
      media: i2c: hi846: Use the v4l2 helper for obtaining the clock
      media: i2c: imx214: Use the v4l2 helper for obtaining the clock
      media: i2c: imx219: Use the v4l2 helper for obtaining the clock
      media: i2c: imx283: Use the v4l2 helper for obtaining the clock
      media: i2c: imx290: Use the v4l2 helper for obtaining the clock
      media: i2c: imx296: Use the v4l2 helper for obtaining the clock
      media: i2c: imx334: Use the v4l2 helper for obtaining the clock
      media: i2c: imx335: Use the v4l2 helper for obtaining the clock
      media: i2c: imx412: Use the v4l2 helper for obtaining the clock
      media: i2c: imx415: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9m001: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9m111: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9m114: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9p031: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9t112: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9v032: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9v111: Use the v4l2 helper for obtaining the clock
      media: i2c: ov02a10: Use the v4l2 helper for obtaining the clock
      media: i2c: ov2659: Use the v4l2 helper for obtaining the clock
      media: i2c: ov2685: Use the v4l2 helper for obtaining the clock
      media: i2c: ov5640: Use the v4l2 helper for obtaining the clock
      media: i2c: ov5645: Use the v4l2 helper for obtaining the clock
      media: i2c: ov5647: Use the v4l2 helper for obtaining the clock
      media: i2c: ov5648: Use the v4l2 helper for obtaining the clock
      media: i2c: ov5695: Use the v4l2 helper for obtaining the clock
      media: i2c: ov64a40: Use the v4l2 helper for obtaining the clock
      media: i2c: ov6650: Use the v4l2 helper for obtaining the clock
      media: i2c: ov7740: Use the v4l2 helper for obtaining the clock
      media: i2c: ov8856: Use the v4l2 helper for obtaining the clock
      media: i2c: ov8858: Use the v4l2 helper for obtaining the clock
      media: i2c: ov8865: Use the v4l2 helper for obtaining the clock
      media: i2c: ov9282: Use the v4l2 helper for obtaining the clock
      media: i2c: ov9640: Use the v4l2 helper for obtaining the clock
      media: i2c: ov9650: Use the v4l2 helper for obtaining the clock
      media: i2c: s5c73m3: Use the v4l2 helper for obtaining the clock
      media: i2c: s5k5baf: Use the v4l2 helper for obtaining the clock
      media: i2c: s5k6a3: Use the v4l2 helper for obtaining the clock
      media: i2c: vd55g1: Use the v4l2 helper for obtaining the clock
      media: i2c: vd56g3: Use the v4l2 helper for obtaining the clock
      media: i2c: vgxy61: Use the v4l2 helper for obtaining the clock
      media: i2c: ov2680: Use the v4l2 helper for obtaining the clock

 Documentation/driver-api/media/camera-sensor.rst | 24 +++++++----
 drivers/media/i2c/Kconfig                        |  2 +-
 drivers/media/i2c/ar0521.c                       |  9 ++--
 drivers/media/i2c/et8ek8/et8ek8_driver.c         |  9 ++--
 drivers/media/i2c/gc05a2.c                       |  2 +-
 drivers/media/i2c/gc08a3.c                       |  2 +-
 drivers/media/i2c/gc2145.c                       |  2 +-
 drivers/media/i2c/hi846.c                        | 11 +++--
 drivers/media/i2c/imx214.c                       |  2 +-
 drivers/media/i2c/imx219.c                       |  2 +-
 drivers/media/i2c/imx283.c                       |  5 +--
 drivers/media/i2c/imx290.c                       |  2 +-
 drivers/media/i2c/imx296.c                       |  2 +-
 drivers/media/i2c/imx334.c                       |  2 +-
 drivers/media/i2c/imx335.c                       |  9 ++--
 drivers/media/i2c/imx412.c                       |  9 ++--
 drivers/media/i2c/imx415.c                       |  2 +-
 drivers/media/i2c/mt9m001.c                      |  5 ++-
 drivers/media/i2c/mt9m111.c                      |  5 ++-
 drivers/media/i2c/mt9m114.c                      |  6 +--
 drivers/media/i2c/mt9p031.c                      |  5 ++-
 drivers/media/i2c/mt9t112.c                      | 11 +++--
 drivers/media/i2c/mt9v032.c                      |  5 ++-
 drivers/media/i2c/mt9v111.c                      |  5 ++-
 drivers/media/i2c/ov02a10.c                      |  2 +-
 drivers/media/i2c/ov2659.c                       |  5 ++-
 drivers/media/i2c/ov2680.c                       | 29 +------------
 drivers/media/i2c/ov2685.c                       | 10 ++---
 drivers/media/i2c/ov5640.c                       |  9 ++--
 drivers/media/i2c/ov5645.c                       |  2 +-
 drivers/media/i2c/ov5647.c                       |  9 ++--
 drivers/media/i2c/ov5648.c                       |  6 +--
 drivers/media/i2c/ov5695.c                       | 10 ++---
 drivers/media/i2c/ov64a40.c                      |  2 +-
 drivers/media/i2c/ov6650.c                       | 10 ++---
 drivers/media/i2c/ov7740.c                       | 11 ++---
 drivers/media/i2c/ov8856.c                       | 10 ++---
 drivers/media/i2c/ov8858.c                       |  2 +-
 drivers/media/i2c/ov8865.c                       | 36 +++-------------
 drivers/media/i2c/ov9282.c                       |  9 ++--
 drivers/media/i2c/ov9640.c                       |  5 ++-
 drivers/media/i2c/ov9650.c                       |  5 ++-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c         |  6 ++-
 drivers/media/i2c/s5k5baf.c                      |  2 +-
 drivers/media/i2c/s5k6a3.c                       |  5 ++-
 drivers/media/i2c/vd55g1.c                       |  2 +-
 drivers/media/i2c/vd56g3.c                       |  2 +-
 drivers/media/i2c/vgxy61.c                       | 10 ++---
 drivers/media/v4l2-core/v4l2-common.c            | 52 ++++++++++++++++++++++++
 include/media/v4l2-common.h                      | 27 ++++++++++++
 50 files changed, 224 insertions(+), 192 deletions(-)

-- 
Kind regards,

Sakari Ailus

