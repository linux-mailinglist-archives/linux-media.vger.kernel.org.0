Return-Path: <linux-media+bounces-50234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B10D03146
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 14:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40E29306EC18
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 13:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0943A481A80;
	Thu,  8 Jan 2026 13:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aTnFmhZ0"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94650481654;
	Thu,  8 Jan 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767878995; cv=none; b=t/Zw8wxD60AIyq1ulxGboRj2YzOc5keLYiXl5cC5BZGTG784Ybun5HcikC+l7pEavxrHniut6R243Npodb33L+E56tefJFknWgvSFp8r71dWU4Miw98/J8E9m6MAIxBCiyndVnKITvGRQH3dBh4bslDOvB2zIgPfioXFelR4Hqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767878995; c=relaxed/simple;
	bh=sIlDWrOUP2JFRN9/cVJwfUTM671Pu56/TH4sEK7QQsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nt/RlFjdm27Gf2QKqBONVvWPJO8WRgb0ynFahVo+5/4Ts3UgkDxox1uWGXxXL6Oddzf9v5i25jJR2OEjymjWxgf+pvnjWJKftmAEEmr1XTEB/ZVHfbwe59WdXkKWLfvaiyD/xS4Ucs4t0RLJAEBTeDNBXsVfDhxI6LaXmsjOMEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aTnFmhZ0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767878991;
	bh=sIlDWrOUP2JFRN9/cVJwfUTM671Pu56/TH4sEK7QQsI=;
	h=From:To:Cc:Subject:Date:From;
	b=aTnFmhZ0lSs1xmPq401SxkkAYGNmeLx0XA7Dwma72H/04axAzuApv70rFYE6IeyTL
	 hctJxmdxCIhurkVDaneGBSdYWiBTB0m177T4vwZ0csGZccXdjlp17XYsvly5q53aK7
	 H7R19w5yIkLQf26oNRd/yqEbpatxVYinEcl/VD41AMLvuS9LKtK7WR59a69Wa2/inN
	 UavydTX76RcsGvPp18Juddycr6zEx4DQtQr+/F2L87G9EG96xaeLDcT6T53Q0y0eqN
	 vIb4qf6sA/J3BBZHfQgxYB6J6E0Jpp78uX6uvoibnxsmp6wotO5nfJ2S9W1g0o22DH
	 VrJyg7tQH4/Kg==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:5c27:a8a7:cb3e:bb4f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74A4B17E0DB7;
	Thu,  8 Jan 2026 14:29:51 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: [PATCH] media: verisilicon: AV1: Set IDR flag for intra_only frame type
Date: Thu,  8 Jan 2026 14:29:46 +0100
Message-ID: <20260108132946.74853-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intra_only frame could be considered as a key frame so Instantaneous
Decoding Refresh (IDR) flag must be set of the both case and not only
for key frames.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reported-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
---
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 1605cfd55d36..3a8123bbe144 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -2047,7 +2047,7 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 			 !!(ctrls->frame->quantization.flags
 			    & V4L2_AV1_QUANTIZATION_FLAG_DELTA_Q_PRESENT));
 
-	hantro_reg_write(vpu, &av1_idr_pic_e, !ctrls->frame->frame_type);
+	hantro_reg_write(vpu, &av1_idr_pic_e, IS_INTRA(ctrls->frame->frame_type));
 	hantro_reg_write(vpu, &av1_quant_base_qindex, ctrls->frame->quantization.base_q_idx);
 	hantro_reg_write(vpu, &av1_bit_depth_y_minus8, ctx->bit_depth - 8);
 	hantro_reg_write(vpu, &av1_bit_depth_c_minus8, ctx->bit_depth - 8);
-- 
2.43.0


