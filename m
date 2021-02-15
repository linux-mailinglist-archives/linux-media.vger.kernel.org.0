Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921FD31B4BE
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbhBOEhY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:37:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhBOEhV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:37:21 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57D1D1AD3;
        Mon, 15 Feb 2021 05:28:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363330;
        bh=jO1FPVlIU1uZkPfFuAXmolHvIRTn9V46LrpG15zbo38=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gp+PqvvpO9pXQJMQ4kjQDDIV7Ym1acfVi7peF6Yw6A9dW6O0hWl4AgGKaRfEBv13+
         Tyk0FvJcoiT0PSvKcLCJ6ItCHqMhp3QS7gszmzlJT7xjj25Gdg1Hm69GbPcNFKrmDn
         QyKipbmV9PNGuHNfj9H2pcYHoYtUMw1zBdVxQm9c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 51/77] media: imx: imx7-media-csi: Don't double-enable the CSI
Date:   Mon, 15 Feb 2021 06:27:15 +0200
Message-Id: <20210215042741.28850-52-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI is enabled at the end of imx7_csi_sw_reset(), called from
imx7_csi_enable(), as well as at the end of imx7_csi_enable(). The
latter is enough, remove the former.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index fb09af335edf..ed389928fa4e 100644
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

