Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F7742DA76
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 15:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbhJNNd7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 09:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbhJNNd6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 09:33:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A244C061762
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 06:31:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mb0pr-0002uq-2M; Thu, 14 Oct 2021 15:31:51 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mb0pq-0006ty-2R; Thu, 14 Oct 2021 15:31:50 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mb0pq-001X0a-1L; Thu, 14 Oct 2021 15:31:50 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v6 0/3] media: i2c: isl7998x: Add driver for Intersil ISL7998x
Date:   Thu, 14 Oct 2021 15:31:47 +0200
Message-Id: <20211014133150.365169-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is v6 of the series to for adding the isl7998x driver [0]

The isl7998x is an analog video to MIPI CSI-2 or BT.656 converter. The dt
binding describes only the isl79987 chip, which supports MIPI CSI-2. The
driver could be extended to handle isl79988 (for BT.656), too, but this isn't
implemented.

In v6, I incorporated the review feedback by Philipp Zabel on v5. See the
changelog in Patch 3 for details.

Michael

[0] https://lore.kernel.org/linux-media/20190520201812.7937-1-marex@denx.de/

Changelog:

v6:

- incorporate review feedback by Philipp Zabel into isl7998x.c

v5:

- ignore -ENOIOCTLCMD of pre_streamon for backwards compatibility

v4:

- add patch for imx6-mipi-csi2 to request LP-11 mode
- update isl7998x driver with review feedback on v3

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

Michael Tretter (1):
  media: imx6-mipi-csi2: use pre_streamon callback to set sensor into
    LP11

 .../bindings/media/i2c/isil,isl79987.yaml     |  100 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/isl7998x.c                  | 1394 +++++++++++++++++
 drivers/staging/media/imx/imx6-mipi-csi2.c    |    9 +-
 6 files changed, 1521 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
 create mode 100644 drivers/media/i2c/isl7998x.c

-- 
2.30.2

