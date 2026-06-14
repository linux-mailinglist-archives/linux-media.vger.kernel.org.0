Return-Path: <linux-media+bounces-64792-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5IlWIlipLmq51gQAu9opvQ
	(envelope-from <linux-media+bounces-64792-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:15:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D0B6811D2
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:15:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FrWWixoD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64792-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64792-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84CD8304149B
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 13:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF803603D9;
	Sun, 14 Jun 2026 13:10:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09031A681C
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:10:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781442623; cv=none; b=BavYPkW0ATVpG0W6PtURSalP+nSpBE1NqdOZHYwuUYGD2pL7FvSTc7RTjYgxkzNh9as4p21dd9JYmn8/OaNfzwqbdyXomWxow1Gfl7XAMBRn4oNNA51jIwswL92GSqx4RwB8kxiJ/QZszeIK2SJ8lcd/SACHAsFsW8eSY+Z8PX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781442623; c=relaxed/simple;
	bh=4de0iH1hxmw0RrIZy9MhVw+IN2gYqEuXESsum1x+fww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cd0C+/FiwNiazzW3uME73nswJkkYCx2Vg+Wf0DK36Srhv+rqQiSHvpXn0C/88mBbvQQvIdD/pWEVMAQHQhxPnrJgXOjwKGbVQEI7S8tOc0gT5n+G1RZqagb4UaYcw0nPM5kfbTyR7Rls8kUpANYbBwWwgozhbvkfLbDTLUul2zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrWWixoD; arc=none smtp.client-ip=209.85.222.181
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9157b895c57so231963385a.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781442617; x=1782047417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJpu5i70KzzzFRdB2RQuMRBjZ2Ekssr7dUppZeDYSDo=;
        b=FrWWixoDPPxVlIZwS3Gz3Oy48H4VaMXClvFFLyiTMIcAXg/oBCg8U9q2ljpZH+wj+D
         MI5R3DnWdpih6Sc0G01EWMK9l1MwCTLZzrQs8DLaFHmqdh/+9iMWF76l0X2sMkZPtApF
         70e7Et/K8b96TQxB4j1YkGAP+pYAQkHKl3vo8qp7vXdAEHi94Bb9hluVecxpK0wS5J3T
         UM33Vp/W9dT6GKiD5ABwQDqY7uFPdngF4StoYlltGXRZb3kYzBFWH5Xyt6nDRmdBKyIQ
         8dwdr9wk/vI4ZnaQV3+xLyTzViKARHUVmUxb5wz6utSMj4B13+0pn4yMbEKKUXGKmEnD
         t3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442617; x=1782047417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eJpu5i70KzzzFRdB2RQuMRBjZ2Ekssr7dUppZeDYSDo=;
        b=ZcQnnSdPZqqyEgTXSRTuDUASIkskq4B5Fr2v3ccL4qIh/AGp8G+YduxtbJzZzebNSD
         8dI9syuTR7PmLJ+oRe3JemonuIsv3AEN2sbUmNLI3j1Jk5dAQAarP5VuckUW6+Xbd3aA
         Tu0PfbyWDPZdSKcKsLuwYFrkgGYydbBUqGSDcPN342h8ZETmO7AvIlpaZM7cqwlO+2nN
         8R/2YuTOrY6kqKcq4qRAxgHbBPz59o3DooxKegoVTRzM3AEM9vclTYQJCsSWQgr/whsV
         uPRX94ZBSM0C+T0FvBwDU+nMQCvIA4dIgKHw858L8rxkT24gFg5yH/e0QRCfFUyxwLLd
         B02g==
X-Forwarded-Encrypted: i=1; AFNElJ+x15htT3B+KLWvglbqQePfJN8ENrHFVMZQ36kb9qjtiQxP0iuNKZV2sVy4O3xVWEu6C7DEGLburGj3kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0zm6EFDP5K0DIpM4M/C7tNMHbL5rQwl9MT0kUBq6pePbxWf46
	87DA/EKTBGZV9XjC/Rt75cdMGuD9Kxh9NdeNVD3bZ8H4m6DUTgBKSBhzLTJ9Uc7ZcWE=
X-Gm-Gg: Acq92OE/hsiqguRIh65jwq0v4IqOoz+HMS3qNaF5741bfHOyzc0nI83/l6eCabfCGeW
	9JtgftXRoE/Y/bHMR/b+sxtpcTmKMcPD9jfYoUSD2wqbN775QL8G171DGNgdJXa25n2mvn9Q3Mb
	2Uj4gGc9ohJUB0mAB4C6/s/WbXKL1l2Q8AWFzmKvnRy5qeyf6xxeobVVnSUd5Va6zi5jAUGpwBr
	4jcYVB7MBJCYgfRD9uRoZ104Eb3Z04eFXPScpokzEamQWg3h0DfatnTFBh1eW4teLrvgRihtj8D
	7p1mA5AkBL2OcEx2unubq4qJmnHe0UQjpsDqHMNcCslFb5g2oIalFxNNdGTOK0HEY754V1vQA8g
	5omdzfXBA3lWshQwEnL6Xz4v7k8kDSJroyzBDDKftGw/ptI7xEIUG341LftVwNl5Dx9F1b8r6+N
	4H/G/HQKnI5DM1Ep6/aaZNOfpme8ClWBArEuj4XRC2dYUTFenFYlga+0rOdzCWPHP0SHG8EEH4c
	Gbkp0PGKSO7O9qEHmxC3NzxMrb6U9xk1zywlp6pj98=
X-Received: by 2002:a05:620a:414a:b0:915:6e30:5bd8 with SMTP id af79cd13be357-917ee4d8cf8mr1102847085a.11.1781442616705;
        Sun, 14 Jun 2026 06:10:16 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm752878985a.15.2026.06.14.06.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:10:16 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] media: v4l2-ctrls: add KUnit tests for compound control tile validation
Date: Sun, 14 Jun 2026 09:10:03 -0400
Message-ID: <20260614131003.2524025-7-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614131003.2524025-1-michael.bommarito@gmail.com>
References: <20260614131003.2524025-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64792-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:sebastian.fricke@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8D0B6811D2

Drive std_validate_compound() with crafted HEVC PPS and AV1 frame controls
and assert that out-of-range tile counts and a zero AV1 tile_cols are
rejected with -EINVAL while in-range values pass. The tests are #included
at the end of v4l2-ctrls-core.c to reach the static helper, gated by
CONFIG_V4L2_CTRLS_KUNIT_TEST.

Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
The tests are #included at the end of v4l2-ctrls-core.c so they can reach
the static helper, gated by CONFIG_V4L2_CTRLS_KUNIT_TEST. Run under KASAN
on x86_64 they fail on the stock validator and pass after patch 1.

 drivers/media/v4l2-core/Kconfig               |  12 ++
 .../media/v4l2-core/v4l2-ctrls-core-test.c    | 119 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   4 +
 3 files changed, 135 insertions(+)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core-test.c

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index d50ccac..04b15d8 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -3,6 +3,18 @@
 # Generic video config states
 #
 
+config V4L2_CTRLS_KUNIT_TEST
+	bool "KUnit tests for V4L2 compound control validation" if !KUNIT_ALL_TESTS
+	depends on VIDEO_DEV && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  This builds KUnit tests for the stateless-codec compound control
+	  validation in std_validate_compound(). They check that out-of-range
+	  HEVC/AV1 tile counts and parameter-set / tile indices are rejected
+	  before driver code consumes them as array indices or loop bounds.
+
+	  If unsure, say N.
+
 config VIDEO_V4L2_I2C
 	bool
 	depends on I2C && VIDEO_DEV
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core-test.c b/drivers/media/v4l2-core/v4l2-ctrls-core-test.c
new file mode 100644
index 0000000..6ec48fc
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core-test.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * KUnit tests for HEVC/AV1 tile-count validation in std_validate_compound().
+ * #included at the end of v4l2-ctrls-core.c to reach the static helper.
+ */
+
+#include <kunit/test.h>
+
+static int call_validate_compound(enum v4l2_ctrl_type type, void *payload,
+				  u32 elem_size)
+{
+	struct v4l2_ctrl ctrl = {
+		.type = type,
+		.elem_size = elem_size,
+	};
+	union v4l2_ctrl_ptr ptr = { .p = payload };
+
+	return std_validate_compound(&ctrl, 0, ptr);
+}
+
+/* HEVC PPS: num_tile_columns_minus1 / num_tile_rows_minus1 bounds. */
+static void v4l2_ctrls_hevc_pps_tile_cols(struct kunit *test)
+{
+	struct v4l2_ctrl_hevc_pps *pps;
+
+	pps = kunit_kzalloc(test, sizeof(*pps), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pps);
+
+	pps->flags = V4L2_HEVC_PPS_FLAG_TILES_ENABLED;
+
+	/* In range: count == array capacity (minus1 == capacity - 1). */
+	pps->num_tile_columns_minus1 = ARRAY_SIZE(pps->column_width_minus1) - 1;
+	pps->num_tile_rows_minus1 = ARRAY_SIZE(pps->row_height_minus1) - 1;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_HEVC_PPS, pps,
+					       sizeof(*pps)),
+			0);
+
+	/* Out of range: one past the column array. */
+	pps->num_tile_columns_minus1 = ARRAY_SIZE(pps->column_width_minus1);
+	pps->num_tile_rows_minus1 = 0;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_HEVC_PPS, pps,
+					       sizeof(*pps)),
+			-EINVAL);
+
+	/* Out of range: maximal attacker value. */
+	pps->num_tile_columns_minus1 = 0xff;
+	pps->num_tile_rows_minus1 = 0xff;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_HEVC_PPS, pps,
+					       sizeof(*pps)),
+			-EINVAL);
+}
+
+/* AV1 frame: tile_cols / tile_rows bounds and non-zero requirement. */
+static void v4l2_ctrls_av1_frame_tile(struct kunit *test)
+{
+	struct v4l2_ctrl_av1_frame *f;
+
+	f = kunit_kzalloc(test, sizeof(*f), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, f);
+
+	/* In range: a 1x1 tiling (a zeroed frame is otherwise valid). */
+	f->tile_info.tile_cols = 1;
+	f->tile_info.tile_rows = 1;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			0);
+
+	/* In range: maximal legal tile_cols / tile_rows. */
+	f->tile_info.tile_cols = V4L2_AV1_MAX_TILE_COLS;
+	f->tile_info.tile_rows = V4L2_AV1_MAX_TILE_ROWS;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			0);
+
+	/* Out of range: tile_cols past the array. */
+	f->tile_info.tile_cols = V4L2_AV1_MAX_TILE_COLS + 1;
+	f->tile_info.tile_rows = 1;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			-EINVAL);
+
+	/* Out of range: maximal attacker value. */
+	f->tile_info.tile_cols = 0xff;
+	f->tile_info.tile_rows = 0xff;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			-EINVAL);
+
+	/* Divide-by-zero guard: tile_cols == 0 must be rejected. */
+	f->tile_info.tile_cols = 0;
+	f->tile_info.tile_rows = 1;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			-EINVAL);
+}
+
+static struct kunit_case v4l2_ctrls_test_cases[] = {
+	KUNIT_CASE(v4l2_ctrls_hevc_pps_tile_cols),
+	KUNIT_CASE(v4l2_ctrls_av1_frame_tile),
+	{}
+};
+
+static struct kunit_suite v4l2_ctrls_test_suite = {
+	.name = "v4l2-ctrls-compound",
+	.test_cases = v4l2_ctrls_test_cases,
+};
+
+kunit_test_suite(v4l2_ctrls_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for V4L2 stateless-codec compound control validation");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 25227d9..8debd0e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -2851,3 +2851,7 @@ int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
 	return hdl->error;
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_fwnode_properties);
+
+#if IS_ENABLED(CONFIG_V4L2_CTRLS_KUNIT_TEST)
+#include "v4l2-ctrls-core-test.c"
+#endif
-- 
2.53.0


