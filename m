Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2424A155419
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 10:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgBGJAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 04:00:07 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50436 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgBGJAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Feb 2020 04:00:07 -0500
Received: from localhost.localdomain (p200300CB87166A00301E621E2266094E.dip0.t-ipconnect.de [IPv6:2003:cb:8716:6a00:301e:621e:2266:94e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 634CF295A84;
        Fri,  7 Feb 2020 09:00:05 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: [PATCH 1/4] media: staging: rkisp1: change function to return void instead of int
Date:   Fri,  7 Feb 2020 09:59:48 +0100
Message-Id: <20200207085951.5226-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200207085951.5226-1-dafna.hirschfeld@collabora.com>
References: <20200207085951.5226-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are functions that return int but actually return always 0.
Change them to return void and then there is no need to check
for error return value.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-isp.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 2b0513e826fe..56bd95d01f65 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -504,7 +504,7 @@ static int rkisp1_config_cif(struct rkisp1_device *rkisp1)
 	return 0;
 }
 
-static int rkisp1_isp_stop(struct rkisp1_device *rkisp1)
+static void rkisp1_isp_stop(struct rkisp1_device *rkisp1)
 {
 	u32 val;
 
@@ -540,8 +540,6 @@ static int rkisp1_isp_stop(struct rkisp1_device *rkisp1)
 		     RKISP1_CIF_IRCL_MIPI_SW_RST | RKISP1_CIF_IRCL_ISP_SW_RST,
 		     RKISP1_CIF_IRCL);
 	rkisp1_write(rkisp1, 0x0, RKISP1_CIF_IRCL);
-
-	return 0;
 }
 
 static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
@@ -555,7 +553,7 @@ static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
 	rkisp1_write(rkisp1, val, RKISP1_CIF_ICCL);
 }
 
-static int rkisp1_isp_start(struct rkisp1_device *rkisp1)
+static void rkisp1_isp_start(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_sensor_async *sensor = rkisp1->active_sensor;
 	u32 val;
@@ -580,8 +578,6 @@ static int rkisp1_isp_start(struct rkisp1_device *rkisp1)
 	 * the MIPI interface and before starting the sensor output.
 	 */
 	usleep_range(1000, 1200);
-
-	return 0;
 }
 
 /* ----------------------------------------------------------------------------
@@ -956,9 +952,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	if (!enable) {
-		ret = rkisp1_isp_stop(rkisp1);
-		if (ret)
-			return ret;
+		rkisp1_isp_stop(rkisp1);
 		rkisp1_mipi_csi2_stop(rkisp1->active_sensor);
 		return 0;
 	}
@@ -981,9 +975,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	if (ret)
 		return ret;
 
-	ret = rkisp1_isp_start(rkisp1);
-	if (ret)
-		rkisp1_mipi_csi2_stop(rkisp1->active_sensor);
+	rkisp1_isp_start(rkisp1);
 
 	return ret;
 }
-- 
2.17.1

