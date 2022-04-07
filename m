Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 379664F793D
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 10:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236741AbiDGIRJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 04:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242662AbiDGIRF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 04:17:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0024A1D97EC
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 01:15:05 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BA16499;
        Thu,  7 Apr 2022 10:15:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649319304;
        bh=nTedwhIiJjhFsB3c3D539AA1STWnqf72DKMwXnW+y6s=;
        h=From:To:Cc:Subject:Date:From;
        b=W2AZqX26iOljFzDogRNsjexxClt4EMQ41WBL+SVhfnBcbge3s6VptVSLoKsn4Gxdj
         XVv4tkpFpyUaD7xQ9CaPjDpikvH63wTvhn8OwNyGKe8JsylBIFbt8ql8+u2xLQZORe
         tmSmOyIoRYslzlihij7b1zp1YKrAGmCbUFDBuSCo=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v7 0/8] v4l: subdev active state
Date:   Thu,  7 Apr 2022 11:14:16 +0300
Message-Id: <20220407081424.295870-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

v7 of the subdev active state series. v6 can be found from:

https://lore.kernel.org/all/20220324080030.216716-1-tomi.valkeinen@ideasonboard.com/

Only minor changes since v6:

- Use v4l2_subdev_get_pad_format in v4l2_subdev_get_fmt
- Update doc wrt. using v4l2_subdev_lock_and_return_state
- Rename v4l2_subdev_get_try_* to v4l2_subdev_get_pad_*, and add helper
  macros to keep the old func names working

Hans suggested changing v4l2_subdev_get_fmt() to
v4l2_subdev_pad_op_get_fmt() (or similar). I haven't made that change as
v4l2_subdev_get_fmt() can be used for other purposes than a pad op
function, but I'm not against the change if other people support the
change. It is an easy rename to do later.

 Tomi
 
Tomi Valkeinen (8):
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
 drivers/media/v4l2-core/v4l2-subdev.c         | 194 +++++++++++++--
 drivers/staging/media/tegra-video/vi.c        |  10 +-
 include/media/v4l2-subdev.h                   | 235 +++++++++++++++++-
 6 files changed, 483 insertions(+), 44 deletions(-)

-- 
2.25.1

