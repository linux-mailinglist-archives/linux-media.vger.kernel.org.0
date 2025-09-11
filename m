Return-Path: <linux-media+bounces-42372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9043BB5386A
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 17:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35FB5A035AF
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFDB35AABA;
	Thu, 11 Sep 2025 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="q2kWAdzq"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C9C20FA9C;
	Thu, 11 Sep 2025 15:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606252; cv=none; b=CDo0I7eVhY6zoMBzmyz5rpFz/PYi8e4x6XzHfiAONjCBdgu9/qA9YEr4bYNRs95TaPciMkVjlB8POrw2e+3vaFwxQKf5GTdNAFERJdJorgx3fJfGnjerX6ztoTZ82xHZVWf73o5PaFr6d7Q9IS5TAWzz+oX/GU5cwjAz3KPhyZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606252; c=relaxed/simple;
	bh=x4NPsLT+iShc95Vj4vf/AjGTI6j+vxEXbcm4d/xO6xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/GyhGc1eLGrrfv0dPsArFTv4b3tXPLMU0ae/b7WlQL3JRVzLBDtQUOn9CGkrkebF2AsrQXKUZudFOK3jkjbuqpevc0Q8d2e9rKkYcY0hTxXp+qgVIMDEmq8B2ttC+hzVg5JK1zT9Dzrv4YlgXW0GiLl8fktgVOYgojICQtPTvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=q2kWAdzq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757606249;
	bh=x4NPsLT+iShc95Vj4vf/AjGTI6j+vxEXbcm4d/xO6xg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q2kWAdzqO0ev8lJLFnk3TmpgMlmaLc1XZXrYIR+qAifUp9XAp/9AEic4omUyS9LYa
	 hwc5HX/0EiM6aWO3itRWwS7NtlHiwU+5lsk5yIRSzrqhsbylnpe11LqgLSyIxOnLW8
	 hgaTU0eWyhStXJwahZ95/x4MeCMl74YfhLPQK4ThGEpFtr8QQSvuklqbAmRwnna5ne
	 LyaG8ILoAAJ3opX9ygKYGhofVcUlpGbPNPyt/vyXe3y14q1KzRDMexL/939ks+iPIy
	 5iIBem/CzNPa/H/Kcv2dU4HQKIclMdbKj8mPyEsLdscRsfmeH2PLa3f0F9q0RYjHLx
	 fjMbvj+p8GUww==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36e5:357f:56a7:54dd])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9809517E127C;
	Thu, 11 Sep 2025 17:57:28 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 4/7] MAINTAINERS: Add entry for Verisilicon IOMMU driver
Date: Thu, 11 Sep 2025 17:57:14 +0200
Message-ID: <20250911155720.180465-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add maintainer for Verisilicon iommu driver.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dcfbd11efef..023d0e8b370b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26407,6 +26407,14 @@ F:	drivers/media/i2c/vd55g1.c
 F:	drivers/media/i2c/vd56g3.c
 F:	drivers/media/i2c/vgxy61.c
 
+VERISILICON IOMMU DRIVER
+M:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
+L:	iommu@lists.linux.dev
+S:	Maintained
+F:	Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
+F:	drivers/iommu/vsi-iommu.c
+F:	include/linux/vsi-iommu.h
+
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
 L:	linux-mtd@lists.infradead.org
-- 
2.43.0


