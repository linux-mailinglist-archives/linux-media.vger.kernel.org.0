Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589861B8D9A
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 09:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgDZHoz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 03:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726110AbgDZHoy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 03:44:54 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4BEC061A0C
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2020 00:44:54 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id x15so7220437pfa.1
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2020 00:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QRc7Qr8UCesqYI+kkSZIRid6/kwo+4cbUYiZKoRVq+o=;
        b=AcmKOrP7339wCpmK/x/gVIjfc/cR0cVBliDGf/OxwQiXoLTZYELpBV790Yg7zPSkUe
         PBZY2Bbl+tf+JBkB8SZCfvQlgfz2oCSCCaVYFkArAKEoyZ/2gmhYlEaS4u48tGl/Vojo
         C1NF3W2STJM//3oEbU9/iNgUGwupZ9THkvlA2Fez/0ff4iPNaSBiA5Uw90+dAdeJnFJ2
         /7H4IksQD9c2HTAeLBm/A5kCw/4geI9QcyFrlUqIhOeTEd2g4H+B7U2+fG5UVGnya9fH
         ligbF0RwNAu1u/VkfN6oOXKe0Um2OwCG9zhrbhnNz0NjM551wVhBpkYHHoaEkyfhtyOk
         OkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QRc7Qr8UCesqYI+kkSZIRid6/kwo+4cbUYiZKoRVq+o=;
        b=OuiE78WmSCQNcpIRPN0MnNvTIL0EEngfyhEwEhlIhsKi+q3K5oKPRFccYqvuXWA7KQ
         MRcX/Im9n3iWLTm2KmxM0GdAi2chCQHJ6JeGiIjrmABlIiyYMFyB6FhUvEX3hdAK7DVe
         aDWO43Yl/JAXsVGfQ98n1eWFcNL9yP8FRMLS/Cs1mbmEloDAakkKwhXl5IT/TLHVZd9Y
         lPlCffq/wHITxCQ7qisHD/Rw4U5iBlToOokU+IrsCK7qwAybTyqOaRuuAmow5r2APkYD
         pWCmtwSVluKFn99bP5+99jHKYcVtm3TleObOFZBQha/12BOvjdpUielbeDs5FpjEtSGQ
         wylQ==
X-Gm-Message-State: AGi0PuaspmrtrmJu5loFRnjsuOSXhmqxS3+Sz67wObwp8cs5VcVNM0kE
        s6l4pxrZUVJbIpS1VPFLv72G8joXR9g=
X-Google-Smtp-Source: APiQypKNAfuzZnFC0vDYT7vLBKd2BhL67ugvKeahC93gWoV1eVWHxHiS+rIyDaTn4/4s5W6TF/BjSg==
X-Received: by 2002:a65:4645:: with SMTP id k5mr17551749pgr.115.1587887091258;
        Sun, 26 Apr 2020 00:44:51 -0700 (PDT)
Received: from mangix-trapnet.lan (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id 30sm2815545pgp.38.2020.04.26.00.44.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 00:44:50 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] utils: replace exit with std variant
Date:   Sun, 26 Apr 2020 00:44:46 -0700
Message-Id: <20200426074446.3505-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also converted to the appropriate macros for clarity.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp     | 16 ++--
 utils/cec-compliance/cec-compliance.h       |  8 +-
 utils/cec-compliance/cec-test-adapter.cpp   |  4 +-
 utils/cec-compliance/cec-test.cpp           |  2 +-
 utils/cec-ctl/cec-ctl.cpp                   | 84 ++++++++++-----------
 utils/cec-follower/cec-follower.cpp         |  6 +-
 utils/common/media-info.cpp                 |  2 +-
 utils/cx18-ctl/cx18-ctl.c                   |  8 +-
 utils/qvidcap/capture.cpp                   | 16 ++--
 utils/qvidcap/paint.cpp                     |  8 +-
 utils/qvidcap/qvidcap.cpp                   | 28 +++----
 utils/rds-ctl/rds-ctl.cpp                   | 20 ++---
 utils/v4l2-compliance/v4l2-compliance.cpp   | 26 +++----
 utils/v4l2-compliance/v4l2-compliance.h     |  4 +-
 utils/v4l2-compliance/v4l2-test-buffers.cpp |  4 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp          | 14 ++--
 utils/v4l2-ctl/v4l2-ctl-edid.cpp            | 28 +++----
 utils/v4l2-ctl/v4l2-ctl-meta.cpp            |  2 +-
 utils/v4l2-ctl/v4l2-ctl-misc.cpp            |  6 +-
 utils/v4l2-ctl/v4l2-ctl-sdr.cpp             |  2 +-
 utils/v4l2-ctl/v4l2-ctl-selection.cpp       |  8 +-
 utils/v4l2-ctl/v4l2-ctl-stds.cpp            | 16 ++--
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp       | 26 +++----
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 18 ++---
 utils/v4l2-ctl/v4l2-ctl-tuner.cpp           |  6 +-
 utils/v4l2-ctl/v4l2-ctl-vbi.cpp             |  4 +-
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp          | 16 ++--
 utils/v4l2-ctl/v4l2-ctl-vidout.cpp          |  4 +-
 utils/v4l2-ctl/v4l2-ctl.cpp                 | 30 ++++----
 utils/v4l2-dbg/v4l2-dbg.cpp                 | 12 +--
 30 files changed, 213 insertions(+), 215 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 99f4e098..d0580579 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -878,7 +878,7 @@ retry:
 	res = doioctl(node, CEC_TRANSMIT, msg);
 	if (res == ENODEV) {
 		printf("Device was disconnected.\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	if (res == ENONET) {
 		if (retried) {
@@ -1224,7 +1224,7 @@ int main(int argc, char **argv)
 				show_colors = isatty(STDOUT_FILENO);
 			else {
 				usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			break;
 		case OptNoWarnings:
@@ -1285,7 +1285,7 @@ int main(int argc, char **argv)
 		if (device.empty()) {
 			fprintf(stderr,
 				"Could not find a CEC device for the given driver/adapter combination\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	}
 	if (device.empty())
@@ -1294,7 +1294,7 @@ int main(int argc, char **argv)
 	if ((fd = open(device.c_str(), O_RDWR)) < 0) {
 		fprintf(stderr, "Failed to open %s: %s\n", device.c_str(),
 			strerror(errno));
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	struct node node = { };
@@ -1468,7 +1468,7 @@ int main(int argc, char **argv)
 	if (missing_la)
 		fprintf(stderr, "FAIL: missing logical address(es), use cec-ctl to configure this\n");
 	if (missing_la || missing_pa)
-		exit(-1);
+		std::exit(EXIT_FAILURE);
 
 	if (!options[OptSkipInfo]) {
 		printf("\nCompliance test for %s device %s:\n\n",
@@ -1493,7 +1493,7 @@ int main(int argc, char **argv)
 
 	if (!node.remote_la_mask) {
 		printf("\nFAIL: No remote devices found, exiting.\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	if (options[OptTestAdapter])
@@ -1507,7 +1507,7 @@ int main(int argc, char **argv)
 	printf("\n");
 
 	if (options[OptTestFuzzing] && remote_la >= 0)
-		exit(testFuzzing(node, laddrs.log_addr[0], remote_la));
+		std::exit(testFuzzing(node, laddrs.log_addr[0], remote_la));
 
 	unsigned remote_la_mask = node.remote_la_mask;
 
@@ -1533,5 +1533,5 @@ int main(int argc, char **argv)
 	printf("Total for %s device %s: %d, Succeeded: %d, Failed: %d, Warnings: %d\n",
 	       caps.driver, device.c_str(),
 	       tests_total, tests_ok, tests_total - tests_ok, warnings);
-	exit(app_result);
+	std::exit(app_result);
 }
diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index f50ea483..c601427e 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -8,10 +8,8 @@
 #ifndef _CEC_COMPLIANCE_H_
 #define _CEC_COMPLIANCE_H_
 
-#include <stdarg.h>
-#include <cerrno>
 #include <string>
-#include <time.h>
+
 #include <linux/cec-funcs.h>
 #include "cec-htng-funcs.h"
 
@@ -228,7 +226,7 @@ struct remote_subtest {
 		       show_colors ? COLOR_BOLD("warn") : "warn",	\
 		       __FILE__, __LINE__, ##args);			\
 	if (exit_on_warn)						\
-		exit(1);						\
+		std::exit(EXIT_FAILURE);				\
 	0;								\
 })
 
@@ -259,7 +257,7 @@ struct remote_subtest {
 	printf("\t\t%s: %s(%d): " fmt, show_colors ?			\
 	       COLOR_RED("fail") : "fail", __FILE__, __LINE__, ##args);	\
 	if (exit_on_fail)						\
-		exit(1);						\
+		std::exit(EXIT_FAILURE);				\
 	FAIL;								\
 })
 
diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index 0675ccb7..df7374df 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -1243,7 +1243,7 @@ void testAdapter(struct node &node, struct cec_log_addrs &laddrs,
 	if (node.phys_addr == CEC_PHYS_ADDR_INVALID) {
 		fprintf(stderr, "FAIL: without a valid physical address this test cannot proceed.\n");
 		fprintf(stderr, "Make sure that this CEC adapter is connected to another HDMI sink or source.\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	printf("\tCEC_ADAP_G/S_LOG_ADDRS: %s\n", ok(testAdapLogAddrs(&node)));
 	fcntl(node.fd, F_SETFL, fcntl(node.fd, F_GETFL) & ~O_NONBLOCK);
@@ -1275,7 +1275,7 @@ void testAdapter(struct node &node, struct cec_log_addrs &laddrs,
 	if ((node2.fd = open(device, O_RDWR)) < 0) {
 		fprintf(stderr, "Failed to open %s: %s\n", device,
 			strerror(errno));
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	printf("\tCEC_G/S_MODE: %s\n", ok(testModes(&node, &node2)));
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index cc07998a..50d434b9 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -1507,7 +1507,7 @@ void collectTests()
 			    mapTestFuncs[name] != func) {
 				fprintf(stderr, "Duplicate subtest name, but different tests: %s\n",
 					tests[i].subtests[j].name);
-				exit(-1);
+				std::exit(EXIT_FAILURE);
 			}
 			mapTestFuncs[name] = func;
 			mapTests[name] = DONT_CARE;
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 1e6d7ed9..b8edb105 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -848,7 +848,7 @@ static void monitor(struct node &node, __u32 monitor_time, const char *store_pin
 	if (!(node.caps & CEC_CAP_MONITOR_PIN) && monitor == CEC_MODE_MONITOR_PIN) {
 		fprintf(stderr, "Monitor Pin mode is not supported\n");
 		usage();
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	if (doioctl(&node, CEC_S_MODE, &monitor)) {
@@ -874,7 +874,7 @@ static void monitor(struct node &node, __u32 monitor_time, const char *store_pin
 		if (fstore == NULL) {
 			fprintf(stderr, "Failed to open %s: %s\n", store_pin,
 				strerror(errno));
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		fprintf(fstore, "# cec-ctl --store-pin\n");
 		fprintf(fstore, "# version 1\n");
@@ -973,7 +973,7 @@ static void analyze(const char *analyze_pin)
 	if (fanalyze == NULL) {
 		fprintf(stderr, "Failed to open %s: %s\n", analyze_pin,
 			strerror(errno));
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	if (!fgets(s, sizeof(s), fanalyze) ||
 	    strcmp(s, "# cec-ctl --store-pin\n"))
@@ -1045,7 +1045,7 @@ static void analyze(const char *analyze_pin)
 
 err:
 	fprintf(stderr, "Not a pin store file: malformed data at line %d\n", line);
-	exit(1);
+	std::exit(EXIT_FAILURE);
 }
 
 static bool wait_for_pwr_state(struct node &node, unsigned from,
@@ -1068,7 +1068,7 @@ static bool wait_for_pwr_state(struct node &node, unsigned from,
 	if (ret) {
 		fprintf(stderr, "Give Device Power Status Transmit failed: %s\n",
 			strerror(ret));
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	if ((msg.rx_status & CEC_RX_STATUS_OK) &&
 	    (msg.rx_status & CEC_RX_STATUS_FEATURE_ABORT)) {
@@ -1162,7 +1162,7 @@ static int init_power_cycle_test(struct node &node, unsigned repeats, unsigned m
 		switch (laddrs.log_addr_type[0]) {
 		case CEC_LOG_ADDR_TYPE_TV:
 			fprintf(stderr, "A TV can't run the power cycle test.\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		case CEC_LOG_ADDR_TYPE_RECORD:
 			from = CEC_LOG_ADDR_RECORD_1;
 			break;
@@ -1202,7 +1202,7 @@ static int init_power_cycle_test(struct node &node, unsigned repeats, unsigned m
 			ret = transmit_msg_retry(node, msg);
 			if (ret) {
 				printf("FAIL: %s\n", strerror(ret));
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			printf("OK\n");
 			printf("%s: ", ts2s(current_ts()).c_str());
@@ -1221,7 +1221,7 @@ static int init_power_cycle_test(struct node &node, unsigned repeats, unsigned m
 				ret = transmit_msg_retry(node, msg);
 				if (ret) {
 					printf("FAIL: %s\n", strerror(ret));
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 
 				if (wait_for_power_off(node, from, hpd_is_low_cnt))
@@ -1229,7 +1229,7 @@ static int init_power_cycle_test(struct node &node, unsigned repeats, unsigned m
 				if (++tries > max_tries) {
 					if (repeat == repeats) {
 						printf(" FAIL: never went into standby\n");
-						exit(1);
+						std::exit(EXIT_FAILURE);
 					}
 					break;
 				}
@@ -1297,7 +1297,7 @@ static void test_power_cycle(struct node &node, unsigned int max_tries,
 		ret = transmit_msg_retry(node, msg);
 		if (ret) {
 			printf("FAIL: %s\n", strerror(ret));
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		tries = 0;
 		for (;;) {
@@ -1330,7 +1330,7 @@ static void test_power_cycle(struct node &node, unsigned int max_tries,
 				printf("(EINVAL) ");
 			} else if (ret) {
 				printf("FAIL: %s\n", strerror(ret));
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			tries = 0;
 			for (;;) {
@@ -1352,7 +1352,7 @@ static void test_power_cycle(struct node &node, unsigned int max_tries,
 		doioctl(&node, CEC_ADAP_G_LOG_ADDRS, &laddrs);
 		if (laddrs.log_addr[0] == CEC_LOG_ADDR_INVALID) {
 			printf("FAIL: invalid logical address\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		from = laddrs.log_addr[0];
 		doioctl(&node, CEC_ADAP_G_PHYS_ADDR, &pa);
@@ -1361,7 +1361,7 @@ static void test_power_cycle(struct node &node, unsigned int max_tries,
 		       cec_phys_addr_exp(pa), cec_la2s(from));
 		if (pa == CEC_PHYS_ADDR_INVALID || !pa) {
 			printf("FAIL: invalid physical address\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		prev_pa = pa;
 		if (display_pa == CEC_PHYS_ADDR_INVALID)
@@ -1369,7 +1369,7 @@ static void test_power_cycle(struct node &node, unsigned int max_tries,
 		if (pa != display_pa) {
 			printf("FAIL: physical address changed from %x.%x.%x.%x to %x.%x.%x.%x\n",
 			       cec_phys_addr_exp(display_pa), cec_phys_addr_exp(pa));
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		secs = i <= 10 ? i : 10 + 10 * (i - 10);
 		printf("%s: ", ts2s(current_ts()).c_str());
@@ -1379,7 +1379,7 @@ static void test_power_cycle(struct node &node, unsigned int max_tries,
 		if (pa != prev_pa) {
 			printf("\tFAIL: PA is now %x.%x.%x.%x\n\n",
 			       cec_phys_addr_exp(pa));
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 
 		printf("\n%s: ", ts2s(current_ts()).c_str());
@@ -1394,14 +1394,14 @@ static void test_power_cycle(struct node &node, unsigned int max_tries,
 		ret = transmit_msg_retry(node, msg);
 		if (ret) {
 			printf("FAIL: Active Source Transmit failed: %s\n", strerror(ret));
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		cec_msg_init(&msg, from, CEC_LOG_ADDR_TV);
 		cec_msg_standby(&msg);
 		ret = transmit_msg_retry(node, msg);
 		if (ret) {
 			printf("FAIL: %s\n", strerror(ret));
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 
 		tries = 0;
@@ -1433,7 +1433,7 @@ static void test_power_cycle(struct node &node, unsigned int max_tries,
 					if (!ret)
 						continue;
 					printf("FAIL: %s\n", strerror(ret));
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 				printf("\nFAIL: never went into standby\n");
 				failures++;
@@ -1459,7 +1459,7 @@ static void test_power_cycle(struct node &node, unsigned int max_tries,
 		if (pa != CEC_PHYS_ADDR_INVALID && pa != display_pa) {
 			printf("FAIL: physical address changed from %x.%x.%x.%x to %x.%x.%x.%x\n",
 			       cec_phys_addr_exp(display_pa), cec_phys_addr_exp(pa));
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		printf("\n");
 	}
@@ -1534,7 +1534,7 @@ static void stress_test_power_cycle(struct node &node, unsigned cnt,
 				printf("(EINVAL) ");
 			} else if (ret) {
 				printf("FAIL: %s\n", strerror(ret));
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 
 			for (;;) {
@@ -1546,7 +1546,7 @@ static void stress_test_power_cycle(struct node &node, unsigned cnt,
 				if (++tries > max_tries) {
 					if (repeat == repeats) {
 						printf("\nFAIL: never woke up\n");
-						exit(1);
+						std::exit(EXIT_FAILURE);
 					}
 					break;
 				}
@@ -1560,7 +1560,7 @@ static void stress_test_power_cycle(struct node &node, unsigned cnt,
 		doioctl(&node, CEC_ADAP_G_LOG_ADDRS, &laddrs);
 		if (laddrs.log_addr[0] == CEC_LOG_ADDR_INVALID) {
 			printf("FAIL: invalid logical address\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		from = laddrs.log_addr[0];
 		doioctl(&node, CEC_ADAP_G_PHYS_ADDR, &pa);
@@ -1570,14 +1570,14 @@ static void stress_test_power_cycle(struct node &node, unsigned cnt,
 		       cec_phys_addr_exp(pa), cec_la2s(from));
 		if (pa == CEC_PHYS_ADDR_INVALID || !pa) {
 			printf("FAIL: invalid physical address\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		if (display_pa == CEC_PHYS_ADDR_INVALID)
 			display_pa = pa;
 		if (pa != display_pa) {
 			printf("FAIL: physical address changed from %x.%x.%x.%x to %x.%x.%x.%x\n",
 			       cec_phys_addr_exp(display_pa), cec_phys_addr_exp(pa));
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 
 		if (cnt && iter == cnt)
@@ -1595,12 +1595,12 @@ static void stress_test_power_cycle(struct node &node, unsigned cnt,
 			if (pa != prev_pa) {
 				printf("\tFAIL: PA is now %x.%x.%x.%x\n\n",
 				       cec_phys_addr_exp(pa));
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			if (pa != CEC_PHYS_ADDR_INVALID && pa != display_pa) {
 				printf("FAIL: physical address changed from %x.%x.%x.%x to %x.%x.%x.%x\n",
 				       cec_phys_addr_exp(display_pa), cec_phys_addr_exp(pa));
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 
 			cec_msg_init(&msg, from, CEC_LOG_ADDR_TV);
@@ -1612,13 +1612,13 @@ static void stress_test_power_cycle(struct node &node, unsigned cnt,
 			ret = transmit_msg_retry(node, msg);
 			if (ret) {
 				printf("FAIL: Active Source Transmit failed: %s\n", strerror(ret));
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			cec_msg_standby(&msg);
 			ret = transmit_msg_retry(node, msg);
 			if (ret) {
 				printf("FAIL: %s\n", strerror(ret));
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 
 			tries = 0;
@@ -1634,7 +1634,7 @@ static void stress_test_power_cycle(struct node &node, unsigned cnt,
 				if (++tries > max_tries) {
 					if (repeat == repeats) {
 						printf("\nFAIL: never went into standby\n");
-						exit(1);
+						std::exit(EXIT_FAILURE);
 					}
 					break;
 				}
@@ -2075,7 +2075,7 @@ int main(int argc, char **argv)
 					}
 					break;
 				default:
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 			}
 			if (size) {
@@ -2116,7 +2116,7 @@ int main(int argc, char **argv)
 					}
 					break;
 				default:
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 			}
 			if (have_cmd) {
@@ -2157,7 +2157,7 @@ int main(int argc, char **argv)
 					}
 					break;
 				default:
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 			}
 			if (size) {
@@ -2191,7 +2191,7 @@ int main(int argc, char **argv)
 					}
 					break;
 				default:
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 			}
 			if (size) {
@@ -2229,7 +2229,7 @@ int main(int argc, char **argv)
 					test_pwr_cycle_sleep = strtoul(value, 0L, 0);
 					break;
 				default:
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 			}
 			break;
@@ -2277,12 +2277,12 @@ int main(int argc, char **argv)
 					stress_test_pwr_cycle_polls = strtoul(value, 0L, 0);
 					break;
 				default:
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 			}
 			if (stress_test_pwr_cycle_min_sleep > stress_test_pwr_cycle_max_sleep) {
 				fprintf(stderr, "min-sleep > max-sleep\n");
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			warn_if_unconfigured = true;
 			break;
@@ -2291,7 +2291,7 @@ int main(int argc, char **argv)
 		default:
 			if (ch >= OptHelpAll) {
 				cec_parse_usage_options(options);
-				exit(0);
+				std::exit(EXIT_SUCCESS);
 			}
 			if (ch <= OptMessages)
 				break;
@@ -2374,7 +2374,7 @@ int main(int argc, char **argv)
 		if (device.empty()) {
 			fprintf(stderr,
 				"Could not find a CEC device for the given driver/adapter combination\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	}
 	if (device.empty())
@@ -2386,7 +2386,7 @@ int main(int argc, char **argv)
 	if ((fd = open(device.c_str(), O_RDWR)) < 0) {
 		fprintf(stderr, "Failed to open %s: %s\n", device.c_str(),
 			strerror(errno));
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	struct node node;
@@ -2490,7 +2490,7 @@ int main(int argc, char **argv)
 				prim_type = i;
 			if (laddrs.num_log_addrs == node.available_log_addrs) {
 				fprintf(stderr, "Attempt to define too many logical addresses\n");
-				exit(-1);
+				std::exit(EXIT_FAILURE);
 			}
 			switch (i) {
 			case CEC_OP_PRIM_DEVTYPE_TV:
@@ -2602,7 +2602,7 @@ int main(int argc, char **argv)
 		fflush(stdout);
 		if (!cec_msg_is_broadcast(&msg) && !options[OptTo]) {
 			fprintf(stderr, "attempting to send message without --to\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		if (msg.msg[0] == 0xf0)
 			msg.msg[0] = first_to;
@@ -2660,7 +2660,7 @@ skip_la:
 
 		fd = open(edid_path, O_RDONLY);
 		if (fd < 0)
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		lseek(fd, 0, SEEK_SET);
 		has_edid = read(fd, &dummy, 1) > 0;
 
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index f4842a99..7c8c044e 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -451,7 +451,7 @@ int main(int argc, char **argv)
 		if (device.empty()) {
 			fprintf(stderr,
 				"Could not find a CEC device for the given driver/adapter combination\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	}
 	if (device.empty())
@@ -460,7 +460,7 @@ int main(int argc, char **argv)
 	if ((fd = open(device.c_str(), O_RDWR)) < 0) {
 		fprintf(stderr, "Failed to open %s: %s\n", device.c_str(),
 			strerror(errno));
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	struct cec_caps caps = { };
@@ -533,7 +533,7 @@ int main(int argc, char **argv)
 	if (missing_la)
 		fprintf(stderr, "FAIL: missing logical address(es), use cec-ctl to configure this\n");
 	if (missing_la || missing_pa)
-		exit(-1);
+		std::exit(EXIT_FAILURE);
 
 	testProcessing(&node, options[OptWallClock]);
 }
diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index a5b429a0..8aa12f34 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -593,7 +593,7 @@ __u32 mi_media_info_for_fd(int media_fd, int fd, bool *is_invalid)
 
 	if (fstat(fd, &sb) == -1) {
 		fprintf(stderr, "failed to stat file\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	ent_id = read_topology(media_fd, major(sb.st_rdev), minor(sb.st_rdev),
diff --git a/utils/cx18-ctl/cx18-ctl.c b/utils/cx18-ctl/cx18-ctl.c
index 3ce7c018..bf8ee967 100644
--- a/utils/cx18-ctl/cx18-ctl.c
+++ b/utils/cx18-ctl/cx18-ctl.c
@@ -285,7 +285,7 @@ int main(int argc, char **argv)
 						fprintf(stderr,
 							"No value given to suboption <dir>\n");
 						usage();
-						exit(1);
+						exit(EXIT_FAILURE);
 					}
 					gpio_dir = strtoul(value, 0L, 0);
 					gpio_set_dir = 1;
@@ -295,7 +295,7 @@ int main(int argc, char **argv)
 						fprintf(stderr,
 							"No value given to suboption <val>\n");
 						usage();
-						exit(1);
+						exit(EXIT_FAILURE);
 					}
 					gpio_out =
 					    (unsigned short)strtoul(value, 0L, 0);
@@ -304,7 +304,7 @@ int main(int argc, char **argv)
 					fprintf(stderr,
 						"Invalid suboptions specified\n");
 					usage();
-					exit(1);
+					exit(EXIT_FAILURE);
 					break;
 				}
 			}
@@ -334,7 +334,7 @@ int main(int argc, char **argv)
 	if (fd < 0) {
 		fprintf(stderr, "Failed to open %s: %s\n", device,
 			strerror(errno));
-		exit(1);
+		exit(EXIT_FAILURE);
 	}
 
 	/* Setting Opts */
diff --git a/utils/qvidcap/capture.cpp b/utils/qvidcap/capture.cpp
index b7973533..556e35e4 100644
--- a/utils/qvidcap/capture.cpp
+++ b/utils/qvidcap/capture.cpp
@@ -737,7 +737,7 @@ void CaptureWin::checkError(const char *msg)
 		fprintf(stderr, "OpenGL Error (no: %u) code 0x%x: %s.\n", errNo++, err, msg);
 
 	if (errNo)
-		exit(errNo);
+		std::exit(errNo);
 }
 
 void CaptureWin::configureTexture(size_t idx)
@@ -817,7 +817,7 @@ void CaptureWin::setModeFile(const QString &filename)
 	m_file.setFileName(filename);
 	if (!m_file.open(QIODevice::ReadOnly)) {
 		fprintf(stderr, "could not open %s\n", filename.toUtf8().data());
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	m_canOverrideResolution = true;
 }
@@ -1137,7 +1137,7 @@ void CaptureWin::v4l2ReadEvent()
 	if (m_cnt == 0)
 		return;
 	if (--m_cnt == 0)
-		exit(0);
+		std::exit(EXIT_SUCCESS);
 }
 
 void CaptureWin::v4l2ExceptionEvent()
@@ -1153,7 +1153,7 @@ void CaptureWin::v4l2ExceptionEvent()
 				fprintf(stderr, "Unsupported format: '%s' %s\n",
 					fcc2s(fmt.g_pixelformat()).c_str(),
 					pixfmt2s(fmt.g_pixelformat()).c_str());
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			updateOrigValues();
 			m_updateShader = true;
@@ -1320,7 +1320,7 @@ void CaptureWin::sockReadEvent()
 	if (m_cnt == 0)
 		return;
 	if (--m_cnt == 0)
-		exit(0);
+		std::exit(EXIT_SUCCESS);
 	return;
 
 new_conn:
@@ -1495,7 +1495,7 @@ void CaptureWin::tpgUpdateFrame()
 	delete m_timer;
 	m_timer = NULL;
 	if (!m_test)
-		exit(0);
+		std::exit(EXIT_SUCCESS);
 
 	m_cnt = m_test;
 
@@ -1533,7 +1533,7 @@ void CaptureWin::tpgUpdateFrame()
 								m_testState.field_idx = 0;
 							if (mask_fmt ||
 							    formats[++m_testState.fmt_idx] == 0)
-								exit(0);
+								std::exit(EXIT_SUCCESS);
 						}
 					}
 				}
@@ -1543,7 +1543,7 @@ void CaptureWin::tpgUpdateFrame()
 
 	while (!supportedFmt(formats[m_testState.fmt_idx]))
 		if (formats[++m_testState.fmt_idx] == 0)
-			exit(0);
+			std::exit(EXIT_SUCCESS);
 
 	m_v4l_fmt.s_pixelformat(formats[m_testState.fmt_idx]);
 	updateV4LFormat(m_v4l_fmt);
diff --git a/utils/qvidcap/paint.cpp b/utils/qvidcap/paint.cpp
index e4fd17c4..8cd764e3 100644
--- a/utils/qvidcap/paint.cpp
+++ b/utils/qvidcap/paint.cpp
@@ -48,7 +48,7 @@ void CaptureWin::initializeGL()
 	}
 	if (m_uses_gl_red && glGetString(GL_VERSION)[0] < '3') {
 		fprintf(stderr, "The openGL implementation does not support GL_RED/GL_RG\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	QColor bg = QWidget::palette().color(QWidget::backgroundRole());
@@ -515,7 +515,7 @@ void CaptureWin::changeShader()
 
 	if (!src_ok) {
 		fprintf(stderr, "OpenGL Error: fragment shader compilation failed.\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	// Mandatory vertex shader replaces fixed pipeline in GLES 2.0. In this case just a feedthrough shader.
@@ -541,12 +541,12 @@ void CaptureWin::changeShader()
 
 	if (!src_ok) {
 		fprintf(stderr, "OpenGL Error: vertex shader compilation failed.\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	if (!m_program->bind()) {
 		fprintf(stderr, "OpenGL Error: shader bind failed.\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	GLint loc = m_program->uniformLocation("uvtex");
diff --git a/utils/qvidcap/qvidcap.cpp b/utils/qvidcap/qvidcap.cpp
index 5c1356c1..f4bb9d28 100644
--- a/utils/qvidcap/qvidcap.cpp
+++ b/utils/qvidcap/qvidcap.cpp
@@ -319,7 +319,7 @@ __u32 read_u32(int fd)
 	n = read(fd, &v, sizeof(v));
 	if (n != sizeof(v)) {
 		fprintf(stderr, "could not read __u32\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	return ntohl(v);
 }
@@ -336,7 +336,7 @@ int initSocket(int port, cv4l_fmt &fmt, v4l2_fract &pixelaspect)
 		listen_fd = socket(AF_INET, SOCK_STREAM, 0);
 		if (listen_fd < 0) {
 			fprintf(stderr, "could not opening socket\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		setsockopt(listen_fd, SOL_SOCKET, SO_REUSEADDR, &val, sizeof(int));
 
@@ -345,7 +345,7 @@ int initSocket(int port, cv4l_fmt &fmt, v4l2_fract &pixelaspect)
 		serv_addr.sin_port = htons(port);
 		if (bind(listen_fd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
 			fprintf(stderr, "could not bind: %s\n", strerror(errno));
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	}
 	listen(listen_fd, 1);
@@ -353,17 +353,17 @@ int initSocket(int port, cv4l_fmt &fmt, v4l2_fract &pixelaspect)
 	sock_fd = accept(listen_fd, (struct sockaddr *)&cli_addr, &clilen);
 	if (sock_fd < 0) {
 		fprintf(stderr, "could not accept\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	if (read_u32(sock_fd) != V4L_STREAM_ID) {
 		fprintf(stderr, "unknown protocol ID\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	__u32 version = read_u32(sock_fd);
 
 	if (!version || version > V4L_STREAM_VERSION) {
 		fprintf(stderr, "unknown protocol version %u\n", version);
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	for (;;) {
 		__u32 packet = read_u32(sock_fd);
@@ -371,7 +371,7 @@ int initSocket(int port, cv4l_fmt &fmt, v4l2_fract &pixelaspect)
 
 		if (packet == V4L_STREAM_PACKET_END) {
 			fprintf(stderr, "END packet read\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 
 		if (packet == V4L_STREAM_PACKET_FMT_VIDEO)
@@ -385,7 +385,7 @@ int initSocket(int port, cv4l_fmt &fmt, v4l2_fract &pixelaspect)
 			n = read(sock_fd, buf, rdsize);
 			if (n < 0) {
 				fprintf(stderr, "error reading %d bytes\n", sz);
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			sz -= n;
 		}
@@ -396,7 +396,7 @@ int initSocket(int port, cv4l_fmt &fmt, v4l2_fract &pixelaspect)
 
 	if (sz != V4L_STREAM_PACKET_FMT_VIDEO_SIZE_FMT) {
 		fprintf(stderr, "unsupported FMT_VIDEO size\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	fmt.s_num_planes(read_u32(sock_fd));
 	fmt.s_pixelformat(read_u32(sock_fd));
@@ -416,7 +416,7 @@ int initSocket(int port, cv4l_fmt &fmt, v4l2_fract &pixelaspect)
 
 		if (sz != V4L_STREAM_PACKET_FMT_VIDEO_SIZE_FMT_PLANE) {
 			fprintf(stderr, "unsupported FMT_VIDEO plane size\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		fmt.s_sizeimage(read_u32(sock_fd), i);
 		fmt.s_bytesperline(read_u32(sock_fd), i);
@@ -675,11 +675,11 @@ int main(int argc, char **argv)
 		video_device = getDeviceName("/dev/video", video_device);
 		if (fd.open(video_device.toUtf8().data(), true) < 0) {
 			perror((QString("could not open ") + video_device).toUtf8().data());
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		if (!fd.has_vid_cap()) {
 			fprintf(stderr, "%s is not a video capture device\n", video_device.toUtf8().data());
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		fd.g_fmt(fmt);
 
@@ -787,7 +787,7 @@ int main(int argc, char **argv)
 			fcc2s(fmt.g_pixelformat()).c_str(),
 			pixfmt2s(fmt.g_pixelformat()).c_str());
 		if (mode != AppModeSocket)
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		sock_fd = initSocket(port, fmt, pixelaspect);
 	}
 	win.setPixelAspect(pixelaspect);
@@ -813,7 +813,7 @@ int main(int argc, char **argv)
 		q.queue_all(&fd);
 		win.setQueue(&q);
 		if (fd.streamon())
-			exit(1);
+			std::exit(EXIT_FAILURE);
 	} else {
 		struct tpg_data *tpg = win.getTPG();
 
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 558f5d76..73fc7e3c 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -339,7 +339,7 @@ static dev_vec list_devices()
 	dp = opendir("/dev");
 	if (dp == NULL) {
 		perror ("Couldn't open the directory");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	while ((ep = readdir(dp)))
 		if (is_radio_dev(ep->d_name))
@@ -414,7 +414,7 @@ static void parse_freq_seek(char *optarg, struct v4l2_hw_freq_seek &seek)
 			break;
 		default:
 			usage_tuner();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	}
 }
@@ -724,7 +724,7 @@ static void read_rds_from_fd(const int fd)
 	/* create an rds handle for the current device */
 	if (!(rds_handle = v4l2_rds_create(params.options[OptRBDS]))) {
 		fprintf(stderr, "Failed to init RDS lib: %s\n", strerror(errno));
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	/* try to receive and decode RDS data */
@@ -748,7 +748,7 @@ static int parse_cl(int argc, char **argv)
 
 	if (argc == 1) {
 		usage_hint();
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	for (i = 0; long_options[i].name; i++) {
 		if (!isalpha(long_options[i].val))
@@ -976,18 +976,18 @@ int main(int argc, char **argv)
 	parse_cl(argc, argv);
 	if (params.options[OptHelp]) {
 		usage();
-		exit(0);
+		std::exit(EXIT_SUCCESS);
 	}
 
 	/* File Mode: disables all other features, except for RDS decoding */
 	if (params.filemode_active) {
 		if ((fd = open(params.fd_name, O_RDONLY|O_NONBLOCK)) < 0){
 			perror("error opening file");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		read_rds_from_fd(fd);
 		close(fd);
-		exit(0);
+		std::exit(EXIT_SUCCESS);
 	}
 
 	/* Device Mode: open the radio device as read-only and non-blocking */
@@ -996,7 +996,7 @@ int main(int argc, char **argv)
 		dev_vec devices = list_devices();
 		if (devices.empty()) {
 			fprintf(stderr, "No RDS-capable device found\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		strncpy(params.fd_name, devices[0].c_str(), sizeof(params.fd_name));
 		params.fd_name[sizeof(params.fd_name) - 1] = '\0';
@@ -1005,7 +1005,7 @@ int main(int argc, char **argv)
 	if ((fd = open(params.fd_name, O_RDONLY | O_NONBLOCK)) < 0) {
 		fprintf(stderr, "Failed to open %s: %s\n", params.fd_name,
 			strerror(errno));
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	doioctl(fd, VIDIOC_QUERYCAP, &vcap);
 
@@ -1021,5 +1021,5 @@ int main(int argc, char **argv)
 		read_rds_from_fd(fd);
 
 	close(fd);
-	exit(app_result);
+	std::exit(app_result);
 }
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index a312f54d..da8a7d10 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -486,7 +486,7 @@ static void signal_handler_interrupt(int signum)
 {
 	restoreState();
 	printf("\n");
-	exit(-1);
+	std::exit(EXIT_FAILURE);
 }
 
 static void determine_codec_mask(struct node &node)
@@ -1544,7 +1544,7 @@ int main(int argc, char **argv)
 		switch (ch) {
 		case OptHelp:
 			usage();
-			exit(0);
+			std::exit(EXIT_FAILURE);
 		case OptSetDevice:
 			device = make_devname(optarg, "video", media_bus_info);
 			break;
@@ -1619,7 +1619,7 @@ int main(int argc, char **argv)
 						color_component = 2;
 					else {
 						usage();
-						exit(1);
+						std::exit(EXIT_FAILURE);
 					}
 					break;
 				case 1:
@@ -1634,7 +1634,7 @@ int main(int argc, char **argv)
 					break;
 				default:
 					usage();
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 			}
 			break;
@@ -1647,7 +1647,7 @@ int main(int argc, char **argv)
 				show_colors = isatty(STDOUT_FILENO);
 			else {
 				usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			break;
 		case OptNoWarnings:
@@ -1669,13 +1669,13 @@ int main(int argc, char **argv)
 			fprintf(stderr, "Option `%s' requires a value\n",
 				argv[optind]);
 			usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		case '?':
 			if (argv[optind])
 				fprintf(stderr, "Unknown argument `%s'\n",
 					argv[optind]);
 			usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	}
 	if (optind < argc) {
@@ -1684,7 +1684,7 @@ int main(int argc, char **argv)
 			fprintf(stderr, "%s ", argv[optind++]);
 		fprintf(stderr, "\n");
 		usage();
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	bool direct = !options[OptUseWrapper];
 	int fd;
@@ -1694,12 +1694,12 @@ int main(int argc, char **argv)
 	if (type == MEDIA_TYPE_CANT_STAT) {
 		fprintf(stderr, "Cannot open device %s, exiting.\n",
 			device.c_str());
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	if (type == MEDIA_TYPE_UNKNOWN) {
 		fprintf(stderr, "Unable to detect what device %s is, exiting.\n",
 			device.c_str());
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	node.device = device.c_str();
@@ -1721,7 +1721,7 @@ int main(int argc, char **argv)
 	if (fd < 0) {
 		fprintf(stderr, "Failed to open %s: %s\n", device.c_str(),
 			strerror(errno));
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	if (!expbuf_device.empty()) {
@@ -1731,7 +1731,7 @@ int main(int argc, char **argv)
 		if (fd < 0) {
 			fprintf(stderr, "Failed to open %s: %s\n", expbuf_device.c_str(),
 				strerror(errno));
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	}
 
@@ -1742,5 +1742,5 @@ int main(int argc, char **argv)
 	if (media_fd >= 0)
 		close(media_fd);
 
-	exit(app_result);
+	std::exit(app_result);
 }
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 07c7be29..e988923b 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -208,7 +208,7 @@ private:
 			       COLOR_BOLD("warn") : "warn",	\
 			       __FILE__, __LINE__, ##args);	\
 		if (exit_on_warn)				\
-			exit(1);				\
+			std::exit(EXIT_FAILURE);		\
 	} while (0)
 
 #define warn_once(fmt, args...)						\
@@ -232,7 +232,7 @@ private:
 	printf("\t\t%s: %s(%d): " fmt, show_colors ?			\
 	       COLOR_RED("fail") : "fail", __FILE__, __LINE__, ##args);	\
 	if (exit_on_fail)						\
-		exit(1);						\
+		std::exit(EXIT_FAILURE);				\
 	1;								\
 })
 
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 26947724..fc49fff6 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -2254,7 +2254,7 @@ static int testBlockingDQBuf(struct node *node, cv4l_queue &q)
 		cv4l_buffer buf(q.g_type(), V4L2_MEMORY_MMAP);
 
 		node->dqbuf(buf);
-		exit(0);
+		std::exit(EXIT_SUCCESS);
 	}
 
 	/* Wait for the child process to start and block */
@@ -2273,7 +2273,7 @@ static int testBlockingDQBuf(struct node *node, cv4l_queue &q)
 		 * be blocked by the DQBUF!
 		 */
 		node->streamoff(q.g_type());
-		exit(0);
+		std::exit(EXIT_SUCCESS);
 	}
 
 	int wstatus_streamoff = 0;
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 4bf7328d..bbd00e95 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -695,13 +695,13 @@ void common_process_controls(cv4l_fd &fd)
 	for (ctrl_get_list::iterator iter = get_ctrls.begin(); iter != get_ctrls.end(); ++iter) {
 	    if (ctrl_str2q.find(*iter) == ctrl_str2q.end()) {
 		fprintf(stderr, "unknown control '%s'\n", iter->c_str());
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	    }
 	}
 	for (ctrl_set_map::iterator iter = set_ctrls.begin(); iter != set_ctrls.end(); ++iter) {
 	    if (ctrl_str2q.find(iter->first) == ctrl_str2q.end()) {
 		fprintf(stderr, "unknown control '%s'\n", iter->first.c_str());
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	    }
 	}
 }
@@ -806,11 +806,11 @@ void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
 		while (*subs != '\0') {
 			if (parse_next_subopt(&subs, &value)) {
 				common_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			if (strchr(value, '=')) {
 				common_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			else {
 				get_ctrls.push_back(value);
@@ -822,21 +822,21 @@ void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
 		while (*subs != '\0') {
 			if (parse_next_subopt(&subs, &value)) {
 				common_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			if (const char *equal = strchr(value, '=')) {
 				set_ctrls[std::string(value, (equal - value))] = equal + 1;
 			}
 			else {
 				fprintf(stderr, "control '%s' without '='\n", value);
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		break;
 	case OptSubset:
 		if (parse_subset(optarg)) {
 			common_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		break;
 	case OptSetPriority:
diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
index 9c7c6bc4..a2df6089 100644
--- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
@@ -233,7 +233,7 @@ static void edid_add_block(struct v4l2_edid *e)
 		fprintf(stderr, "edid file error: too long\n");
 		free(e->edid);
 		e->edid = NULL;
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	e->edid = static_cast<unsigned char *>(realloc(e->edid, e->blocks * 128));
 }
@@ -986,13 +986,13 @@ void edid_cmd(int ch, char *optarg)
 			if (opt == -1) {
 				fprintf(stderr, "Invalid suboptions specified\n");
 				edid_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			if (value == NULL && opt <= 8) {
 				fprintf(stderr, "No value given to suboption <%s>\n",
 					subopts[opt]);
 				edid_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			switch (opt) {
 			case 0:
@@ -1020,11 +1020,11 @@ void edid_cmd(int ch, char *optarg)
 					sedid.blocks = sizeof(hdmi_edid) / 128;
 				} else {
 					edid_usage();
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 				if (file_in) {
 					fprintf(stderr, "The edid and file options can't be used together.\n");
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 				break;
 			case 3:
@@ -1032,7 +1032,7 @@ void edid_cmd(int ch, char *optarg)
 					file_in = value;
 					if (sedid.edid) {
 						fprintf(stderr, "The edid and file options can't be used together.\n");
-						exit(1);
+						std::exit(EXIT_FAILURE);
 					}
 				}
 				break;
@@ -1043,7 +1043,7 @@ void edid_cmd(int ch, char *optarg)
 					sformat = RAW;
 				} else {
 					edid_usage();
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 				break;
 			case 5:
@@ -1109,7 +1109,7 @@ void edid_cmd(int ch, char *optarg)
 			case 56: toggle_speaker3_flags |= SPEAKER3_TPLS_TPRS; break;
 			default:
 				edid_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		break;
@@ -1145,7 +1145,7 @@ void edid_cmd(int ch, char *optarg)
 				gedid.start_block = strtoul(value, 0, 0);
 				if (gedid.start_block > 255) {
 					fprintf(stderr, "startblock %d too large, max 255\n", gedid.start_block);
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 				break;
 			case 2:
@@ -1160,7 +1160,7 @@ void edid_cmd(int ch, char *optarg)
 					gformat = CARRAY;
 				} else {
 					edid_usage();
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 				break;
 			case 4:
@@ -1169,7 +1169,7 @@ void edid_cmd(int ch, char *optarg)
 				break;
 			default:
 				edid_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		if (gedid.start_block + gedid.blocks > 256)
@@ -1209,7 +1209,7 @@ void edid_set(cv4l_fd &_fd)
 			if (!fin) {
 				fprintf(stderr, "Failed to open %s: %s\n", file_in,
 						strerror(errno));
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		if (fin) {
@@ -1217,7 +1217,7 @@ void edid_set(cv4l_fd &_fd)
 			if (sedid.blocks == 0) {
 				fprintf(stderr, "%s contained an empty EDID, ignoring.\n",
 						file_in ? file_in : "stdin");
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		if (toggle_cta861_hdr_flags || phys_addr >= 0) {
@@ -1329,7 +1329,7 @@ void edid_get(cv4l_fd &_fd)
 			if (!fout) {
 				fprintf(stderr, "Failed to open %s: %s\n", file_out,
 						strerror(errno));
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		gedid.edid = static_cast<unsigned char *>(malloc(gedid.blocks * 128));
diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index 76d4b1dd..2561b029 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -49,7 +49,7 @@ void meta_cmd(int ch, char *optarg)
 	case OptTryMetaOutFormat:
 		if (strlen(optarg) == 0) {
 			meta_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		} else if (strlen(optarg) == 4) {
 			vfmt.fmt.meta.dataformat = v4l2_fourcc(optarg[0],
 					optarg[1], optarg[2], optarg[3]);
diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
index b038cfe9..6db87568 100644
--- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
@@ -230,7 +230,7 @@ void misc_cmd(int ch, char *optarg)
 			default:
 				if (opt < 0 || opt > 15) {
 					misc_usage();
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 				len = strlen(value);
 				if (len > sizeof(jpegcomp.APP_data) - 1)
@@ -266,7 +266,7 @@ void misc_cmd(int ch, char *optarg)
 				break;
 			default:
 				misc_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		break;
@@ -304,7 +304,7 @@ void misc_cmd(int ch, char *optarg)
 				break;
 			default:
 				misc_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		break;
diff --git a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
index 0b7c4cdc..62b26f0c 100644
--- a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
@@ -52,7 +52,7 @@ void sdr_cmd(int ch, char *optarg)
 	case OptTrySdrOutFormat:
 		if (strlen(optarg) == 0) {
 			sdr_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		} else if (strlen(optarg) == 4) {
 			vfmt.fmt.sdr.pixelformat = v4l2_fourcc(optarg[0],
 					optarg[1], optarg[2], optarg[3]);
diff --git a/utils/v4l2-ctl/v4l2-ctl-selection.cpp b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
index ac5a1d7b..be62eb03 100644
--- a/utils/v4l2-ctl/v4l2-ctl-selection.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
@@ -136,7 +136,7 @@ static void parse_crop(char *optarg, unsigned int &set_crop, v4l2_rect &vcrop)
 			break;
 		default:
 			selection_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	}
 }
@@ -184,7 +184,7 @@ static int parse_selection(char *optarg, unsigned int &set_sel, v4l2_selection &
 			if (parse_selection_target(value, vsel.target)) {
 				fprintf(stderr, "Unknown selection target\n");
 				selection_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			break;
 		case 1:
@@ -210,7 +210,7 @@ static int parse_selection(char *optarg, unsigned int &set_sel, v4l2_selection &
 		default:
 			fprintf(stderr, "Unknown option\n");
 			selection_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	}
 
@@ -262,7 +262,7 @@ void selection_cmd(int ch, char *optarg)
 			if (parse_selection(optarg, get_sel, gsel)) {
 				fprintf(stderr, "Unknown selection target\n");
 				selection_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			get_sel_target = gsel.target;
 			break;
diff --git a/utils/v4l2-ctl/v4l2-ctl-stds.cpp b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
index 62f57a44..8dd06c43 100644
--- a/utils/v4l2-ctl/v4l2-ctl-stds.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
@@ -102,7 +102,7 @@ static v4l2_std_id parse_pal(const char *pal)
 	}
 	fprintf(stderr, "pal specifier not recognised\n");
 	stds_usage();
-	exit(1);
+	std::exit(EXIT_FAILURE);
 }
 
 static v4l2_std_id parse_secam(const char *secam)
@@ -124,7 +124,7 @@ static v4l2_std_id parse_secam(const char *secam)
 	}
 	fprintf(stderr, "secam specifier not recognised\n");
 	stds_usage();
-	exit(1);
+	std::exit(EXIT_FAILURE);
 }
 
 static v4l2_std_id parse_ntsc(const char *ntsc)
@@ -141,7 +141,7 @@ static v4l2_std_id parse_ntsc(const char *ntsc)
 	}
 	fprintf(stderr, "ntsc specifier not recognised\n");
 	stds_usage();
-	exit(1);
+	std::exit(EXIT_FAILURE);
 }
 
 enum timing_opts {
@@ -204,13 +204,13 @@ static int parse_timing_subopt(char **subopt_str, int *value)
 	if (opt == -1) {
 		fprintf(stderr, "Invalid suboptions specified\n");
 		stds_usage();
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	if (opt_str == NULL && opt != CVT && opt != GTF && opt != CLEAR) {
 		fprintf(stderr, "No value given to suboption <%s>\n",
 				subopt_list[opt]);
 		stds_usage();
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	if (opt_str)
@@ -269,7 +269,7 @@ static void get_cvt_gtf_timings(char *subopt, int standard,
 
 	if (!timings_valid) {
 		stds_usage();
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 }
 
@@ -356,7 +356,7 @@ static void parse_dv_bt_timings(char *optarg, struct v4l2_dv_timings *dv_timings
 			break;
 		default:
 			stds_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		set_dv_timing_opts |= 1 << opt;
 	}
@@ -464,7 +464,7 @@ void stds_cmd(int ch, char *optarg)
 		} else {
 			fprintf(stderr, "Unknown standard '%s'\n", optarg);
 			stds_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		break;
 	case OptSetDvBtTimings:
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index a4cdc4bd..95ffe986 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1677,12 +1677,12 @@ static FILE *open_output_file(cv4l_fd &fd)
 	host_fd_to = socket(AF_INET, SOCK_STREAM, 0);
 	if (host_fd_to < 0) {
 		fprintf(stderr, "cannot open socket");
-		exit(0);
+		std::exit(EXIT_SUCCESS);
 	}
 	server = gethostbyname(host_to);
 	if (server == NULL) {
 		fprintf(stderr, "no such host %s\n", host_to);
-		exit(0);
+		std::exit(EXIT_SUCCESS);
 	}
 	memset(reinterpret_cast<char *>(&serv_addr), 0, sizeof(serv_addr));
 	serv_addr.sin_family = AF_INET;
@@ -1692,7 +1692,7 @@ static FILE *open_output_file(cv4l_fd &fd)
 	serv_addr.sin_port = htons(host_port_to);
 	if (connect(host_fd_to, reinterpret_cast<struct sockaddr *>(&serv_addr), sizeof(serv_addr)) < 0) {
 		fprintf(stderr, "could not connect\n");
-		exit(0);
+		std::exit(EXIT_SUCCESS);
 	}
 	fout = fdopen(host_fd_to, "a");
 	write_u32(fout, V4L_STREAM_ID);
@@ -1937,30 +1937,30 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 	listen_fd = socket(AF_INET, SOCK_STREAM, 0);
 	if (listen_fd < 0) {
 		fprintf(stderr, "could not opening socket\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	serv_addr.sin_family = AF_INET;
 	serv_addr.sin_addr.s_addr = INADDR_ANY;
 	serv_addr.sin_port = htons(host_port_from);
 	if (bind(listen_fd, reinterpret_cast<struct sockaddr *>(&serv_addr), sizeof(serv_addr)) < 0) {
 		fprintf(stderr, "could not bind\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	listen(listen_fd, 1);
 	clilen = sizeof(cli_addr);
 	host_fd_from = accept(listen_fd, reinterpret_cast<struct sockaddr *>(&cli_addr), &clilen);
 	if (host_fd_from < 0) {
 		fprintf(stderr, "could not accept\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	fin = fdopen(host_fd_from, "r");
 	if (read_u32(fin) != V4L_STREAM_ID) {
 		fprintf(stderr, "unknown protocol ID\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	if (read_u32(fin) != V4L_STREAM_VERSION) {
 		fprintf(stderr, "unknown protocol version\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	for (;;) {
 		__u32 packet = read_u32(fin);
@@ -1968,7 +1968,7 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 
 		if (packet == V4L_STREAM_PACKET_END) {
 			fprintf(stderr, "END packet read\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 
 		if (packet == V4L_STREAM_PACKET_FMT_VIDEO)
@@ -1982,7 +1982,7 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 			n = fread(buf, 1, rdsize, fin);
 			if (n < 0) {
 				fprintf(stderr, "error reading %d bytes\n", sz);
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			sz -= n;
 		}
@@ -1995,7 +1995,7 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 
 	if (sz != V4L_STREAM_PACKET_FMT_VIDEO_SIZE_FMT) {
 		fprintf(stderr, "unsupported FMT_VIDEO size\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	cfmt.s_num_planes(read_u32(fin));
 	cfmt.s_pixelformat(read_u32(fin));
@@ -2023,7 +2023,7 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 
 		if (sz != V4L_STREAM_PACKET_FMT_VIDEO_SIZE_FMT_PLANE) {
 			fprintf(stderr, "unsupported FMT_VIDEO plane size\n");
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		cfmt.s_sizeimage(read_u32(fin), i);
 		cfmt.s_bytesperline(read_u32(fin), i);
@@ -2031,7 +2031,7 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 	}
 	if (fd.s_fmt(cfmt)) {
 		fprintf(stderr, "failed to set new format\n");
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	return fin;
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index 5bd5f57e..9e17a58d 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -128,7 +128,7 @@ void subdev_cmd(int ch, char *optarg)
 				break;
 			default:
 				subdev_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		break;
@@ -158,7 +158,7 @@ void subdev_cmd(int ch, char *optarg)
 				break;
 			default:
 				subdev_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		break;
@@ -184,13 +184,13 @@ void subdev_cmd(int ch, char *optarg)
 				if (parse_selection_target(value, target)) {
 					fprintf(stderr, "Unknown selection target\n");
 					subdev_usage();
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 				get_sel_target = target;
 				break;
 			default:
 				subdev_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		break;
@@ -263,7 +263,7 @@ void subdev_cmd(int ch, char *optarg)
 			default:
 				fprintf(stderr, "Unknown option\n");
 				subdev_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		break;
@@ -288,7 +288,7 @@ void subdev_cmd(int ch, char *optarg)
 				if (parse_selection_target(value, vsel.target)) {
 					fprintf(stderr, "Unknown selection target\n");
 					subdev_usage();
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 				break;
 			case 1:
@@ -317,7 +317,7 @@ void subdev_cmd(int ch, char *optarg)
 			default:
 				fprintf(stderr, "Unknown option\n");
 				subdev_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		break;
@@ -341,7 +341,7 @@ void subdev_cmd(int ch, char *optarg)
 			default:
 				fprintf(stderr, "Unknown option\n");
 				subdev_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		break;
@@ -484,7 +484,7 @@ void subdev_set(cv4l_fd &_fd)
 		if (set_fps <= 0) {
 			fprintf(stderr, "invalid fps %f\n", set_fps);
 			subdev_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		fival.interval.numerator = 1000;
 		fival.interval.denominator = static_cast<uint32_t>(set_fps * fival.interval.numerator);
diff --git a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
index 73dc323c..981b8765 100644
--- a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
@@ -198,7 +198,7 @@ static void parse_freq_seek(char *optarg, struct v4l2_hw_freq_seek &seek)
 			break;
 		default:
 			tuner_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	}
 }
@@ -223,7 +223,7 @@ void tuner_cmd(int ch, char *optarg)
 		else {
 			fprintf(stderr, "Unknown audio mode\n");
 			tuner_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		break;
 	case OptSetModulator:
@@ -245,7 +245,7 @@ void tuner_cmd(int ch, char *optarg)
 		else {
 			fprintf(stderr, "Unknown txsubchans value\n");
 			tuner_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		break;
 	case OptFreqSeek:
diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
index 987fae25..6a4f627f 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
@@ -95,7 +95,7 @@ void vbi_cmd(int ch, char *optarg)
 		if (optarg[0] == 0) {
 			fprintf(stderr, "empty string\n");
 			vbi_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		while (*optarg) {
 			subs = strchr(optarg, ',');
@@ -125,7 +125,7 @@ void vbi_cmd(int ch, char *optarg)
 		if (found_off && sliced->fmt.sliced.service_set) {
 			fprintf(stderr, "Sliced VBI mode 'off' cannot be combined with other modes\n");
 			vbi_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		break;
 	case OptSetVbiOutFormat:
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 49c20200..6e920c1d 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -113,7 +113,7 @@ void vidcap_cmd(int ch, char *optarg)
 		if (!set_fmts ||
 		    (set_fmts & (FmtColorspace | FmtYCbCr | FmtQuantization | FmtXferFunc))) {
 			vidcap_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		break;
 	case OptListFrameSizes:
@@ -127,7 +127,7 @@ void vidcap_cmd(int ch, char *optarg)
 			frmsize.pixel_format = strtol(optarg, 0L, 0);
 		} else {
 			fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		break;
 	case OptListFrameIntervals:
@@ -159,12 +159,12 @@ void vidcap_cmd(int ch, char *optarg)
 					frmival.pixel_format = strtol(value, 0L, 0);
 				} else {
 					fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
-					exit(1);
+					std::exit(EXIT_FAILURE);
 				}
 				break;
 			default:
 				vidcap_usage();
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		break;
@@ -317,14 +317,14 @@ void vidcap_list(cv4l_fd &fd)
 						  false, is_multiplanar);
 			if (!frmsize.pixel_format) {
 				fprintf(stderr, "The pixelformat index was invalid\n");
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		if (!valid_pixel_format(fd.g_fd(), frmsize.pixel_format, false, is_multiplanar) &&
 		    !valid_pixel_format(fd.g_fd(), frmsize.pixel_format, true, is_multiplanar)) {
 			fprintf(stderr, "The pixelformat '%s' is invalid\n",
 				fcc2s(frmsize.pixel_format).c_str());
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 
 		printf("ioctl: VIDIOC_ENUM_FRAMESIZES\n");
@@ -342,13 +342,13 @@ void vidcap_list(cv4l_fd &fd)
 						  false, is_multiplanar);
 			if (!frmival.pixel_format) {
 				fprintf(stderr, "The pixelformat index was invalid\n");
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 		}
 		if (!valid_pixel_format(fd.g_fd(), frmival.pixel_format, false, is_multiplanar)) {
 			fprintf(stderr, "The pixelformat '%s' is invalid\n",
 				fcc2s(frmival.pixel_format).c_str());
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 
 		printf("ioctl: VIDIOC_ENUM_FRAMEINTERVALS\n");
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
index 955b2c50..e3cb4bcb 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
@@ -99,7 +99,7 @@ void vidout_cmd(int ch, char *optarg)
 				sizeimage);
 		if (!set_fmts_out) {
 			vidcap_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		break;
 	}
@@ -202,7 +202,7 @@ void vidout_set(cv4l_fd &_fd)
 						fcc2s(pixfmt).c_str());
 				else
 					fprintf(stderr, "The pixelformat index was invalid\n");
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 
 			if (options[OptSetVideoOutFormat])
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index f6e90f51..f8187fea 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -795,7 +795,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 				pixelformat = strtol(value, 0L, 0);
 			} else {
 				fprintf(stderr, "The pixelformat '%s' is invalid\n", value);
-				exit(1);
+				std::exit(EXIT_FAILURE);
 			}
 			fmts |= FmtPixelFormat;
 			break;
@@ -931,7 +931,7 @@ static __u32 parse_event(const char *e, const char **name)
 		if (event == V4L2_EVENT_CTRL) {
 			fprintf(stderr, "Missing control name for ctrl event, use ctrl=<name>\n");
 			misc_usage();
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	} else if (!strcmp(e, "eos")) {
 		event = V4L2_EVENT_EOS;
@@ -954,7 +954,7 @@ static __u32 parse_event(const char *e, const char **name)
 	if (event == 0) {
 		fprintf(stderr, "Unknown event\n");
 		misc_usage();
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	return event;
 }
@@ -1288,7 +1288,7 @@ int main(int argc, char **argv)
 	if (type == MEDIA_TYPE_CANT_STAT) {
 		fprintf(stderr, "Cannot open device %s, exiting.\n",
 			device);
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	switch (type) {
@@ -1308,7 +1308,7 @@ int main(int argc, char **argv)
 	if (type == MEDIA_TYPE_UNKNOWN) {
 		fprintf(stderr, "Unable to detect what device %s is, exiting.\n",
 			device);
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	is_subdev = type == MEDIA_TYPE_SUBDEV;
 	if (is_subdev)
@@ -1325,14 +1325,14 @@ int main(int argc, char **argv)
 	if (fd < 0) {
 		fprintf(stderr, "Failed to open %s: %s\n", device,
 			strerror(errno));
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	verbose = options[OptVerbose];
 	c_fd.s_trace(options[OptSilent] ? 0 : (verbose ? 2 : 1));
 
 	if (!is_subdev && doioctl(fd, VIDIOC_QUERYCAP, &vcap)) {
 		fprintf(stderr, "%s: not a v4l2 node\n", device);
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	capabilities = vcap.capabilities;
 	if (capabilities & V4L2_CAP_DEVICE_CAPS)
@@ -1356,12 +1356,12 @@ int main(int argc, char **argv)
 		if (out_fd < 0) {
 			fprintf(stderr, "Failed to open %s: %s\n", out_device,
 					strerror(errno));
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		c_out_fd.s_trace(options[OptSilent] ? 0 : (verbose ? 2 : 1));
 		if (doioctl(out_fd, VIDIOC_QUERYCAP, &vcap)) {
 			fprintf(stderr, "%s: not a v4l2 node\n", out_device);
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		out_capabilities = vcap.capabilities;
 		if (out_capabilities & V4L2_CAP_DEVICE_CAPS)
@@ -1375,12 +1375,12 @@ int main(int argc, char **argv)
 		if (exp_fd < 0) {
 			fprintf(stderr, "Failed to open %s: %s\n", export_device,
 					strerror(errno));
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 		c_exp_fd.s_trace(options[OptSilent] ? 0 : (verbose ? 2 : 1));
 		if (doioctl(exp_fd, VIDIOC_QUERYCAP, &vcap)) {
 			fprintf(stderr, "%s: not a v4l2 node\n", export_device);
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	}
 
@@ -1389,17 +1389,17 @@ int main(int argc, char **argv)
 	if (wait_for_event == V4L2_EVENT_CTRL && wait_event_id)
 		if (!common_find_ctrl_id(wait_event_id)) {
 			fprintf(stderr, "unknown control '%s'\n", wait_event_id);
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	if (poll_for_event == V4L2_EVENT_CTRL && poll_event_id)
 		if (!common_find_ctrl_id(poll_event_id)) {
 			fprintf(stderr, "unknown control '%s'\n", poll_event_id);
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 	if (epoll_for_event == V4L2_EVENT_CTRL && epoll_event_id)
 		if (!common_find_ctrl_id(epoll_event_id)) {
 			fprintf(stderr, "unknown control '%s'\n", epoll_event_id);
-			exit(1);
+			std::exit(EXIT_FAILURE);
 		}
 
 	if (options[OptAll]) {
@@ -1610,5 +1610,5 @@ int main(int argc, char **argv)
 	// --all sets --silent to avoid ioctl errors to be shown when an ioctl
 	// is not implemented by the driver. Which is fine, but we shouldn't
 	// return an application error in that specific case.
-	exit(options[OptAll] ? 0 : app_result);
+	std::exit(options[OptAll] ? 0 : app_result);
 }
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 26aa2b44..f2fd8269 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -386,13 +386,13 @@ static int parse_subopt(char **subs, const char * const *subopts, char **value)
 	if (opt == -1) {
 		fprintf(stderr, "Invalid suboptions specified\n");
 		usage();
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	if (*value == NULL) {
 		fprintf(stderr, "No value given to suboption <%s>\n",
 				subopts[opt]);
 		usage();
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 	return opt;
 }
@@ -428,7 +428,7 @@ int main(int argc, char **argv)
 
 	if (argc == 1) {
 		usage();
-		exit(0);
+		std::exit(EXIT_SUCCESS);
 	}
 	for (i = 0; long_options[i].name; i++) {
 		if (!isalpha(long_options[i].val))
@@ -466,7 +466,7 @@ int main(int argc, char **argv)
 		switch (ch) {
 		case OptHelp:
 			usage();
-			exit(0);
+			std::exit(EXIT_SUCCESS);
 
 		case OptSetDevice:
 			device = optarg;
@@ -550,7 +550,7 @@ int main(int argc, char **argv)
 	if ((fd = open(device, O_RDWR)) < 0) {
 		fprintf(stderr, "Failed to open %s: %s\n", device,
 			strerror(errno));
-		exit(1);
+		std::exit(EXIT_FAILURE);
 	}
 
 	doioctl(fd, VIDIOC_QUERYCAP, &vcap, "VIDIOC_QUERYCAP");
@@ -814,5 +814,5 @@ list_done:
 	}
 
 	close(fd);
-	exit(0);
+	std::exit(EXIT_SUCCESS);
 }
-- 
2.25.3

