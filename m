Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9527CE432
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfJGNuK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:50:10 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58390 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfJGNuJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:50:09 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id E1B5A28D6F4
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v3 1/5] media: vimc: initialize vim entity pointers to NULL
Date:   Mon,  7 Oct 2019 15:49:59 +0200
Message-Id: <20191007135003.28287-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
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
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/media/platform/vimc/vimc-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 6e3e5c91ae39..b8add4087652 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -199,9 +199,8 @@ static int vimc_register_devices(struct vimc_device *vimc)
 	}
 
 	/* allocate ent_devs */
-	vimc->ent_devs = kmalloc_array(vimc->pipe_cfg->num_ents,
-				       sizeof(*vimc->ent_devs),
-				       GFP_KERNEL);
+	vimc->ent_devs = kcalloc(vimc->pipe_cfg->num_ents,
+				 sizeof(*vimc->ent_devs), GFP_KERNEL);
 	if (!vimc->ent_devs)
 		goto err_v4l2_unregister;
 
-- 
2.20.1

