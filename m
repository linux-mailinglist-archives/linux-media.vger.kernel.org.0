Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D69C15235B
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbgBDXtg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:49:36 -0500
Received: from mail-pf1-f179.google.com ([209.85.210.179]:38492 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727562AbgBDXtg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:36 -0500
Received: by mail-pf1-f179.google.com with SMTP id x185so176795pfc.5
        for <linux-media@vger.kernel.org>; Tue, 04 Feb 2020 15:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cdnGQB0t/nk/77ipT+sANN07Xupa9kqH2zcFCvP+1qg=;
        b=X9qSemyEcqwRMVRlsxw1VHKRKRkNrDqmT4FqPFgNpuMgfYa+JpDLMEuskk3VMISaX3
         vo7Kg7/wVXbUopTtxkHb0YmfMO8NzI6LdsD3dQu40DDUK+7MjXuOlrIUszZW6HNsD3QU
         XPz2psdQ1JzllmSXKtRnYdOq+QOyWAnK80gQJG5P8cdqyUxp3tWOvRSHpjWOxuJBiHGe
         5d1CzHuMp74ejv2ZJFU0iG0jTx9i7s2x1ftDU0LqO2KxqH3X2rXFHmFRScstU3e+oZ7m
         Eu0YZPJgiKqLevluQLGJMHZPJ8daG/EeosedzUgB2z6FAx/TLpRgb8LHjQGpjdbuGLRe
         3GNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cdnGQB0t/nk/77ipT+sANN07Xupa9kqH2zcFCvP+1qg=;
        b=Bmm8uUHIS1gNnTtxecST3Ihxv24sZ++EEtRO/XrpPe2cGT1MeliST3RUPnXkPGKWw+
         4SIpwl5uXTkziF4FisddUfP0T4Kf5pFrDTyoseGr+CwxYrN5rQP1Sg1z0Y3U0H9KvQHH
         kPsUoDlH+Ck2MCxv/4FGBMXOBPcLRemmVgYCKNwerKjOtcHgvU8L5Ti0KuAEm7XWPooG
         jmaqBPdWdAYNW8C4LncnfL/69ETi3079ySOMRMGZU7TboiKHD/axrBXbOeHTgTHulqQP
         yLvViWdARjf5O7oWUv1g3s47BuJkPESyN3EYt0qE6pclw53bk3IoU8E7PsUl5HcdWzOT
         L61Q==
X-Gm-Message-State: APjAAAV5ydgI8rQDW1VFk9+qvoA9xS9L2duqaVnU+M02hckuprS2cLlK
        7QvACGxUl/euyikqmJXJaFydPrre
X-Google-Smtp-Source: APXvYqx3nh3Lh/k221n9iK1uPujPj/blLv+pU5056VsL1fc89YyNTeNat3vsT1aB8yNNts1fkNn3ug==
X-Received: by 2002:a63:5809:: with SMTP id m9mr32965503pgb.26.1580860175098;
        Tue, 04 Feb 2020 15:49:35 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:34 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v3 00/17] media: imx: Create media links in bound notifiers
Date:   Tue,  4 Feb 2020 15:49:01 -0800
Message-Id: <20200204234918.20425-1-slongerbeam@gmail.com>
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

