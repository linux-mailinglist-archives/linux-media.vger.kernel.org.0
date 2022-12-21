Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E93FA652E9E
	for <lists+linux-media@lfdr.de>; Wed, 21 Dec 2022 10:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234491AbiLUJd6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Dec 2022 04:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiLUJds (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Dec 2022 04:33:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CB9205D8
        for <linux-media@vger.kernel.org>; Wed, 21 Dec 2022 01:33:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB89FFB;
        Wed, 21 Dec 2022 10:33:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671615226;
        bh=to2i1K+zkcI5Nzz7gP4rdL6g7mF95kJgqqUZmfa6OsQ=;
        h=From:To:Cc:Subject:Date:From;
        b=pyl99xLs5oA09TjnTXucObhCuxebHaZ9dK66cXOWsaEDftOkMX+bo+RM3Vj1Ud0eY
         4gmb1PlfC6EjqF32RQiaIXX//kW/DDjlEE4GxZXVTPq4UerAL3miKpJlg6JIKzeHZB
         KipiPET6OCvP7Ta9lczYoQbHIYZmvnlVjzdPug9I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 0/5] media: Replace media graph walk in several drivers
Date:   Wed, 21 Dec 2022 11:33:36 +0200
Message-Id: <20221221093341.7580-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
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

Compared to v2, this version fixes compilation errors in the omap3isp
and omap4iss drivers (no idea how those crept in, I would have sworn I
had compile-tested everything).

With this series applied, only two drivers still use the media graph
walk API: exynos4-is and vsp1. Those are more difficult to address. I
plan to work on the vsp1 driver, but not on exynos4-is as I miss
knowledge of the code base and have no hardware to test changes on.
As with v1, volunteers would be appreciated :-)

Laurent Pinchart (5):
  media: mc: entity: Add pad iterator for media_pipeline
  media: mc: entity: Add entity iterator for media_pipeline
  media: ti: omap3isp: Use media_pipeline_for_each_entity()
  media: ti: omap4iss: Use media_pipeline_for_each_entity()
  media: xilinx: dma: Use media_pipeline_for_each_pad()

 drivers/media/mc/mc-entity.c                  | 55 +++++++++++
 drivers/media/platform/ti/omap3isp/ispvideo.c | 20 ++--
 drivers/media/platform/xilinx/xilinx-dma.c    | 28 ++----
 drivers/staging/media/omap4iss/iss_video.c    | 66 +++++--------
 include/media/media-entity.h                  | 98 +++++++++++++++++++
 5 files changed, 192 insertions(+), 75 deletions(-)


base-commit: d4acfa22b634347be33d5906744366742fccd151
-- 
Regards,

Laurent Pinchart

