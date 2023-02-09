Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8123869002B
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 07:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjBIGFP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 01:05:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjBIGFO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 01:05:14 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795A63E0A9
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 22:05:07 -0800 (PST)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5FC8666020B7;
        Thu,  9 Feb 2023 06:05:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1675922706;
        bh=6Xm9G0szwz5lit2nZ7RfRLOVy6mihaMjAyvwSG1OXNQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kZz8eNN0J9SW+fSxjVgA7mtveNxaFUbwn9xwnJRCALYPCjnTNfgbDrqyaHZnpNeLE
         OJMGDIDuWhRGJKmrJ+9Nt9cogUsCISkNmJro9WvTW4aIZxbDOe+AMcsYFdB8Za5Jav
         je/51ZHGzLkLNSoY3DB96X4j0A89L+JY5mRjSDJjlsypKf0awPyrSVxB0x8h6IcaAs
         NkqbqIiD6Uk95jddvVJSqJbWOMM3u/KsOYmK7Hra+TgKZtpHC9pppsxW/L1mn2Idep
         7H9RTlOuqH1YFeUE2sLd2NBdQ1eSqQqXzDNzoJ7RlQJLGYFk7f7Ziarulr2t0VDf3I
         lmVmwMgyqNSig==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 2/5] v4l2-tracer: remove trailing comma from JSON trace
Date:   Wed,  8 Feb 2023 22:06:22 -0800
Message-Id: <abcc11027eb2a9364c7ba8f6b7ea2d3688ef8f09.1675920064.git.deborah.brouwer@collabora.com>
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

Put the trace file into valid JSON format by removing the trailing comma
from the trace file array.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/v4l2-tracer.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
index ae6f68e4..7adbe04e 100644
--- a/utils/v4l2-tracer/v4l2-tracer.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -346,7 +346,7 @@ int tracer(int argc, char *argv[], bool retrace)
 
 	/* Close the json-array and the trace file. */
 	trace_file = fopen(trace_filename.c_str(), "a");
-	fseek(trace_file, 0L, SEEK_END);
+	ftruncate(fileno(trace_file), lseek(fileno(trace_file), 0, SEEK_END) - 2);
 	fputs("\n]\n", trace_file);
 	fclose(trace_file);
 
-- 
2.39.0

