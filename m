Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66271BCED7
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 23:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgD1VgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 17:36:09 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:60941 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgD1VgJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 17:36:09 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N0FE1-1jIE0M3Npv-00xHPb; Tue, 28 Apr 2020 23:35:53 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maxime Ripard <mripard@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: add missing v4l2 dependencies
Date:   Tue, 28 Apr 2020 23:35:37 +0200
Message-Id: <20200428213552.3538767-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iocJEcgLvReQSOfV5oCNDw3ndfKYeCb9qcL1xqElP+KWoh87nHl
 TRguru1TSsOAPOLE2gJItg5HqVXfWdB34vz+QYeE/AquNBsdLBvqDhTM4tR1HwJ6Ya5dmSQ
 W5EZP5EZteLSemlbW3BOQ1GD9fcg2vkZ69ExSMwMyk97/IX36Iu+TPzodMXjIRNsBqrc6oj
 RBqkDjWqusHIabZrbb5jg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bEiWZKhOr88=:zHmMbDt3VJvx7hVB6ZJSDI
 9EcqcsjKsfFNOQAXOy2LXH/l+NzQZlpnB5Uw/FNoD4jwe/7a6Y3FCsPuYYs7fLPwdo03R/bWF
 7+uZ8lMhPxwpsTlYjGN0/mLBqRwimm8lwWq7LIMPVuRp1LoYuouy/O8zx8TxW4/Sb3eQ4EmSO
 gH1TjlV/fE/7wkCuTk0BkEYy/+iCwikpwbpLM0eyy7LCaPFq2Ay+3KJkxsZttkYXLZkCJpbGT
 Xe/1tcg02MwkVwl2YYUNAdWTjnPLtrgSidYU2xXi9240EuUQ8oReL3sMsskmjzioE3kBZFUL+
 k6VlbuI2bbBl4hi/zrC7DSpHO6WVbSaFNP0CZgxRvOk8mV7GYOl6q+HY1argLsbWbZcMpH1ri
 bhg87YBia4GK3pw4YZaufw/IP4oXNTc5xQwZ+sw/8g9t/D5TZb/jtca7+tR4hNlEPzpvGwmhA
 93nPPQcPimThaiSbt5CgR5ku0r1jS4Yz9jTXLBwflGgRsoL6YydoV8NFIFVK3eoksxBq0A4Ak
 7k6rvkwWZb7AtC2soP5BR4PNdHbXgbAifF0/dS8JPnJkNLq/Ga4q9tZvzxDgO2e7e3ViVcNZm
 cC/UjzoemHepc95bMf3UC+CALsgVUQdzAi+6tDawg4baP1Ru2G8Tr0fp7aoD0Q1VifwGtOXPf
 YK1lNJju8kiQVZBh0ahRM/GnV8Q89/I/hVxbtKInzHg5o4xbzI6GLfXI3uOPMTky+7u5v6mrp
 1hf2yY1KofC9gsIhw6Yzsv1shMF4Vppts/g33JWpuPyCwtW+jA/XvXn974O/jn6lowglxQCXS
 3xc5q+IhS4kvx3Xtftbs0dxev53/h6YrGWehJs/U2kk/7MTlrI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A few Kconfig warnings showed up recently, pointing to missing
CONFIG_VIDEO_V4L2 dependencies, e.g.:

WARNING: unmet direct dependencies detected for DVB_RTL2832_SDR
  Depends on [n]: MEDIA_SUPPORT [=y] && MEDIA_DIGITAL_TV_SUPPORT [=y] && DVB_CORE [=y] && I2C [=y] && I2C_MUX [=y] && VIDEO_V4L2 [=n] && MEDIA_SDR_SUPPORT [=y] && USB [=y]
  Selected by [y]:
  - DVB_USB_RTL28XXU [=y] && USB [=y] && MEDIA_SUPPORT [=y] && MEDIA_USB_SUPPORT [=y] && I2C [=y] && MEDIA_DIGITAL_TV_SUPPORT [=y] && DVB_USB_V2 [=y] && I2C_MUX [=y] && MEDIA_SUBDRV_AUTOSELECT [=y] && MEDIA_SDR_SUPPORT [=y]

WARNING: unmet direct dependencies detected for MEDIA_TUNER_FC2580
  Depends on [n]: (MEDIA_ANALOG_TV_SUPPORT [=y] || MEDIA_DIGITAL_TV_SUPPORT [=y] || MEDIA_RADIO_SUPPORT [=y] || MEDIA_SDR_SUPPORT [=y]) && MEDIA_SUPPORT [=y] && I2C [=y] && VIDEO_V4L2 [=n]
  Selected by [y]:
  - DVB_USB_AF9035 [=y] && USB [=y] && MEDIA_SUPPORT [=y] && MEDIA_USB_SUPPORT [=y] && I2C [=y] && MEDIA_DIGITAL_TV_SUPPORT [=y] && DVB_USB_V2 [=y] && MEDIA_SUBDRV_AUTOSELECT [=y]

WARNING: unmet direct dependencies detected for VIDEO_OV7670
  Depends on [n]: MEDIA_SUPPORT [=y] && I2C [=y] && VIDEO_V4L2 [=n]
  Selected by [y]:
  - VIDEO_VIA_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_PLATFORM_DRIVERS [=y] && FB_VIA [=y]

Some of these apparently stem from a recently added dependency
in the tuner drivers, but I don't know where the VIDEO_VIA_CAMERA
warning got added.

Fixes: 4bdbff4da405 ("media: tuners: Kconfig: add some missing VIDEO_V4L2 dependencies")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I'm not completely convinced the previous patch (4bdbff4da405) was
going in the right direction, it's possible that we should instead
revert that and fix the other problem in a different way.
---
 drivers/media/platform/Kconfig       | 1 +
 drivers/media/usb/dvb-usb-v2/Kconfig | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index b1ac9c6c9cdb..994ecd71da8a 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -15,6 +15,7 @@ source "drivers/media/platform/marvell-ccic/Kconfig"
 config VIDEO_VIA_CAMERA
 	tristate "VIAFB camera controller support"
 	depends on FB_VIA
+	depends on VIDEO_V4L2 # for VIDEO_OV7670
 	select VIDEOBUF2_DMA_SG
 	select VIDEO_OV7670
 	help
diff --git a/drivers/media/usb/dvb-usb-v2/Kconfig b/drivers/media/usb/dvb-usb-v2/Kconfig
index ff0ae64424c4..0b48b4af38ba 100644
--- a/drivers/media/usb/dvb-usb-v2/Kconfig
+++ b/drivers/media/usb/dvb-usb-v2/Kconfig
@@ -33,6 +33,7 @@ config DVB_USB_AF9015
 config DVB_USB_AF9035
 	tristate "Afatech AF9035 DVB-T USB2.0 support"
 	depends on DVB_USB_V2
+	depends on VIDEO_V4L2 # for MEDIA_TUNER_*
 	select DVB_AF9033
 	select MEDIA_TUNER_TUA9001 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_FC0011 if MEDIA_SUBDRV_AUTOSELECT
@@ -132,6 +133,7 @@ config DVB_USB_MXL111SF
 config DVB_USB_RTL28XXU
 	tristate "Realtek RTL28xxU DVB USB support"
 	depends on DVB_USB_V2 && I2C_MUX
+	depends on VIDEO_V4L2 # for MEDIA_TUNER_*
 	select DVB_MN88472 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_MN88473 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_CXD2841ER if MEDIA_SUBDRV_AUTOSELECT
-- 
2.26.0

