Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636B664A2FC
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 15:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbiLLOQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 09:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbiLLOQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 09:16:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A679E0C4
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 06:16:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9531D6CF;
        Mon, 12 Dec 2022 15:16:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670854583;
        bh=rMCQDDqJ29D7fduNOR4Yry3uOYhyWUf5tF2b5M0aRoE=;
        h=From:To:Cc:Subject:Date:From;
        b=nQcIxBTa7f77sVuf2P2iOOKj2wui8hEds2WemLAZg65H0m+xL0jxLJFjP41qvTYYI
         95yi1fb7w/asx832nM779nf8AQGPuwbSRA3lVdX1Tt63SMnsQQledpeqtHYk9gLr0n
         lGUthxK9IW8kHbskvs5MLjtZ+A1Yk1V+mDkMEOtI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v1 0/5] media: Replace media graph walk in several drivers
Date:   Mon, 12 Dec 2022 16:16:16 +0200
Message-Id: <20221212141621.724-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
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

Hello,

This patch series replaces the media graph walk API usage in several
drivers with iteration over entities or pads stored in the
media_pipeline object. Iteration over the constructed pipeline is more
efficient, and will support the V4L2 stream API correctly.

Patches 1/5 and 2/5 start by adding two macros to iterate over pads and
entities in a pipeline. Patch 2/5 also marks the media graph walk API as
deprecated as a result. Patches 3/5 to 5/5 then use the new iterators in
three drivers (omap3isp, omap4iss and xilinx).

With this series applied, only two drivers still use the media graph
walk API: exynos4-is and vsp1. Those are more difficult to address. I
plan to work on the vsp1 driver, but not on exynos4-is as I miss
knowledge of the code base and have no hardware to test changes on.
Volunteers would be appreciated :-)

Laurent Pinchart (5):
  media: mc: entity: Add pad iterator for media_pipeline
  media: mc: entity: Add entity iterator for media_pipeline
  media: ti: omap3isp: Use media_pipeline_for_each_entity()
  media: ti: omap4iss: Use media_pipeline_for_each_entity()
  media: xilinx: dma: Use media_pipeline_for_each_pad()

 drivers/media/mc/mc-entity.c                  | 55 +++++++++++
 drivers/media/platform/ti/omap3isp/ispvideo.c | 21 +---
 drivers/media/platform/xilinx/xilinx-dma.c    | 28 ++----
 drivers/staging/media/omap4iss/iss_video.c    | 56 +++--------
 include/media/media-entity.h                  | 98 +++++++++++++++++++
 5 files changed, 177 insertions(+), 81 deletions(-)


base-commit: 3178804c64ef7c8c87a53cd5bba0b2942dd64fec
-- 
Regards,

Laurent Pinchart

