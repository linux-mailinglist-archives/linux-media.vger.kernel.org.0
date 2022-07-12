Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E79570E83
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 02:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbiGLADa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 20:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbiGLAD2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 20:03:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02582CE14
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 17:03:26 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1689A30B;
        Tue, 12 Jul 2022 02:03:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657584203;
        bh=2pJa/oEHfcMo7ILWh/vM2zgg6j3TrDAvdsVjCkH01JA=;
        h=From:To:Cc:Subject:Date:From;
        b=dh7JK4mFQss0lZoy4ggDxQz32AGGyE+sMqoY4rfCOB/DdWHmMQ2j7tW5ifQeE1rQQ
         /YEPIpGn8kh40ULC5taxplpohMqvXOlHnAV9qq8A2QtDcXgz3RZ7odf2ZgZ5395u1J
         5E12AJ94Eq0vt+wK2XAv6WhmKLiL0/U80MKCR5tk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: [PATCH v2 0/7] media: nxp: i.MX8 ISI driver
Date:   Tue, 12 Jul 2022 03:02:44 +0300
Message-Id: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series adds a new driver for the Imaging Sensor Interface,
an IP core found in various NXP i.MX8 SoCs, including the i.MX8MN and
the i.MX8MP.

The first five patches have already been posted and acked. This v2
addresses small review comments, and I will send a pull request shortly.

Patches 6/7 and 7/7 add the DT bindings and the driver. The driver
depends on the v11 of the V4L2 streams series ("[PATCH v11 00/36] v4l:
routing and streams support", posted to [1]). This blocks upstreaming of
the driver, but this series showcases another user of the streams API,
which I hope will help getting it merged. Both the bindings and the
driver are ready for review.

[1] https://lore.kernel.org/linux-media/20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com/

Laurent Pinchart (7):
  media: v4l: Add packed YUV 4:4:4 YUVA and YUVX pixel formats
  media: v4l2-tpg: Add support for the new YUVA and YUVX formats
  media: vivid: Add support for the new YUVA and YUVX formats
  media: v4l2: Make colorspace validity checks more future-proof
  media: v4l2: Sanitize colorspace values in the framework
  dt-bindings: media: Add i.MX8 ISI DT bindings
  media: nxp: Add i.MX8 ISI driver

 .../bindings/media/nxp,imx8-isi.yaml          |  148 ++
 .../media/v4l/pixfmt-packed-yuv.rst           |   20 +
 MAINTAINERS                                   |    7 +
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c |    6 +
 drivers/media/platform/nxp/Kconfig            |    2 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/imx8-isi/Kconfig   |   22 +
 drivers/media/platform/nxp/imx8-isi/Makefile  |    9 +
 .../platform/nxp/imx8-isi/imx8-isi-core.c     |  646 +++++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h     |  394 +++++
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  529 ++++++
 .../platform/nxp/imx8-isi/imx8-isi-debug.c    |  109 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-hw.c |  651 +++++++
 .../platform/nxp/imx8-isi/imx8-isi-m2m.c      |  858 ++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  867 ++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-regs.h     |  418 +++++
 .../platform/nxp/imx8-isi/imx8-isi-video.c    | 1513 +++++++++++++++++
 .../test-drivers/vivid/vivid-vid-common.c     |   15 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   67 +-
 include/media/v4l2-common.h                   |    6 +-
 include/uapi/linux/videodev2.h                |   24 +
 21 files changed, 6299 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
 create mode 100644 drivers/media/platform/nxp/imx8-isi/Kconfig
 create mode 100644 drivers/media/platform/nxp/imx8-isi/Makefile
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c


base-commit: a74a91c3c5b2db0e7712bef12ea792795668b7e6
-- 
Regards,

Laurent Pinchart

