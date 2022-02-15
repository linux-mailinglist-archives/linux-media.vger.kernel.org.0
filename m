Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95C254B69C6
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 11:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235787AbiBOKxp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 05:53:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiBOKxo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 05:53:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC05C6220
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 02:53:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7622A315
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 11:53:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644922413;
        bh=+TQJA54ayy0F3inRhdEcnIEL2S9E21X1Ea+l3DCSGhs=;
        h=Date:From:To:Subject:From;
        b=qxbOkScwJK9doQ1T2fiNizOpIOexp+oC0Qc6kOMosTTO2cVF9uiarMnURXcDeB/HA
         cMV6ubtXsIEzOVJRMfehVLjXlSX+bzx3dJJcPRrTPdqDIKisGYajz8xY/IYdYigADx
         Q1cbN2nEAOuIYYHUFWUNh/WjBu4ohcFvubPk0dCE=
Date:   Tue, 15 Feb 2022 12:53:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.18] Misc V4L2 driver changes
Message-ID: <YguGJi0Z7cKu/Yuz@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 68a99f6a0ebfe9101ea79ba5af1c407a5ad4f629:

  media: lirc: report ir receiver overflow (2022-01-28 19:32:50 +0100)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20220215

for you to fetch changes up to 90b5eb835fef2da635c459b78c5c81525ca26d47:

  media: xilinx: csi2rxss: Use mipi-csi2.h (2022-02-15 12:52:09 +0200)

----------------------------------------------------------------
Misc V4L2 driver changes

----------------------------------------------------------------
Alexander Stein (1):
      staging: media: imx: imx7_mipi_csis: Store colorspace in set_fmt as well

Laurent Pinchart (4):
      media: Define MIPI CSI-2 data types in a shared header file
      media: rcar-isp: Use mipi-csi2.h
      media: rcar-csi2: Use mipi-csi2.h
      media: xilinx: csi2rxss: Use mipi-csi2.h

Martin Kepplinger (2):
      dt-binding: media: hynix,hi846: use $defs/port-base port description
      dt-bindings: media: hynix,hi846: add link-frequencies description

Nikita Yushchenko (1):
      media: vsp1: mask interrupts before enabling

Paul Pawlowski (1):
      media: uvcvideo: Add support for Apple T2-attached FaceTime HD Camera

Zhou Qingyang (1):
      media: ti-vpe: cal: Fix a NULL pointer dereference in cal_ctx_v4l2_init_formats()

 .../devicetree/bindings/media/i2c/hynix,hi846.yaml |   6 +-
 drivers/media/platform/rcar-isp.c                  |  32 +++++--
 drivers/media/platform/rcar-vin/rcar-csi2.c        |  57 ++++++++---
 drivers/media/platform/ti-vpe/cal-video.c          |   3 +
 drivers/media/platform/vsp1/vsp1_drv.c             |  37 +++++--
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 106 +++++++++------------
 drivers/media/usb/uvc/uvc_driver.c                 |   9 ++
 drivers/staging/media/imx/imx7-mipi-csis.c         |   4 +
 include/media/mipi-csi2.h                          |  45 +++++++++
 9 files changed, 212 insertions(+), 87 deletions(-)
 create mode 100644 include/media/mipi-csi2.h

-- 
Regards,

Laurent Pinchart
