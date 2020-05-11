Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43301CCF1F
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 03:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729215AbgEKBZy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 May 2020 21:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727789AbgEKBZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 May 2020 21:25:53 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392A5C061A0C
        for <linux-media@vger.kernel.org>; Sun, 10 May 2020 18:25:52 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 7so6770678pjo.0
        for <linux-media@vger.kernel.org>; Sun, 10 May 2020 18:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mytgJchefJfhxMfLCLD8pkRN7/tTHa1pHtFwouBWYx0=;
        b=toFT9uuYCIukMoeFP3/GTc7TUtbyU3Y3aKkLvVgbgBVP8+en5LeXRdA98QrmjdNcL+
         FOkNGIUeEFxL28QWU5pHp+56jZHX04KS2p+UGNm3qxdo3HSwSZW3Gf5zwBfRvlzLKgbX
         Ay5PjVF6Z3vgDBcDbniGPj+Bo9CckdOsYAxp8cFLCtYOR+WJHWA8H8Jz3ghY/oDluArR
         Vb8vFxLy3B920hC40GLCG3S7Lw3evzDR0B83DOZ8KTyBfXu86KDF26TfVqIFOlyQlVZ1
         DZ5rwr6h2lcm5CFwE+YdQZPtv6RsdS975BjnADBUJGwj+MdmxqUUHNo1+8zigeNuvBBk
         zzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mytgJchefJfhxMfLCLD8pkRN7/tTHa1pHtFwouBWYx0=;
        b=DUPvKmBZcNifOxoyOEWKWryLfvJVo363mf9sSnOx08g85OSbsWtvEHZogUX2KDzbcx
         xhSqW7Q1D95We5o3+m5KMAxhX4q7DrA1vLzTgxsfoCCGgXw3NK9OK8tNzeJnksb4jOW7
         JAIMs3CMZA+UTKPk8tjJGdct6J5CI5jdnYSJd2ej9ZrlVm3TtJhlVS2inAiLagYiT6m3
         NL2i/lpiVNQ39VaEbc6H+047qRp3A9em9Uf8NXcniPvAJUEXXegaUYcGndS5VrZBWORK
         fU4YjWQlZR7vi3gDZXWQyCqckBpd/LRB85C/kqbxCToJmFphspjtK2nmzMRke8woH0n/
         Zyqw==
X-Gm-Message-State: AGi0PuaJArbKgemQT26dNP20bQFUh7/0wM4RtDpCrQNx0URxvXq/aPh6
        xH/86wCN466Hd8E+caXoyFzW1FDD1QI=
X-Google-Smtp-Source: APiQypJf7t7oac2R5hkztYWqJnGaKUCjWQ7FrPa4I3xcWTbbL4EpB8NosugxxBB1USbW9CQaJL4Wjw==
X-Received: by 2002:a17:902:23:: with SMTP id 32mr12875725pla.40.1589160351145;
        Sun, 10 May 2020 18:25:51 -0700 (PDT)
Received: from mangix-trapnet.lan (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id l1sm4630674pgj.48.2020.05.10.18.25.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 18:25:50 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/3] utils: replace chr functions with std variants
Date:   Sun, 10 May 2020 18:25:47 -0700
Message-Id: <20200511012549.1145814-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

*chr in std offers const overloads, which avoid conversions.
---
 utils/cec-compliance/cec-test.cpp         |  5 +++--
 utils/cec-ctl/cec-ctl.cpp                 | 15 ++++++++-------
 utils/cec-follower/cec-follower.cpp       |  5 +++--
 utils/libcecutil/cec-parse.cpp            |  4 ++--
 utils/v4l2-compliance/v4l2-compliance.cpp |  5 +++--
 utils/v4l2-ctl/v4l2-ctl-common.cpp        | 10 +++++-----
 utils/v4l2-ctl/v4l2-ctl-edid.cpp          |  5 +++--
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp     |  7 ++++---
 utils/v4l2-ctl/v4l2-ctl-vbi.cpp           |  5 +++--
 utils/v4l2-dbg/v4l2-dbg.cpp               |  4 ++--
 10 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 50d434b9..a84f83d3 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -3,10 +3,11 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <cstring>
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <string.h>
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -1530,7 +1531,7 @@ void listTests()
 
 int setExpectedResult(char *optarg, bool no_warnings)
 {
-	char *equal = strchr(optarg, '=');
+	char *equal = std::strchr(optarg, '=');
 
 	if (!equal || equal == optarg || !isdigit(equal[1]))
 		return 1;
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index b8edb105..899b83b1 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -3,10 +3,11 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <cstring>
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <string.h>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
@@ -1650,7 +1651,7 @@ static void stress_test_power_cycle(struct node &node, unsigned cnt,
 
 static int calc_node_val(const char *s)
 {
-	s = strrchr(s, '/') + 1;
+	s = std::strrchr(s, '/') + 1;
 
 	if (!memcmp(s, "cec", 3))
 		return atol(s + 3);
@@ -1917,7 +1918,7 @@ int main(int argc, char **argv)
 		case OptIgnore: {
 			bool all_la = !strncmp(optarg, "all", 3);
 			bool all_opcodes = true;
-			const char *sep = strchr(optarg, ',');
+			const char *sep = std::strchr(optarg, ',');
 			unsigned la_mask = 0xffff, opcode, la = 0;
 
 			if (sep)
@@ -2068,7 +2069,7 @@ int main(int argc, char **argv)
 							size--;
 							break;
 						}
-						value = strchr(value, ':');
+						value = std::strchr(value, ':');
 						if (value == NULL)
 							break;
 						value++;
@@ -2109,7 +2110,7 @@ int main(int argc, char **argv)
 							size--;
 							break;
 						}
-						value = strchr(value, ':');
+						value = std::strchr(value, ':');
 						if (value == NULL)
 							break;
 						value++;
@@ -2150,7 +2151,7 @@ int main(int argc, char **argv)
 							size--;
 							break;
 						}
-						value = strchr(value, ':');
+						value = std::strchr(value, ':');
 						if (value == NULL)
 							break;
 						value++;
@@ -2184,7 +2185,7 @@ int main(int argc, char **argv)
 							size--;
 							break;
 						}
-						value = strchr(value, ':');
+						value = std::strchr(value, ':');
 						if (value == NULL)
 							break;
 						value++;
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 7c8c044e..589426ec 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -3,10 +3,11 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <cstring>
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <string.h>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
@@ -386,7 +387,7 @@ int main(int argc, char **argv)
 		case OptIgnore: {
 			bool all_la = !strncmp(optarg, "all", 3);
 			bool all_opcodes = true;
-			const char *sep = strchr(optarg, ',');
+			const char *sep = std::strchr(optarg, ',');
 			unsigned la_mask = 0xffff, opcode, la = 0;
 
 			if (sep)
diff --git a/utils/libcecutil/cec-parse.cpp b/utils/libcecutil/cec-parse.cpp
index 5fffcce7..8c869fec 100644
--- a/utils/libcecutil/cec-parse.cpp
+++ b/utils/libcecutil/cec-parse.cpp
@@ -6,7 +6,6 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <string.h>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
@@ -18,6 +17,7 @@
 #include <errno.h>
 #include <sys/ioctl.h>
 #include <stdarg.h>
+#include <cstring>
 #include <ctime>
 #include <cerrno>
 #include <string>
@@ -191,7 +191,7 @@ unsigned cec_parse_phys_addr(const char *value)
 {
 	unsigned p1, p2, p3, p4;
 
-	if (!strchr(value, '.'))
+	if (!std::strchr(value, '.'))
 		return strtoul(value, NULL, 0);
 	if (sscanf(value, "%x.%x.%x.%x", &p1, &p2, &p3, &p4) != 4) {
 		fprintf(stderr, "Expected a physical address of the form x.x.x.x\n");
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 676b9278..549e37f7 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -18,10 +18,11 @@
     Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
  */
 
+#include <cstring>
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <string.h>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
@@ -1582,7 +1583,7 @@ int main(int argc, char **argv)
 			break;
 		case OptStreamFrom:
 		case OptStreamFromHdr: {
-			char *equal = strchr(optarg, '=');
+			char *equal = std::strchr(optarg, '=');
 			bool has_hdr = ch == OptStreamFromHdr;
 
 			if (equal == optarg)
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index bbd00e95..47f5da1a 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -1,7 +1,6 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <string.h>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
@@ -22,6 +21,7 @@
 #include <sys/klog.h>
 #endif
 
+#include <cstring>
 #include <list>
 #include <vector>
 #include <map>
@@ -152,7 +152,7 @@ static int calc_node_val(const char *s)
 {
 	int n = 0;
 
-	s = strrchr(s, '/') + 1;
+	s = std::strrchr(s, '/') + 1;
 
 	for (unsigned i = 0; prefixes[i]; i++) {
 		unsigned l = strlen(prefixes[i]);
@@ -741,7 +741,7 @@ static bool parse_subset(char *optarg)
 
 	memset(&subset, 0, sizeof(subset));
 	while (*optarg) {
-		p = strchr(optarg, ',');
+		p = std::strchr(optarg, ',');
 		if (p)
 			*p = 0;
 		if (optarg[0] == 0) {
@@ -808,7 +808,7 @@ void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
 				common_usage();
 				std::exit(EXIT_FAILURE);
 			}
-			if (strchr(value, '=')) {
+			if (std::strchr(value, '=')) {
 				common_usage();
 				std::exit(EXIT_FAILURE);
 			}
@@ -824,7 +824,7 @@ void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
 				common_usage();
 				std::exit(EXIT_FAILURE);
 			}
-			if (const char *equal = strchr(value, '=')) {
+			if (const char *equal = std::strchr(value, '=')) {
 				set_ctrls[std::string(value, (equal - value))] = equal + 1;
 			}
 			else {
diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
index a2df6089..b13d8209 100644
--- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
@@ -1,7 +1,8 @@
+#include <cstring>
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <string.h>
 #include <inttypes.h>
 #include <fcntl.h>
 #include <ctype.h>
@@ -710,7 +711,7 @@ static unsigned short parse_phys_addr(const char *value)
 {
 	unsigned p1, p2, p3, p4;
 
-	if (!strchr(value, '.'))
+	if (!std::strchr(value, '.'))
 		return strtoul(value, NULL, 0);
 	if (sscanf(value, "%x.%x.%x.%x", &p1, &p2, &p3, &p4) != 4) {
 		fprintf(stderr, "Expected a physical address of the form x.x.x.x\n");
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 0d5a1e1a..8578610d 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1,7 +1,8 @@
+#include <cstring>
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <string.h>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
@@ -1660,7 +1661,7 @@ static FILE *open_output_file(cv4l_fd &fd)
 	if (!host_to)
 		return NULL;
 
-	char *p = strchr(host_to, ':');
+	char *p = std::strchr(host_to, ':');
 	struct sockaddr_in serv_addr;
 	struct hostent *server;
 	struct v4l2_fract aspect;
@@ -1925,7 +1926,7 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 	if (!host_from)
 		return NULL;
 
-	char *p = strchr(host_from, ':');
+	char *p = std::strchr(host_from, ':');
 	int listen_fd;
 	socklen_t clilen;
 	struct sockaddr_in serv_addr = {}, cli_addr;
diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
index 6a4f627f..ee55012f 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
@@ -1,7 +1,8 @@
+#include <cstring>
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <string.h>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
@@ -98,7 +99,7 @@ void vbi_cmd(int ch, char *optarg)
 			std::exit(EXIT_FAILURE);
 		}
 		while (*optarg) {
-			subs = strchr(optarg, ',');
+			subs = std::strchr(optarg, ',');
 			if (subs)
 				*subs = 0;
 
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index f2fd8269..86266376 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -19,7 +19,6 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <string.h>
 #include <inttypes.h>
 #include <getopt.h>
 #include <sys/types.h>
@@ -43,6 +42,7 @@
 
 #include <linux/videodev2.h>
 
+#include <cstring>
 #include <list>
 #include <vector>
 #include <map>
@@ -731,7 +731,7 @@ int main(int argc, char **argv)
 			goto list_done;
 		}
 
-		p = strchr(chip_info.name, ' ');
+		p = std::strchr(chip_info.name, ' ');
 		if (p)
 			*p = '\0';
 		name = chip_info.name;
-- 
2.26.2

