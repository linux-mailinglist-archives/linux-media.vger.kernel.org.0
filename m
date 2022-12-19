Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95F3D650CF2
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 15:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbiLSOC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 09:02:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbiLSOCU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 09:02:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD58DFBC;
        Mon, 19 Dec 2022 06:02:19 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BA59825;
        Mon, 19 Dec 2022 15:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671458536;
        bh=EASsHaB3HCt+38NB6UH2V86UEUK/u8pXW1k8aQiyOyk=;
        h=From:To:Cc:Subject:Date:From;
        b=R8JT/EgqRDImmbySzlFUEmjccM+MdMxH8raOBUEZ97wTOsLaLWIWX12jn9czkmkZG
         5OctVotlMb0vbaXnFty1qf8dAVtHh/+A42//AYm1U0C/dRXPiAnnwA8AQunAVQYFgk
         Xpup4CsiAKGS+Hj7yM+h3Qnpt9irg1lxfA5N8G2E=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/7] media/drm: renesas: Add new pixel formats
Date:   Mon, 19 Dec 2022 16:01:32 +0200
Message-Id: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Hi,

These add new pixel formats for Renesas V3U and V4H SoCs.

As the display pipeline is split between DRM and V4L2 components, this
series touches both subsystems. I'm sending all these together to
simplify review. If needed, I can later split this to V4L2 and DRM
parts, of which the V4L2 part needs to be merged first.

Changes in v2:

- Add kernel documentation for the new formats
- Add PACK_CPOS & PACK_CLEN macros for writing to ext_infmt registers
- Fix wrong alpha component values in ext_infmt registers

 Tomi

Tomi Valkeinen (7):
  media: Add 2-10-10-10 RGB formats
  media: Add Y210, Y212 and Y216 formats
  media: renesas: vsp1: Change V3U to be gen4
  media: renesas: vsp1: Add V4H SoC version
  media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210)
  drm: rcar-du: Bump V3U to gen 4
  drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)

 .../media/v4l/pixfmt-packed-yuv.rst           |  44 ++++
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 194 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  24 +++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  49 ++++-
 .../media/platform/renesas/vsp1/vsp1_drv.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_hgo.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_lif.c    |   1 +
 .../media/platform/renesas/vsp1/vsp1_pipe.c   |  15 ++
 .../media/platform/renesas/vsp1/vsp1_regs.h   |  25 ++-
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |  61 +++++-
 .../media/platform/renesas/vsp1/vsp1_video.c  |   4 +-
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |   4 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   6 +
 include/uapi/linux/videodev2.h                |  11 +
 15 files changed, 430 insertions(+), 18 deletions(-)

-- 
2.34.1

