Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6952E36C5C7
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236075AbhD0MIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235501AbhD0MIJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:08:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548CFC061756
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 05:07:26 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbMUm-0006DF-09; Tue, 27 Apr 2021 14:07:16 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbMUl-0005uj-A1; Tue, 27 Apr 2021 14:07:15 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     p.zabel@pengutronix.de, mchehab@kernel.org, slongerbeam@gmail.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 0/6] Add new bayer ir formats
Date:   Tue, 27 Apr 2021 14:06:55 +0200
Message-Id: <20210427120701.21809-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

this adds the inital support for a new sensor format called RGB-IR
found on sensors from OnSemi [1]. This is a new custom bayer format with
interleaved ir pixels. For more information see the documentation
commit.

[1] https://www.onsemi.com/products/sensors/image-sensors-processors/image-sensors/ar0237sr

Marco Felsch (6):
  media: uapi: Add MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG media bus formats
  media: v4l: Add definition for bayered IR formats
  media: v4l2-ioctl.c: add V4L2_PIX_FMT_SGRGB_IGIG_GBGR_IGIG to
    v4l_fill_fmtdesc
  media: video-mux: add new SGRGB_IGIG_GBGR_IGIG format support
  gpu: ipu-v3: add custom SGRGB_IGIG_GBGR_IGIG format support
  media: imx: csi: add custom SGRGB_IGIG_GBGR_IGIG format support

 .../media/v4l/subdev-formats.rst              | 42 +++++++++++++++++++
 drivers/gpu/ipu-v3/ipu-cpmem.c                |  2 +
 drivers/gpu/ipu-v3/ipu-csi.c                  |  2 +
 drivers/media/platform/video-mux.c            |  2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
 drivers/staging/media/imx/imx-media-csi.c     |  2 +
 drivers/staging/media/imx/imx-media-utils.c   | 12 ++++++
 include/uapi/linux/media-bus-format.h         |  4 +-
 include/uapi/linux/videodev2.h                |  4 ++
 9 files changed, 71 insertions(+), 1 deletion(-)

-- 
2.29.2

