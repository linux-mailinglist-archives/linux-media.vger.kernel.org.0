Return-Path: <linux-media+bounces-24924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0219A167F0
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 09:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA449169EA3
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 08:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24321922F3;
	Mon, 20 Jan 2025 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YIMCeUPJ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA398189B8B;
	Mon, 20 Jan 2025 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737360669; cv=none; b=XuJjtb3BCUa7vhYG/Pjd97KfhYEk3aiQbn9UvjAmVDk2xILXWxff1pLjvGzSeeZnPtzfLXdjV/RwwMjVvfL0dQ+s9kXcQWwdXKqrLqm1JrUMhbOihaenGEKzbogxTKqH325jiv6ztFY8aKF33JwKx12tDsyPvHdZd+Sr4JASenM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737360669; c=relaxed/simple;
	bh=B6ejVHdkmCKPVaeaHisS+dhhloo5Xrxs/wwTGt9Fhmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mu9yy3aEYD+TwW8FTe5ARO4wDNlFtvV5iqODKXdLsthir2gsrxYLSxZj8tf5fZcJZMPeYMYQ8qlis2W4wI1TM8Chb+WSkIKR9I+jwXR83JYfkkRTro0lzLF6/1aRbP9IcuULtzlpsASiRiB3JJxDWocrPRzgNOvBHtugMYVUjBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YIMCeUPJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737360658;
	bh=B6ejVHdkmCKPVaeaHisS+dhhloo5Xrxs/wwTGt9Fhmc=;
	h=From:To:Cc:Subject:Date:From;
	b=YIMCeUPJRYnLkkkBD5SwxV+TX5PaVqnaX3nzqb/PNQfO7OQw9sE/qOMJ2Mc5Bc1i9
	 2mjY3Z4SJA4N/Mx2p3xUD8Os1yECwblUkzdm9NRfeCbWlXzxprgfvmN5FvCwJ7Qauq
	 Nhgfg6j50Vj+hXICTemSBsUbbhV4LebQYMUtic6uwMvch98KM0TNMZZjUtarog7urc
	 KbILIB2lhvD9iI+S/L7l624U3Gjzzh3OXx84OwajlxpuGlLQXdrfN563iOVL3Ppyzv
	 0o2frXRVrItg1hgZUz4d6DApPuoO+oGdYsfnsYu3fkz2f4PoPheDhvCEQnREMIFc37
	 Ui6t/OqH2EH2w==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:fb75:b420:7f1c:508])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AEAB317E0D72;
	Mon, 20 Jan 2025 09:10:58 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: HEVC: Initialize start_bit field
Date: Mon, 20 Jan 2025 09:10:52 +0100
Message-ID: <20250120081052.63224-1-benjamin.gaignard@collabora.com>
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
set it for it own purpose.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
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


