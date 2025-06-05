Return-Path: <linux-media+bounces-34103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E26ACEE35
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5C9C1733F2
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 10:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD79521A454;
	Thu,  5 Jun 2025 10:59:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57174219A8B
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121160; cv=none; b=pDf8C/af8zwabxnT2Lzf2+xGGDkBL+1aR+SBagQnawJViP6CM2TOIDp+yfrb8YyUG9hsV7PFaLL/nlqOZ1VQcXdPPk+p4b4MIdtSyMwuXLK8eLmzgpEuWtgOKOTuONOXwwT/d2V0w6xogY9qZU6VaTf+YXcblmGWOf2PSjZjKgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121160; c=relaxed/simple;
	bh=duGC6aGEx5cdKnA4jp28cRJx08y4aWBycfYcEfeKCu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kT6To4NU3EpJlJkqoZoJ1SZH7zkpzh21+77utqgatulyGDDMwnw9TT15wSHG5hRLwjSyzCkCjTDiYWMa8sAozf9/GVQT2Ke8Qa5G0Ri8n0oSt/bul4LGsrBVv8M3ZeO1hN7qEt/EzwuZLWUErEqHga7FwqmP+1x2B+ky2Rc6PHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBADC4CEE7;
	Thu,  5 Jun 2025 10:59:18 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 2/9] dvbv5: use proper dvb_v5 namespace
Date: Thu,  5 Jun 2025 12:58:25 +0200
Message-ID: <d4fd0d55fc2f8a6a39b1bb03944a3971cbcddcd7.1749121112.git.hverkuil@xs4all.nl>
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

The use of just 'stream_' as prefix is not unique enough. Use
dvb_v5_stream_ instead.

Also add some newlines to make the code easier to read.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 lib/include/libdvbv5/dvb-vb2.h | 56 +++++++++++++++++-----------------
 lib/libdvbv5/dvb-scan.c        | 16 +++++-----
 lib/libdvbv5/dvb-vb2.c         | 50 +++++++++++++++---------------
 utils/dvb/dvbv5-zap.c          |  4 +--
 4 files changed, 64 insertions(+), 62 deletions(-)

diff --git a/lib/include/libdvbv5/dvb-vb2.h b/lib/include/libdvbv5/dvb-vb2.h
index e66b9efe..26b73fbf 100644
--- a/lib/include/libdvbv5/dvb-vb2.h
+++ b/lib/include/libdvbv5/dvb-vb2.h
@@ -39,13 +39,11 @@
 extern "C" {
 #endif
 
-#define memzero(x) memset(&(x), 0, sizeof(x))
-
-/**Max count of the buffers*/
-#define MAX_STREAM_BUF_CNT	10
+/** Max count of the buffers */
+#define DVB_V5_MAX_STREAM_BUF_CNT	10
 
 /**
- * struct stream_ctx - Streaming context
+ * struct dvb_v5_stream_ctx - Streaming context
  *
  * @param in_fd		File descriptor of streaming device
  * @param out_fd	File descriptor of output file
@@ -56,52 +54,55 @@ extern "C" {
  * @param exp_fd	Array of file descriptors of exported buffers
  * @param error		Error flag
  */
-struct stream_ctx {
+struct dvb_v5_stream_ctx {
 	int in_fd;
 	int out_fd;
 	int buf_cnt;
 	int buf_size;
-	unsigned char *buf[MAX_STREAM_BUF_CNT];
-	int buf_flag[MAX_STREAM_BUF_CNT];
-	int exp_fd[MAX_STREAM_BUF_CNT];
+	unsigned char *buf[DVB_V5_MAX_STREAM_BUF_CNT];
+	int buf_flag[DVB_V5_MAX_STREAM_BUF_CNT];
+	int exp_fd[DVB_V5_MAX_STREAM_BUF_CNT];
 	int error;
 };
+
 /**
- * stream_qbuf - Enqueues a buffer specified by index n
+ * dvb_v5_stream_qbuf - Enqueues a buffer specified by index n
  *
  * @param sc		Context for streaming management
- *			Pointer to &struct stream_ctx
+ *			Pointer to &struct dvb_v5_stream_ctx
  * @param idx		Index of the buffer
  *
  * @return At return, it returns a negative value if error or
  * zero on success.
  */
-int stream_qbuf(struct stream_ctx *sc, int idx);
+int dvb_v5_stream_qbuf(struct dvb_v5_stream_ctx *sc, int idx);
 
 /**
- * sream_dqbuf - Dequeues a buffer specified by buf argument
+ * dvb_v5_stream_dqbuf - Dequeues a buffer specified by buf argument
  *
  * @param sc		Context for streaming management
- *			Pointer to &struct stream_ctx
+ *			Pointer to &struct dvb_v5_stream_ctx
  * @param buf		Pointer to &struct dmx_buffer
  *
  * @return At return, it returns a negative value if error or
  * zero on success.
  */
-int stream_dqbuf(struct stream_ctx *sc, struct dmx_buffer *buf);
+int dvb_v5_stream_dqbuf(struct dvb_v5_stream_ctx *sc, struct dmx_buffer *buf);
+
 /**
- * sream_expbuf - Exports a buffer specified by buf argument
+ * dvb_v5_stream_expbuf - Exports a buffer specified by buf argument
  *
  * @param sc		Context for streaming management
- *			Pointer to &struct stream_ctx
+ *			Pointer to &struct dvb_v5_stream_ctx
  * @param idx		Index of the buffer
  *
  * @return At return, it returns a negative value if error or
  * zero on success.
  */
-int stream_expbuf(struct stream_ctx *sc, int idx);
+int dvb_v5_stream_expbuf(struct dvb_v5_stream_ctx *sc, int idx);
+
 /**
- * stream_init - Requests number of buffers from memory
+ * dvb_v5_stream_init - Requests number of buffers from memory
  * Gets pointer to the buffers from driver, mmaps those buffers
  * and stores them in an array
  * Also, optionally exports those buffers
@@ -114,18 +115,17 @@ int stream_expbuf(struct stream_ctx *sc, int idx);
  * @return At return, it returns a negative value if error or
  * zero on success.
  */
-int stream_init(struct stream_ctx *sc, int in_fd, int buf_size, int buf_cnt);
+int dvb_v5_stream_init(struct dvb_v5_stream_ctx *sc, int in_fd, int buf_size, int buf_cnt);
 
 /**
- * @struct dvb_table_filter
- * @brief De-initiazes streaming
- * @ingroup frontend_scan
+ * dvb_v5_stream_deinit - Dequeues and unmaps the buffers
  *
- * @param sc		Pointer to &struct stream_ctx
+ * @param sc		Pointer to &struct dvb_v5_stream_ctx
  */
-void stream_deinit(struct stream_ctx *sc);
+void dvb_v5_stream_deinit(struct dvb_v5_stream_ctx *sc);
+
 /**
- * stream_to_file - Implements enqueue and dequeue logic
+ * dvb_v5_stream_to_file - Implements enqueue and dequeue logic
  * First enqueues all the available buffers then dequeues
  * one buffer, again enqueues it and so on.
  *
@@ -137,8 +137,8 @@ void stream_deinit(struct stream_ctx *sc);
  *
  * @return void
  */
-void stream_to_file(int in_fd, int out_fd, int timeout, int dbg_level,
-			int *exit_flag);
+void dvb_v5_stream_to_file(int in_fd, int out_fd, int timeout, int dbg_level,
+			   int *exit_flag);
 
 #ifdef __cplusplus
 }
diff --git a/lib/libdvbv5/dvb-scan.c b/lib/libdvbv5/dvb-scan.c
index 053ee137..353802a5 100644
--- a/lib/libdvbv5/dvb-scan.c
+++ b/lib/libdvbv5/dvb-scan.c
@@ -91,7 +91,7 @@
 #define STREAM_BUF_CNT (4)
 #define STREAM_BUF_SIZ (DVB_MAX_PAYLOAD_PACKET_SIZE)
 
-struct stream_ctx sc = {0,};
+struct dvb_v5_stream_ctx sc = {0,};
 #endif
 
 static int dvb_poll(struct dvb_v5_fe_parms_priv *parms, int fd, unsigned int seconds)
@@ -386,7 +386,7 @@ int dvb_read_sections(struct dvb_v5_fe_parms *__p, int dmx_fd,
 		struct dmx_buffer b;
 		memset(&b, 0, sizeof(b));
 
-		ret = stream_dqbuf(&sc, &b);
+		ret = dvb_v5_stream_dqbuf(&sc, &b);
 		if (ret < 0) {
 			sc.error = 1;
 			break;
@@ -422,7 +422,7 @@ int dvb_read_sections(struct dvb_v5_fe_parms *__p, int dmx_fd,
 #ifdef VB2
 		/**enqueue the buffer again*/
 		if (!ret) {
-			if (stream_qbuf(&sc, b.index) < 0) {
+			if (dvb_v5_stream_qbuf(&sc, b.index) < 0) {
 				sc.error = 1;
 				break;
 			}
@@ -515,12 +515,12 @@ struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p,
 	struct dvb_v5_descriptors *dvb_scan_handler;
 
 #ifdef VB2
-	rc = stream_init(&sc, dmx_fd, STREAM_BUF_SIZ, STREAM_BUF_CNT);
+	rc = dvb_v5_stream_init(&sc, dmx_fd, STREAM_BUF_SIZ, STREAM_BUF_CNT);
 	if (rc < 0) {
 		PERROR("stream_init failed: error %d, %s\n",
 				errno, strerror(errno));
-		/** We dont know what failed during stream_init
-		 * reqbufs, mmap or  qbuf. We will call stream_deinit
+		/** We don't know what failed during dvb_v5_stream_init
+		 * reqbufs, mmap or  qbuf. We will call dvb_v5_stream_deinit
 		 * to delete the mapping which might have been created
 		 */
 		goto ret_null;
@@ -699,13 +699,13 @@ struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p,
 
 ret_null:
 #ifdef VB2
-	stream_deinit(&sc);
+	dvb_v5_stream_deinit(&sc);
 #endif
 	return NULL;
 
 ret_handler:
 #ifdef VB2
-	stream_deinit(&sc);
+	dvb_v5_stream_deinit(&sc);
 #endif
 	return dvb_scan_handler;
 }
diff --git a/lib/libdvbv5/dvb-vb2.c b/lib/libdvbv5/dvb-vb2.c
index 9617d1b1..8678a767 100644
--- a/lib/libdvbv5/dvb-vb2.c
+++ b/lib/libdvbv5/dvb-vb2.c
@@ -50,6 +50,8 @@
 /*Sleep time for retry, in case ioctl fails*/
 #define SLEEP_US	1000
 
+#define memzero(x) memset(&(x), 0, sizeof(x))
+
 static inline int xioctl(int fd, unsigned long int cmd, void *arg)
 {
 	int ret;
@@ -79,16 +81,16 @@ static inline int xioctl(int fd, unsigned long int cmd, void *arg)
 
 
 /**
- * stream_qbuf - Enqueues a buffer specified by index
+ * dvb_v5_stream_qbuf - Enqueues a buffer specified by index
  *
  * @param sc		Context for streaming management
- *			Pointer to &struct stream_ctx
+ *			Pointer to &struct dvb_v5_stream_ctx
  * @param idx		Index of the buffer
  *
  * @return At return, it returns a negative value if error or
  * zero on success.
  */
-int stream_qbuf(struct stream_ctx *sc, int idx)
+int dvb_v5_stream_qbuf(struct dvb_v5_stream_ctx *sc, int idx)
 {
 	struct dmx_buffer buf;
 	int ret;
@@ -106,16 +108,16 @@ int stream_qbuf(struct stream_ctx *sc, int idx)
 }
 
 /**
- * stream_dqbuf - Dequeues a buffer specified by index
+ * dvb_v5_stream_dqbuf - Dequeues a buffer specified by index
  *
  * @param sc		Context for streaming management
- *			Pointer to &struct stream_ctx
+ *			Pointer to &struct dvb_v5_stream_ctx
  * @param buf		Pointer to &struct dmx_buffer
  *
  * @return At return, it returns a negative value if error or
  * zero on success.
  */
-int stream_dqbuf(struct stream_ctx *sc, struct dmx_buffer *buf)
+int dvb_v5_stream_dqbuf(struct dvb_v5_stream_ctx *sc, struct dmx_buffer *buf)
 {
 	int ret;
 
@@ -128,16 +130,16 @@ int stream_dqbuf(struct stream_ctx *sc, struct dmx_buffer *buf)
 	return ret;
 }
 /**
- * sream_expbuf - Exports a buffer specified by buf argument
+ * dvb_v5_stream_expbuf - Exports a buffer specified by buf argument
  *
  * @param sc		Context for streaming management
- *			Pointer to &struct stream_ctx
+ *			Pointer to &struct dvb_v5_stream_ctx
  * @param idx		Buffer index
  *
  * @return At return, it returns a negative value if error or
  * zero on success.
  */
-int stream_expbuf(struct stream_ctx *sc, int idx)
+int dvb_v5_stream_expbuf(struct dvb_v5_stream_ctx *sc, int idx)
 {
 	int ret;
 	struct dmx_exportbuffer exp;
@@ -154,7 +156,7 @@ int stream_expbuf(struct stream_ctx *sc, int idx)
 	return ret;
 }
 /**
- * stream_init - Requests number of buffers from memory
+ * dvb_v5_stream_init - Requests number of buffers from memory
  * Gets pointer to the buffers from driver, mmaps those buffers
  * and stores them in an array
  * Also, optionally exports those buffers
@@ -167,14 +169,14 @@ int stream_expbuf(struct stream_ctx *sc, int idx)
  * @return At return, it returns a negative value if error or
  * zero on success.
  */
-int stream_init(struct stream_ctx *sc, int in_fd, int buf_size, int buf_cnt)
+int dvb_v5_stream_init(struct dvb_v5_stream_ctx *sc, int in_fd, int buf_size, int buf_cnt)
 {
 	struct dmx_requestbuffers req;
 	struct dmx_buffer buf;
 	int ret;
 	int i;
 
-	memset(sc, 0, sizeof(struct stream_ctx));
+	memset(sc, 0, sizeof(struct dvb_v5_stream_ctx));
 	sc->in_fd = in_fd;
 	sc->buf_size = buf_size;
 	sc->buf_cnt = buf_cnt;
@@ -213,7 +215,7 @@ int stream_init(struct stream_ctx *sc, int in_fd, int buf_size, int buf_cnt)
 			return -1;
 		}
 		/**enqueue the buffers*/
-		ret = stream_qbuf(sc, i);
+		ret = dvb_v5_stream_qbuf(sc, i);
 		if (ret) {
 			PERROR("stream_qbuf failed: buf=%d error=%d", i, ret);
 			return ret;
@@ -226,14 +228,14 @@ int stream_init(struct stream_ctx *sc, int in_fd, int buf_size, int buf_cnt)
 }
 
 /**
- * stream_deinit - Dequeues and unmaps the buffers
+ * dvb_v5_stream_deinit - Dequeues and unmaps the buffers
  *
  * @param sc - Context for streaming management
  *
  * @return At return, it returns a negative value if error or
  * zero on success.
  */
-void stream_deinit(struct stream_ctx *sc)
+void dvb_v5_stream_deinit(struct dvb_v5_stream_ctx *sc)
 {
 	struct dmx_buffer buf;
 	int ret;
@@ -244,7 +246,7 @@ void stream_deinit(struct stream_ctx *sc)
 		buf.index = i;
 
 		if (sc->buf_flag[i]) {
-			ret = stream_dqbuf(sc, &buf);
+			ret = dvb_v5_stream_dqbuf(sc, &buf);
 			if (ret) {
 				PERROR("stream_dqbuf failed: buf=%d error=%d",
 					 i, ret);
@@ -261,7 +263,7 @@ void stream_deinit(struct stream_ctx *sc)
 }
 
 /**
- * stream_to_file - Implements enqueue and dequeue logic
+ * dvb_v5_stream_to_file - Implements enqueue and dequeue logic
  * First enqueues all the available buffers then dequeues
  * one buffer, again enqueues it and so on.
  *
@@ -273,14 +275,14 @@ void stream_deinit(struct stream_ctx *sc)
  *
  * @return void
  */
-void stream_to_file(int in_fd, int out_fd, int timeout, int dbg_level,
-			int *exit_flag)
+void dvb_v5_stream_to_file(int in_fd, int out_fd, int timeout, int dbg_level,
+			   int *exit_flag)
 {
-	struct stream_ctx sc;
+	struct dvb_v5_stream_ctx sc;
 	int ret;
 	long long int rc = 0LL;
 
-	ret = stream_init(&sc, in_fd, STREAM_BUF_SIZ, STREAM_BUF_CNT);
+	ret = dvb_v5_stream_init(&sc, in_fd, STREAM_BUF_SIZ, STREAM_BUF_CNT);
 	if (ret < 0) {
 		PERROR("[%s] Failed to setup buffers!!!", __func__);
 		sc.error = 1;
@@ -294,7 +296,7 @@ void stream_to_file(int in_fd, int out_fd, int timeout, int dbg_level,
 		struct dmx_buffer b;
 
 		memzero(b);
-		ret = stream_dqbuf(&sc, &b);
+		ret = dvb_v5_stream_dqbuf(&sc, &b);
 		if (ret < 0) {
 			sc.error = 1;
 			break;
@@ -311,7 +313,7 @@ void stream_to_file(int in_fd, int out_fd, int timeout, int dbg_level,
 		}
 
 		/* enqueue the buffer */
-		ret = stream_qbuf(&sc, b.index);
+		ret = dvb_v5_stream_qbuf(&sc, b.index);
 		if (ret < 0)
 			sc.error = 1;
 		else
@@ -321,5 +323,5 @@ void stream_to_file(int in_fd, int out_fd, int timeout, int dbg_level,
 		fprintf(stderr, "copied %lld bytes (%lld Kbytes/sec)\n", rc,
 			rc / (1024 * timeout));
 	}
-	stream_deinit(&sc);
+	dvb_v5_stream_deinit(&sc);
 }
diff --git a/utils/dvb/dvbv5-zap.c b/utils/dvb/dvbv5-zap.c
index 7ff1d3d1..aca751af 100644
--- a/utils/dvb/dvbv5-zap.c
+++ b/utils/dvb/dvbv5-zap.c
@@ -1411,8 +1411,8 @@ int main(int argc, char **argv)
 						args.dvr_dev);
 					goto err;
 				}
-				stream_to_file(fd, file_fd, args.timeout,
-						args.silent, &timeout_flag);
+				dvb_v5_stream_to_file(fd, file_fd, args.timeout,
+						      args.silent, &timeout_flag);
 			} else
 				copy_to_file(dvr_fd, file_fd, args.timeout,
 						args.silent);
-- 
2.47.2


