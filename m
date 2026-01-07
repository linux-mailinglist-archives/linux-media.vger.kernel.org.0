Return-Path: <linux-media+bounces-50120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47537CFD273
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 11:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4976730C9E76
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 10:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424023246FE;
	Wed,  7 Jan 2026 10:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ACCm6TYm"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9735C3148C5;
	Wed,  7 Jan 2026 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767780622; cv=none; b=tZcnGJSjeOve4lxQorGqdFGW8BQDvfQFhZskS9eBR7+XEWSVsUDB5PbW+qxSvhu2nHjMMgBKh890KCntPWViFy7yRo8te4wegw9DwMYpqj/8GyT6DzXSgScGJ0xsLhysN4+TFUL+EAC1zPyJvQgNtEcz5yCYPbKltWJe0f5khI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767780622; c=relaxed/simple;
	bh=kfoyO6mLrJT+5jwg7vHiUeoqvatV7KVxcH5i/FCsdRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CyIOCPc8xwo4Bf+52ZJ836IeWzRgv/JhQ0BWySRRIyVASwO7Z0x9SJX+mCY3l+oTzaJ/G8uAy1/3SIxKvU1xtnL1BTwu+VBqR/H07x8AXYT/DwWN3F1bWgN2ObXGfQGjFxU2/3m8T3iLYSq6EF1QXHHFFh5qVQpV3bkPOCA7IcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ACCm6TYm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767780619;
	bh=kfoyO6mLrJT+5jwg7vHiUeoqvatV7KVxcH5i/FCsdRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ACCm6TYmcyzu/GYMm3AhxMcG8OHrYxyaC6iWb2Skj903U+DZvSlbbfNaOva32Uqdh
	 h9/b3Ecl6xgR/TW9GgHdC0xao16/Ebryvi0Kfo+SHhHa6Lf5qrCtNhCZH1yCLao3g+
	 N8GEsqi6qJNwYXQ7DfFZlg/3BqwZgnmB6d+mhMptwOE/aSY9Gaog+iJ2pmalA8RByT
	 /SS5EaXV4X3Ts7MhlCQEVU99mUyA3wqr7ePdThasYIaI708eDJHZCktd6SzzOv5aVH
	 WbHteMEzAXX4uiB9/bKFyFDBnIgSil5O0laFRi7hnt5sHN/dqe+h0w0MavYUvJ5+CH
	 spOkz1OFfn0EQ==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7e36:2305:d47f:6e43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A635417E36C3;
	Wed,  7 Jan 2026 11:10:18 +0100 (CET)
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
Subject: [PATCH v11 7/7] arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
Date: Wed,  7 Jan 2026 11:09:57 +0100
Message-ID: <20260107101005.84039-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
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


