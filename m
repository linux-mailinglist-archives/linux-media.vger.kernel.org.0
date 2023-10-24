Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FB87D4F23
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 13:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbjJXLpG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 07:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbjJXLpG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 07:45:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78AC710C2
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 04:45:02 -0700 (PDT)
Received: from umang.jain (unknown [103.86.18.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BA15F8B;
        Tue, 24 Oct 2023 13:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698147884;
        bh=D1qcM51vLafqRLznqGBe13o7XUfizzMgj8+FqIIiapA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ugIdTXKCWEOebSuNNwpohckc1Y1AD+Rp86nwGP5SZnJFoWLMyiF8Y9Vie9KzoTror
         lLpsz7WUKA9t7k/TFdf2UGKa35WtDC6ze95ZAKGw9fo0bhAM0vwqBSNa9b0BX8cMhz
         xel9CI2/dDAB7EqmrEy90vHKCZ4Z34AgfrIqkeIo=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 8/8] staging: vc04_services: Drop log level mechanisms
Date:   Tue, 24 Oct 2023 07:44:28 -0400
Message-ID: <20231024114428.443528-9-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024114428.443528-1-umang.jain@ideasonboard.com>
References: <20231024114428.443528-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the log level remnants since the logs are now ported to use
dynamic logging. Drop macros, externs and global variables which
were used in the log level mechanisms along with debugfs log entries.

Update the drivers/staging/vc04_services/interface/TODO list as well.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO  |   5 -
 .../interface/vchiq_arm/vchiq_arm.c           |   4 -
 .../interface/vchiq_arm/vchiq_arm.h           |   3 -
 .../interface/vchiq_arm/vchiq_core.c          |  87 ++++++---------
 .../interface/vchiq_arm/vchiq_core.h          |  11 --
 .../interface/vchiq_arm/vchiq_debugfs.c       | 103 ------------------
 6 files changed, 33 insertions(+), 180 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 6d9d4a800aa7..05eb5140d096 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -23,11 +23,6 @@ should properly handle a module unload. This also includes that all
 resources must be freed (kthreads, debugfs entries, ...) and global
 variables avoided.
 
-* Cleanup logging mechanism
-
-The driver should probably be using the standard kernel logging mechanisms
-such as dev_info, dev_dbg, and friends.
-
 * Documentation
 
 A short top-down description of this driver's architecture (function of
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index a28b89908c92..fc6d33ec5e95 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -60,10 +60,6 @@
 #define KEEPALIVE_VER 1
 #define KEEPALIVE_VER_MIN KEEPALIVE_VER
 
-/* Run time control of log level, based on KERN_XXX level. */
-int vchiq_arm_log_level = VCHIQ_LOG_DEFAULT;
-int vchiq_susp_log_level = VCHIQ_LOG_ERROR;
-
 DEFINE_SPINLOCK(msg_queue_spinlock);
 struct vchiq_state g_state;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 2fb31f9b527f..7cdc3d70bd2c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -76,9 +76,6 @@ struct dump_context {
 	loff_t offset;
 };
 
-extern int vchiq_arm_log_level;
-extern int vchiq_susp_log_level;
-
 extern spinlock_t msg_queue_spinlock;
 extern struct vchiq_state g_state;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index a1f2e14c64fa..45ba8f509a84 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -103,9 +103,6 @@ static_assert((unsigned int)VCHIQ_PORT_MAX <
 
 #define BULK_INDEX(x) ((x) & (VCHIQ_NUM_SERVICE_BULKS - 1))
 
-#define SRVTRACE_ENABLED(srv, lev) \
-	(((srv) && (srv)->trace) || (vchiq_core_msg_log_level >= (lev)))
-
 #define NO_CLOSE_RECVD	0
 #define CLOSE_RECVD	1
 
@@ -152,11 +149,6 @@ static inline void check_sizes(void)
 	BUILD_BUG_ON_NOT_POWER_OF_2(VCHIQ_MAX_SERVICES);
 }
 
-/* Run time control of log level, based on KERN_XXX level. */
-int vchiq_core_log_level = VCHIQ_LOG_DEFAULT;
-int vchiq_core_msg_log_level = VCHIQ_LOG_DEFAULT;
-int vchiq_sync_log_level = VCHIQ_LOG_DEFAULT;
-
 DEFINE_SPINLOCK(bulk_waiter_spinlock);
 static DEFINE_SPINLOCK(quota_spinlock);
 
@@ -1048,11 +1040,9 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 			return -EINVAL;
 		}
 
-		if (SRVTRACE_ENABLED(service,
-				     VCHIQ_LOG_INFO))
-			vchiq_log_dump_mem(state->dev, "Sent", 0,
-					   header->data,
-					   min_t(size_t, 16, callback_result));
+		vchiq_log_dump_mem(state->dev, "Sent", 0,
+				   header->data,
+				   min_t(size_t, 16, callback_result));
 
 		spin_lock(&quota_spinlock);
 		quota->message_use_count++;
@@ -1157,6 +1147,7 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 	struct vchiq_shared_state *local;
 	struct vchiq_header *header;
 	ssize_t callback_result;
+	int svc_fourcc;
 
 	local = state->local;
 
@@ -1197,11 +1188,9 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 	}
 
 	if (service) {
-		if (SRVTRACE_ENABLED(service,
-				     VCHIQ_LOG_INFO))
-			vchiq_log_dump_mem(state->dev, "Sent", 0,
-					   header->data,
-					   min_t(size_t, 16, callback_result));
+		vchiq_log_dump_mem(state->dev, "Sent", 0,
+				   header->data,
+				   min_t(size_t, 16, callback_result));
 
 		VCHIQ_SERVICE_STATS_INC(service, ctrl_tx_count);
 		VCHIQ_SERVICE_STATS_ADD(service, ctrl_tx_bytes, size);
@@ -1212,19 +1201,15 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 	header->size = size;
 	header->msgid = msgid;
 
-	if (vchiq_sync_log_level >= VCHIQ_LOG_TRACE) {
-		int svc_fourcc;
 
-		svc_fourcc = service
-			? service->base.fourcc
-			: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
+	svc_fourcc = service ? service->base.fourcc
+			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
-		vchiq_log_trace(state->dev, VCHIQ_SYNC,
-				"Sent Sync Msg %s(%u) to %c%c%c%c s:%u d:%d len:%d",
-				msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
-				VCHIQ_FOURCC_AS_4CHARS(svc_fourcc), VCHIQ_MSG_SRCPORT(msgid),
-				VCHIQ_MSG_DSTPORT(msgid), size);
-	}
+	vchiq_log_trace(state->dev, VCHIQ_SYNC,
+			"Sent Sync Msg %s(%u) to %c%c%c%c s:%u d:%d len:%d",
+			msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
+			VCHIQ_FOURCC_AS_4CHARS(svc_fourcc), VCHIQ_MSG_SRCPORT(msgid),
+			VCHIQ_MSG_DSTPORT(msgid), size);
 
 	remote_event_signal(&state->remote->sync_trigger);
 
@@ -1586,6 +1571,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 	struct vchiq_service *service = NULL;
 	unsigned int localport, remoteport;
 	int msgid, size, type, ret = -EINVAL;
+	int svc_fourcc;
 
 	DEBUG_INITIALISE(state->local);
 
@@ -1641,20 +1627,16 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		break;
 	}
 
-	if (SRVTRACE_ENABLED(service, VCHIQ_LOG_INFO)) {
-		int svc_fourcc;
 
-		svc_fourcc = service
-			? service->base.fourcc
-			: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
+	svc_fourcc = service ? service->base.fourcc
+			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
-		vchiq_log_debug(state->dev, VCHIQ_CORE_MSG,
-				"Rcvd Msg %s(%u) from %c%c%c%c s:%d d:%d len:%d",
-				msg_type_str(type), type, VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
-				remoteport, localport, size);
-		if (size > 0)
-			vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
-	}
+	vchiq_log_debug(state->dev, VCHIQ_CORE_MSG,
+			"Rcvd Msg %s(%u) from %c%c%c%c s:%d d:%d len:%d",
+			msg_type_str(type), type, VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
+			remoteport, localport, size);
+	if (size > 0)
+		vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
 
 	if (((unsigned long)header & VCHIQ_SLOT_MASK) +
 	    calc_stride(size) > VCHIQ_SLOT_SIZE) {
@@ -2028,6 +2010,7 @@ sync_func(void *v)
 	struct vchiq_header *header =
 		(struct vchiq_header *)SLOT_DATA_FROM_INDEX(state,
 			state->remote->slot_sync);
+	int svc_fourcc;
 
 	while (1) {
 		struct vchiq_service *service;
@@ -2057,19 +2040,15 @@ sync_func(void *v)
 			continue;
 		}
 
-		if (vchiq_sync_log_level >= VCHIQ_LOG_TRACE) {
-			int svc_fourcc;
-
-			svc_fourcc = service
-				? service->base.fourcc
-				: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
-			vchiq_log_trace(state->dev, VCHIQ_SYNC,
-					"Rcvd Msg %s from %c%c%c%c s:%d d:%d len:%d",
-					msg_type_str(type), VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
-					remoteport, localport, size);
-			if (size > 0)
-				vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
-		}
+		svc_fourcc = service ? service->base.fourcc
+				     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
+
+		vchiq_log_trace(state->dev, VCHIQ_SYNC,
+				"Rcvd Msg %s from %c%c%c%c s:%d d:%d len:%d",
+				msg_type_str(type), VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
+				remoteport, localport, size);
+		if (size > 0)
+			vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
 
 		switch (type) {
 		case VCHIQ_MSG_OPENACK:
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 076c6d9ad56a..10451d6765bd 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -31,13 +31,6 @@
 #define VCHIQ_SLOT_SIZE     4096
 #define VCHIQ_MAX_MSG_SIZE  (VCHIQ_SLOT_SIZE - sizeof(struct vchiq_header))
 
-/* Run time control of log level, based on KERN_XXX level. */
-#define VCHIQ_LOG_DEFAULT  4
-#define VCHIQ_LOG_ERROR    3
-#define VCHIQ_LOG_WARNING  4
-#define VCHIQ_LOG_INFO     6
-#define VCHIQ_LOG_TRACE    7
-
 enum vchiq_log_category {
 	VCHIQ_ARM,
 	VCHIQ_CORE,
@@ -476,10 +469,6 @@ struct vchiq_config {
 
 extern spinlock_t bulk_waiter_spinlock;
 
-extern int vchiq_core_log_level;
-extern int vchiq_core_msg_log_level;
-extern int vchiq_sync_log_level;
-
 extern const char *
 get_conn_state_name(enum vchiq_connstate conn_state);
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
index dc667afd1f8c..58db78a9c8d4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
@@ -13,102 +13,10 @@
 
 #define DEBUGFS_WRITE_BUF_SIZE 256
 
-#define VCHIQ_LOG_ERROR_STR   "error"
-#define VCHIQ_LOG_WARNING_STR "warning"
-#define VCHIQ_LOG_INFO_STR    "info"
-#define VCHIQ_LOG_TRACE_STR   "trace"
-
 /* Global 'vchiq' debugfs and clients entry used by all instances */
 static struct dentry *vchiq_dbg_dir;
 static struct dentry *vchiq_dbg_clients;
 
-/* Log category debugfs entries */
-struct vchiq_debugfs_log_entry {
-	const char *name;
-	void *plevel;
-};
-
-static struct vchiq_debugfs_log_entry vchiq_debugfs_log_entries[] = {
-	{ "core", &vchiq_core_log_level },
-	{ "msg",  &vchiq_core_msg_log_level },
-	{ "sync", &vchiq_sync_log_level },
-	{ "susp", &vchiq_susp_log_level },
-	{ "arm",  &vchiq_arm_log_level },
-};
-
-static int debugfs_log_show(struct seq_file *f, void *offset)
-{
-	int *levp = f->private;
-	char *log_value = NULL;
-
-	switch (*levp) {
-	case VCHIQ_LOG_ERROR:
-		log_value = VCHIQ_LOG_ERROR_STR;
-		break;
-	case VCHIQ_LOG_WARNING:
-		log_value = VCHIQ_LOG_WARNING_STR;
-		break;
-	case VCHIQ_LOG_INFO:
-		log_value = VCHIQ_LOG_INFO_STR;
-		break;
-	case VCHIQ_LOG_TRACE:
-		log_value = VCHIQ_LOG_TRACE_STR;
-		break;
-	default:
-		break;
-	}
-
-	seq_printf(f, "%s\n", log_value ? log_value : "(null)");
-
-	return 0;
-}
-
-static int debugfs_log_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, debugfs_log_show, inode->i_private);
-}
-
-static ssize_t debugfs_log_write(struct file *file,
-	const char __user *buffer,
-	size_t count, loff_t *ppos)
-{
-	struct seq_file *f = (struct seq_file *)file->private_data;
-	int *levp = f->private;
-	char kbuf[DEBUGFS_WRITE_BUF_SIZE + 1];
-
-	memset(kbuf, 0, DEBUGFS_WRITE_BUF_SIZE + 1);
-	if (count >= DEBUGFS_WRITE_BUF_SIZE)
-		count = DEBUGFS_WRITE_BUF_SIZE;
-
-	if (copy_from_user(kbuf, buffer, count))
-		return -EFAULT;
-	kbuf[count - 1] = 0;
-
-	if (strncmp("error", kbuf, strlen("error")) == 0)
-		*levp = VCHIQ_LOG_ERROR;
-	else if (strncmp("warning", kbuf, strlen("warning")) == 0)
-		*levp = VCHIQ_LOG_WARNING;
-	else if (strncmp("info", kbuf, strlen("info")) == 0)
-		*levp = VCHIQ_LOG_INFO;
-	else if (strncmp("trace", kbuf, strlen("trace")) == 0)
-		*levp = VCHIQ_LOG_TRACE;
-	else
-		*levp = VCHIQ_LOG_DEFAULT;
-
-	*ppos += count;
-
-	return count;
-}
-
-static const struct file_operations debugfs_log_fops = {
-	.owner		= THIS_MODULE,
-	.open		= debugfs_log_open,
-	.write		= debugfs_log_write,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
 static int debugfs_usecount_show(struct seq_file *f, void *offset)
 {
 	struct vchiq_instance *instance = f->private;
@@ -205,19 +113,8 @@ void vchiq_debugfs_remove_instance(struct vchiq_instance *instance)
 
 void vchiq_debugfs_init(void)
 {
-	struct dentry *dir;
-	int i;
-
 	vchiq_dbg_dir = debugfs_create_dir("vchiq", NULL);
 	vchiq_dbg_clients = debugfs_create_dir("clients", vchiq_dbg_dir);
-
-	/* create an entry under <debugfs>/vchiq/log for each log category */
-	dir = debugfs_create_dir("log", vchiq_dbg_dir);
-
-	for (i = 0; i < ARRAY_SIZE(vchiq_debugfs_log_entries); i++)
-		debugfs_create_file(vchiq_debugfs_log_entries[i].name, 0644,
-				    dir, vchiq_debugfs_log_entries[i].plevel,
-				    &debugfs_log_fops);
 }
 
 /* remove all the debugfs entries */
-- 
2.41.0

