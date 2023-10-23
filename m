Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1897D41C9
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 23:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjJWVkL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 17:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbjJWVkK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 17:40:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BBFBD
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 14:40:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5D0B2B6;
        Mon, 23 Oct 2023 23:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698097194;
        bh=N8QSvY5lqZKrY0HvDJOQj8ucm6oEn1eMGSEfD7kHpiI=;
        h=From:To:Cc:Subject:Date:From;
        b=H/U1uL3Di4u8dATTNaJ7Oio0Einer16iymlr+St3QLNmNifhdrj8QbkxCS/0WKILo
         OemLZrckG35UQY7Rq53ETYkErcEtAh0/y2rHGhV8GAG5gAy7JThPEDAZC9w16qj5/k
         apom7ecmbbtrNdBgzfFiugf1PyQsfr1G8g9T2UVo=
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
Subject: [PATCH 0/7] media: v4l2-subdev: Rename pad config 'try_*' fields
Date:   Tue, 24 Oct 2023 00:40:04 +0300
Message-ID: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
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

This series is the result of me getting bothered by the following note
in the documentation of the v4l2_subdev_pad_config structure:

 * Note: This struct is also used in active state, and the 'try' prefix is
 * historical and to be removed.

So I decided to drop the prefix.

Patches 1/7 to 6/7 replace direct usage of the fields in drivers with
the corresponding accessor functions. There was a relatively large
number of them in sensor drivers (in 6/7), but more worryingly, the
atmel-isi (1/7), microchip-isc (2/7) and tegra-video (5/7) should really
not have messed up with creating a v4l2_subdev_pad_config structure
manually. I urge the maintainers of those drivers to address the issue.

Finally, patch 7/7 renames the fields, which becomes easy after
addressing all the drivers.

The patches have been compile-tested only.

Sakari, this conflicts with your "[PATCH v3 0/8] Unify sub-device state
access functions" series. I don't mind rebasing on top if it gets merged
first.

Laurent Pinchart (7):
  media: atmel-isi: Use accessors for pad config 'try_*' fields
  media: microchip-isc: Use accessors for pad config 'try_*' fields
  media: atmel-isc: Use accessors for pad config 'try_*' fields
  media: atomisp: Use accessors for pad config 'try_*' fields
  media: tegra-video: Use accessors for pad config 'try_*' fields
  media: i2c: Use accessors for pad config 'try_*' fields
  media: v4l2-subdev: Rename pad config 'try_*' fields

 drivers/media/i2c/adv7183.c                   |  2 +-
 drivers/media/i2c/imx274.c                    | 12 +++----
 drivers/media/i2c/mt9m001.c                   |  2 +-
 drivers/media/i2c/mt9m111.c                   |  2 +-
 drivers/media/i2c/mt9t112.c                   |  2 +-
 drivers/media/i2c/mt9v011.c                   |  2 +-
 drivers/media/i2c/mt9v111.c                   |  2 +-
 drivers/media/i2c/ov2640.c                    |  2 +-
 drivers/media/i2c/ov2680.c                    |  4 +--
 drivers/media/i2c/ov6650.c                    | 34 ++++++++++++-------
 drivers/media/i2c/ov772x.c                    |  2 +-
 drivers/media/i2c/ov9640.c                    |  2 +-
 drivers/media/i2c/rj54n1cb0c.c                |  2 +-
 drivers/media/i2c/saa6752hs.c                 |  2 +-
 drivers/media/i2c/tw9910.c                    |  2 +-
 drivers/media/platform/atmel/atmel-isi.c      | 12 ++++---
 .../platform/microchip/microchip-isc-base.c   | 10 +++---
 .../media/atomisp/i2c/atomisp-gc2235.c        |  2 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  2 +-
 .../media/atomisp/i2c/atomisp-ov2722.c        |  2 +-
 .../staging/media/atomisp/pci/atomisp_tpg.c   |  2 +-
 .../media/deprecated/atmel/atmel-isc-base.c   | 10 +++---
 drivers/staging/media/tegra-video/vi.c        | 14 ++++----
 include/media/v4l2-subdev.h                   | 33 ++++++++----------
 24 files changed, 87 insertions(+), 74 deletions(-)


base-commit: 94e27fbeca27d8c772fc2bc807730aaee5886055
-- 
Regards,

Laurent Pinchart

