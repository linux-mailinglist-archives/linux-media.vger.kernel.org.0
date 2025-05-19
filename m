Return-Path: <linux-media+bounces-32810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB56ABC0D0
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 16:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DB353BB34A
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A85C284B49;
	Mon, 19 May 2025 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VRPGfczn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F1428369F;
	Mon, 19 May 2025 14:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665280; cv=none; b=CyUqV/ZMFwRr25UtSNqUPk9PIoc6JHSMIBCYiKFNkhWIKeZEfQN3iCPnwUxVHkPPC7EVf5MHjTVPXpOf3ibcxka2V9ZyWPSsVmYbWzTydh9JmApv78dc3nhc0PPQktFXgEqurF3dScNFuVvGw/RuCGIYwX7HMyG50PTuQzYRimw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665280; c=relaxed/simple;
	bh=8RbzFTKNX7bFdOAAuqo3MaVpoqgyyEYi4GfbLSphDrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dGS/QI3p4xHryTYymB3E5vMwr4C1Fl3f4j1XwxPptEZfVPOkwP4+KOZI9RyfgUNnY4NNlmiLisqJEzZTY6WdCxBAZlmPH0AtOY7qiWLRwgjvtu5oZ7piLYvY2EFYGJLOwWyMjOIHr0jOsEZa3oan9v9RtmtFGaS3rPJGKrC89eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VRPGfczn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67A9019A3;
	Mon, 19 May 2025 16:34:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747665245;
	bh=8RbzFTKNX7bFdOAAuqo3MaVpoqgyyEYi4GfbLSphDrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VRPGfcznVp65uhaaMfy5tcEs+/6pmgvnNkd8QzWg2ab/tk2eI3gwP3TaDY1rGQoYY
	 ZFwdUUz4uF6asP5i9hi1O2Xj//Lwcv6kdw8+7vIqAMiOCwMzvtxj+/SyjiaMq7LCv+
	 rj6KzApz4L218wq0mTwqAC9Ozi3SzeN3hxSq5VuE=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com,
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
Subject: [PATCH v9 09/17] MAINTAINERS: Add entry for mali-c55 driver
Date: Mon, 19 May 2025 15:34:01 +0100
Message-Id: <20250519143409.451100-10-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519143409.451100-1-dan.scally@ideasonboard.com>
References: <20250519143409.451100-1-dan.scally@ideasonboard.com>
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
Changes in v9:

	- Added a File line for
	  Documentation/userspace-api/media/drivers/mali-c55.rst

Changes in v8:

	- None

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

 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b5e8ec57851..13d531ebea1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1965,6 +1965,18 @@ F:	drivers/gpu/drm/ci/xfails/panfrost*
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
+F:	Documentation/userspace-api/media/drivers/mali-c55.rst
+F:	drivers/media/platform/arm/mali-c55/
+
 ARM MALI PANTHOR DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Steven Price <steven.price@arm.com>
-- 
2.34.1


