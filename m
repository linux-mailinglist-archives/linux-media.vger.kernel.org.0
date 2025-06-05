Return-Path: <linux-media+bounces-34105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7808FACEE37
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5370E18945E2
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 10:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0114F218AA3;
	Thu,  5 Jun 2025 10:59:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6FE215198
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 10:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121162; cv=none; b=CtixhR/4NhoqVPUjWxXO6Mgv0WbIwVhAWVRzSi650BbIPhQEE/UH8hKrGVqBKBQqGsbOi8FOwBAyagbEjksU/M+zumoB7EjBXjfymyOsfX6uJP0STeE+ZbNXozh7p4rZnegh6uztKU6IrLm+AG9tz5btinwh1by6UoIzJAH3xYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121162; c=relaxed/simple;
	bh=AgaZIF3D8LmH2lM0WCv0WB08cUdgWGxWSmbUzEMLg0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9RSkripq2uVxXtZoYRsifgejTqjI5dA6DnhWllJEeRdzVHokooQI7o3hqGNJtWCemrFoijkOq6Jt7UsGV//R3KKSfMDu1bqhecFXVuqdQzKhuAOXVBwAf4dHfiRw+HyU5+EgOL85xJnL7RrWBTLsqOO0zcbfF5GC0+a12lS94E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D707C4CEE7;
	Thu,  5 Jun 2025 10:59:21 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 4/9] libdvbv5: prepare for vb2 stream context
Date: Thu,  5 Jun 2025 12:58:27 +0200
Message-ID: <dd25a01d9e7c377340e5f189bc1cf6ea12d2782f.1749121112.git.hverkuil@xs4all.nl>
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

Prepare the libdvbv5 code to support vb2 streaming I/O.

This removes the #ifdef VB2 and instead checks for the presence of
the stream context.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 lib/include/libdvbv5/dvb-fe.h |   5 ++
 lib/libdvbv5/dvb-fe-priv.h    |   2 +-
 lib/libdvbv5/dvb-scan.c       | 127 ++++++++++++++++------------------
 lib/libdvbv5/dvb-vb2.c        |   3 -
 4 files changed, 65 insertions(+), 72 deletions(-)

diff --git a/lib/include/libdvbv5/dvb-fe.h b/lib/include/libdvbv5/dvb-fe.h
index ed283f29..44bf18a1 100644
--- a/lib/include/libdvbv5/dvb-fe.h
+++ b/lib/include/libdvbv5/dvb-fe.h
@@ -83,6 +83,8 @@
 
 #endif
 
+struct dvb_v5_stream_ctx;
+
 /**
  * @struct dvb_v5_fe_parms
  * @ingroup frontend
@@ -105,6 +107,7 @@
  * @param lnb			LNBf description (RW)
  * @param sat_number		Number of the satellite (used by DISEqC setup) (RW)
  * @param freq_bpf		SCR/Unicable band-pass filter frequency to use, in kHz
+ * @param stream_ctx		VB2 stream context
  * @param verbose		Verbosity level of the library (RW)
  * @param dvb_logfunc		Function used to write log messages (RO)
  * @param default_charset	Name of the charset used by the DVB standard (RW)
@@ -138,6 +141,8 @@ struct dvb_v5_fe_parms {
 	unsigned			freq_bpf;
 	unsigned			diseqc_wait;
 
+	struct dvb_v5_stream_ctx	*stream_ctx;
+
 	/* Function to write DVB logs */
 	unsigned			verbose;
 	dvb_logfunc                     logfunc;
diff --git a/lib/libdvbv5/dvb-fe-priv.h b/lib/libdvbv5/dvb-fe-priv.h
index 239c48f8..895631ed 100644
--- a/lib/libdvbv5/dvb-fe-priv.h
+++ b/lib/libdvbv5/dvb-fe-priv.h
@@ -57,7 +57,7 @@ struct dvb_v5_stats {
 struct dvb_device_priv;
 
 struct dvb_v5_fe_parms_priv {
-	/* dvbv_v4_fe_parms should be the first element on this struct */
+	/* dvbv_v5_fe_parms should be the first element on this struct */
 	struct dvb_v5_fe_parms		p;
 
 	struct dvb_device_priv		*dvb;
diff --git a/lib/libdvbv5/dvb-scan.c b/lib/libdvbv5/dvb-scan.c
index 353802a5..3f52d140 100644
--- a/lib/libdvbv5/dvb-scan.c
+++ b/lib/libdvbv5/dvb-scan.c
@@ -34,6 +34,7 @@
 #include <sys/ioctl.h>
 #include <sys/stat.h>
 #include <sys/types.h>
+#include <sys/mman.h>
 #include <stdlib.h>
 #include <sys/time.h>
 
@@ -46,6 +47,7 @@
 #include <libdvbv5/dvb-scan.h>
 #include <libdvbv5/dvb-log.h>
 #include <libdvbv5/dvb-demux.h>
+#include <libdvbv5/dvb-vb2.h>
 #include <libdvbv5/descriptors.h>
 #include <libdvbv5/header.h>
 #include <libdvbv5/pat.h>
@@ -79,21 +81,9 @@
 		fprintf(stderr, " (%s)\n", strerror(errno));		\
 	} while (0)
 
-
-/**Videobuf2 streaming
- * Comment VB2 macro to disable the streaming code
- */
-#define VB2
-
-#ifdef VB2
-#include <sys/mman.h>
-#include <libdvbv5/dvb-vb2.h>
 #define STREAM_BUF_CNT (4)
 #define STREAM_BUF_SIZ (DVB_MAX_PAYLOAD_PACKET_SIZE)
 
-struct dvb_v5_stream_ctx sc = {0,};
-#endif
-
 static int dvb_poll(struct dvb_v5_fe_parms_priv *parms, int fd, unsigned int seconds)
 {
 	fd_set set;
@@ -353,21 +343,22 @@ int dvb_read_sections(struct dvb_v5_fe_parms *__p, int dmx_fd,
 	if (parms->p.verbose)
 		dvb_log(_("%s: waiting for table ID 0x%02x, program ID 0x%02x"),
 			__func__, sect->tid, sect->pid);
-#ifdef VB2
-#else
-	buf = calloc(DVB_MAX_PAYLOAD_PACKET_SIZE, 1);
-	if (!buf) {
-		dvb_logerr(_("%s: out of memory"), __func__);
-		dvb_dmx_stop(dmx_fd);
-		dvb_table_filter_free(sect);
-		return -1;
+
+	if (!parms->p.stream_ctx) {
+		buf = calloc(DVB_MAX_PAYLOAD_PACKET_SIZE, 1);
+		if (!buf) {
+			dvb_logerr(_("%s: out of memory"), __func__);
+			dvb_dmx_stop(dmx_fd);
+			dvb_table_filter_free(sect);
+			return -1;
+		}
 	}
-#endif
 
 	do {
 		int available;
 		uint32_t crc;
 		ssize_t buf_length = 0;
+		struct dmx_buffer b;
 
 		do {
 			available = dvb_poll(parms, dmx_fd, timeout);
@@ -382,23 +373,23 @@ int dvb_read_sections(struct dvb_v5_fe_parms *__p, int dmx_fd,
 			ret = -1;
 			break;
 		}
-#ifdef VB2
-		struct dmx_buffer b;
-		memset(&b, 0, sizeof(b));
 
-		ret = dvb_v5_stream_dqbuf(&sc, &b);
-		if (ret < 0) {
-			sc.error = 1;
-			break;
+		if (parms->p.stream_ctx) {
+			memset(&b, 0, sizeof(b));
+
+			ret = dvb_v5_stream_dqbuf(parms->p.stream_ctx, &b);
+			if (ret < 0) {
+				parms->p.stream_ctx->error = 1;
+				break;
+			}
+			else {
+				parms->p.stream_ctx->buf_flag[b.index] = 0;
+				buf = parms->p.stream_ctx->buf[b.index];
+				buf_length = b.bytesused;
+			}
+		} else {
+			buf_length = read(dmx_fd, buf, DVB_MAX_PAYLOAD_PACKET_SIZE);
 		}
-		else {
-			sc.buf_flag[b.index] = 0;
-			buf = sc.buf[b.index];
-			buf_length = b.bytesused;
-		}
-#else
-		buf_length = read(dmx_fd, buf, DVB_MAX_PAYLOAD_PACKET_SIZE);
-#endif
 
 		if (!buf_length) {
 			dvb_logerr(_("%s: buf returned an empty buffer"), __func__);
@@ -419,24 +410,23 @@ int dvb_read_sections(struct dvb_v5_fe_parms *__p, int dmx_fd,
 		}
 
 		ret = dvb_parse_section(parms, sect, buf, buf_length);
-#ifdef VB2
-		/**enqueue the buffer again*/
-		if (!ret) {
-			if (dvb_v5_stream_qbuf(&sc, b.index) < 0) {
-				sc.error = 1;
-				break;
-			}
-			else
-				sc.buf_flag[b.index] = 1;
-		}
 
-#endif
+		if (parms->p.stream_ctx) {
+			/**enqueue the buffer again*/
+			if (!ret) {
+				if (dvb_v5_stream_qbuf(parms->p.stream_ctx, b.index) < 0) {
+					parms->p.stream_ctx->error = 1;
+					break;
+				} else {
+					parms->p.stream_ctx->buf_flag[b.index] = 1;
+				}
+			}
+		}
 	} while (!ret);
 
-#ifdef VB2
-#else
-	free(buf);
-#endif
+	if (!parms->p.stream_ctx) {
+		free(buf);
+	}
 	dvb_dmx_stop(dmx_fd);
 	dvb_table_filter_free(sect);
 
@@ -514,18 +504,18 @@ struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p,
 
 	struct dvb_v5_descriptors *dvb_scan_handler;
 
-#ifdef VB2
-	rc = dvb_v5_stream_init(&sc, dmx_fd, STREAM_BUF_SIZ, STREAM_BUF_CNT);
-	if (rc < 0) {
-		PERROR("stream_init failed: error %d, %s\n",
-				errno, strerror(errno));
-		/** We don't know what failed during dvb_v5_stream_init
-		 * reqbufs, mmap or  qbuf. We will call dvb_v5_stream_deinit
-		 * to delete the mapping which might have been created
-		 */
-		goto ret_null;
+	if (parms->p.stream_ctx) {
+		rc = dvb_v5_stream_init(parms->p.stream_ctx, dmx_fd, STREAM_BUF_SIZ, STREAM_BUF_CNT);
+		if (rc < 0) {
+			PERROR("stream_init failed: error %d, %s\n",
+			       errno, strerror(errno));
+			/** We don't know what failed during dvb_v5_stream_init
+			 * reqbufs, mmap or  qbuf. We will call dvb_v5_stream_deinit
+			 * to delete the mapping which might have been created
+			 */
+			goto ret_null;
+		}
 	}
-#endif
 
 	dvb_scan_handler = dvb_scan_alloc_handler_table(delivery_system);
 	if (!dvb_scan_handler)
@@ -696,17 +686,18 @@ struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p,
 		else if (parms->p.verbose)
 			dvb_table_sdt_print(&parms->p, dvb_scan_handler->sdt);
 	}
+	return dvb_scan_handler;
 
 ret_null:
-#ifdef VB2
-	dvb_v5_stream_deinit(&sc);
-#endif
+	if (parms->p.stream_ctx) {
+		dvb_v5_stream_deinit(parms->p.stream_ctx);
+	}
 	return NULL;
 
 ret_handler:
-#ifdef VB2
-	dvb_v5_stream_deinit(&sc);
-#endif
+	if (parms->p.stream_ctx) {
+		dvb_v5_stream_deinit(parms->p.stream_ctx);
+	}
 	return dvb_scan_handler;
 }
 
diff --git a/lib/libdvbv5/dvb-vb2.c b/lib/libdvbv5/dvb-vb2.c
index 56a35f81..60e53287 100644
--- a/lib/libdvbv5/dvb-vb2.c
+++ b/lib/libdvbv5/dvb-vb2.c
@@ -269,8 +269,6 @@ void dvb_v5_stream_deinit(struct dvb_v5_stream_ctx *sc)
 		}
 
 	}
-
-	return;
 }
 
 /**
@@ -313,7 +311,6 @@ void dvb_v5_stream_to_file(int in_fd, int out_fd, int timeout, int dbg_level,
 		dvb_v5_stream_free(sc);
 		return;
 	}
-	fprintf(stderr, "start streaming!!!\n");
 	sc->out_fd = out_fd;
 
 	while (!*exit_flag  && !sc->error) {
-- 
2.47.2


