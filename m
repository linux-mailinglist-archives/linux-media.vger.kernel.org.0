Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6D91C1B58
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729018AbgEARQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728495AbgEARQD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:03 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5368CC061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:03 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d184so1837472pfd.4
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/Fn25ljEeyuUUlHrCPw5+IwPgowYEkRRKMRuP134CBM=;
        b=kFvFSmmMHJdjYyd5jXbN3AwwkrbQSoxMXhY6t0vQdNwqmSXazIif9q9CHsXacQodnu
         MjJCKyjVBOED4WTyH6MIoJUdNaYPlIYCYRjmGtF/wsVdUjNkC0zFrjJCu4y5Zvk8DJWJ
         N1Bt2grHkOmlBv7bOCQ8tCPBqZjffOiXD9GAdZEV8Y/HqKnR5GPDG7CHjObyo9a6WOpV
         wsAbqVsAp5p9wa7rKbal8ubAlGmX4GY338hODn4bImahaCNyefX+94VtU0g5vlritl3Z
         Nffc9GoZl9d3iaRhS7nHOfFGdIBXCsdp+0cY/NTv4MYbeaJFHH+zqRbc25dbyLzwofl3
         yvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/Fn25ljEeyuUUlHrCPw5+IwPgowYEkRRKMRuP134CBM=;
        b=YjEEmcYiOLvSSHQkr6m0p8ud7ljqss78WeFMpw6Ck/DVIyIH7WoAZ9sBo64BTAVKch
         XpMPRtJ7uXMFamnNcwad4pO91vvVmFjsvNpKXCxhS8ncS1vzW0VRsGYOpmq3IGW/0q75
         VtVBXYK+SqNiV4JejcSTnx3alpbNv1cWjE+zkHxD4CeZgSXLGYGk5M56i+8/ZYc9P0G+
         mDZVDDJZVK7MF2+AU0A4y5pKym0g1MN8UCyoSMTxVJj0VbRlMqTGcly5aASVCN70kzat
         qe+SPB51LE7UYSg/Lps2A1s9G/9+LpibudE1r+sZF7fc3aeISJqBXK5Yi6guIsMx/s9k
         QGQw==
X-Gm-Message-State: AGi0Pub1Fc4Gm5mb5XCFI/TbtiMtQn3BMAMqYLVdqccXa55qYz6N6m+f
        3RIZ9ybN3Rl8Mx+2fEemgW+Tw4vG
X-Google-Smtp-Source: APiQypJzyJlhPinADDpSi+OqfK8qLITCxX8+lJEztCOZ7H8635/hvciA7omSkPy0z8c4frPVKfN4FQ==
X-Received: by 2002:aa7:8b42:: with SMTP id i2mr5297039pfd.21.1588353362189;
        Fri, 01 May 2020 10:16:02 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:01 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 00/22] media: imx: Create media links in bound notifiers
Date:   Fri,  1 May 2020 10:15:34 -0700
Message-Id: <20200501171556.14731-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move media link creation into the notifier bound callbacks in the
set of subdevices required by imx (imx5/6/7 CSI, imx6/7 MIPI CSI-2
receivers, and video-mux).

Rui, Laurent:

AFAICT the i.MX7 CSI can only ever connect to a CSI mux, which really
makes the function imx7_csi_get_upstream_endpoint() unnecessary. See
patches 17/22 and 18/22, and let me know if that makes sense.


History:

v6:
- Renamed v4l2_subdev_get_fwnode_pad_default() to
  v4l2_subdev_get_fwnode_pad_1_to_1().
- Instead of verifying the endpoint itself is owned by the subdevice,
  it's sufficient and more efficient to verify the endpoint's port parent
  is the subdevice, in v4l2_subdev_get_fwnode_pad_1_to_1().
  Suggested by Sakari.
- Dropped patch "media: entity: Modify default behavior of
  media_entity_get_fwnode_pad" again. It's not strictly needed for
  this patchset and can be revisited later.

v5:
- Revived patch "media: entity: Modify default behavior of
  media_entity_get_fwnode_pad" from v2.
- Added a v4l2_subdev_get_fwnode_pad_default, which can be used as
  a subdev's .get_fwnode_pad() operation if the subdev maps fwnode
  port id's and pad indexes 1:1. Used by video-mux, imx6/7 MIPI
  CSI-2 receivers, and imx7 CSI.
- Exported imx_media_create_fwnode_pad_link(s) to v4l2-core as
  v4l2_create_fwnode_links_to_pad() and v4l2_create_fwnode_links().
  Used by the video-mux, imx5/6/7 CSI's, and imx6/7 MIPI CSI-2
  receivers in their bound notifiers.
- Introduced a new group id IMX_MEDIA_GRP_ID_CSI_MUX, the imx6/7 CSI's
  will set the bound subdev grp_id to this if the bound subdev is a
  video mux.
- Removed imx7_csi_get_upstream_endpoint(), replacing with simpler
  code, see above.

v4:
- Removed the endpoint parsing callback APIs from video-mux and imx drivers
  as suggested by Sakari, replacing with endpoint parsing local to the
  drivers and the use of v4l2_async_notifier_add_fwnode_remote_subdev().
  As a result convenience function v4l2_async_register_fwnode_subdev()
  is no longer used and is reverted.

v3:
- The changes to the default behaviour in media_entity_get_fwnode_pad(),
  and the fixes to current media drivers that call it inconsistently, have
  been put-off to another time. Instead this version implements the
  get_fwnode_pad operation where required in the imx and video-mux
  subdevices to make media link creation work correctly. The
  improvements to media_entity_get_fwnode_pad() can wait to another
  patch series.

v2:
- rename/move the notifier-to-state inlines in imx7-mipi-csis.c and
  imx7-media-csi.c, suggested by Rui Silva.
- rewrite imx_media_create_links() to only add the missing media links
  from the imx6 MIPI CSI-2 receiver.


Steve Longerbeam (22):
  media: entity: Pass entity to get_fwnode_pad operation
  media: v4l2-subdev: add v4l2_subdev_get_fwnode_pad_1_to_1
  media: v4l2-mc: add v4l2_create_fwnode_links helpers
  media: video-mux: Parse information from firmware without using
    callbacks
  media: imx: Parse information from firmware without using callbacks
  Revert "media: v4l2-fwnode: Add a convenience function for registering
    subdevs with notifiers"
  media: imx: csi: Implement get_fwnode_pad op
  media: video-mux: Implement get_fwnode_pad op
  media: imx: mipi csi-2: Implement get_fwnode_pad op
  media: imx: imx7-mipi-csis: Implement get_fwnode_pad op
  media: imx: imx7-media-csi: Implement get_fwnode_pad op
  media: video-mux: Create media links in bound notifier
  media: imx: mipi csi-2: Create media links in bound notifier
  media: imx7: mipi csis: Create media links in bound notifier
  media: imx7: csi: Create media links in bound notifier
  media: imx: csi: Create media links in bound notifier
  media: imx7: csi: Remove imx7_csi_get_upstream_endpoint()
  media: imx5/6/7: csi: Mark a bound video mux as a CSI mux
  media: imx: csi: Lookup upstream endpoint with
    imx_media_get_pad_fwnode
  media: imx: Create missing links from CSI-2 receiver
  media: imx: silence a couple debug messages
  media: imx: TODO: Remove media link creation todos

 drivers/media/mc/mc-entity.c                  |   2 +-
 drivers/media/platform/video-mux.c            |  87 +++++++--
 drivers/media/v4l2-core/v4l2-fwnode.c         |  62 ------
 drivers/media/v4l2-core/v4l2-mc.c             |  95 +++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         |  22 +++
 drivers/staging/media/imx/TODO                |  29 ---
 drivers/staging/media/imx/imx-media-csi.c     | 181 +++++++++++-------
 .../staging/media/imx/imx-media-dev-common.c  |  50 ++---
 drivers/staging/media/imx/imx-media-dev.c     |   2 +-
 .../staging/media/imx/imx-media-internal-sd.c |   6 +-
 drivers/staging/media/imx/imx-media-of.c      | 114 -----------
 drivers/staging/media/imx/imx-media-utils.c   |  33 ++++
 drivers/staging/media/imx/imx-media.h         |   6 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  93 +++++++--
 drivers/staging/media/imx/imx7-media-csi.c    | 160 +++++++++-------
 drivers/staging/media/imx/imx7-mipi-csis.c    | 107 ++++++++---
 include/media/media-entity.h                  |   3 +-
 include/media/v4l2-fwnode.h                   |  38 ----
 include/media/v4l2-mc.h                       |  48 +++++
 include/media/v4l2-subdev.h                   |  17 ++
 20 files changed, 660 insertions(+), 495 deletions(-)

-- 
2.17.1

