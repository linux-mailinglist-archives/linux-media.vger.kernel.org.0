Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BA469002A
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 07:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjBIGFO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 01:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjBIGFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 01:05:12 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD4B3EC42
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 22:05:05 -0800 (PST)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id CB3BE66020B6;
        Thu,  9 Feb 2023 06:05:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1675922703;
        bh=bGz0EnT5x5HVVUKF2v4pbuADo0Gtfk4Grus+BY/mAcI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DFL+kagv5ImfJvVtatbQngiLIkKpfEDSN6ukqdrDC8MFNf+VhIZ15vo0WYFVi9YcF
         nhv67xlcJEtmfPn6NDsKYM5shjDlzJZewl4sb38DtaK7NGkv70xFVa57IzB/uFOHPH
         scM/ntbCEgflwWUGAG0BbcpQUaxN3JolpoL4EraUAduEHiJ2WiwmWoSG6Y1RdQuFYw
         8hLdBFs6szI/H51/Tl9QqXUOGADuzSlIqIh4iERqhWpPCyJBUC8Y6nj7YanZ5rsuUy
         DlJ8OlnwTkVUig5tw759+TTQnvml/VvnOL/p7CsSdt4Ja6IkAmk1zArqM91mHv3g/U
         FeA2sSDkty7gw==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 1/5] v4l2-tracer: add signal handling
Date:   Wed,  8 Feb 2023 22:06:21 -0800
Message-Id: <9a27488bde3db32f8c9add1b0a84ea54d36e1054.1675920064.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675920064.git.deborah.brouwer@collabora.com>
References: <cover.1675920064.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make sure that any SIGINT or SIGTERM received by the v4l2-tracer gets
passed onto the traced process. This allows the tracee to exit gracefully
before v4l2-tracer exits.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/v4l2-tracer.cpp | 32 ++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
index 3afcd34f..ae6f68e4 100644
--- a/utils/v4l2-tracer/v4l2-tracer.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -10,6 +10,16 @@
 
 int tracer(int argc, char *argv[], bool retrace = false);
 
+pid_t tracee_pid = 0;
+
+void v4l2_tracer_sig_handler(int signum)
+{
+	fprintf(stderr, "%s:%s:%d: received: %d\n", __FILE__, __func__, __LINE__, signum);
+	kill(tracee_pid, signum);
+	/* Wait for tracee to handle the signal first before v4l2-tracer exits. */
+	wait(nullptr);
+}
+
 enum Options {
 	V4l2TracerOptCompactPrint = 'c',
 	V4l2TracerOptSetVideoDevice = 'd',
@@ -307,7 +317,8 @@ int tracer(int argc, char *argv[], bool retrace)
 		fprintf(stderr, "Loading libv4l2tracer: %s\n", libv4l2tracer_path.c_str());
 	setenv("LD_PRELOAD", libv4l2tracer_path.c_str(), 0);
 
-	if (fork() == 0) {
+	tracee_pid = fork();
+	if (tracee_pid == 0) {
 
 		if (is_debug()) {
 			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
@@ -328,16 +339,10 @@ int tracer(int argc, char *argv[], bool retrace)
 	int exec_result = 0;
 	wait(&exec_result);
 
-	if (WEXITSTATUS(exec_result)) {
-		fprintf(stderr, "Trace error: %s\n", trace_filename.c_str());
+	if (WIFEXITED(exec_result))
+		WEXITSTATUS(exec_result);
 
-		trace_file = fopen(trace_filename.c_str(), "a");
-		fseek(trace_file, 0L, SEEK_END);
-		fputs("\n]\n", trace_file);
-		fclose(trace_file);
-
-		exit(EXIT_FAILURE);
-	}
+	fprintf(stderr, "Tracee exited with status: %d\n", exec_result);
 
 	/* Close the json-array and the trace file. */
 	trace_file = fopen(trace_filename.c_str(), "a");
@@ -352,7 +357,7 @@ int tracer(int argc, char *argv[], bool retrace)
 	fprintf(stderr, "%s", trace_filename.c_str());
 	fprintf(stderr, "\n");
 
-	return 0;
+	return exec_result;
 }
 
 int main(int argc, char *argv[])
@@ -388,6 +393,11 @@ int main(int argc, char *argv[])
 		return ret;
 	}
 
+	struct sigaction act = {};
+	act.sa_handler = v4l2_tracer_sig_handler;
+	sigaction(SIGINT, &act, nullptr);
+	sigaction(SIGTERM, &act, nullptr);
+
 	if (command == "trace") {
 		ret = tracer(argc, argv);
 	} else if (command == "retrace") {
-- 
2.39.0

