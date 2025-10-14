Return-Path: <linux-media+bounces-44471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEDDBDAD21
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 176EC3558A6
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FCF3054E4;
	Tue, 14 Oct 2025 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0VUVwRO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811C2308F31
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463680; cv=none; b=chNvQ7EgkJSJIqh3lI7OM/8Ql4GJV/B3Pc/6pl53+eoIziwf9Wl/hFjNh25OwVH2cQylUOPYmhNygFSQT+DAxwjhVkiaMR30dGlhcucplT6ZFq3rdDYRyS+pIDyZfIY4dVQc9xxa1mXfm74z3fbR5uUERQhg3Sbh1JCvRMABrgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463680; c=relaxed/simple;
	bh=FMVVhCAzTDhHS8INRl6gM3bKcRPgIj8RCQBBtak7Oj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSl1mLvbRmYcvDqTOHj6jaY717LTPPwFvF1AxF+juqSBcfAO7UeylpBGxw5jEyGukOVc1lrKlv2t24mV1e6v88bCoFcVjPiK4bk8LVqA+3XuJdEWZseuARO3iamH95Kn3GscfmSOV1wjFUEp3+YEoXxKA1fPAyIBo6GciLuduKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0VUVwRO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A838C113D0;
	Tue, 14 Oct 2025 17:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463680;
	bh=FMVVhCAzTDhHS8INRl6gM3bKcRPgIj8RCQBBtak7Oj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0VUVwROVEVJJrlCBNuYUJHsSEQDwIkkfsccMKwVzTi6VnGUcKJmvoKesxq4BfJ8d
	 bb9K2fOCZwWBn9BpdHR1gmuxdd1L3P4tMtd+pqpD188LK1U+HeXWJMlVxX8TCTxL4S
	 xsU+r73Wdq3k3nmq/rp5ONfkALHpPpnUwNqExE61KyszEH5XIy4euMxgsXX+siNtC1
	 RWd9HdP6S/PYtBBAu4f8Yx0Tu+WU3zrWt63fghQ32x1SNtRdQ42fgyhANlW/HT0bHV
	 nFQrt6RCHVv3rB+P3csz0ghIjbw5qUCtTbK3j6ZXK5opZWBPKnw/hUjINuHVDxUQQe
	 fa68jPDSBj3XA==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 24/25] media: i2c: ov01a10: Add ov01a1s support
Date: Tue, 14 Oct 2025 19:40:32 +0200
Message-ID: <20251014174033.20534-25-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ov01a1s sensor is the exact same sensor as the ov01a10 with a different
(RGBI) color-filter.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Note I'm not sure if we should apply this one as is and fixup
the reported mbus-format + add a bayer-order v4l2-control later
or if we delay merging until we can do it correct right away.
---
 drivers/media/i2c/ov01a10.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 6ddfb8f79b55..058ff311a289 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -1111,9 +1111,31 @@ static const struct ov01a10_sensor_cfg ov01a1b_cfg = {
 	.format1_base_val = 0xa0,
 };
 
+/*
+ * The native ov01a1s bayer_pattern is GRGB-IGIG-GBGR-IGIG but Intel's
+ * proprietary IPU6 userspace stack expects IGIG-GBGR-IGIG-GRGB. So we
+ * generate this by shifting the crop window-y coordinate by 1 when
+ * vflip is *disabled*.
+ */
+static const struct ov01a10_sensor_cfg ov01a1s_cfg = {
+	.model = "ov01a1s",
+	/*
+	 * FIXME this obviously is wrong, this needs to be changed to
+	 * MEDIA_BUS_FMT_RAW10_1x10 + reporting the proper bayer-order through
+	 * a v4l2-control once the sensor internal pads series has landed.
+	 */
+	.bus_fmt = MEDIA_BUS_FMT_SGRBG10_1X10, /* really IGIG-GBGR-IGIG-GRGB */
+	.pattern_size = 4, /* 4x4 */
+	.border_size = 4,
+	.format1_base_val = 0x80,
+	.invert_hflip_shift = false,
+	.invert_vflip_shift = true,
+};
+
 static const struct acpi_device_id ov01a10_acpi_ids[] = {
 	{ "OVTI01A0", (uintptr_t)&ov01a10_cfg },
 	{ "OVTI01AB", (uintptr_t)&ov01a1b_cfg },
+	{ "OVTI01AS", (uintptr_t)&ov01a1s_cfg },
 	{ }
 };
 
-- 
2.51.0


