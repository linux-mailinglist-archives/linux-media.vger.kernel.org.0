Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD7B54AC564
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 17:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239305AbiBGQUy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 11:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387107AbiBGQL2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 11:11:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD882C0401CC
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 08:11:27 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5610B340;
        Mon,  7 Feb 2022 17:11:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644250284;
        bh=zYD+ZbJr7xWXhhJkky32537TJfI8AR73bYZB7X21nPI=;
        h=From:To:Cc:Subject:Date:From;
        b=XgmWQ6uduQsVmy9dLvyWEm3kn1Yz5pBiWwal6jeAt1MjXOe0vWAu2tto4mw/nPJ02
         3yBtzVuIFDyHleSJXDHJyXXb/4dTT4Et0Mc5jGOSM01OiRXYRfxPwGcnQLol5yt0G8
         UJuhyHMDAYS4YSk9pZqdtaWlCJI0O/R3cTJfE+HY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 0/7] v4l: subdev active state
Date:   Mon,  7 Feb 2022 18:11:00 +0200
Message-Id: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is v3 of the subdev active state series. Changes since v2:

- Doc improvements
- Allow state->lock to be set by the driver (similarly to v4l2_ctrl_handler)
- Rename fields in 'struct v4l2_subdev_pad_config' and drop the try_ prefix.
- Add v4l2_subdev_get_locked_active_state(), which calls lockdep_assert_locked() and returns the state.
- Changed v4l2_subdev_get_active_state() to call lockdep_assert_not_locked()

The idea with the v4l2_subdev_get_active_state /
v4l2_subdev_get_locked_active_state change is to have a lockdep_assert
called. Roughly I think there are two cases where the
v4l2_subdev_get_active_state could be called:

- With the intention of just passing it forward to another subdev, in
  which case the state must _not_ be locked. Here
  v4l2_subdev_get_active_state() can be called.

- With the intention of using the state in a case where the state is
  known to be already locked. Here v4l2_subdev_get_locked_active_state()
  can be called.

The state->lock change hopefully solves Sakari's concerns about the
locking between controls and state.

 Tomi

Tomi Valkeinen (7):
  media: subdev: rename subdev-state alloc & free
  media: subdev: add active state to struct v4l2_subdev
  media: subdev: pass also the active state to subdevs from ioctls
  media: subdev: add subdev state locking
  media: subdev: Add v4l2_subdev_lock_and_return_state()
  media: Documentation: add documentation about subdev state
  media: subdev: rename v4l2_subdev_pad_config.try_* fields

 .../driver-api/media/v4l2-subdev.rst          |  60 ++++++
 drivers/media/i2c/adv7183.c                   |   2 +-
 drivers/media/i2c/imx274.c                    |  12 +-
 drivers/media/i2c/mt9m001.c                   |   2 +-
 drivers/media/i2c/mt9m111.c                   |   2 +-
 drivers/media/i2c/mt9t112.c                   |   2 +-
 drivers/media/i2c/mt9v011.c                   |   2 +-
 drivers/media/i2c/mt9v111.c                   |   4 +-
 drivers/media/i2c/ov2640.c                    |   2 +-
 drivers/media/i2c/ov6650.c                    |  18 +-
 drivers/media/i2c/ov772x.c                    |   2 +-
 drivers/media/i2c/ov9640.c                    |   2 +-
 drivers/media/i2c/rj54n1cb0c.c                |   2 +-
 drivers/media/i2c/saa6752hs.c                 |   2 +-
 drivers/media/i2c/sr030pc30.c                 |   2 +-
 drivers/media/i2c/tw9910.c                    |   2 +-
 drivers/media/i2c/vs6624.c                    |   2 +-
 drivers/media/platform/atmel/atmel-isc-base.c |   8 +-
 drivers/media/platform/atmel/atmel-isi.c      |   8 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |   9 +-
 drivers/media/platform/vsp1/vsp1_entity.c     |  10 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 126 +++++++++--
 drivers/staging/media/tegra-video/vi.c        |  10 +-
 include/media/v4l2-subdev.h                   | 201 ++++++++++++++++--
 24 files changed, 415 insertions(+), 77 deletions(-)

-- 
2.25.1

