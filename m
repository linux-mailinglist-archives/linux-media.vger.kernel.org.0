Return-Path: <linux-media+bounces-13190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E43EE90744C
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 15:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BE711F23C51
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 13:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6337145B03;
	Thu, 13 Jun 2024 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S8zWAkR+"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDBBDF71;
	Thu, 13 Jun 2024 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286640; cv=none; b=uJbQNe3vEoc/VjpRo4V8QrApPWCXhPCvPjh4PWOJEpqFjCsk0h1+Aqayrnns1p6Fptxnj/taWkvh/ny2UUSnZ9drggb7XqMHn558qX5dWa2zBgFeUrLn8QeeAOAGK/fWnwj2/QzlBfveGVmVap0sxkTIbd0ZPJQEgH3PpwSzWu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286640; c=relaxed/simple;
	bh=MCk2lzzT75gHxafgWjjiBI07jtmvCzegEvxmJbMmkDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkFgTREA9z2q3KfuBMls97DXL2b14SVkt5s1e0Irc5A3E2MnC8TzMKCDpv1nkgB/wEIp8+R6IPtNBDrVrFEzaFNDW9hSXqbxgHKQvfyYz/rgfnt6P8kxMQoc5xuJe1cF2coPNNXh61Ra6rQj+GYmAuKOIlViAyURU5mE5JrJwro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=S8zWAkR+; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718286636;
	bh=MCk2lzzT75gHxafgWjjiBI07jtmvCzegEvxmJbMmkDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S8zWAkR+4IInOh9HuDdNm6i9uq+f6Luj36N8qMjKtt8w4yzUd8h/Hx4prm9BwZvt0
	 NeKVOprZAM7HlVwM/b+It6G412IxKWpftegr9qtTGpkTJEf8pws/3fecZ7aA5WKIS+
	 O5ZmjmwKtVdU4jh1EFiFmrAe/t7FTi8Pr+98IGpW5y1NFlE9eqE+QomaOB8RDKiN4/
	 wsNgqX6K8welzq1Z0Uh8gZTEIERYlULrnoZ5i1Y7Bz+GLVIFvkrvIpyrCAfTyAoE2r
	 f5Cx5Pi7JUMAPEYEToq+Rrwn6tpkC5KYCScErtxV/TW1J5v48PupUjaBnVTNsGVJyE
	 LbKdwKS89pBSw==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A45E237821B6;
	Thu, 13 Jun 2024 13:50:36 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 387384800CF; Thu, 13 Jun 2024 15:50:36 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v6 4/6] media: hantro: Add RK3588 VEPU121
Date: Thu, 13 Jun 2024 15:48:45 +0200
Message-ID: <20240613135034.31684-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613135034.31684-1-sebastian.reichel@collabora.com>
References: <20240613135034.31684-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RK3588 handling is exactly the same as RK3568. This is not
handled using fallback compatibles to avoid exposing multiple
video devices on kernels not having the multicore disable
patch.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 7123479b3eab..b722a20c5fe3 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -722,6 +722,7 @@ static const struct of_device_id of_hantro_match[] = {
 	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
 	{ .compatible = "rockchip,rk3568-vepu", .data = &rk3568_vepu_variant, },
 	{ .compatible = "rockchip,rk3568-vpu", .data = &rk3568_vpu_variant, },
+	{ .compatible = "rockchip,rk3588-vepu121", .data = &rk3568_vpu_variant, },
 	{ .compatible = "rockchip,rk3588-av1-vpu", .data = &rk3588_vpu981_variant, },
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
-- 
2.43.0


