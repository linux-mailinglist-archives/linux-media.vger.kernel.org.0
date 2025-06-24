Return-Path: <linux-media+bounces-35749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB4CAE6249
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 327927B3884
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E6F289E0B;
	Tue, 24 Jun 2025 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uhY+eBaa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F20283FC2;
	Tue, 24 Jun 2025 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760513; cv=none; b=Il8LfDP/+TFDUMY32dehKssu/+dxKikeq9ombO2Og7ci/uHMfXYFIauf5vUX3anOeGna/K4uqstL1nHnHYoILP+6L8b1+qKv67npiHpVQz2+Seftu7US+R1pJ8z8gLWlb2UBKxjFu1rwANWPnxn+1FV2qVtYlx+ACHvn9LgSfIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760513; c=relaxed/simple;
	bh=iyhJbIDgI4Oae74LEOpCqBLfntqEuWvPSqMqL1nUytY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvDzO+hgJsgFAedCA3PwBCfXPvyERVyzLRRmkDkFV0CoDZ4+iU3b+AjXJ6jRhQWyBnQGWPIuHIcMJCzBYhdXZrnyxjh+x5ohruxfrOSVMz2UR7UqdyhRSyqAv62zkVPq95ptBwKnFhfNzPdNse1R8dQFeDn4+ZoTAFUPXPyE/Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uhY+eBaa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B31791DAB;
	Tue, 24 Jun 2025 12:21:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760480;
	bh=iyhJbIDgI4Oae74LEOpCqBLfntqEuWvPSqMqL1nUytY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uhY+eBaaSkgmOZBrHwmzxIdcKXa9fiW8fc83ZJIapbQzVhd0YxZbkgttbJB0IhqXd
	 qS2+o2Vn/xI0oA7may4MUHHCs76tOqSTlUWeFRxLldvnCdpKTE27Q8x94X/K9jb/PY
	 mV4v556g6PX6uabzSmBAJE03uYP6zIKceAQXYrMc=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:22 +0100
Subject: [PATCH v10 09/17] MAINTAINERS: Add entry for mali-c55 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-9-54f3d4196990@ideasonboard.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
In-Reply-To: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1688;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=iyhJbIDgI4Oae74LEOpCqBLfntqEuWvPSqMqL1nUytY=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwoY+5HI6gOtbDj5LRvleNv0DFEHQdcipPdg
 1ODLWHT/LuJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8KAAKCRDISVd6bEV1
 MjExD/wPUehcFtLs1sFnN8x01u0uxfhPTH+ryuV9Sps2xy3BrSpabyqYEurXfCBl5kqRU2Jjqqj
 rcbNaObr9H3HlGaL8Br2O0ObUCEJpJamo4qB/8XP9P9AGLtcE+BVKLN5P0VV4V24yXMGSQ9/D0+
 dKPDqje59L3a5poOid5DAhTgokaEmMUScNBSQyMF+hBlCaRylzQwO7U2KvfSVDcMVHnYRGd6pTR
 XMN9vmIcxMS+bYjJno4LdORQD0P0zx082lm6DKvWuHc4G9Kown1U5ZF9Pzv7Ie9cGz6pDUb49kJ
 WBZ16ZeZAL2Kl/BZ2cgJfD3t3SOLzDcVtSwDaJfhdQKVxse6snjDpefox89/JjOu/jFOf3oGwpG
 /sfHbXYBtlDqFgrSH6aTXe32Zp5iuPDPuMvH8d45OUAcwnhFYzlzgYUYef5fj4gd9XJ8JiMm/vp
 cZDa29iov3uYjBgSmDQqOGXGAAXZ35fDiSPNTub+Yl/rtOn9huRPKLiJ0jOP2Rc+1q3UYBkexxM
 XVaBbE6LTx88mnoOD2chG8ufZ6T+MS84KrZM7fkwdKge01bZP9TLyeiY+Eu1xtFXijGP5zNBmIP
 DeUkzz0s05iopEwzTXCdvdTPGwW2atz4bU5VNU958nLQ+L23yJpIhx2yCIud2jw/9gefVcMT3kc
 tVVahQPdwXCRxsA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add a MAINTAINERS entry for the mali-c55 driver and its associated
documentation.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v10:

	- None

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
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163f9fe8fe3f04bf66426f9a894409..43204b809333bf8f3d05a65fb3c24b063c91c2a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2028,6 +2028,18 @@ F:	drivers/gpu/drm/ci/xfails/panfrost*
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


