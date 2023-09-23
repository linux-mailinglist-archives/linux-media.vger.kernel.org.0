Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62E4D7AC31B
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbjIWPVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbjIWPVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E161193
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65F7C433C7;
        Sat, 23 Sep 2023 15:21:09 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>
Subject: [PATCHv2 00/23] media: fix all string truncate warnings
Date:   Sat, 23 Sep 2023 17:20:44 +0200
Message-Id: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series fixes all string truncate warnings for media drivers.
The first 13 patches have been posted before, the remainder is new.

It's a mix of various techniques, but in the end we are really
just fighting the compiler, and not improving the code.

Anyway, after running my build scripts on this I don't see this
warning anymore.

Regards,

	Hans

Hans Verkuil (23):
  media: allegro-dvt: increase buffer size in msg_type_name()
  media: cadence: increase buffer size in csi2tx_get_resources()
  media: atomisp: ia_ccs_debug.c: increase enable_info buffer
  media: vivid: avoid integer overflow
  media: ipu-bridge: increase sensor_name size
  media: cx18: increase in_workq_name size
  media: rc: ati_remote: increase mouse_name buffer size
  media: cec.h: increase input_phys buffer
  media: renesas-ceu: keep input name simple
  media: zoran: increase name size
  media: v4l2-dev.h: increase struct video_device name size
  media: v4l2-subdev.h: increase struct v4l2_subdev name size
  media: use sizeof() instead of V4L2_SUBDEV_NAME_SIZE
  media: v4l2-device.h: drop V4L2_DEVICE_NAME_SIZE
  media: vivid: use VIVID_MODULE_NAME to fill bus_info
  media: microchip: don't set bus_info
  media: rcar_drif: use explicit name for bus_info
  media: am437x: don't fill in bus_info
  media: atmel: drop bus_info
  media: radio-isa: use dev_name to fill in bus_info
  media: radio-miropcm20: set bus_info to explicit name
  media: verisilicon: replace snprintf with strscpy+strlcat
  media: radio-si476x: don't fill in bus_info

 drivers/media/i2c/msp3400-driver.c                          | 2 +-
 drivers/media/pci/cx18/cx18-driver.h                        | 2 +-
 drivers/media/pci/zoran/zoran.h                             | 2 +-
 drivers/media/platform/allegro-dvt/allegro-mail.c           | 2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c                | 4 ++--
 drivers/media/platform/cadence/cdns-csi2tx.c                | 6 +++---
 drivers/media/platform/microchip/microchip-isc-base.c       | 6 ------
 drivers/media/platform/renesas/rcar-isp.c                   | 2 +-
 drivers/media/platform/renesas/rcar-vin/rcar-csi2.c         | 2 +-
 drivers/media/platform/renesas/rcar_drif.c                  | 3 +--
 drivers/media/platform/renesas/renesas-ceu.c                | 6 +-----
 drivers/media/platform/ti/am437x/am437x-vpfe.c              | 4 ----
 drivers/media/platform/ti/omap3isp/ispstat.c                | 2 +-
 drivers/media/platform/verisilicon/hantro_drv.c             | 5 +++--
 drivers/media/radio/radio-isa.c                             | 2 +-
 drivers/media/radio/radio-miropcm20.c                       | 4 +---
 drivers/media/radio/radio-si476x.c                          | 4 +---
 drivers/media/rc/ati_remote.c                               | 2 +-
 drivers/media/test-drivers/vivid/vivid-core.c               | 2 +-
 drivers/media/test-drivers/vivid/vivid-rds-gen.c            | 2 +-
 .../media/atomisp/pci/runtime/debug/src/ia_css_debug.c      | 2 +-
 drivers/staging/media/deprecated/atmel/atmel-isc-base.c     | 4 ----
 drivers/staging/media/omap4iss/iss_csi2.c                   | 2 +-
 drivers/staging/media/tegra-video/csi.c                     | 4 ++--
 drivers/staging/media/tegra-video/vip.c                     | 2 +-
 include/media/cec.h                                         | 2 +-
 include/media/ipu-bridge.h                                  | 2 +-
 include/media/v4l2-dev.h                                    | 2 +-
 include/media/v4l2-device.h                                 | 4 +---
 include/media/v4l2-subdev.h                                 | 4 +---
 30 files changed, 33 insertions(+), 59 deletions(-)

-- 
2.40.1

