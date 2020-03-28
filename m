Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84665196453
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2020 08:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgC1HxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 03:53:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40974 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgC1HxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 03:53:05 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:90b5:2774:1094:333f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 33D14297D7E;
        Sat, 28 Mar 2020 07:53:03 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH 2/5] media: vimc: handle error in vimc_add_subdevs
Date:   Sat, 28 Mar 2020 08:52:51 +0100
Message-Id: <20200328075254.4616-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328075254.4616-1-dafna.hirschfeld@collabora.com>
References: <20200328075254.4616-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case the 'add' callback of an entity fails,
then all other entities should unregister and released.
This should be done inside vimc_add_subdevs so that
the function handles its own failure.

In order to call vimc_unregister_subdevs and vimc_release_subdevs from
vimc_add_subdevs, the order of the function should change.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-core.c | 42 +++++++++++++------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 1f8498837646..dab01cbc31d2 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -160,24 +160,6 @@ static int vimc_create_links(struct vimc_device *vimc)
 	return ret;
 }
 
-static int vimc_add_subdevs(struct vimc_device *vimc)
-{
-	unsigned int i;
-
-	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
-		dev_dbg(vimc->mdev.dev, "new entity for %s\n",
-			vimc->pipe_cfg->ents[i].name);
-		vimc->ent_devs[i] = vimc->pipe_cfg->ents[i].add(vimc,
-					vimc->pipe_cfg->ents[i].name);
-		if (!vimc->ent_devs[i]) {
-			dev_err(vimc->mdev.dev, "add new entity for %s\n",
-				vimc->pipe_cfg->ents[i].name);
-			return -EINVAL;
-		}
-	}
-	return 0;
-}
-
 static void vimc_release_subdevs(struct vimc_device *vimc)
 {
 	unsigned int i;
@@ -196,6 +178,26 @@ static void vimc_unregister_subdevs(struct vimc_device *vimc)
 			vimc->pipe_cfg->ents[i].unregister(vimc->ent_devs[i]);
 }
 
+static int vimc_add_subdevs(struct vimc_device *vimc)
+{
+	unsigned int i;
+
+	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
+		dev_dbg(vimc->mdev.dev, "new entity for %s\n",
+			vimc->pipe_cfg->ents[i].name);
+		vimc->ent_devs[i] = vimc->pipe_cfg->ents[i].add(vimc,
+					vimc->pipe_cfg->ents[i].name);
+		if (!vimc->ent_devs[i]) {
+			dev_err(vimc->mdev.dev, "add new entity for %s\n",
+				vimc->pipe_cfg->ents[i].name);
+			vimc_unregister_subdevs(vimc);
+			vimc_release_subdevs(vimc);
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
 static void vimc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
 {
 	struct vimc_device *vimc =
@@ -229,8 +231,7 @@ static int vimc_register_devices(struct vimc_device *vimc)
 	/* Invoke entity config hooks to initialize and register subdevs */
 	ret = vimc_add_subdevs(vimc);
 	if (ret)
-		/* remove sundevs that got added */
-		goto err_rm_subdevs;
+		goto err_free_ent_devs;
 
 	/* Initialize links */
 	ret = vimc_create_links(vimc);
@@ -261,6 +262,7 @@ static int vimc_register_devices(struct vimc_device *vimc)
 err_rm_subdevs:
 	vimc_unregister_subdevs(vimc);
 	vimc_release_subdevs(vimc);
+err_free_ent_devs:
 	kfree(vimc->ent_devs);
 err_v4l2_unregister:
 	v4l2_device_unregister(&vimc->v4l2_dev);
-- 
2.17.1

