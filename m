Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849A62EAEC4
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbhAEPhi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:37:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727620AbhAEPhi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:37:38 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 635551BD4;
        Tue,  5 Jan 2021 16:30:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860611;
        bh=uqGY8piEOLsxl/4Bsc+7EwQKR5pJ/YNC9omoxUPsd7E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q6t1jLskzMsNAr8DjQTo5qF/RqC8yxRdg13mgKLcxofQwpaJC7pCkyc+duwq8mGK9
         MJezOyOdEgAYw+DQsuWs414l/ZMrLFU3lFWhRw8dSOcPRR3xgFG5ASHZQBwRk9BPkA
         dIBhBNCNs4zWETgjKmQ9l9j/DBG1t8OrHEZkp6xg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 51/75] media: imx: imx7-media-csi: Don't double-enable the RxFIFO
Date:   Tue,  5 Jan 2021 17:28:28 +0200
Message-Id: <20210105152852.5733-52-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RxFIFO is enabled by imx7_csi_dmareq_rff_enable() in both
imx7_csi_init() and imx7_csi_enable(). Enabling it once is enough,
remove the former.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 31d26d7c3cfb..d826ac45f52d 100644
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

