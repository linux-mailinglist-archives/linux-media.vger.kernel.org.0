Return-Path: <linux-media+bounces-55484-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCRvE6h3sml/MwAAu9opvQ
	(envelope-from <linux-media+bounces-55484-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 09:22:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ADB26ED5A
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 09:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDD153033E6B
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 08:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F13A34EEEC;
	Thu, 12 Mar 2026 08:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cg/MyPjG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF6333122D
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773303492; cv=none; b=gmJv5KFs83aG8sIyzd9iyVbINnX4dyvPDBBNrquOqXrpJ3tRAIiZFh6LaRAeekkn58xs/0CmUuU+AXzDTTfu4AxP1DMSW3qsO9Rzj8R4/Wc6hLRB+gKyoL6Y4EUoXwEJYFlNFbfwvw39ENQDe7Hf2a8t6uF4MpjGVM6QwtbTDwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773303492; c=relaxed/simple;
	bh=+oACNVYukAnS7GpAZIVfnewjYjA0WQrqePQkkL/7vN4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SH3r1CHCDA/R8KoKySf7fXMx4lxlm72QPJ4ZKo2rYM6SLouupLQTN1y7BEsY6eKL3dJhug+934yUeaQsGe87pERhEk/rJsYCLHUuBx7I/khiY/16k9TJ6Wqg5XAnlSE7CndjbLhESooAVPOkE0pS96O5NP2oHKLXR406OZxdc5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cg/MyPjG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483ad568d68so634425e9.2
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773303489; x=1773908289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ei5N0R/EMrczD1GTxqAA48zolyzRFkImo/4V3SUYaU=;
        b=Cg/MyPjG3iHPXCShMMGiZTf2Oytebta10TDMlxWjygTMrKpGOwCKg7poJpEzeOj1yG
         JYSFgM2z3WkrUYnMimNTFWXlqRHdKfo5V2pVb4ainiUH1Ye5L1crtF7KNid/qQSCvtwH
         6DLcI/3O/Or724qOQwyR/sa1Tf2O5wqcYOpveo0khzrHrm+Ss6+VJm50cT5vmnDZgYtl
         FlSoZfykmdi6wN6aiyEqs0tAP7lcCwEMI/0O1U2VyyITzzd9QE9R5mkZxQUPFZtDXQLd
         k+6MN5PxMFr423s7xsG/di3FOc9jDgacSVG1i66NNwz4HmRuiIa7nUoPp2cSg607S5Tc
         M2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773303489; x=1773908289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ei5N0R/EMrczD1GTxqAA48zolyzRFkImo/4V3SUYaU=;
        b=BQPFEG63D6r79hYydns7m/oyd0a0IVNV0cbLO70vZfhW5vNJtbLhM7EBTBo6RaU4fl
         gnJB1vtVm9n809wuI+yhSdZjz86lMbLaXHaCskyWQLWZqIAxCQnUlG+HvaY1pG6p1xdR
         esv57RMR1cSOgr7uMxiFjWGZnixIJQcGsaxUgwJvCCc+9emrQGW5OJPmkXPVflayoDDc
         sV0I10ALDFvq5VtC5gYeHI/f8LsFHRN1PqhOeeD5UEzEmYjk5TwkokDQeAg5t2gJ51Xf
         0i8L/j0j+2mDRUPlOxF57uM7JfKpg/Q5m3QD0u9urgLxea2ZtEWTC966GzeDc5JOfnkm
         MqfA==
X-Gm-Message-State: AOJu0YyN06aXAlgmr/5xy6mpWg0salvTGcUprymp1lNt2OAsQ+rngODX
	6LHzPVkykfPoyd/orBxVQR4Dwsf5NMcO2HH7ZToMsNRId8/Iy1wWswIxLsZrSA==
X-Gm-Gg: ATEYQzwnQwOBM/EZK/sn637bepwKvhbYgSA86JpUpFH13oaeJRvc7PyCJPxicjWFjCY
	ULd0q0ui1FBu4J5y2c+J7nTd1w7/w5QSvYCJQivd4fCERP2M49F3pGEmbpw9n3AyLntt8JN8nxb
	CO9+OYHOCAjIbvbwy4+pMGlRrsdmhjb7Yg81ts231JoOXERL0bokSwbKg9HVSDRGHkdBj+jpAPb
	1vg2A7iZYoahHGMm6i/zNSBaTKGDzqdX5KHEnKMs4vKePSdlpf1Rhm9DEr7+Hyd/qFU8Y5Ff4hz
	H974zBMqOgH4RpjKqB7MPfG9m8q8/Mx66WA/O1BSMstDrO/GzRlRIQjzN80KFfPpUxfK125sgI3
	M/Choucfm44yh5rJ4utYzTHPKa0KVPofgnZAQHnF+Z1cTBNDlzscypNtHKlNQvgrzsfcOn0S9at
	2z5wjKDoHW4lhf0FH2ib56lep2bIDtH27V7wBtwk9phDzocFIP9N0=
X-Received: by 2002:a05:600c:6297:b0:485:3fc3:e8e9 with SMTP id 5b1f17b1804b1-4854b0f09e1mr52068895e9.3.1773303489402;
        Thu, 12 Mar 2026 01:18:09 -0700 (PDT)
Received: from rivka-VirtualBox.. (px140.isp.net.il. [195.60.235.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm6391787f8f.23.2026.03.12.01.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:18:09 -0700 (PDT)
From: Rivka Bukchin <rivkab300@gmail.com>
To: linux-media@vger.kernel.org
Cc: Rivka Bukchin <rivkab300@gmail.com>
Subject: [PATCH v2] v4l2-compliance: add tests for VIDIOC_S_FBUF/OVERLAY and selection flags
Date: Thu, 12 Mar 2026 10:18:01 +0200
Message-Id: <20260312081801.14353-1-rivkab300@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-55484-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rivkab300@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 53ADB26ED5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compliance tests for VIDIOC_S_FBUF and VIDIOC_OVERLAY to verify
basic framebuffer and overlay handling.

Add tests for VIDIOC_S_SELECTION flag handling to ensure that valid
flags (V4L2_SEL_FLAG_GE and V4L2_SEL_FLAG_LE) are accepted and that
invalid flag combinations are rejected.

These tests extend the coverage of the format and selection ioctl
compliance checks.

Signed-off-by: Rivka Bukchin <rivkab300@gmail.com>
---
v2: Rebased on upstream v4l-utils tree

 utils/v4l2-compliance/v4l2-compliance.cpp   |  2 +
 utils/v4l2-compliance/v4l2-compliance.h     |  2 +
 utils/v4l2-compliance/v4l2-test-formats.cpp | 78 +++++++++++++++++++++
 3 files changed, 82 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 4e5c9d00deb5..20d5f329d335 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1464,6 +1464,8 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		printf("\ttest Cropping: %s\n", ok(testCropping(&node)));
 		printf("\ttest Composing: %s\n", ok(testComposing(&node)));
 		printf("\ttest Scaling: %s\n", ok(testScaling(&node)));
+		printf("\ttest Overlay: %s\n", ok(testOverlay(&node)));
+        printf("\ttest Selection Flags: %s\n", ok(testSelectionFlags(&node)));
 		printf("\n");
 
 		/* Codec ioctls */
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 4a7af5f5bce5..265cd08397fa 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -375,6 +375,8 @@ int testSlicedVBICap(struct node *node);
 int testCropping(struct node *node);
 int testComposing(struct node *node);
 int testScaling(struct node *node);
+int testOverlay(struct node *node);
+int testSelectionFlags(struct node *node);
 
 // Codec ioctl tests
 int testEncoder(struct node *node);
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 56b6614162cf..6c5743a3da47 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -2048,3 +2048,81 @@ int testScaling(struct node *node)
 	}
 	return node->can_scale ? 0 : ENOTTY;
 }
+
+int testOverlay(struct node *node)
+{
+    struct v4l2_framebuffer fbuf;
+    int ret;
+
+    memset(&fbuf, 0xff, sizeof(fbuf));
+    fbuf.fmt.priv = 0;
+
+    ret = doioctl(node, VIDIOC_G_FBUF, &fbuf);
+    if (ret == ENOTTY)
+        return ret;
+    if (ret == EINVAL)
+        return ENOTTY;
+    fail_on_test(ret);
+
+    if (!(node->g_caps() & (V4L2_CAP_VIDEO_OVERLAY |
+                V4L2_CAP_VIDEO_OUTPUT_OVERLAY)))
+        return ENOTTY;
+
+    struct v4l2_framebuffer set_fbuf = fbuf;
+
+    ret = doioctl(node, VIDIOC_S_FBUF, &set_fbuf);
+    fail_on_test(ret && ret != ENOTTY && ret != EINVAL);
+
+    int enable = 1;
+
+    ret = doioctl(node, VIDIOC_OVERLAY, &enable);
+    fail_on_test(ret && ret != ENOTTY && ret != EINVAL);
+
+    enable = 0;
+
+    ret = doioctl(node, VIDIOC_OVERLAY, &enable);
+    fail_on_test(ret && ret != ENOTTY && ret != EINVAL);
+
+    return 0;
+}
+
+int testSelectionFlags(struct node *node)
+{
+    struct v4l2_selection sel = {
+        node->can_capture ?
+            V4L2_BUF_TYPE_VIDEO_CAPTURE :
+            V4L2_BUF_TYPE_VIDEO_OUTPUT,
+        V4L2_SEL_TGT_CROP
+    };
+    int ret;
+
+    memset(sel.reserved, 0xff, sizeof(sel.reserved));
+
+    ret = doioctl(node, VIDIOC_G_SELECTION, &sel);
+    if (ret == ENOTTY || ret == EINVAL || ret == ENODATA)
+        return ENOTTY;
+
+    fail_on_test(ret);
+    fail_on_test(check_0(sel.reserved, sizeof(sel.reserved)));
+
+    struct v4l2_selection s = sel;
+
+    s.flags = V4L2_SEL_FLAG_GE;
+    doioctl(node, VIDIOC_S_SELECTION, &s);
+
+    s = sel;
+    s.flags = V4L2_SEL_FLAG_LE;
+    doioctl(node, VIDIOC_S_SELECTION, &s);
+
+    s = sel;
+    s.flags = V4L2_SEL_FLAG_GE | V4L2_SEL_FLAG_LE;
+    doioctl(node, VIDIOC_S_SELECTION, &s);
+
+    s = sel;
+    s.flags = ~0;
+
+    ret = doioctl(node, VIDIOC_S_SELECTION, &s);
+    fail_on_test(ret == 0);
+
+    return 0;
+}
-- 
2.34.1


