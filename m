Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7211BD369
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 06:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbgD2EGf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 00:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725497AbgD2EGf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 00:06:35 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CAEC03C1AD
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 21:06:34 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id fu13so238384pjb.5
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 21:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=We0irLTTZgwTk3bgh3C7i3lmUqK5JQg3qJmYwmRHXJY=;
        b=RuEo0eLs6rrjbMtPKfFJ5C+1SVA5TT85NsuOCVtMZiAIfNBVKszXvzc5RlI0r+DCsC
         Q7FlgV9ShS5MLohoA14X8azFNrLl1tjgvMcdNLCSWBqFUeosRQDnTmXEwcyg2mHjz4CY
         +SRmO9nsXRYIvS5j/z6w6d5qQk6HcPFAjL42IuXdkraHv+BDWVQeW6r256fNzql22DW7
         GCWSplgHv0niKI6R7DASaZV2VWTxxnEDjqW6PxVAkr6vVbkAA0j/caU/ANeXgK8VvhOU
         hV0NE9zPZMT6iSbo1nahvLRE0HsK01aauW0ge8qUuM4yHLnuT5CSntGDsQQJfxMotLkI
         1CSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=We0irLTTZgwTk3bgh3C7i3lmUqK5JQg3qJmYwmRHXJY=;
        b=Nu2/2LBkJmUeNH2akf6iiAcJQOGfAAmpNGpP4Ix8oIQmeJ0BfIeKdfQLM7L5XnFCVM
         a6moDgzJFt79OJlNC5169LgiplClIKWOYQey7lWA1f2Tw72+A+HgwdFG6ayvIhqIQ+DT
         HOujjMuvCQ9JAYliC9Wx8XDZBEHgMD9ZxL8Odv7zUloxaUMbHepGtaZEZTFz6CRP3ZXC
         A3MkoTZ4IQu1cayUyU7w1AoGJn7gKIUPt6kait2ih4OwyJ11wPU/drnaMsuyMDcp4Tor
         UbgHgoEUlDpCAoDgqVNpVFMXh66M8N5eLkH1envFKwwtUEVnevdnLG+76V22UY4eSgUf
         iUSA==
X-Gm-Message-State: AGi0PubX9UJ54QY8CTZMcBmZX/tqTAPw7E+OIsP5gP/EGwO5rXZ6O34/
        cSNROo6H8N7l/0ip1J7mKIb0PhrfHxQ=
X-Google-Smtp-Source: APiQypI0tmRrfYsQf7KSIAf3UEgti+pnwlyTLS6QqoVNDolalR+vFxKOy8x1jTTdnJAJqoxFPSqy1w==
X-Received: by 2002:a17:90a:3251:: with SMTP id k75mr852725pjb.161.1588133193161;
        Tue, 28 Apr 2020 21:06:33 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id i25sm16103370pfo.196.2020.04.28.21.06.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 21:06:32 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 4/7] utils: convert all string to number functions to std
Date:   Tue, 28 Apr 2020 21:06:24 -0700
Message-Id: <20200429040627.27859-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200429040627.27859-1-rosenp@gmail.com>
References: <20200429040627.27859-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp   |  6 +--
 utils/cec-compliance/cec-test.cpp         |  2 +-
 utils/cec-ctl/cec-ctl.cpp                 | 48 +++++++++++------------
 utils/cec-follower/cec-follower.cpp       |  4 +-
 utils/libcecutil/cec-parse.cpp            |  6 +--
 utils/rds-ctl/rds-ctl.cpp                 | 12 +++---
 utils/v4l2-compliance/v4l2-compliance.cpp | 10 ++---
 utils/v4l2-ctl/v4l2-ctl-common.cpp        | 16 ++++----
 utils/v4l2-ctl/v4l2-ctl-edid.cpp          | 22 +++++------
 utils/v4l2-ctl/v4l2-ctl-io.cpp            |  8 ++--
 utils/v4l2-ctl/v4l2-ctl-meta.cpp          |  2 +-
 utils/v4l2-ctl/v4l2-ctl-misc.cpp          |  8 ++--
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp       | 32 +++++++--------
 utils/v4l2-ctl/v4l2-ctl-sdr.cpp           |  2 +-
 utils/v4l2-ctl/v4l2-ctl-selection.cpp     | 16 ++++----
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp     | 22 +++++------
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp        | 42 ++++++++++----------
 utils/v4l2-ctl/v4l2-ctl-tuner.cpp         | 16 ++++----
 utils/v4l2-ctl/v4l2-ctl-vbi.cpp           | 14 +++----
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp        |  8 ++--
 utils/v4l2-ctl/v4l2-ctl.cpp               | 22 +++++------
 utils/v4l2-dbg/v4l2-dbg.cpp               |  4 +-
 22 files changed, 161 insertions(+), 161 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 5f0a74ec..ced256f2 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -1210,10 +1210,10 @@ int main(int argc, char **argv)
 			adapter = optarg;
 			break;
 		case OptReplyThreshold:
-			reply_threshold = strtoul(optarg, NULL, 0);
+			reply_threshold = std::strtoul(optarg, NULL, 0);
 			break;
 		case OptTimeout:
-			long_timeout = strtoul(optarg, NULL, 0);
+			long_timeout = std::strtoul(optarg, NULL, 0);
 			break;
 		case OptColor:
 			if (!strcmp(optarg, "always"))
@@ -1246,7 +1246,7 @@ int main(int argc, char **argv)
 			break;
 		case OptRemote:
 			if (optarg) {
-				remote_la = strtoul(optarg, NULL, 0);
+				remote_la = std::strtoul(optarg, NULL, 0);
 				if (remote_la < 0 || remote_la > 15) {
 					fprintf(stderr, "--test: invalid remote logical address\n");
 					usage();
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 67d4c397..75e56fde 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -1539,7 +1539,7 @@ int setExpectedResult(char *optarg, bool no_warnings)
 	std::string name = safename(optarg);
 	if (mapTests.find(name) == mapTests.end())
 		return 1;
-	mapTests[name] = strtoul(equal + 1, NULL, 0);
+	mapTests[name] = std::strtoul(equal + 1, NULL, 0);
 	mapTestsNoWarnings[name] = no_warnings;
 	return 0;
 }
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 8c4b2ffa..c7fd7cd8 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -1654,7 +1654,7 @@ static int calc_node_val(const char *s)
 	s = std::strrchr(s, '/') + 1;
 
 	if (!memcmp(s, "cec", 3))
-		return atol(s + 3);
+		return std::atoi(s + 3);
 	return 0;
 }
 
@@ -1902,18 +1902,18 @@ int main(int argc, char **argv)
 			verbose = true;
 			break;
 		case OptFrom:
-			from = strtoul(optarg, NULL, 0) & 0xf;
+			from = std::strtoul(optarg, NULL, 0) & 0xf;
 			break;
 		case OptTo:
-			to = strtoul(optarg, NULL, 0) & 0xf;
+			to = std::strtoul(optarg, NULL, 0) & 0xf;
 			if (first_to == 0xff)
 				first_to = to;
 			break;
 		case OptTimeout:
-			timeout = strtoul(optarg, NULL, 0);
+			timeout = std::strtoul(optarg, NULL, 0);
 			break;
 		case OptMonitorTime:
-			monitor_time = strtoul(optarg, NULL, 0);
+			monitor_time = std::strtoul(optarg, NULL, 0);
 			break;
 		case OptIgnore: {
 			bool all_la = !strncmp(optarg, "all", 3);
@@ -1924,7 +1924,7 @@ int main(int argc, char **argv)
 			if (sep)
 				all_opcodes = !strncmp(sep + 1, "all", 3);
 			if (!all_la) {
-				la = strtoul(optarg, NULL, 0);
+				la = std::strtoul(optarg, NULL, 0);
 
 				if (la > 15) {
 					fprintf(stderr, "invalid logical address (> 15)\n");
@@ -1937,7 +1937,7 @@ int main(int argc, char **argv)
 				if (!strncmp(sep + 1, "poll", 4)) {
 					opcode = POLL_FAKE_OPCODE;
 				} else {
-					opcode = strtoul(sep + 1, NULL, 0);
+					opcode = std::strtoul(sep + 1, NULL, 0);
 					if (opcode > 255) {
 						fprintf(stderr, "invalid opcode (> 255)\n");
 						usage();
@@ -1977,7 +1977,7 @@ int main(int argc, char **argv)
 			osd_name = optarg;
 			break;
 		case OptVendorID:
-			vendor_id = strtoul(optarg, NULL, 0) & 0x00ffffff;
+			vendor_id = std::strtoul(optarg, NULL, 0) & 0x00ffffff;
 			break;
 		case OptRcTVProfile1:
 			rc_tv = CEC_OP_FEAT_RC_TV_PROFILE_1;
@@ -2064,7 +2064,7 @@ int main(int argc, char **argv)
 				switch (cec_parse_subopt(&subs, arg_names, &value)) {
 				case 0:
 					while (size < sizeof(bytes)) {
-						bytes[size++] = strtol(value, &endptr, 0L);
+						bytes[size++] = std::strtol(value, &endptr, 0L);
 						if (endptr == value) {
 							size--;
 							break;
@@ -2100,12 +2100,12 @@ int main(int argc, char **argv)
 			while (*subs != '\0') {
 				switch (cec_parse_subopt(&subs, arg_names, &value)) {
 				case 0:
-					cmd = strtol(value, &endptr, 0L);
+					cmd = std::strtol(value, &endptr, 0L);
 					have_cmd = true;
 					break;
 				case 1:
 					while (size < sizeof(bytes)) {
-						bytes[size++] = strtol(value, &endptr, 0L);
+						bytes[size++] = std::strtol(value, &endptr, 0L);
 						if (endptr == value) {
 							size--;
 							break;
@@ -2142,11 +2142,11 @@ int main(int argc, char **argv)
 			while (*subs != '\0') {
 				switch (cec_parse_subopt(&subs, arg_names, &value)) {
 				case 0:
-					vendor_id = strtol(value, 0L, 0);
+					vendor_id = std::strtol(value, 0L, 0);
 					break;
 				case 1:
 					while (size < sizeof(bytes)) {
-						bytes[size++] = strtol(value, &endptr, 0L);
+						bytes[size++] = std::strtol(value, &endptr, 0L);
 						if (endptr == value) {
 							size--;
 							break;
@@ -2180,7 +2180,7 @@ int main(int argc, char **argv)
 				switch (cec_parse_subopt(&subs, arg_names, &value)) {
 				case 0:
 					while (size < sizeof(bytes)) {
-						bytes[size++] = strtol(value, &endptr, 0L);
+						bytes[size++] = std::strtol(value, &endptr, 0L);
 						if (endptr == value) {
 							size--;
 							break;
@@ -2224,10 +2224,10 @@ int main(int argc, char **argv)
 			while (*subs != '\0') {
 				switch (cec_parse_subopt(&subs, arg_names, &value)) {
 				case 0:
-					test_pwr_cycle_polls = strtoul(value, 0L, 0);
+					test_pwr_cycle_polls = std::strtoul(value, 0L, 0);
 					break;
 				case 1:
-					test_pwr_cycle_sleep = strtoul(value, 0L, 0);
+					test_pwr_cycle_sleep = std::strtoul(value, 0L, 0);
 					break;
 				default:
 					std::exit(EXIT_FAILURE);
@@ -2253,29 +2253,29 @@ int main(int argc, char **argv)
 			while (*subs != '\0') {
 				switch (cec_parse_subopt(&subs, arg_names, &value)) {
 				case 0:
-					stress_test_pwr_cycle_cnt = strtoul(value, 0L, 0);
+					stress_test_pwr_cycle_cnt = std::strtoul(value, 0L, 0);
 					break;
 				case 1:
-					stress_test_pwr_cycle_min_sleep = strtoul(value, 0L, 0);
+					stress_test_pwr_cycle_min_sleep = std::strtoul(value, 0L, 0);
 					break;
 				case 2:
-					stress_test_pwr_cycle_max_sleep = strtoul(value, 0L, 0);
+					stress_test_pwr_cycle_max_sleep = std::strtoul(value, 0L, 0);
 					break;
 				case 3:
 					stress_test_pwr_cycle_has_seed = true;
-					stress_test_pwr_cycle_seed = strtoul(value, 0L, 0);
+					stress_test_pwr_cycle_seed = std::strtoul(value, 0L, 0);
 					break;
 				case 4:
-					stress_test_pwr_cycle_repeats = strtoul(value, 0L, 0);
+					stress_test_pwr_cycle_repeats = std::strtoul(value, 0L, 0);
 					break;
 				case 5:
-					stress_test_pwr_cycle_sleep_before_on = strtod(value, NULL);
+					stress_test_pwr_cycle_sleep_before_on = std::strtod(value, NULL);
 					break;
 				case 6:
-					stress_test_pwr_cycle_sleep_before_off = strtod(value, NULL);
+					stress_test_pwr_cycle_sleep_before_off = std::strtod(value, NULL);
 					break;
 				case 7:
-					stress_test_pwr_cycle_polls = strtoul(value, 0L, 0);
+					stress_test_pwr_cycle_polls = std::strtoul(value, 0L, 0);
 					break;
 				default:
 					std::exit(EXIT_FAILURE);
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 4922d1ab..3314a0a1 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -393,7 +393,7 @@ int main(int argc, char **argv)
 			if (sep)
 				all_opcodes = !strncmp(sep + 1, "all", 3);
 			if (!all_la) {
-				la = strtoul(optarg, NULL, 0);
+				la = std::strtoul(optarg, NULL, 0);
 
 				if (la > 15) {
 					fprintf(stderr, "invalid logical address (> 15)\n");
@@ -403,7 +403,7 @@ int main(int argc, char **argv)
 				la_mask = 1 << la;
 			}
 			if (!all_opcodes) {
-				opcode = strtoul(sep + 1, NULL, 0);
+				opcode = std::strtoul(sep + 1, NULL, 0);
 				if (opcode > 255) {
 					fprintf(stderr, "invalid opcode (> 255)\n");
 					usage();
diff --git a/utils/libcecutil/cec-parse.cpp b/utils/libcecutil/cec-parse.cpp
index 4621b7f6..54c000bb 100644
--- a/utils/libcecutil/cec-parse.cpp
+++ b/utils/libcecutil/cec-parse.cpp
@@ -179,7 +179,7 @@ int cec_parse_subopt(char **subs, const char * const *subopts, char **value)
 static unsigned parse_enum(const char *value, const struct cec_arg *a)
 {
 	if (std::isdigit(*value))
-		return strtoul(value, NULL, 0);
+		return std::strtoul(value, NULL, 0);
 	for (int i = 0; i < a->num_enum_values; i++) {
 		if (!strcmp(value, a->values[i].type_name))
 			return a->values[i].value;
@@ -192,7 +192,7 @@ unsigned cec_parse_phys_addr(const char *value)
 	unsigned p1, p2, p3, p4;
 
 	if (!std::strchr(value, '.'))
-		return strtoul(value, NULL, 0);
+		return std::strtoul(value, NULL, 0);
 	if (sscanf(value, "%x.%x.%x.%x", &p1, &p2, &p3, &p4) != 4) {
 		fprintf(stderr, "Expected a physical address of the form x.x.x.x\n");
 		return 0;
@@ -207,7 +207,7 @@ unsigned cec_parse_phys_addr(const char *value)
 static unsigned parse_latency(const char *value)
 {
 	char *end;
-	unsigned delay = strtoul(value, &end, 0);
+	unsigned delay = std::strtoul(value, &end, 0);
 
 	if (!memcmp(end, "ms", 2))
 		delay = (delay / 2) + 1;
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 1da70fa0..00908533 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -404,13 +404,13 @@ static void parse_freq_seek(char *optarg, struct v4l2_hw_freq_seek &seek)
 
 		switch (parse_subopt(&subs, subopts, &value)) {
 		case 0:
-			seek.seek_upward = strtol(value, 0L, 0);
+			seek.seek_upward = std::strtol(value, 0L, 0);
 			break;
 		case 1:
-			seek.wrap_around = strtol(value, 0L, 0);
+			seek.wrap_around = std::strtol(value, 0L, 0);
 			break;
 		case 2:
-			seek.spacing = strtol(value, 0L, 0);
+			seek.spacing = std::strtol(value, 0L, 0);
 			break;
 		default:
 			usage_tuner();
@@ -776,7 +776,7 @@ static int parse_cl(int argc, char **argv)
 			params.fd_name[sizeof(params.fd_name) - 1] = '\0';
 			break;
 		case OptSetFreq:
-			params.freq = strtod(optarg, NULL);
+			params.freq = std::strtod(optarg, NULL);
 			break;
 		case OptListDevices:
 			print_devices(list_devices());
@@ -785,7 +785,7 @@ static int parse_cl(int argc, char **argv)
 			parse_freq_seek(optarg, params.freq_seek);
 			break;
 		case OptTunerIndex:
-			params.tuner_index = strtoul(optarg, NULL, 0);
+			params.tuner_index = std::strtoul(optarg, NULL, 0);
 			break;
 		case OptOpenFile:
 		{
@@ -802,7 +802,7 @@ static int parse_cl(int argc, char **argv)
 			break;
 		}
 		case OptWaitLimit:
-			params.wait_limit = strtoul(optarg, NULL, 0);
+			params.wait_limit = std::strtoul(optarg, NULL, 0);
 			break;
 		case ':':
 			fprintf(stderr, "Option '%s' requires a value\n",
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 13f14346..6c92b901 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -897,7 +897,7 @@ static std::string make_devname(const char *device, const char *devname,
 		goto err;
 
 	if (device[0] == '0' && device[1] == 'x')
-		iface_id = strtoul(device, NULL, 16);
+		iface_id = std::strtoul(device, NULL, 16);
 
 	if (!iface_id) {
 		for (i = 0; i < topology.num_entities; i++)
@@ -1577,7 +1577,7 @@ int main(int argc, char **argv)
 			break;
 		case OptStreaming:
 			if (optarg)
-				frame_count = strtoul(optarg, NULL, 0);
+				frame_count = std::strtoul(optarg, NULL, 0);
 			break;
 		case OptStreamFrom:
 		case OptStreamFromHdr: {
@@ -1598,7 +1598,7 @@ int main(int argc, char **argv)
 		}
 		case OptStreamAllFormats:
 			if (optarg)
-				all_fmt_frame_count = strtoul(optarg, NULL, 0);
+				all_fmt_frame_count = std::strtoul(optarg, NULL, 0);
 			break;
 		case OptStreamAllColorTest:
 			subs = optarg;
@@ -1624,10 +1624,10 @@ int main(int argc, char **argv)
 					}
 					break;
 				case 1:
-					color_skip = strtoul(value, 0L, 0);
+					color_skip = std::strtoul(value, 0L, 0);
 					break;
 				case 2:
-					color_perc = strtoul(value, 0L, 0);
+					color_perc = std::strtoul(value, 0L, 0);
 					if (color_perc == 0)
 						color_perc = 90;
 					if (color_perc > 100)
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 44d0c060..632ada9e 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -159,7 +159,7 @@ static int calc_node_val(const char *s)
 
 		if (!memcmp(s, prefixes[i], l)) {
 			n = i << 8;
-			n += atol(s + l);
+			n += std::atol(s + l);
 			return n;
 		}
 	}
@@ -756,9 +756,9 @@ static bool parse_subset(char *optarg)
 				return true;
 			}
 			if (idx & 1)
-				subset.offset[idx / 2] = strtoul(optarg, 0, 0);
+				subset.offset[idx / 2] = std::strtoul(optarg, 0, 0);
 			else {
-				subset.size[idx / 2 - 1] = strtoul(optarg, 0, 0);
+				subset.size[idx / 2 - 1] = std::strtoul(optarg, 0, 0);
 				if (subset.size[idx / 2 - 1] == 0) {
 					fprintf(stderr, "<size> cannot be 0\n");
 					return true;
@@ -840,7 +840,7 @@ void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
 		}
 		break;
 	case OptSetPriority:
-		prio = static_cast<enum v4l2_priority>(strtoul(optarg, 0L, 0));
+		prio = static_cast<enum v4l2_priority>(std::strtoul(optarg, 0L, 0));
 		break;
 	case OptListDevices:
 		if (media_bus_info.empty())
@@ -952,19 +952,19 @@ void common_set(cv4l_fd &_fd)
 
 				switch (qc.type) {
 				case V4L2_CTRL_TYPE_U8:
-					v = strtoul(iter->second.c_str(), NULL, 0);
+					v = std::strtoul(iter->second.c_str(), NULL, 0);
 					for (i = 0; i < qc.elems; i++)
 						if (idx_in_subset(qc, subset, divide, i))
 							ctrl.p_u8[i] = v;
 					break;
 				case V4L2_CTRL_TYPE_U16:
-					v = strtoul(iter->second.c_str(), NULL, 0);
+					v = std::strtoul(iter->second.c_str(), NULL, 0);
 					for (i = 0; i < qc.elems; i++)
 						if (idx_in_subset(qc, subset, divide, i))
 							ctrl.p_u16[i] = v;
 					break;
 				case V4L2_CTRL_TYPE_U32:
-					v = strtoul(iter->second.c_str(), NULL, 0);
+					v = std::strtoul(iter->second.c_str(), NULL, 0);
 					for (i = 0; i < qc.elems; i++)
 						if (idx_in_subset(qc, subset, divide, i))
 							ctrl.p_u32[i] = v;
@@ -985,7 +985,7 @@ void common_set(cv4l_fd &_fd)
 			} else {
 				if (V4L2_CTRL_DRIVER_PRIV(ctrl.id))
 					use_ext_ctrls = true;
-				ctrl.value = strtol(iter->second.c_str(), NULL, 0);
+				ctrl.value = std::strtol(iter->second.c_str(), NULL, 0);
 			}
 			class2ctrls[V4L2_CTRL_ID2WHICH(ctrl.id)].push_back(ctrl);
 		}
diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
index 932d561f..3c09de7a 100644
--- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
@@ -266,7 +266,7 @@ static void read_edid_file(FILE *f, struct v4l2_edid *e)
 			value[1] = c;
 			if (i % 256 == 1)
 				edid_add_block(e);
-			e->edid[i / 2] = strtoul(value, 0, 16);
+			e->edid[i / 2] = std::strtoul(value, 0, 16);
 		} else {
 			value[0] = c;
 		}
@@ -712,7 +712,7 @@ static unsigned short parse_phys_addr(const char *value)
 	unsigned p1, p2, p3, p4;
 
 	if (!std::strchr(value, '.'))
-		return strtoul(value, NULL, 0);
+		return std::strtoul(value, NULL, 0);
 	if (sscanf(value, "%x.%x.%x.%x", &p1, &p2, &p3, &p4) != 4) {
 		fprintf(stderr, "Expected a physical address of the form x.x.x.x\n");
 		return 0xffff;
@@ -997,7 +997,7 @@ void edid_cmd(int ch, char *optarg)
 			}
 			switch (opt) {
 			case 0:
-				sedid.pad = strtoul(value, 0, 0);
+				sedid.pad = std::strtoul(value, 0, 0);
 				break;
 			case 1:
 			case 2:	/* keep edid for compat reasons, it's the same as type */
@@ -1052,13 +1052,13 @@ void edid_cmd(int ch, char *optarg)
 					phys_addr = parse_phys_addr(value);
 				break;
 			case 6:
-				mod_s_pt = strtoul(value, 0, 0) & 3;
+				mod_s_pt = std::strtoul(value, 0, 0) & 3;
 				break;
 			case 7:
-				mod_s_it = strtoul(value, 0, 0) & 3;
+				mod_s_it = std::strtoul(value, 0, 0) & 3;
 				break;
 			case 8:
-				mod_s_ce = strtoul(value, 0, 0) & 3;
+				mod_s_ce = std::strtoul(value, 0, 0) & 3;
 				break;
 			case 9: toggle_hdmi_vsdb_dc_flags |= HDMI_VSDB_Y444_BIT; break;
 			case 10: toggle_hdmi_vsdb_dc_flags |= HDMI_VSDB_30_BIT; break;
@@ -1117,7 +1117,7 @@ void edid_cmd(int ch, char *optarg)
 
 	case OptClearEdid:
 		if (optarg)
-			clear_pad = strtoul(optarg, 0, 0);
+			clear_pad = std::strtoul(optarg, 0, 0);
 		break;
 
 	case OptGetEdid:
@@ -1140,17 +1140,17 @@ void edid_cmd(int ch, char *optarg)
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				gedid.pad = strtoul(value, 0, 0);
+				gedid.pad = std::strtoul(value, 0, 0);
 				break;
 			case 1:
-				gedid.start_block = strtoul(value, 0, 0);
+				gedid.start_block = std::strtoul(value, 0, 0);
 				if (gedid.start_block > 255) {
 					fprintf(stderr, "startblock %d too large, max 255\n", gedid.start_block);
 					std::exit(EXIT_FAILURE);
 				}
 				break;
 			case 2:
-				gedid.blocks = strtoul(value, 0, 0);
+				gedid.blocks = std::strtoul(value, 0, 0);
 				break;
 			case 3:
 				if (!strcmp(value, "hex")) {
@@ -1180,7 +1180,7 @@ void edid_cmd(int ch, char *optarg)
 	case OptInfoEdid:
 		memset(&info_edid, 0, sizeof(info_edid));
 		if (optarg)
-			info_edid.pad = strtoul(optarg, 0, 0);
+			info_edid.pad = std::strtoul(optarg, 0, 0);
 		break;
 	}
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl-io.cpp b/utils/v4l2-ctl/v4l2-ctl-io.cpp
index 9e83c03a..8b6650a4 100644
--- a/utils/v4l2-ctl/v4l2-ctl-io.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-io.cpp
@@ -79,16 +79,16 @@ void io_cmd(int ch, char *optarg)
 {
 	switch (ch) {
 		case OptSetInput:
-			input = strtol(optarg, 0L, 0);
+			input = std::strtol(optarg, 0L, 0);
 			break;
 		case OptSetOutput:
-			output = strtol(optarg, 0L, 0);
+			output = std::strtol(optarg, 0L, 0);
 			break;
 		case OptSetAudioInput:
-			vaudio.index = strtol(optarg, 0L, 0);
+			vaudio.index = std::strtol(optarg, 0L, 0);
 			break;
 		case OptSetAudioOutput:
-			vaudout.index = strtol(optarg, 0L, 0);
+			vaudout.index = std::strtol(optarg, 0L, 0);
 			break;
 	}
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index 2561b029..baf405e8 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -54,7 +54,7 @@ void meta_cmd(int ch, char *optarg)
 			vfmt.fmt.meta.dataformat = v4l2_fourcc(optarg[0],
 					optarg[1], optarg[2], optarg[3]);
 		} else {
-			vfmt.fmt.meta.dataformat = strtol(optarg, 0L, 0);
+			vfmt.fmt.meta.dataformat = std::strtol(optarg, 0L, 0);
 		}
 		break;
 	}
diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
index 6db87568..365a03ef 100644
--- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
@@ -186,10 +186,10 @@ void misc_cmd(int ch, char *optarg)
 
 	switch (ch) {
 	case OptSetParm:
-		fps = strtod(optarg, NULL);
+		fps = std::strtod(optarg, NULL);
 		break;
 	case OptSetOutputParm:
-		output_fps = strtod(optarg, NULL);
+		output_fps = std::strtod(optarg, NULL);
 		break;
 	case OptSetJpegComp:
 		subs = optarg;
@@ -209,7 +209,7 @@ void misc_cmd(int ch, char *optarg)
 
 			switch (opt) {
 			case 16:
-				jpegcomp.quality = strtol(value, 0L, 0);
+				jpegcomp.quality = std::strtol(value, 0L, 0);
 				break;
 			case 17:
 				if (strstr(value, "dht"))
@@ -294,7 +294,7 @@ void misc_cmd(int ch, char *optarg)
 				dec_cmd.stop.pts = strtoull(value, 0, 0);
 				break;
 			case 3:
-				dec_cmd.start.speed = strtol(value, 0, 0);
+				dec_cmd.start.speed = std::strtol(value, 0, 0);
 				break;
 			case 4:
 				if (!strcmp(value, "gop"))
diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index 16344a15..0c67a916 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -239,27 +239,27 @@ void overlay_cmd(int ch, char *optarg)
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				overlay_fmt.fmt.win.chromakey = strtoul(value, 0L, 0);
+				overlay_fmt.fmt.win.chromakey = std::strtoul(value, 0L, 0);
 				set_overlay_fmt |= FmtChromaKey;
 				break;
 			case 1:
-				overlay_fmt.fmt.win.global_alpha = strtoul(value, 0L, 0);
+				overlay_fmt.fmt.win.global_alpha = std::strtoul(value, 0L, 0);
 				set_overlay_fmt |= FmtGlobalAlpha;
 				break;
 			case 2:
-				overlay_fmt.fmt.win.w.left = strtol(value, 0L, 0);
+				overlay_fmt.fmt.win.w.left = std::strtol(value, 0L, 0);
 				set_overlay_fmt |= FmtLeft;
 				break;
 			case 3:
-				overlay_fmt.fmt.win.w.top = strtol(value, 0L, 0);
+				overlay_fmt.fmt.win.w.top = std::strtol(value, 0L, 0);
 				set_overlay_fmt |= FmtTop;
 				break;
 			case 4:
-				overlay_fmt.fmt.win.w.width = strtoul(value, 0L, 0);
+				overlay_fmt.fmt.win.w.width = std::strtoul(value, 0L, 0);
 				set_overlay_fmt |= FmtWidth;
 				break;
 			case 5:
-				overlay_fmt.fmt.win.w.height = strtoul(value, 0L, 0);
+				overlay_fmt.fmt.win.w.height = std::strtoul(value, 0L, 0);
 				set_overlay_fmt |= FmtHeight;
 				break;
 			case 6:
@@ -287,16 +287,16 @@ void overlay_cmd(int ch, char *optarg)
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				r.left = strtoul(value, 0L, 0);
+				r.left = std::strtoul(value, 0L, 0);
 				break;
 			case 1:
-				r.top = strtoul(value, 0L, 0);
+				r.top = std::strtoul(value, 0L, 0);
 				break;
 			case 2:
-				r.width = strtoul(value, 0L, 0);
+				r.width = std::strtoul(value, 0L, 0);
 				break;
 			case 3:
-				r.height = strtoul(value, 0L, 0);
+				r.height = std::strtoul(value, 0L, 0);
 				break;
 			default:
 				overlay_usage();
@@ -338,27 +338,27 @@ void overlay_cmd(int ch, char *optarg)
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
 				fbuf.flags &= ~chroma_flags;
-				fbuf.flags |= strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_CHROMAKEY : 0;
+				fbuf.flags |= std::strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_CHROMAKEY : 0;
 				set_fbuf |= chroma_flags;
 				break;
 			case 1:
 				fbuf.flags &= ~chroma_flags;
-				fbuf.flags |= strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_SRC_CHROMAKEY : 0;
+				fbuf.flags |= std::strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_SRC_CHROMAKEY : 0;
 				set_fbuf |= chroma_flags;
 				break;
 			case 2:
 				fbuf.flags &= ~alpha_flags;
-				fbuf.flags |= strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_GLOBAL_ALPHA : 0;
+				fbuf.flags |= std::strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_GLOBAL_ALPHA : 0;
 				set_fbuf |= alpha_flags;
 				break;
 			case 3:
 				fbuf.flags &= ~alpha_flags;
-				fbuf.flags |= strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_LOCAL_ALPHA : 0;
+				fbuf.flags |= std::strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_LOCAL_ALPHA : 0;
 				set_fbuf |= alpha_flags;
 				break;
 			case 4:
 				fbuf.flags &= ~alpha_flags;
-				fbuf.flags |= strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_LOCAL_INV_ALPHA : 0;
+				fbuf.flags |= std::strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_LOCAL_INV_ALPHA : 0;
 				set_fbuf |= alpha_flags;
 				break;
 			case 5:
@@ -377,7 +377,7 @@ void overlay_cmd(int ch, char *optarg)
 		}
 		break;
 	case OptOverlay:
-		overlay = strtol(optarg, 0L, 0);
+		overlay = std::strtol(optarg, 0L, 0);
 		break;
 	}
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
index 62b26f0c..5101f66c 100644
--- a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
@@ -57,7 +57,7 @@ void sdr_cmd(int ch, char *optarg)
 			vfmt.fmt.sdr.pixelformat = v4l2_fourcc(optarg[0],
 					optarg[1], optarg[2], optarg[3]);
 		} else {
-			vfmt.fmt.sdr.pixelformat = strtol(optarg, 0L, 0);
+			vfmt.fmt.sdr.pixelformat = std::strtol(optarg, 0L, 0);
 		}
 		break;
 	}
diff --git a/utils/v4l2-ctl/v4l2-ctl-selection.cpp b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
index be62eb03..017ac0bf 100644
--- a/utils/v4l2-ctl/v4l2-ctl-selection.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
@@ -119,19 +119,19 @@ static void parse_crop(char *optarg, unsigned int &set_crop, v4l2_rect &vcrop)
 
 		switch (parse_subopt(&subs, subopts, &value)) {
 		case 0:
-			vcrop.left = strtol(value, 0L, 0);
+			vcrop.left = std::strtol(value, 0L, 0);
 			set_crop |= CropLeft;
 			break;
 		case 1:
-			vcrop.top = strtol(value, 0L, 0);
+			vcrop.top = std::strtol(value, 0L, 0);
 			set_crop |= CropTop;
 			break;
 		case 2:
-			vcrop.width = strtol(value, 0L, 0);
+			vcrop.width = std::strtol(value, 0L, 0);
 			set_crop |= CropWidth;
 			break;
 		case 3:
-			vcrop.height = strtol(value, 0L, 0);
+			vcrop.height = std::strtol(value, 0L, 0);
 			set_crop |= CropHeight;
 			break;
 		default:
@@ -192,19 +192,19 @@ static int parse_selection(char *optarg, unsigned int &set_sel, v4l2_selection &
 			set_sel |= SelectionFlags;
 			break;
 		case 2:
-			vsel.r.left = strtol(value, 0L, 0);
+			vsel.r.left = std::strtol(value, 0L, 0);
 			set_sel |= SelectionLeft;
 			break;
 		case 3:
-			vsel.r.top = strtol(value, 0L, 0);
+			vsel.r.top = std::strtol(value, 0L, 0);
 			set_sel |= SelectionTop;
 			break;
 		case 4:
-			vsel.r.width = strtoul(value, 0L, 0);
+			vsel.r.width = std::strtoul(value, 0L, 0);
 			set_sel |= SelectionWidth;
 			break;
 		case 5:
-			vsel.r.height = strtoul(value, 0L, 0);
+			vsel.r.height = std::strtoul(value, 0L, 0);
 			set_sel |= SelectionHeight;
 			break;
 		default:
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 59783ff3..0a2b2205 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -652,13 +652,13 @@ void streaming_cmd(int ch, char *optarg)
 
 	switch (ch) {
 	case OptStreamCount:
-		stream_count = strtoul(optarg, 0L, 0);
+		stream_count = std::strtoul(optarg, 0L, 0);
 		break;
 	case OptStreamSkip:
-		stream_skip = strtoul(optarg, 0L, 0);
+		stream_skip = std::strtoul(optarg, 0L, 0);
 		break;
 	case OptStreamSleep:
-		stream_sleep = strtol(optarg, 0L, 0);
+		stream_sleep = std::strtol(optarg, 0L, 0);
 		break;
 	case OptStreamNoQuery:
 		stream_no_query = true;
@@ -667,7 +667,7 @@ void streaming_cmd(int ch, char *optarg)
 		stream_loop = true;
 		break;
 	case OptStreamOutPattern:
-		stream_pat = strtoul(optarg, 0L, 0);
+		stream_pat = std::strtoul(optarg, 0L, 0);
 		for (i = 0; tpg_pattern_strings[i]; i++) ;
 		if (stream_pat >= i)
 			stream_pat = 0;
@@ -707,7 +707,7 @@ void streaming_cmd(int ch, char *optarg)
 			streaming_usage();
 		break;
 	case OptStreamOutAlphaComponent:
-		stream_out_alpha = strtoul(optarg, 0L, 0);
+		stream_out_alpha = std::strtoul(optarg, 0L, 0);
 		break;
 	case OptStreamOutAlphaRedOnly:
 		stream_out_alpha_red_only = true;
@@ -717,7 +717,7 @@ void streaming_cmd(int ch, char *optarg)
 		break;
 	case OptStreamOutHorSpeed:
 	case OptStreamOutVertSpeed:
-		speed = strtol(optarg, 0L, 0);
+		speed = std::strtol(optarg, 0L, 0);
 		if (speed < -3)
 			speed = -3;
 		if (speed > 3)
@@ -728,7 +728,7 @@ void streaming_cmd(int ch, char *optarg)
 			stream_out_vert_mode = static_cast<tpg_move_mode>(speed + 3);
 		break;
 	case OptStreamOutPercFill:
-		stream_out_perc_fill = strtoul(optarg, 0L, 0);
+		stream_out_perc_fill = std::strtoul(optarg, 0L, 0);
 		if (stream_out_perc_fill > 100)
 			stream_out_perc_fill = 100;
 		if (stream_out_perc_fill < 1)
@@ -768,7 +768,7 @@ void streaming_cmd(int ch, char *optarg)
 		fallthrough;
 	case OptStreamMmap:
 		if (optarg) {
-			reqbufs_count_cap = strtoul(optarg, 0L, 0);
+			reqbufs_count_cap = std::strtoul(optarg, 0L, 0);
 			if (reqbufs_count_cap == 0)
 				reqbufs_count_cap = 3;
 		}
@@ -781,7 +781,7 @@ void streaming_cmd(int ch, char *optarg)
 		fallthrough;
 	case OptStreamOutMmap:
 		if (optarg) {
-			reqbufs_count_out = strtoul(optarg, 0L, 0);
+			reqbufs_count_out = std::strtoul(optarg, 0L, 0);
 			if (reqbufs_count_out == 0)
 				reqbufs_count_out = 3;
 		}
@@ -1672,7 +1672,7 @@ static FILE *open_output_file(cv4l_fd &fd)
 
 	aspect = fd.g_pixel_aspect(width, height);
 	if (p) {
-		host_port_to = strtoul(p + 1, 0L, 0);
+		host_port_to = std::strtoul(p + 1, 0L, 0);
 		*p = '\0';
 	}
 	host_fd_to = socket(AF_INET, SOCK_STREAM, 0);
@@ -1932,7 +1932,7 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 	struct sockaddr_in serv_addr = {}, cli_addr;
 
 	if (p) {
-		host_port_from = strtoul(p + 1, 0L, 0);
+		host_port_from = std::strtoul(p + 1, 0L, 0);
 		*p = '\0';
 	}
 	listen_fd = socket(AF_INET, SOCK_STREAM, 0);
diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index 9e17a58d..d1699635 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -108,7 +108,7 @@ void subdev_cmd(int ch, char *optarg)
 	switch (ch) {
 	case OptListSubDevMBusCodes:
 		if (optarg)
-			list_mbus_codes_pad = strtoul(optarg, 0L, 0);
+			list_mbus_codes_pad = std::strtoul(optarg, 0L, 0);
 		break;
 	case OptListSubDevFrameSizes:
 		subs = optarg;
@@ -121,10 +121,10 @@ void subdev_cmd(int ch, char *optarg)
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				frmsize.pad = strtoul(value, 0L, 0);
+				frmsize.pad = std::strtoul(value, 0L, 0);
 				break;
 			case 1:
-				frmsize.code = strtoul(value, 0L, 0);
+				frmsize.code = std::strtoul(value, 0L, 0);
 				break;
 			default:
 				subdev_usage();
@@ -145,16 +145,16 @@ void subdev_cmd(int ch, char *optarg)
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				frmival.pad = strtoul(value, 0L, 0);
+				frmival.pad = std::strtoul(value, 0L, 0);
 				break;
 			case 1:
-				frmival.code = strtoul(value, 0L, 0);
+				frmival.code = std::strtoul(value, 0L, 0);
 				break;
 			case 2:
-				frmival.width = strtoul(value, 0L, 0);
+				frmival.width = std::strtoul(value, 0L, 0);
 				break;
 			case 3:
-				frmival.height = strtoul(value, 0L, 0);
+				frmival.height = std::strtoul(value, 0L, 0);
 				break;
 			default:
 				subdev_usage();
@@ -164,7 +164,7 @@ void subdev_cmd(int ch, char *optarg)
 		break;
 	case OptGetSubDevFormat:
 		if (optarg)
-			get_fmt_pad = strtoul(optarg, 0L, 0);
+			get_fmt_pad = std::strtoul(optarg, 0L, 0);
 		break;
 	case OptGetSubDevSelection:
 		subs = optarg;
@@ -178,7 +178,7 @@ void subdev_cmd(int ch, char *optarg)
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				get_sel_pad = strtoul(value, 0L, 0);
+				get_sel_pad = std::strtoul(value, 0L, 0);
 				break;
 			case 1:
 				if (parse_selection_target(value, target)) {
@@ -196,7 +196,7 @@ void subdev_cmd(int ch, char *optarg)
 		break;
 	case OptGetSubDevFPS:
 		if (optarg)
-			get_fps_pad = strtoul(optarg, 0L, 0);
+			get_fps_pad = std::strtoul(optarg, 0L, 0);
 		break;
 	case OptSetSubDevFormat:
 	case OptTrySubDevFormat:
@@ -219,15 +219,15 @@ void subdev_cmd(int ch, char *optarg)
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				ffmt.width = strtoul(value, 0L, 0);
+				ffmt.width = std::strtoul(value, 0L, 0);
 				set_fmt |= FmtWidth;
 				break;
 			case 1:
-				ffmt.height = strtoul(value, 0L, 0);
+				ffmt.height = std::strtoul(value, 0L, 0);
 				set_fmt |= FmtHeight;
 				break;
 			case 2:
-				ffmt.code = strtoul(value, 0L, 0);
+				ffmt.code = std::strtoul(value, 0L, 0);
 				set_fmt |= FmtPixelFormat;
 				break;
 			case 3:
@@ -258,7 +258,7 @@ void subdev_cmd(int ch, char *optarg)
 				set_fmt |= FmtXferFunc;
 				break;
 			case 9:
-				set_fmt_pad = strtoul(value, 0L, 0);
+				set_fmt_pad = std::strtoul(value, 0L, 0);
 				break;
 			default:
 				fprintf(stderr, "Unknown option\n");
@@ -296,23 +296,23 @@ void subdev_cmd(int ch, char *optarg)
 				set_selection |= SelectionFlags;
 				break;
 			case 2:
-				vsel.r.left = strtol(value, 0L, 0);
+				vsel.r.left = std::strtol(value, 0L, 0);
 				set_selection |= SelectionLeft;
 				break;
 			case 3:
-				vsel.r.top = strtol(value, 0L, 0);
+				vsel.r.top = std::strtol(value, 0L, 0);
 				set_selection |= SelectionTop;
 				break;
 			case 4:
-				vsel.r.width = strtoul(value, 0L, 0);
+				vsel.r.width = std::strtoul(value, 0L, 0);
 				set_selection |= SelectionWidth;
 				break;
 			case 5:
-				vsel.r.height = strtoul(value, 0L, 0);
+				vsel.r.height = std::strtoul(value, 0L, 0);
 				set_selection |= SelectionHeight;
 				break;
 			case 6:
-				vsel.pad = strtoul(value, 0L, 0);
+				vsel.pad = std::strtoul(value, 0L, 0);
 				break;
 			default:
 				fprintf(stderr, "Unknown option\n");
@@ -333,10 +333,10 @@ void subdev_cmd(int ch, char *optarg)
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				set_fps_pad = strtoul(value, 0L, 0);
+				set_fps_pad = std::strtoul(value, 0L, 0);
 				break;
 			case 1:
-				set_fps = strtod(value, NULL);
+				set_fps = std::strtod(value, NULL);
 				break;
 			default:
 				fprintf(stderr, "Unknown option\n");
diff --git a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
index 981b8765..cf2fd8af 100644
--- a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
@@ -182,19 +182,19 @@ static void parse_freq_seek(char *optarg, struct v4l2_hw_freq_seek &seek)
 
 		switch (parse_subopt(&subs, subopts, &value)) {
 		case 0:
-			seek.seek_upward = strtol(value, 0L, 0);
+			seek.seek_upward = std::strtol(value, 0L, 0);
 			break;
 		case 1:
-			seek.wrap_around = strtol(value, 0L, 0);
+			seek.wrap_around = std::strtol(value, 0L, 0);
 			break;
 		case 2:
-			seek.spacing = strtol(value, 0L, 0);
+			seek.spacing = std::strtol(value, 0L, 0);
 			break;
 		case 3:
-			low = strtod(value, NULL);
+			low = std::strtod(value, NULL);
 			break;
 		case 4:
-			high = strtod(value, NULL);
+			high = std::strtod(value, NULL);
 			break;
 		default:
 			tuner_usage();
@@ -207,7 +207,7 @@ void tuner_cmd(int ch, char *optarg)
 {
 	switch (ch) {
 	case OptSetFreq:
-		freq = strtod(optarg, NULL);
+		freq = std::strtod(optarg, NULL);
 		break;
 	case OptSetTuner:
 		if (!strcmp(optarg, "stereo"))
@@ -227,7 +227,7 @@ void tuner_cmd(int ch, char *optarg)
 		}
 		break;
 	case OptSetModulator:
-		txsubchans = strtol(optarg, 0L, 0);
+		txsubchans = std::strtol(optarg, 0L, 0);
 		if (!strcmp(optarg, "stereo"))
 			txsubchans = V4L2_TUNER_SUB_STEREO;
 		else if (!strcmp(optarg, "stereo-sap"))
@@ -252,7 +252,7 @@ void tuner_cmd(int ch, char *optarg)
 		parse_freq_seek(optarg, freq_seek);
 		break;
 	case OptTunerIndex:
-		tuner_index = strtoul(optarg, NULL, 0);
+		tuner_index = std::strtoul(optarg, NULL, 0);
 		break;
 	}
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
index ee55012f..e6795ac2 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
@@ -151,25 +151,25 @@ void vbi_cmd(int ch, char *optarg)
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				raw->fmt.vbi.sampling_rate = strtoul(value, NULL, 0);
+				raw->fmt.vbi.sampling_rate = std::strtoul(value, NULL, 0);
 				break;
 			case 1:
-				raw->fmt.vbi.offset = strtoul(value, NULL, 0);
+				raw->fmt.vbi.offset = std::strtoul(value, NULL, 0);
 				break;
 			case 2:
-				raw->fmt.vbi.samples_per_line = strtoul(value, NULL, 0);
+				raw->fmt.vbi.samples_per_line = std::strtoul(value, NULL, 0);
 				break;
 			case 3:
-				raw->fmt.vbi.start[0] = strtoul(value, NULL, 0);
+				raw->fmt.vbi.start[0] = std::strtoul(value, NULL, 0);
 				break;
 			case 4:
-				raw->fmt.vbi.start[1] = strtoul(value, NULL, 0);
+				raw->fmt.vbi.start[1] = std::strtoul(value, NULL, 0);
 				break;
 			case 5:
-				raw->fmt.vbi.count[0] = strtoul(value, NULL, 0);
+				raw->fmt.vbi.count[0] = std::strtoul(value, NULL, 0);
 				break;
 			case 6:
-				raw->fmt.vbi.count[1] = strtoul(value, NULL, 0);
+				raw->fmt.vbi.count[1] = std::strtoul(value, NULL, 0);
 				break;
 			default:
 				vbi_usage();
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 730cbf38..a185e33b 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -124,7 +124,7 @@ void vidcap_cmd(int ch, char *optarg)
 			if (be_pixfmt)
 				frmsize.pixel_format |= 1U << 31;
 		} else if (std::isdigit(optarg[0])) {
-			frmsize.pixel_format = strtol(optarg, 0L, 0);
+			frmsize.pixel_format = std::strtol(optarg, 0L, 0);
 		} else {
 			fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
 			std::exit(EXIT_FAILURE);
@@ -142,10 +142,10 @@ void vidcap_cmd(int ch, char *optarg)
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				frmival.width = strtol(value, 0L, 0);
+				frmival.width = std::strtol(value, 0L, 0);
 				break;
 			case 1:
-				frmival.height = strtol(value, 0L, 0);
+				frmival.height = std::strtol(value, 0L, 0);
 				break;
 			case 2:
 				be_pixfmt = strlen(value) == 7 && !memcmp(value + 4, "-BE", 3);
@@ -156,7 +156,7 @@ void vidcap_cmd(int ch, char *optarg)
 					if (be_pixfmt)
 						frmival.pixel_format |= 1U << 31;
 				} else if (std::isdigit(optarg[0])) {
-					frmival.pixel_format = strtol(value, 0L, 0);
+					frmival.pixel_format = std::strtol(value, 0L, 0);
 				} else {
 					fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
 					std::exit(EXIT_FAILURE);
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 0f6aacb0..844c1af9 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -776,11 +776,11 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 
 		switch (parse_subopt(&subs, subopts, &value)) {
 		case 0:
-			width = strtoul(value, 0L, 0);
+			width = std::strtoul(value, 0L, 0);
 			fmts |= FmtWidth;
 			break;
 		case 1:
-			height = strtoul(value, 0L, 0);
+			height = std::strtoul(value, 0L, 0);
 			fmts |= FmtHeight;
 			break;
 		case 2:
@@ -792,7 +792,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 				if (be_pixfmt)
 					pixelformat |= 1U << 31;
 			} else if (std::isdigit(value[0])) {
-				pixelformat = strtol(value, 0L, 0);
+				pixelformat = std::strtol(value, 0L, 0);
 			} else {
 				fprintf(stderr, "The pixelformat '%s' is invalid\n", value);
 				std::exit(EXIT_FAILURE);
@@ -819,7 +819,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 			fmts |= FmtYCbCr;
 			break;
 		case 7:
-			bytesperline[bpl_index] = strtoul(value, 0L, 0);
+			bytesperline[bpl_index] = std::strtoul(value, 0L, 0);
 			if (bytesperline[bpl_index] > 0xffff) {
 				fprintf(stderr, "bytesperline can't be more than 65535\n");
 				bytesperline[bpl_index] = 0;
@@ -840,7 +840,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 			fmts |= FmtXferFunc;
 			break;
 		case 11:
-			sizeimage[sizeimage_index] = strtoul(value, 0L, 0);
+			sizeimage[sizeimage_index] = std::strtoul(value, 0L, 0);
 			sizeimage_index++;
 			fmts |= FmtSizeImage;
 			break;
@@ -927,7 +927,7 @@ static __u32 parse_event(const char *e, const char **name)
 
 	*name = "0";
 	if (std::isdigit(e[0])) {
-		event = strtoul(e, 0L, 0);
+		event = std::strtoul(e, 0L, 0);
 		if (event == V4L2_EVENT_CTRL) {
 			fprintf(stderr, "Missing control name for ctrl event, use ctrl=<name>\n");
 			misc_usage();
@@ -1062,7 +1062,7 @@ static const char *make_devname(const char *device, const char *devname,
 		goto err;
 
 	if (device[0] == '0' && device[1] == 'x')
-		iface_id = strtoul(device, NULL, 16);
+		iface_id = std::strtoul(device, NULL, 16);
 
 	if (!iface_id) {
 		for (i = 0; i < topology.num_entities; i++)
@@ -1244,7 +1244,7 @@ int main(int argc, char **argv)
 				return 1;
 			break;
 		case OptSleep:
-			secs = strtoul(optarg, 0L, 0);
+			secs = std::strtoul(optarg, 0L, 0);
 			break;
 		case ':':
 			fprintf(stderr, "Option '%s' requires a value\n",
@@ -1509,7 +1509,7 @@ int main(int argc, char **argv)
 		if (wait_for_event == V4L2_EVENT_CTRL)
 			sub.id = common_find_ctrl_id(wait_event_id);
 		else if (wait_for_event == V4L2_EVENT_SOURCE_CHANGE)
-			sub.id = strtoul(wait_event_id, 0L, 0);
+			sub.id = std::strtoul(wait_event_id, 0L, 0);
 		if (!doioctl(fd, VIDIOC_SUBSCRIBE_EVENT, &sub))
 			if (!doioctl(fd, VIDIOC_DQEVENT, &ev))
 				print_event(&ev);
@@ -1525,7 +1525,7 @@ int main(int argc, char **argv)
 		if (poll_for_event == V4L2_EVENT_CTRL)
 			sub.id = common_find_ctrl_id(poll_event_id);
 		else if (poll_for_event == V4L2_EVENT_SOURCE_CHANGE)
-			sub.id = strtoul(poll_event_id, 0L, 0);
+			sub.id = std::strtoul(poll_event_id, 0L, 0);
 		if (!doioctl(fd, VIDIOC_SUBSCRIBE_EVENT, &sub)) {
 			fd_set fds;
 			__u32 seq = 0;
@@ -1566,7 +1566,7 @@ int main(int argc, char **argv)
 		if (epoll_for_event == V4L2_EVENT_CTRL)
 			sub.id = common_find_ctrl_id(epoll_event_id);
 		else if (epoll_for_event == V4L2_EVENT_SOURCE_CHANGE)
-			sub.id = strtoul(epoll_event_id, 0L, 0);
+			sub.id = std::strtoul(epoll_event_id, 0L, 0);
 		if (!doioctl(fd, VIDIOC_SUBSCRIBE_EVENT, &sub)) {
 			__u32 seq = 0;
 
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 7b53f1ee..04ec6475 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -481,12 +481,12 @@ int main(int argc, char **argv)
 		case OptChip:
 			if (!memcmp(optarg, "subdev", 6) && std::isdigit(optarg[6])) {
 				match.type = V4L2_CHIP_MATCH_SUBDEV;
-				match.addr = strtoul(optarg + 6, NULL, 0);
+				match.addr = std::strtoul(optarg + 6, NULL, 0);
 				break;
 			}
 			if (!memcmp(optarg, "bridge", 6)) {
 				match.type = V4L2_CHIP_MATCH_BRIDGE;
-				match.addr = strtoul(optarg + 6, NULL, 0);
+				match.addr = std::strtoul(optarg + 6, NULL, 0);
 				break;
 			}
 			match.type = V4L2_CHIP_MATCH_BRIDGE;
-- 
2.25.3

