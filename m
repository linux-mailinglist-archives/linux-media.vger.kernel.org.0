Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D126C902D
	for <lists+linux-media@lfdr.de>; Sat, 25 Mar 2023 19:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjCYSrr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 14:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjCYSrq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 14:47:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E6A2717
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 11:47:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C4D489F
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 19:47:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679770062;
        bh=z8tLijHuj8Wsuvo9TcGvxlaEMmFdz2X1M6kvgm8kJSs=;
        h=Date:From:To:Subject:From;
        b=wlUwU6vhb04yywHejwvbSd669XfWrUoTNOVJRxi9x9Ea/NVhQKQUULqz9zXHlXXhK
         gZ2xvA/2v2N7/xPWf7GOmEyH9FZz7+dy18IxVw0sbrIVhDtZM5/+dzc4MS0Yp9TGTs
         HxoKWRZytAP5bk0NYrELNresJT6vouAk7dY2CR+w=
Date:   Sat, 25 Mar 2023 20:47:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.4] Miscellaneous cleanups and fixes for i.MX media
 drivers
Message-ID: <20230325184747.GB9876@pendragon.ideasonboard.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-imx-next-20230325

for you to fetch changes up to 1f1863b6ca3c12c50407e728d12060f81f6c108c:

  staging: media: imx: Make imx_media_of_add_csi() static (2023-03-25 20:36:10 +0200)

----------------------------------------------------------------
Miscellaneous cleanups and fixes for i.MX media drivers

----------------------------------------------------------------
Alexander Stein (2):
      media: imx: imx7-media-csi: Fix mbus framefmt field init
      media: imx: imx7-media-csi: Fail on invalid type in VIDIOC_G_SELECTION

Frieder Schrempf (1):
      media: imx: imx7-media-csi: Fix error handling in imx7_csi_async_register()

Laurent Pinchart (4):
      staging: media: imx: Drop imx_media_subdev_bound()
      staging: media: imx: Drop IMX_MEDIA_GRP_ID_CSI
      staging: media: imx: Drop unused helper functions
      staging: media: imx: Make imx_media_of_add_csi() static

Martin Kepplinger (2):
      media: imx: imx8mq-mipi-csi2: Use V4L2 subdev active state
      media: imx: imx8mq-mipi-csi2: Remove unneeded state variable and function

 drivers/media/platform/nxp/imx7-media-csi.c      |  27 ++--
 drivers/staging/media/imx/imx-media-dev-common.c |  14 ---
 drivers/staging/media/imx/imx-media-of.c         |   5 +-
 drivers/staging/media/imx/imx-media-utils.c      |  68 ----------
 drivers/staging/media/imx/imx-media.h            |  13 --
 drivers/staging/media/imx/imx8mq-mipi-csi2.c     | 152 +++++++++--------------
 6 files changed, 77 insertions(+), 202 deletions(-)

-- 
Regards,

Laurent Pinchart
