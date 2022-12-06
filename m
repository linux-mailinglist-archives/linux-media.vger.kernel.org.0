Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5DD6444BB
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 14:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbiLFNkP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 08:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLFNkM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 08:40:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA186558;
        Tue,  6 Dec 2022 05:40:10 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DC17480;
        Tue,  6 Dec 2022 14:40:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670334008;
        bh=kJEPxsZ7U4v9mcZEeoBX8iZ0AOSMMJn1V1jTeudehp4=;
        h=From:To:Cc:Subject:Date:From;
        b=O93QTolcIVR9QVlSSTLEiQ/12VixEWIYkAzUxB0yjGlhli8tppcUm5Hpjjvr0kfaO
         cmIcfoJhtqcuoWgecQA/sKJhucirdHrlZhEoCWdezaf4hZWSyHOLq7Ilzx0XBG4wxy
         vto+5UV33v8tRs0I6BUrtliM/bqL82nylyQS2Ijc=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/7] media/drm: renesas: Add new pixel formats
Date:   Tue,  6 Dec 2022 15:39:47 +0200
Message-Id: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
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

 Tomi

Tomi Valkeinen (7):
  media: Add 2-10-10-10 RGB formats
  media: Add Y210, Y212 and Y216 formats
  media: renesas: vsp1: Change V3U to be gen4
  media: renesas: vsp1: Add V4H SoC version
  media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210)
  drm: rcar-du: Bump V3U to gen 4
  drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)

 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         | 24 +++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         | 49 ++++++++++++++-
 .../media/platform/renesas/vsp1/vsp1_drv.c    |  4 +-
 .../media/platform/renesas/vsp1/vsp1_hgo.c    |  4 +-
 .../media/platform/renesas/vsp1/vsp1_lif.c    |  1 +
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 15 +++++
 .../media/platform/renesas/vsp1/vsp1_regs.h   | 25 +++++++-
 .../media/platform/renesas/vsp1/vsp1_rpf.c    | 62 +++++++++++++++++--
 .../media/platform/renesas/vsp1/vsp1_video.c  |  4 +-
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |  4 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  6 ++
 include/uapi/linux/videodev2.h                | 11 ++++
 13 files changed, 193 insertions(+), 18 deletions(-)

-- 
2.34.1

