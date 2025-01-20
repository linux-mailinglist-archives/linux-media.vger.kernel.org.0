Return-Path: <linux-media+bounces-24983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C162A16E67
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 15:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14A991883FE3
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951021E32C5;
	Mon, 20 Jan 2025 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UnaTmd9n"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A201DEFD4;
	Mon, 20 Jan 2025 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737383092; cv=none; b=lYPrlYoz+T+CbMxYCXCaV3NE3u4aJaKTlFwyw8N4hSVyFz/zmxISrPPXze803rP9asW5rLaNcs/hwDcjL2j2oFc0OlTmlPZzRyMyIQ/T4JNiec5gvKQ8oACWukajAoCWAYUC7sRQzMPSuM8rbui95AMZXAPRLifTd/2Vaxd7Huw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737383092; c=relaxed/simple;
	bh=xEN0bWBhN34PmKKnNr05BxsqpDPbA8S9/Z0QQD9aIhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RI52+og0VtjZaSuZ8saZ0Jys8vCzbitoWFTTAy4w1VA7HaWYGxb40i6Rv6uyxDpzUjBr0xzXPc1RTz7+nubLI7zNPg+RN0XB0pyILfBXYSMKH9lBsJgKRz/RlJR17oEWAgFwlD79wVAKv9CgUPKJN2jH/XGSMsYEpw2OA2riuN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UnaTmd9n; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737383088;
	bh=xEN0bWBhN34PmKKnNr05BxsqpDPbA8S9/Z0QQD9aIhY=;
	h=From:To:Cc:Subject:Date:From;
	b=UnaTmd9nTH8EAwS2OgQfHOYtJnw8YfJMnCtw8RiBdh1EoBYrT5340LV03xkY5UvEk
	 IIZn2w+RAA/5PJEKrxPeZ7YNbnelWzHUcY3WWcnaK8fkyZm3WcUEu3lsbBzv8jQ7g2
	 puK0sLX2tDu8teAQs+dHVt1i//Lvwtrwf2/FcY9/uZbZoty5wSzTNjcXc3DmOcKGwx
	 gLZz0O0uSp6dUR6jBgarXzv/T0Pg0DlrnSvy5LW4wElcjqepm339brvTXOSasQEt39
	 mw9BCm+SAAtuXETHFymJpjgUlC8SLgWp8V2L4iTTFL6gl1QY/6bKn6BVPjCtbukL0n
	 ICUfBxMK53PSw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:fb75:b420:7f1c:508])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F088317E0ECD;
	Mon, 20 Jan 2025 15:24:47 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2] media: verisilicon: HEVC: Initialize start_bit field
Date: Mon, 20 Jan 2025 15:24:42 +0100
Message-ID: <20250120142442.402624-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Always set start_bit field to 0, if not it could lead to corrupted frames
specially when decoding VP9 bitstreams at the same time since VP9 driver
set it for its own purpose.

Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index 85a44143b378..0e212198dd65 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -518,6 +518,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 	hantro_reg_write(vpu, &g2_stream_len, src_len);
 	hantro_reg_write(vpu, &g2_strm_buffer_len, src_buf_len);
 	hantro_reg_write(vpu, &g2_strm_start_offset, 0);
+	hantro_reg_write(vpu, &g2_start_bit, 0);
 	hantro_reg_write(vpu, &g2_write_mvs_e, 1);
 
 	hantro_write_addr(vpu, G2_TILE_SIZES_ADDR, ctx->hevc_dec.tile_sizes.dma);
-- 
2.43.0


