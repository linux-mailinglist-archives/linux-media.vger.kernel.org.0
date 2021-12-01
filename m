Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF03464E1B
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 13:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349346AbhLAMov (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 07:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244122AbhLAMou (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 07:44:50 -0500
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18EC2C061574;
        Wed,  1 Dec 2021 04:41:28 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id sOvPmchRzf6qjsOvPmEfO4; Wed, 01 Dec 2021 13:41:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638362487; bh=4gA/EuYfCF9/Q9PlRcN5OFE/+NeDyMrPJ5C+K65BD20=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=GjPEWeGGzatN2gno0oCCr6IpSoLXqrP4LRGmYCA41DgdHYwymUndJTn9fKaOLhk6e
         X+HO+eRy3PAAc5s+3FsMS4cBIneiA3MHjJ+e/bwT6b4WBMI9ISZ1ONK2dnuTnugASv
         GBNwGt0ZPsPFvzIZWpieXm6nHaszQE/dOwtG8SmqxtcRtgfFU14fPyDDaz82TpRrCg
         1+uj0WStpTCdJqG1pZhZiSGTlaoPhd8z/kPd927Io0xj0CRFXiUWmwEN0z4fi9CW02
         NXqAsGNytA5abqXbsp2JyobvpRYV8eMTx0uvH/CXGUOAa6wHd/dkZIsaloroM06QIf
         kbhmSXzN/wRYw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Johan Fjeldtvedt <johfjeld@cisco.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, stable@vger.kernel.org
Subject: [PATCH 2/2] cec: fix a deadlock situation
Date:   Wed,  1 Dec 2021 13:41:26 +0100
Message-Id: <20211201124126.3948360-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201124126.3948360-1-hverkuil-cisco@xs4all.nl>
References: <20211201124126.3948360-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cec_devnode struct has a lock meant to serialize access
to the fields of this struct. This lock is taken during
device node (un)registration and when opening or releasing a
filehandle to the device node. When the last open filehandle
is closed the cec adapter might be disabled by calling the
adap_enable driver callback with the devnode.lock held.

However, if during that callback a message or event arrives
then the driver will call one of the cec_queue_event()
variants in cec-adap.c, and those will take the same devnode.lock
to walk the open filehandle list.

This obviously causes a deadlock.

This is quite easy to reproduce with the cec-gpio driver since that
uses the cec-pin framework which generated lots of events and uses
a kernel thread for the processing, so when adap_enable is called
the thread is still running and can generate events.

But I suspect that it might also happen with other drivers if an
interrupt arrives signaling e.g. a received message before adap_enable
had a chance to disable the interrupts.

This patch adds a new mutex to serialize access to the fhs list.
When adap_enable() is called the devnode.lock mutex is held, but
not devnode.lock_fhs. The event functions in cec-adap.c will now
use devnode.lock_fhs instead of devnode.lock, ensuring that it is
safe to call those functions from the adap_enable callback.

This specific issue only happens if the last open filehandle is closed
and the physical address is invalid. This is not something that
happens during normal operation, but it does happen when monitoring
CEC traffic (e.g. cec-ctl --monitor) with an unconfigured CEC adapter.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: <stable@vger.kernel.org>  # for v5.13 and up
---
 drivers/media/cec/core/cec-adap.c | 38 +++++++++++++++++--------------
 drivers/media/cec/core/cec-api.c  |  6 +++++
 drivers/media/cec/core/cec-core.c |  3 +++
 include/media/cec.h               | 11 +++++++--
 4 files changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index da73eb50cce2..857d6b1612c2 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -161,10 +161,10 @@ static void cec_queue_event(struct cec_adapter *adap,
 	u64 ts = ktime_get_ns();
 	struct cec_fh *fh;
 
-	mutex_lock(&adap->devnode.lock);
+	mutex_lock(&adap->devnode.lock_fhs);
 	list_for_each_entry(fh, &adap->devnode.fhs, list)
 		cec_queue_event_fh(fh, ev, ts);
-	mutex_unlock(&adap->devnode.lock);
+	mutex_unlock(&adap->devnode.lock_fhs);
 }
 
 /* Notify userspace that the CEC pin changed state at the given time. */
@@ -178,11 +178,12 @@ void cec_queue_pin_cec_event(struct cec_adapter *adap, bool is_high,
 	};
 	struct cec_fh *fh;
 
-	mutex_lock(&adap->devnode.lock);
-	list_for_each_entry(fh, &adap->devnode.fhs, list)
+	mutex_lock(&adap->devnode.lock_fhs);
+	list_for_each_entry(fh, &adap->devnode.fhs, list) {
 		if (fh->mode_follower == CEC_MODE_MONITOR_PIN)
 			cec_queue_event_fh(fh, &ev, ktime_to_ns(ts));
-	mutex_unlock(&adap->devnode.lock);
+	}
+	mutex_unlock(&adap->devnode.lock_fhs);
 }
 EXPORT_SYMBOL_GPL(cec_queue_pin_cec_event);
 
@@ -195,10 +196,10 @@ void cec_queue_pin_hpd_event(struct cec_adapter *adap, bool is_high, ktime_t ts)
 	};
 	struct cec_fh *fh;
 
-	mutex_lock(&adap->devnode.lock);
+	mutex_lock(&adap->devnode.lock_fhs);
 	list_for_each_entry(fh, &adap->devnode.fhs, list)
 		cec_queue_event_fh(fh, &ev, ktime_to_ns(ts));
-	mutex_unlock(&adap->devnode.lock);
+	mutex_unlock(&adap->devnode.lock_fhs);
 }
 EXPORT_SYMBOL_GPL(cec_queue_pin_hpd_event);
 
@@ -211,10 +212,10 @@ void cec_queue_pin_5v_event(struct cec_adapter *adap, bool is_high, ktime_t ts)
 	};
 	struct cec_fh *fh;
 
-	mutex_lock(&adap->devnode.lock);
+	mutex_lock(&adap->devnode.lock_fhs);
 	list_for_each_entry(fh, &adap->devnode.fhs, list)
 		cec_queue_event_fh(fh, &ev, ktime_to_ns(ts));
-	mutex_unlock(&adap->devnode.lock);
+	mutex_unlock(&adap->devnode.lock_fhs);
 }
 EXPORT_SYMBOL_GPL(cec_queue_pin_5v_event);
 
@@ -286,12 +287,12 @@ static void cec_queue_msg_monitor(struct cec_adapter *adap,
 	u32 monitor_mode = valid_la ? CEC_MODE_MONITOR :
 				      CEC_MODE_MONITOR_ALL;
 
-	mutex_lock(&adap->devnode.lock);
+	mutex_lock(&adap->devnode.lock_fhs);
 	list_for_each_entry(fh, &adap->devnode.fhs, list) {
 		if (fh->mode_follower >= monitor_mode)
 			cec_queue_msg_fh(fh, msg);
 	}
-	mutex_unlock(&adap->devnode.lock);
+	mutex_unlock(&adap->devnode.lock_fhs);
 }
 
 /*
@@ -302,12 +303,12 @@ static void cec_queue_msg_followers(struct cec_adapter *adap,
 {
 	struct cec_fh *fh;
 
-	mutex_lock(&adap->devnode.lock);
+	mutex_lock(&adap->devnode.lock_fhs);
 	list_for_each_entry(fh, &adap->devnode.fhs, list) {
 		if (fh->mode_follower == CEC_MODE_FOLLOWER)
 			cec_queue_msg_fh(fh, msg);
 	}
-	mutex_unlock(&adap->devnode.lock);
+	mutex_unlock(&adap->devnode.lock_fhs);
 }
 
 /* Notify userspace of an adapter state change. */
@@ -1578,6 +1579,7 @@ void __cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
 		/* Disabling monitor all mode should always succeed */
 		if (adap->monitor_all_cnt)
 			WARN_ON(call_op(adap, adap_monitor_all_enable, false));
+		/* serialize adap_enable */
 		mutex_lock(&adap->devnode.lock);
 		if (adap->needs_hpd || list_empty(&adap->devnode.fhs)) {
 			WARN_ON(adap->ops->adap_enable(adap, false));
@@ -1589,14 +1591,16 @@ void __cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
 			return;
 	}
 
+	/* serialize adap_enable */
 	mutex_lock(&adap->devnode.lock);
 	adap->last_initiator = 0xff;
 	adap->transmit_in_progress = false;
 
-	if ((adap->needs_hpd || list_empty(&adap->devnode.fhs)) &&
-	    adap->ops->adap_enable(adap, true)) {
-		mutex_unlock(&adap->devnode.lock);
-		return;
+	if (adap->needs_hpd || list_empty(&adap->devnode.fhs)) {
+		if (adap->ops->adap_enable(adap, true)) {
+			mutex_unlock(&adap->devnode.lock);
+			return;
+		}
 	}
 
 	if (adap->monitor_all_cnt &&
diff --git a/drivers/media/cec/core/cec-api.c b/drivers/media/cec/core/cec-api.c
index 0edb7142afdb..d72ad48c9898 100644
--- a/drivers/media/cec/core/cec-api.c
+++ b/drivers/media/cec/core/cec-api.c
@@ -586,6 +586,7 @@ static int cec_open(struct inode *inode, struct file *filp)
 		return err;
 	}
 
+	/* serialize adap_enable */
 	mutex_lock(&devnode->lock);
 	if (list_empty(&devnode->fhs) &&
 	    !adap->needs_hpd &&
@@ -624,7 +625,9 @@ static int cec_open(struct inode *inode, struct file *filp)
 	}
 #endif
 
+	mutex_lock(&devnode->lock_fhs);
 	list_add(&fh->list, &devnode->fhs);
+	mutex_unlock(&devnode->lock_fhs);
 	mutex_unlock(&devnode->lock);
 
 	return 0;
@@ -653,8 +656,11 @@ static int cec_release(struct inode *inode, struct file *filp)
 		cec_monitor_all_cnt_dec(adap);
 	mutex_unlock(&adap->lock);
 
+	/* serialize adap_enable */
 	mutex_lock(&devnode->lock);
+	mutex_lock(&devnode->lock_fhs);
 	list_del(&fh->list);
+	mutex_unlock(&devnode->lock_fhs);
 	if (cec_is_registered(adap) && list_empty(&devnode->fhs) &&
 	    !adap->needs_hpd && adap->phys_addr == CEC_PHYS_ADDR_INVALID) {
 		WARN_ON(adap->ops->adap_enable(adap, false));
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 551689d371a7..ec67065d5202 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -169,8 +169,10 @@ static void cec_devnode_unregister(struct cec_adapter *adap)
 	devnode->registered = false;
 	devnode->unregistered = true;
 
+	mutex_lock(&devnode->lock_fhs);
 	list_for_each_entry(fh, &devnode->fhs, list)
 		wake_up_interruptible(&fh->wait);
+	mutex_unlock(&devnode->lock_fhs);
 
 	mutex_unlock(&devnode->lock);
 
@@ -272,6 +274,7 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 
 	/* adap->devnode initialization */
 	INIT_LIST_HEAD(&adap->devnode.fhs);
+	mutex_init(&adap->devnode.lock_fhs);
 	mutex_init(&adap->devnode.lock);
 
 	adap->kthread = kthread_run(cec_thread_func, adap, "cec-%s", name);
diff --git a/include/media/cec.h b/include/media/cec.h
index 208c9613c07e..77346f757036 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -26,13 +26,17 @@
  * @dev:	cec device
  * @cdev:	cec character device
  * @minor:	device node minor number
+ * @lock:	lock to serialize open/release and registration
  * @registered:	the device was correctly registered
  * @unregistered: the device was unregistered
+ * @lock_fhs:	lock to control access to @fhs
  * @fhs:	the list of open filehandles (cec_fh)
- * @lock:	lock to control access to this structure
  *
  * This structure represents a cec-related device node.
  *
+ * To add or remove filehandles from @fhs the @lock must be taken first,
+ * followed by @lock_fhs. It is safe to access @fhs if either lock is held.
+ *
  * The @parent is a physical device. It must be set by core or device drivers
  * before registering the node.
  */
@@ -43,10 +47,13 @@ struct cec_devnode {
 
 	/* device info */
 	int minor;
+	/* serialize open/release and registration */
+	struct mutex lock;
 	bool registered;
 	bool unregistered;
+	/* protect access to fhs */
+	struct mutex lock_fhs;
 	struct list_head fhs;
-	struct mutex lock;
 };
 
 struct cec_adapter;
-- 
2.33.0

