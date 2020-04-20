Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9AF61AFF3B
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgDTAji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725949AbgDTAji (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:38 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B80FC061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:38 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id ay1so3312213plb.0
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=iQWS73DCcBGodD1uKefx8637Oj9oaLgVMepbCIit4bQ=;
        b=lVabtu682aNtRhwyf9XbOnrh/Y0IvP1CZjzasctjuVXd+Qj8qSdZp94z5cmtS7d2zc
         qyS71FAVnvSARr2jBmuhh5C3QtEGxqnxAOq+L9thg+kIei85UefvyTQ8dWzmPxigKpGJ
         l+ipqWv7v82eHXKjhYappqkpcR9nsatqnQdLI/KYnm3rN+nm51Rtu4xvK8KhSXM8ZKKC
         lA9qni+vewSC/x1a34UCZF7ou6ThxOr1ECgWmeOZP9uSy8jG2tv50HWD9hRR9X0HP0p5
         gSwda7bCxhAZP2SI0JMuJNF/9ow3ptBefVzmc44DwLubopSnhxMBMbKuzW3YoBxlcUw8
         vyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iQWS73DCcBGodD1uKefx8637Oj9oaLgVMepbCIit4bQ=;
        b=g4yJvtU959gPacI/EV91zkpag1L6G2du0h0CKdYpH2pLYJNRF0L319bpZCNkF4i6sj
         E+0T5CA6RJDY1FoIamRIZHG3SyNNUqYpxgl6OtW15Z7VU1F5qxuitkBvgfwQ6F7Lf8m6
         i1LNJ/Z3+K7gZeJ1GasmEoRX33Gjh2lBgjV5OYfJo551gn2ahcf3R0gfUSRzdYck7v8a
         T2RAug/9XBp8FJeYQo9hggHEeoxkrhwHujjUtaJGprI4br1c7oyFPLKR9rICGj6Wi9IA
         IxxvqUAlntPCcBjPbxaoo4QD0pVdsTrr5szQ7GOpvLEoeZ0aPf7cyKIHcmLmqMPUsplR
         SLrg==
X-Gm-Message-State: AGi0PuYSkER6Sxa/66GDfgo02WWvXEky8DjHZsVHMDnz5Mj46X2Z8Y2H
        7oUsT6mtBxpVk6JEZUEwa6maSTvn0cs=
X-Google-Smtp-Source: APiQypIWlj0xR4hUMdrEuxB6AHtUTutRQQDfpXiKesMzXTzPOg/nKilTVEyeWATUVL4neBMH377WwQ==
X-Received: by 2002:a17:90a:290f:: with SMTP id g15mr18411049pjd.93.1587343177049;
        Sun, 19 Apr 2020 17:39:37 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:36 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 00/23] media: imx: Create media links in bound notifiers
Date:   Sun, 19 Apr 2020 17:39:07 -0700
Message-Id: <20200420003930.11463-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move media link creation into the notifier bound callbacks in the
set of subdevices required by imx (imx5/6/7 CSI, imx6/7 MIPI CSI-2
receivers, and video-mux).

Rui, Laurent:

Isn't it true that the imx7 CSI can only ever connect to a CSI mux?
See patch 18/23 which removes imx7_csi_get_upstream_endpoint(), and
19/23.

History:

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


Steve Longerbeam (23):
  media: entity: Pass entity to get_fwnode_pad operation
  media: entity: Modify default behavior of media_entity_get_fwnode_pad
  media: v4l2-subdev: add v4l2_subdev_get_fwnode_pad_default
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

 drivers/media/mc/mc-entity.c                  |  27 ++-
 drivers/media/platform/video-mux.c            |  87 +++++++--
 drivers/media/v4l2-core/v4l2-fwnode.c         |  62 ------
 drivers/media/v4l2-core/v4l2-mc.c             |  95 +++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         |  25 +++
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
 include/media/media-entity.h                  |   9 +-
 include/media/v4l2-fwnode.h                   |  38 ----
 include/media/v4l2-mc.h                       |  48 +++++
 include/media/v4l2-subdev.h                   |  17 ++
 20 files changed, 687 insertions(+), 502 deletions(-)

-- 
2.17.1

