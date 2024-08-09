Return-Path: <linux-media+bounces-16043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DC194CBF2
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 10:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84AFAB238EA
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 08:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC3918E028;
	Fri,  9 Aug 2024 08:13:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73335C8D1;
	Fri,  9 Aug 2024 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723191198; cv=none; b=qRvLQahx5jqLkl1dfSIwVHO5ssT4v/NBBR6zJGD+g4vVAqDMg4RJQyGs/PE34PEe61RMzUZLqHQPgBML4Ome3RQscWcbpiOLcZhl8JCZQgziBihlk43E1aCS09wu1ERiAL6PKjgwlCBUO76bjQYoQgDf+Eow0TaXzRAtBmHKvMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723191198; c=relaxed/simple;
	bh=gO96w70IAomKq6rZYBgfUtHf3nTWcnJf/UHhy3PbRxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=soPfeNpzlzUftcEghFNAr89TG8qKcN2tUlqy1TNebBCDAvUFp5Cak6izEzowADP+UqIUT7nY86wOrBwQnhes/cvbPEzCFN61BLR2Rfk9imLA8Jwyc6NK1H6AlVpniaOFfZUotpT89Uvg6i+2be4UF/J44D0udTHYUPnoq82yKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96786C4AF10;
	Fri,  9 Aug 2024 08:13:17 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/6] media: cec: move cec_get/put_device to header
Date: Fri,  9 Aug 2024 09:57:37 +0200
Message-ID: <0c1982b6f8a634e963f5447e8186efe9ec0b17bf.1723190258.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move cec_get/put_device to the media/cec.h header. This
allows CEC drivers to use this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-api.c  |  4 ++--
 drivers/media/cec/core/cec-core.c | 29 -----------------------------
 drivers/media/cec/core/cec-priv.h |  2 --
 include/media/cec.h               | 31 +++++++++++++++++++++++++++++++
 4 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/media/cec/core/cec-api.c b/drivers/media/cec/core/cec-api.c
index 3ef915344304..c75a4057f00e 100644
--- a/drivers/media/cec/core/cec-api.c
+++ b/drivers/media/cec/core/cec-api.c
@@ -580,7 +580,7 @@ static int cec_open(struct inode *inode, struct file *filp)
 	fh->mode_initiator = CEC_MODE_INITIATOR;
 	fh->adap = adap;
 
-	err = cec_get_device(devnode);
+	err = cec_get_device(adap);
 	if (err) {
 		kfree(fh);
 		return err;
@@ -686,7 +686,7 @@ static int cec_release(struct inode *inode, struct file *filp)
 	mutex_unlock(&fh->lock);
 	kfree(fh);
 
-	cec_put_device(devnode);
+	cec_put_device(adap);
 	filp->private_data = NULL;
 	return 0;
 }
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index e0756826d629..48282d272fe6 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -51,35 +51,6 @@ static struct dentry *top_cec_dir;
 /* dev to cec_devnode */
 #define to_cec_devnode(cd) container_of(cd, struct cec_devnode, dev)
 
-int cec_get_device(struct cec_devnode *devnode)
-{
-	/*
-	 * Check if the cec device is available. This needs to be done with
-	 * the devnode->lock held to prevent an open/unregister race:
-	 * without the lock, the device could be unregistered and freed between
-	 * the devnode->registered check and get_device() calls, leading to
-	 * a crash.
-	 */
-	mutex_lock(&devnode->lock);
-	/*
-	 * return ENODEV if the cec device has been removed
-	 * already or if it is not registered anymore.
-	 */
-	if (!devnode->registered) {
-		mutex_unlock(&devnode->lock);
-		return -ENODEV;
-	}
-	/* and increase the device refcount */
-	get_device(&devnode->dev);
-	mutex_unlock(&devnode->lock);
-	return 0;
-}
-
-void cec_put_device(struct cec_devnode *devnode)
-{
-	put_device(&devnode->dev);
-}
-
 /* Called when the last user of the cec device exits. */
 static void cec_devnode_release(struct device *cd)
 {
diff --git a/drivers/media/cec/core/cec-priv.h b/drivers/media/cec/core/cec-priv.h
index ed1f8c67626b..ce42a37c4ac0 100644
--- a/drivers/media/cec/core/cec-priv.h
+++ b/drivers/media/cec/core/cec-priv.h
@@ -37,8 +37,6 @@ static inline bool msg_is_raw(const struct cec_msg *msg)
 
 /* cec-core.c */
 extern int cec_debug;
-int cec_get_device(struct cec_devnode *devnode);
-void cec_put_device(struct cec_devnode *devnode);
 
 /* cec-adap.c */
 int cec_monitor_all_cnt_inc(struct cec_adapter *adap);
diff --git a/include/media/cec.h b/include/media/cec.h
index 07d2ee8a3904..16b412b3131b 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -298,6 +298,37 @@ struct cec_adapter {
 	char input_phys[40];
 };
 
+static inline int cec_get_device(struct cec_adapter *adap)
+{
+	struct cec_devnode *devnode = &adap->devnode;
+
+	/*
+	 * Check if the cec device is available. This needs to be done with
+	 * the devnode->lock held to prevent an open/unregister race:
+	 * without the lock, the device could be unregistered and freed between
+	 * the devnode->registered check and get_device() calls, leading to
+	 * a crash.
+	 */
+	mutex_lock(&devnode->lock);
+	/*
+	 * return ENODEV if the cec device has been removed
+	 * already or if it is not registered anymore.
+	 */
+	if (!devnode->registered) {
+		mutex_unlock(&devnode->lock);
+		return -ENODEV;
+	}
+	/* and increase the device refcount */
+	get_device(&devnode->dev);
+	mutex_unlock(&devnode->lock);
+	return 0;
+}
+
+static inline void cec_put_device(struct cec_adapter *adap)
+{
+	put_device(&adap->devnode.dev);
+}
+
 static inline void *cec_get_drvdata(const struct cec_adapter *adap)
 {
 	return adap->priv;
-- 
2.43.0


