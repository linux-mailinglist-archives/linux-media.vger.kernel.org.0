Return-Path: <linux-media+bounces-48779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C56CBD0BF
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 153C630167AA
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC77E32C936;
	Mon, 15 Dec 2025 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nPty4pRQ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB7B32AAB3;
	Mon, 15 Dec 2025 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788845; cv=none; b=V3zq5eC19tcuxrl2CzzMqSzWiYBkLHPWWtxZgDshv+Mem4BBR4K6XfeR6tdpRAaYVPorVxd5nDvYNhy+RSZ0mPIxKfTIGXabEBbXZv+jOnTM+sr/PKHPN5h685jNGDL/hCCT/BD/yv/I2MXpYMDYfZGGb+X5b3x0soWDhyfW41Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788845; c=relaxed/simple;
	bh=Uk/Av2ffrv0/89lUgGqQUjclRzRpB0kJUN/ec67ruho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7T02JVZIrWtE7sJVYYUeGNj6vk4LsdVgM31o3JFzGe+ECKeGnbOucMmXb49rkK2r9sJm3f/N5Y66mp2UZuWKNhrgeixX1C8SWXfWyuxEO94Coyum3JJk2ygOF6/8csUHV5lMXGwDq1yfQfsopQvZ9kcuVCAnDzLLlQfyFYjNtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nPty4pRQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765788839;
	bh=Uk/Av2ffrv0/89lUgGqQUjclRzRpB0kJUN/ec67ruho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nPty4pRQ9msOHveRYQGlAVJ0KTKQkRlItdiDb1+rSO5N4XRooq6m3087IznV6WtNV
	 /jeXJygWF2agbrqxkENgocvzo6RbZB0QGZ4xyYgO8sTVWquIZ6MG5bmgk/T5gSmbae
	 2iE+g7gXldPpD6CCuv70Eotqy45TOvhq73RXpYNabPpz8CpnxLdB31ICbI0x4RS9fj
	 1r9UZT/aCyhXvz5aT+kGLioXZS0czrqWT4wNfpGQdprBNsurD4ejQdHrOnYoBV0PQ1
	 3HRuLXaCNx/U0u3s4vv8ZOuNLLQGIhbWBBPe4sphVI6JtSy6iU5oOPdSOOJQ6eY/aR
	 uoJIM7VwS0M2g==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c17e:135b:5095:83a8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D14D17E151E;
	Mon, 15 Dec 2025 09:53:59 +0100 (CET)
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
Subject: [PATCH v10 7/7] arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
Date: Mon, 15 Dec 2025 09:53:44 +0100
Message-ID: <20251215085349.10155-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
References: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
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
index 45288ec9eaf7..0106bf1935f8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1525,6 +1525,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_VSI_IOMMU=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


