Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65D981312FB
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 14:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgAFNbf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 08:31:35 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:36371 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726382AbgAFNbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jan 2020 08:31:34 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud8.xs4all.net with ESMTPA
        id oSTgivtakFqKBoSTkiLb2d; Mon, 06 Jan 2020 14:31:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578317492; bh=+SIj1dhDX0nnz3bCDLMd4RWVUFTx9v6HdoEMFA3Us3o=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZuqJR7hKC2y7cN9aXHRZGxpYGRLQLXPTc26kZqEguaM94MD8LB+l8Gj69JIkFxN79
         noNXZes8trM7UU9vdlFUhrtyqDl8KYkXv2UFrTrWYVyxRQszd+P1O04MXEtP9PLEWr
         xirhXVqYiNA3N3MxgT11h60IqexJmW7SIrMKdhFr+1PAXoCtdkHodxIXzI7S9X2FZI
         TWuN9kwC8yMJOLfh0g+fdDxQlExd6fCAj57l2PSTkVKQf7l+m58tkmdF5C7UvDx2oA
         2JK8b/IgOsMXXgOqEt9G+D9FLcUtx1Z5AkX8KY88W56CQsovIy2kHsw/Pt/U1gf6Nq
         lHM2WIzlt6m3w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] cec: remove unused functions
Message-ID: <d7d67dcc-e320-93c6-c90b-c8762c7bbdea@xs4all.nl>
Date:   Mon, 6 Jan 2020 14:31:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJuRoPE7l0VoQfgRo5xTfK1SzfR1Ow2lXHV3M9q2FJnKzjEjHLdN9+jzDp+CHqt6kNRja1YauLkT6KIE2TgoXltusaAAZx7rG+tYFdixp+Pl9VSNRPLk
 WsME6+zVtzk7dP0c0J5+3yTDIbDfkDfxlnbUwgZFAh0sz8glkipe08j5W4h/ofV8k0aZQhWgLiQFqQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove several functions that are no longer used now that the
conversion of cec drivers to cec_notifier_conn_(un)register() and
cec_notifier_cec_adap_(un)register() is complete.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
The cec_notifier_cec_adap_unregister call had to be under
#ifdef CONFIG_CEC_NOTIFIER since struct cec_adapter doesn't have
a notifier field if CONFIG_CEC_NOTIFIER is unset.
---
 drivers/media/cec/cec-core.c     | 21 +--------------
 drivers/media/cec/cec-notifier.c | 37 ++-----------------------
 drivers/media/cec/cec-priv.h     |  2 +-
 include/media/cec-notifier.h     | 27 -------------------
 include/media/cec.h              | 46 --------------------------------
 5 files changed, 4 insertions(+), 129 deletions(-)

diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/cec-core.c
index db7adffcdc76..0c52e1bb3910 100644
--- a/drivers/media/cec/cec-core.c
+++ b/drivers/media/cec/cec-core.c
@@ -183,24 +183,6 @@ static void cec_devnode_unregister(struct cec_adapter *adap)
 	put_device(&devnode->dev);
 }

-#ifdef CONFIG_CEC_NOTIFIER
-static void cec_cec_notify(struct cec_adapter *adap, u16 pa)
-{
-	cec_s_phys_addr(adap, pa, false);
-}
-
-void cec_register_cec_notifier(struct cec_adapter *adap,
-			       struct cec_notifier *notifier)
-{
-	if (WARN_ON(!cec_is_registered(adap)))
-		return;
-
-	adap->notifier = notifier;
-	cec_notifier_register(adap->notifier, adap, cec_cec_notify);
-}
-EXPORT_SYMBOL_GPL(cec_register_cec_notifier);
-#endif
-
 #ifdef CONFIG_DEBUG_FS
 static ssize_t cec_error_inj_write(struct file *file,
 	const char __user *ubuf, size_t count, loff_t *ppos)
@@ -416,8 +398,7 @@ void cec_unregister_adapter(struct cec_adapter *adap)
 #endif
 	debugfs_remove_recursive(adap->cec_dir);
 #ifdef CONFIG_CEC_NOTIFIER
-	if (adap->notifier)
-		cec_notifier_unregister(adap->notifier);
+	cec_notifier_cec_adap_unregister(adap->notifier, adap);
 #endif
 	cec_devnode_unregister(adap);
 }
diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
index 7cf42b133dbc..4a841bee5cc2 100644
--- a/drivers/media/cec/cec-notifier.c
+++ b/drivers/media/cec/cec-notifier.c
@@ -25,7 +25,6 @@ struct cec_notifier {
 	struct cec_connector_info conn_info;
 	const char *conn_name;
 	struct cec_adapter *cec_adap;
-	void (*callback)(struct cec_adapter *adap, u16 pa);

 	u16 phys_addr;
 };
@@ -81,13 +80,12 @@ static void cec_notifier_release(struct kref *kref)
 	kfree(n);
 }

-void cec_notifier_put(struct cec_notifier *n)
+static void cec_notifier_put(struct cec_notifier *n)
 {
 	mutex_lock(&cec_notifiers_lock);
 	kref_put(&n->kref, cec_notifier_release);
 	mutex_unlock(&cec_notifiers_lock);
 }
-EXPORT_SYMBOL_GPL(cec_notifier_put);

 struct cec_notifier *
 cec_notifier_conn_register(struct device *hdmi_dev, const char *conn_name,
@@ -162,7 +160,6 @@ void cec_notifier_cec_adap_unregister(struct cec_notifier *n,
 	mutex_lock(&n->lock);
 	adap->notifier = NULL;
 	n->cec_adap = NULL;
-	n->callback = NULL;
 	mutex_unlock(&n->lock);
 	cec_notifier_put(n);
 }
@@ -175,9 +172,7 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)

 	mutex_lock(&n->lock);
 	n->phys_addr = pa;
-	if (n->callback)
-		n->callback(n->cec_adap, n->phys_addr);
-	else if (n->cec_adap)
+	if (n->cec_adap)
 		cec_s_phys_addr(n->cec_adap, n->phys_addr, false);
 	mutex_unlock(&n->lock);
 }
@@ -198,34 +193,6 @@ void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
 }
 EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr_from_edid);

-void cec_notifier_register(struct cec_notifier *n,
-			   struct cec_adapter *adap,
-			   void (*callback)(struct cec_adapter *adap, u16 pa))
-{
-	kref_get(&n->kref);
-	mutex_lock(&n->lock);
-	n->cec_adap = adap;
-	n->callback = callback;
-	n->callback(adap, n->phys_addr);
-	mutex_unlock(&n->lock);
-}
-EXPORT_SYMBOL_GPL(cec_notifier_register);
-
-void cec_notifier_unregister(struct cec_notifier *n)
-{
-	/* Do nothing unless cec_notifier_register was called first */
-	if (!n->callback)
-		return;
-
-	mutex_lock(&n->lock);
-	n->callback = NULL;
-	n->cec_adap->notifier = NULL;
-	n->cec_adap = NULL;
-	mutex_unlock(&n->lock);
-	cec_notifier_put(n);
-}
-EXPORT_SYMBOL_GPL(cec_notifier_unregister);
-
 struct device *cec_notifier_parse_hdmi_phandle(struct device *dev)
 {
 	struct platform_device *hdmi_pdev;
diff --git a/drivers/media/cec/cec-priv.h b/drivers/media/cec/cec-priv.h
index 7bdf855aaecd..9bbd05053d42 100644
--- a/drivers/media/cec/cec-priv.h
+++ b/drivers/media/cec/cec-priv.h
@@ -9,7 +9,7 @@
 #define _CEC_PRIV_H

 #include <linux/cec-funcs.h>
-#include <media/cec.h>
+#include <media/cec-notifier.h>

 #define dprintk(lvl, fmt, arg...)					\
 	do {								\
diff --git a/include/media/cec-notifier.h b/include/media/cec-notifier.h
index 985afea1ee36..139e93be13b0 100644
--- a/include/media/cec-notifier.h
+++ b/include/media/cec-notifier.h
@@ -36,12 +36,6 @@ struct cec_notifier;
 struct cec_notifier *cec_notifier_get_conn(struct device *dev,
 					   const char *conn);

-/**
- * cec_notifier_put - decrease refcount and delete when the refcount reaches 0.
- * @n: notifier
- */
-void cec_notifier_put(struct cec_notifier *n);
-
 /**
  * cec_notifier_conn_register - find or create a new cec_notifier for the given
  * HDMI device and connector tuple.
@@ -138,10 +132,6 @@ static inline struct cec_notifier *cec_notifier_get_conn(struct device *dev,
 	return (struct cec_notifier *)0xdeadfeed;
 }

-static inline void cec_notifier_put(struct cec_notifier *n)
-{
-}
-
 static inline struct cec_notifier *
 cec_notifier_conn_register(struct device *hdmi_dev, const char *conn_name,
 			   const struct cec_connector_info *conn_info)
@@ -183,23 +173,6 @@ static inline struct device *cec_notifier_parse_hdmi_phandle(struct device *dev)

 #endif

-/**
- * cec_notifier_get - find or create a new cec_notifier for the given device.
- * @dev: device that sends the events.
- *
- * If a notifier for device @dev already exists, then increase the refcount
- * and return that notifier.
- *
- * If it doesn't exist, then allocate a new notifier struct and return a
- * pointer to that new struct.
- *
- * Return NULL if the memory could not be allocated.
- */
-static inline struct cec_notifier *cec_notifier_get(struct device *dev)
-{
-	return cec_notifier_get_conn(dev, NULL);
-}
-
 /**
  * cec_notifier_phys_addr_invalidate() - set the physical address to INVALID
  *
diff --git a/include/media/cec.h b/include/media/cec.h
index 0a4f69cc9dd4..972bc8cd4384 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -386,52 +386,6 @@ cec_fill_conn_info_from_drm(struct cec_connector_info *conn_info,

 #endif

-#if IS_REACHABLE(CONFIG_CEC_CORE) && IS_ENABLED(CONFIG_CEC_NOTIFIER)
-
-/**
- * cec_notifier_register - register a callback with the notifier
- * @n: the CEC notifier
- * @adap: the CEC adapter, passed as argument to the callback function
- * @callback: the callback function
- */
-void cec_notifier_register(struct cec_notifier *n,
-			   struct cec_adapter *adap,
-			   void (*callback)(struct cec_adapter *adap, u16 pa));
-
-/**
- * cec_notifier_unregister - unregister the callback from the notifier.
- * @n: the CEC notifier
- */
-void cec_notifier_unregister(struct cec_notifier *n);
-
-/**
- * cec_register_cec_notifier - register the notifier with the cec adapter.
- * @adap: the CEC adapter
- * @notifier: the CEC notifier
- */
-void cec_register_cec_notifier(struct cec_adapter *adap,
-			       struct cec_notifier *notifier);
-
-#else
-
-static inline void
-cec_notifier_register(struct cec_notifier *n,
-		      struct cec_adapter *adap,
-		      void (*callback)(struct cec_adapter *adap, u16 pa))
-{
-}
-
-static inline void cec_notifier_unregister(struct cec_notifier *n)
-{
-}
-
-static inline void cec_register_cec_notifier(struct cec_adapter *adap,
-					     struct cec_notifier *notifier)
-{
-}
-
-#endif
-
 /**
  * cec_phys_addr_invalidate() - set the physical address to INVALID
  *
-- 
2.24.0

