Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 476147D934C
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbjJ0JQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjJ0JQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:16:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F57593
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:16:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C92474A;
        Fri, 27 Oct 2023 11:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698398190;
        bh=btRggpHo92F25ririk9UU6Br7dOcO3QeqVbCIod4nSM=;
        h=From:To:Cc:Subject:Date:From;
        b=qEeZcdMublqqPEbtGLYXwzvp/IJn30HKMJJ9oemtObxaiiu7EA1YQtGD4uD7+Rq93
         QZ3OYI+IWmN/r9pcY5ktUDlpETdfom146DY/cFKLt7MnufiPkRoRkkh5G9ryKGZrAg
         TARqLDVSXJotYRb9z81JCqSLOxVLVqgHq3MRm5Lw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Leon Luo <leonl@leopardimaging.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Petr Cvek <petrcvekcz@gmail.com>
Subject: [PATCH v2 0/9] media: v4l2-subdev: Rename pad config 'try_*' fields
Date:   Fri, 27 Oct 2023 12:16:40 +0300
Message-ID: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series is the result of me getting bothered by the following note
in the documentation of the v4l2_subdev_pad_config structure:

 * Note: This struct is also used in active state, and the 'try' prefix is
 * historical and to be removed.

So I decided to drop the prefix.

Patches 1/9 and 2/9 are small preliminary cleanups that have been posted
separately to the list. I have included them in this v2 as the other
patches depend on them.

Patch 3/9 drops usage of the pad config 'try_*' fields from the
microchip-isc driver by dropping dead code. It has also been posted
separately to the list, and is a dependency for 9/9.

Patches 4/9 to 8/9 then replace direct usage of the fields in drivers with
the corresponding accessor functions. There was a relatively large
number of them in sensor drivers (in 8/9), but more worryingly, the
atmel-isi (4/9) and tegra-video (7/9) should really not have messed up
with creating a v4l2_subdev_pad_config structure manually. It would be
nice if the maintainers of those drivers could address the issue.

Finally, patch 9/9 renames the fields, which becomes easy after
addressing all the drivers.

The patches have been compile-tested only.

The series is based on "[PATCH v4 0/9] Unify sub-device state access
functions" ([1]).

[1] https://lore.kernel.org/linux-media/20231026070329.948847-1-sakari.ailus@linux.intel.com

Laurent Pinchart (9):
  media: v4l2-subdev: Fix indentation in v4l2-subdev.h
  media: v4l2-subdev: Drop outdated comment for v4l2_subdev_pad_config
  media: microchip-isc: Remove dead code in pipeline validation
  media: atmel-isi: Use accessors for pad config 'try_*' fields
  media: atmel-isc: Use accessors for pad config 'try_*' fields
  media: atomisp: Use accessors for pad config 'try_*' fields
  media: tegra-video: Use accessors for pad config 'try_*' fields
  media: i2c: Use accessors for pad config 'try_*' fields
  media: v4l2-subdev: Rename pad config 'try_*' fields

 drivers/media/i2c/adv7183.c                   |  2 +-
 drivers/media/i2c/imx274.c                    | 12 +++---
 drivers/media/i2c/mt9m001.c                   |  2 +-
 drivers/media/i2c/mt9m111.c                   |  2 +-
 drivers/media/i2c/mt9t112.c                   |  2 +-
 drivers/media/i2c/mt9v011.c                   |  2 +-
 drivers/media/i2c/mt9v111.c                   |  2 +-
 drivers/media/i2c/ov2640.c                    |  2 +-
 drivers/media/i2c/ov2680.c                    |  4 +-
 drivers/media/i2c/ov6650.c                    | 34 +++++++++-------
 drivers/media/i2c/ov772x.c                    |  2 +-
 drivers/media/i2c/ov9640.c                    |  2 +-
 drivers/media/i2c/rj54n1cb0c.c                |  2 +-
 drivers/media/i2c/saa6752hs.c                 |  2 +-
 drivers/media/i2c/tw9910.c                    |  2 +-
 drivers/media/platform/atmel/atmel-isi.c      | 13 ++++---
 .../platform/microchip/microchip-isc-base.c   | 39 -------------------
 drivers/media/v4l2-core/v4l2-subdev.c         |  6 +--
 .../media/atomisp/i2c/atomisp-gc2235.c        |  2 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  2 +-
 .../media/atomisp/i2c/atomisp-ov2722.c        |  2 +-
 .../staging/media/atomisp/pci/atomisp_tpg.c   |  2 +-
 .../media/deprecated/atmel/atmel-isc-base.c   | 10 +++--
 drivers/staging/media/tegra-video/vi.c        | 14 ++++---
 include/media/v4l2-subdev.h                   | 19 +++------
 include/uapi/linux/v4l2-subdev.h              |  2 +-
 26 files changed, 77 insertions(+), 108 deletions(-)

-- 
Regards,

Laurent Pinchart

