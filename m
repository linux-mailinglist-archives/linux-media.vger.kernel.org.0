Return-Path: <linux-media+bounces-34104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C225AACEE36
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BCC417331B
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 10:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A64A21ABC9;
	Thu,  5 Jun 2025 10:59:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7876215198
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121161; cv=none; b=e3hBvbLYOGgtp0FCi3W/cwlr//zt58P4yu2WHSqVCo121JVvHfLPj/wgyD3RoGMTca49G98qbA0iB+JpPk6hWoScGjkw6W+u6I0XCy9R0GctAiE742N/vrO6CUD2wycMlRZnlZjRj9A+ESxDl4Zuw2Ft5Driy1NB45Hdpjd/I8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121161; c=relaxed/simple;
	bh=ijnPPM8yMOI/1lvjw2ErVpRsvusPGrSKkTD/uQcZ7zE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqjyVdPmQuSOKUfs0nAZiOKpyTY+g7MrcRCvPBVruk5mogLXA0zQLcaBI2onR+vaU2cF6vBHUoHEFyfcLHys7RYXeNLxGXCYpjP8b/ISBAFXu41wDyk2IEKF/PdFSiukTsyIhdtYDGpb55TdA+TEOa1brsur8EVxdssOE7Pkh9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7AFC4CEEF;
	Thu,  5 Jun 2025 10:59:20 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 3/9] dvb-vb2: add dvb_v5_stream_alloc/free
Date: Thu,  5 Jun 2025 12:58:26 +0200
Message-ID: <64dbdb597c17dcb87dbd7016df3f0eba19996f74.1749121112.git.hverkuil@xs4all.nl>
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

Add new functions to allocate/free a stream context.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 lib/include/libdvbv5/dvb-vb2.h | 14 +++++++++
 lib/libdvbv5/dvb-vb2.c         | 57 ++++++++++++++++++++++++----------
 2 files changed, 55 insertions(+), 16 deletions(-)

diff --git a/lib/include/libdvbv5/dvb-vb2.h b/lib/include/libdvbv5/dvb-vb2.h
index 26b73fbf..cef046e8 100644
--- a/lib/include/libdvbv5/dvb-vb2.h
+++ b/lib/include/libdvbv5/dvb-vb2.h
@@ -101,6 +101,13 @@ int dvb_v5_stream_dqbuf(struct dvb_v5_stream_ctx *sc, struct dmx_buffer *buf);
  */
 int dvb_v5_stream_expbuf(struct dvb_v5_stream_ctx *sc, int idx);
 
+/**
+ * dvb_v5_stream_alloc - Allocate stream context
+ *
+ * @return a stream context or NULL.
+ */
+struct dvb_v5_stream_ctx *dvb_v5_stream_alloc(void);
+
 /**
  * dvb_v5_stream_init - Requests number of buffers from memory
  * Gets pointer to the buffers from driver, mmaps those buffers
@@ -124,6 +131,13 @@ int dvb_v5_stream_init(struct dvb_v5_stream_ctx *sc, int in_fd, int buf_size, in
  */
 void dvb_v5_stream_deinit(struct dvb_v5_stream_ctx *sc);
 
+/**
+ * dvb_v5_stream_free - Free stream context
+ *
+ * @param sc - Context for streaming management
+ */
+void dvb_v5_stream_free(struct dvb_v5_stream_ctx *sc);
+
 /**
  * dvb_v5_stream_to_file - Implements enqueue and dequeue logic
  * First enqueues all the available buffers then dequeues
diff --git a/lib/libdvbv5/dvb-vb2.c b/lib/libdvbv5/dvb-vb2.c
index 8678a767..56a35f81 100644
--- a/lib/libdvbv5/dvb-vb2.c
+++ b/lib/libdvbv5/dvb-vb2.c
@@ -155,6 +155,17 @@ int dvb_v5_stream_expbuf(struct dvb_v5_stream_ctx *sc, int idx)
 			idx, sc->exp_fd[idx]);
 	return ret;
 }
+
+/**
+ * dvb_v5_stream_alloc - Allocate stream context
+ *
+ * @return a stream context or NULL.
+ */
+struct dvb_v5_stream_ctx *dvb_v5_stream_alloc(void)
+{
+	return calloc(1, sizeof(struct dvb_v5_stream_ctx));
+}
+
 /**
  * dvb_v5_stream_init - Requests number of buffers from memory
  * Gets pointer to the buffers from driver, mmaps those buffers
@@ -262,6 +273,16 @@ void dvb_v5_stream_deinit(struct dvb_v5_stream_ctx *sc)
 	return;
 }
 
+/**
+ * dvb_v5_stream_free - Free stream context
+ *
+ * @param sc - Context for streaming management
+ */
+void dvb_v5_stream_free(struct dvb_v5_stream_ctx *sc)
+{
+	free(sc);
+}
+
 /**
  * dvb_v5_stream_to_file - Implements enqueue and dequeue logic
  * First enqueues all the available buffers then dequeues
@@ -278,33 +299,36 @@ void dvb_v5_stream_deinit(struct dvb_v5_stream_ctx *sc)
 void dvb_v5_stream_to_file(int in_fd, int out_fd, int timeout, int dbg_level,
 			   int *exit_flag)
 {
-	struct dvb_v5_stream_ctx sc;
-	int ret;
+	struct dvb_v5_stream_ctx *sc = dvb_v5_stream_alloc();
 	long long int rc = 0LL;
+	int ret;
 
-	ret = dvb_v5_stream_init(&sc, in_fd, STREAM_BUF_SIZ, STREAM_BUF_CNT);
+	if (!sc) {
+		PERROR("[%s] Failed to allocate stream context", __func__);
+		return;
+	}
+	ret = dvb_v5_stream_init(sc, in_fd, STREAM_BUF_SIZ, STREAM_BUF_CNT);
 	if (ret < 0) {
-		PERROR("[%s] Failed to setup buffers!!!", __func__);
-		sc.error = 1;
+		PERROR("[%s] Failed to initialize stream context", __func__);
+		dvb_v5_stream_free(sc);
 		return;
 	}
 	fprintf(stderr, "start streaming!!!\n");
-	sc.out_fd = out_fd;
+	sc->out_fd = out_fd;
 
-	while (!*exit_flag  && !sc.error) {
+	while (!*exit_flag  && !sc->error) {
 		/* dequeue the buffer */
 		struct dmx_buffer b;
 
 		memzero(b);
-		ret = dvb_v5_stream_dqbuf(&sc, &b);
+		ret = dvb_v5_stream_dqbuf(sc, &b);
 		if (ret < 0) {
-			sc.error = 1;
+			sc->error = 1;
 			break;
 		}
 		else {
-			sc.buf_flag[b.index] = 0;
-			ret = write(sc.out_fd, sc.buf[b.index],
-					b.bytesused);
+			sc->buf_flag[b.index] = 0;
+			ret = write(sc->out_fd, sc->buf[b.index], b.bytesused);
 			if (ret < 0) {
 				PERROR("Write failed err=%d", ret);
 				break;
@@ -313,15 +337,16 @@ void dvb_v5_stream_to_file(int in_fd, int out_fd, int timeout, int dbg_level,
 		}
 
 		/* enqueue the buffer */
-		ret = dvb_v5_stream_qbuf(&sc, b.index);
+		ret = dvb_v5_stream_qbuf(sc, b.index);
 		if (ret < 0)
-			sc.error = 1;
+			sc->error = 1;
 		else
-			sc.buf_flag[b.index] = 1;
+			sc->buf_flag[b.index] = 1;
 	}
 	if (dbg_level < 2) {
 		fprintf(stderr, "copied %lld bytes (%lld Kbytes/sec)\n", rc,
 			rc / (1024 * timeout));
 	}
-	dvb_v5_stream_deinit(&sc);
+	dvb_v5_stream_deinit(sc);
+	dvb_v5_stream_free(sc);
 }
-- 
2.47.2


