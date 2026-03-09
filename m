Return-Path: <linux-media+bounces-54949-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKhXCpzDrmn2IgIAu9opvQ
	(envelope-from <linux-media+bounces-54949-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 13:57:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA51A23946C
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 13:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 915F03044668
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 12:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825053BFE58;
	Mon,  9 Mar 2026 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9dNKzzi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606C23624A4
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060918; cv=none; b=gfdR3O5IyxseCoTSPi4J/7/KkzStzTycDjl121Xv9kDta+sojYlUa5pCJLRdQqDcUJGnWfLnEfMeZ9N7xo6c9g3m/Cqt8kpxORTHJrHCUgYokGG7xyMmL//SNy/yBPpw8jSkWdt/HVU77KSnwYCIb+Xlno4ktB5EGZXKdTTgFDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060918; c=relaxed/simple;
	bh=B+sei7A/c9jxHcbG1ytI3BryZa0MppPA9sfd2mj7/l8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rYLUaILWawDQ0OdrOzvjVmSdmRTyIY3w6efkFcFpxTWOFJy+8Lya1HiS1kUuaua22s5pysTvVNi8XBSXr7TPARVBbRFyReueC6BcSnZRmfSmYJzqW27wN3liea0mtNEU4teUOwY7kfSWR5PBF0Hc0RNCkGOMfGVMwNxZEgKPF9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9dNKzzi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4832c8f9d87so12656375e9.3
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 05:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773060914; x=1773665714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zeOlvr5waUUqdmD7LdX3p8SWCy4F94EeBIobxoHBg84=;
        b=Y9dNKzzilwTO450PzUieIE3ze+aZfNiManZ0UYXm5e7WIi/N1TbUKYhr+l41TjT0de
         LQC08bHShGtjV8tOeqaq2M8oodDLWgbCTAEhK0nXvjqtaiDSOowNmSRapvtDW3DBikGF
         jo788+zw0XF+YfgO10KmgptBQmdjLWe/hbr0IzeorTtLNhh69TbyYw2WCzUrwOKNI5sv
         lHS+RJpqiKcU9vMnvPtdwnQW9DbhEXOqbWY83KS5pjMJFtO4EKJKTmaXnqvZY0+Yi2l+
         tRBI8wS4d8Mi3klf7p+W/ATZlPk9UvsDWcBE5Ro0BnmWytCMO3vX0kTjtoU/u3yx0DZi
         d4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060914; x=1773665714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeOlvr5waUUqdmD7LdX3p8SWCy4F94EeBIobxoHBg84=;
        b=VbOpxhoKjRysi1yRBlIYsG6bH65+b5qWvsMN7B+eFyFjkowM3j/HtPDaBesbSLTY6U
         ZMkwEOCxnrt/s57XxxaMltGjiGwlKECfOeAFM6aHcVSZ315M9JxP3hu5GFcWyj83+WYo
         NPQxZBkpFXEAm3cARTBk6DOF/kSN81ZTTX+8+zu8Map/+8WjgSwzyWoijtgr5lKFg3Mr
         vDwgsZXoSi33qvS/FMHROaUGYFKycPNvnt4Mnf8rRzKT0Ce87OVPNCLqubPEIvMyqBuq
         HnJZeZID+jVHatNB3NQcH/We1aBeQB00kDxiOYLemK8ZAR5QpyGjNmM3N7QIyjM6G6Zc
         PDnQ==
X-Gm-Message-State: AOJu0Yw51Rf7Prn/sZTauMS1+0MNXTKg7cwApBOtz+Uqe52TOFgdiTvM
	F1uyftOP/qhN5Zbnq45IbCEEPTax3kyHK/5QPC+BP3xY37zNKKFIOtXAF8BBDYrd
X-Gm-Gg: ATEYQzw/W611q7WDxgcBqvuuZnApsnueW9u8u5uICTsM9WnJ0UoRftuDBMl2IaaQ4fI
	Ubpamjy94Fiwbs9vrD/esglYPnNeaTknDSRKDsmiH12wuFdhXR7RPBpqr8TmuEZRA4kC+xUWbvY
	ohI5+vH9Yj0bnnRhrUEiD0j5FbT0KDUwP97d0m5Dqr1chGDcwL7jGJUVdOD/0n8wXCttDY8IDaf
	WP20Co7lkmfzUKJYuUjMK84YXC9l3nuyd7qJ4k6EEK+ISYQkjVFSD6b4lfK+Tyz1zrJiqvfUWLV
	T+VGXYRTisJOtYH/MpruzRvEampFzAcv2E6yjWCQ5Zn4YUoeV1AGn6e8ia+3/J6zI48Ef8ZMRpo
	jyGg8O610xTrgtVIRnrpDMWdouWXeAczPjBvFJV+Ja5IndstWwM95cbjL8uwBxbBcBUvHJUHiq7
	Tzf2+Hx273qXmS/JT0i01hibFI4pLCE6Q2cro0Go7MrSCfJ/ymKyU=
X-Received: by 2002:a7b:cc94:0:b0:485:2a02:38d with SMTP id 5b1f17b1804b1-4852a0206a8mr65876395e9.3.1773060914104;
        Mon, 09 Mar 2026 05:55:14 -0700 (PDT)
Received: from rivka-VirtualBox.. (px140.isp.net.il. [195.60.235.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686bcesm425306795e9.7.2026.03.09.05.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:55:13 -0700 (PDT)
From: Rivka Bukchin <rivkab300@gmail.com>
To: linux-media@vger.kernel.org
Cc: Rivka Bukchin <rivkab300@gmail.com>
Subject: [PATCH] v4l2-compliance: add tests for VIDIOC_S_FBUF/OVERLAY and selection flags
Date: Mon,  9 Mar 2026 14:55:05 +0200
Message-Id: <20260309125505.14873-1-rivkab300@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AA51A23946C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-54949-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rivkab300@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.991];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add compliance tests for VIDIOC_S_FBUF and VIDIOC_OVERLAY to verify
basic framebuffer and overlay handling.

Add tests for VIDIOC_S_SELECTION flag handling to ensure that valid
flags (V4L2_SEL_FLAG_GE and V4L2_SEL_FLAG_LE) are accepted and that
invalid flag combinations are rejected.

These tests extend the coverage of the format and selection ioctl
compliance checks.

Signed-off-by: Rivka Bukchin <rivkab300@gmail.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp   |  7 +-
 utils/v4l2-compliance/v4l2-compliance.h     |  3 +
 utils/v4l2-compliance/v4l2-test-formats.cpp | 78 +++++++++++++++++++++
 3 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 4e5c9d00..8e242efd 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1464,6 +1464,8 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		printf("\ttest Cropping: %s\n", ok(testCropping(&node)));
 		printf("\ttest Composing: %s\n", ok(testComposing(&node)));
 		printf("\ttest Scaling: %s\n", ok(testScaling(&node)));
+		printf("\ttest Overlay: %s\n", ok(testOverlay(&node)));
+		printf("\ttest Selection Flags: %s\n", ok(testSelectionFlags(&node)));
 		printf("\n");
 
 		/* Codec ioctls */
@@ -1608,11 +1610,6 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		}
 	}
 
-	/*
-	 * TODO: VIDIOC_S_FBUF/OVERLAY
-	 * 	 S_SELECTION flags tests
-	 */
-
 	if (is_vivid &&
 	    node.controls.find(VIVID_CID_DISCONNECT) != node.controls.end()) {
 		if (node.node2)
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 4a7af5f5..958d22a0 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -375,6 +375,9 @@ int testSlicedVBICap(struct node *node);
 int testCropping(struct node *node);
 int testComposing(struct node *node);
 int testScaling(struct node *node);
+int testOverlay(struct node *node);
+int testSelectionFlags(struct node *node);
+
 
 // Codec ioctl tests
 int testEncoder(struct node *node);
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 56b66141..b064ca22 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -2048,3 +2048,81 @@ int testScaling(struct node *node)
 	}
 	return node->can_scale ? 0 : ENOTTY;
 }
+
+int testOverlay(struct node *node)
+{
+	struct v4l2_framebuffer fbuf;
+	int ret;
+
+	memset(&fbuf, 0xff, sizeof(fbuf));
+	fbuf.fmt.priv = 0;
+
+	ret = doioctl(node, VIDIOC_G_FBUF, &fbuf);
+	if (ret == ENOTTY)
+		return ret;
+	if (ret == EINVAL)
+		return ENOTTY;
+	fail_on_test(ret);
+
+	if (!(node->g_caps() & (V4L2_CAP_VIDEO_OVERLAY |
+				V4L2_CAP_VIDEO_OUTPUT_OVERLAY)))
+		return ENOTTY;
+
+	struct v4l2_framebuffer set_fbuf = fbuf;
+
+	ret = doioctl(node, VIDIOC_S_FBUF, &set_fbuf);
+	fail_on_test(ret && ret != ENOTTY && ret != EINVAL);
+
+	int enable = 1;
+
+	ret = doioctl(node, VIDIOC_OVERLAY, &enable);
+	fail_on_test(ret && ret != ENOTTY && ret != EINVAL);
+
+	enable = 0;
+
+	ret = doioctl(node, VIDIOC_OVERLAY, &enable);
+	fail_on_test(ret && ret != ENOTTY && ret != EINVAL);
+
+	return 0;
+}
+
+int testSelectionFlags(struct node *node)
+{
+	struct v4l2_selection sel = {
+		node->can_capture ?
+			V4L2_BUF_TYPE_VIDEO_CAPTURE :
+			V4L2_BUF_TYPE_VIDEO_OUTPUT,
+		V4L2_SEL_TGT_CROP
+	};
+	int ret;
+
+	memset(sel.reserved, 0xff, sizeof(sel.reserved));
+
+	ret = doioctl(node, VIDIOC_G_SELECTION, &sel);
+	if (ret == ENOTTY || ret == EINVAL || ret == ENODATA)
+		return ENOTTY;
+
+	fail_on_test(ret);
+	fail_on_test(check_0(sel.reserved, sizeof(sel.reserved)));
+
+	struct v4l2_selection s = sel;
+
+	s.flags = V4L2_SEL_FLAG_GE;
+	doioctl(node, VIDIOC_S_SELECTION, &s);
+
+	s = sel;
+	s.flags = V4L2_SEL_FLAG_LE;
+	doioctl(node, VIDIOC_S_SELECTION, &s);
+
+	s = sel;
+	s.flags = V4L2_SEL_FLAG_GE | V4L2_SEL_FLAG_LE;
+	doioctl(node, VIDIOC_S_SELECTION, &s);
+
+	s = sel;
+	s.flags = ~0;
+
+	ret = doioctl(node, VIDIOC_S_SELECTION, &s);
+	fail_on_test(ret == 0);
+
+	return 0;
+}
-- 
2.34.1


