Return-Path: <linux-media+bounces-48775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A74BECBD11D
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BBDA303EF4D
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E53031BC91;
	Mon, 15 Dec 2025 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RaxHWbRS"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C91313E3D;
	Mon, 15 Dec 2025 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788841; cv=none; b=HG5hpc5GOfvwlUEHPI33ZVPhFh9VgKHWuV+0quLlvMbl1xmsz6iELpLzONI5vgtYKj0BgUODSw28rw6st+iMJgPX5sYlGRcvo5ZXJ9JPNkBXI/j/2pinHkXphKaF/7A3vNV4cR3H2q5uVRO6iV1z/ZOMSxDOPhz1tBlQZ+RKcEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788841; c=relaxed/simple;
	bh=a4oJ5h8F6+5H21ppQ4zCYLSP4cr9qDHKi8vQVGfWg0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qmixe0vNGRJ0eS3SSUjeJmolE8oS5Lr63F+qLKzb5eWYJ+6tvJ8/dA1GQwRs65qjyen/OSpO95Z4SR0+PtedSs0GghRQoVmLq3jYWrRIPXFLSUlMIOqSaeT76TUJyBADirmfQ8XkBEJo2PynKZ0ibO5h6zS2pCz8MAW6eejH1II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RaxHWbRS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765788838;
	bh=a4oJ5h8F6+5H21ppQ4zCYLSP4cr9qDHKi8vQVGfWg0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RaxHWbRSswmNgKV7KS4Ai8npfmR0euDswGOgyCcMWV1WsXQegU7ggZuDmQ5G7Hkw1
	 GY1Wc/zXhsvrp9XnnLahAss6RV7pb+ZBFLtReGyK5JzTyb7Z7KpCDaf46eQkviT0d0
	 FfwBKfUB4RmZw2sIqaXmQcgqJ/gWvrESrqVRq0y3Wf1pj++lNUVzXNb6qBCvv3dRxB
	 3yrZZgJSninYhy6apDMT1/Zsp4kjHMC7yhRpoiYxTdCO4fF2b3REzmWR9GYpvsV0Zh
	 SmhH7Va7Pz7QDD3Ctfl6lE1MiucHsKy8dMdalLpdfCeGtYOO3WjH562DnZ8dBPWEdZ
	 wAMDuB/tVl8mA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c17e:135b:5095:83a8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E66F17E1423;
	Mon, 15 Dec 2025 09:53:57 +0100 (CET)
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
Subject: [PATCH v10 4/7] MAINTAINERS: Add entry for Verisilicon IOMMU driver
Date: Mon, 15 Dec 2025 09:53:41 +0100
Message-ID: <20251215085349.10155-5-benjamin.gaignard@collabora.com>
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

Add maintainer for Verisilicon iommu driver.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9e416ba74c6..ca67e5333134 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27296,6 +27296,14 @@ F:	drivers/media/v4l2-core/v4l2-isp.c
 F:	include/media/v4l2-isp.h
 F:	include/uapi/linux/media/v4l2-isp.h
 
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


