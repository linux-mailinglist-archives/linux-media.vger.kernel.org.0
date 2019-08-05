Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 825FA815D2
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 11:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbfHEJsd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 05:48:33 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51458 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEJsd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 05:48:33 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C64F2289CE9;
        Mon,  5 Aug 2019 10:48:30 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [RFC PATCH 0/5] media: v4l2: Add m2m codec helpers
Date:   Mon,  5 Aug 2019 11:48:22 +0200
Message-Id: <20190805094827.11205-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series is an attempt at factorizing some of the boiler plate
code that we find in most stateless codec drivers (and potentially
stateful codec ones too). It's been designed mostly based on the hantro
and cedrus driver and I decided to implement a third one using these
helpers to prove that they can be used more widely.

Those helpers are rather basic, and we could probably extend them (or
add new ones) to further simplify codec drivers, but with those in place
we already have a good level of code re-usability without forcing anyone
to use them if they feel they need things to be done differently.

Note that the H264 codec lib should soon see addition of helpers to
create the P/B0/B1 reflists (which are needed by both the hantro and
rockchip drivers), but I'd like the uAPI discussion on how to support
interlaced content to take place before providing generic helpers for
that.

I'd appreciate some feedback on patches 1-4. Patch 5 is here to show
how those helpers can be used and has dependencies on various H264 that
are still being discussed [1][2], so expect some kbuild failure reports.

Thanks,

Boris

[1]https://patchwork.kernel.org/patch/11004013/
[2]https://patchwork.kernel.org/project/linux-media/list/?series=129567

Boris Brezillon (5):
  media: vb2: Add a helper to get the vb2 buffer attached to a request
  media: v4l2: Prepare things for addition of m2m codec helpers
  media: v4l2: Add m2m codec helpers
  media: v4l2: Provide helpers for H264 codecs
  media: rockchip: Add the rkvdec driver

 .../media/common/videobuf2/videobuf2-core.c   |   23 +
 drivers/media/v4l2-core/Kconfig               |    9 +
 drivers/media/v4l2-core/Makefile              |    3 +
 drivers/media/v4l2-core/v4l2-mem2mem-codec.c  | 1170 +++++++++++++++++
 .../{v4l2-mem2mem.c => v4l2-mem2mem-core.c}   |    0
 .../media/v4l2-core/v4l2-mem2mem-h264-codec.c |   47 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/rockchip/Kconfig        |   16 +
 drivers/staging/media/rockchip/Makefile       |    2 +
 drivers/staging/media/rockchip/vdec/Kconfig   |   16 +
 drivers/staging/media/rockchip/vdec/Makefile  |    3 +
 .../staging/media/rockchip/vdec/rkvdec-h264.c |  909 +++++++++++++
 .../staging/media/rockchip/vdec/rkvdec-regs.h |  305 +++++
 drivers/staging/media/rockchip/vdec/rkvdec.c  |  564 ++++++++
 drivers/staging/media/rockchip/vdec/rkvdec.h  |   94 ++
 include/media/v4l2-mem2mem-codec.h            |  317 +++++
 include/media/v4l2-mem2mem-h264-codec.h       |  100 ++
 include/media/videobuf2-core.h                |   11 +
 19 files changed, 3592 insertions(+)
 create mode 100644 drivers/media/v4l2-core/v4l2-mem2mem-codec.c
 rename drivers/media/v4l2-core/{v4l2-mem2mem.c => v4l2-mem2mem-core.c} (100%)
 create mode 100644 drivers/media/v4l2-core/v4l2-mem2mem-h264-codec.c
 create mode 100644 drivers/staging/media/rockchip/Kconfig
 create mode 100644 drivers/staging/media/rockchip/Makefile
 create mode 100644 drivers/staging/media/rockchip/vdec/Kconfig
 create mode 100644 drivers/staging/media/rockchip/vdec/Makefile
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec-h264.c
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec-regs.h
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec.c
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec.h
 create mode 100644 include/media/v4l2-mem2mem-codec.h
 create mode 100644 include/media/v4l2-mem2mem-h264-codec.h

-- 
2.21.0

