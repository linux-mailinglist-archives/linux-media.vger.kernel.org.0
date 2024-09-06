Return-Path: <linux-media+bounces-17796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0933E96F84B
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 17:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1EF81F253E7
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 15:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9BB1D3623;
	Fri,  6 Sep 2024 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bos4fWvx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FA81D3193;
	Fri,  6 Sep 2024 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725636877; cv=none; b=tCU0bTEj/KLd4iV7eyGchDRXwgUcGTbthP4Ivdpp15Pjinbqgn2vtLU8epGn4azMp1M5agaFZX9u71M0o4fiu2WTkAhf5iSFJ9tocQMLri0nqUzFFclsrYNHAfYv6XgKjRQJNeeoNhKC9BnfaT4hyWpVp+UsI8hsakpdXR7WmBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725636877; c=relaxed/simple;
	bh=zBnQQkDgt8h5ulByWUAuBBFHQ3RLDmG+qAj/b9+HP9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SC/5YEiIwwbIXSkqnmenFALvfVELKPBxF9XILsdDMf25Km6cPZgQ0CTwpyt8jzUXpi1tWSKip3c0wxmr4148eQsl7xkAIUo01d15CtG/THg+KHXXiuNWRf7iGLCaR66Av6AYe5fYSAjfThNE1Sing2788iyJL9YIoDv9VD6yLYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Bos4fWvx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABBB21733;
	Fri,  6 Sep 2024 17:33:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725636790;
	bh=zBnQQkDgt8h5ulByWUAuBBFHQ3RLDmG+qAj/b9+HP9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bos4fWvxmaHNEq7E4Ff7bhynMvzi4zf95FUywk8DA71Zz+co8D4buxm1ui1ERjDGN
	 ti/N0Ws3wCDt9XmyN6KwehY79T+tpLK5MGoXMT/NJT0TiZ+oRj1jED5NT9VaDGwYR+
	 4QbwQOF48ggG+q5EDVKkKfq17p/4SYXF6SOJE+AA=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v7 08/17] MAINTAINERS: Add entry for mali-c55 driver
Date: Fri,  6 Sep 2024 16:33:57 +0100
Message-Id: <20240906153406.650105-9-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906153406.650105-1-dan.scally@ideasonboard.com>
References: <20240906153406.650105-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the mali-c55 driver and its associated
documentation.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v7:

	- None

Changes in v6:

	- None

Changes in v5:

	- None

Changes in v4:
	- None

Changes in v3:

	- none

Changes in v2:

	- none

 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8766f3e5e87e..f2124a8eb9a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1757,6 +1757,17 @@ F:	Documentation/gpu/panfrost.rst
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
+ARM MALI-C55 ISP DRIVER
+M:	Daniel Scally <dan.scally@ideasonboard.com>
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/admin-guide/media/mali-c55-graph.dot
+F:	Documentation/admin-guide/media/mali-c55.rst
+F:	Documentation/devicetree/bindings/media/arm,mali-c55.yaml
+F:	drivers/media/platform/arm/mali-c55/
+
 ARM MALI PANTHOR DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Steven Price <steven.price@arm.com>
-- 
2.34.1


