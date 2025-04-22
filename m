Return-Path: <linux-media+bounces-30712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 371B9A9694C
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 14:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6978417D7C5
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 12:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBA027CCF0;
	Tue, 22 Apr 2025 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NAFPMlWf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6267427CB15;
	Tue, 22 Apr 2025 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324829; cv=none; b=dicEyJB+CGh/u/942dyYTr0XKnvEPVcVsyGPE5mZ4C4SrCUMRAjYrOVyJgWgYFF5x3qV1MeLcNxxtryA5VtUa+bK9EFO+KrSNSWJUZxlyx053YunxGl88LhDDRxyRm/glWQ3DVY+Lr0aGxtetTDguTS9+IfUme+zfXQSKWiSngc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324829; c=relaxed/simple;
	bh=iuK4+llvKrBjY1rIocGSF1aEDer/M/9QpAb7yRwZ2ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gvyy1aC1llxGc3LfXMby6el1fpHFdse9U7EUDr8uV2iV20eBqegLquvGABE+YXpJQpRYH95OfkNRJY6nQwxJyvVOUCrTgMGfmP9SyC1rSAbDN8PhsAC0GvyfLlNOtehBH367r2xcphMZim5K1HS+TQdNZc4GYbWX0n6/XsGQCYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NAFPMlWf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from Monstersaurus.hippo-penny.ts.net (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12799250;
	Tue, 22 Apr 2025 14:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745324699;
	bh=iuK4+llvKrBjY1rIocGSF1aEDer/M/9QpAb7yRwZ2ks=;
	h=From:To:Cc:Subject:Date:From;
	b=NAFPMlWflGFdUkSiSNuIt8KVfeDHtl/G/5bwR+TGR2hRBrF0QfHItKqGjFtzV0LzM
	 TwPslfYQehM68oVRNM4xjOOQhewFqA4OcxwxIB2DtLjA/gueKfNRYyb52KOeSC8ZPW
	 X5CYMxkWPmXR1Ftrpy5H9gcYa6gN4tgUWgHslh3g=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	sakari.ailus@iki.fi
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] media: imx335: Add MAINTAINER entry
Date: Tue, 22 Apr 2025 13:27:01 +0100
Message-ID: <20250422122701.24195-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 5b0e91fd477d ("media: imx335: Orphan the driver"), the IMX335
driver was marked as an orphan.

I have several of these sensors, tested on Raspberry Pi and NXP systems,
and the full datasheet. Add myself as a maintainer for the IMX335.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 83f9f46a6bcb..23106e7d3a23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22542,8 +22542,9 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
 F:	drivers/media/i2c/imx334.c
 
 SONY IMX335 SENSOR DRIVER
+M:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 L:	linux-media@vger.kernel.org
-S:	Orphan
+S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
 F:	drivers/media/i2c/imx335.c
-- 
2.48.1


