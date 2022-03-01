Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6959F4C8A10
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 11:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbiCAK4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 05:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbiCAK4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 05:56:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C708B6F4
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 02:56:10 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D40D6478;
        Tue,  1 Mar 2022 11:56:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646132168;
        bh=LcQBMHvC1dZ7sS8zXZ3huo+nAVHp6GgWRfT8NwRPtVk=;
        h=From:To:Cc:Subject:Date:From;
        b=lGOS12KqcuAq727meT/YUT0IOHzYxHXemq4YSjygHueehWPHSKbYGCM/aPvOJBLVh
         wwZ/iblSUH/Kir5gJmV5+hj9J36UJ/xkNe2L5ARzUk0rKNot6yVRANzjn28o2bH/V4
         +HBDyaaCBTJ/e+IGm7QA/3pSf5Jga01ljdJFB4bM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 0/6] v4l: subdev active state
Date:   Tue,  1 Mar 2022 12:55:42 +0200
Message-Id: <20220301105548.305191-1-tomi.valkeinen@ideasonboard.com>
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

This is v5 of the subdev active state series. The v4 can be found from:

https://lore.kernel.org/all/20220216130049.508664-1-tomi.valkeinen@ideasonboard.com/

Changes since v4:

- Move v4l2_subdev_call_state_active() to a new header file, include/media/v4l2-subdev-legacy.h
- Rename v4l2_subdev_lock_active_state to v4l2_subdev_lock_and_get_active_state
- Inline v4l2_subdev_lock_and_get_active_state, v4l2_subdev_lock_state, v4l2_subdev_unlock_state
- Minor doc updates
- Drop v4l2_subdev_lock_and_return_state patch

 Tomi

Tomi Valkeinen (6):
  media: subdev: rename subdev-state alloc & free
  media: subdev: add active state to struct v4l2_subdev
  media: subdev: pass also the active state to subdevs from ioctls
  media: subdev: add subdev state locking
  media: subdev: add v4l2_subdev_call_state_active()
  media: Documentation: add documentation about subdev state

 .../driver-api/media/v4l2-subdev.rst          |  75 ++++++++
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |   9 +-
 drivers/media/platform/vsp1/vsp1_entity.c     |  10 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 137 ++++++++++++---
 drivers/staging/media/tegra-video/vi.c        |  10 +-
 include/media/v4l2-subdev-legacy.h            |  42 +++++
 include/media/v4l2-subdev.h                   | 163 +++++++++++++++++-
 7 files changed, 415 insertions(+), 31 deletions(-)
 create mode 100644 include/media/v4l2-subdev-legacy.h

-- 
2.25.1

