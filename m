Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3794E5FD8
	for <lists+linux-media@lfdr.de>; Thu, 24 Mar 2022 09:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348662AbiCXIC6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Mar 2022 04:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348771AbiCXICv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Mar 2022 04:02:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3770199EDB
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 01:01:20 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2B6CFEF;
        Thu, 24 Mar 2022 09:01:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648108877;
        bh=O6M4Cnlxi1ly81MWrJPUej4sEWANfjAAqbG+nSIO4s8=;
        h=From:To:Cc:Subject:Date:From;
        b=NRu606VLSqmwIgzXYAcAGDEMk29L5GujlBuKSLK1CxuiW/DnjKJUrBkrdjiuJRQtw
         mOT6jpsRJ08WBoNN2JrJr4ylc2LfPM0ctQ8DBhEu230+RWwNg9+JoAFz0nmCzmemo/
         4serT4tmrP6t4xkbsc3VlIAuzZZ3sZmIIZyKdMV4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 0/8] v4l: subdev active state
Date:   Thu, 24 Mar 2022 10:00:22 +0200
Message-Id: <20220324080030.216716-1-tomi.valkeinen@ideasonboard.com>
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

v6 of the subdev active state series. v5 can be found from:

https://lore.kernel.org/all/20220301105548.305191-1-tomi.valkeinen@ideasonboard.com/

Changes since v5:

- Fix code-block in docs
- State management wrappers (DEFINE_STATE_WRAPPER). These wrappers will handle
  the cases where the caller does not pass the active state properly.
- Added v4l2_subdev_get_fmt(). This can be used by state-enabled subdev drivers for
  v4l2_subdev_pad_ops.get_fmt.
- Drop the legacy .h file and have v4l2_subdev_call_state_active() in
  v4l2-subdev.h. The macro is now part of the "add subdev state locking" patch
  as it is used there.
- Added v4l2_subdev_get_pad_* helpers. These are temporary helpers to get rid of
  the "try" word. The v4l2_subdev_get_try_* functions should later be renamed and
  these temporary macros dropped.
- Rename v4l2_subdev_get_active_state() to v4l2_subdev_get_unlocked_active_state()
- Fix v4l2_subdev_lock_and_get_active_state() when there is no active state

I have pushed my work/test branch to:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git streams/state-work

It contains this series, ov5640 series from Jacopo, and a some hacks/fixes I
needed. The important part there is the topmost commit: "ov5640: convert to
active state", which shows how a sensor driver can be changed to support active
state.

A few notes about that patch:
- It could perhaps be cleaner if the state was passed around in certain
  functions instead of calling v4l2_subdev_get_locked_active_state() in
  multiple places.
- The driver has a private mutex, which was shared with the control handler. The
  same mutex is now also used for the states. There are not many places where
  the private mutex is used as it were, and those could be converted to just
  lock the active state.
- Only the format is handled via the state. The driver also has some
  crop/selection code, but I wasn't sure how that works.
- ov5640_get_fmt() goes away as we can just use the v4l2_subdev_get_fmt()
- The driver uses the new helper macro to get the format, instead of the "try" version, e.g.
  "fmt = v4l2_subdev_get_pad_format(&sensor->sd, state, 0);" to get the format
  for pad 0 in the given state.

 Tomi

Tomi Valkeinen (8):
  media: subdev: rename subdev-state alloc & free
  media: subdev: add active state to struct v4l2_subdev
  media: subdev: add v4l2_subdev_get_pad_* helpers
  media: subdev: pass also the active state to subdevs from ioctls
  media: subdev: add subdev state locking
  media: subdev: add locking wrappers to subdev op wrappers
  media: subdev: add v4l2_subdev_get_fmt() helper function
  media: Documentation: add documentation about subdev state

 .../driver-api/media/v4l2-subdev.rst          |  75 ++++++
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |   9 +-
 .../media/platform/renesas/vsp1/vsp1_entity.c |  10 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 194 ++++++++++++---
 drivers/staging/media/tegra-video/vi.c        |  10 +-
 include/media/v4l2-subdev.h                   | 220 +++++++++++++++++-
 6 files changed, 480 insertions(+), 38 deletions(-)

-- 
2.25.1

