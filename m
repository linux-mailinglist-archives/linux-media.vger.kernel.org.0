Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89563C3C40
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 18:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389025AbfJAQuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 12:50:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43460 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfJAQue (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 12:50:34 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:113f:a6c2::a6f9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CBBD128EC32;
        Tue,  1 Oct 2019 17:50:32 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH 1/3] media: vimc: initialize vim entity pointers to NULL
Date:   Tue,  1 Oct 2019 18:50:20 +0200
Message-Id: <20191001165022.16263-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001165022.16263-1-dafna.hirschfeld@collabora.com>
References: <20191001165022.16263-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

since NULL value for vimc entity pointer indicates
that entity creation failed and this is tested, the
pointers should be initialized to NULL.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 6e3e5c91ae39..32a79e578b78 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -160,19 +160,17 @@ static int vimc_create_links(struct vimc_device *vimc)
 static int vimc_add_subdevs(struct vimc_device *vimc)
 {
 	unsigned int i;
-	struct vimc_ent_device *ved;
 
 	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
 		dev_dbg(&vimc->pdev.dev, "new entity for %s\n",
 			vimc->pipe_cfg->ents[i].name);
-		ved = vimc->pipe_cfg->ents[i].add(vimc,
+		vimc->ent_devs[i] = vimc->pipe_cfg->ents[i].add(vimc,
 					vimc->pipe_cfg->ents[i].name);
-		if (!ved) {
+		if (!vimc->ent_devs[i]) {
 			dev_err(&vimc->pdev.dev, "add new entity for %s\n",
 				vimc->pipe_cfg->ents[i].name);
 			return -EINVAL;
 		}
-		vimc->ent_devs[i] = ved;
 	}
 	return 0;
 }
@@ -199,7 +197,7 @@ static int vimc_register_devices(struct vimc_device *vimc)
 	}
 
 	/* allocate ent_devs */
-	vimc->ent_devs = kmalloc_array(vimc->pipe_cfg->num_ents,
+	vimc->ent_devs = kcalloc(vimc->pipe_cfg->num_ents,
 				       sizeof(*vimc->ent_devs),
 				       GFP_KERNEL);
 	if (!vimc->ent_devs)
-- 
2.20.1

