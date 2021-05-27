Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8F2392A4F
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 11:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235660AbhE0JOs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 05:14:48 -0400
Received: from comms.puri.sm ([159.203.221.185]:57980 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230111AbhE0JOr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 05:14:47 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 5C2CEE2060;
        Thu, 27 May 2021 02:12:45 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9KSI5XCGNRDg; Thu, 27 May 2021 02:12:44 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com
Cc:     kernel@puri.sm, paul.kocialkowski@bootlin.com, shawnx.tu@intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 0/4] Add support for the Hynix Hi-846 camera
Date:   Thu, 27 May 2021 11:12:17 +0200
Message-Id: <20210527091221.3335998-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi,

This patchset add support for the SK Hynix Hi-846 CMOS images sensor.
It includes documentation, dt-bindings and the driver.

best wishes,

                              martin


Martin Kepplinger (4):
  dt-bindings: vendor-prefixes: Add SK Hynix Inc.
  dt-bindings: media: document SK Hynix Hi-846 MIPI CSI-2 8M pixel
    sensor
  media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera
  Documentation: i2c-cardlist: add the Hynix hi846 sensor

 .../admin-guide/media/i2c-cardlist.rst        |    1 +
 .../bindings/media/i2c/hynix,hi846.yaml       |   99 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    6 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/hi846.c                     | 2212 +++++++++++++++++
 7 files changed, 2334 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
 create mode 100644 drivers/media/i2c/hi846.c

-- 
2.30.2

