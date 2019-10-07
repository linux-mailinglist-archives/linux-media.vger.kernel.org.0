Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB7CCE433
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfJGNuK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:50:10 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58404 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfJGNuK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:50:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C286F28DFC1
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v3 2/5] media: vimc: cleanup code that assigns entity in entities array
Date:   Mon,  7 Oct 2019 15:50:00 +0200
Message-Id: <20191007135003.28287-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007135003.28287-1-dafna.hirschfeld@collabora.com>
References: <20191007135003.28287-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the add callback returns NULL on failure and the array
is initialized to NULLs, there is no need for the intermediate
assignment to local var.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/media/platform/vimc/vimc-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index b8add4087652..325f55d0d8b3 100644
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
-- 
2.20.1

