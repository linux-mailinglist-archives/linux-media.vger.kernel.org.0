Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E436C90BA
	for <lists+linux-media@lfdr.de>; Sat, 25 Mar 2023 21:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjCYUeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 16:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjCYUeI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 16:34:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD3CDF
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 13:34:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F21989F
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 21:34:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679776444;
        bh=/zBBuVv4v1qY+yQR38Xkkl1MbJFdwV0O29JQESm/1jc=;
        h=Date:From:To:Subject:From;
        b=Cm5SaKSZwGgNQL4R0VxPSFUWo2SpQfNfAI6g0nng4NkLi254TiAnm8ePr5+XBezWW
         QjJynT6GlmXAE2RdB9XADtiAqeb2PnPD5hGFhxof9DbyW2iXD44pis4tK2BI7BVH66
         FoLH5IAZeME8ibmcSlJ65c7QqnOR9X1MNIG9TDls=
Date:   Sat, 25 Mar 2023 22:34:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.4] media: Zero-initialize structures passed to
 subdev pad ops
Message-ID: <20230325203410.GB19335@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:

  media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-zero-init-next-20230325

for you to fetch changes up to 4277e6ad4c2980e24dfe6920b9651635434f2a57:

  media: Use designated initializers for all subdev pad ops (2023-03-25 22:13:24 +0200)

----------------------------------------------------------------
media: Zero-initialize structures passed to subdev pad ops

----------------------------------------------------------------
Laurent Pinchart (5):
      media: Fix indentation issues introduced by subdev-wide state struct
      media: imx-jpeg: Fix incorrect indentation
      media: Zero-initialize all structures passed to subdev pad operations
      media: Prefer designated initializers over memset for subdev pad ops
      media: Use designated initializers for all subdev pad ops

 drivers/media/pci/cobalt/cobalt-v4l2.c             | 21 +++++++-----
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |  1 +
 drivers/media/pci/saa7134/saa7134-empress.c        |  4 +--
 drivers/media/platform/atmel/atmel-isi.c           |  4 +--
 drivers/media/platform/intel/pxa_camera.c          |  4 +--
 drivers/media/platform/marvell/mcam-core.c         |  4 +--
 .../media/platform/microchip/microchip-isc-base.c  |  5 +--
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  7 ++--
 drivers/media/platform/qcom/camss/camss-video.c    |  5 +--
 drivers/media/platform/renesas/renesas-ceu.c       |  4 +--
 drivers/media/platform/renesas/vsp1/vsp1_drm.c     | 23 +++++++------
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  | 11 +++---
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |  5 +--
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      | 14 ++++----
 .../platform/samsung/exynos4-is/fimc-capture.c     | 18 ++++++----
 .../platform/samsung/exynos4-is/fimc-isp-video.c   | 10 ++++--
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |  9 +++--
 .../platform/samsung/s3c-camif/camif-capture.c     |  5 +--
 .../media/platform/samsung/s3c-camif/camif-core.c  |  5 +--
 drivers/media/platform/ti/am437x/am437x-vpfe.c     | 35 ++++++++++---------
 drivers/media/platform/ti/cal/cal-video.c          | 37 +++++++++++---------
 drivers/media/platform/ti/omap3isp/ispccdc.c       |  5 +--
 drivers/media/platform/ti/omap3isp/ispvideo.c      | 20 ++++++-----
 drivers/media/platform/via/via-camera.c            |  4 +--
 drivers/media/platform/xilinx/xilinx-dma.c         |  5 +--
 drivers/media/test-drivers/vimc/vimc-common.c      |  8 ++---
 drivers/media/usb/dvb-usb/cxusb-analog.c           | 14 ++++----
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  8 ++---
 .../media/deprecated/atmel/atmel-isc-base.c        |  9 ++---
 drivers/staging/media/imx/imx-media-capture.c      | 40 ++++++++++++----------
 drivers/staging/media/imx/imx-media-utils.c        |  8 ++---
 drivers/staging/media/omap4iss/iss_video.c         | 16 +++++----
 drivers/staging/media/tegra-video/vi.c             | 10 +++---
 33 files changed, 210 insertions(+), 168 deletions(-)

-- 
Regards,

Laurent Pinchart
