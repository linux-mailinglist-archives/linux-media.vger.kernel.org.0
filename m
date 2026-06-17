Return-Path: <linux-media+bounces-65080-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /3UKLggFMmpMtwUAu9opvQ
	(envelope-from <linux-media+bounces-65080-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:23:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECEF6961CD
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:23:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iLjO7mkN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65080-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65080-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7D5F30C2753
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 02:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE38E31C57B;
	Wed, 17 Jun 2026 02:19:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF8931A555
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:19:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662785; cv=none; b=U5QdJ+GZEACA9f4eRuunFK72ex/bTkRKTBGgCsj4AU6HC+wLIylcOqf6YCNLT7ymOkz1kiaxAcVAg+lNkZpgP1OhOG8kIVwjKDBZQ9bcDsyBoiwyOIYZKW/Z//Sp0WB8ZR44kM88b5OYtyDAYVrs0xo2J2GgPmfi311izoLWEeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662785; c=relaxed/simple;
	bh=/xoZPm1Cn9syxIHKnalOBoCsPhZrvdApypT5RqFCzoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZ3Lwz43Km4o1EqE/JJx/+5nbcdg4n/i3oqSikWrwXVSN71bSjgqtHjPTieTGnIDuWDUysm5KfyQE7ZPObVK6WwhxLnVBZGJTch1QH5bv4tivs2aI1Rd4InVuEH/vrYlIcaHUMNghxHzt3ylbAjPEqkvpJiNB6sB9mg/r1zsNco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLjO7mkN; arc=none smtp.client-ip=209.85.222.170
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9158643e538so468291385a.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 19:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662782; x=1782267582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nliXYvoRQ3wSjHuqpNr9lxWmoUaal/xuLZ8F2phbi/s=;
        b=iLjO7mkNFRUDYCwBOZXWILk9/PyMJa2xK0FhA/cGo0nYvxiS5AwrS1KrfTJpOPl7Jy
         a/JjVQ5wlLISxAWKTCFbHUZMSz4gcRP6Iv6MNm5lXGrhg7PL0K4kjxjAcJR3gtpuyJg5
         M64Pfq7KgDrRRqbtQrpH4Ft00E7gfQbNAZkys5obwUnsEZpLFASgdXzhqXsCqE1rF4sk
         B21OwMHrz2Ha71NSV45uOPYV70lHtAmN2SFCv+2RsEtHifSGJxAy/30kD/Di8XeQO3sU
         wGv9DnhFPUVK1uVLZR9BY7NhlEROxi7cFRE7PtkPj2zGy7UewTRzT+2kMreD+6OpFjnp
         u4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662782; x=1782267582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nliXYvoRQ3wSjHuqpNr9lxWmoUaal/xuLZ8F2phbi/s=;
        b=LsbUqO5yKGlQwSONL8Xo2RvtF+fZpY6tBZCXJgM2zYqcZl2AxDe1y/NAEXIgcZaPzN
         4JmVYPQ/jpBXwhPRQCAVRrtTFFTQ90heMmjblOb6hvyLbPHfAUV7UrI7b741AYcx5iXL
         W0Q2VqdNv/q7x+nR7ckLXfwphtePK5qhueicaOHIV4C2QaGKRzolhZdazOuDJGRUPEU0
         1dXLgN0pwzyW92kDl83nCOuOl0UfuNPrCjav0TJhlf1FFGWoMMOTBQKnAYwRqu7p/t+4
         CnFoIhJuUJLAOKc87d1nQnS4z0QkTcF4wIg6sl7r8ZieJc+qy4epBIl07T95ATbX6Wli
         uOgA==
X-Forwarded-Encrypted: i=1; AFNElJ/XBTkp3zmXiP2GfHF0lLsfyoLjFX71wP3v+sdmJwJOsAyh2WSmQmSwOkHrVqfphBCZ8a92uHEOHCbLFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw399LQmMQIu0uZboOBPwnbyCRyFQCFL9kRBoW4Gj/UhAW7eICC
	6+PDXEntC4ER5tJok2s2NY+ri7jk09uVR6woDkNVb/j5A2G0RuAKRK9dZX8dcij/LnE=
X-Gm-Gg: Acq92OHL5G5ro/eQGubfFS26MHNIsR9nSks+cudhXhR7Bf8PetMitx7YsKoUXen1d4W
	dIR5XkXZgv1hQs6xfwRra213GfMrYMcgmBBCToOu63VaRUndFtSYYA6XUY7RCBFVSvBcwcvwWzN
	s4j9pA3TJKRY+sijFy+hThhxH/zVVPt/vnao04KTYMxkYec+4tG+HbKktmp1uXgcF8qsUISzoqN
	J90N/6ElooHfNotCPFhRhx78ih07+79dpKncHb3+9/dJm3G8PpnGka9GAv/kQF+b5VfKkux2oVn
	JICm+z0SNR/vFIm3QntI7SfV5xRbmAo3MHyRLt8hR+zEkTKOiWFQOmHRIDSE0H/XwxdtXg002hC
	qKWK/r6C/xwtFMRsv1DOjl/iDIjbzf8GRMF4c1ZJaEq96uZzHlc/PAjRfWOFBVg7xAxYx1cF1Yp
	MVfSSui0kxKOuzd4JC8apRuWmclZCq+pvvYrFvykbLLGBbqIRcBkFdPHFEX5mOGkTS6LSmPMGds
	z/hZD61KIRJT+xw+DDSENiue9MSY5COm1nd3oRb6PA=
X-Received: by 2002:a05:620a:258d:b0:915:8f76:8029 with SMTP id af79cd13be357-91dbc52d1b4mr268487985a.44.1781662782028;
        Tue, 16 Jun 2026 19:19:42 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:41 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
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
Subject: [PATCH v3 9/9] media: v4l2-ctrls: add KUnit tests for compound control tile validation
Date: Tue, 16 Jun 2026 22:19:06 -0400
Message-ID: <20260617021906.2746743-10-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65080-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2ECEF6961CD

Add KUnit coverage for the HEVC and AV1 tile-count checks in
std_validate_compound(): in-range counts pass, out-of-range per-dimension
counts and an AV1 grid whose product exceeds V4L2_AV1_MAX_TILE_COUNT are
rejected, and the zero-initialised AV1 frame control that userspace
submits still passes.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/v4l2-core/Kconfig               |  12 ++
 .../media/v4l2-core/v4l2-ctrls-core-test.c    | 145 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   4 +
 3 files changed, 161 insertions(+)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core-test.c

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index d50ccac9733cc..52c00dfe9322f 100644
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
+	  HEVC and AV1 tile counts are rejected before the stateless decoders
+	  consume them as loop bounds and array indices.
+
+	  If unsure, say N.
+
 config VIDEO_V4L2_I2C
 	bool
 	depends on I2C && VIDEO_DEV
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core-test.c b/drivers/media/v4l2-core/v4l2-ctrls-core-test.c
new file mode 100644
index 0000000000000..c0141f3defa82
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core-test.c
@@ -0,0 +1,145 @@
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
+/* AV1 frame: tile_cols / tile_rows upper bounds. */
+static void v4l2_ctrls_av1_frame_tile(struct kunit *test)
+{
+	struct v4l2_ctrl_av1_frame *f;
+
+	f = kunit_kzalloc(test, sizeof(*f), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, f);
+
+	/*
+	 * Benign control: a zero-initialised frame (tile_cols == 0) must
+	 * still pass. Userspace and v4l2-compliance set the zeroed default,
+	 * and the divisor that a zero tile_cols would feed is guarded in the
+	 * consuming driver rather than rejected here.
+	 */
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			0);
+
+	/* In range: a 1x1 tiling. */
+	f->tile_info.tile_cols = 1;
+	f->tile_info.tile_rows = 1;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			0);
+
+	/*
+	 * In range: total tiles == V4L2_AV1_MAX_TILE_COUNT with each
+	 * dimension at or below its per-dimension maximum (64 * 8 == 512).
+	 */
+	f->tile_info.tile_cols = V4L2_AV1_MAX_TILE_COLS;
+	f->tile_info.tile_rows = V4L2_AV1_MAX_TILE_COUNT / V4L2_AV1_MAX_TILE_COLS;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			0);
+
+	/*
+	 * Out of range: each dimension is legal on its own but the product
+	 * exceeds V4L2_AV1_MAX_TILE_COUNT (64 * 64 == 4096 > 512), which would
+	 * overflow the per-tile descriptor buffers.
+	 */
+	f->tile_info.tile_cols = V4L2_AV1_MAX_TILE_COLS;
+	f->tile_info.tile_rows = V4L2_AV1_MAX_TILE_ROWS;
+	KUNIT_EXPECT_EQ(test,
+			call_validate_compound(V4L2_CTRL_TYPE_AV1_FRAME, f,
+					       sizeof(*f)),
+			-EINVAL);
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
+	/* Out of range: tile_rows past the array. */
+	f->tile_info.tile_cols = 1;
+	f->tile_info.tile_rows = V4L2_AV1_MAX_TILE_ROWS + 1;
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
index fb20ad13dfec7..1409b06eee0a8 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -2860,3 +2860,7 @@ int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
 	return hdl->error;
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_fwnode_properties);
+
+#if IS_ENABLED(CONFIG_V4L2_CTRLS_KUNIT_TEST)
+#include "v4l2-ctrls-core-test.c"
+#endif
-- 
2.53.0


