Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C56922E44C
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 05:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgG0DPD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 23:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbgG0DPB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 23:15:01 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ECAFC0619D2
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:15:01 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id lw1so620626pjb.1
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KujugZSclNu7zCqwMMloR8+u687o8G2Gv9VuEx8lS94=;
        b=ZuW5bZkZqE5ijieBA8zPVZzUcOcfxNKYl9U8Y3EQLrEWSp/txcLFZ1hmvI4wq9b7Rm
         ohMjr5Nud2zEw2JCsko598OFtChLCn64qAFeFsxqHqMPR/ncNj9CQ5BssBP2j4sK7ksD
         aMs3xMLb/anjpeK8pHVqrcObkhP92KFM1/RLMHJ0zVRdIVXtXUgadxlfP519VUUYL/RI
         KOtaxM79aO72IBvuG7QoSdXQrMK/XpmKNNP17V39OTWY+tfp+lGZoJ+Q833t/M5SKn3m
         GGArgTNwr58atJtErx8CeKX5KYXF62jqpf0d5kyTefVpeBqBGT5Dse+5lqKYs7VyjQQK
         dYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KujugZSclNu7zCqwMMloR8+u687o8G2Gv9VuEx8lS94=;
        b=elkmeWt2Nd+lDw+kkXsIWlxQCae/hMIny+mamHN0QFxqysnJw2X79DCkI1HGk/c8Iu
         dIsHguPty7y3nIiLwny08rn41Bn0kiBzxlhA/TBvRWDvNa/Mqvk8bMK1JQxIboqfX7aV
         8eQevSk6JfDS/STb14YRibGIT9sLURhMDRk8vvtAkUU/WGrIh8hu045F7ltfykPQCXp0
         igFKHao923/DckUnZDbHorBn/kyWoc+1ra1eZIP8VgHg+K2Q+cTzSbV+UDDcJavHrX+K
         jmt2dxrSxz5aAQcVZ5ek9QrESNOYkrKiaN0VDmLPg2jVT86NL38j90w7L4uI29CdEDs4
         l6cQ==
X-Gm-Message-State: AOAM530MuVui4HoTPJekixRzxARdCl97LvwZl7C48RQXK7py6xkCLD3i
        eJv4RWB3zoyvYixE8naWsamx6wxlZUQ=
X-Google-Smtp-Source: ABdhPJwB8eHdmMQ6rJkBJTeKEbYs4z6LuhpOk/otwzWPSDBxgfMrMBCP0jYvhkEgE2Pb6q/Hva1NGQ==
X-Received: by 2002:a17:902:9009:: with SMTP id a9mr16112970plp.252.1595819699784;
        Sun, 26 Jul 2020 20:14:59 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id t126sm13259345pfd.214.2020.07.26.20.14.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 20:14:59 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/8] [clang-tidy] convert to range based loops
Date:   Sun, 26 Jul 2020 20:14:50 -0700
Message-Id: <20200727031456.232955-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200727031456.232955-1-rosenp@gmail.com>
References: <20200727031456.232955-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with modernize-loop-convert

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-test.cpp           | 57 ++++++------
 utils/cec-ctl/cec-ctl.cpp                   | 28 +++---
 utils/cec-follower/cec-follower.cpp         |  4 +-
 utils/cec-follower/cec-processing.cpp       | 12 +--
 utils/libcecutil/cec-info.cpp               | 24 +++--
 utils/libmedia_dev/get_media_devices.c      |  6 +-
 utils/rds-ctl/rds-ctl.cpp                   | 12 ++-
 utils/v4l2-compliance/v4l2-compliance.cpp   |  4 +-
 utils/v4l2-compliance/v4l2-test-buffers.cpp |  7 +-
 utils/v4l2-compliance/v4l2-test-formats.cpp | 14 +--
 utils/v4l2-compliance/v4l2-test-media.cpp   |  5 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp          | 97 ++++++++++-----------
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp         |  4 +-
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp       |  8 +-
 utils/v4l2-dbg/v4l2-dbg.cpp                 |  5 +-
 15 files changed, 132 insertions(+), 155 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index c24c6aa2..2b5265a3 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -922,15 +922,14 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 	printf("\t    Finished Channel Scan\n");
 
 	printf("\t    Start Channel Test\n");
-	for (std::vector<struct cec_op_tuner_device_info>::iterator iter = info_vec.begin();
-			iter != info_vec.end(); iter++) {
+	for (const auto &iter : info_vec) {
 		cec_msg_init(&msg, me, la);
-		log_tuner_service(*iter, "Select ");
-		if (iter->is_analog)
-			cec_msg_select_analogue_service(&msg, iter->analog.ana_bcast_type,
-				iter->analog.ana_freq, iter->analog.bcast_system);
+		log_tuner_service(iter, "Select ");
+		if (iter.is_analog)
+			cec_msg_select_analogue_service(&msg, iter.analog.ana_bcast_type,
+				iter.analog.ana_freq, iter.analog.bcast_system);
 		else
-			cec_msg_select_digital_service(&msg, &iter->digital);
+			cec_msg_select_digital_service(&msg, &iter.digital);
 		fail_on_test(!transmit(node, &msg));
 		fail_on_test(cec_msg_status_is_abort(&msg));
 		cec_msg_init(&msg, me, la);
@@ -939,11 +938,11 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 		fail_on_test(timed_out_or_abort(&msg));
 		memset(&info, 0, sizeof(info));
 		cec_ops_tuner_device_status(&msg, &info);
-		if (memcmp(&info, &(*iter), sizeof(info))) {
+		if (memcmp(&info, &iter, sizeof(info))) {
 			log_tuner_service(info);
-			log_tuner_service(*iter);
+			log_tuner_service(iter);
 		}
-		fail_on_test(memcmp(&info, &(*iter), sizeof(info)));
+		fail_on_test(memcmp(&info, &iter, sizeof(info)));
 	}
 	printf("\t    Finished Channel Test\n");
 
@@ -1500,15 +1499,15 @@ void collectTests()
 {
 	std::map<std::string, __u64> mapTestFuncs;
 
-	for (unsigned i = 0; i < num_tests; i++) {
-		for (unsigned j = 0; j < tests[i].num_subtests; j++) {
-			std::string name = safename(tests[i].subtests[j].name);
-			__u64 func = (__u64)tests[i].subtests[j].test_fn;
+	for (const auto &test : tests) {
+		for (unsigned j = 0; j < test.num_subtests; j++) {
+			std::string name = safename(test.subtests[j].name);
+			__u64 func = (__u64)test.subtests[j].test_fn;
 
 			if (mapTestFuncs.find(name) != mapTestFuncs.end() &&
 			    mapTestFuncs[name] != func) {
 				fprintf(stderr, "Duplicate subtest name, but different tests: %s\n",
-					tests[i].subtests[j].name);
+					test.subtests[j].name);
 				std::exit(EXIT_FAILURE);
 			}
 			mapTestFuncs[name] = func;
@@ -1520,10 +1519,10 @@ void collectTests()
 
 void listTests()
 {
-	for (unsigned i = 0; i < num_tests; i++) {
-		printf("%s:\n", tests[i].name);
-		for (unsigned j = 0; j < tests[i].num_subtests; j++) {
-			std::string name = safename(tests[i].subtests[j].name);
+	for (const auto &test : tests) {
+		printf("%s:\n", test.name);
+		for (unsigned j = 0; j < test.num_subtests; j++) {
+			std::string name = safename(test.subtests[j].name);
 
 			printf("\t%s\n", name.c_str());
 		}
@@ -1564,32 +1563,32 @@ void testRemote(struct node *node, unsigned me, unsigned la, unsigned test_tags,
 
 	int ret = 0;
 
-	for (unsigned i = 0; i < num_tests; i++) {
-		if ((tests[i].tags & test_tags) != tests[i].tags)
+	for (const auto &test : tests) {
+		if ((test.tags & test_tags) != test.tags)
 			continue;
 
-		printf("\t%s:\n", tests[i].name);
-		for (unsigned j = 0; j < tests[i].num_subtests; j++) {
-			const char *name = tests[i].subtests[j].name;
+		printf("\t%s:\n", test.name);
+		for (unsigned j = 0; j < test.num_subtests; j++) {
+			const char *name = test.subtests[j].name;
 
-			if (tests[i].subtests[j].for_cec20 &&
+			if (test.subtests[j].for_cec20 &&
 			    (node->remote[la].cec_version < CEC_OP_CEC_VERSION_2_0 ||
 			     !node->has_cec20))
 				continue;
 
-			if (tests[i].subtests[j].in_standby) {
+			if (test.subtests[j].in_standby) {
 				struct cec_log_addrs laddrs = { };
 				doioctl(node, CEC_ADAP_G_LOG_ADDRS, &laddrs);
 
 				if (!laddrs.log_addr_mask)
 					continue;
 			}
-			node->in_standby = tests[i].subtests[j].in_standby;
+			node->in_standby = test.subtests[j].in_standby;
 			mode_set_initiator(node);
 			unsigned old_warnings = warnings;
-			ret = tests[i].subtests[j].test_fn(node, me, la, interactive);
+			ret = test.subtests[j].test_fn(node, me, la, interactive);
 			bool has_warnings = old_warnings < warnings;
-			if (!(tests[i].subtests[j].la_mask & (1 << la)) && !ret)
+			if (!(test.subtests[j].la_mask & (1 << la)) && !ret)
 				ret = OK_UNEXPECTED;
 
 			if (mapTests[safename(name)] != DONT_CARE) {
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 47867f87..1fa7ba15 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -706,9 +706,9 @@ static int showTopology(struct node *node)
 		return 0;
 
 	printf("\n\tTopology:\n\n");
-	for (unsigned i = 0; i < 16; i++) {
-		__u16 pa = pas[i] >> 8;
-		__u8 la = pas[i] & 0xf;
+	for (unsigned int i : pas) {
+		__u16 pa = i >> 8;
+		__u8 la = i & 0xf;
 
 		if (pa == 0xffff)
 			break;
@@ -1804,9 +1804,8 @@ static void list_devices()
 
 	std::sort(files.begin(), files.end(), sort_on_device_name);
 
-	for (dev_vec::iterator iter = files.begin();
-			iter != files.end(); ++iter) {
-		int fd = open(iter->c_str(), O_RDWR);
+	for (const auto &file : files) {
+		int fd = open(file.c_str(), O_RDWR);
 		std::string cec_info;
 
 		if (fd < 0)
@@ -1818,14 +1817,13 @@ static void list_devices()
 		cec_info = std::string(caps.driver) + " (" + caps.name + ")";
 		if (cards[cec_info].empty())
 			cards[cec_info] += cec_info + ":\n";
-		cards[cec_info] += "\t" + (*iter);
-		if (!(links[*iter].empty()))
-			cards[cec_info] += " <- " + links[*iter];
+		cards[cec_info] += "\t" + file;
+		if (!(links[file].empty()))
+			cards[cec_info] += " <- " + links[file];
 		cards[cec_info] += "\n";
 	}
-	for (dev_map::iterator iter = cards.begin();
-			iter != cards.end(); ++iter) {
-		printf("%s\n", iter->second.c_str());
+	for (const auto &card : cards) {
+		printf("%s\n", card.second.c_str());
 	}
 }
 
@@ -2619,10 +2617,8 @@ int main(int argc, char **argv)
 	if (options[OptNonBlocking])
 		fcntl(node.fd, F_SETFL, fcntl(node.fd, F_GETFL) | O_NONBLOCK);
 
-	for (msg_vec::iterator iter = msgs.begin(); iter != msgs.end(); ++iter) {
-		struct cec_msg msg = *iter;
-
-		fflush(stdout);
+	for (auto &msg : msgs) {
+			fflush(stdout);
 		if (!cec_msg_is_broadcast(&msg) && !options[OptTo]) {
 			fprintf(stderr, "attempting to send message without --to\n");
 			std::exit(EXIT_FAILURE);
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index b31b51d3..9acdb305 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -500,9 +500,7 @@ int main(int argc, char **argv)
 	if (laddrs.cec_version >= CEC_OP_CEC_VERSION_2_0) {
 		bool is_dev_feat = false;
 
-		for (unsigned idx = 0; idx < sizeof(laddrs.features[0]); idx++) {
-			__u8 byte = laddrs.features[0][idx];
-
+		for (__u8 byte : laddrs.features[0]) {
 			if (is_dev_feat) {
 				node.source_has_arc_rx = (byte & CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX) != 0;
 				node.sink_has_arc_tx = (byte & CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX) != 0;
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index bc8c9c09..b3316753 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -763,14 +763,14 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		format_list.erase(format_list.end() - 1);
 		dev_info("Requested descriptors: %s\n", format_list.c_str());
 		for (unsigned i = 0; i < num_descriptors; i++) {
-			for (unsigned j = 0; j < ARRAY_SIZE(supported_formats); j++) {
+			for (const auto &supported_format : supported_formats) {
 				if (found_descs >= 4)
 					break;
 				if ((audio_format_id[i] == 0 &&
-				     audio_format_code[i] == supported_formats[j].format_code) ||
+				     audio_format_code[i] == supported_format.format_code) ||
 				    (audio_format_id[i] == 1 &&
-				     audio_format_code[i] == supported_formats[j].extension_type_code))
-					sad_encode(&supported_formats[j], &descriptors[found_descs++]);
+				     audio_format_code[i] == supported_format.extension_type_code))
+					sad_encode(&supported_format, &descriptors[found_descs++]);
 			}
 		}
 
@@ -844,8 +844,8 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 static void poll_remote_devs(struct node *node, unsigned me)
 {
 	node->remote_la_mask = 0;
-	for (unsigned i = 0; i < 15; i++)
-		node->remote_phys_addr[i] = CEC_PHYS_ADDR_INVALID;
+	for (unsigned short & i : node->remote_phys_addr)
+		i = CEC_PHYS_ADDR_INVALID;
 
 	if (!(node->caps & CEC_CAP_TRANSMIT))
 		return;
diff --git a/utils/libcecutil/cec-info.cpp b/utils/libcecutil/cec-info.cpp
index f6e60918..9a12e6a1 100644
--- a/utils/libcecutil/cec-info.cpp
+++ b/utils/libcecutil/cec-info.cpp
@@ -18,25 +18,25 @@
 
 const char *cec_opcode2s(unsigned opcode)
 {
-	for (unsigned i = 0; i < sizeof(msgtable) / sizeof(msgtable[0]); i++)
-		if (msgtable[i].opcode == opcode)
-			return msgtable[i].name;
+	for (auto i : msgtable)
+		if (i.opcode == opcode)
+			return i.name;
 	return NULL;
 }
 
 const char *cec_cdc_opcode2s(unsigned cdc_opcode)
 {
-	for (unsigned i = 0; i < sizeof(cdcmsgtable) / sizeof(cdcmsgtable[0]); i++)
-		if (cdcmsgtable[i].opcode == cdc_opcode)
-			return cdcmsgtable[i].name;
+	for (auto i : cdcmsgtable)
+		if (i.opcode == cdc_opcode)
+			return i.name;
 	return NULL;
 }
 
 const char *cec_htng_opcode2s(unsigned htng_opcode)
 {
-	for (unsigned i = 0; i < sizeof(htngmsgtable) / sizeof(htngmsgtable[0]); i++)
-		if (htngmsgtable[i].opcode == htng_opcode)
-			return htngmsgtable[i].name;
+	for (auto i : htngmsgtable)
+		if (i.opcode == htng_opcode)
+			return i.name;
 	return NULL;
 }
 
@@ -443,10 +443,8 @@ void cec_driver_info(const struct cec_caps &caps,
 		       cec_all_dev_types2s(laddrs.all_device_types[i]).c_str());
 
 		bool is_dev_feat = false;
-		for (unsigned idx = 0; idx < sizeof(laddrs.features[0]); idx++) {
-			__u8 byte = laddrs.features[i][idx];
-
-			if (!is_dev_feat) {
+		for (__u8 byte : laddrs.features[i]) {
+				if (!is_dev_feat) {
 				if (byte & 0x40) {
 					printf("\t    RC Source Profile      :\n%s",
 					       cec_rc_src_prof2s(byte, "").c_str());
diff --git a/utils/libmedia_dev/get_media_devices.c b/utils/libmedia_dev/get_media_devices.c
index 491a94da..21920867 100644
--- a/utils/libmedia_dev/get_media_devices.c
+++ b/utils/libmedia_dev/get_media_devices.c
@@ -230,7 +230,7 @@ static int add_v4l_class(struct media_device_entry *md)
 		md->type = MEDIA_V4L_SUBDEV;
 
 	return 0;
-};
+}
 
 static int add_snd_class(struct media_device_entry *md)
 {
@@ -274,7 +274,7 @@ static int add_snd_class(struct media_device_entry *md)
 	md->node = strdup(node);
 
 	return 0;
-};
+}
 
 static int add_dvb_class(struct media_device_entry *md)
 {
@@ -298,7 +298,7 @@ static int add_dvb_class(struct media_device_entry *md)
 		md->type = MEDIA_DVB_OSD;
 
 	return 0;
-};
+}
 
 static int sort_media_device_entry(const void *a, const void *b)
 {
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 73fc7e3c..e69a498d 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -306,9 +306,8 @@ static void print_devices(dev_vec files)
 	std::string bus_info;
 	struct v4l2_capability vcap;
 
-	for (dev_vec::iterator iter = files.begin();
-		iter != files.end(); ++iter) {
-		fd = open(iter->c_str(), O_RDWR);
+	for (const auto &file : files) {
+		fd = open(file.c_str(), O_RDWR);
 		memset(&vcap, 0, sizeof(vcap));
 		if (fd < 0)
 			continue;
@@ -318,12 +317,11 @@ static void print_devices(dev_vec files)
 	if (cards[bus_info].empty())
 			cards[bus_info] += std::string(reinterpret_cast<char *>(vcap.card))
 				+ " (" + bus_info + "):\n";
-		cards[bus_info] += "\t" + (*iter);
+		cards[bus_info] += "\t" + file;
 		cards[bus_info] += "\n";
 	}
-	for (dev_map::iterator iter = cards.begin();
-			iter != cards.end(); ++iter) {
-		printf("%s\n", iter->second.c_str());
+	for (const auto &card : cards) {
+		printf("%s\n", card.second.c_str());
 	}
 }
 static dev_vec list_devices()
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 92b4e995..5f9996fb 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1270,8 +1270,8 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		node.valid_buftypes = 0;
 		node.valid_memorytype = 0;
 		node.buf_caps = 0;
-		for (unsigned idx = 0; idx < V4L2_BUF_TYPE_LAST + 1; idx++)
-			node.buftype_pixfmts[idx].clear();
+		for (auto &buftype_pixfmt : node.buftype_pixfmts)
+			buftype_pixfmt.clear();
 
 		if (max_io) {
 			sprintf(suffix, " (%s %u)",
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index cdfbbd34..d4b1eb8b 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -36,6 +36,7 @@
 #include <signal.h>
 #include <sys/ioctl.h>
 #include <netinet/in.h>
+#include <algorithm>
 #include <atomic>
 #include <map>
 #include <vector>
@@ -2708,10 +2709,8 @@ static selTest createSelTest(struct node *node)
 
 static bool haveSelTest(const selTest &test)
 {
-	for (unsigned i = 0; i < selTests.size(); i++)
-		if (!memcmp(&selTests[i], &test, sizeof(test)))
-			return true;
-	return false;
+	return std::any_of(selTests.begin(), selTests.end(), [&](const selTest &selfTest)
+		{ return &selfTest != &test; });
 }
 
 static void streamFmtRun(struct node *node, cv4l_fmt &fmt, unsigned frame_count,
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 73719cc3..b865e596 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -529,11 +529,11 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
 		if (ret)
 			return fail("sliced.reserved not zeroed\n");
 		fail_on_test(sliced.service_lines[0][0] || sliced.service_lines[1][0]);
-		for (int f = 0; f < 2; f++) {
-			for (int i = 0; i < 24; i++) {
-				if (sliced.service_lines[f][i])
+		for (const auto &service_line : sliced.service_lines) {
+			for (unsigned short i : service_line) {
+				if (i)
 					cnt++;
-				service_set |= sliced.service_lines[f][i];
+				service_set |= i;
 			}
 		}
 		fail_on_test(sliced.io_size < sizeof(struct v4l2_sliced_vbi_data) * cnt);
@@ -1243,9 +1243,9 @@ static int testSlicedVBICapType(struct node *node, unsigned type)
 	fail_on_test(cap.type != type);
 	fail_on_test(!sliced_type || !(node->g_caps() & buftype2cap[type]));
 
-	for (int f = 0; f < 2; f++)
-		for (int i = 0; i < 24; i++)
-			service_set |= cap.service_lines[f][i];
+	for (const auto &service_line : cap.service_lines)
+		for (unsigned short i : service_line)
+			service_set |= i;
 	fail_on_test(cap.service_set != service_set);
 	fail_on_test(cap.service_lines[0][0] || cap.service_lines[1][0]);
 	return 0;
diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
index bcd8a725..f5101e33 100644
--- a/utils/v4l2-compliance/v4l2-test-media.cpp
+++ b/utils/v4l2-compliance/v4l2-test-media.cpp
@@ -393,9 +393,8 @@ int testMediaEnum(struct node *node)
 	}
 	fail_on_test(num_data_links != num_links);
 
-	for (entity_map::iterator iter = ent_map.begin();
-	     iter != ent_map.end(); ++iter) {
-		media_entity_desc &ent = iter->second;
+	for (auto & iter : ent_map) {
+		media_entity_desc &ent = iter.second;
 
 		memset(&links, 0, sizeof(links));
 		memset(&links.reserved, 0xff, sizeof(links.reserved));
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 9b785cbf..ea026fd5 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -291,9 +291,8 @@ static void list_devices()
 
 	std::sort(files.begin(), files.end(), sort_on_device_name);
 
-	for (dev_vec::iterator iter = files.begin();
-			iter != files.end(); ++iter) {
-		int fd = open(iter->c_str(), O_RDWR);
+	for (const auto &file : files) {
+		int fd = open(file.c_str(), O_RDWR);
 		std::string bus_info;
 		std::string card;
 
@@ -323,14 +322,13 @@ static void list_devices()
 			continue;
 		if (cards[bus_info].empty())
 			cards[bus_info] += card + " (" + bus_info + "):\n";
-		cards[bus_info] += "\t" + (*iter);
-		if (!(links[*iter].empty()))
-			cards[bus_info] += " <- " + links[*iter];
+		cards[bus_info] += "\t" + file;
+		if (!(links[file].empty()))
+			cards[bus_info] += " <- " + links[file];
 		cards[bus_info] += "\n";
 	}
-	for (dev_map::iterator iter = cards.begin();
-			iter != cards.end(); ++iter) {
-		printf("%s\n", iter->second.c_str());
+	for (const auto &card : cards) {
+		printf("%s\n", card.second.c_str());
 	}
 }
 
@@ -693,15 +691,15 @@ void common_process_controls(cv4l_fd &fd)
 	have_query_ext_ctrl = rc == 0;
 
 	find_controls(fd);
-	for (ctrl_get_list::iterator iter = get_ctrls.begin(); iter != get_ctrls.end(); ++iter) {
-	    if (ctrl_str2q.find(*iter) == ctrl_str2q.end()) {
-		fprintf(stderr, "unknown control '%s'\n", iter->c_str());
+	for (const auto &get_ctrl : get_ctrls) {
+	    if (ctrl_str2q.find(get_ctrl) == ctrl_str2q.end()) {
+		fprintf(stderr, "unknown control '%s'\n", get_ctrl.c_str());
 		std::exit(EXIT_FAILURE);
 	    }
 	}
-	for (ctrl_set_map::iterator iter = set_ctrls.begin(); iter != set_ctrls.end(); ++iter) {
-	    if (ctrl_str2q.find(iter->first) == ctrl_str2q.end()) {
-		fprintf(stderr, "unknown control '%s'\n", iter->first.c_str());
+	for (const auto &set_ctrl : set_ctrls) {
+	    if (ctrl_str2q.find(set_ctrl.first) == ctrl_str2q.end()) {
+		fprintf(stderr, "unknown control '%s'\n", set_ctrl.first.c_str());
 		std::exit(EXIT_FAILURE);
 	    }
 	}
@@ -914,10 +912,9 @@ void common_set(cv4l_fd &_fd)
 		bool use_ext_ctrls = false;
 
 		memset(&ctrls, 0, sizeof(ctrls));
-		for (ctrl_set_map::iterator iter = set_ctrls.begin();
-				iter != set_ctrls.end(); ++iter) {
+		for (const auto &set_ctrl : set_ctrls) {
 			struct v4l2_ext_control ctrl;
-			struct v4l2_query_ext_ctrl &qc = ctrl_str2q[iter->first];
+			struct v4l2_query_ext_ctrl &qc = ctrl_str2q[set_ctrl.first];
 
 			memset(&ctrl, 0, sizeof(ctrl));
 			ctrl.id = qc.id;
@@ -953,29 +950,29 @@ void common_set(cv4l_fd &_fd)
 
 				switch (qc.type) {
 				case V4L2_CTRL_TYPE_U8:
-					v = strtoul(iter->second.c_str(), NULL, 0);
+					v = strtoul(set_ctrl.second.c_str(), NULL, 0);
 					for (i = 0; i < qc.elems; i++)
 						if (idx_in_subset(qc, subset, divide, i))
 							ctrl.p_u8[i] = v;
 					break;
 				case V4L2_CTRL_TYPE_U16:
-					v = strtoul(iter->second.c_str(), NULL, 0);
+					v = strtoul(set_ctrl.second.c_str(), NULL, 0);
 					for (i = 0; i < qc.elems; i++)
 						if (idx_in_subset(qc, subset, divide, i))
 							ctrl.p_u16[i] = v;
 					break;
 				case V4L2_CTRL_TYPE_U32:
-					v = strtoul(iter->second.c_str(), NULL, 0);
+					v = strtoul(set_ctrl.second.c_str(), NULL, 0);
 					for (i = 0; i < qc.elems; i++)
 						if (idx_in_subset(qc, subset, divide, i))
 							ctrl.p_u32[i] = v;
 					break;
 				case V4L2_CTRL_TYPE_STRING:
-					strncpy(ctrl.string, iter->second.c_str(), qc.maximum);
+					strncpy(ctrl.string, set_ctrl.second.c_str(), qc.maximum);
 					ctrl.string[qc.maximum] = 0;
 					break;
 				case V4L2_CTRL_TYPE_AREA:
-					sscanf(iter->second.c_str(), "%ux%u",
+					sscanf(set_ctrl.second.c_str(), "%ux%u",
 					       &ctrl.p_area->width, &ctrl.p_area->height);
 					break;
 				default:
@@ -986,20 +983,19 @@ void common_set(cv4l_fd &_fd)
 			} else {
 				if (V4L2_CTRL_DRIVER_PRIV(ctrl.id))
 					use_ext_ctrls = true;
-				ctrl.value = strtol(iter->second.c_str(), NULL, 0);
+				ctrl.value = strtol(set_ctrl.second.c_str(), NULL, 0);
 			}
 			class2ctrls[V4L2_CTRL_ID2WHICH(ctrl.id)].push_back(ctrl);
 		}
-		for (class2ctrls_map::iterator iter = class2ctrls.begin();
-				iter != class2ctrls.end(); ++iter) {
+		for (auto &class2ctrl : class2ctrls) {
 			if (!use_ext_ctrls &&
-			    (iter->first == V4L2_CTRL_CLASS_USER ||
-			     iter->first == V4L2_CID_PRIVATE_BASE)) {
-				for (unsigned i = 0; i < iter->second.size(); i++) {
+			    (class2ctrl.first == V4L2_CTRL_CLASS_USER ||
+			     class2ctrl.first == V4L2_CID_PRIVATE_BASE)) {
+				for (const auto &i : class2ctrl.second) {
 					struct v4l2_control ctrl;
 
-					ctrl.id = iter->second[i].id;
-					ctrl.value = iter->second[i].value;
+					ctrl.id = i.id;
+					ctrl.value = i.value;
 					if (doioctl(fd, VIDIOC_S_CTRL, &ctrl)) {
 						fprintf(stderr, "%s: %s\n",
 								ctrl_id2str[ctrl.id].c_str(),
@@ -1008,10 +1004,10 @@ void common_set(cv4l_fd &_fd)
 				}
 				continue;
 			}
-			if (!iter->second.empty()) {
-				ctrls.which = iter->first;
-				ctrls.count = iter->second.size();
-				ctrls.controls = &iter->second[0];
+			if (!class2ctrl.second.empty()) {
+				ctrls.which = class2ctrl.first;
+				ctrls.count = class2ctrl.second.size();
+				ctrls.controls = &class2ctrl.second[0];
 				if (doioctl(fd, VIDIOC_S_EXT_CTRLS, &ctrls)) {
 					if (ctrls.error_idx >= ctrls.count) {
 						fprintf(stderr, "Error setting controls: %s\n",
@@ -1019,7 +1015,7 @@ void common_set(cv4l_fd &_fd)
 					}
 					else {
 						fprintf(stderr, "%s: %s\n",
-								ctrl_id2str[iter->second[ctrls.error_idx].id].c_str(),
+								ctrl_id2str[class2ctrl.second[ctrls.error_idx].id].c_str(),
 								strerror(errno));
 					}
 				}
@@ -1101,10 +1097,9 @@ void common_get(cv4l_fd &_fd)
 		bool use_ext_ctrls = false;
 
 		memset(&ctrls, 0, sizeof(ctrls));
-		for (ctrl_get_list::iterator iter = get_ctrls.begin();
-				iter != get_ctrls.end(); ++iter) {
+		for (const auto &get_ctrl : get_ctrls) {
 			struct v4l2_ext_control ctrl;
-			struct v4l2_query_ext_ctrl &qc = ctrl_str2q[*iter];
+			struct v4l2_query_ext_ctrl &qc = ctrl_str2q[get_ctrl];
 
 			memset(&ctrl, 0, sizeof(ctrl));
 			ctrl.id = qc.id;
@@ -1120,28 +1115,26 @@ void common_get(cv4l_fd &_fd)
 				use_ext_ctrls = true;
 			class2ctrls[V4L2_CTRL_ID2WHICH(ctrl.id)].push_back(ctrl);
 		}
-		for (class2ctrls_map::iterator iter = class2ctrls.begin();
-				iter != class2ctrls.end(); ++iter) {
+		for (auto &class2ctrl : class2ctrls) {
 			if (!use_ext_ctrls &&
-			    (iter->first == V4L2_CTRL_CLASS_USER ||
-			     iter->first == V4L2_CID_PRIVATE_BASE)) {
-				for (unsigned i = 0; i < iter->second.size(); i++) {
+			    (class2ctrl.first == V4L2_CTRL_CLASS_USER ||
+			     class2ctrl.first == V4L2_CID_PRIVATE_BASE)) {
+				for (const auto &i : class2ctrl.second) {
 					struct v4l2_control ctrl;
 
-					ctrl.id = iter->second[i].id;
+					ctrl.id = i.id;
 					doioctl(fd, VIDIOC_G_CTRL, &ctrl);
 					printf("%s: %d\n", ctrl_id2str[ctrl.id].c_str(), ctrl.value);
 				}
 				continue;
 			}
-			if (!iter->second.empty()) {
-				ctrls.which = iter->first;
-				ctrls.count = iter->second.size();
-				ctrls.controls = &iter->second[0];
+			if (!class2ctrl.second.empty()) {
+				ctrls.which = class2ctrl.first;
+				ctrls.count = class2ctrl.second.size();
+				ctrls.controls = &class2ctrl.second[0];
 				doioctl(fd, VIDIOC_G_EXT_CTRLS, &ctrls);
-				for (unsigned i = 0; i < iter->second.size(); i++) {
-					struct v4l2_ext_control ctrl = iter->second[i];
-					std::string &name = ctrl_id2str[ctrl.id];
+				for (auto ctrl : class2ctrl.second) {
+						std::string &name = ctrl_id2str[ctrl.id];
 					struct v4l2_query_ext_ctrl &qc = ctrl_str2q[name];
 
 					if (qc.flags & V4L2_CTRL_FLAG_HAS_PAYLOAD) {
diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index 16344a15..7809a6db 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -437,9 +437,7 @@ static void do_try_set_overlay(struct v4l2_format &fmt, int fd)
 		stride = (win.w.width + 7) / 8;
 		bitmap = static_cast<unsigned char *>(calloc(1, stride * win.w.height));
 		win.bitmap = bitmap;
-		for (unsigned i = 0; i < bitmap_rects.size(); i++) {
-			const v4l2_rect &r = bitmap_rects[i];
-
+		for (const auto &r : bitmap_rects) {
 			if (r.left + r.width > win.w.width ||
 			    r.top + r.height > win.w.height) {
 				fprintf(stderr, "rectangle is out of range\n");
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 71714ec7..d986c7b6 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -879,10 +879,10 @@ static bool set_fwht_req_by_fd(const struct fwht_cframe_hdr *hdr,
 
 	set_fwht_stateless_params(fwht_params, hdr, last_bf_ts);
 
-	for (int idx = 0; idx < VIDEO_MAX_FRAME; idx++) {
-		if (fwht_reqs[idx].fd == req_fd) {
-			fwht_reqs[idx].ts = ts;
-			fwht_reqs[idx].params = fwht_params;
+	for (auto &fwht_req : fwht_reqs) {
+		if (fwht_req.fd == req_fd) {
+			fwht_req.ts = ts;
+			fwht_req.params = fwht_params;
 			return true;
 		}
 	}
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 214fb9de..8b23752a 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -650,9 +650,8 @@ int main(int argc, char **argv)
 		get_reg.match = match;
 		printf("ioctl: VIDIOC_DBG_G_REGISTER\n");
 
-		for (std::vector<std::string>::iterator iter = get_regs.begin();
-				iter != get_regs.end(); ++iter) {
-			get_reg.reg = parse_reg(curr_bd, *iter);
+		for (const auto &reg : get_regs) {
+			get_reg.reg = parse_reg(curr_bd, reg);
 			if (ioctl(fd, VIDIOC_DBG_G_REGISTER, &get_reg) < 0)
 				fprintf(stderr, "ioctl: VIDIOC_DBG_G_REGISTER "
 						"failed for 0x%llx\n", get_reg.reg);
-- 
2.26.2

