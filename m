Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40188215E93
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729788AbgGFSiE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729703AbgGFSiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:04 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 105C112BE;
        Mon,  6 Jul 2020 20:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060669;
        bh=nB9QapMmb3480EJq3aRBMkjZ4q70W9gu5ju+z33wcr8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qpG840YPQar2TTMg5J/mEGh5/4hFZ8Zlijis5OsWubWLEcHMf+knEd/HUZ61QzBCc
         Ym8hvAOzTempDia9IyEb0PqhakTt3m3KvLGjDqOSS1RmcP9iLEBOe6Te8eQ0G4T5sP
         7f/xMJHZIrK6yxLCJroz49suaxmLG2R/4G+MhTZA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 035/108] media: ti-vpe: cal: Inline cal_data_get_num_csi2_phy() in its caller
Date:   Mon,  6 Jul 2020 21:35:56 +0300
Message-Id: <20200706183709.12238-36-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_data_get_num_csi2_phy() function simply returns
cal->data->num_csi2_phy, and is not consistently used across the driver,
as most accesses to cal->data->num_csi2_phy are open-coded. We could fix
those open-coded accesses to use cal_data_get_num_csi2_phy(), but that
wouldn't bring much in terms of readability, so inline
cal_data_get_num_csi2_phy() in its only caller instead, and drop the
function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 57d2feabc2e8..5b89d03d1f62 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -494,11 +494,6 @@ static void cal_quickdump_regs(struct cal_dev *cal)
 	}
 }
 
-static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
-{
-	return cal->data->num_csi2_phy;
-}
-
 /* ------------------------------------------------------------------
  *	CAMERARX Management
  * ------------------------------------------------------------------
@@ -2328,7 +2323,7 @@ static int cal_probe(struct platform_device *pdev)
 	if (IS_ERR(cal->phy[0]))
 		return PTR_ERR(cal->phy[0]);
 
-	if (cal_data_get_num_csi2_phy(cal) > 1) {
+	if (cal->data->num_csi2_phy > 1) {
 		cal->phy[1] = cal_camerarx_create(cal, 1);
 		if (IS_ERR(cal->phy[1]))
 			return PTR_ERR(cal->phy[1]);
@@ -2340,7 +2335,7 @@ static int cal_probe(struct platform_device *pdev)
 	cal->ctx[1] = NULL;
 
 	cal->ctx[0] = cal_create_instance(cal, 0);
-	if (cal_data_get_num_csi2_phy(cal) > 1)
+	if (cal->data->num_csi2_phy > 1)
 		cal->ctx[1] = cal_create_instance(cal, 1);
 	if (!cal->ctx[0] && !cal->ctx[1]) {
 		cal_err(cal, "Neither port is configured, no point in staying up\n");
-- 
Regards,

Laurent Pinchart

