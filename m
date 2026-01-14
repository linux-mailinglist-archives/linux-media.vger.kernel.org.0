Return-Path: <linux-media+bounces-50674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C3DD1DE9A
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 103373038510
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88234393DE7;
	Wed, 14 Jan 2026 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IhnVViit"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F51B38F92D;
	Wed, 14 Jan 2026 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385374; cv=none; b=UoNsu8DGiaioe6HeMG3HzenjfawLtzkuZPM1biXCjlSVqneoEeXKdyO5yufJmqhdj2j1lw/3l5rDB/moWxnbEMSSABSsG2XCccGRyIHrSV2s4HbSwiDTznH1XWKzCKskeGjfZ4rQniOEbKOkPYD1TU+5oi55h7NKQHqPs4PP0C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385374; c=relaxed/simple;
	bh=kfoyO6mLrJT+5jwg7vHiUeoqvatV7KVxcH5i/FCsdRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H28D3bhKeEivumfRjuRtWN9geh1omTkD+z5/WTg0ZnAB0SJaaHSbuHkAap8cV2spomJrcAwtoSSWSUazPpJxuzO2YoGz0r1vw0Tw36ZZGnFWZTjj8xJFh1Ium76sSe6cwnf80pDnAtImqHg/p31NwgGJuXtyhWraeBOIefjnQ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IhnVViit; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768385371;
	bh=kfoyO6mLrJT+5jwg7vHiUeoqvatV7KVxcH5i/FCsdRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IhnVViitxQ0X37IQlOUJcltVqn1USTYsKeU+mV4NKl6qBFJaR2LuYrl2B7J4Dw2c8
	 Ov0gO5HpqE1I0MnnVzeZRNGr5WC4jTnQVaskpcGTAvb4dOtoyyqDEQsgJ51KOA8RWU
	 KaStQfxiGLua5E/qy0oaavf75KM0lI6Gagc5kddo3WfqaK4mb++ZN1ekxdhmvDXtYN
	 LQltGJpP0MByFPRT4gOsLIxEnmwFguBttWQ+SpWqPptx0SK8Ymx+OFFVEUY/oePjsu
	 TjZ7MlyOJTiD+aXeNT+eFlNwavQuN+7a0uJs3Y9HlqF65JOyALCUPBgSBe3YRoFs+R
	 OZgq3EMJaqULA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:1dad:60e8:7174:bd20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 04E6C17E1525;
	Wed, 14 Jan 2026 11:09:30 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v12 6/6] arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
Date: Wed, 14 Jan 2026 11:09:18 +0100
Message-ID: <20260114100922.149187-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
References: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Verisilicon IOMMU used by Rockchip RK3588 AV1 hardware codec.
This hardware block could be found in Radxa Rock 5B board.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..4751f7fa8bb0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1525,6 +1525,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_VSI_IOMMU=y
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


