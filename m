Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B005436736
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 18:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhJUQFj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 12:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbhJUQFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 12:05:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7230C061348
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 09:03:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mdaX8-0003dw-1O; Thu, 21 Oct 2021 18:03:10 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mdaX6-0000X6-U2; Thu, 21 Oct 2021 18:03:08 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1mdaX6-008EZM-M6; Thu, 21 Oct 2021 18:03:08 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v7 0/3]  media: i2c: isl7998x: Add driver for Intersil ISL7998x
Date:   Thu, 21 Oct 2021 18:03:05 +0200
Message-Id: <20211021160308.1962585-1-m.tretter@pengutronix.de>
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

This is v7 of the series to for adding the isl7998x driver [0]

The isl7998x is an analog video to MIPI CSI-2 or BT.656 converter. The dt
binding describes only the isl79987 chip, which supports MIPI CSI-2. The
driver could be extended to handle isl79988 (for BT.656), too, but this isn't
implemented.

The driver now correctly reserves space for it's driver specific v4l2
controls. I already skipped the space of the v4l2 controls for the allegro
driver, but this will lead to an (easily fixable) merge conflict. I also added
some documentation to the custom controls.

The driver now implements the querystd, s_std, and g_std callbacks to move the
video standard handling to user space. The video standard defaults to NTSC,
user space can explicitly trigger the video standard detection, and is
responsible (and able to override) the video standard. The set video standard
is now also used to select the video standard of the test pattern generator.

Furthermore, I fixed two bugs. The condition for successful standard detection
was wrong and there was an off-by-one when the decoder is used with 4 inputs.

Michael

[0] https://lore.kernel.org/linux-media/20190520201812.7937-1-marex@denx.de/

Changelog:

v7:

- add reservation and documentation for custom V4L2 controls
- implement g_input_status, g_tvnorms, querystd, s_std, g_std
- use v4l2_norm_to_name instead of custom implementation
- fix off-by-one with 4 inputs
- fix polling condition for standard detection

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
 drivers/media/i2c/isl7998x.c                  | 1543 +++++++++++++++++
 drivers/staging/media/imx/imx6-mipi-csi2.c    |    9 +-
 include/uapi/linux/v4l2-controls.h            |    6 +
 7 files changed, 1676 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
 create mode 100644 drivers/media/i2c/isl7998x.c

-- 
2.30.2

