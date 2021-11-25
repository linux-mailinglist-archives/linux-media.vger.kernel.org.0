Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74D5E45DAE9
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 14:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355391AbhKYNXz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 08:23:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351807AbhKYNVx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 08:21:53 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44497C0613B1
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 05:14:39 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qEa8m7NAe1HGJqEaBm3Lf6; Thu, 25 Nov 2021 14:14:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637846076; bh=2djU+Vp16YrA+duB6HDjAjyr8KRfL6zqKjjQQ326BtA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iMpC3sHhc3X2HDBjVpUpLJax6xXJubN6r6cKWvYCUFZef5E+1xneJgt1F7AgxgtTJ
         xj+uYUt9/HF1Ntx3OD5jCPJEKESZQPWwCUFXBOblK9JBWbSvk64/4hk4YRfN0ioY57
         X9BQXiRCT/9xkO4gitpGr/tpzqPzhKmohPfFHU2J2sJChpIB/DijtKvaDo3KoXpQcD
         FQfVeHwjnWOAl+OluPGj6FL4R1LOl/vEl1166D+a9zRrj4MjwKw2gMXWBqHWu7CR3X
         OdN6L1iJNpEqgRd8mIE5xBDe7WV3I9mQe5ud/C4rBKLu7tH7s/zY0fJ+dURxco4N0L
         4hZjfBCCB6S3A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dillon Min <dillon.minfei@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] v4l2-compliance: detect no-mmu systems
Message-ID: <a348a21b-b069-19b5-2565-d70e3161f2b5@xs4all.nl>
Date:   Thu, 25 Nov 2021 14:14:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfO2WekHPz0tGKR9tKpB1hx5fXdNUjiXvAn8Va9XVC+ccEZ/diltZC9d2YhyLx1mPPloIs9ch4lpbpHooHFiPkc8OxOv2StkMSKr9uNgp0LqGwhccT13E
 byu1Q6n6paAyvrxly2T1I6t/Yg7CTdCpBHr7WJwxyP5bZrLtKX1aaAe51f8QBV/7BwLiI7Ho/fkUqPTXOh9qzi1KBGIk65iOfg31PjB5xc3nT1Kc/O/5UIRM
 gDD+V5fYGHpQQ6Jsx7cXZA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check if the OS has an MMU. If not, then skip tests that only work for
systems that have an MMU.

The safest and most generic method I found is the FIONBIO ioctl that is
available for any file descriptor and is a write-only ioctl, so no memory
will be accidentally written. On a MMU system this will return EFAULT, and
on a ucLinux system this will return 0.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Dillon, the original RFC patch (1) I posted to fix this in the kernel is not
the correct method. See:

https://stackoverflow.com/questions/24755103/how-to-handle-null-pointer-argument-to-ioctl-system-call

So instead I try to detect if there is an MMU in v4l2-compliance and, if not,
just skip those tests that require an MMU.

Can you test this patch?

Thanks!

	Hans

1: https://patchwork.linuxtv.org/project/linux-media/patch/3acd9ee4-5a58-6ed4-17fe-61596a5252b8@xs4all.nl/
---
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 0eeabb2d..c53a55ba 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -88,6 +88,7 @@ bool is_vivid;
 bool is_uvcvideo;
 int media_fd = -1;
 unsigned warnings;
+bool has_mmu = true;

 static unsigned color_component;
 static unsigned color_skip;
@@ -152,8 +153,21 @@ static struct option long_options[] = {

 static void print_sha()
 {
+	int fd = open("/dev/null", O_RDONLY);
+
+	if (fd >= 0) {
+		// FIONBIO is a write-only ioctl that takes an int argument that
+		// enables (!= 0) or disables (== 0) nonblocking mode of a fd.
+		//
+		// Passing a nullptr should return EFAULT on MMU capable machines,
+		// and it works if there is no MMU.
+		has_mmu = ioctl(fd, FIONBIO, nullptr);
+		close(fd);
+	}
 	printf("v4l2-compliance %s%s, ", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
-	printf("%zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
+	printf("%zd bits, %zd-bit time_t%s\n",
+	       sizeof(void *) * 8, sizeof(time_t) * 8,
+	       has_mmu ? "" : ", has no MMU");
 	if (strlen(STRING(GIT_SHA)))
 		printf("v4l2-compliance SHA: %s %s\n",
 		       STRING(GIT_SHA), STRING(GIT_COMMIT_DATE));
@@ -623,9 +637,9 @@ static int testCap(struct node *node)
 		V4L2_CAP_VIDEO_M2M;

 	memset(&vcap, 0xff, sizeof(vcap));
-	// Must always be there
-	fail_on_test(doioctl(node, VIDIOC_QUERYCAP, nullptr) != EFAULT);
 	fail_on_test(doioctl(node, VIDIOC_QUERYCAP, &vcap));
+	if (has_mmu)
+		fail_on_test(doioctl(node, VIDIOC_QUERYCAP, nullptr) != EFAULT);
 	fail_on_test(check_ustring(vcap.driver, sizeof(vcap.driver)));
 	fail_on_test(check_ustring(vcap.card, sizeof(vcap.card)));
 	fail_on_test(check_ustring(vcap.bus_info, sizeof(vcap.bus_info)));
@@ -988,11 +1002,10 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 	}

 	if (driver.empty())
-		printf("Compliance test for device %s%s:\n\n",
-		       node.device, node.g_direct() ? "" : " (using libv4l2)");
+		printf("Compliance test for device ");
 	else
-		printf("Compliance test for %s device %s%s:\n\n",
-		       driver.c_str(), node.device, node.g_direct() ? "" : " (using libv4l2)");
+		printf("Compliance test for %s device ", driver.c_str());
+	printf("%s%s:\n\n", node.device, node.g_direct() ? "" : " (using libv4l2)");

 	if (node.g_caps() & (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTURE |
 			 V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_SLICED_VBI_CAPTURE |
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index e73ebdd3..7255161f 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -58,6 +58,7 @@ extern bool is_uvcvideo; // We're testing the uvc driver
 extern int kernel_version;
 extern int media_fd;
 extern unsigned warnings;
+extern bool has_mmu;

 enum poll_mode {
 	POLL_MODE_NONE,
diff --git a/utils/v4l2-compliance/v4l2-test-io-config.cpp b/utils/v4l2-compliance/v4l2-test-io-config.cpp
index 6f2a9ba9..dcab40b8 100644
--- a/utils/v4l2-compliance/v4l2-test-io-config.cpp
+++ b/utils/v4l2-compliance/v4l2-test-io-config.cpp
@@ -577,6 +577,8 @@ static int checkEdid(struct node *node, unsigned pad, bool is_input)
 		fail_on_test(edid.blocks == 0 || edid.blocks >= 256);
 		fail_on_test(edid.pad != pad);
 	}
+	if (!has_mmu)
+		return 0;
 	edid.blocks = 1;
 	edid.pad = pad;
 	edid.edid = nullptr;
diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
index ef2982c0..28af0d83 100644
--- a/utils/v4l2-compliance/v4l2-test-media.cpp
+++ b/utils/v4l2-compliance/v4l2-test-media.cpp
@@ -32,8 +32,9 @@ int testMediaDeviceInfo(struct node *node)
 	struct media_device_info mdinfo;

 	memset(&mdinfo, 0xff, sizeof(mdinfo));
-	fail_on_test(doioctl(node, MEDIA_IOC_DEVICE_INFO, nullptr) != EFAULT);
 	fail_on_test(doioctl(node, MEDIA_IOC_DEVICE_INFO, &mdinfo));
+	if (has_mmu)
+		fail_on_test(doioctl(node, MEDIA_IOC_DEVICE_INFO, nullptr) != EFAULT);
 	fail_on_test(check_0(mdinfo.reserved, sizeof(mdinfo.reserved)));
 	fail_on_test(check_string(mdinfo.driver, sizeof(mdinfo.driver)));
 	fail_on_test(mdinfo.model[0] && check_string(mdinfo.model, sizeof(mdinfo.model)));
@@ -127,21 +128,23 @@ int testMediaTopology(struct node *node)
 	fail_on_test(topology.reserved2);
 	fail_on_test(topology.reserved3);
 	fail_on_test(topology.reserved4);
-	topology.ptr_entities = 4;
-	fail_on_test(doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
-	topology.ptr_entities = 0;
-	topology.ptr_interfaces = 4;
-	fail_on_test(topology.num_interfaces &&
-		     doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
-	topology.ptr_interfaces = 0;
-	topology.ptr_pads = 4;
-	fail_on_test(topology.num_pads &&
-		     doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
-	topology.ptr_pads = 0;
-	topology.ptr_links = 4;
-	fail_on_test(topology.num_links &&
-		     doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
-	topology.ptr_links = 0;
+	if (has_mmu) {
+		topology.ptr_entities = 4;
+		fail_on_test(doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
+		topology.ptr_entities = 0;
+		topology.ptr_interfaces = 4;
+		fail_on_test(topology.num_interfaces &&
+			     doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
+		topology.ptr_interfaces = 0;
+		topology.ptr_pads = 4;
+		fail_on_test(topology.num_pads &&
+			     doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
+		topology.ptr_pads = 0;
+		topology.ptr_links = 4;
+		fail_on_test(topology.num_links &&
+			     doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
+		topology.ptr_links = 0;
+	}
 	v2_ents = new media_v2_entity[topology.num_entities];
 	memset(v2_ents, 0xff, topology.num_entities * sizeof(*v2_ents));
 	topology.ptr_entities = (uintptr_t)v2_ents;
@@ -394,12 +397,14 @@ int testMediaEnum(struct node *node)
 		fail_on_test(links.entity != ent.id);
 		fail_on_test(links.pads);
 		fail_on_test(links.links);
-		links.pads = (struct media_pad_desc *)4;
-		fail_on_test(ent.pads && doioctl(node, MEDIA_IOC_ENUM_LINKS, &links) != EFAULT);
-		links.pads = nullptr;
-		links.links = (struct media_link_desc *)4;
-		fail_on_test(ent.links && doioctl(node, MEDIA_IOC_ENUM_LINKS, &links) != EFAULT);
-		links.links = nullptr;
+		if (has_mmu) {
+			links.pads = (struct media_pad_desc *)4;
+			fail_on_test(ent.pads && doioctl(node, MEDIA_IOC_ENUM_LINKS, &links) != EFAULT);
+			links.pads = nullptr;
+			links.links = (struct media_link_desc *)4;
+			fail_on_test(ent.links && doioctl(node, MEDIA_IOC_ENUM_LINKS, &links) != EFAULT);
+			links.links = nullptr;
+		}
 		links.pads = new media_pad_desc[ent.pads];
 		memset(links.pads, 0xff, ent.pads * sizeof(*links.pads));
 		links.links = new media_link_desc[ent.links];
diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index 68f97205..f3d85771 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -33,8 +33,9 @@ int testSubDevCap(struct node *node)

 	memset(&caps, 0xff, sizeof(caps));
 	// Must always be there
-	fail_on_test(doioctl(node, VIDIOC_SUBDEV_QUERYCAP, nullptr) != EFAULT);
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_QUERYCAP, &caps));
+	if (has_mmu)
+		fail_on_test(doioctl(node, VIDIOC_SUBDEV_QUERYCAP, nullptr) != EFAULT);
 	fail_on_test(check_0(caps.reserved, sizeof(caps.reserved)));
 	fail_on_test((caps.version >> 16) < 5);
 	fail_on_test(caps.capabilities & ~VALID_SUBDEV_CAPS);
