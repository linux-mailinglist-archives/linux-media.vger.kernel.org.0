Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 148766E3273
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 18:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjDOQd4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 12:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjDOQdz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 12:33:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E280840F1
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 09:33:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DCF29A
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 18:33:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681576428;
        bh=g8RxeeBBb9smOnz1rREZ0I8o2vr0AP9R8URoR0CDMyk=;
        h=Date:From:To:Subject:From;
        b=ff3Hufd8/VTarfPfr59NdAU38SemWCKEVZvxzNPhTPtuIp4QLNI/zzu1jSXBsUUwZ
         5djq7UllQSIimljU0XgxKeTo/FLk0cLrGm0t2Td+YpaDRJmXuCtIz62uUCEfIYiuJc
         CP0QOpW+wLM663+fuQKiMz8oac4p97dL2cDzlGpE=
Date:   Sat, 15 Apr 2023 19:34:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.4] NXP i.MX8 ISI driver
Message-ID: <20230415163404.GA31708@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 671397d7c6a5d2b923aaf1b4414e3ac9333674a7:

  media: atomisp: gmin_platform: Add Lenovo Ideapad Miix 310 gmin_vars (2023-04-15 10:43:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-imx-isi-next-20230415

for you to fetch changes up to 833e2bcf678cb2b06db31eb821007d21a5a7934e:

  media: nxp: imx8-isi: Remove 300ms sleep after enabling channel (2023-04-15 19:10:43 +0300)

----------------------------------------------------------------
NXP i.MX8 ISI driver

----------------------------------------------------------------
Jacopo Mondi (1):
      media: nxp: imx8-isi: Remove 300ms sleep after enabling channel

Laurent Pinchart (4):
      dt-bindings: media: Add i.MX8 ISI DT bindings
      media: nxp: Add i.MX8 ISI driver
      media: nxp: imx8-isi: Drop partial support for i.MX8QM and i.MX8QXP
      media: nxp: imx8-isi: Replace udelay() with fsleep()

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  173 +++
 MAINTAINERS                                        |    7 +
 drivers/media/platform/nxp/Kconfig                 |    2 +
 drivers/media/platform/nxp/Makefile                |    1 +
 drivers/media/platform/nxp/imx8-isi/Kconfig        |   22 +
 drivers/media/platform/nxp/imx8-isi/Makefile       |    8 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  539 +++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  394 +++++
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  529 +++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-debug.c   |  109 ++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  650 +++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  858 +++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  867 +++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  418 ++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 1512 ++++++++++++++++++++
 15 files changed, 6089 insertions(+)
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

-- 
Regards,

Laurent Pinchart
