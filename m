Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273B64FDCDE
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 13:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343778AbiDLKra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 06:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356959AbiDLKpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 06:45:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4285C660
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 02:43:21 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30F9F25B;
        Tue, 12 Apr 2022 11:43:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649756598;
        bh=EKmtFtNFlzdvDcMdIDWj4bm/Y4KUxMjwrHqgvlO0TBM=;
        h=From:To:Cc:Subject:Date:From;
        b=QyPfSnJgoQkAcP2ufNwHrzEIF4h6Ts+x7sYMitIPQVxnzJd5xG+JgvELpLDgOOiYL
         AuWjeZFoKsCxhQrwkjvy+O1m3Za6xz9yyt0ENwwid4wGybWjaJX5uaTB9r+hZiHpAQ
         qpc4U7I+2mCiW/E9NcYKRelmcOlnOj7f8jsb7tuc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v8 00/10] v4l: subdev active state
Date:   Tue, 12 Apr 2022 12:42:39 +0300
Message-Id: <20220412094249.695754-1-tomi.valkeinen@ideasonboard.com>
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

v8 of the active state series. The v7 can be found from:

https://lore.kernel.org/all/20220407081424.295870-1-tomi.valkeinen@ideasonboard.com/

This version fixes the issues when compiling without
CONFIG_MEDIA_CONTROLLER or CONFIG_VIDEO_V4L2_SUBDEV_API.

I've added two small patches in front, which I made while trying to
understand how those two config options are used.

The new state wrappers are now only compiled with
CONFIG_MEDIA_CONTROLLER, and v4l2_subdev_get_fmt() is available only
with CONFIG_VIDEO_V4L2_SUBDEV_API.

To be honest, I'm not quite sure how the active state series and the
streams series should be designed wrt. CONFIG_MEDIA_CONTROLLER and
CONFIG_VIDEO_V4L2_SUBDEV_API, but I think it's probably best to only
allow active state and streams with CONFIG_VIDEO_V4L2_SUBDEV_API.

In theory we could allow active state without
CONFIG_VIDEO_V4L2_SUBDEV_API, but as try state is not available without
CONFIG_VIDEO_V4L2_SUBDEV_API, I fear it would lead to complications.

Also, I would personally just merge CONFIG_MEDIA_CONTROLLER and
CONFIG_VIDEO_V4L2_SUBDEV_API, but perhaps there's a need for the two
config options, in which case I'd just always use
CONFIG_VIDEO_V4L2_SUBDEV_API on v4l2 side.

 Tomi

Tomi Valkeinen (10):
  media: v4l2-subdev: fix #endif comments
  media: v4l2-subdev: drop extra #ifdef
  media: subdev: rename subdev-state alloc & free
  media: subdev: add active state to struct v4l2_subdev
  media: subdev: rename v4l2_subdev_get_pad_* helpers
  media: subdev: pass also the active state to subdevs from ioctls
  media: subdev: add subdev state locking
  media: subdev: add locking wrappers to subdev op wrappers
  media: subdev: add v4l2_subdev_get_fmt() helper function
  media: Documentation: add documentation about subdev state

 .../driver-api/media/v4l2-subdev.rst          |  69 +++++
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |   9 +-
 .../media/platform/renesas/vsp1/vsp1_entity.c |  10 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 214 ++++++++++++---
 drivers/staging/media/tegra-video/vi.c        |  10 +-
 include/media/v4l2-subdev.h                   | 243 +++++++++++++++++-
 6 files changed, 507 insertions(+), 48 deletions(-)

-- 
2.25.1

