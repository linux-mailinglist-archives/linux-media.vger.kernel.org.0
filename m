Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50216192DB8
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 17:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbgCYQEC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 12:04:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:53260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727846AbgCYQEC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 12:04:02 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ECC0D2077D;
        Wed, 25 Mar 2020 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585152241;
        bh=/YZy1j5dX52QBA68q9SViv2y+oiaFKA4xv2QbEhOZA4=;
        h=From:To:Cc:Subject:Date:From;
        b=ClsJ9UYWBbp4Uz4XmfRkQk92n+yf7yV4SxCYgHSBdz2Gh7Th6OlxpUqO2W7f8mo7V
         CPGOZ727NTJiTNbIckIlIOuODwoyzR/WuJelJpvDnv2xK5QMhbfh2GkmVrv1W5SpT5
         3V8zz02wGsvYVpYQuFHE8jvZpGviVt2iGFpo0qH4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH8Va-003MJ8-K9; Wed, 25 Mar 2020 17:03:58 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Chen-Yu Tsai <wens@csie.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-renesas-soc@vger.kernel.org,
        Yong Deng <yong.deng@magewell.com>,
        Kukjin Kim <kgene@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Pavel Machek <pavel@ucw.cz>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Zhi <yong.zhi@intel.com>,
        linux-samsung-soc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heungjun Kim <riverful.kim@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <mripard@kernel.org>, devel@driverdev.osuosl.org,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 0/4]  media Kconfig reorg - part 2
Date:   Wed, 25 Mar 2020 17:03:53 +0100
Message-Id: <cover.1585151701.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

That's the second part of media Kconfig changes. The entire series is
at:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=media-kconfig

It addresses some issues I noticed when reviewing the series, and do
some changes on how things will be displayed.

It also simplify dependencencies on media-controller-dependent drivers,
by auto-selecting the needed deps.

It should be noticed that the media controller may also optionally
selected for several other drivers, so there is still a prompt to allow
manually enabling it, in the case it was not auto-selected.

PS.: While not needed anymore, because all dependent drivers auto
select, at least for now, I opted to keep the prompt for:

- VIDEO_V4L2_SUBDEV_API

  The rationale is that there are a few drivers that can optionally depend
  on it (like tvp5150). So, better to keep the dependency, in order to be
  able to test those drivers with and without the option.

- MEDIA_CONTROLLER_REQUEST_API

  The rationale is that there are some warnings at the Request API, and
  it would be good to keep it, at least while drivers are on staging.

Mauro Carvalho Chehab (4):
  media: dvb-core: Kconfig: default to use dynamic minors
  media: Kconfig files: use select for V4L2 subdevs and MC
  media: i2c/Kconfig: reorganize items there
  media: Kconfig: don't use visible for device type select

 drivers/media/Kconfig                         |  25 +-
 drivers/media/dvb-core/Kconfig                |   1 +
 drivers/media/i2c/Kconfig                     | 406 +++++++++++-------
 drivers/media/i2c/et8ek8/Kconfig              |   4 +-
 drivers/media/i2c/m5mols/Kconfig              |   5 +-
 drivers/media/i2c/smiapp/Kconfig              |   5 +-
 drivers/media/pci/cobalt/Kconfig              |   4 +-
 drivers/media/pci/intel/ipu3/Kconfig          |   4 +-
 drivers/media/pci/sta2x11/Kconfig             |   6 +-
 drivers/media/platform/Kconfig                |  28 +-
 drivers/media/platform/am437x/Kconfig         |   4 +-
 drivers/media/platform/atmel/Kconfig          |   4 +-
 drivers/media/platform/cadence/Kconfig        |   8 +-
 drivers/media/platform/exynos4-is/Kconfig     |   5 +-
 drivers/media/platform/rcar-vin/Kconfig       |   8 +-
 .../media/platform/sunxi/sun4i-csi/Kconfig    |   4 +-
 .../media/platform/sunxi/sun6i-csi/Kconfig    |   4 +-
 drivers/media/platform/xilinx/Kconfig         |   4 +-
 drivers/media/spi/Kconfig                     |   4 +-
 drivers/media/test_drivers/vimc/Kconfig       |   4 +-
 drivers/staging/media/hantro/Kconfig          |   5 +-
 drivers/staging/media/imx/Kconfig             |   5 +-
 drivers/staging/media/ipu3/Kconfig            |   3 +-
 drivers/staging/media/omap4iss/Kconfig        |   4 +-
 drivers/staging/media/rkisp1/Kconfig          |   4 +-
 drivers/staging/media/sunxi/cedrus/Kconfig    |   5 +-
 26 files changed, 349 insertions(+), 214 deletions(-)

-- 
2.25.1


