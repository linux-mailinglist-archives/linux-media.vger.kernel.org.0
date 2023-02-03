Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2406E689466
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 10:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232514AbjBCJvr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 04:51:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbjBCJvq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 04:51:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5BF99A819
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 01:51:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4F80890
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 10:51:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675417903;
        bh=Ogu2nLZYixd4pCkpKb8geUsrMLbuAxSBjkbJIBAgTYw=;
        h=Date:From:To:Subject:From;
        b=H/ZrghMs7uxpI8z2PQ1NRfyG8GwnAha3isw1irXmmU/zrsO3lBnf0jK33oWkmn754
         iuJJNLAE+iQUTMELq1XE6uiaanID011+/tDnK6u1sCwi1LhlaBUoQZ1LW+PJ2T/1U7
         rB6PBs7e9xv4AK8MXcQAxyk1j6C/YYC39e4HvwSU=
Date:   Fri, 3 Feb 2023 11:51:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.3] NXP i.MX8 ISI driver
Message-ID: <Y9zZLJobSYuMwP9o@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 7120d6bfd6d0b26b49958f429701996f2d3e2c2a:

  media: tm6000: remove deprecated driver (2023-01-22 09:57:19 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-imx-isi-next-20230203

for you to fetch changes up to e8126b9f0ee306e784dfa20f5390b97d573986ae:

  media: nxp: Add i.MX8 ISI driver (2023-02-03 11:15:18 +0200)

This is a new driver for the NXP i.MX8 ISI, found in multiple i.MX8 SoCs
including the i.MX8MP (which I have used for testing) and i.MX8MN. The
driver uses the V4L2 streams API that you have merged in the media
staging tree, so I've based the pull request on the latest master branch
of that tree.

As the streams API is going to land in v6.3, I think it would be nice to
also have one user of the API in the same kernel version. Note that the
API isn't exposed to userspace by default, doing so requires flipping a
variable in v4l2-subdev.c, so we'll have a few kernel releases to test
and stabilize everything with multiple drivers (not that I expect
issues, as we've extensively tested that API over the course of multiple
years in at least 6 different drivers - which we'll work on upstreaming
of course, some of them have already been posted for review).

----------------------------------------------------------------
NXP i.MX8 ISI driver

----------------------------------------------------------------
Laurent Pinchart (2):
      dt-bindings: media: Add i.MX8 ISI DT bindings
      media: nxp: Add i.MX8 ISI driver

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  173 +++
 MAINTAINERS                                        |    7 +
 drivers/media/platform/nxp/Kconfig                 |    2 +
 drivers/media/platform/nxp/Makefile                |    1 +
 drivers/media/platform/nxp/imx8-isi/Kconfig        |   22 +
 drivers/media/platform/nxp/imx8-isi/Makefile       |    8 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  645 +++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  395 +++++
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  529 +++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-debug.c   |  109 ++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  651 +++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  858 +++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  867 +++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  418 ++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 1512 ++++++++++++++++++++
 15 files changed, 6197 insertions(+)
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
