Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE002178693
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgCCXnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:08 -0500
Received: from mail-pj1-f51.google.com ([209.85.216.51]:38143 "EHLO
        mail-pj1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbgCCXnI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:08 -0500
Received: by mail-pj1-f51.google.com with SMTP id a16so39408pju.3
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MBjQAwBE6evotQu17DA/nZgkRX6VmALkYbtpzwSjpI4=;
        b=b2ErSXWzLQfwHd5aMCq61OGoq7NErYgJMVJDcRSvBNI9vMm1FAo5K4EQJmnMCGramR
         Hi5CkzJopvCzHly1RFqKEpsZ1bb0cqWERYo6/wocPjYBVZWN+/LVAh1u+J6fQb8uGrZn
         Yp8GBpGDSDa2PnHMi8gH57TTyvV8odyhDQ9vqcOgVt6HHXRxyUFjIEMbotIEC7Ix7CuC
         grMKoFNOzxIRW/sih9GBDyNbgm5omRSrYR0Y1RUEHNNfda+543sm2MdhuymJ5pNxvQ9A
         ZTp2D+SsxvdzMAR/l5KCCCvEzN6qHGs0bWDQEV2nWLERX1zOHQ/eyFqzwPXMKBW+vVKO
         fb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MBjQAwBE6evotQu17DA/nZgkRX6VmALkYbtpzwSjpI4=;
        b=L/DEHU/7hmrJW7ut/Ie/WSmK7bfaPGP7q0I9ZCysU1xPNB5QN9PHC1uMVMNrWzM7q0
         77S5fvhX+ZkfST25r2pKtSePUGJ/E6Ae71wUx5u+kj7IXZljSuBMBsAondTF8pIQQ1EH
         MeTf80qk5SfGv24bwpZWgSoa2MveYoIAUuL3ODbXWrKGiH5Fvw+bsF1frQ1DyEIlgsxS
         hrFGaTpNoGQmiDo03s7R8W6imsCoesTYuye2C9zrkeyg76x/NhQA0nLaOTdPL0U4KED7
         wJ1mJY09WzmGSvYHlewWVjHjRH/msb8Ig9Y8J2hl78Vr0nzmI5xdKZDwWsEe+lFX67Ig
         8EWA==
X-Gm-Message-State: ANhLgQ19C3R7HmpxuDlThOUFrg2H9qwWOpVksZo4XVwXG7+Mx3CouB+H
        SD1fSJnCDRSb8sT4ZnGhAMsIkUPbILU=
X-Google-Smtp-Source: ADFU+vtyW5qWMEKdfPoC3fBmIiX6h9LVmC5oWza5MPmAlr/EdtkSPcdKl+dUYY/e4pdBpvsS13qkQg==
X-Received: by 2002:a17:90a:e795:: with SMTP id iz21mr19546pjb.81.1583278986112;
        Tue, 03 Mar 2020 15:43:06 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:05 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 00/17]  media: imx: Create media links in bound notifiers
Date:   Tue,  3 Mar 2020 15:42:39 -0800
Message-Id: <20200303234256.8928-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move media link creation into the notifier bound callbacks in the
minimum set of subdevices required by imx (imx5/6/7 CSI,
imx6/7 MIPI CSI-2, and video mux).

History:

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


Steve Longerbeam (17):
  media: entity: Pass entity to get_fwnode_pad operation
  media: video-mux: Parse information from firmware without using
    callbacks
  media: imx: Parse information from firmware without using callbacks
  Revert "media: v4l2-fwnode: Add a convenience function for registering
    subdevs with notifiers"
  media: imx: csi: Implement get_fwnode_pad op
  media: imx: mipi csi-2: Implement get_fwnode_pad op
  media: video-mux: Implement get_fwnode_pad op
  media: imx: Add imx_media_create_fwnode_pad_link()
  media: video-mux: Create media links in bound notifier
  media: imx: mipi csi-2: Create media links in bound notifier
  media: imx7: mipi csis: Create media links in bound notifier
  media: imx7: csi: Create media links in bound notifier
  media: imx: csi: Create media links in bound notifier
  media: imx: csi: Lookup upstream endpoint with
    imx_media_get_pad_fwnode
  media: imx: Create missing links from CSI-2 receiver
  media: imx: silence a couple debug messages
  media: imx: TODO: Remove media link creation todos

 drivers/media/mc/mc-entity.c                  |   2 +-
 drivers/media/platform/video-mux.c            | 185 ++++++++++++++++--
 drivers/media/v4l2-core/v4l2-fwnode.c         |  62 ------
 drivers/staging/media/imx/TODO                |  29 ---
 drivers/staging/media/imx/imx-media-csi.c     | 136 ++++++++-----
 .../staging/media/imx/imx-media-dev-common.c  |  50 ++---
 drivers/staging/media/imx/imx-media-dev.c     |   2 +-
 .../staging/media/imx/imx-media-internal-sd.c |   6 +-
 drivers/staging/media/imx/imx-media-of.c      | 114 -----------
 drivers/staging/media/imx/imx-media-utils.c   | 124 ++++++++++++
 drivers/staging/media/imx/imx-media.h         |   9 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    | 119 +++++++++--
 drivers/staging/media/imx/imx7-media-csi.c    | 100 +++++++---
 drivers/staging/media/imx/imx7-mipi-csis.c    | 105 +++++++---
 include/media/media-entity.h                  |   3 +-
 include/media/v4l2-fwnode.h                   |  38 ----
 16 files changed, 654 insertions(+), 430 deletions(-)

-- 
2.17.1

