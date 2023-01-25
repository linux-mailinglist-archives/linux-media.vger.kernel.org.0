Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6974067C024
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 23:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjAYWtF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 17:49:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjAYWtE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 17:49:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD58943475
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 14:49:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A72B56E0;
        Wed, 25 Jan 2023 23:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674686940;
        bh=ORaJ/KhjL9yi0Vm6le1B5uyByHMP76XQWBAv/OdoapM=;
        h=From:To:Cc:Subject:Date:From;
        b=g4vJUXqHiZUJwDcSJ9EUNfkg4KeI5EbJ+Cg+bVvO0vW3Ms1GIw7O63ILOvf0K/Lrn
         y3FmVYWAczqIgE72kXN39PI6rscHOl5ViaC9Ls6h5xVW9oI+HUxS7JsliKVBh9FGaH
         eassPDhY2hdQXcnYFCbQ/5CCKQeRU1O9Mf/c2XlQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dongsoo Nathaniel Kim <dongsoo45.kim@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heungjun Kim <riverful.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Scott Jiang <scott.jiang.linux@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [RFC PATCH 0/8] media: i2c: Drop unused drivers
Date:   Thu, 26 Jan 2023 00:48:48 +0200
Message-Id: <20230125224856.22266-1-laurent.pinchart@ideasonboard.com>
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

Quite a few drivers for I2C camera sensors and video encoders are
bit-rotting in drivers/media/i2c/. In particular, seven drivers have
been merged requiring platform data, never converted to DT, and have
either never had a user in the mainline kernel (ad9389b, mt9m032,
mt9t001 and sr030pc30) or have no user anymore after board files have
been dropped (m5mols, s5k6aa and vs6624).

Another driver, the noon010pc30, also falls in the same category, but
the device is listed in a device tree file in mainline. There is however
no DT binding, and no DT support in the driver.

Unless someone is interested in converting those drivers to DT (and
maintaining them !), these are more than 10k lines of dead code. This
RFC simply drops them.

Seven more drivers (ak881x, mt9t112, noon010pc30, rj45n1cb0c, ths7303,
tw9910 and wm8775) are used in arch/sh/ board files only, for boards
that will likely never be converted to DT. As arch/sh/ seems to be
headed for either a DT conversion or a complete drop, those drivers may
also be removed in the future.

Laurent Pinchart (8):
  media: i2c: Drop unused ad9389b video encoder driver
  media: i2c: Drop unused m5mols camera sensor driver
  media: i2c: Drop unused mt9m032 camera sensor driver
  media: i2c: Drop unused mt9t001 camera sensor driver
  media: i2c: Drop unused noon010pc30 camera sensor driver
  media: i2c: Drop unused s5k6aa camera sensor driver
  media: i2c: Drop unused sr030pc30 camera sensor driver
  media: i2c: Drop unused vs6624 camera sensor driver

 .../admin-guide/media/i2c-cardlist.rst        |    8 -
 MAINTAINERS                                   |   30 -
 drivers/media/i2c/Kconfig                     |   67 -
 drivers/media/i2c/Makefile                    |    8 -
 drivers/media/i2c/ad9389b.c                   | 1215 ------------
 drivers/media/i2c/m5mols/Kconfig              |    8 -
 drivers/media/i2c/m5mols/Makefile             |    4 -
 drivers/media/i2c/m5mols/m5mols.h             |  349 ----
 drivers/media/i2c/m5mols/m5mols_capture.c     |  158 --
 drivers/media/i2c/m5mols/m5mols_controls.c    |  625 -------
 drivers/media/i2c/m5mols/m5mols_core.c        | 1051 -----------
 drivers/media/i2c/m5mols/m5mols_reg.h         |  359 ----
 drivers/media/i2c/mt9m032.c                   |  891 ---------
 drivers/media/i2c/mt9t001.c                   |  992 ----------
 drivers/media/i2c/noon010pc30.c               |  821 --------
 drivers/media/i2c/s5k6aa.c                    | 1652 -----------------
 drivers/media/i2c/sr030pc30.c                 |  762 --------
 drivers/media/i2c/vs6624.c                    |  854 ---------
 drivers/media/i2c/vs6624_regs.h               |  325 ----
 include/media/i2c/ad9389b.h                   |   37 -
 include/media/i2c/m5mols.h                    |   25 -
 include/media/i2c/mt9m032.h                   |   22 -
 include/media/i2c/mt9t001.h                   |   10 -
 include/media/i2c/noon010pc30.h               |   21 -
 include/media/i2c/s5k6aa.h                    |   48 -
 include/media/i2c/sr030pc30.h                 |   17 -
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


base-commit: 7120d6bfd6d0b26b49958f429701996f2d3e2c2a
-- 
Regards,

Laurent Pinchart

