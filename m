Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A3D4D3247
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 16:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234081AbiCIP6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 10:58:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234079AbiCIP6e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 10:58:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA56847AE7
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 07:57:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 63BBBB8221C
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 15:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68807C340EF;
        Wed,  9 Mar 2022 15:57:29 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/6] cec: call enable_adap on s_log_addrs
Date:   Wed,  9 Mar 2022 16:57:21 +0100
Message-Id: <20220309155726.1258388-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220309155726.1258388-1-hverkuil-cisco@xs4all.nl>
References: <20220309155726.1258388-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't enable/disable the adapter if the first fh is opened or the
last fh is closed, instead do this when the adapter is configured
or unconfigured.

However, if needs_hpd is true, then do this when the physical
address is set or cleared: in that case the adapter typically is
powered by the HPD, so it really is disabled when the HPD is low.
This case (needs_hpd is true) was already handled in this way, so
this wasn't changed.

The problem with the old behavior was that if the HPD goes low when
no fh is open, and a transmit was in progress, then the adapter would
be disabled, typically stopping the transmit immediately which
leaves a partial message on the bus, which isn't nice and can confuse
some adapters.

It makes much more sense to disable it only when the adapter is
unconfigured, since then you really won't be using it anymore.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 38 ++++++++++++++++++++++++-------
 drivers/media/cec/core/cec-api.c  | 18 +--------------
 2 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 2e12331c12a9..65eae7f3f49b 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1580,24 +1580,24 @@ void __cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
 		/* Disabling monitor all mode should always succeed */
 		if (adap->monitor_all_cnt)
 			WARN_ON(call_op(adap, adap_monitor_all_enable, false));
-		/* serialize adap_enable */
-		mutex_lock(&adap->devnode.lock);
-		if (adap->needs_hpd || list_empty(&adap->devnode.fhs)) {
+		if (adap->needs_hpd) {
+			/* serialize adap_enable */
+			mutex_lock(&adap->devnode.lock);
 			WARN_ON(adap->ops->adap_enable(adap, false));
 			adap->transmit_in_progress = false;
 			wake_up_interruptible(&adap->kthread_waitq);
+			mutex_unlock(&adap->devnode.lock);
 		}
-		mutex_unlock(&adap->devnode.lock);
 		if (phys_addr == CEC_PHYS_ADDR_INVALID)
 			return;
 	}
 
 	/* serialize adap_enable */
 	mutex_lock(&adap->devnode.lock);
-	adap->last_initiator = 0xff;
-	adap->transmit_in_progress = false;
 
-	if (adap->needs_hpd || list_empty(&adap->devnode.fhs)) {
+	if (adap->needs_hpd) {
+		adap->last_initiator = 0xff;
+		adap->transmit_in_progress = false;
 		if (adap->ops->adap_enable(adap, true)) {
 			mutex_unlock(&adap->devnode.lock);
 			return;
@@ -1606,8 +1606,10 @@ void __cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
 
 	if (adap->monitor_all_cnt &&
 	    call_op(adap, adap_monitor_all_enable, true)) {
-		if (adap->needs_hpd || list_empty(&adap->devnode.fhs))
+		if (adap->needs_hpd) {
 			WARN_ON(adap->ops->adap_enable(adap, false));
+			adap->transmit_in_progress = false;
+		}
 		mutex_unlock(&adap->devnode.lock);
 		return;
 	}
@@ -1683,6 +1685,13 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 		adap->log_addrs.osd_name[0] = '\0';
 		adap->log_addrs.vendor_id = CEC_VENDOR_ID_NONE;
 		adap->log_addrs.cec_version = CEC_OP_CEC_VERSION_2_0;
+		if (!adap->needs_hpd) {
+			/* serialize adap_enable */
+			mutex_lock(&adap->devnode.lock);
+			WARN_ON(adap->ops->adap_enable(adap, false));
+			adap->transmit_in_progress = false;
+			mutex_unlock(&adap->devnode.lock);
+		}
 		return 0;
 	}
 
@@ -1816,6 +1825,19 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 		       sizeof(log_addrs->features[i]));
 	}
 
+	if (!adap->needs_hpd) {
+		int ret;
+
+		/* serialize adap_enable */
+		mutex_lock(&adap->devnode.lock);
+		adap->last_initiator = 0xff;
+		adap->transmit_in_progress = false;
+		ret = adap->ops->adap_enable(adap, true);
+		mutex_unlock(&adap->devnode.lock);
+
+		if (ret)
+			return ret;
+	}
 	log_addrs->log_addr_mask = adap->log_addrs.log_addr_mask;
 	adap->log_addrs = *log_addrs;
 	if (adap->phys_addr != CEC_PHYS_ADDR_INVALID)
diff --git a/drivers/media/cec/core/cec-api.c b/drivers/media/cec/core/cec-api.c
index d72ad48c9898..0284db12842b 100644
--- a/drivers/media/cec/core/cec-api.c
+++ b/drivers/media/cec/core/cec-api.c
@@ -586,18 +586,6 @@ static int cec_open(struct inode *inode, struct file *filp)
 		return err;
 	}
 
-	/* serialize adap_enable */
-	mutex_lock(&devnode->lock);
-	if (list_empty(&devnode->fhs) &&
-	    !adap->needs_hpd &&
-	    adap->phys_addr == CEC_PHYS_ADDR_INVALID) {
-		err = adap->ops->adap_enable(adap, true);
-		if (err) {
-			mutex_unlock(&devnode->lock);
-			kfree(fh);
-			return err;
-		}
-	}
 	filp->private_data = fh;
 
 	/* Queue up initial state events */
@@ -625,6 +613,7 @@ static int cec_open(struct inode *inode, struct file *filp)
 	}
 #endif
 
+	mutex_lock(&devnode->lock);
 	mutex_lock(&devnode->lock_fhs);
 	list_add(&fh->list, &devnode->fhs);
 	mutex_unlock(&devnode->lock_fhs);
@@ -656,15 +645,10 @@ static int cec_release(struct inode *inode, struct file *filp)
 		cec_monitor_all_cnt_dec(adap);
 	mutex_unlock(&adap->lock);
 
-	/* serialize adap_enable */
 	mutex_lock(&devnode->lock);
 	mutex_lock(&devnode->lock_fhs);
 	list_del(&fh->list);
 	mutex_unlock(&devnode->lock_fhs);
-	if (cec_is_registered(adap) && list_empty(&devnode->fhs) &&
-	    !adap->needs_hpd && adap->phys_addr == CEC_PHYS_ADDR_INVALID) {
-		WARN_ON(adap->ops->adap_enable(adap, false));
-	}
 	mutex_unlock(&devnode->lock);
 
 	/* Unhook pending transmits from this filehandle. */
-- 
2.34.1

