Return-Path: <linux-media+bounces-37664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E8FB042B1
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 789663B4C6C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837BA25EF87;
	Mon, 14 Jul 2025 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TCCP/Lzc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815E725E822;
	Mon, 14 Jul 2025 15:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505632; cv=none; b=cVgbh+LsSGIltKHHCQJPYnth435lrpjk6sXtD9zDBiq5WJYR3hIg10lUjg9Z8i521fM/qVCCtz4EQa8Bt35+1M1t9Klhn8DIWs14OLbGjo6CNS89ds/Vw+I91YpZeNLEJPu0haLVE8kIBXbOnlGnIJ5i+nIKlkMIW2rAxgGQ9ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505632; c=relaxed/simple;
	bh=xCc55GEZUTk5JyTc2/0YXIODCmmVHtv/VzS9CFZ2QkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Efrhkd0mnteBDsD/dlFk4u/fVL4lRt6c8B/k4+3gSXvuB+SEAQdr4erLsgXBTAXmJR6IPTm/dhkMMo/lzWDd0xc8cC1uTa4H/sHyozwyEn3jseUu1PuMO713CUVtxLTHAkRmfndsN85ClD3MVvDPGy6eMd986wy4alNf7YsCJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TCCP/Lzc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10A265537;
	Mon, 14 Jul 2025 17:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505580;
	bh=xCc55GEZUTk5JyTc2/0YXIODCmmVHtv/VzS9CFZ2QkA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TCCP/Lzc/4C0s8nq/LNSMFkutAI13EE8KGF0yh/qhS8f4T/22JAOyFFRjopgyzUJT
	 Zm6+HHPPchAQHz8jgsTa5websH/5S2byzbnt69Q0WA86m7sC2N8Cg7atCA+w8BLk5d
	 7nG5UYQoCawC7gRgkOJdXHmhc6BQKIh1gWZQZAjM=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:37 +0100
Subject: [PATCH v11 11/19] MAINTAINERS: Add entry for mali-c55 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-11-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
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
 bh=xCc55GEZUTk5JyTc2/0YXIODCmmVHtv/VzS9CFZ2QkA=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0BujGm1q8thC9p4diUSRKlk6P6sSuIIJKQO
 dc0v3iKwdOJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAQAKCRDISVd6bEV1
 MsrMD/4liO7b9bk27PFIp+xM4N/m3yJsIcjX3kEvDDd9PIIYYeNJ84Whl0G/rlalikBCWVolmGy
 sWWMHV08oumLfUZx/eSLAZdJMB6PGD+LlHHex3QkiCDypdIEj8bwkIrS77vUj+CAvmFS29tp1uN
 e1jUVqfZvpu2QVPPZFmufOwcreUQYESs7my8NKiV3G5k1W9IYnE3V2upufhfTRYnP+ZGgMAydYL
 gOYoAoed29AGhJM7G16TvAsc4cNe9SQqCN+S/99gN4ywEPMV7QFcmbKJ5h86Wq/SFypbTidzVXR
 M7bmT/FxA88rh6VT+xOT3ja+rkiOed42RUNdswwXpvb3he/Q1Q7e6r4FsSqiRTZU1AToCVsaiPG
 B750cL6fHKMg861A9qlkbOQjZPtD88XgptXtEOuTRCi2jfrexXQzUvBBd8vJeuUE3uFw303LEUl
 BWq9MNLRLicFNqdeQAuxK6ONzZr9Fw+Ab/Aq1Z93vjr2t05xLcJuSXEP4j6+7mit148pV0oa1Ts
 IWYbvsdEgIqSsQpKngTsLV3gLY4uGZZ64y0mKO6dcPC/hLWJJTi968lYdkAyb3LLHEzhSD/wng/
 E1FFHjd0gmuzpGUQ0FdE5yrcowMPKaTlkCMcMDbJQERZCO0UXIke8ZNKgicz6jDTTGQc/eC0ZBK
 uYPf/syd2oBqZzw==
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
index f03c10092a891a06052484b691409f0c459de87d..7d0b268ed7588fbffb767cd962df6b0e31a9b842 100644
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


