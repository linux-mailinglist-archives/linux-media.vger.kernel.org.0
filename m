Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0CA46D4C31
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 17:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbjDCPlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 11:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbjDCPlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 11:41:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA6026BD
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 08:41:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMIC-0004b4-3b; Mon, 03 Apr 2023 17:40:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI6-008iaO-0i; Mon, 03 Apr 2023 17:40:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI5-00AHwO-5x; Mon, 03 Apr 2023 17:40:17 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Deepak R Varma <drv@mailo.com>,
        Yuan Can <yuancan@huawei.com>,
        Simon Horman <horms@verge.net.au>,
        Sven Van Asbroeck <TheSven73@gmail.com>,
        Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
        Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
        Christian Gromm <christian.gromm@microchip.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Marc Dietrich <marvin24@gmx.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Umang Jain <umang.jain@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Adrien Thierry <athierry@redhat.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Jakob Koschel <jakobkoschel@gmail.com>
Cc:     linux-staging@lists.linux.dev, kernel@pengutronix.de,
        greybus-dev@lists.linaro.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-rpi-kernel@lists.infradead.org
Subject: [PATCH 00/24] staging: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:39:50 +0200
Message-Id: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5012; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=QcqVobs2IGjtDB50UkJ1/XzbU0MSF7u4i5A5EQTdJQg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvM0O0Tc0pjx/M/6GF+i1BCxRCmy/MPnr7RU1 yFBMKjXOfaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzNAAKCRCPgPtYfRL+ Tpy2CACy6x0vU06fdXyxll9SO1keGvUJwPKWx+3c3iql31e1Lm+qBWx4HjLGWAH1BCBwe3626DH lDN1BYh6O1PbPw6fq7eefH5DBIAVGnQSOsyyOFUmo5y3kXQn60JKzxX7xSKuHzUxXXkaj6BYFEl dl3VmQyiYF0+g1PGODFTQSeX9kxjPWoD5g9e11a2P8dLs8Iu1lwVEIyHyEyjcsrYsB3Wj23JY5E t8/rn6+663fTt7WDV/oQ0q40Q54RNHtq2Ou/9xwLL/Jm63tGZ6gAnvbnQcFoAji4hrf+apNVsp/ aW4zaDe6809yWD3o9ofDidHCWNev/88M0ILROQDh07UCEMyG
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

this series adapts the platform drivers below drivers/staging to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver
core doesn't (and cannot) cope for errors during remove. The only effect
of a non-zero return value in .remove() is that the driver core emits a
warning. The device is removed anyhow and an early return from .remove()
usually yields a resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

All drivers in staging already return zero in their remove callback, so
they can be trivially converted.

The changes to the individual drivers are all orthogonal. If I need to
resend some patches because of some review feedback, I'd like to only
send the patches that actually needed changes, so please pick up the
remaining patches that don't need changing to reduce the amount of mail.

Best regards
Uwe

Uwe Kleine-König (24):
  staging: axis-fifo: Convert to platform remove callback returning void
  staging: emxx_udc: Convert to platform remove callback returning void
  staging: fieldbus: arcx-anybus: Convert to platform remove callback
    returning void
  staging: greybus: arche-apb-ctrl: Convert to platform remove callback
    returning void
  staging: greybus: arche: Convert to platform remove callback returning
    void
  staging: media: atmel-sama5d2-isc: Convert to platform remove callback
    returning void
  staging: media: atmel-sama7g5-isc: Convert to platform remove callback
    returning void
  staging: media: imx-media-csi: Convert to platform remove callback
    returning void
  staging: media: imx-media-dev: Convert to platform remove callback
    returning void
  staging: media: imx6-mipi-csi2: Convert to platform remove callback
    returning void
  staging: media: imx8mq-mipi-csi2: Convert to platform remove callback
    returning void
  staging: media: meson: vdec: Convert to platform remove callback
    returning void
  staging: media: omap4iss: Convert to platform remove callback
    returning void
  staging: media: rkvdec: Convert to platform remove callback returning
    void
  staging: media: sunxi: cedrus: Convert to platform remove callback
    returning void
  staging: media: sun6i-isp: Convert to platform remove callback
    returning void
  staging: most: dim2: Convert to platform remove callback returning
    void
  staging: nvec: Convert to platform remove callback returning void
  staging: nvec: nvec_kbd: Convert to platform remove callback returning
    void
  staging: nvec_power: Convert to platform remove callback returning
    void
  staging: nvec_ps2: Convert to platform remove callback returning void
  staging: octeon: ethernet: Convert to platform remove callback
    returning void
  staging: vc04_services: bcm2835-camera: Convert to platform remove
    callback returning void
  staging: vc04_services: vchiq_arm: Convert to platform remove callback
    returning void

 drivers/staging/axis-fifo/axis-fifo.c                       | 6 ++----
 drivers/staging/emxx_udc/emxx_udc.c                         | 6 ++----
 drivers/staging/fieldbus/anybuss/arcx-anybus.c              | 5 ++---
 drivers/staging/greybus/arche-apb-ctrl.c                    | 6 ++----
 drivers/staging/greybus/arche-platform.c                    | 6 ++----
 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c  | 6 ++----
 drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c  | 6 ++----
 drivers/staging/media/imx/imx-media-csi.c                   | 6 ++----
 drivers/staging/media/imx/imx-media-dev.c                   | 6 ++----
 drivers/staging/media/imx/imx6-mipi-csi2.c                  | 6 ++----
 drivers/staging/media/imx/imx8mq-mipi-csi2.c                | 6 ++----
 drivers/staging/media/meson/vdec/vdec.c                     | 6 ++----
 drivers/staging/media/omap4iss/iss.c                        | 6 ++----
 drivers/staging/media/rkvdec/rkvdec.c                       | 5 ++---
 drivers/staging/media/sunxi/cedrus/cedrus.c                 | 6 ++----
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c           | 6 ++----
 drivers/staging/most/dim2/dim2.c                            | 6 ++----
 drivers/staging/nvec/nvec.c                                 | 6 ++----
 drivers/staging/nvec/nvec_kbd.c                             | 6 ++----
 drivers/staging/nvec/nvec_power.c                           | 6 ++----
 drivers/staging/nvec/nvec_ps2.c                             | 6 ++----
 drivers/staging/octeon/ethernet.c                           | 5 ++---
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c   | 6 ++----
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 ++----
 24 files changed, 48 insertions(+), 93 deletions(-)


base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

