Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3785F7101F1
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 02:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbjEYAVK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 20:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbjEYAVJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 20:21:09 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F647135
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 17:21:06 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6280A66032CB;
        Thu, 25 May 2023 01:21:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684974065;
        bh=P106wTNuEibYz+U08z9gx85lbtcHdCymaEmO4toUxtk=;
        h=From:To:Cc:Subject:Date:From;
        b=jKkc58w7dx4VJCK+bTEQwBUx9lDn3pVYJsNBdX5FWtgmuuF2fnPx7H5Da5dwRhke9
         8nyag0t4dMQGJQCVpjB/PHuXU0sj6rM7XMoLNtZ5T9po35WpQR3rtaJbltuHAlN6h5
         XFb7Yf02MKxq2TT8x3kBFZcigRzO1OGgTohulYBk0O0nHfIj/qskqjTh4rePUz2eCS
         W3j/yserAq9R0zmMICSBlDp7OlL4C6tOJBKH7Pbqm4J+yZoKPZTxXI411LiKSO3yVI
         ZsXNV6eQDjsAtSm2mViJMw8UAg1dv8CxY3zKzzwqzAK1lRjdy5wXHc1WbT8zPzNwji
         6ycALduOy2I2g==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH] v4l2-tracer: Fix libv4l2tracer.so loader
Date:   Wed, 24 May 2023 17:20:45 -0700
Message-Id: <20230525002045.82937-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Nicolas Dufresne <nicolas.dufresne@collabora.com>

The code was still assuming libtools being use, so it didn't work
installed anymore. Also, it didn't work installed if the full
v4l2-tracer path was being passed.

Fix this by always trying next by libv4l2tracer.so loading (using stat()
to validate) and always fallback to the installed path otherwise.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Hi - thanks to Nicolas for this patch.
I tested tracing and retracing on both installed and uninstalled
v4l2-tracer including with and without an absolute path and it
all works as expected.

Note that I've got three sets of v4l2-tracer patches outstanding now,
but they all still apply independently of each other:

Tuner patches:
https://lore.kernel.org/linux-media/cover.1684453027.git.deborah.brouwer@collabora.com/

Debug patches:
https://lore.kernel.org/linux-media/cover.1681245372.git.deborah.brouwer@collabora.com/

Thanks,
Deb

 utils/v4l2-tracer/v4l2-tracer.cpp | 33 +++++++++++++++++--------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
index e3f002a9..7c3662be 100644
--- a/utils/v4l2-tracer/v4l2-tracer.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -5,6 +5,7 @@
 
 #include "retrace.h"
 #include <climits>
+#include <sys/stat.h>
 #include <sys/wait.h>
 #include <time.h>
 
@@ -295,24 +296,26 @@ int tracer(int argc, char *argv[], bool retrace)
 	fclose(trace_file);
 
 	/*
-	 * Preload the libv4l2tracer library. If the program is installed, load the library
-	 * from its installed location, otherwise load it locally. If it's loaded locally,
-	 * use ./configure --disable-dyn-libv4l.
+	 * Preload the libv4l2tracer library. The libv4l2tracer is looked up next to
+	 * the executable first in order to support uninstalled build.
 	 */
 	std::string libv4l2tracer_path;
 	std::string program = argv[0];
-	std::size_t idx = program.rfind("/v4l2-tracer");
-	if (idx != std::string::npos) {
-		libv4l2tracer_path = program.replace(program.begin() + idx + 1, program.end(), ".libs");
-		DIR *directory_pointer = opendir(libv4l2tracer_path.c_str());
-		if (directory_pointer == nullptr)
-			libv4l2tracer_path = program.replace(program.begin() + idx, program.end(), "./.libs");
-		else
-			closedir(directory_pointer);
-	} else {
-		libv4l2tracer_path = LIBTRACER_PATH;
-	}
-	libv4l2tracer_path += "/libv4l2tracer.so";
+	std::size_t idx = program.rfind("/");
+	struct stat sb;
+
+	if (idx == std::string::npos)
+		idx = 0;
+	else
+		idx++;
+
+	/* look for libv4l2tracer next to the executable */
+	libv4l2tracer_path = program.replace(program.begin() + idx, program.end(), "libv4l2tracer.so");
+
+	/* otherwise, use the installation path */
+	if (stat(libv4l2tracer_path.c_str(), &sb) == -1)
+		libv4l2tracer_path = std::string(LIBTRACER_PATH) + "/libv4l2tracer.so";
+
 	if (is_verbose())
 		fprintf(stderr, "Loading libv4l2tracer: %s\n", libv4l2tracer_path.c_str());
 	setenv("LD_PRELOAD", libv4l2tracer_path.c_str(), 0);
-- 
2.40.1

