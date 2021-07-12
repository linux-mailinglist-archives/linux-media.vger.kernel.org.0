Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C9A3C586C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 13:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356409AbhGLIrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 04:47:39 -0400
Received: from comms.puri.sm ([159.203.221.185]:50216 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351024AbhGLIpf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 04:45:35 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id AD26AE0318;
        Mon, 12 Jul 2021 01:42:15 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mMw4DvGadQFB; Mon, 12 Jul 2021 01:42:14 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, sakari.ailus@iki.fi,
        krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, paul.kocialkowski@bootlin.com, pavel@ucw.cz,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Subject: [PATCH v7 0/5] Add support for the Hynix Hi-846 camera
Date:   Mon, 12 Jul 2021 10:41:32 +0200
Message-Id: <20210712084137.3779628-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi,

patch 1, 2 and 3 add support for the SK Hynix Hi-846 CMOS images sensor.
It includes the dt-bindings and the driver.

Patches 4 and 5 are optional and don't have to hold patch 1-3 back:
if i2c-cardlist is deprecated, ignore it and act on it appropriately;
and the arm64 defconfig is just convenience for now.

best wishes,

                              martin

revision history
----------------
v7: (thank you Sakari)
* move the check for supported nr_lanes for a mode to set_format()
* change get_selection() according to the Sakaris' review
* check for the mipi link frequencies from DT
* check for the external clock rate and add assigned-clock-rates requirement

v6:
* better digital gain defaults
* lane config fix found by smatch
* fix regulator usage in power_on()
* https://lore.kernel.org/linux-media/20210628101054.828579-1-martin.kepplinger@puri.sm/

v5: (thank you Laurent and Rob)
* minor dt-bindings fixes
* driver: disable lens shading correcting (no seed values yet used from "otp" for that)
* add reviewed-tags
* https://lore.kernel.org/linux-media/20210611101404.2553818-1-martin.kepplinger@puri.sm/

v4: (thank you Laurent, Sakari and Rob) many driver changes, see v3 review for
details. they include:
* add get_selection(), remove open() callback
* use gpiod API
* use regulator_bulk API
* fix power supply timing sequence and bindings
* https://lore.kernel.org/linux-media/20210607105213.1211722-1-martin.kepplinger@puri.sm/

v3: (thank you, Laurent)
* use do_div() for divisions
* reset-gpios DT property name instead of rst-gpios
* improve the dt-bindings
* add the phone-devel list
* https://lore.kernel.org/linux-media/20210531120737.168496-1-martin.kepplinger@puri.sm/

v2:
sent a bit early due to stupid mistakes
* fix build issues
* fix dtschema issues
* add enable for arm64 defconfig
* https://lore.kernel.org/linux-media/20210530212337.GA15366@duo.ucw.cz/T/#t

v1:
* https://lore.kernel.org/linux-media/20210527091221.3335998-1-martin.kepplinger@puri.sm/


Martin Kepplinger (5):
  dt-bindings: vendor-prefixes: Add SK Hynix Inc.
  dt-bindings: media: document SK Hynix Hi-846 MIPI CSI-2 8M pixel
    sensor
  media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera
  Documentation: i2c-cardlist: add the Hynix hi846 sensor
  arm64: defconfig: enable VIDEO_HI846

 .../admin-guide/media/i2c-cardlist.rst        |    1 +
 .../bindings/media/i2c/hynix,hi846.yaml       |  120 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    6 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/hi846.c                     | 2178 +++++++++++++++++
 8 files changed, 2322 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
 create mode 100644 drivers/media/i2c/hi846.c

-- 
2.30.2

