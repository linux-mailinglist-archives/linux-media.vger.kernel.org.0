Return-Path: <linux-media+bounces-41139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 178D9B37E63
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E7E91B61506
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 09:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1394A345728;
	Wed, 27 Aug 2025 09:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UC0QDwmQ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B361CD215;
	Wed, 27 Aug 2025 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285701; cv=none; b=maS4IgSI9PAEkNo87BrmR9WUU4xIKlUO1BaeIDOwQZO0Iti5qchPaCBtYtlj7lXp43lWe+HCHbEsMeicO6yutXVUU+qrNEyYA+1ZXllWnfk3SJpnDDvYHT1Zqi3ai1s1HDKecMagcLlo0y6g90CO1QoqHCtluwDfsRFMeO6lnk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285701; c=relaxed/simple;
	bh=6V4Clbq308KQFAQTjTHjGV/TIZjO5G7JCGaqRh4tsCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qiLde+BoltEKHZOLPBKleMtHtsMul0EpD9qkkXv1842es3ouL60bs7Suo1PsP0ERe1EIqGncVRLS7ZA4iXYwFL3za8g7gOdgqxHUmOznTT+y3kosphl+Zj1YFe7rXfVFtr1Ha1G+jw8a+rb8eCzjSGDLvYR9DKzIdtI9Rccd2Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UC0QDwmQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756285697;
	bh=6V4Clbq308KQFAQTjTHjGV/TIZjO5G7JCGaqRh4tsCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UC0QDwmQciOS85zNqIgcVmjxIIc40puwKRrJbQ2gRlfKqsZtzap6QIerr0dIP8hRt
	 1cj/Ng45J5piv4JXIYPAyrKYd7z39vR6DV6RSxs0Haxha+cx2JiMq0zx+7eaLFVrGX
	 4KCmhjMk6nsXyZpkfH3PKRnIOBisWtVebBlZgs5VJq5gVEgukItgL0jBE7XW5E2SUS
	 SYDpwbNYb9QOzsjmHaB5DpCom6a0BX+7JecK/9ox0dhezCTVuZ0D9xzvMzk1tJXGCh
	 pZL3FdbTe/XbzgfNtv3rCxeu5WFs8GWageba2l7lEkkKtIM9wDWHXxLwc/qqhzgmQB
	 q3+Ss+DfBwYdg==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4be:99b9:5069:3bef])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4167717E0EB8;
	Wed, 27 Aug 2025 11:08:17 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
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
Subject: [PATCH v8 4/7] MAINTAINERS: Add entry for Verisilicon IOMMU driver
Date: Wed, 27 Aug 2025 11:08:00 +0200
Message-ID: <20250827090809.34555-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827090809.34555-1-benjamin.gaignard@collabora.com>
References: <20250827090809.34555-1-benjamin.gaignard@collabora.com>
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
changes in version 8:
- Add myself in MAINTAINERS file.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fed6cd812d79..d32830f56add 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26408,6 +26408,14 @@ F:	drivers/media/i2c/vd55g1.c
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


