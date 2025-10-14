Return-Path: <linux-media+bounces-44470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B0BDAD33
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD4E15476CA
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B748730B50C;
	Tue, 14 Oct 2025 17:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIhUzd0R"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EFA308F31
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463679; cv=none; b=EnTvPGNnv50hUWR7VxjD5ZuG+etj1p9bIJgb/UtgYf9UfxJ/WzMGVKGNFtDqTjTydh9V3wqbKmy79xtbqoJliot3aP23SmqbkatMcn1yJrF/85mD1JNJSksd++fc8ynAj3fA9etxuNcXycRiPMEK5IwhSxFe/n5HIQHd3ofzUjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463679; c=relaxed/simple;
	bh=rG+rssOuX5tICIaOGOj3qRD7OfL8knvv7rPwORJRvdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPP7OHFhEtve6xUfPbFW/Y+/84XC3EIdpaJ6G7L8s/mr96+uYG25E39eghvQ6p9Rk8GlFHmpaOpaAYsyF+mazDyTSjeybJ11vqXVKIxKLM3XncpJj3w2QxRJB7HL8rkAFjU6ZWG+TNA4+D7kKd5lUCYQyYot5WdR5NCTabcvznU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIhUzd0R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B56EC4CEF9;
	Tue, 14 Oct 2025 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463678;
	bh=rG+rssOuX5tICIaOGOj3qRD7OfL8knvv7rPwORJRvdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vIhUzd0RcDTcnyhL9hehnXjxNczJVtSw5xZiNaU4MZ2hV4/GgPqtxpBAZNJa/n7ad
	 ayVIcWIUk1ge7D0VqFrWxY2wy5MSaKwBZAajLfHMZKqbstoVPyQr0Y72tvnxhBfWdW
	 Chj2kIZ2LHke+YkWRG6ScCqmCuGxLGvkXJ24QFQSVeKh9GH50sT23/7I3K0asCAFgg
	 RDUU0f6HhgP79z1RSB+35ZdBm16VDAyeAOJdPYUzYAOUX9rn6FwJYQQbxtG8dN5UMs
	 qxZr8VqJauL3EorJpnj+MnEgd4D7/0136NDbErKx421fWVix4W3eNmi/mOaknWpzpg
	 /b1UovOgGg2Qg==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 23/25] media: i2c: ov01a10: Add ov01a1b support
Date: Tue, 14 Oct 2025 19:40:31 +0200
Message-ID: <20251014174033.20534-24-hansg@kernel.org>
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

Add support for the ov01a1b model which is the exact same sensor as
the ov01a10 without a color-filter.

Note since there is no color-filter there is also no need to shift
the crop-window when flipping, so the crop window set by userspace may
cover the full sensor (border_size=0).

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 40756e4d6301..6ddfb8f79b55 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -1103,8 +1103,17 @@ static const struct ov01a10_sensor_cfg ov01a10_cfg = {
 	.invert_vflip_shift = false,
 };
 
+static const struct ov01a10_sensor_cfg ov01a1b_cfg = {
+	.model = "ov01a1b",
+	.bus_fmt = MEDIA_BUS_FMT_Y10_1X10,
+	.pattern_size = 2, /* Keep coordinates aligned to a multiple of 2 */
+	.border_size = 0,
+	.format1_base_val = 0xa0,
+};
+
 static const struct acpi_device_id ov01a10_acpi_ids[] = {
 	{ "OVTI01A0", (uintptr_t)&ov01a10_cfg },
+	{ "OVTI01AB", (uintptr_t)&ov01a1b_cfg },
 	{ }
 };
 
-- 
2.51.0


