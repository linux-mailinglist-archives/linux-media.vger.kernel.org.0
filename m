Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6C3E276B
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 02:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408087AbfJXAmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 20:42:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392855AbfJXAmL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 20:42:11 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6DA912E5;
        Thu, 24 Oct 2019 02:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571877727;
        bh=4X0GdekeQgNBZL3HjPkbE1SHO17kf5LmTO+VSCJy/uA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WV85ovrpOGpYuDe/sw+ii/m+gusPXbhFan4pu6an6QlZMFajimU4NKWkY9Ui7encY
         vw/nPBkrQVms82L8MlZa0eSqAxku/CVJHTGw4IaH8H3/bGLj67IRG1ZB41pJt1UvAY
         6iF+SifwsH2TRcy4wBx5BPXw89Je5oTKznQEbTpg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 6/7] media: imx: imx7-media-csi: Remove unneeded register read
Date:   Thu, 24 Oct 2019 03:41:54 +0300
Message-Id: <20191024004155.32068-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx7_csi_dma_reflash() function starts by reading the unrelated
register CSI_CSICR18 to then overwrite the read value with a read from
register CSI_CSICR3. This is likely due to a bad copy&paste, and is not
needed. Remove the extraneous read from register CSI_CSICR18.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index e4c9bcc045f7..ac07f55a63e3 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -292,7 +292,7 @@ static void imx7_csi_hw_disable(struct imx7_csi *csi)
 
 static void imx7_csi_dma_reflash(struct imx7_csi *csi)
 {
-	u32 cr3 = imx7_csi_reg_read(csi, CSI_CSICR18);
+	u32 cr3;
 
 	cr3 = imx7_csi_reg_read(csi, CSI_CSICR3);
 	cr3 |= BIT_DMA_REFLASH_RFF;
-- 
Regards,

Laurent Pinchart

