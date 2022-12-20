Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B19B96522C6
	for <lists+linux-media@lfdr.de>; Tue, 20 Dec 2022 15:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbiLTOhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Dec 2022 09:37:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234098AbiLTOgq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Dec 2022 09:36:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF4BBB4
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 06:36:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBDA14F8;
        Tue, 20 Dec 2022 15:36:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671547004;
        bh=TuZcvhxx4cxId5HF1AYs6LG6gw++2m1JDNOdl4aorzU=;
        h=From:To:Cc:Subject:Date:From;
        b=Qd4jz3MMf1tHz6Sx9HCFl23GOhZJ41fO7cR4UY/kQN0G7VpERizHjI9TO9OYRWd25
         2NqOyhnmwAmPUTq/Hv6Kl+IWOhdnN18iGqAqRBTaZb+zG+9d29Lq96xPu/469z4Syx
         TXl1gKBthbF7dJwyLPCEU+6N39bvSt4U0xbMUovM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 0/5] media: Replace media graph walk in several drivers
Date:   Tue, 20 Dec 2022 16:36:34 +0200
Message-Id: <20221220143639.764-1-laurent.pinchart@ideasonboard.com>
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

Compared to v1, this version fixes issues raised during review.

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
 drivers/staging/media/omap4iss/iss_video.c    | 62 +++++-------
 include/media/media-entity.h                  | 98 +++++++++++++++++++
 5 files changed, 188 insertions(+), 75 deletions(-)

-- 
Regards,

Laurent Pinchart

