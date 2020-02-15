Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3AE160010
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgBOTlo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:41:44 -0500
Received: from mail-pf1-f177.google.com ([209.85.210.177]:40221 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgBOTlo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:41:44 -0500
Received: by mail-pf1-f177.google.com with SMTP id q8so6744673pfh.7
        for <linux-media@vger.kernel.org>; Sat, 15 Feb 2020 11:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cdnGQB0t/nk/77ipT+sANN07Xupa9kqH2zcFCvP+1qg=;
        b=IGuhTRR6us3fFSZTSSOX/bjsupCW4MhEsvHB7B4iLydL0s9hW9obgenV5QyDc5HTc+
         DztbZXZhodOnT699wTHthXe5aAwv+IfqFyBoRFsEKjxh4ssRGdEQo5ytuvVZzCB05oL6
         wwEHxT0A1heGi3zPTe3b/MYnYjE1v00oMged/UQfpt8XgPkPc/YncAR51WP6+VoX2PZS
         LOJFBQkCSAxIYVuuXFq+SrO1a5LpuBsqizGbnwwhUgjQOk5K8kmFOrAi6t1KdpmqfdzJ
         j7Vkq307CdVSKjcXkf+pL9fjaYdAmaujrV9QcOT7CL23eTz1l1139sJA5BHmKnf4hgF3
         QdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cdnGQB0t/nk/77ipT+sANN07Xupa9kqH2zcFCvP+1qg=;
        b=b2/F5OoWipR1C06zjC6N4AH1ZBlnuxOxkMmxohD8yr121d9+zfcy++NPXQPckhtBXv
         aNIC7OrA11Np1xFYthjYaxL0uLuj2f9V0WsdMsSLaPEvvusdJFU+mee52qit33JO3Q3P
         nxpiB/G3DqEqdFjMii5YmlW9puzuQqVa1RXs1DAu5W2kEH/Y8qUKiXaL76n4J1OstmU6
         51GFFnB2K8fuRheGGviZZ/e0srgUN1k+cFs8VCxVuQVeA8GRrZIPDHvppfOvsOWOueE0
         di504XtmuYLUlBRJDBGLpKna+Hn7l/zclwabQmxYbb3gLolysXM0/INc/qZVuwhfhNoO
         Uq+A==
X-Gm-Message-State: APjAAAWQSIgXmzdcH+d5g8MSZwPZaWmgVn3kkI+9aBFJ1GKRtgyHtj+u
        Hlo8KV30ABms/UTBJEkxGPjqQkhQOQQ=
X-Google-Smtp-Source: APXvYqyct6Szv017JGsfC89O4BxKuhoFto7tMh/l3n61OuabJnUA5B++loQwdX56px6F6Xvqp+fKPg==
X-Received: by 2002:a63:5807:: with SMTP id m7mr9214120pgb.83.1581795702908;
        Sat, 15 Feb 2020 11:41:42 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:41:42 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [RESEND PATCH v3 00/17] media: imx: Create media links in bound notifiers
Date:   Sat, 15 Feb 2020 11:41:19 -0800
Message-Id: <20200215194136.10131-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move media link creation into the notifier bound callbacks in the
minimum set of subdevices required by imx (imx5/6/7 CSI,
imx6/7 MIPI CSI-2, and video mux).

History:

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
  media: v4l2-fwnode: Pass notifier to
    v4l2_async_register_fwnode_subdev()
  media: imx: csi: Implement get_fwnode_pad op
  media: imx: mipi csi-2: Implement get_fwnode_pad op
  media: video-mux: Implement get_fwnode_pad op
  media: imx: Add imx_media_create_fwnode_pad_link()
  media: video-mux: Create media links in bound notifier
  media: imx: mipi csi-2: Create media links in bound notifier
  media: imx7-mipi-csis: Create media links in bound notifier
  media: imx7-media-csi: Create media links in bound notifier
  media: imx: csi: Embed notifier in struct csi_priv
  media: imx: csi: Add missing notifier unregister/cleanup
  media: imx: csi: Create media links in bound notifier
  media: imx: csi: Lookup upstream endpoint with
    imx_media_get_pad_fwnode
  media: imx: Create missing links from CSI-2 receiver
  media: imx: silence a couple debug messages
  media: imx: TODO: Remove media link creation todos

 drivers/media/mc/mc-entity.c                  |   2 +-
 drivers/media/platform/video-mux.c            | 129 +++++++++++++++++-
 drivers/media/v4l2-core/v4l2-fwnode.c         |  11 +-
 drivers/staging/media/imx/TODO                |  29 ----
 drivers/staging/media/imx/imx-media-csi.c     |  91 ++++++++----
 .../staging/media/imx/imx-media-dev-common.c  |  50 +++----
 drivers/staging/media/imx/imx-media-dev.c     |   2 +-
 .../staging/media/imx/imx-media-internal-sd.c |   6 +-
 drivers/staging/media/imx/imx-media-of.c      | 114 ----------------
 drivers/staging/media/imx/imx-media-utils.c   | 124 +++++++++++++++++
 drivers/staging/media/imx/imx-media.h         |   9 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  56 +++++++-
 drivers/staging/media/imx/imx7-media-csi.c    |  54 +++++---
 drivers/staging/media/imx/imx7-mipi-csis.c    |  31 ++++-
 include/media/media-entity.h                  |   3 +-
 include/media/v4l2-fwnode.h                   |  12 +-
 16 files changed, 474 insertions(+), 249 deletions(-)

-- 
2.17.1

