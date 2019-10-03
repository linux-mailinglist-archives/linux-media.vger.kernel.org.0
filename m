Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01ADCC9C9B
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 12:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfJCKpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 06:45:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39410 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728919AbfJCKpH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 06:45:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C7D9F28FA91
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v2 3/5] media: vimc: sensor: register subdevice only after initialization
Date:   Thu,  3 Oct 2019 12:44:07 +0200
Message-Id: <20191003104409.15756-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191003104409.15756-1-dafna.hirschfeld@collabora.com>
References: <20191003104409.15756-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vimc_sen_add function first registers the subdevice and then
calls tpg_alloc. If tpg_alloc fails it unregisters the subdevice
and then frees vsen, this cause double free since the release
callback that follows subdevice unregistration also frees vsen.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/media/platform/vimc/vimc-sensor.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 46dc6a535abe..ee2306c08569 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -358,6 +358,13 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 		goto err_free_vsen;
 	}
 
+	/* Initialize the test pattern generator */
+	tpg_init(&vsen->tpg, vsen->mbus_format.width,
+		 vsen->mbus_format.height);
+	ret = tpg_alloc(&vsen->tpg, VIMC_FRAME_MAX_WIDTH);
+	if (ret)
+		goto err_free_hdl;
+
 	/* Initialize ved and sd */
 	ret = vimc_ent_sd_register(&vsen->ved, &vsen->sd, v4l2_dev,
 				   vcfg_name,
@@ -365,7 +372,7 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 				   (const unsigned long[1]) {MEDIA_PAD_FL_SOURCE},
 				   &vimc_sen_int_ops, &vimc_sen_ops);
 	if (ret)
-		goto err_free_hdl;
+		goto err_free_tpg;
 
 	vsen->ved.process_frame = vimc_sen_process_frame;
 	vsen->dev = &vimc->pdev.dev;
@@ -373,17 +380,10 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 	/* Initialize the frame format */
 	vsen->mbus_format = fmt_default;
 
-	/* Initialize the test pattern generator */
-	tpg_init(&vsen->tpg, vsen->mbus_format.width,
-		 vsen->mbus_format.height);
-	ret = tpg_alloc(&vsen->tpg, VIMC_FRAME_MAX_WIDTH);
-	if (ret)
-		goto err_unregister_ent_sd;
-
 	return &vsen->ved;
 
-err_unregister_ent_sd:
-	vimc_ent_sd_unregister(&vsen->ved,  &vsen->sd);
+err_free_tpg:
+	tpg_free(&vsen->tpg);
 err_free_hdl:
 	v4l2_ctrl_handler_free(&vsen->hdl);
 err_free_vsen:
-- 
2.20.1

