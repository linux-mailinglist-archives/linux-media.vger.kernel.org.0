Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72F4D827ED
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbfHEXfM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:12 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34062 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728483AbfHEXfM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:12 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so34295647pgc.1
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2019 16:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=VfAA9GgcJjHavFqm1Sw0wyJUTHT9es8MaTD/i51l6AI=;
        b=q+lgjL1XFuaEPyrhh95781zfphjYS0sDgjHTsp9e7YUNmOOSc2mH+IEEPg2+J1H37u
         iu86leCYxLNqkUxOV/4rV3UqgHRSdXweM9ZuzFepkr566WYSVNJMMos6qbzWOnJDusS9
         55rtctmT565V7DT2UyLYlqsMhWyF7kt0rl4MBs0lSxPVQGqxwPQV1fuJmw+T5PCk4fiD
         6dNNE3OT93ywwwEYKYd/wUCfDmWPkm/jWugp44BNfLANJCtxGuJo83p6TjMgCOKWRn/R
         S4QCeTrSLl8FsXaKk1VVeoT7Q0wFGrZgEGQdXeHutD5YiYWCGz9zX3QukEo0p+tlJFeY
         I/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VfAA9GgcJjHavFqm1Sw0wyJUTHT9es8MaTD/i51l6AI=;
        b=YO//J63MAuQJZoFPIvSJT7C8xgLx3MktGzTuqCCvPZHx+9hOd3XDsViCZXVihszx2i
         cDArn1j3BTGqGqvYGSfdlorUyDpkP1zL68E8LwAtKkDMcIrQZ9gOzxTBPHYuU+K65N4m
         ce4FDZNWynmgdKZM3G2MV/TySZM6T0WMGdKM99NlhJ7iAZ/wJ9l/n1yXzVyCFqMrkVIN
         mfl9Jn8wm9d0Gj6KNIDIpDFBrzAp+IwSh6GFuswhowOWCKjLjrv8x63LnQtYL3x6EOTo
         2jBCkSgKDXJ7ndT+QCTtRkNLGoyCYyzVr1xAWajaYqihgfHsuddaYkI7+gad2Tus4mEH
         bDlg==
X-Gm-Message-State: APjAAAV5b1KSbqNUwyyE5wQZj8spxXZJf/ZnLnimhAS4zTUly0RQHX8f
        2cGLzjr1IJUi5HDjTcj6xCUditTX
X-Google-Smtp-Source: APXvYqzeHyj/UhUJczvtPMDpcOV2Yg+ET3Au8ltLogjRbxnD5O5LTHMBbWS1F18kbyr5lZnZVoMzMg==
X-Received: by 2002:aa7:9092:: with SMTP id i18mr507946pfa.101.1565048111343;
        Mon, 05 Aug 2019 16:35:11 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:10 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 00/22] media: imx: Create media links in bound notifiers
Date:   Mon,  5 Aug 2019 16:34:43 -0700
Message-Id: <20190805233505.21167-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series moves media link creation into the notifier bound callbacks
in the subdevices required by imx.

But to support the media graph on imx, a few improvements first needed
to be made to media core.

The default behavior of media_entity_get_fwnode_pad() fails when
the entity has multiple sink and/or source pads. Wrt imx, there are
three such entities: the imx6/7 csi-2 receivers, and the video mux.
All of those however have a 1:1 mapping from port numbers to pad
indeces.

So instead of implementing .get_fwnode_pad op for those entities,
or any other entities now or in the future that have multiple
source/sink pads, it is better to modify the default behavior
of media_entity_get_fwnode_pad() to first determine if the port
number at the provided endpoint firmware node corresponds to a
valid pad for the provided entity. That way the default behavior
will work for such entities that implement 1:1 mappings, without
requiring they implement the .get_fwnode_pad op. In other words,
the old behavior of media_entity_get_fwnode_pad() required entities
implement .get_fwnode_pad if they have multiple sink or source pads.
The new behavior requires entities implement .get_fwnode_pad _only_
if they have multiple sink or source pads, _and_ do not have 1:1
port:pad mappings.

Also, as part of the above work, it was discovered that all of the
current callers of media_entity_get_fwnode_pad() are not using that
function correctly. In all but one case the driver passes the firmware
node of the subdevice itself to the function, not one of its endpoint
nodes as the function expects. In more detail:

  - Cadence MIPI-CSI2 Receiver: Calls media_entity_get_fwnode_pad()
    in the subdev bound notifier callback, but passes sd->fwnode to
    the function. This is usually the fwnode of the subdevice itself,
    not one of its endpoint nodes. This only works now because there
    are no implementations of the .get_fwnode_pad op. This will break
    as soon as the bound subdevice implements the .get_fwnode_pad op.

  - ST Micro MIPID02 CSI-2: Calls media_entity_get_fwnode_pad() in the
    subdev bound notifier callback. Same issue as cadence driver, passes
    sd->fwnode.

  - Allwinner V3s CSI: Calls media_entity_get_fwnode_pad() in the
    completion notifier callback. Same issue as cadence driver, passes
    sd->fwnode.

  - Renesas R-Car MIPI CSI-2 Receiver: Calls media_entity_get_fwnode_pad()
    in the subdev bound notifier callback. In this case the driver passes
    the async subdev descriptor match fwnode. Again for most subdevices,
    this is the fwnode of the subdevice itself, not one of its endpoint
    nodes. However on the Salvator-X platform, the bound subdevice happens
    to be the ADV748x CSI-2 transmitter, which does indeed place the
    endpoint node in the asd match fwnode. But the problem is that the
    driver is now making assumptions about what subdevices it is binding
    to.

To resolve the above issues, this series adds a new function
media_create_fwnode_pad_links(), which creates the media links from/to
all pads on a remote entity, to/from a single specific local entity pad,
using the remote's endpoint fwnodes. It's API makes it convenient to call
from subdev bound notifier callbacks.

Another function media_create_fwnode_links() is added that will create
links from/to all pads on a remote entity, to/from all pads on a local
entity. It's API also makes it convenient to call from subdev bound
notifier callbacks, and can be called for entities that link to remote
entities via multiple pads (for example the video-mux which has multiple
sink pads that link to multiple bound subdevices).

This series has been tested on i.MX6 SabreSD, SabreLite, and SabreAuto
platforms, and the Renesas Salvator-X platform.

The series needs testing on i.MX7, Cadence, ST Micro MIPID02, and
Allwinner V3s platforms. Testing only needs to verify that the media
graph is unchanged, no stream testing is required. If the media graph
is broken, it means the subdevice(s) that bind to the drivers listed
above need to implement the .get_fwnode_pad op.


Steve Longerbeam (22):
  media: entity: Pass entity to get_fwnode_pad operation
  media: entity: Modify default behavior of media_entity_get_fwnode_pad
  media: entity: Convert media_entity_get_fwnode_pad() args to const
  media: Move v4l2_fwnode_parse_link from v4l2 to driver base
  media: entity: Add functions to convert fwnode endpoints to media
    links
  media: adv748x: csi2: Implement get_fwnode_pad
  media: rcar-csi2: Fix fwnode media link creation
  media: cadence: csi2rx: Fix fwnode media link creation
  media: sun6i: Fix fwnode media link creation
  media: st-mipid02: Fix fwnode media link creation
  media: v4l2-fwnode: Pass notifier to
    v4l2_async_register_fwnode_subdev()
  media: video-mux: Create media links in bound notifier
  media: imx: mipi csi-2: Create media links in bound notifier
  media: imx7-mipi-csis: Create media links in bound notifier
  media: imx7-media-csi: Create media links in bound notifier
  media: imx: csi: Implement get_fwnode_pad
  media: imx: csi: Embed notifier in struct csi_priv
  media: imx: csi: Create media links in bound notifier
  media: imx: csi: Lookup endpoint fwnode with
    media_entity_get_fwnode_pad
  media: imx: Add is_ipu_internal_subdev()
  media: imx: Use media_create_fwnode_links for external links
  media: imx: TODO: Remove issues regarding media link creation

 drivers/base/property.c                       |  63 ++++++
 drivers/media/i2c/adv748x/adv748x-csi2.c      |  21 ++
 drivers/media/i2c/st-mipid02.c                |  20 +-
 drivers/media/mc/mc-entity.c                  | 209 +++++++++++++++++-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  27 +--
 drivers/media/platform/rcar-vin/rcar-csi2.c   |  23 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  36 +--
 drivers/media/platform/video-mux.c            |  30 ++-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  69 +++---
 drivers/media/v4l2-core/v4l2-fwnode.c         |  50 +----
 drivers/staging/media/imx/TODO                |  29 ---
 drivers/staging/media/imx/imx-media-csi.c     |  92 +++++---
 .../staging/media/imx/imx-media-dev-common.c  |  49 ++--
 drivers/staging/media/imx/imx-media-of.c      | 114 ----------
 drivers/staging/media/imx/imx-media-utils.c   |  33 +++
 drivers/staging/media/imx/imx-media.h         |  13 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  29 ++-
 drivers/staging/media/imx/imx7-media-csi.c    |  54 +++--
 drivers/staging/media/imx/imx7-mipi-csis.c    |  30 ++-
 include/linux/fwnode.h                        |  14 ++
 include/linux/property.h                      |   5 +
 include/media/media-entity.h                  |  99 ++++++++-
 include/media/v4l2-fwnode.h                   |  56 +----
 23 files changed, 721 insertions(+), 444 deletions(-)

-- 
2.17.1

