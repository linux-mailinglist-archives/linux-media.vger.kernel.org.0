Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E53B698143
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 17:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbjBOQu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 11:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjBOQu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 11:50:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC3AB93DF
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 08:50:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FA8325E;
        Wed, 15 Feb 2023 17:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676479822;
        bh=9HzZqFzPnqugsgxRf8o+BXgKteo0fndMN7gPVejzlU4=;
        h=From:To:Cc:Subject:Date:From;
        b=LhLqRyl15HnhLaK06qDXRBAzlOJNAQIYBSbEcwUVU8gnyl5XVZb549mMnghHMDzV5
         ZzIoAhEpO1ZFyQu/tVTIyq9BP0flbdFShaKaqEugpNeoJnVOJp4w8LuTf/YSLHeS0z
         72v+odqI0zztNITjWDsAglsyDhaeG6PrN+nJM+FE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: [PATCH 0/3] media: Zero-initialize structures passed to subdev pad ops
Date:   Wed, 15 Feb 2023 18:50:18 +0200
Message-Id: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series fixes a (surprisingly large) number of drivers that
don't zero-initialize structures passed to subdev pad operations.

The rationale is explained in patch 1/3, which fixes the issue: while
this doesn't cause any immediate problem, it leaves reserved fields
uninitialized, and any future change of in-kernel APIs that make use of
some of the reserved fields may introduce hard to catch breakages.

Patches 2/3 and 3/3 are not strictly required to fix the problem, but
they address coding style consistency issues that bothered me when
developing 1/3.

Laurent Pinchart (3):
  media: Zero-initialize all structures passed to subdev pad operations
  media: Prefer designated initializers over memset for subdev pad ops
  media: USe designated initializers for all subdev pad ops

 drivers/media/pci/cobalt/cobalt-v4l2.c        | 21 ++++++----
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  1 +
 .../platform/microchip/microchip-isc-base.c   |  5 ++-
 .../media/platform/qcom/camss/camss-video.c   |  5 ++-
 .../media/platform/renesas/vsp1/vsp1_drm.c    | 23 ++++++-----
 .../media/platform/renesas/vsp1/vsp1_entity.c | 11 +++--
 .../media/platform/renesas/vsp1/vsp1_video.c  |  5 ++-
 .../samsung/exynos4-is/fimc-capture.c         | 18 +++++----
 .../samsung/exynos4-is/fimc-isp-video.c       | 10 +++--
 .../platform/samsung/exynos4-is/fimc-lite.c   |  9 +++--
 .../samsung/s3c-camif/camif-capture.c         |  5 ++-
 .../platform/samsung/s3c-camif/camif-core.c   |  5 ++-
 .../media/platform/ti/am437x/am437x-vpfe.c    | 35 ++++++++--------
 drivers/media/platform/ti/cal/cal-video.c     | 37 +++++++++--------
 drivers/media/platform/ti/omap3isp/ispccdc.c  |  5 ++-
 drivers/media/platform/ti/omap3isp/ispvideo.c | 20 ++++++----
 drivers/media/platform/xilinx/xilinx-dma.c    |  5 ++-
 drivers/media/test-drivers/vimc/vimc-common.c |  8 ++--
 drivers/media/usb/dvb-usb/cxusb-analog.c      | 14 +++----
 .../media/deprecated/atmel/atmel-isc-base.c   |  5 ++-
 drivers/staging/media/imx/imx-media-capture.c | 40 ++++++++++---------
 drivers/staging/media/imx/imx-media-utils.c   |  8 ++--
 drivers/staging/media/omap4iss/iss_video.c    | 16 ++++----
 drivers/staging/media/tegra-video/vi.c        | 10 +++--
 24 files changed, 182 insertions(+), 139 deletions(-)


base-commit: 83e0f265aa8d0e37cc8e15d318b64da0ec03ff41
-- 
Regards,

Laurent Pinchart

