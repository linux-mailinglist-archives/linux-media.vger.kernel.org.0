Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A63B6C90B8
	for <lists+linux-media@lfdr.de>; Sat, 25 Mar 2023 21:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjCYUdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 16:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjCYUdT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 16:33:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89785DF
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 13:33:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E3EB89F
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 21:33:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679776397;
        bh=xSqk1aDivsLYRv88PCgHOj4ehWZWdg6fXh0D5uhunGU=;
        h=Date:From:To:Subject:From;
        b=fh9lbNH7tvdNG6ZHXAEmlNa6kyXm9XDSEgZFJEvO0KOu9xuPnIslTn1yTqVMj8lAf
         TifasQy8btTfQ0TQwSFkxP/VRJeVSVFfD7ZyvsBOvxo2gDSVY1OkaBJyfxHvcElh5m
         MWwtRwO3LTyCLzxHHbNudRP9sJg/4EUIyWhx1pgQ=
Date:   Sat, 25 Mar 2023 22:33:23 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.4] media: Drop unused I2C drivers
Message-ID: <20230325203323.GA19335@pendragon.ideasonboard.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-pdata-next-20230325

for you to fetch changes up to 1150fb3db5c3b78c1245f4dec87ae8878b27413f:

  media: i2c: Drop unused vs6624 camera sensor driver (2023-03-25 22:21:18 +0200)

----------------------------------------------------------------
media: Drop unused I2C drivers

----------------------------------------------------------------
Laurent Pinchart (8):
      media: i2c: Drop unused ad9389b video encoder driver
      media: i2c: Drop unused m5mols camera sensor driver
      media: i2c: Drop unused mt9m032 camera sensor driver
      media: i2c: Drop unused mt9t001 camera sensor driver
      media: i2c: Drop unused noon010pc30 camera sensor driver
      media: i2c: Drop unused s5k6aa camera sensor driver
      media: i2c: Drop unused sr030pc30 camera sensor driver
      media: i2c: Drop unused vs6624 camera sensor driver

 Documentation/admin-guide/media/i2c-cardlist.rst |    8 -
 MAINTAINERS                                      |   30 -
 drivers/media/i2c/Kconfig                        |   67 -
 drivers/media/i2c/Makefile                       |    8 -
 drivers/media/i2c/ad9389b.c                      | 1215 ----------------
 drivers/media/i2c/m5mols/Kconfig                 |    8 -
 drivers/media/i2c/m5mols/Makefile                |    4 -
 drivers/media/i2c/m5mols/m5mols.h                |  349 -----
 drivers/media/i2c/m5mols/m5mols_capture.c        |  158 ---
 drivers/media/i2c/m5mols/m5mols_controls.c       |  625 --------
 drivers/media/i2c/m5mols/m5mols_core.c           | 1051 --------------
 drivers/media/i2c/m5mols/m5mols_reg.h            |  359 -----
 drivers/media/i2c/mt9m032.c                      |  891 ------------
 drivers/media/i2c/mt9t001.c                      |  992 -------------
 drivers/media/i2c/noon010pc30.c                  |  821 -----------
 drivers/media/i2c/s5k6aa.c                       | 1652 ----------------------
 drivers/media/i2c/sr030pc30.c                    |  762 ----------
 drivers/media/i2c/vs6624.c                       |  854 -----------
 drivers/media/i2c/vs6624_regs.h                  |  325 -----
 include/media/i2c/ad9389b.h                      |   37 -
 include/media/i2c/m5mols.h                       |   25 -
 include/media/i2c/mt9m032.h                      |   22 -
 include/media/i2c/mt9t001.h                      |   10 -
 include/media/i2c/noon010pc30.h                  |   21 -
 include/media/i2c/s5k6aa.h                       |   48 -
 include/media/i2c/sr030pc30.h                    |   17 -
 26 files changed, 10359 deletions(-)
 delete mode 100644 drivers/media/i2c/ad9389b.c
 delete mode 100644 drivers/media/i2c/m5mols/Kconfig
 delete mode 100644 drivers/media/i2c/m5mols/Makefile
 delete mode 100644 drivers/media/i2c/m5mols/m5mols.h
 delete mode 100644 drivers/media/i2c/m5mols/m5mols_capture.c
 delete mode 100644 drivers/media/i2c/m5mols/m5mols_controls.c
 delete mode 100644 drivers/media/i2c/m5mols/m5mols_core.c
 delete mode 100644 drivers/media/i2c/m5mols/m5mols_reg.h
 delete mode 100644 drivers/media/i2c/mt9m032.c
 delete mode 100644 drivers/media/i2c/mt9t001.c
 delete mode 100644 drivers/media/i2c/noon010pc30.c
 delete mode 100644 drivers/media/i2c/s5k6aa.c
 delete mode 100644 drivers/media/i2c/sr030pc30.c
 delete mode 100644 drivers/media/i2c/vs6624.c
 delete mode 100644 drivers/media/i2c/vs6624_regs.h
 delete mode 100644 include/media/i2c/ad9389b.h
 delete mode 100644 include/media/i2c/m5mols.h
 delete mode 100644 include/media/i2c/mt9m032.h
 delete mode 100644 include/media/i2c/mt9t001.h
 delete mode 100644 include/media/i2c/noon010pc30.h
 delete mode 100644 include/media/i2c/s5k6aa.h
 delete mode 100644 include/media/i2c/sr030pc30.h

-- 
Regards,

Laurent Pinchart
