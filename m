Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E11721C56
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2019 19:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfEQRUe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 13:20:34 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49326 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbfEQRUd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 13:20:33 -0400
Received: from localhost.localdomain (unknown [IPv6:2804:431:9718:5766:d14e:219b:d0a:2eb5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C9449281CB5;
        Fri, 17 May 2019 18:20:29 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@collabora.com,
        ezequiel.garcia@collabora.com, andrealmeid@collabora.com,
        Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: vimc: fix component match compare
Date:   Fri, 17 May 2019 14:20:11 -0300
Message-Id: <20190517172011.13257-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the system has other devices being registered in the component
framework, the compare function will be called with a device that
doesn't belong to vimc.
This device is not necessarily a platform_device, nor have a
platform_data (which causes a NULL pointer dereference error) and if it
does have a pdata, it is not necessarily type of struct vimc_platform_data.
So casting to any of these types is wrong.

Instead of expecting a given pdev with a given pdata, just expect for
the device it self. vimc-core is the one who creates them, we know in
advance exactly which object to expect in the match.

Fixes: 4a29b7090749 ("[media] vimc: Subdevices as modules")
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

 drivers/media/platform/vimc/vimc-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 3aa62d7e3d0e..23992affd01f 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -244,10 +244,7 @@ static void vimc_comp_unbind(struct device *master)
 
 static int vimc_comp_compare(struct device *comp, void *data)
 {
-	const struct platform_device *pdev = to_platform_device(comp);
-	const char *name = data;
-
-	return !strcmp(pdev->dev.platform_data, name);
+	return comp == data;
 }
 
 static struct component_match *vimc_add_subdevs(struct vimc_device *vimc)
@@ -277,7 +274,7 @@ static struct component_match *vimc_add_subdevs(struct vimc_device *vimc)
 		}
 
 		component_match_add(&vimc->pdev.dev, &match, vimc_comp_compare,
-				    (void *)vimc->pipe_cfg->ents[i].name);
+				    &vimc->subdevs[i]->dev);
 	}
 
 	return match;
-- 
2.20.1

