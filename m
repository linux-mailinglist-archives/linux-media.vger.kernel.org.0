Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3337F19CE
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 16:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730456AbfKFPVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 10:21:02 -0500
Received: from inva020.nxp.com ([92.121.34.13]:33004 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727231AbfKFPVB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 10:21:01 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5791E1A0647;
        Wed,  6 Nov 2019 16:20:59 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 402691A0645;
        Wed,  6 Nov 2019 16:20:59 +0100 (CET)
Received: from fsr-ub1664-134.ea.freescale.net (fsr-ub1664-134.ea.freescale.net [10.171.74.111])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 7337E205EB;
        Wed,  6 Nov 2019 16:20:58 +0100 (CET)
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, paul.kocialkowski@bootlin.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH 0/5] Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
Date:   Wed,  6 Nov 2019 17:20:28 +0200
Message-Id: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch set adds the V4L2 driver for i.MX8QXP/QM JPEG encoder/decoder
and it's dependencies.
The driver was tested on i.MX8QXP, using a unit test application and
the v4l2-compliance tool, which passes when run on the encoder/decoder dev
node, without any other parameters:
v4l2-compliance -d /dev/video0
v4l2-compliance -d /dev/video1
v4l2-compliance SHA: 2ff1e6b3d67dbbdde212c8cf0de603f9f52078ed, 64 bits

The first patch "Add packed YUV444 24bpp pixel format" was already reviewed
upstream, but not accepted because there was no driver using this format,
until now. This pixel format, YUV444 24bpp, is now used and needed by the
i.MX8QXP/QM JPEG encoder/decoder driver.

Mirela Rabulea (5):
  media: v4l: Add packed YUV444 24bpp pixel format
  firmware: imx: scu-pd: Add power domains for imx-jpeg
  media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
  media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
  arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes

 .../devicetree/bindings/media/imx8-jpeg.yaml       |   83 +
 Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst |   37 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |    8 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   37 +
 drivers/firmware/imx/scu-pd.c                      |    6 +
 drivers/media/platform/Kconfig                     |    2 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/imx-jpeg/Kconfig            |   10 +
 drivers/media/platform/imx-jpeg/Makefile           |    3 +
 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c      |  168 ++
 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h      |  140 ++
 drivers/media/platform/imx-jpeg/mxc-jpeg.c         | 2266 ++++++++++++++++++++
 drivers/media/platform/imx-jpeg/mxc-jpeg.h         |  187 ++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/videodev2.h                     |    1 +
 15 files changed, 2949 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/imx8-jpeg.yaml
 create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
 create mode 100644 drivers/media/platform/imx-jpeg/Makefile
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h

-- 
2.7.4

