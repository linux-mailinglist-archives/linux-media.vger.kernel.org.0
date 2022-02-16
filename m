Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D85164B8859
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 14:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233456AbiBPNBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 08:01:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbiBPNBa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 08:01:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5C22A7942
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 05:01:17 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9619925B;
        Wed, 16 Feb 2022 14:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645016475;
        bh=l/ecgz6N3yIfBhtucFNE9XaoaXLWVWGw1mkTbm6MAro=;
        h=From:To:Cc:Subject:Date:From;
        b=u2oJElYryegCD/BxTFNVUbsYEIZTn61Cc18vhQOOfnoGzV+fHoWG1dcrsPZNRQsRt
         tMnkNe9USBAx+7krGdp8Ix8oC2rBOGYwLnBjTBk2mYkMaMF/YB1/zVpeHisr2xaQHT
         1cQpJ4CR0YGgidfFTMwo6RXrfD+ErOuSX7IwQZQw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 0/7] v4l: subdev active state
Date:   Wed, 16 Feb 2022 15:00:42 +0200
Message-Id: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
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

This is v4 of the subdev active state series. Changes since v3:

- Locking model change: in v3 the subdev's were responsible for locking
  their state. Now the caller of the subdev ops must lock the callee's
  state.
- Add subdev->lock which can be set by the driver. This lock will be
  used for all the states.
- Add v4l2_subdev_call_state_active() helper
- Doc changes wrt. locking

The main change here is the first bullet above. The idea for the change
came up when we realized that we will have race conditions very easily
if the state locking is handled by the subdev itself. It's not rare for
the v4l2-core to need to check, say, the routing of a subdev, and then
call a subdev op (e.g. get_fmt). In the previous version this would have
been accomplished by locking the state, looking at the routing,
unlocking, calling the subdev op, which then would lock again. Now the
v4l2-core can lock the state for the duration of the operation. This
also simplifies driver code nicely.

In the longer time frame we hope that we can improve the locking even
more by locking all the relevant subdev states in the pipeline at the
beginning of the operation. E.g. when the streaming is started the
v4l2-core would lock all the subdev states that are part of that
pipeline before calling s_stream.

I dropped the reviewed-bys from "media: subdev: add subdev state
locking" and "media: subdev: Add v4l2_subdev_lock_and_return_state()" as
their operation changed, and I think they need a fresh review.

I also dropped the "media: subdev: rename v4l2_subdev_pad_config.try_*
fields" just to simplify the series management. It's one of the cleanups
that can be easily done after the dust has settled.

 Tomi

Tomi Valkeinen (7):
  media: subdev: rename subdev-state alloc & free
  media: subdev: add active state to struct v4l2_subdev
  media: subdev: pass also the active state to subdevs from ioctls
  media: subdev: add subdev state locking
  media: subdev: Add v4l2_subdev_lock_and_return_state()
  media: subdev: add v4l2_subdev_call_state_active()
  media: Documentation: add documentation about subdev state

 .../driver-api/media/v4l2-subdev.rst          |  75 ++++++
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |   9 +-
 drivers/media/platform/vsp1/vsp1_entity.c     |  10 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 157 +++++++++++--
 drivers/staging/media/tegra-video/vi.c        |  10 +-
 include/media/v4l2-subdev.h                   | 220 +++++++++++++++++-
 6 files changed, 450 insertions(+), 31 deletions(-)

-- 
2.25.1

