Return-Path: <linux-media+bounces-6488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4518724CE
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 17:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C62A1F22265
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 16:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8136E15E89;
	Tue,  5 Mar 2024 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F7hYIsR9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF00134A0;
	Tue,  5 Mar 2024 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709657343; cv=none; b=oVMs5un8dPaIDSv0DZY2JSkwpntH00EHUSlG7qN/5K/VjrfuyPr6UIg89MyLQjVGgorvJjzZeDmd47aeVRNH+wZWcXKEfYfCzkdgwMSjtwDD8jQlI47QRirMFVjMOR6/crTSz+dv3khHETmCeHy1hXccwQFO7xV1yf/a0/eP/bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709657343; c=relaxed/simple;
	bh=gbLbdGMoTNTqVqknzM65+7kXV/hnMkAElBKa/cPFeaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e32FI4kWruvI6t+uVVAhXHpbrjjnZReBczYZ8tqWyUbiD08vcNLKuGVhTm2LzsZyYRCScL+8hYSlXa8Y99rucIczUWqyehB8VL/Vl8jvSZJDPxJhuxh1txzl491VDJpsRdC7PQvr7mMEvHN6F2mgA3mt3rMZCy15YXlyitlaipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F7hYIsR9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31AD915B5;
	Tue,  5 Mar 2024 17:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709657318;
	bh=gbLbdGMoTNTqVqknzM65+7kXV/hnMkAElBKa/cPFeaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F7hYIsR9ySsm43okHcnb7KZBryXKiwDq0dM+reFzxKsSE3jeLDaKomod0w+a/aqil
	 zS71IIzGhxhTasDUaG1Z05DTjuJRIiFqB2oML/stQpGX6FmYaRpa64RdPm+g6zCJ+3
	 eLHzXXo1wcUTOW+bSQDKqZrEUPBsloVC92tEmFLE=
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
Subject: [PATCH v3 5/5] MAINTAINERS: Add entry for mali-c55 driver
Date: Tue,  5 Mar 2024 16:48:32 +0000
Message-Id: <20240305164832.2055437-6-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305164832.2055437-1-dan.scally@ideasonboard.com>
References: <20240305164832.2055437-1-dan.scally@ideasonboard.com>
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
Changes in v3:

	- none

Changes in v2:

	- none

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1a89e0d2ac61..76472b7568c1 100644
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


