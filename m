Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F029EBA15F
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2019 09:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbfIVHlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Sep 2019 03:41:37 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:46320 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727598AbfIVHlh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Sep 2019 03:41:37 -0400
Received: from localhost.localdomain ([93.22.150.25])
        by mwinf5d85 with ME
        id 4XhW210060Z7Li503XhWTo; Sun, 22 Sep 2019 09:41:32 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 22 Sep 2019 09:41:32 +0200
X-ME-IP: 93.22.150.25
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, tglx@linutronix.de,
        gregkh@linuxfoundation.org, kstewart@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] [media] cx88: Fix some error handling path in 'cx8800_initdev()'
Date:   Sun, 22 Sep 2019 09:41:23 +0200
Message-Id: <20190922074123.29124-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A call to 'pci_disable_device()' is missing in the error handling path.
In some cases, a call to 'free_irq()' may also be missing.

Reorder the error handling path, add some new labels and fix the 2 issues
mentionned above.

This way, the error handling path in more in line with 'cx8800_finidev()'
(i.e. the remove function)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
It is likely that this is still incomplete, but at least it should be
better :)
---
 drivers/media/pci/cx88/cx88-video.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index dcc0f02aeb70..b8abcd550604 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1277,7 +1277,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 	core = cx88_core_get(dev->pci);
 	if (!core) {
 		err = -EINVAL;
-		goto fail_free;
+		goto fail_disable;
 	}
 	dev->core = core;
 
@@ -1323,7 +1323,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 				       cc->step, cc->default_value);
 		if (!vc) {
 			err = core->audio_hdl.error;
-			goto fail_core;
+			goto fail_irq;
 		}
 		vc->priv = (void *)cc;
 	}
@@ -1337,7 +1337,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 				       cc->step, cc->default_value);
 		if (!vc) {
 			err = core->video_hdl.error;
-			goto fail_core;
+			goto fail_irq;
 		}
 		vc->priv = (void *)cc;
 		if (vc->id == V4L2_CID_CHROMA_AGC)
@@ -1509,11 +1509,14 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 
 fail_unreg:
 	cx8800_unregister_video(dev);
-	free_irq(pci_dev->irq, dev);
 	mutex_unlock(&core->lock);
+fail_irq:
+	free_irq(pci_dev->irq, dev);
 fail_core:
 	core->v4ldev = NULL;
 	cx88_core_put(core, dev->pci);
+fail_disable:
+	pci_disable_device(pci_dev);
 fail_free:
 	kfree(dev);
 	return err;
-- 
2.20.1

