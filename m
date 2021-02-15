Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1C031B4BF
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhBOEhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:37:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbhBOEhi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:37:38 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F22AF1AD4;
        Mon, 15 Feb 2021 05:28:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363331;
        bh=cIEbxWs52J8VHoQM48kDVtqrQFGv6QCN5RGYOFiGyMg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cxc7tWy2Gzp1xXl7KKn9BDnrQkhtBD3XgnC1MAhP2y0IWD4GVsS0Oud1RSrvWg/l4
         HEN36RdhGbAMq2J52UAw4RDEuUUWOsjjmJjJTYzRlLSLOJlNqntBjsHTD4m3O8N6e4
         u9j6j/ejS2v/iMjweCcBuO3FQmkvwuqjFt5ORRFs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 52/77] media: imx: imx7-media-csi: Don't double-enable the RxFIFO
Date:   Mon, 15 Feb 2021 06:27:16 +0200
Message-Id: <20210215042741.28850-53-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RxFIFO is enabled by imx7_csi_dmareq_rff_enable() in both
imx7_csi_init() and imx7_csi_enable(). Enabling it once is enough,
remove the former.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index ed389928fa4e..439e4ed8ed10 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -544,7 +544,6 @@ static int imx7_csi_init(struct imx7_csi *csi)
 		return ret;
 
 	imx7_csi_configure(csi);
-	imx7_csi_dmareq_rff_enable(csi);
 
 	ret = imx7_csi_dma_setup(csi);
 	if (ret < 0)
-- 
Regards,

Laurent Pinchart

