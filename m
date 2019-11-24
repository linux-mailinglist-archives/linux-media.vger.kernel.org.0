Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9261D108491
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKXTHP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:15 -0500
Received: from mail-pf1-f182.google.com ([209.85.210.182]:37113 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfKXTHP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:15 -0500
Received: by mail-pf1-f182.google.com with SMTP id p24so6152711pfn.4
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=40X9HjDZm0yK/PQ62L7yUx8rKuu6GOc/1O+kQNF14zU=;
        b=XkfGg/XcSKA5tpbBXJVQqPzwfnFxbt3xoCO+9SO+k8IM031ngMKcG1RgEZs49HtFyo
         d00BfMxOgdorUBkyf39BeB8BxvhvD7zg1P92IIfazNcG92/xnKHG/ujLA+7ZimUAReJr
         /mcarRQecOEnrOShLlnev+1upMazWKhCtXnMmrEdFu9NQjzq2uoGdQO3A1fTqoB9HqoK
         6XPaBP2frphkhCZ0F436SweQEavdclTpkdoaAg1wy6LkT2JO917ppA8NPqtfZLYcCe9n
         egbQ/xjWUum3TUlmIKEwVwEtMeVxVKRx2sKKt8RC0igDP15Mp7kEO7Z9WW/lyTrWdHXR
         eLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=40X9HjDZm0yK/PQ62L7yUx8rKuu6GOc/1O+kQNF14zU=;
        b=p/ygN8UALh5RhGbsCgATtfxpMYqFbyepHaj5p/Ch6Zf/29AjSKTLfF7LZ8MjwfJ8jY
         w2Ve/7tN/B+r6EDlLtsTjdTo5JoiNsZrv+CsmXkkhNJ+gMuiXP2ho3+xC82fg0jlno9o
         /R6LzD3yaIfTLfiJP3157Ck7bxWBXqBwptmFdQyYp0WzNdBB02csv/hMI4bXw0Ymtn7D
         TNYg9ZJ2+ZamFxM2ndlXVvPhWHFmbzWZzxcmyLhlvOW/tnsLfsJhJdjaJ0v9nFV5IrQz
         p/22RQFjhlGwQrbML9Q0acSOZtPcdkOiM7eJd5kTYFu/14HIyg1hcUcB1eVuvr1T7iHN
         uv7A==
X-Gm-Message-State: APjAAAVG+K6CtE1WtAmXgXdAdYYUblIQMwHU1nPv3whCO3Ud3/tBatfw
        KCoc8DZ6mnIiwAaLaudtT/MAllz2LhE=
X-Google-Smtp-Source: APXvYqzZVEU7X3pkMYXXDYd19jSqzXwQNXvHgEsCjwKJJsgsI+WsdHCAIp/6Zj89z6p8aF6cggUjOA==
X-Received: by 2002:a65:46c6:: with SMTP id n6mr27354085pgr.352.1574622433838;
        Sun, 24 Nov 2019 11:07:13 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:13 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 00/23] media: imx: Create media links in bound notifiers
Date:   Sun, 24 Nov 2019 11:06:40 -0800
Message-Id: <20191124190703.12138-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move media link creation into the notifier bound callbacks in the
subdevices required by imx, making use of media_entity_get_fwnode_pad().

In the process, improve the behavior of media_entity_get_fwnode_pad().
The function is also being used inconsistently by current callers, so
that is fixed in this serieas as well.

The default behavior of media_entity_get_fwnode_pad() fails when
the entity has multiple sink and/or source pads. Wrt imx, there are
two such entities: the imx6 csi-2 receiver, and the video mux.

Modify the default behavior of media_entity_get_fwnode_pad() to first
determine if the port number at the provided endpoint firmware node
corresponds to a valid pad for the entity. That way the default behavior
will work for any entities that implement 1:1 mappings, without requiring
they implement the .get_fwnode_pad op.

In other words, the old behavior of media_entity_get_fwnode_pad() required
entities implement .get_fwnode_pad if they have multiple sink or source pads.
The new behavior requires entities implement .get_fwnode_pad only if they
have multiple sink or source pads, and do not have 1:1 port:pad mappings.

Also, as part of the above work, it was discovered that all of the
current callers of media_entity_get_fwnode_pad() are not using that
function in a consistent way. In all but one case the driver passes the
firmware node of the subdevice itself to the function, not one of it
endpoint nodes as the function expects. In more detail:

  - Cadence MIPI-CSI2 Receiver,
  - ST Micro MIPID02 CSI-2,
  - Allwinner V3s CSI,
  - Allwinner A10 CSI,
  - STM32 DCMI:
    These drivers call media_entity_get_fwnode_pad() in the subdev bound
    notifier callback, but passes sd->fwnode to the function. This is
    usually the fwnode of the subdevice itself, not one of its endpoint
    nodes. This only works now because there are no implementations of the
    .get_fwnode_pad op. This will break as soon as the bound subdevice
    implements the .get_fwnode_pad op.

  - Renesas R-Car MIPI CSI-2 Receiver:
    Calls media_entity_get_fwnode_pad() in the subdev bound notifier
    callback. In this case the driver passes the async subdev descriptor
    match fwnode. Again for most subdevices, this is the fwnode of the
    subdevice itself, not one of its endpoint nodes. However on the
    Salvator-X platform, the bound subdevice happens to be the ADV748x
    CSI-2 transmitter, which does indeed place the endpoint node in the
    asd match fwnode. But the problem is that the driver is now making
    assumptions about what subdevices it is binding to.

To resolve the above issues, this series adds a new function
media_create_fwnode_pad_links(), which creates the media links from/to
all pads on a remote entity, to/from a single specific local entity pad,
using the fwnode endpoint connections between them. It's API makes it
convenient to call from subdev bound notifier callbacks.

Another function media_create_fwnode_links() is added that will create
links from/to all pads on a remote entity, to/from all pads on a local
entity. It's API also makes it convenient to call from subdev bound
notifier callbacks, and can be called for entities that link to remote
entities via multiple pads (for example the video-mux which has multiple
sink pads that link to multiple bound subdevices).

This series has been tested on i.MX6Q SabreSD, SabreLite, and SabreAuto
platforms, and the Renesas Salvator-X platform.

The series needs testing on i.MX7, Cadence, ST Micro MIPID02, STM32 DCMI,
and Allwinner V3s and A10 platforms. Testing only needs to verify that the
media graph is unchanged, no stream testing is required. If the media graph
is broken, it means the subdevice(s) that bind to the drivers listed
above need to implement the .get_fwnode_pad op.

History:

v2:
- rename/move the notifier-to-state inlines in imx7-mipi-csis.c and
  imx7-media-csi.c, suggested by Rui Silva.
- rewrite imx_media_create_links() to only add the missing media links
  from the imx6 MIPI CSI-2 receiver.


Steve Longerbeam (23):
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
  media: stm32-dcmi: Fix fwnode media link creation
  media: sunxi: Fix fwnode media link creation
  media: v4l2-fwnode: Pass notifier to
    v4l2_async_register_fwnode_subdev()
  media: video-mux: Create media links in bound notifier
  media: imx: mipi csi-2: Create media links in bound notifier
  media: imx7-mipi-csis: Create media links in bound notifier
  media: imx7-media-csi: Create media links in bound notifier
  media: imx: csi: Implement get_fwnode_pad
  media: imx: csi: Embed notifier in struct csi_priv
  media: imx: csi: Create media links in bound notifier
  media: imx: csi: Lookup upstream endpoint with
    imx_media_get_pad_fwnode
  media: imx: Create missing links from CSI-2 receiver
  media: imx: TODO: Remove media link creation todos

 drivers/base/property.c                       |  63 ++++++
 drivers/media/i2c/adv748x/adv748x-csi2.c      |  21 ++
 drivers/media/i2c/st-mipid02.c                |  20 +-
 drivers/media/mc/mc-entity.c                  | 209 +++++++++++++++++-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  27 +--
 drivers/media/platform/rcar-vin/rcar-csi2.c   |  23 +-
 drivers/media/platform/stm32/stm32-dcmi.c     |  15 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  27 +--
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |   1 -
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  36 +--
 drivers/media/platform/video-mux.c            |  30 ++-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  69 +++---
 drivers/media/v4l2-core/v4l2-fwnode.c         |  50 +----
 drivers/staging/media/imx/TODO                |  29 ---
 drivers/staging/media/imx/imx-media-csi.c     |  92 +++++---
 .../staging/media/imx/imx-media-dev-common.c  |  60 ++---
 drivers/staging/media/imx/imx-media-of.c      | 114 ----------
 drivers/staging/media/imx/imx-media-utils.c   |  33 +++
 drivers/staging/media/imx/imx-media.h         |   5 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  29 ++-
 drivers/staging/media/imx/imx7-media-csi.c    |  55 +++--
 drivers/staging/media/imx/imx7-mipi-csis.c    |  30 ++-
 include/linux/fwnode.h                        |  14 ++
 include/linux/property.h                      |   5 +
 include/media/media-entity.h                  |  99 ++++++++-
 include/media/v4l2-fwnode.h                   |  56 +----
 26 files changed, 735 insertions(+), 477 deletions(-)

-- 
2.17.1

