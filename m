Return-Path: <linux-media+bounces-9697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FB48A95B1
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 11:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDB131F23518
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 09:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354FA15AAD9;
	Thu, 18 Apr 2024 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GABKATOM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417A015AD8D;
	Thu, 18 Apr 2024 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713431362; cv=none; b=nBCHnXdTPItR7ezMVofVwOP3vaLWcdfooVr8xjWfkC38u3k+x2VoaSaIPiYfsA5jp/0R78fUbfOiTRGDqRGS4buP2OhqWcFOJm6gXGaoAWaMpL39idyVS/MwoNBRemdqvVgBf/5HxyG47VIaF9Hw84U7+QtVztPiogZgqJ4/dv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713431362; c=relaxed/simple;
	bh=6OVXTuVEs3Ti3gwc47dT8+dSYZ/eZYsmW6QUwZ2xss4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M4cz4lA/XnFl2qqgIUmQk687KkC3v89xKrAo2o3mGFps6/Hj1NwxKY+WPIeedVIssYu5KtpxzF3QZupjOqGQjIPC5KTPhol/8uW5Py11CCkou5pbiO5W5u36rWlPj4XG60BtLYmfJ+paPDPo+7ePLHA9HvWY/b7qNGcAB0r07yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GABKATOM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC1DA17E1;
	Thu, 18 Apr 2024 11:08:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713431293;
	bh=6OVXTuVEs3Ti3gwc47dT8+dSYZ/eZYsmW6QUwZ2xss4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GABKATOMguOvelsDziuC6I2FwBZ93tEmy9hNgtQedFKWgtX1yFMMIS2RI50c0acHG
	 PD9uMQYybkDO3O5pCiMXiM0ZjFKsATbtbc3BQQfj334mCXuhSxguxDeEfEebi0+s8G
	 LSQPOo8Wy0kjtfFJeHiqhj9uOlr7NR6896N9dJ/8=
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
Subject: [PATCH v4 5/5] MAINTAINERS: Add entry for mali-c55 driver
Date: Thu, 18 Apr 2024 10:08:25 +0100
Message-Id: <20240418090825.624747-6-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418090825.624747-1-dan.scally@ideasonboard.com>
References: <20240418090825.624747-1-dan.scally@ideasonboard.com>
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
Changes in v4:
	- None

Changes in v3:

	- none

Changes in v2:

	- none

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c121493f43d..6231f74ef12e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1688,6 +1688,16 @@ F:	Documentation/gpu/panfrost.rst
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


