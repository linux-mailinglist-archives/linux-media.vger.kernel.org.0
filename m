Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1FDF1F8B91
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgFOABA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728141AbgFOAA7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:59 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FCBA197A;
        Mon, 15 Jun 2020 02:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179228;
        bh=gxNBGrfyHIPO68Vpv1sUfnjnOavyaRggAkBipeJcm2s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=joqJDJChrtoMGpqYHPi9G9zMIMFseoRUg1TUjrsk+MPld3i0fO/D1N+yAi/bMTEEH
         lExzPYqDjnxVbGtdJ5FcpsGr+9vJSKBqkocTAh1yGaEg2YXqKnZzg809vK5cYjRf3l
         c8wYhp3qQtIv3fKtUf0guVSIsUCL78P0Cqw9yT08=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 041/107] media: ti-vpe: cal: Use a loop to create CAMERARX and context instances
Date:   Mon, 15 Jun 2020 02:58:38 +0300
Message-Id: <20200614235944.17716-42-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace a manually unrolled loop with an explicit for loop to increase
readability when creating the CAMERARX and context instances. The
explicit NULL initialization of cal->phy[] and cal->ctx[] is removed, as
the cal structure is zeroed when allocated.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e353b1b0f6f9..681e846eb236 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2347,24 +2347,15 @@ static int cal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, cal);
 
-	cal->phy[0] = cal_camerarx_create(cal, 0);
-	if (IS_ERR(cal->phy[0]))
-		return PTR_ERR(cal->phy[0]);
-
-	if (cal_data_get_num_csi2_phy(cal) > 1) {
-		cal->phy[1] = cal_camerarx_create(cal, 1);
-		if (IS_ERR(cal->phy[1]))
-			return PTR_ERR(cal->phy[1]);
-	} else {
-		cal->phy[1] = NULL;
+	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
+		cal->phy[i] = cal_camerarx_create(cal, i);
+		if (IS_ERR(cal->phy[i]))
+			return PTR_ERR(cal->phy[i]);
 	}
 
-	cal->ctx[0] = NULL;
-	cal->ctx[1] = NULL;
+	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i)
+		cal->ctx[i] = cal_create_instance(cal, i);
 
-	cal->ctx[0] = cal_create_instance(cal, 0);
-	if (cal_data_get_num_csi2_phy(cal) > 1)
-		cal->ctx[1] = cal_create_instance(cal, 1);
 	if (!cal->ctx[0] && !cal->ctx[1]) {
 		cal_err(cal, "Neither port is configured, no point in staying up\n");
 		return -ENODEV;
-- 
Regards,

Laurent Pinchart

