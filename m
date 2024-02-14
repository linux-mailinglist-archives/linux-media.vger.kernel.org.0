Return-Path: <linux-media+bounces-5148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A771C854B50
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 15:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A8A81F29608
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 14:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017A75821A;
	Wed, 14 Feb 2024 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kfCgS4iW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0227458210;
	Wed, 14 Feb 2024 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707920388; cv=none; b=uXRm57hE7IZAMVW93awdsOYuKsmvV07QHyfW1pyi4Jv1No+AGWlb2JJdAOSQ8EDGA326pecD+Eg6Vlw/9DRwqgXuHz8hflrrRkAyspZhgdNIJD2Mgh/SI5Rz4CeqV51TNyTfZ98QhqQOUZSncBg/3BvNyt6esZzj+4AY3XipX9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707920388; c=relaxed/simple;
	bh=Sy4YAaBmxWzOZQ7mY2+7+54bBBpkqPLkoAUSPW/kIZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OHN0SGM7mFJBIh+Z02NdOjONommrP8R6+vQdP6Jxn+Bluq5PMz/2ByJT7ca/R9tNkmypSTPLAf7Gu7It7BQh2QMoQ+enJIDjskfG3sE4Q+nBtB2oj8W9SogKK6/8CnMGfgjPkUDBPIAlqWIq28GYYdrIYif7kunv9zz1G3sSlv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kfCgS4iW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC80215B5;
	Wed, 14 Feb 2024 15:19:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707920368;
	bh=Sy4YAaBmxWzOZQ7mY2+7+54bBBpkqPLkoAUSPW/kIZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kfCgS4iWni5jJ4d8nRNVGy/H5hL84AljmPOkJ6Hn+dTLM/y9duxl4GAG9RCg6HWPd
	 kelwqNJTZNk156IRfl8JlhTDzRxN1J9F7pfRKteBIEwV2oAeD9FebXLCuqamz/rI/P
	 ATAWlRpE22n8Wkog6XqquTDf8H0alCzEGQVdA9oE=
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
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 5/5] MAINTAINERS: Add entry for mali-c55 driver
Date: Wed, 14 Feb 2024 14:19:06 +0000
Message-Id: <20240214141906.245685-6-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214141906.245685-1-dan.scally@ideasonboard.com>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the mali-c55 driver and its associated
documentation.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:

	- none

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d1052fa6a69..bec50bfb09ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1668,6 +1668,16 @@ F:	Documentation/gpu/panfrost.rst
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
+ARM MALI-C55 ISP DRIVER
+M:	Daniel Scally <dan.scally@ideasonboard.com>
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/admin-guide/media/mali-c55.rst
+F:	Documentation/devicetree/bindings/media/arm,mali-c55.yaml
+F:	drivers/media/platform/arm/mali-c55/
+
 ARM MALI-DP DRM DRIVER
 M:	Liviu Dudau <liviu.dudau@arm.com>
 S:	Supported
-- 
2.34.1


