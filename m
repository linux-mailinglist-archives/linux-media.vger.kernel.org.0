Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 177482EAEC3
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbhAEPh3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:37:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbhAEPh2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:37:28 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7E861BD0;
        Tue,  5 Jan 2021 16:30:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860611;
        bh=JkbF7U2NLw2v8PN8RTt5P0ipgKinTg6TYLaW1cOJ+fc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f0LSM0shiYkk7WFyuXNJB733OSMIm4QpOZJqCQTuXmCQ6bJaP+MtvUMornnx/lu27
         87dmNHdctulkQbUZZnzRc3PNIlG4GSn9MsdSKaVfBiO160q+YNoWIKJe2bA+RfqADE
         LxBV32ULS+ai54s4bxa1aBwKRlRj2+2wCy/BdQT0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 50/75] media: imx: imx7-media-csi: Don't double-enable the CSI
Date:   Tue,  5 Jan 2021 17:28:27 +0200
Message-Id: <20210105152852.5733-51-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI is enabled at the end of imx7_csi_sw_reset(), called from
imx7_csi_enable(), as well as at the end of imx7_csi_enable(). The
latter is enough, remove the former.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 85ab733a2c4f..31d26d7c3cfb 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -331,8 +331,6 @@ static void imx7_csi_sw_reset(struct imx7_csi *csi)
 	usleep_range(2000, 3000);
 
 	imx7_csi_irq_clear(csi);
-
-	imx7_csi_hw_enable(csi);
 }
 
 static void imx7_csi_update_buf(struct imx7_csi *csi, dma_addr_t phys,
-- 
Regards,

Laurent Pinchart

