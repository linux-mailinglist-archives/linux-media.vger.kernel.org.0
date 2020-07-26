Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7BA22DEAF
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 13:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgGZLkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 07:40:09 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:32827
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727996AbgGZLj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 07:39:56 -0400
X-IronPort-AV: E=Sophos;i="5.75,398,1589234400"; 
   d="scan'208";a="355309548"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256; 26 Jul 2020 13:39:48 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] [media] tm6000: drop unnecessary list_empty
Date:   Sun, 26 Jul 2020 12:58:31 +0200
Message-Id: <1595761112-11003-7-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

list_for_each_entry is able to handle an empty list.
The only effect of avoiding the loop is not initializing the
index variable.
Drop list_empty tests in cases where these variables are not
used.

Note that list_for_each_entry is defined in terms of list_first_entry,
which indicates that it should not be used on an empty list.  But in
list_for_each_entry, the element obtained by list_first_entry is not
really accessed, only the address of its list_head field is compared
to the address of the list head, so the list_first_entry is safe.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@
expression x,e;
iterator name list_for_each_entry;
statement S;
identifier i;
@@

-if (!(list_empty(x))) {
   list_for_each_entry(i,x,...) S
- }
 ... when != i
? i = e
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/tm6000/tm6000-core.c |   24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/tm6000/tm6000-core.c b/drivers/media/usb/tm6000/tm6000-core.c
index 2c72370..5c8cbc5 100644
--- a/drivers/media/usb/tm6000/tm6000-core.c
+++ b/drivers/media/usb/tm6000/tm6000-core.c
@@ -853,11 +853,9 @@ int tm6000_call_fillbuf(struct tm6000_core *dev, enum tm6000_ops_type type,
 
 	/* FIXME: tm6000_extension_devlist_lock should be a spinlock */
 
-	if (!list_empty(&tm6000_extension_devlist)) {
-		list_for_each_entry(ops, &tm6000_extension_devlist, next) {
-			if (ops->fillbuf && ops->type == type)
-				ops->fillbuf(dev, buf, size);
-		}
+	list_for_each_entry(ops, &tm6000_extension_devlist, next) {
+		if (ops->fillbuf && ops->type == type)
+			ops->fillbuf(dev, buf, size);
 	}
 
 	return 0;
@@ -898,11 +896,9 @@ void tm6000_init_extension(struct tm6000_core *dev)
 	struct tm6000_ops *ops = NULL;
 
 	mutex_lock(&tm6000_devlist_mutex);
-	if (!list_empty(&tm6000_extension_devlist)) {
-		list_for_each_entry(ops, &tm6000_extension_devlist, next) {
-			if (ops->init)
-				ops->init(dev);
-		}
+	list_for_each_entry(ops, &tm6000_extension_devlist, next) {
+		if (ops->init)
+			ops->init(dev);
 	}
 	mutex_unlock(&tm6000_devlist_mutex);
 }
@@ -912,11 +908,9 @@ void tm6000_close_extension(struct tm6000_core *dev)
 	struct tm6000_ops *ops = NULL;
 
 	mutex_lock(&tm6000_devlist_mutex);
-	if (!list_empty(&tm6000_extension_devlist)) {
-		list_for_each_entry(ops, &tm6000_extension_devlist, next) {
-			if (ops->fini)
-				ops->fini(dev);
-		}
+	list_for_each_entry(ops, &tm6000_extension_devlist, next) {
+		if (ops->fini)
+			ops->fini(dev);
 	}
 	mutex_unlock(&tm6000_devlist_mutex);
 }

