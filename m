Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537AC2EAEA7
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbhAEPft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:35:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbhAEPft (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:35:49 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F3A11AC1;
        Tue,  5 Jan 2021 16:30:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860600;
        bh=M9nfRylj3Visudaj4YYCpzoivFewk4OPkyR0IllTsg4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Cg7zT2OwSRR+COtJTPH2gUD8HG4WZV901ES7PBvmoMk+zw/GKlAA6lgkFuizvhY3z
         1OTN+z17yexekuMZR+5XFObBPX3oBkISl6WLy2jVeJ4V0F7it1in9rs9zDc7MhymPg
         RyVgGTyrY9/aa3wZz5Hl2cUV7ykPjfdzTU3z6TW0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 39/75] media: imx: imx7-media-csi: Rename imx7_csi_dma_start() to *_setup()
Date:   Tue,  5 Jan 2021 17:28:16 +0200
Message-Id: <20210105152852.5733-40-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx7_csi_dma_start() doesn't start DMA. Rename it to
imx7_csi_dma_setup() to avoid confusion.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index bc45dc5d0275..eb13dfd82def 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -441,7 +441,7 @@ static void imx7_csi_dma_unsetup_vb2_buf(struct imx7_csi *csi,
 	}
 }
 
-static int imx7_csi_dma_start(struct imx7_csi *csi)
+static int imx7_csi_dma_setup(struct imx7_csi *csi)
 {
 	struct imx_media_video_dev *vdev = csi->vdev;
 	int ret;
@@ -614,7 +614,7 @@ static int imx7_csi_streaming_start(struct imx7_csi *csi)
 {
 	int ret;
 
-	ret = imx7_csi_dma_start(csi);
+	ret = imx7_csi_dma_setup(csi);
 	if (ret < 0)
 		return ret;
 
-- 
Regards,

Laurent Pinchart

