Return-Path: <linux-media+bounces-48381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 571B3CACC94
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 11:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E56E4307F8D7
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 10:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C058830FC19;
	Mon,  8 Dec 2025 09:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MrLOPVal"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3842E973F;
	Mon,  8 Dec 2025 09:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765187559; cv=none; b=eX282PuE3qrmOvpo/jrpvaNW9zmk6JkjKYEf+trFINK5NJAGJWrMl90zS+N3p2ZKB9xInP3crDqvR4vP2vKGTILueXhHlXjpzVFp0KOFulexIfo9rRUzyNsHPqkgX9ERCIgYCrxkDAmvUTKC9tzLa74dS5+e/Dgw5t3pTrnFqKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765187559; c=relaxed/simple;
	bh=bA+q+Yi8Osgb3E8rTTeSZMrghpJv7Hc1ZPkVJR6ZoG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z/maT4BP1zk6ZqANkBMg3xl14//L9kwrjwvvtq7Cuobh9/X02WlhlAFz0QUJyjYpKZYx8CxwUhYuCtRfCLL0xNH7KSX+rlJkv6yDGOl4QX97Dy0vIv8fByFTjeSDA960fUggFCLqiwcJYCMx3RPy7hamGawp0Jmj6rng/EGEZrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MrLOPVal; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765187555;
	bh=bA+q+Yi8Osgb3E8rTTeSZMrghpJv7Hc1ZPkVJR6ZoG4=;
	h=From:To:Cc:Subject:Date:From;
	b=MrLOPValK8BZHH9ppnq4ze3WD+B/pEBdXvmySMreAB1HExjKACxyUVWH6DHuajtUJ
	 ab4zNuKw2gMQTIzK4/PibHBoT8bSvcUeaEF1pLHnAl9eLjB6UXNqC9u2+ZxpJEKFut
	 Cgz3zHhMS/HLpS5rgeVDL85hJD0p92KtqXeSFuNM54JX0PProUwV5ne/qBWWvlxeTB
	 HG3MyzzLVoti3O0WFQl8EYM3D7MB1i36nYih5Vhk8AMwAQgw7eE/G2Qk56N8sf4nFM
	 1f9ebGzpA+xfRgnc436+5YrvpgHKVI3fW92REXLx1ijkSWGluaNA+U4bc+9B71hCdG
	 moSdqe9/gI4Og==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:e493:1c28:b2b2:21dc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC31A17E0EFA;
	Mon,  8 Dec 2025 10:52:34 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: AV1: Fix enable cdef computation
Date: Mon,  8 Dec 2025 10:52:26 +0100
Message-ID: <20251208095227.19720-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Testing V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF flag isn't enough
to know if cdef bit has to be set.
If any of the used cdef fields isn't zero then we must enable
cdef feature on the hardware.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
---
 .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4703bb6be7c..f4f7cb45b1f1 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -1396,8 +1396,16 @@ static void rockchip_vpu981_av1_dec_set_cdef(struct hantro_ctx *ctx)
 	u16 luma_sec_strength = 0;
 	u32 chroma_pri_strength = 0;
 	u16 chroma_sec_strength = 0;
+	bool enable_cdef;
 	int i;
 
+	enable_cdef = !(cdef->bits == 0 &&
+			cdef->damping_minus_3 == 0 &&
+			cdef->y_pri_strength[0] == 0 &&
+			cdef->y_sec_strength[0] == 0 &&
+			cdef->uv_pri_strength[0] == 0 &&
+			cdef->uv_sec_strength[0] == 0);
+	hantro_reg_write(vpu, &av1_enable_cdef, enable_cdef);
 	hantro_reg_write(vpu, &av1_cdef_bits, cdef->bits);
 	hantro_reg_write(vpu, &av1_cdef_damping, cdef->damping_minus_3);
 
@@ -1953,8 +1961,6 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_SHOW_FRAME));
 	hantro_reg_write(vpu, &av1_switchable_motion_mode,
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWITCHABLE));
-	hantro_reg_write(vpu, &av1_enable_cdef,
-			 !!(ctrls->sequence->flags & V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF));
 	hantro_reg_write(vpu, &av1_allow_masked_compound,
 			 !!(ctrls->sequence->flags
 			    & V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND));
-- 
2.43.0


