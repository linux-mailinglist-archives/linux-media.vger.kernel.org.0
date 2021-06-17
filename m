Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDBBB3AAFA0
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 11:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbhFQJ1u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 05:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbhFQJ1t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 05:27:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD71C061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 02:25:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1ltoHM-0003ou-1h; Thu, 17 Jun 2021 11:25:40 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1ltoHK-0002bw-Hz; Thu, 17 Jun 2021 11:25:38 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1ltoHK-004eXx-FS; Thu, 17 Jun 2021 11:25:38 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v3 0/2] media: i2c: isl7998x: Add driver for Intersil ISL7998x
Date:   Thu, 17 Jun 2021 11:25:36 +0200
Message-Id: <20210617092538.1109021-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This is v3 of the series for adding the isl7998x driver [0].

The isl7998x is an analog video to MIPI CSI-2 or BT.656 converter. The dt
binding describes only the isl79987 chip, which supports MIPI CSI-2. The
driver could be extended to handle isl79988 (for BT.656), too, but this isn't
implemented.

In v3, I updated the device tree bindings based on Robs review comments. In
the driver itself, only the powerdown gpio name has changed, to follow the dt
binding change.

Michael

[0] https://lore.kernel.org/linux-media/20190520201812.7937-1-marex@denx.de/

Changelog:

v3:

- rename pd-gpios property to powerdown-gpios
- reference graph.yaml for port/ports property
- remove reference to video-interfaces.txt

v2:

- convert dt binding to yaml
- change binding to ISL79987 only
- general driver cleanup
- convert driver to pm_runtime
- use ports in device tree for specifying inputs
- add reset gpio

Marek Vasut (2):
  media: dt-bindings: Add Intersil ISL79987 DT bindings
  media: i2c: isl7998x: Add driver for Intersil ISL7998x

 .../bindings/media/i2c/isil,isl79987.yaml     |  100 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |    9 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/isl7998x.c                  | 1421 +++++++++++++++++
 5 files changed, 1539 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
 create mode 100644 drivers/media/i2c/isl7998x.c

-- 
2.29.2

