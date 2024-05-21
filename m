Return-Path: <linux-media+bounces-11702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE38C8CB132
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 17:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97E262832BE
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 15:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B42F144D1A;
	Tue, 21 May 2024 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YRcCxUSo"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88514431C;
	Tue, 21 May 2024 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716305173; cv=none; b=dxCylBFF+lmG/v148tuuBbkmHWw3BKtBK+8Fe05riqK6lG4ZR4SFO6IdsOr+B6NpUDPP77KR5aalcbTg0X7xVgoaqSur744XxZ+ZofuFLddDEuKo3ea2kuKwb4p2H0dY9VuES1d1E35G56yiXnFyFCTQNuBU7iXG//9GAFWjRYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716305173; c=relaxed/simple;
	bh=ehEGmLPbdflG9SwAJyNTXNFXo36LoESCFkUyqyn/9rE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Du8cvLHYKwy5eeV18yMONo7zXF/xB6IP9LVzlVAgxnW8O4i3GsDQ3HnQxrU2GaVQRiTXcKYfu/2j608eag8vdcdHtrSl165HMBwSTZKhRmB7XVBsGx3IYWzYfpH+oqe3nJr9wsehvoGG+F6sIaye6b8kIwZhC5Dg6V+VCW8Sb/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YRcCxUSo; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716305169;
	bh=ehEGmLPbdflG9SwAJyNTXNFXo36LoESCFkUyqyn/9rE=;
	h=From:To:Cc:Subject:Date:From;
	b=YRcCxUSoYk2jqtJS2oUMkMYXVP2UsiGWYpj6GvD6ACMAvrMToPH4gjF+lTPCTsjdp
	 AaMBchr/vwUGg/XyzzNA3Efh9iIHJSootB6GzHKCE4MXxaTnrBg3RIng/o9eGXHjyG
	 8auuIIJFlzei0KUr1ce2kFTvMehyHkOHVY1BZ0W4BPckuNRC6a+3H8baySiOBr6KXq
	 ouGAP6zR2tuQ9pq5mlNa4mjm19lowg/gQ1D2dN8TD8duZdYWcKckxtyQumCCglzg9h
	 3XZSYJNZMKTYG7WeeyTTVLWaCOSgD7lBFOEP2myOGOYAfZ8rFAdBwu05eOJ5yYiEgQ
	 k0UYBVDpn7y9w==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 94768378212E;
	Tue, 21 May 2024 15:26:08 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: AV1: Correct some registers fields size or position
Date: Tue, 21 May 2024 17:26:03 +0200
Message-Id: <20240521152603.120723-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some fields aren't well positionned or with incorrect size inside the
hardware registers. Fix them.

That doesn't impact Fluster score test.

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/platform/verisilicon/rockchip_vpu981_regs.h  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
index 182e6c830ff6..990f8e69524a 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
@@ -327,7 +327,7 @@
 
 #define av1_apf_threshold		AV1_DEC_REG(55, 0, 0xffff)
 #define av1_apf_single_pu_mode		AV1_DEC_REG(55, 30, 0x1)
-#define av1_apf_disable			AV1_DEC_REG(55, 30, 0x1)
+#define av1_apf_disable			AV1_DEC_REG(55, 31, 0x1)
 
 #define av1_dec_max_burst		AV1_DEC_REG(58, 0, 0xff)
 #define av1_dec_buswidth		AV1_DEC_REG(58, 8, 0x7)
@@ -337,10 +337,10 @@
 #define av1_dec_mc_polltime		AV1_DEC_REG(58, 17, 0x3ff)
 #define av1_dec_mc_pollmode		AV1_DEC_REG(58,	27, 0x3)
 
-#define av1_filt_ref_adj_3		AV1_DEC_REG(59, 0, 0x3f)
-#define av1_filt_ref_adj_2		AV1_DEC_REG(59, 7, 0x3f)
-#define av1_filt_ref_adj_1		AV1_DEC_REG(59, 14, 0x3f)
-#define av1_filt_ref_adj_0		AV1_DEC_REG(59, 21, 0x3f)
+#define av1_filt_ref_adj_3		AV1_DEC_REG(59, 0, 0x7f)
+#define av1_filt_ref_adj_2		AV1_DEC_REG(59, 7, 0x7f)
+#define av1_filt_ref_adj_1		AV1_DEC_REG(59, 14, 0x7f)
+#define av1_filt_ref_adj_0		AV1_DEC_REG(59, 21, 0x7f)
 #define av1_ref0_sign_bias		AV1_DEC_REG(59, 28, 0x1)
 #define av1_ref1_sign_bias		AV1_DEC_REG(59, 29, 0x1)
 #define av1_ref2_sign_bias		AV1_DEC_REG(59, 30, 0x1)
-- 
2.40.1


