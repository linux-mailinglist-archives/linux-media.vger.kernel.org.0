Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95C71E8E93
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgE3G52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:57:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:44910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728856AbgE3G4I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:08 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3AA23221E9;
        Sat, 30 May 2020 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821764;
        bh=fJU4MapJm5+Ln4Y0E3PlnHOppNybNZY9JsPxlFydVUQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q7OhxHBXn5sHpCoSqCBCtugXT174KjLOMRCrQh1ln80zuvjLzWbRbEshnOnuBt9dT
         U34sHqdwb2qPsn1GNm1qbWTQapeKJNmCmgkzZJdw/tZM7S+xFk1pfHs0NaRqXeGRYh
         s+HYzK9ZEhF3mk3YC7nnSfu7EM1t6ME1wQh+iSd4=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPW-001hqa-38; Sat, 30 May 2020 08:56:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH v2 31/41] media: atomisp: get rid of an error abstraction layer
Date:   Sat, 30 May 2020 08:55:48 +0200
Message-Id: <63facd60593afec0a37fd7605cc5bafb2f2bc374.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is an abstraction layer there meant to convert to
the Linux standard error codes. As the driver now use
such errors everywhere. we can get rid of this.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  2 +-
 .../pci/camera/util/interface/ia_css_util.h   |  3 +-
 .../media/atomisp/pci/camera/util/src/util.c  | 29 ------------
 .../pci/hive_isp_css_include/error_support.h  | 39 ---------------
 .../pci/hive_isp_css_include/string_support.h | 16 +++----
 .../media/atomisp/pci/runtime/bufq/src/bufq.c | 47 ++++++++-----------
 .../runtime/eventq/interface/ia_css_eventq.h  |  8 ++--
 .../atomisp/pci/runtime/eventq/src/eventq.c   |  4 +-
 .../runtime/queue/interface/ia_css_queue.h    | 30 ++++++------
 .../atomisp/pci/runtime/queue/src/queue.c     | 44 ++++++++---------
 .../pci/runtime/queue/src/queue_access.c      | 16 +++----
 .../pci/runtime/queue/src/queue_access.h      |  3 +-
 12 files changed, 83 insertions(+), 158 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/error_support.h

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 077017671513..75cbc46f4a07 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -16,6 +16,7 @@
  *
  *
  */
+#include <linux/errno.h>
 #include <linux/firmware.h>
 #include <linux/pci.h>
 #include <linux/interrupt.h>
@@ -58,7 +59,6 @@
 #include "ia_css_types.h"
 #include "ia_css_stream.h"
 #include "ia_css_debug.h"
-#include "error_support.h"
 #include "bits.h"
 
 /* We should never need to run the flash for more than 2 frames.
diff --git a/drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h b/drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h
index 80ad3e064654..ca5617b3b870 100644
--- a/drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h
+++ b/drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h
@@ -15,8 +15,9 @@
 #ifndef __IA_CSS_UTIL_H__
 #define __IA_CSS_UTIL_H__
 
+#include <linux/errno.h>
+
 #include <ia_css_err.h>
-#include <error_support.h>
 #include <type_support.h>
 #include <ia_css_frame_public.h>
 #include <ia_css_stream_public.h>
diff --git a/drivers/staging/media/atomisp/pci/camera/util/src/util.c b/drivers/staging/media/atomisp/pci/camera/util/src/util.c
index 3ca79b23da70..4b2c4d7bc5b4 100644
--- a/drivers/staging/media/atomisp/pci/camera/util/src/util.c
+++ b/drivers/staging/media/atomisp/pci/camera/util/src/util.c
@@ -20,35 +20,6 @@
 /* for ia_css_binary_max_vf_width() */
 #include "ia_css_binary.h"
 
-int ia_css_convert_errno(
-    int in_err)
-{
-	int out_err;
-
-	switch (in_err) {
-	case 0:
-		out_err = 0;
-		break;
-	case EINVAL:
-		out_err = -EINVAL;
-		break;
-	case ENODATA:
-		out_err = -ENODATA;
-		break;
-	case ENOSYS:
-	case ENOTSUP:
-		out_err = -EINVAL;
-		break;
-	case ENOBUFS:
-		out_err = -ENOBUFS;
-		break;
-	default:
-		out_err = -EINVAL;
-		break;
-	}
-	return out_err;
-}
-
 /* MW: Table look-up ??? */
 unsigned int ia_css_util_input_format_bpp(
     enum atomisp_input_format format,
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/error_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/error_support.h
deleted file mode 100644
index 4f0d259bf7ed..000000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/error_support.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- */
-
-#ifndef __ERROR_SUPPORT_H_INCLUDED__
-#define __ERROR_SUPPORT_H_INCLUDED__
-
-#include <linux/errno.h>
-/*
- * Put here everything __KERNEL__ specific not covered in
- * "errno.h"
- */
-#define ENOTSUP 252
-
-#define verifexit(cond, error_tag)  \
-do {                               \
-	if (!(cond)) {              \
-		goto EXIT;         \
-	}                          \
-} while (0)
-
-#define verifjmpexit(cond)         \
-do {                               \
-	if (!(cond)) {              \
-		goto EXIT;         \
-	}                          \
-} while (0)
-
-#endif /* __ERROR_SUPPORT_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h
index f653ec797601..7b3af1b10b6d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h
@@ -28,7 +28,7 @@
  * @param[in]  src_buf. The source buffer
  * @param[in]  src_size. The size of the source buffer in bytes
  * @return     0 on success, error code on failure
- * @return     EINVAL on Invalid arguments
+ * @return     -EINVAL on Invalid arguments
  * @return     ERANGE on Destination size too small
  */
 static inline int memcpy_s(
@@ -39,7 +39,7 @@ static inline int memcpy_s(
 {
 	if ((!src_buf) || (!dest_buf)) {
 		/* Invalid arguments*/
-		return EINVAL;
+		return -EINVAL;
 	}
 
 	if ((dest_size < src_size) || (src_size == 0)) {
@@ -84,7 +84,7 @@ static size_t strnlen_s(
  * @param[in]  src_str. The source buffer
  * @param[in]  src_size. The size of the source buffer in bytes
  * @return     Returns 0 on success
- * @return     Returns EINVAL on invalid arguments
+ * @return     Returns -EINVAL on invalid arguments
  * @return     Returns ERANGE on destination size too small
  */
 static inline int strncpy_s(
@@ -97,13 +97,13 @@ static inline int strncpy_s(
 
 	if (!dest_str) {
 		/* Invalid arguments*/
-		return EINVAL;
+		return -EINVAL;
 	}
 
 	if ((!src_str) || (dest_size == 0)) {
 		/* Invalid arguments*/
 		dest_str[0] = '\0';
-		return EINVAL;
+		return -EINVAL;
 	}
 
 	len = strnlen_s(src_str, src_size);
@@ -126,7 +126,7 @@ static inline int strncpy_s(
  * @param[in]  dest_size. The size of the destination buffer in bytes
  * @param[in]  src_str. The source buffer
  * @return     Returns 0 on success
- * @return     Returns EINVAL on invalid arguments
+ * @return     Returns -EINVAL on invalid arguments
  * @return     Returns ERANGE on destination size too small
  */
 static inline int strcpy_s(
@@ -138,13 +138,13 @@ static inline int strcpy_s(
 
 	if (!dest_str) {
 		/* Invalid arguments*/
-		return EINVAL;
+		return -EINVAL;
 	}
 
 	if ((!src_str) || (dest_size == 0)) {
 		/* Invalid arguments*/
 		dest_str[0] = '\0';
-		return EINVAL;
+		return -EINVAL;
 	}
 
 	len = strnlen_s(src_str, dest_size);
diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
index 9245a50bf027..cae8afaea354 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
@@ -22,7 +22,6 @@
 #include "ia_css_debug.h"		/* ia_css_debug_dtrace*/
 #include "sh_css_internal.h"		/* sh_css_queue_type */
 #include "sp_local.h"			/* sp_address_of */
-#include "ia_css_util.h"		/* ia_css_convert_errno()*/
 #include "sh_css_firmware.h"		/* sh_css_sp_fw*/
 
 #define BUFQ_DUMP_FILE_NAME_PREFIX_SIZE 256
@@ -334,7 +333,6 @@ int ia_css_bufq_enqueue_buffer(
     int queue_id,
     uint32_t item)
 {
-	int return_err = 0;
 	ia_css_queue_t *q;
 	int error;
 
@@ -349,22 +347,20 @@ int ia_css_bufq_enqueue_buffer(
 			     thread_index);
 	if (q) {
 		error = ia_css_queue_enqueue(q, item);
-		return_err = ia_css_convert_errno(error);
 	} else {
 		IA_CSS_ERROR("queue is not initialized");
-		return_err = -EBUSY;
+		error = -EBUSY;
 	}
 
-	IA_CSS_LEAVE_ERR_PRIVATE(return_err);
-	return return_err;
+	IA_CSS_LEAVE_ERR_PRIVATE(error);
+	return error;
 }
 
 int ia_css_bufq_dequeue_buffer(
     int queue_id,
     uint32_t *item)
 {
-	int return_err;
-	int error = 0;
+	int error;
 	ia_css_queue_t *q;
 
 	IA_CSS_ENTER_PRIVATE("queue_id=%d", queue_id);
@@ -379,14 +375,13 @@ int ia_css_bufq_dequeue_buffer(
 			     -1);
 	if (q) {
 		error = ia_css_queue_dequeue(q, item);
-		return_err = ia_css_convert_errno(error);
 	} else {
 		IA_CSS_ERROR("queue is not initialized");
-		return_err = -EBUSY;
+		error = -EBUSY;
 	}
 
-	IA_CSS_LEAVE_ERR_PRIVATE(return_err);
-	return return_err;
+	IA_CSS_LEAVE_ERR_PRIVATE(error);
+	return error;
 }
 
 int ia_css_bufq_enqueue_psys_event(
@@ -395,8 +390,8 @@ int ia_css_bufq_enqueue_psys_event(
     u8 evt_payload_1,
     uint8_t evt_payload_2)
 {
-	int return_err;
-	int error = 0;
+
+    int error = 0;
 	ia_css_queue_t *q;
 
 	IA_CSS_ENTER_PRIVATE("evt_id=%d", evt_id);
@@ -409,9 +404,8 @@ int ia_css_bufq_enqueue_psys_event(
 	error = ia_css_eventq_send(q,
 				   evt_id, evt_payload_0, evt_payload_1, evt_payload_2);
 
-	return_err = ia_css_convert_errno(error);
-	IA_CSS_LEAVE_ERR_PRIVATE(return_err);
-	return return_err;
+	IA_CSS_LEAVE_ERR_PRIVATE(error);
+	return error;
 }
 
 int ia_css_bufq_dequeue_psys_event(
@@ -433,7 +427,7 @@ int ia_css_bufq_dequeue_psys_event(
 	}
 	error = ia_css_eventq_recv(q, item);
 
-	return ia_css_convert_errno(error);
+	return error;
 }
 
 int ia_css_bufq_dequeue_isys_event(
@@ -455,7 +449,7 @@ int ia_css_bufq_dequeue_isys_event(
 		return -EBUSY;
 	}
 	error = ia_css_eventq_recv(q, item);
-	return ia_css_convert_errno(error);
+	return error;
 #else
 	(void)item;
 	return -EBUSY;
@@ -465,7 +459,6 @@ int ia_css_bufq_dequeue_isys_event(
 int ia_css_bufq_enqueue_isys_event(uint8_t evt_id)
 {
 #if !defined(HAS_NO_INPUT_SYSTEM)
-	int return_err;
 	int error = 0;
 	ia_css_queue_t *q;
 
@@ -477,9 +470,9 @@ int ia_css_bufq_enqueue_isys_event(uint8_t evt_id)
 	}
 
 	error = ia_css_eventq_send(q, evt_id, 0, 0, 0);
-	return_err = ia_css_convert_errno(error);
-	IA_CSS_LEAVE_ERR_PRIVATE(return_err);
-	return return_err;
+
+	IA_CSS_LEAVE_ERR_PRIVATE(error);
+	return error;
 #else
 	(void)evt_id;
 	return -EBUSY;
@@ -490,8 +483,7 @@ int ia_css_bufq_enqueue_tag_cmd(
     uint32_t item)
 {
 #if !defined(HAS_NO_INPUT_SYSTEM)
-	int return_err;
-	int error = 0;
+	int error;
 	ia_css_queue_t *q;
 
 	IA_CSS_ENTER_PRIVATE("item=%d", item);
@@ -502,9 +494,8 @@ int ia_css_bufq_enqueue_tag_cmd(
 	}
 	error = ia_css_queue_enqueue(q, item);
 
-	return_err = ia_css_convert_errno(error);
-	IA_CSS_LEAVE_ERR_PRIVATE(return_err);
-	return return_err;
+	IA_CSS_LEAVE_ERR_PRIVATE(error);
+	return error;
 #else
 	(void)item;
 	return -EBUSY;
diff --git a/drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eventq.h b/drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eventq.h
index 8602398ede52..ad725e69253a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eventq.h
+++ b/drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eventq.h
@@ -23,8 +23,8 @@
  * @param[in]	eventq_handle	eventq_handle.
  * @param[in]	payload		The event payload.
  * @return	0		- Successfully dequeue.
- * @return	EINVAL		- Invalid argument.
- * @return	ENODATA		- Queue is empty.
+ * @return	-EINVAL		- Invalid argument.
+ * @return	-ENODATA		- Queue is empty.
  */
 int ia_css_eventq_recv(
     ia_css_queue_t *eventq_handle,
@@ -41,8 +41,8 @@ int ia_css_eventq_recv(
  * @param[in]	evt_payload_1	The event payload.
  * @param[in]	evt_payload_2	The event payload.
  * @return	0		- Successfully enqueue.
- * @return	EINVAL		- Invalid argument.
- * @return	ENOBUFS		- Queue is full.
+ * @return	-EINVAL		- Invalid argument.
+ * @return	-ENOBUFS		- Queue is full.
  */
 int ia_css_eventq_send(
     ia_css_queue_t *eventq_handle,
diff --git a/drivers/staging/media/atomisp/pci/runtime/eventq/src/eventq.c b/drivers/staging/media/atomisp/pci/runtime/eventq/src/eventq.c
index 0460f102d36f..4436e82f1487 100644
--- a/drivers/staging/media/atomisp/pci/runtime/eventq/src/eventq.c
+++ b/drivers/staging/media/atomisp/pci/runtime/eventq/src/eventq.c
@@ -50,7 +50,7 @@ int ia_css_eventq_send(
 {
 	u8 tmp[4];
 	u32 sw_event;
-	int error = ENOSYS;
+	int error = -ENOSYS;
 
 	/*
 	 * Encode the queue type, the thread ID and
@@ -65,7 +65,7 @@ int ia_css_eventq_send(
 	/* queue the software event (busy-waiting) */
 	for ( ; ; ) {
 		error = ia_css_queue_enqueue(eventq_handle, sw_event);
-		if (error != ENOBUFS) {
+		if (error != -ENOBUFS) {
 			/* We were able to successfully send the event
 			   or had a real failure. return the status*/
 			break;
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
index 6daeb060daf9..ea08016e5b7e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
@@ -40,7 +40,7 @@ typedef struct ia_css_queue ia_css_queue_t;
  * @param[out] qhandle. Handle to queue instance for use with API
  * @param[in]  desc.   Descriptor with queue properties filled-in
  * @return     0      - Successful init of local queue instance.
- * @return     EINVAL - Invalid argument.
+ * @return     -EINVAL - Invalid argument.
  *
  */
 int ia_css_queue_local_init(
@@ -52,7 +52,7 @@ int ia_css_queue_local_init(
  * @param[out] qhandle. Handle to queue instance for use with API
  * @param[in]  desc.   Descriptor with queue properties filled-in
  * @return     0      - Successful init of remote queue instance.
- * @return     EINVAL - Invalid argument.
+ * @return     -EINVAL - Invalid argument.
  */
 int ia_css_queue_remote_init(
     ia_css_queue_t *qhandle,
@@ -72,8 +72,8 @@ int ia_css_queue_uninit(
  * @param[in]  qhandle. Handle to queue instance
  * @param[in]  item.    Object to be enqueued.
  * @return     0       - Successful enqueue.
- * @return     EINVAL  - Invalid argument.
- * @return     ENOBUFS - Queue is full.
+ * @return     -EINVAL  - Invalid argument.
+ * @return     -ENOBUFS - Queue is full.
  *
  */
 int ia_css_queue_enqueue(
@@ -86,8 +86,8 @@ int ia_css_queue_enqueue(
  * @param[out] item.    Object to be dequeued into this item.
 
  * @return     0       - Successful dequeue.
- * @return     EINVAL  - Invalid argument.
- * @return     ENODATA - Queue is empty.
+ * @return     -EINVAL  - Invalid argument.
+ * @return     -ENODATA - Queue is empty.
  *
  */
 int ia_css_queue_dequeue(
@@ -99,8 +99,8 @@ int ia_css_queue_dequeue(
  * @param[in]  qhandle.  Handle to queue instance
  * @param[in]  is_empty  True if empty, False if not.
  * @return     0       - Successful access state.
- * @return     EINVAL  - Invalid argument.
- * @return     ENOSYS  - Function not implemented.
+ * @return     -EINVAL  - Invalid argument.
+ * @return     -ENOSYS  - Function not implemented.
  *
  */
 int ia_css_queue_is_empty(
@@ -112,8 +112,8 @@ int ia_css_queue_is_empty(
  * @param[in]  qhandle.  Handle to queue instance
  * @param[in]  is_full   True if Full, False if not.
  * @return     0       - Successfully access state.
- * @return     EINVAL  - Invalid argument.
- * @return     ENOSYS  - Function not implemented.
+ * @return     -EINVAL  - Invalid argument.
+ * @return     -ENOSYS  - Function not implemented.
  *
  */
 int ia_css_queue_is_full(
@@ -125,7 +125,7 @@ int ia_css_queue_is_full(
  * @param[in]  qhandle.  Handle to queue instance
  * @param[in]  size      Number of available elements in the queue
  * @return     0       - Successfully access state.
- * @return     EINVAL  - Invalid argument.
+ * @return     -EINVAL  - Invalid argument.
  *
  */
 int ia_css_queue_get_used_space(
@@ -137,7 +137,7 @@ int ia_css_queue_get_used_space(
  * @param[in]  qhandle.  Handle to queue instance
  * @param[in]  size      Number of free elements in the queue
  * @return     0       - Successfully access state.
- * @return     EINVAL  - Invalid argument.
+ * @return     -EINVAL  - Invalid argument.
  *
  */
 int ia_css_queue_get_free_space(
@@ -151,7 +151,7 @@ int ia_css_queue_get_free_space(
  *			 starting from head of queue
  * @param[in]  element   Value of element returned
  * @return     0       - Successfully access state.
- * @return     EINVAL  - Invalid argument.
+ * @return     -EINVAL  - Invalid argument.
  *
  */
 int ia_css_queue_peek(
@@ -164,8 +164,8 @@ int ia_css_queue_peek(
  * @param[in]  qhandle. Handle to queue instance
  * @param[out] size     Size value to be returned here.
  * @return     0       - Successful get size.
- * @return     EINVAL  - Invalid argument.
- * @return     ENOSYS  - Function not implemented.
+ * @return     -EINVAL  - Invalid argument.
+ * @return     -ENOSYS  - Function not implemented.
  *
  */
 int ia_css_queue_get_size(
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index dd79c6f180af..f28ec876709a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -28,7 +28,7 @@ int ia_css_queue_local_init(
 	if (NULL == qhandle || NULL == desc
 	    || NULL == desc->cb_elems || NULL == desc->cb_desc) {
 		/* Invalid parameters, return error*/
-		return EINVAL;
+		return -EINVAL;
 	}
 
 	/* Mark the queue as Local */
@@ -48,7 +48,7 @@ int ia_css_queue_remote_init(
 {
 	if (NULL == qhandle || NULL == desc) {
 		/* Invalid parameters, return error*/
-		return EINVAL;
+		return -EINVAL;
 	}
 
 	/* Mark the queue as remote*/
@@ -72,7 +72,7 @@ int ia_css_queue_uninit(
     ia_css_queue_t *qhandle)
 {
 	if (!qhandle)
-		return EINVAL;
+		return -EINVAL;
 
 	/* Load the required queue object */
 	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
@@ -90,7 +90,7 @@ int ia_css_queue_enqueue(
 	int error = 0;
 
 	if (!qhandle)
-		return EINVAL;
+		return -EINVAL;
 
 	/* 1. Load the required queue object */
 	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
@@ -99,7 +99,7 @@ int ia_css_queue_enqueue(
 		 */
 		if (ia_css_circbuf_is_full(&qhandle->desc.cb_local)) {
 			/* Cannot push the element. Return*/
-			return ENOBUFS;
+			return -ENOBUFS;
 		}
 
 		/* Push the element*/
@@ -117,7 +117,7 @@ int ia_css_queue_enqueue(
 
 		/* b. Operate on the queue */
 		if (ia_css_circbuf_desc_is_full(&cb_desc))
-			return ENOBUFS;
+			return -ENOBUFS;
 
 		cb_elem.val = item;
 
@@ -149,7 +149,7 @@ int ia_css_queue_dequeue(
 	int error = 0;
 
 	if (!qhandle || NULL == item)
-		return EINVAL;
+		return -EINVAL;
 
 	/* 1. Load the required queue object */
 	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
@@ -158,7 +158,7 @@ int ia_css_queue_dequeue(
 		 */
 		if (ia_css_circbuf_is_empty(&qhandle->desc.cb_local)) {
 			/* Nothing to pop. Return empty queue*/
-			return ENODATA;
+			return -ENODATA;
 		}
 
 		*item = ia_css_circbuf_pop(&qhandle->desc.cb_local);
@@ -176,7 +176,7 @@ int ia_css_queue_dequeue(
 
 		/* b. Operate on the queue */
 		if (ia_css_circbuf_desc_is_empty(&cb_desc))
-			return ENODATA;
+			return -ENODATA;
 
 		error = ia_css_queue_item_load(qhandle, cb_desc.start, &cb_elem);
 		if (error != 0)
@@ -206,7 +206,7 @@ int ia_css_queue_is_full(
 	int error = 0;
 
 	if ((!qhandle) || (!is_full))
-		return EINVAL;
+		return -EINVAL;
 
 	/* 1. Load the required queue object */
 	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
@@ -230,7 +230,7 @@ int ia_css_queue_is_full(
 		return 0;
 	}
 
-	return EINVAL;
+	return -EINVAL;
 }
 
 int ia_css_queue_get_free_space(
@@ -240,7 +240,7 @@ int ia_css_queue_get_free_space(
 	int error = 0;
 
 	if ((!qhandle) || (!size))
-		return EINVAL;
+		return -EINVAL;
 
 	/* 1. Load the required queue object */
 	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
@@ -264,7 +264,7 @@ int ia_css_queue_get_free_space(
 		return 0;
 	}
 
-	return EINVAL;
+	return -EINVAL;
 }
 
 int ia_css_queue_get_used_space(
@@ -274,7 +274,7 @@ int ia_css_queue_get_used_space(
 	int error = 0;
 
 	if ((!qhandle) || (!size))
-		return EINVAL;
+		return -EINVAL;
 
 	/* 1. Load the required queue object */
 	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
@@ -298,7 +298,7 @@ int ia_css_queue_get_used_space(
 		return 0;
 	}
 
-	return EINVAL;
+	return -EINVAL;
 }
 
 int ia_css_queue_peek(
@@ -310,7 +310,7 @@ int ia_css_queue_peek(
 	int error = 0;
 
 	if ((!qhandle) || (!element))
-		return EINVAL;
+		return -EINVAL;
 
 	/* 1. Load the required queue object */
 	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
@@ -320,7 +320,7 @@ int ia_css_queue_peek(
 		/* Check if offset is valid */
 		num_elems = ia_css_circbuf_get_num_elems(&qhandle->desc.cb_local);
 		if (offset > num_elems)
-			return EINVAL;
+			return -EINVAL;
 
 		*element = ia_css_circbuf_peek_from_start(&qhandle->desc.cb_local, (int)offset);
 		return 0;
@@ -339,7 +339,7 @@ int ia_css_queue_peek(
 		/* Check if offset is valid */
 		num_elems = ia_css_circbuf_desc_get_num_elems(&cb_desc);
 		if (offset > num_elems)
-			return EINVAL;
+			return -EINVAL;
 
 		offset = OP_std_modadd(cb_desc.start, offset, cb_desc.size);
 		error = ia_css_queue_item_load(qhandle, (uint8_t)offset, &cb_elem);
@@ -350,7 +350,7 @@ int ia_css_queue_peek(
 		return 0;
 	}
 
-	return EINVAL;
+	return -EINVAL;
 }
 
 int ia_css_queue_is_empty(
@@ -360,7 +360,7 @@ int ia_css_queue_is_empty(
 	int error = 0;
 
 	if ((!qhandle) || (!is_empty))
-		return EINVAL;
+		return -EINVAL;
 
 	/* 1. Load the required queue object */
 	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
@@ -384,7 +384,7 @@ int ia_css_queue_is_empty(
 		return 0;
 	}
 
-	return EINVAL;
+	return -EINVAL;
 }
 
 int ia_css_queue_get_size(
@@ -394,7 +394,7 @@ int ia_css_queue_get_size(
 	int error = 0;
 
 	if ((!qhandle) || (!size))
-		return EINVAL;
+		return -EINVAL;
 
 	/* 1. Load the required queue object */
 	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
index ba7219644256..d3bf20172132 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
@@ -26,7 +26,7 @@ int ia_css_queue_load(
     uint32_t ignore_desc_flags)
 {
 	if (!rdesc || !cb_desc)
-		return EINVAL;
+		return -EINVAL;
 
 	if (rdesc->location == IA_CSS_QUEUE_LOC_SP) {
 		assert(ignore_desc_flags <= QUEUE_IGNORE_DESC_FLAGS_MAX);
@@ -69,7 +69,7 @@ int ia_css_queue_load(
 			  sizeof(ia_css_circbuf_desc_t));
 	} else if (rdesc->location == IA_CSS_QUEUE_LOC_ISP) {
 		/* Not supported yet */
-		return ENOTSUP;
+		return -ENOTSUPP;
 	}
 
 	return 0;
@@ -81,7 +81,7 @@ int ia_css_queue_store(
     uint32_t ignore_desc_flags)
 {
 	if (!rdesc || !cb_desc)
-		return EINVAL;
+		return -EINVAL;
 
 	if (rdesc->location == IA_CSS_QUEUE_LOC_SP) {
 		assert(ignore_desc_flags <= QUEUE_IGNORE_DESC_FLAGS_MAX);
@@ -116,7 +116,7 @@ int ia_css_queue_store(
 			   sizeof(ia_css_circbuf_desc_t));
 	} else if (rdesc->location == IA_CSS_QUEUE_LOC_ISP) {
 		/* Not supported yet */
-		return ENOTSUP;
+		return -ENOTSUPP;
 	}
 
 	return 0;
@@ -128,7 +128,7 @@ int ia_css_queue_item_load(
     ia_css_circbuf_elem_t *item)
 {
 	if (!rdesc || !item)
-		return EINVAL;
+		return -EINVAL;
 
 	if (rdesc->location == IA_CSS_QUEUE_LOC_SP) {
 		sp_dmem_load(rdesc->proc_id,
@@ -143,7 +143,7 @@ int ia_css_queue_item_load(
 			  sizeof(ia_css_circbuf_elem_t));
 	} else if (rdesc->location == IA_CSS_QUEUE_LOC_ISP) {
 		/* Not supported yet */
-		return ENOTSUP;
+		return -ENOTSUPP;
 	}
 
 	return 0;
@@ -155,7 +155,7 @@ int ia_css_queue_item_store(
     ia_css_circbuf_elem_t *item)
 {
 	if (!rdesc || !item)
-		return EINVAL;
+		return -EINVAL;
 
 	if (rdesc->location == IA_CSS_QUEUE_LOC_SP) {
 		sp_dmem_store(rdesc->proc_id,
@@ -170,7 +170,7 @@ int ia_css_queue_item_store(
 			   sizeof(ia_css_circbuf_elem_t));
 	} else if (rdesc->location == IA_CSS_QUEUE_LOC_ISP) {
 		/* Not supported yet */
-		return ENOTSUP;
+		return -ENOTSUPP;
 	}
 
 	return 0;
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
index 884c55a754d1..41bec5675997 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
@@ -15,10 +15,11 @@
 #ifndef __QUEUE_ACCESS_H
 #define __QUEUE_ACCESS_H
 
+#include <linux/errno.h>
+
 #include <type_support.h>
 #include <ia_css_queue_comm.h>
 #include <ia_css_circbuf.h>
-#include <error_support.h>
 
 #define QUEUE_IGNORE_START_FLAG	0x0001
 #define QUEUE_IGNORE_END_FLAG	0x0002
-- 
2.26.2

