Return-Path: <linux-media+bounces-4522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 462FE8444C9
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 17:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73F8A1C21EB6
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 16:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96D612C53D;
	Wed, 31 Jan 2024 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Oa3NqV7o"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CDB12C531;
	Wed, 31 Jan 2024 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706719660; cv=none; b=oJOd/ebgkNZ+ZoiwYNfK2BWynT/t/spOD32kOIQb4WyeSC6CPZMMRuCullbfuuu0MOsx3L8DqIzrD626pkiAMrlAOTc0qT4zpwwWvBqAYRqkmj5nbDrttY3iBRIPuRKHPl4Hdq04HbFSjxZXJv1bIXM2jC9sZAnxGJkGf2n2sJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706719660; c=relaxed/simple;
	bh=DGcK0FIcPkD4YKJCNhEP/WorviNVuwHABB6p3EQwyD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ky3HExcpd4aNNjabVOHE5DSJRqa2ZYpYpTqNttuZj79sx/RPFZxdvPaExqERjMtoM+EYXpvUtOtD6vIZcG2/IfHpnecZvmUjlWS1fa9C7K5wKNCOfe2bPHi8J5kf30IRxjUSXnSfw8pqTRMeclh33KL40MTr1wZ+uWvirH7Q3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Oa3NqV7o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13FEB6536;
	Wed, 31 Jan 2024 17:46:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706719568;
	bh=DGcK0FIcPkD4YKJCNhEP/WorviNVuwHABB6p3EQwyD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oa3NqV7oN8kOAJdD7FH2l9OvdV+0KS1P2CzkVakJTt0zbZd7uMQzqs9xnptu4AYS2
	 lQivypfkhdoEe2zfFqRMTQIY9/9CoBOGQO0g4brCT5nOya8sqhTK52ov+1QtDl6PCn
	 cvgavvw/uErnuBgnzqP/3kTU/Hwcdrdo0hzSVcME=
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
Subject: [PATCH 5/5] MAINTAINERS: Add entry for mali-c55 driver
Date: Wed, 31 Jan 2024 16:47:09 +0000
Message-Id: <20240131164709.810587-6-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131164709.810587-1-dan.scally@ideasonboard.com>
References: <20240131164709.810587-1-dan.scally@ideasonboard.com>
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


