Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 523ED4BA4C4
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 16:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242031AbiBQPo3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 10:44:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240440AbiBQPo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 10:44:26 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F91A2B1025
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 07:44:11 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1nKiwz-0005tz-Fe; Thu, 17 Feb 2022 16:44:09 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1nKiwz-00HCTc-4u; Thu, 17 Feb 2022 16:44:08 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1nKiwx-00C8ZB-J2; Thu, 17 Feb 2022 16:44:07 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v10 0/2] media: i2c: isl7998x: Add driver for Intersil ISL7998x
Date:   Thu, 17 Feb 2022 16:44:05 +0100
Message-Id: <20220217154407.2892822-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is v10 of the series to for adding the isl7998x driver [0].

The isl7998x is an analog video to MIPI CSI-2 or BT.656 converter. The dt
binding describes only the isl79987 chip, which supports MIPI CSI-2. The
driver could be extended to handle isl79988 (for BT.656), too, but this isn't
implemented.

v10 drops patch 0001-media-imx6-mipi-csi2-use-pre_streamon-callback-to.patch,
because it has already been merged into master.

v10 addresses the review comments from v9 [1] and adds a lock for the subdev
calls, fixes check-patch checks, adds the PAL Nc format, and reworks how video
standards are looked up in the driver. Full changelog is in the respective
patch.

Michael

[0] https://lore.kernel.org/linux-media/20190520201812.7937-1-marex@denx.de/
[1] https://lore.kernel.org/all/20211129112708.3219754-1-m.tretter@pengutronix.de/

Changelog:

v10:

- add a lock for subdev calls
- remove unnecessary pm_runtime_enabled
- fix indentation and format
- free controls on error
- fix set_standard call
- remove camel case in macro definitions
- add macros for video formats
- rework lookup of video standards
- add support for PAL Nc
- add explicit trigger for format detection

v9:

- remove clock-lanes from dt binding example
- add data-lanes to dt binding example

v8:

- rebase on v5.16-rc1
- fix warning about ignored type qualifier

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

 .../bindings/media/i2c/isil,isl79987.yaml     |  113 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/isl7998x.c                  | 1633 +++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |    6 +
 6 files changed, 1771 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
 create mode 100644 drivers/media/i2c/isl7998x.c

-- 
2.30.2

