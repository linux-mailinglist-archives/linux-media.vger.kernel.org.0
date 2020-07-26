Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF22C22DEA0
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 13:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgGZLjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 07:39:55 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:32833
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727936AbgGZLjz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 07:39:55 -0400
X-IronPort-AV: E=Sophos;i="5.75,398,1589234400"; 
   d="scan'208";a="355309547"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256; 26 Jul 2020 13:39:48 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] [media] saa7134: drop unnecessary list_empty
Date:   Sun, 26 Jul 2020 12:58:30 +0200
Message-Id: <1595761112-11003-6-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

list_for_each_safe is able to handle an empty list.
The only effect of avoiding the loop is not initializing the
index variable.
Drop list_empty tests in cases where these variables are not
used.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@
expression x,e;
iterator name list_for_each_safe;
statement S;
identifier i,j;
@@

-if (!(list_empty(x))) {
   list_for_each_safe(i,j,x) S
- }
 ... when != i
     when != j
(
  i = e;
|
? j = e;
)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/pci/saa7134/saa7134-core.c |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index e4623ed..5095f25 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -359,14 +359,12 @@ void saa7134_stop_streaming(struct saa7134_dev *dev, struct saa7134_dmaqueue *q)
 	struct saa7134_buf *tmp;
 
 	spin_lock_irqsave(&dev->slock, flags);
-	if (!list_empty(&q->queue)) {
-		list_for_each_safe(pos, n, &q->queue) {
-			 tmp = list_entry(pos, struct saa7134_buf, entry);
-			 vb2_buffer_done(&tmp->vb2.vb2_buf,
-					 VB2_BUF_STATE_ERROR);
-			 list_del(pos);
-			 tmp = NULL;
-		}
+	list_for_each_safe(pos, n, &q->queue) {
+		tmp = list_entry(pos, struct saa7134_buf, entry);
+		vb2_buffer_done(&tmp->vb2.vb2_buf,
+				VB2_BUF_STATE_ERROR);
+		list_del(pos);
+		tmp = NULL;
 	}
 	spin_unlock_irqrestore(&dev->slock, flags);
 	saa7134_buffer_timeout(&q->timeout); /* also calls del_timer(&q->timeout) */

