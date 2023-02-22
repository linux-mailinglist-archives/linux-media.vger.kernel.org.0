Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9358C69FDF4
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 22:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbjBVVsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 16:48:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbjBVVsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 16:48:37 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AF33A8A
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 13:48:10 -0800 (PST)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 9DEC466021E4;
        Wed, 22 Feb 2023 21:48:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1677102488;
        bh=9UFG0RtVowRVDpX1cEVovSCYJegizbOmO9JZSvEp4B4=;
        h=From:To:Cc:Subject:Date:From;
        b=huL5iOkZ2MFZFiggJ9Yn4lLHd3fYX8rmUa0Nh5ZX6mcTtJIab8jSX3ILKkNVRjwwx
         9argKTVl58dsudT5GPG/8FYsaVY4hsX1ZyClTv/UeDAnIEkDQVP/vhLBwOdOI4hH5P
         XZwAvQ4HtoGkq/rsqf8bQd8ADhOMPaZ7CKLpSzjtZXxcXKxaBsl9JSdC6GoBeGCpdE
         xX8cwt+dRoQEIVL4edi5emV2g56FbTM6qhldROzGddCQH0ej3jpPCTCDq5veGTdzxc
         Ve4qZRX3nk7dXIPXSeSzY+eyzH2vOm2XI3dYzrUQFNNtZbL+iCTxK3IVDu1aloqDXD
         o4/ylDzHpy1hg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2] v4l2-tracer: remove trailing comma from JSON trace
Date:   Wed, 22 Feb 2023 13:49:41 -0800
Message-Id: <20230222214941.118075-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
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

Put the trace file into valid JSON format by removing the trailing comma
from the trace file array.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes since v1:
- open file in "r+" and use fseek instead of ftruncate

 utils/v4l2-tracer/v4l2-tracer.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
index ae6f68e4..cb873d83 100644
--- a/utils/v4l2-tracer/v4l2-tracer.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -345,8 +345,8 @@ int tracer(int argc, char *argv[], bool retrace)
 	fprintf(stderr, "Tracee exited with status: %d\n", exec_result);
 
 	/* Close the json-array and the trace file. */
-	trace_file = fopen(trace_filename.c_str(), "a");
-	fseek(trace_file, 0L, SEEK_END);
+	trace_file = fopen(trace_filename.c_str(), "r+");
+	fseek(trace_file, -2L, SEEK_END);
 	fputs("\n]\n", trace_file);
 	fclose(trace_file);
 
-- 
2.39.1

