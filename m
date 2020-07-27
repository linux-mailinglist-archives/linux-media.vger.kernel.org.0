Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0BF22E44B
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 05:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgG0DPC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 23:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgG0DPB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 23:15:01 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6800EC0619D4
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:15:01 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k4so7266815pld.12
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eOg0ShaItpaguOUpLStj6CyaCXaW+3MJYdP1vjzgfCI=;
        b=mdbQh28YqHq+Hg9I9xmR4P6lWr0v7HnDSwv7Royfl0N+vbOjZ2/zAQVL6x8QdYlgYu
         VS5ZMbg6AJ0qD+1TeveIMM7dUPQ5IYJQos1nu2vAwdGdFTf/cR3GAMqgoV4S1Wxyb0p6
         bw1BFePhARWd6YR2ko3ap67xMdSu4AWgcYQ0nnFEnumhuy75Jn3GiDXcb1iqwySgxo3z
         8HCfNM6Uma270uTSeTAi0RNMzEnHvc7pOJt1OJCF0xKGma+bh6jL2rxWGic0/57RroUn
         8B7CWDsgZw4j2dxW/ZybaGApujkIejAZ/WYRv6FTuVPsWGn3wDQDzw1nJtvFoGdBoEyz
         A0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eOg0ShaItpaguOUpLStj6CyaCXaW+3MJYdP1vjzgfCI=;
        b=B6l5vKq/nQYA6UGqms7LwsGYQGVJzLUrE8KTbD4X+JucsZSAAZnl8k47w3syMOzWCl
         lJhrz7LY/+pbpgkKzNhJAsMLI9og46zSDdpzYJeJNzJ07K0nEIxyTwG9OjO6/FRlEkBP
         hEMAYqUDLu8I7Kc7Pfxch9gJOJDi8iO5yjAC1dmxHQs2J7rc4SISVECoPZgXblsoGj1r
         dBSsQU2wQNZ4k7f+tIsuQdBvo+PXug5zjiwwvHsd39PyXfXCumxmHs1o/mQaoDgbCcto
         NVMhOomD9Uj9G9C5wEF1AFSrfAvt1FnCUZZu/s2IkBCzJ0wE8TlutY/wafiTNBhkQVNS
         0lhg==
X-Gm-Message-State: AOAM531MN5692sLEAE4FLqogikDiEMxQ8RF6CX4uMO/ZdrMRD4b6O5wQ
        bcoRhcIaH1QJ3phHiratFPNgiMj8c64=
X-Google-Smtp-Source: ABdhPJxu5ykJn3q6oxgZv8cPxfQTlnKEbf7LvUhzYbW6lJNp/yzonBBG367hREM4E36Wg8GYr+cr8w==
X-Received: by 2002:a17:902:9a0a:: with SMTP id v10mr17197341plp.134.1595819700567;
        Sun, 26 Jul 2020 20:15:00 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id t126sm13259345pfd.214.2020.07.26.20.14.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 20:15:00 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/8] [clang-tidy] use auto
Date:   Sun, 26 Jul 2020 20:14:51 -0700
Message-Id: <20200727031456.232955-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200727031456.232955-1-rosenp@gmail.com>
References: <20200727031456.232955-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with modernize-use-auto

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp     | 2 +-
 utils/cec-compliance/cec-test.cpp           | 2 +-
 utils/cec-ctl/cec-ctl.cpp                   | 2 +-
 utils/cec-follower/cec-follower.cpp         | 2 +-
 utils/rds-ctl/rds-ctl.cpp                   | 2 +-
 utils/v4l2-compliance/v4l2-compliance.cpp   | 6 +++---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 6 +++---
 utils/v4l2-ctl/v4l2-ctl-common.cpp          | 4 ++--
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp       | 1 +
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp          | 4 ++--
 utils/v4l2-ctl/v4l2-ctl.cpp                 | 8 ++++----
 11 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 796d0b3c..06a8e23f 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -655,7 +655,7 @@ int cec_named_ioctl(struct node *node, const char *name,
 {
 	int retval;
 	int e;
-	struct cec_msg *msg = static_cast<struct cec_msg *>(parm);
+	auto msg = static_cast<struct cec_msg *>(parm);
 	__u8 opcode = 0;
 	std::string opname;
 
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 2b5265a3..986d134f 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -1502,7 +1502,7 @@ void collectTests()
 	for (const auto &test : tests) {
 		for (unsigned j = 0; j < test.num_subtests; j++) {
 			std::string name = safename(test.subtests[j].name);
-			__u64 func = (__u64)test.subtests[j].test_fn;
+			auto func = (__u64)test.subtests[j].test_fn;
 
 			if (mapTestFuncs.find(name) != mapTestFuncs.end() &&
 			    mapTestFuncs[name] != func) {
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 1fa7ba15..8ae800bb 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -1772,7 +1772,7 @@ static void list_devices()
 	closedir(dp);
 
 	/* Find device nodes which are links to other device nodes */
-	for (dev_vec::iterator iter = files.begin();
+	for (auto iter = files.begin();
 			iter != files.end(); ) {
 		char link[64+1];
 		int link_len;
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 9acdb305..673c6e31 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -277,7 +277,7 @@ int cec_named_ioctl(int fd, const char *name,
 			name, retval, strerror(e));
 
 	if (!retval) {
-		const struct cec_msg *msg = static_cast<const struct cec_msg *>(parm);
+		const auto msg = static_cast<const struct cec_msg *>(parm);
 
 		/* Update the timestamp whenever we successfully transmit to an LA,
 		   or whenever we receive something from the LA */
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index e69a498d..12ec8bae 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -346,7 +346,7 @@ static dev_vec list_devices()
 
 	/* Iterate through all devices, and remove all non-accessible devices
 	 * and all devices that don't offer the RDS_BLOCK_IO capability */
-	for (dev_vec::iterator iter = files.begin();
+	for (auto iter = files.begin();
 			iter != files.end();) {
 		int fd = open(iter->c_str(), O_RDONLY | O_NONBLOCK);
 		std::string bus_info;
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 5f9996fb..fa941a14 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -900,11 +900,11 @@ static std::string make_devname(const char *device, const char *devname,
 		return device;
 	}
 
-	media_v2_entity *ents = new media_v2_entity[topology.num_entities];
+	auto ents = new media_v2_entity[topology.num_entities];
 	topology.ptr_entities = (uintptr_t)ents;
-	media_v2_link *links = new media_v2_link[topology.num_links];
+	auto links = new media_v2_link[topology.num_links];
 	topology.ptr_links = (uintptr_t)links;
-	media_v2_interface *ifaces = new media_v2_interface[topology.num_interfaces];
+	auto ifaces = new media_v2_interface[topology.num_interfaces];
 	topology.ptr_interfaces = (uintptr_t)ifaces;
 
 	unsigned i, ent_id, iface_id = 0;
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index d4b1eb8b..436de288 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1681,7 +1681,7 @@ int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_cou
 			for (unsigned p = 0; p < q.g_num_planes(); p++) {
 				/* ensure that len is a multiple of 4 */
 				__u32 len = ((q.g_length(p) + 3) & ~0x3) + 4 * 4096;
-				__u32 *m = static_cast<__u32 *>(malloc(len));
+				auto m = static_cast<__u32 *>(malloc(len));
 
 				fail_on_test(!m);
 				fail_on_test((uintptr_t)m & 0x7);
@@ -1740,7 +1740,7 @@ int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_cou
 				__u32 buflen = (q.g_length(p) + 3U) & ~3U;
 				__u32 memlen = buflen + 4 * 4096;
 				__u32 *m = buffers[i][p];
-				__u32 *u = static_cast<__u32 *>(q.g_userptr(i, p));
+				auto u = static_cast<__u32 *>(q.g_userptr(i, p));
 
 				for (__u32 *x = m; x < u; x++)
 					if (*x != filler)
@@ -2372,7 +2372,7 @@ public:
 private:
 	static void *startRoutine(void *arg)
 	{
-		BlockingThread *self = static_cast<BlockingThread *>(arg);
+		auto self = static_cast<BlockingThread *>(arg);
 
 		pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
 		pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index ea026fd5..c8705a04 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -225,7 +225,7 @@ static void list_media_devices(const std::string &media_bus_info)
 		return;
 	}
 
-	media_v2_interface *ifaces = new media_v2_interface[topology.num_interfaces];
+	auto ifaces = new media_v2_interface[topology.num_interfaces];
 	topology.ptr_interfaces = (uintptr_t)ifaces;
 
 	if (!ioctl(media_fd, MEDIA_IOC_G_TOPOLOGY, &topology))
@@ -259,7 +259,7 @@ static void list_devices()
 	closedir(dp);
 
 	/* Find device nodes which are links to other device nodes */
-	for (dev_vec::iterator iter = files.begin();
+	for (auto iter = files.begin();
 			iter != files.end(); ) {
 		char link[64+1];
 		int link_len;
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index d986c7b6..0c384fe9 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1,3 +1,4 @@
+#include <algorithm>
 #include <cstdlib>
 #include <cstring>
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 80312b51..5abab5e7 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -366,7 +366,7 @@ void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
 		'.', ',', ':', ';', '!', '|', 'i', 'c',
 		'n', 'o', 'm', 'I', 'C', 'N', 'O', 'M',
 	};
-	__s16 *vbuf = static_cast<__s16 *>(q.g_dataptr(buf.g_index(), 0));
+	auto vbuf = static_cast<__s16 *>(q.g_dataptr(buf.g_index(), 0));
 	__u32 x, y;
 
 	switch (fmt.g_pixelformat()) {
@@ -375,7 +375,7 @@ void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
 			fprintf(f, "TD16: ");
 
 			for (x = 0; x < fmt.g_width(); x++, vbuf++) {
-				__s16 v = static_cast<__s16>(le16toh(*vbuf));
+				auto v = static_cast<__s16>(le16toh(*vbuf));
 
 				if (!options[OptConcise])
 					fprintf(f, "% 4d", v);
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 321d2d1c..a31b29f8 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -484,7 +484,7 @@ void printfmt(int fd, const struct v4l2_format &vfmt)
 			}
 		printf("\tClip Bitmap : %s", vfmt.fmt.win.bitmap ? "Yes, " : "No\n");
 		if (vfmt.fmt.win.bitmap) {
-			unsigned char *bitmap = static_cast<unsigned char *>(vfmt.fmt.win.bitmap);
+			auto bitmap = static_cast<unsigned char *>(vfmt.fmt.win.bitmap);
 			unsigned stride = (vfmt.fmt.win.w.width + 7) / 8;
 			unsigned cnt = 0;
 
@@ -1056,11 +1056,11 @@ static const char *make_devname(const char *device, const char *devname,
 		return device;
 	}
 
-	media_v2_entity *ents = new media_v2_entity[topology.num_entities];
+	auto ents = new media_v2_entity[topology.num_entities];
 	topology.ptr_entities = (uintptr_t)ents;
-	media_v2_link *links = new media_v2_link[topology.num_links];
+	auto links = new media_v2_link[topology.num_links];
 	topology.ptr_links = (uintptr_t)links;
-	media_v2_interface *ifaces = new media_v2_interface[topology.num_interfaces];
+	auto ifaces = new media_v2_interface[topology.num_interfaces];
 	topology.ptr_interfaces = (uintptr_t)ifaces;
 
 	unsigned i, ent_id, iface_id = 0;
-- 
2.26.2

