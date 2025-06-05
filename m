Return-Path: <linux-media+bounces-34102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F8ACEE34
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AE2B1893167
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 10:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CAE219A80;
	Thu,  5 Jun 2025 10:59:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27A32E659
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121160; cv=none; b=RIDrtt0mGoLRWoRBUxjVWtKRXjge1bGYwNJrhzT4FP4K6XWIYyYuQ1Gox9sTHht3J4d4C+l1gehBu5w3yHq3OcciZY8ka0/d8QAlpFCxqjvxyPmqaiI6zRUMW7/qZqrfFRm/qNvumZQC3hHOj6fISjmNtE+iRAND7U1fkjm1REs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121160; c=relaxed/simple;
	bh=UhZNnWixgQeuQSFXU8+6Euj9HbrFwzTuqeNDavBlU+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CuumLJ2NE3NBdEBsIR6hfFecFebVuoNhFh8lIERTkQc11JkDqJGfzo4OzZydRIdMtN1HaPPPNBhnNwZFR5X5JGH+EmX3DAZ2I4tYZAqwbK0fBVRkLBrbbmvVej5Q3lL2TeRZ3PQhkDk7gIhnVWyXO9qHpa4UctFh+hNAQEBar64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75708C4CEEB;
	Thu,  5 Jun 2025 10:59:16 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Junghak Sung <jh1009.sung@samsung.com>,
	Geunyoung Kim <nenggun.kim@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Inki Dae <inki.dae@samsung.com>,
	Satendra Singh Thakur <satendra.t@samsung.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 1/9] dvbv5: streaming support using videobuf2 for DVR and auto-scan
Date: Thu,  5 Jun 2025 12:58:24 +0200
Message-ID: <9ca7405af29f2167ebe4bec93443eff60faaa09f.1749121112.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1749121112.git.hverkuil@xs4all.nl>
References: <cover.1749121112.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Satendra Singh Thakur <satendra.t@samsung.com>

Ported an older patch (details given below) to latest v4l-utils:
 commit 6049ea8bd64f (Statically linking libdvbv5 must
 include -ludev) v4l-utils
 -Added videobuf2 code for auto-scan
-Enhanced queueing logic
--Enqueue all bufs in the begining, dequeue one buf
--Consume it, enqueue it again and so on..
-Added a common dvb-vb2 lib for following streaming APIs.
--initializatioin, deinitialization: unmap and dequeue
--enqueue buf, dequeue buf
--export buf, stream_to_file
--xioctl for repeated ioctl calling
-Added comments to functions
-This code could not be tested so far

Original patch:
https://patchwork.linuxtv.org/patch/31612/

Signed-off-by: Junghak Sung <jh1009.sung@samsung.com>
Signed-off-by: Geunyoung Kim <nenggun.kim@samsung.com>
Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Satendra Singh Thakur <satendra.t@samsung.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 lib/include/libdvbv5/dvb-dev.h |   8 +
 lib/include/libdvbv5/dvb-vb2.h | 147 +++++++++++++++
 lib/libdvbv5/dvb-scan.c        | 100 ++++++++--
 lib/libdvbv5/dvb-vb2.c         | 325 +++++++++++++++++++++++++++++++++
 lib/libdvbv5/meson.build       |   2 +
 utils/dvb/dvbv5-zap.c          |  30 ++-
 6 files changed, 599 insertions(+), 13 deletions(-)
 create mode 100644 lib/include/libdvbv5/dvb-vb2.h
 create mode 100644 lib/libdvbv5/dvb-vb2.c

diff --git a/lib/include/libdvbv5/dvb-dev.h b/lib/include/libdvbv5/dvb-dev.h
index 6b4d7483..3fdf7a09 100644
--- a/lib/include/libdvbv5/dvb-dev.h
+++ b/lib/include/libdvbv5/dvb-dev.h
@@ -308,6 +308,14 @@ struct dvb_open_descriptor *dvb_dev_open(struct dvb_device *dvb,
  * closed.
  */
 void dvb_dev_close(struct dvb_open_descriptor *open_dev);
+/**
+ * @brief Gets open file descriptor of a dvb device
+ * @ingroup dvb_device
+ *
+ * @param open_dev	Points to the struct dvb_open_descriptor
+ * @return Retuns fd on success, -1 otherwise.
+ */
+int dvb_dev_get_fd(struct dvb_open_descriptor *open_dev);
 
 /**
  * @brief returns fd from a local device
diff --git a/lib/include/libdvbv5/dvb-vb2.h b/lib/include/libdvbv5/dvb-vb2.h
new file mode 100644
index 00000000..e66b9efe
--- /dev/null
+++ b/lib/include/libdvbv5/dvb-vb2.h
@@ -0,0 +1,147 @@
+/*
+ * Copyright (c) 2017-2018 - Mauro Carvalho Chehab
+ * Copyright (c) 2017-2018 - Junghak Sung <jh1009.sung@samsung.com>
+ * Copyright (c) 2017-2018 - Satendra Singh Thakur <satendra.t@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation version 2.1 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Or, point your browser to http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
+ */
+#ifndef _LIBVB2_H
+#define _LIBVB2_H
+
+#include <stdint.h>
+#include <linux/dvb/dmx.h>
+
+/**
+ * @file dvb-vb2.h
+ * @ingroup frontend_scan
+ * @brief Provides interfaces to videobuf2 streaming for DVB.
+ * @copyright GNU Lesser General Public License version 2.1 (LGPLv2.1)
+ * @author Satendra Singh Thakur
+ *
+ * @par Bug Report
+ * Please submit bug reports and patches to linux-media@vger.kernel.org
+ */
+
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#define memzero(x) memset(&(x), 0, sizeof(x))
+
+/**Max count of the buffers*/
+#define MAX_STREAM_BUF_CNT	10
+
+/**
+ * struct stream_ctx - Streaming context
+ *
+ * @param in_fd		File descriptor of streaming device
+ * @param out_fd	File descriptor of output file
+ * @param buf_cnt	Count of the buffers to be queued/dequeued
+ * @param buf_size	Size of one such buffer
+ * @param buf		Pointer to array of buffers
+ * @param buf_flags	Array of boolean flags corresponding to buffers
+ * @param exp_fd	Array of file descriptors of exported buffers
+ * @param error		Error flag
+ */
+struct stream_ctx {
+	int in_fd;
+	int out_fd;
+	int buf_cnt;
+	int buf_size;
+	unsigned char *buf[MAX_STREAM_BUF_CNT];
+	int buf_flag[MAX_STREAM_BUF_CNT];
+	int exp_fd[MAX_STREAM_BUF_CNT];
+	int error;
+};
+/**
+ * stream_qbuf - Enqueues a buffer specified by index n
+ *
+ * @param sc		Context for streaming management
+ *			Pointer to &struct stream_ctx
+ * @param idx		Index of the buffer
+ *
+ * @return At return, it returns a negative value if error or
+ * zero on success.
+ */
+int stream_qbuf(struct stream_ctx *sc, int idx);
+
+/**
+ * sream_dqbuf - Dequeues a buffer specified by buf argument
+ *
+ * @param sc		Context for streaming management
+ *			Pointer to &struct stream_ctx
+ * @param buf		Pointer to &struct dmx_buffer
+ *
+ * @return At return, it returns a negative value if error or
+ * zero on success.
+ */
+int stream_dqbuf(struct stream_ctx *sc, struct dmx_buffer *buf);
+/**
+ * sream_expbuf - Exports a buffer specified by buf argument
+ *
+ * @param sc		Context for streaming management
+ *			Pointer to &struct stream_ctx
+ * @param idx		Index of the buffer
+ *
+ * @return At return, it returns a negative value if error or
+ * zero on success.
+ */
+int stream_expbuf(struct stream_ctx *sc, int idx);
+/**
+ * stream_init - Requests number of buffers from memory
+ * Gets pointer to the buffers from driver, mmaps those buffers
+ * and stores them in an array
+ * Also, optionally exports those buffers
+ *
+ * @param sc		Context for streaming management
+ * @param in_fd		File descriptor of the streaming device
+ * @param buf_size	Size of the buffer
+ * @param buf_cnt	Number of buffers
+ *
+ * @return At return, it returns a negative value if error or
+ * zero on success.
+ */
+int stream_init(struct stream_ctx *sc, int in_fd, int buf_size, int buf_cnt);
+
+/**
+ * @struct dvb_table_filter
+ * @brief De-initiazes streaming
+ * @ingroup frontend_scan
+ *
+ * @param sc		Pointer to &struct stream_ctx
+ */
+void stream_deinit(struct stream_ctx *sc);
+/**
+ * stream_to_file - Implements enqueue and dequeue logic
+ * First enqueues all the available buffers then dequeues
+ * one buffer, again enqueues it and so on.
+ *
+ * @param in_fd		File descriptor of the streaming device
+ * @param out_fd	File descriptor of output file
+ * @param timeout	Timeout in seconds
+ * @param dbg_level	Debug flag
+ * @param exit_flag	Flag to exit
+ *
+ * @return void
+ */
+void stream_to_file(int in_fd, int out_fd, int timeout, int dbg_level,
+			int *exit_flag);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/lib/libdvbv5/dvb-scan.c b/lib/libdvbv5/dvb-scan.c
index fcf2eba7..053ee137 100644
--- a/lib/libdvbv5/dvb-scan.c
+++ b/lib/libdvbv5/dvb-scan.c
@@ -72,6 +72,28 @@
 
 # define N_(string) string
 
+#define PERROR(x...)                                                    \
+	do {                                                            \
+		fprintf(stderr, "ERROR: ");                             \
+		fprintf(stderr, x);                                     \
+		fprintf(stderr, " (%s)\n", strerror(errno));		\
+	} while (0)
+
+
+/**Videobuf2 streaming
+ * Comment VB2 macro to disable the streaming code
+ */
+#define VB2
+
+#ifdef VB2
+#include <sys/mman.h>
+#include <libdvbv5/dvb-vb2.h>
+#define STREAM_BUF_CNT (4)
+#define STREAM_BUF_SIZ (DVB_MAX_PAYLOAD_PACKET_SIZE)
+
+struct stream_ctx sc = {0,};
+#endif
+
 static int dvb_poll(struct dvb_v5_fe_parms_priv *parms, int fd, unsigned int seconds)
 {
 	fd_set set;
@@ -331,7 +353,8 @@ int dvb_read_sections(struct dvb_v5_fe_parms *__p, int dmx_fd,
 	if (parms->p.verbose)
 		dvb_log(_("%s: waiting for table ID 0x%02x, program ID 0x%02x"),
 			__func__, sect->tid, sect->pid);
-
+#ifdef VB2
+#else
 	buf = calloc(DVB_MAX_PAYLOAD_PACKET_SIZE, 1);
 	if (!buf) {
 		dvb_logerr(_("%s: out of memory"), __func__);
@@ -339,7 +362,7 @@ int dvb_read_sections(struct dvb_v5_fe_parms *__p, int dmx_fd,
 		dvb_table_filter_free(sect);
 		return -1;
 	}
-
+#endif
 
 	do {
 		int available;
@@ -359,7 +382,23 @@ int dvb_read_sections(struct dvb_v5_fe_parms *__p, int dmx_fd,
 			ret = -1;
 			break;
 		}
+#ifdef VB2
+		struct dmx_buffer b;
+		memset(&b, 0, sizeof(b));
+
+		ret = stream_dqbuf(&sc, &b);
+		if (ret < 0) {
+			sc.error = 1;
+			break;
+		}
+		else {
+			sc.buf_flag[b.index] = 0;
+			buf = sc.buf[b.index];
+			buf_length = b.bytesused;
+		}
+#else
 		buf_length = read(dmx_fd, buf, DVB_MAX_PAYLOAD_PACKET_SIZE);
+#endif
 
 		if (!buf_length) {
 			dvb_logerr(_("%s: buf returned an empty buffer"), __func__);
@@ -380,8 +419,24 @@ int dvb_read_sections(struct dvb_v5_fe_parms *__p, int dmx_fd,
 		}
 
 		ret = dvb_parse_section(parms, sect, buf, buf_length);
+#ifdef VB2
+		/**enqueue the buffer again*/
+		if (!ret) {
+			if (stream_qbuf(&sc, b.index) < 0) {
+				sc.error = 1;
+				break;
+			}
+			else
+				sc.buf_flag[b.index] = 1;
+		}
+
+#endif
 	} while (!ret);
+
+#ifdef VB2
+#else
 	free(buf);
+#endif
 	dvb_dmx_stop(dmx_fd);
 	dvb_table_filter_free(sect);
 
@@ -459,9 +514,22 @@ struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p,
 
 	struct dvb_v5_descriptors *dvb_scan_handler;
 
+#ifdef VB2
+	rc = stream_init(&sc, dmx_fd, STREAM_BUF_SIZ, STREAM_BUF_CNT);
+	if (rc < 0) {
+		PERROR("stream_init failed: error %d, %s\n",
+				errno, strerror(errno));
+		/** We dont know what failed during stream_init
+		 * reqbufs, mmap or  qbuf. We will call stream_deinit
+		 * to delete the mapping which might have been created
+		 */
+		goto ret_null;
+	}
+#endif
+
 	dvb_scan_handler = dvb_scan_alloc_handler_table(delivery_system);
 	if (!dvb_scan_handler)
-		return NULL;
+		goto ret_null;
 
 	if (!timeout_multiply)
 		timeout_multiply = 1;
@@ -515,11 +583,11 @@ struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p,
 			      (void **)&dvb_scan_handler->pat,
 			      pat_pmt_time * timeout_multiply);
 	if (parms->p.abort)
-		return dvb_scan_handler;
+		goto ret_handler;
 	if (rc < 0) {
 		dvb_logerr(_("error while waiting for PAT table"));
 		dvb_scan_free_handler_table(dvb_scan_handler);
-		return NULL;
+		goto ret_null;
 	}
 	if (parms->p.verbose)
 		dvb_table_pat_print(&parms->p, dvb_scan_handler->pat);
@@ -531,7 +599,7 @@ struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p,
 				      (void **)&dvb_scan_handler->vct,
 				      vct_time * timeout_multiply);
 		if (parms->p.abort)
-			return dvb_scan_handler;
+			goto ret_handler;
 		if (rc < 0)
 			dvb_logerr(_("error while waiting for VCT table"));
 		else if (parms->p.verbose)
@@ -561,7 +629,7 @@ struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p,
 				      pat_pmt_time * timeout_multiply);
 		if (parms->p.abort) {
 			dvb_scan_handler->num_program = num_pmt + 1;
-			return dvb_scan_handler;
+			goto ret_handler;
 		}
 		if (rc < 0) {
 			dvb_logerr(_("error while reading the PMT table for service 0x%04x"),
@@ -582,7 +650,7 @@ struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p,
 			      (void **)&dvb_scan_handler->nit,
 			      nit_time * timeout_multiply);
 	if (parms->p.abort)
-		return dvb_scan_handler;
+		goto ret_handler;
 	if (rc < 0)
 		dvb_logerr(_("error while reading the NIT table"));
 	else if (parms->p.verbose)
@@ -595,7 +663,7 @@ struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p,
 				(void **)&dvb_scan_handler->sdt,
 				sdt_time * timeout_multiply);
 		if (parms->p.abort)
-			return dvb_scan_handler;
+			goto ret_handler;
 		if (rc < 0)
 			dvb_logerr(_("error while reading the SDT table"));
 		else if (parms->p.verbose)
@@ -611,7 +679,7 @@ struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p,
 				      (void **)&dvb_scan_handler->nit,
 				      nit_time * timeout_multiply);
 		if (parms->p.abort)
-			return dvb_scan_handler;
+			goto ret_handler;
 		if (rc < 0)
 			dvb_logerr(_("error while reading the NIT table"));
 		else if (parms->p.verbose)
@@ -622,13 +690,23 @@ struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p,
 				(void **)&dvb_scan_handler->sdt,
 				sdt_time * timeout_multiply);
 		if (parms->p.abort)
-			return dvb_scan_handler;
+			goto ret_handler;
 		if (rc < 0)
 			dvb_logerr(_("error while reading the SDT table"));
 		else if (parms->p.verbose)
 			dvb_table_sdt_print(&parms->p, dvb_scan_handler->sdt);
 	}
 
+ret_null:
+#ifdef VB2
+	stream_deinit(&sc);
+#endif
+	return NULL;
+
+ret_handler:
+#ifdef VB2
+	stream_deinit(&sc);
+#endif
 	return dvb_scan_handler;
 }
 
diff --git a/lib/libdvbv5/dvb-vb2.c b/lib/libdvbv5/dvb-vb2.c
new file mode 100644
index 00000000..9617d1b1
--- /dev/null
+++ b/lib/libdvbv5/dvb-vb2.c
@@ -0,0 +1,325 @@
+/*
+ * Copyright (c) 2017-2018 - Mauro Carvalho Chehab
+ * Copyright (c) 2017-2018 - Junghak Sung <jh1009.sung@samsung.com>
+ * Copyright (c) 2017-2018 - Satendra Singh Thakur <satendra.t@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation version 2.1 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Or, point your browser to http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
+ */
+
+/******************************************************************************
+ * Implements videobuf2 streaming APIs for DVB
+ *****************************************************************************/
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <stdlib.h>
+#include <sys/time.h>
+
+#include <sys/mman.h>
+#include <libdvbv5/dvb-vb2.h>
+
+#define PERROR(x...)                                                    \
+	do {                                                            \
+		fprintf(stderr, "ERROR: ");                             \
+		fprintf(stderr, x);                                     \
+		fprintf(stderr, " (%s)\n", strerror(errno));		\
+	} while (0)
+
+/**These 2 params are for DVR*/
+#define STREAM_BUF_CNT (10)
+#define STREAM_BUF_SIZ (188*1024)
+/*Sleep time for retry, in case ioctl fails*/
+#define SLEEP_US	1000
+
+static inline int xioctl(int fd, unsigned long int cmd, void *arg)
+{
+	int ret;
+	struct timespec stime, etime;
+	long long etimell = 0, stimell = 0;
+	clock_gettime(CLOCK_MONOTONIC, &stime);
+	do {
+		ret = ioctl(fd, cmd, arg);
+		if (ret < 0 && (errno == EINTR || errno == EAGAIN)) {
+			clock_gettime(CLOCK_MONOTONIC, &etime);
+			etimell = (long long) etime.tv_sec * 1000000000 +
+					etime.tv_nsec;
+			stimell = (long long) (stime.tv_sec + 1 /*1 sec wait*/)
+					* 1000000000 + stime.tv_nsec;
+			if (etimell > stimell)
+				break;
+			/*wait for some time to prevent cpu hogging*/
+			usleep(SLEEP_US);
+			continue;
+		}
+		else
+			break;
+	} while (1);
+
+        return ret;
+}
+
+
+/**
+ * stream_qbuf - Enqueues a buffer specified by index
+ *
+ * @param sc		Context for streaming management
+ *			Pointer to &struct stream_ctx
+ * @param idx		Index of the buffer
+ *
+ * @return At return, it returns a negative value if error or
+ * zero on success.
+ */
+int stream_qbuf(struct stream_ctx *sc, int idx)
+{
+	struct dmx_buffer buf;
+	int ret;
+
+	memzero(buf);
+	buf.index = idx;
+
+	ret = xioctl(sc->in_fd, DMX_QBUF, &buf);
+	if (ret < 0) {
+		PERROR("DMX_QBUF failed: error=%d", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * stream_dqbuf - Dequeues a buffer specified by index
+ *
+ * @param sc		Context for streaming management
+ *			Pointer to &struct stream_ctx
+ * @param buf		Pointer to &struct dmx_buffer
+ *
+ * @return At return, it returns a negative value if error or
+ * zero on success.
+ */
+int stream_dqbuf(struct stream_ctx *sc, struct dmx_buffer *buf)
+{
+	int ret;
+
+	ret = xioctl(sc->in_fd, DMX_DQBUF, buf);
+	if (ret < 0) {
+		PERROR("DMX_DQBUF failed: error=%d", ret);
+		return ret;
+	}
+
+	return ret;
+}
+/**
+ * sream_expbuf - Exports a buffer specified by buf argument
+ *
+ * @param sc		Context for streaming management
+ *			Pointer to &struct stream_ctx
+ * @param idx		Buffer index
+ *
+ * @return At return, it returns a negative value if error or
+ * zero on success.
+ */
+int stream_expbuf(struct stream_ctx *sc, int idx)
+{
+	int ret;
+	struct dmx_exportbuffer exp;
+	memzero(exp);
+	exp.index = idx;
+	ret = ioctl(sc->in_fd, DMX_EXPBUF, &exp);
+	if (ret) {
+		PERROR("DMX_EXPBUF failed: buf=%d error=%d", idx, ret);
+		return ret;
+	}
+	sc->exp_fd[idx] = exp.fd;
+	fprintf(stderr, "Export buffer %d (fd=%d)\n",
+			idx, sc->exp_fd[idx]);
+	return ret;
+}
+/**
+ * stream_init - Requests number of buffers from memory
+ * Gets pointer to the buffers from driver, mmaps those buffers
+ * and stores them in an array
+ * Also, optionally exports those buffers
+ *
+ * @param sc		Context for streaming management
+ * @param in_fd		File descriptor of the streaming device
+ * @param buf_size	Size of the buffer
+ * @param buf_cnt	Count of the buffers
+ *
+ * @return At return, it returns a negative value if error or
+ * zero on success.
+ */
+int stream_init(struct stream_ctx *sc, int in_fd, int buf_size, int buf_cnt)
+{
+	struct dmx_requestbuffers req;
+	struct dmx_buffer buf;
+	int ret;
+	int i;
+
+	memset(sc, 0, sizeof(struct stream_ctx));
+	sc->in_fd = in_fd;
+	sc->buf_size = buf_size;
+	sc->buf_cnt = buf_cnt;
+
+	memzero(req);
+	req.count = sc->buf_cnt;
+	req.size = sc->buf_size;
+
+	ret = xioctl(in_fd, DMX_REQBUFS, &req);
+	if (ret) {
+		PERROR("DMX_REQBUFS failed: error=%d", ret);
+		return ret;
+	}
+
+	if (sc->buf_cnt != req.count) {
+		PERROR("buf_cnt %d -> %d changed !!!", sc->buf_cnt, req.count);
+		sc->buf_cnt = req.count;
+	}
+
+	for (i = 0; i < sc->buf_cnt; i++) {
+		memzero(buf);
+		buf.index = i;
+
+		ret = xioctl(in_fd, DMX_QUERYBUF, &buf);
+		if (ret) {
+			PERROR("DMX_QUERYBUF failed: buf=%d error=%d", i, ret);
+			return ret;
+		}
+
+		sc->buf[i] = mmap(NULL, buf.length,
+					PROT_READ | PROT_WRITE, MAP_SHARED,
+					in_fd, buf.offset);
+
+		if (sc->buf[i] == MAP_FAILED) {
+			PERROR("Failed to MMAP buffer %d", i);
+			return -1;
+		}
+		/**enqueue the buffers*/
+		ret = stream_qbuf(sc, i);
+		if (ret) {
+			PERROR("stream_qbuf failed: buf=%d error=%d", i, ret);
+			return ret;
+		}
+
+		sc->buf_flag[i] = 1;
+	}
+
+	return 0;
+}
+
+/**
+ * stream_deinit - Dequeues and unmaps the buffers
+ *
+ * @param sc - Context for streaming management
+ *
+ * @return At return, it returns a negative value if error or
+ * zero on success.
+ */
+void stream_deinit(struct stream_ctx *sc)
+{
+	struct dmx_buffer buf;
+	int ret;
+	int i;
+
+	for (i = 0; i < sc->buf_cnt; i++) {
+		memzero(buf);
+		buf.index = i;
+
+		if (sc->buf_flag[i]) {
+			ret = stream_dqbuf(sc, &buf);
+			if (ret) {
+				PERROR("stream_dqbuf failed: buf=%d error=%d",
+					 i, ret);
+			}
+		}
+		ret = munmap(sc->buf[i], sc->buf_size);
+		if (ret) {
+			PERROR("munmap failed: buf=%d error=%d", i, ret);
+		}
+
+	}
+
+	return;
+}
+
+/**
+ * stream_to_file - Implements enqueue and dequeue logic
+ * First enqueues all the available buffers then dequeues
+ * one buffer, again enqueues it and so on.
+ *
+ * @param in_fd		File descriptor of the streaming device
+ * @param out_fd	File descriptor of output file
+ * @param timeout	Timeout in seconds
+ * @param dbg_level	Debug flag
+ * @param exit_flag	Flag to exit
+ *
+ * @return void
+ */
+void stream_to_file(int in_fd, int out_fd, int timeout, int dbg_level,
+			int *exit_flag)
+{
+	struct stream_ctx sc;
+	int ret;
+	long long int rc = 0LL;
+
+	ret = stream_init(&sc, in_fd, STREAM_BUF_SIZ, STREAM_BUF_CNT);
+	if (ret < 0) {
+		PERROR("[%s] Failed to setup buffers!!!", __func__);
+		sc.error = 1;
+		return;
+	}
+	fprintf(stderr, "start streaming!!!\n");
+	sc.out_fd = out_fd;
+
+	while (!*exit_flag  && !sc.error) {
+		/* dequeue the buffer */
+		struct dmx_buffer b;
+
+		memzero(b);
+		ret = stream_dqbuf(&sc, &b);
+		if (ret < 0) {
+			sc.error = 1;
+			break;
+		}
+		else {
+			sc.buf_flag[b.index] = 0;
+			ret = write(sc.out_fd, sc.buf[b.index],
+					b.bytesused);
+			if (ret < 0) {
+				PERROR("Write failed err=%d", ret);
+				break;
+			} else
+				rc += b.bytesused;
+		}
+
+		/* enqueue the buffer */
+		ret = stream_qbuf(&sc, b.index);
+		if (ret < 0)
+			sc.error = 1;
+		else
+			sc.buf_flag[b.index] = 1;
+	}
+	if (dbg_level < 2) {
+		fprintf(stderr, "copied %lld bytes (%lld Kbytes/sec)\n", rc,
+			rc / (1024 * timeout));
+	}
+	stream_deinit(&sc);
+}
diff --git a/lib/libdvbv5/meson.build b/lib/libdvbv5/meson.build
index 8f5929fc..eedb1ead 100644
--- a/lib/libdvbv5/meson.build
+++ b/lib/libdvbv5/meson.build
@@ -40,6 +40,7 @@ libdvbv5_sources = files(
     'dvb-legacy-channel-format.c',
     'dvb-log.c',
     'dvb-sat.c',
+    'dvb-vb2.c',
     'dvb-scan.c',
     'dvb-v5-std.c',
     'dvb-v5.c',
@@ -105,6 +106,7 @@ libdvbv5_api = files(
     '../include/libdvbv5/dvb-frontend.h',
     '../include/libdvbv5/dvb-log.h',
     '../include/libdvbv5/dvb-sat.h',
+    '../include/libdvbv5/dvb-vb2.h',
     '../include/libdvbv5/dvb-scan.h',
     '../include/libdvbv5/dvb-v5-std.h',
     '../include/libdvbv5/eit.h',
diff --git a/utils/dvb/dvbv5-zap.c b/utils/dvb/dvbv5-zap.c
index 5f84e101..7ff1d3d1 100644
--- a/utils/dvb/dvbv5-zap.c
+++ b/utils/dvb/dvbv5-zap.c
@@ -47,6 +47,7 @@
 #include <signal.h>
 #include <argp.h>
 #include <sys/time.h>
+#include <sys/mman.h>
 #include <time.h>
 
 #ifdef ENABLE_NLS
@@ -68,6 +69,7 @@
 #include "libdvbv5/dvb-scan.h"
 #include "libdvbv5/header.h"
 #include "libdvbv5/countries.h"
+#include "libdvbv5/dvb-vb2.h"
 
 #define CHANNEL_FILE	"channels.conf"
 #define PROGRAM_NAME	"dvbv5-zap"
@@ -93,6 +95,7 @@ struct arguments {
 	unsigned n_apid, n_vpid, extra_pids, all_pids;
 	enum dvb_file_formats input_format, output_format;
 	unsigned traffic_monitor, low_traffic, non_human, port;
+	unsigned int streaming;
 	char *search, *server;
 	const char *cc;
 
@@ -116,6 +119,7 @@ static const struct argp_option options[] = {
 	{"pat",		'p', NULL,			0, N_("add pat and pmt to TS recording (implies -r)"), 0},
 	{"all-pids",	'P', NULL,			0, N_("don't filter any pids. Instead, outputs all of them"), 0 },
 	{"record",	'r', NULL,			0, N_("set up /dev/dvb/adapterX/dvr0 for TS recording"), 0},
+	{"streaming",	'R', NULL,			0, N_("uses streaming I/O for TS recording"), 0},
 	{"silence",	's', NULL,			0, N_("increases silence (can be used more than once)"), 0},
 	{"sat_number",	'S', N_("satellite_number"),	0, N_("satellite number. If not specified, disable DISEqC"), 0},
 	{"timeout",	't', N_("seconds"),		0, N_("timeout for zapping and for recording"), 0},
@@ -636,6 +640,10 @@ static error_t parse_opt(int k, char *optarg, struct argp_state *state)
 	case 'r':
 		args->dvr = 1;
 		break;
+	case 'R':
+		args->dvr = 1;
+		args->streaming = 1;
+		break;
 	case 'p':
 		args->rec_psi = 1;
 		break;
@@ -1382,14 +1390,32 @@ int main(int argc, char **argv)
 			get_show_stats(stderr, &args, parms, 0);
 
 		if (file_fd >= 0) {
-			dvr_fd = dvb_dev_open(dvb, args.dvr_dev, O_RDONLY);
+			int flag, fd;
+
+			if (args.streaming)
+				flag = O_RDWR;
+			else
+				flag = O_RDONLY;
+
+			dvr_fd = dvb_dev_open(dvb, args.dvr_dev, flag);
 			if (!dvr_fd) {
 				ERROR("failed opening '%s'", args.dvr_dev);
 				goto err;
 			}
 			if (!timeout_flag)
 				fprintf(stderr, _("Record to file '%s' started\n"), args.filename);
-			copy_to_file(dvr_fd, file_fd, args.timeout, args.silent);
+			if (args.streaming) {
+				fd = dvb_dev_get_fd(dvr_fd);
+				if (fd < 0) {
+					ERROR("Invalid fd for '%s'",
+						args.dvr_dev);
+					goto err;
+				}
+				stream_to_file(fd, file_fd, args.timeout,
+						args.silent, &timeout_flag);
+			} else
+				copy_to_file(dvr_fd, file_fd, args.timeout,
+						args.silent);
 		} else if (args.server && args.port) {
 			struct stat st;
 			if (stat(args.dvr_pipe, &st) == -1) {
-- 
2.47.2


