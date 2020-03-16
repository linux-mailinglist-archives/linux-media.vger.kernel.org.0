Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F18631867FA
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 10:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730435AbgCPJgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 05:36:54 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:44109 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730399AbgCPJgx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 05:36:53 -0400
Received: from tschai.fritz.box ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id DmAyjwybrEE3qDmB2jdJxl; Mon, 16 Mar 2020 10:36:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584351412; bh=62wtZTAMZQK5YxBnvjxcBLohpDVUFML/waGFuLQ17Rg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=oFdJs7zIi1xTSdnjo870hh0nEHAfa+J7wIwuxn82yM1USA6o0qQURJFtXRJkVZckA
         ZQFoWCFXL1A2yDr2x9o2v6pg9rdLSCYKjiVU40FhDp3a2ai9924X/C5LO1z2MpfFX3
         uMBlApTjGlu4EuVcKlBmcA/LS6JtyQnDjb1IiPJIJk3Cp1mGbNjyD6vgWOme5IwmbQ
         GoaHekzNCYG8lnipFBRxacyOYsa9yfs8bk//sV8BGE2873esruBKsiBNOBkM0m6ZRc
         B9gKMpCbenDV0iL1vGi9qiO4t2znhqmnQRUYt4NtfmzNDwLLFw/2KZdY34y1tEnrF/
         oniJgVuB47csw==
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] cec-notifier: make cec_notifier_get_conn() static
Date:   Mon, 16 Mar 2020 10:36:48 +0100
Message-Id: <20200316093648.1280689-3-hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316093648.1280689-1-hverkuil@xs4all.nl>
References: <20200316093648.1280689-1-hverkuil@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDaWk2F5em+x6HoDQRYP3KxlNC1sxz+oA7cj9QxTZRkXoC4KlafAsvkM1Os4fmzA27PVWvbqw7Acev1PcxDrSoMZOSZ1b02rpmn69xQFJLwQrm0idzkO
 LRox19YTfD6qAzeGNCYYEZqt8R/s9WZQCBMPiFivrUcSd8e61StoV/5L/1TityNE0SJNJJ5AlbHGltd4IGLnk6JAuWZtmUYAc9VovS3WJ5YkZGErjMRRmTuI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

This function is no longer used by other drivers, so it can be
made static.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-notifier.c | 17 +++++++++++++++--
 include/media/cec-notifier.h     | 23 -----------------------
 2 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
index 32a0828fbfe0..e748cd54b45d 100644
--- a/drivers/media/cec/cec-notifier.c
+++ b/drivers/media/cec/cec-notifier.c
@@ -32,7 +32,21 @@ struct cec_notifier {
 static LIST_HEAD(cec_notifiers);
 static DEFINE_MUTEX(cec_notifiers_lock);
 
-struct cec_notifier *
+/**
+ * cec_notifier_get_conn - find or create a new cec_notifier for the given
+ * device and connector tuple.
+ * @hdmi_dev: device that sends the events.
+ * @port_name: the connector name from which the event occurs
+ *
+ * If a notifier for device @dev already exists, then increase the refcount
+ * and return that notifier.
+ *
+ * If it doesn't exist, then allocate a new notifier struct and return a
+ * pointer to that new struct.
+ *
+ * Return NULL if the memory could not be allocated.
+ */
+static struct cec_notifier *
 cec_notifier_get_conn(struct device *hdmi_dev, const char *port_name)
 {
 	struct cec_notifier *n;
@@ -68,7 +82,6 @@ cec_notifier_get_conn(struct device *hdmi_dev, const char *port_name)
 	mutex_unlock(&cec_notifiers_lock);
 	return n;
 }
-EXPORT_SYMBOL_GPL(cec_notifier_get_conn);
 
 static void cec_notifier_release(struct kref *kref)
 {
diff --git a/include/media/cec-notifier.h b/include/media/cec-notifier.h
index c4a7624c5f83..38956969fd12 100644
--- a/include/media/cec-notifier.h
+++ b/include/media/cec-notifier.h
@@ -19,23 +19,6 @@ struct cec_notifier;
 
 #if IS_REACHABLE(CONFIG_CEC_CORE) && IS_ENABLED(CONFIG_CEC_NOTIFIER)
 
-/**
- * cec_notifier_get_conn - find or create a new cec_notifier for the given
- * device and connector tuple.
- * @dev: device that sends the events.
- * @conn: the connector name from which the event occurs
- *
- * If a notifier for device @dev already exists, then increase the refcount
- * and return that notifier.
- *
- * If it doesn't exist, then allocate a new notifier struct and return a
- * pointer to that new struct.
- *
- * Return NULL if the memory could not be allocated.
- */
-struct cec_notifier *cec_notifier_get_conn(struct device *dev,
-					   const char *conn);
-
 /**
  * cec_notifier_conn_register - find or create a new cec_notifier for the given
  * HDMI device and connector tuple.
@@ -125,12 +108,6 @@ void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
 struct device *cec_notifier_parse_hdmi_phandle(struct device *dev);
 
 #else
-static inline struct cec_notifier *cec_notifier_get_conn(struct device *dev,
-							 const char *conn)
-{
-	/* A non-NULL pointer is expected on success */
-	return (struct cec_notifier *)0xdeadfeed;
-}
 
 static inline struct cec_notifier *
 cec_notifier_conn_register(struct device *hdmi_dev, const char *port_name,
-- 
2.25.1

