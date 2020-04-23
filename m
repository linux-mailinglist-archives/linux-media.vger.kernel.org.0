Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F981B65F4
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 23:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgDWVKt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 17:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbgDWVKs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 17:10:48 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C37C09B042
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 14:10:47 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id fu13so2426582pjb.5
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 14:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=odzY2H9MOg6XnqWqH3v4/StHWBLH4+8YutE666x3msg=;
        b=TLBKjNX9AbFhEZefKEvLa/tPyDAUfY2dMDu0CacKPYtnkRJof+yoM9oZ+yO5Wwa74k
         eYC2i4OeOURIUEX4sTtBder8LAs9W0AG4bCgi53kA5gFHy/UUD73dTY50i+ANj5fLjn4
         p664rRG46pgi0mG16QtbPTg3O/7yGAUVdD3YcVoAqBmGzDpWXmXODMLlFfi7mIUYW8T1
         dc+Z3Gh2C790So1mgCp+1wstnCCjkkUkrAfw6ZNfWATmF7Ez6XHjcFS7YorqPNs8K1QZ
         9VByE6OVSn2G4dwxDOf1C6M7qa4Jxxbn4Jhb/cxzRQ7HLPomycZ+D8BoxRWaBqF6koKe
         TO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=odzY2H9MOg6XnqWqH3v4/StHWBLH4+8YutE666x3msg=;
        b=P6XlAu0HD2OHjN3Y3VAxwxnmEiMnQUVEf3N47FDsERQTMbbd0dipWdG45gTGasHhMO
         Y+Sg6tkSIe5ANePkTaUAQpz0/OIDvZKp90N/GFtJFbz5bk7RHByPl7lpXVN8+JOv0j78
         etnDyaoRX1xeox93Oio/Ry/FI1cPXqN0qX2lwh6rF1iqjMXzKF9S+AbRLVk5pCEr9Jah
         sYGawcFql//gq9eyKbIGZMKygRUgPVquz7gn50UsqLZdDM0Xe5TID7cRdxnsBAA8zt0t
         72yaFVI5GF922/qE1gfVf5Ml0qsqWmTpAu1fOdSeXprKPLVPk8vBttycj/x1us2uFmTl
         7Krg==
X-Gm-Message-State: AGi0PuateK401Rg3s0xsXwAh9j5GBpACirVgRLO25vPR7nw/g7oMkARW
        YXp4KKVSAoS9LlAb9AmWt6sTSn3v
X-Google-Smtp-Source: APiQypK2Ky/H+eIc5LwOXyx4RRMvDDK4iarTk9d/2BK16WbXRSMtPyasziIamHVz7jdpTqAXg4VVmw==
X-Received: by 2002:a17:902:ac87:: with SMTP id h7mr5452209plr.119.1587676246175;
        Thu, 23 Apr 2020 14:10:46 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id f21sm3563630pfn.71.2020.04.23.14.10.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 14:10:45 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/5] utils: add noreturn attribute and remove dead code
Date:   Thu, 23 Apr 2020 14:10:37 -0700
Message-Id: <20200423211040.14275-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200423211040.14275-1-rosenp@gmail.com>
References: <20200423211040.14275-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wmissing-noreturn and -Wunreachable-code-return

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp | 10 +++++-----
 utils/v4l2-dbg/v4l2-dbg.cpp               |  5 ++---
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index b3a18492..a312f54d 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -247,7 +247,6 @@ static void usage()
 	printf("  -w, --wrapper      Use the libv4l2 wrapper library.\n");
 #endif
 	printf("  -W, --exit-on-warn Exit on the first warning.\n");
-	exit(0);
 }
 
 const char *ok(int res)
@@ -482,6 +481,7 @@ static void restoreState()
 	node->reopen();
 }
 
+__attribute__((noreturn))
 static void signal_handler_interrupt(int signum)
 {
 	restoreState();
@@ -1544,7 +1544,7 @@ int main(int argc, char **argv)
 		switch (ch) {
 		case OptHelp:
 			usage();
-			return 0;
+			exit(0);
 		case OptSetDevice:
 			device = make_devname(optarg, "video", media_bus_info);
 			break;
@@ -1669,13 +1669,13 @@ int main(int argc, char **argv)
 			fprintf(stderr, "Option `%s' requires a value\n",
 				argv[optind]);
 			usage();
-			return 1;
+			exit(1);
 		case '?':
 			if (argv[optind])
 				fprintf(stderr, "Unknown argument `%s'\n",
 					argv[optind]);
 			usage();
-			return 1;
+			exit(1);
 		}
 	}
 	if (optind < argc) {
@@ -1684,7 +1684,7 @@ int main(int argc, char **argv)
 			fprintf(stderr, "%s ", argv[optind++]);
 		fprintf(stderr, "\n");
 		usage();
-		return 1;
+		exit(1);
 	}
 	bool direct = !options[OptUseWrapper];
 	int fd;
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index cd387d1d..99c5a726 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -187,7 +187,6 @@ static void usage()
 	       "		     Sets step between two registers\n"
 	       "  --list-symbols     List the symbolic register names you can use, if any\n"
 	       "  --log-status       Log the board status in the kernel log [VIDIOC_LOG_STATUS]\n");
-	exit(0);
 }
 
 static std::string cap2s(unsigned cap)
@@ -429,7 +428,7 @@ int main(int argc, char **argv)
 
 	if (argc == 1) {
 		usage();
-		return 0;
+		exit(0);
 	}
 	for (i = 0; long_options[i].name; i++) {
 		if (!isalpha(long_options[i].val))
@@ -467,7 +466,7 @@ int main(int argc, char **argv)
 		switch (ch) {
 		case OptHelp:
 			usage();
-			return 0;
+			exit(0);
 
 		case OptSetDevice:
 			device = optarg;
-- 
2.25.3

