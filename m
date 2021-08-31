Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 827983FC89B
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 15:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237059AbhHaNp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Aug 2021 09:45:26 -0400
Received: from comms.puri.sm ([159.203.221.185]:59180 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239631AbhHaNpU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Aug 2021 09:45:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id A2892DFE8B;
        Tue, 31 Aug 2021 06:43:55 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wn-BFqgtG8Zf; Tue, 31 Aug 2021 06:43:54 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, pavel@ucw.cz,
        phone-devel@vger.kernel.org, robh@kernel.org, sakari.ailus@iki.fi,
        shawnx.tu@intel.com
Subject: [PATCH v8 0/4] Add support for the Hynix Hi-846 camera
Date:   Tue, 31 Aug 2021 15:43:40 +0200
Message-Id: <20210831134344.1673318-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi,

This series adds support for the SK Hynix Hi-846 CMOS images sensor.
It includes the dt-bindings and the driver.

best wishes,

                              martin

revision history
----------------
v8: (thank you Laurent)
* add fwnode properties support for orientation and rotation on the board
* remove the arm64 defconfig addition patch. deal with that later.

v7: (thank you Sakari)
* move the check for supported nr_lanes for a mode to set_format()
* change get_selection() according to the Sakaris' review
* check for the mipi link frequencies from DT
* check for the external clock rate and add assigned-clock-rates requirement
* https://lore.kernel.org/linux-media/20210712084137.3779628-1-martin.kepplinger@puri.sm/

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


Martin Kepplinger (4):
  dt-bindings: vendor-prefixes: Add SK Hynix Inc.
  dt-bindings: media: document SK Hynix Hi-846 MIPI CSI-2 8M pixel
    sensor
  media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera
  Documentation: i2c-cardlist: add the Hynix hi846 sensor

 .../admin-guide/media/i2c-cardlist.rst        |    1 +
 .../bindings/media/i2c/hynix,hi846.yaml       |  120 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    6 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/hi846.c                     | 2190 +++++++++++++++++
 7 files changed, 2333 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
 create mode 100644 drivers/media/i2c/hi846.c

-- 
2.30.2

