Return-Path: <linux-media+bounces-43611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 618AABB39B3
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 222E53BD4C9
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31AC30AACA;
	Thu,  2 Oct 2025 10:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pq/WxGjN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5462D29D0;
	Thu,  2 Oct 2025 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400337; cv=none; b=on5pPpi5pWYjqccyxoXmsj+zd6aeUdlRYrS9YFkpa3aq1+mwK6GLdX47Wwbl2pCoSlbQMNz5TCHuJqHIvRKx2NOkiu3WXpBFr59pcTqLa6nD/DLWEAf//Y5FNiLteXRrcED++jElD4Yxwv58ZWhAapVtU75q2tSinEzJRl+0MII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400337; c=relaxed/simple;
	bh=Cqluj7U/KLSqNIFIlzY5s8rRln1Gzbirj64U1h1UC0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CO+o5Ju7kgxOJjaS3+wMHpthQgj9+5hyGJLzdSDZYKaDJhwUI2FSzoFi7JWK+P2zvM92bHBNkzyjGMEsIo2diCYyrBDuswDf9xNzT2GWYMCrY+q2aVi+7p1AmUfP+d0FuhQXyY5Ht8duFRBAYKVmf04RHjJbOC54mE1IxaZZATg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pq/WxGjN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2A1AF06;
	Thu,  2 Oct 2025 12:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759400232;
	bh=Cqluj7U/KLSqNIFIlzY5s8rRln1Gzbirj64U1h1UC0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pq/WxGjNH11TW03U7sdZYwZM5nilhlupdq7PQNwbGf/28HLEOLgh7/EUK7SaVlkEd
	 i+Lwh/hyemWrSKfxeY6c6z4nt8Xiv/msL1Kqwv5YtTmxb3CNDrSdR2rD7Ktj3VeSRK
	 FyVCUwCK7d02IGzxvZBHs4HhlmrvZfNvgwS/Q5UY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 02 Oct 2025 11:18:26 +0100
Subject: [PATCH v12 07/15] MAINTAINERS: Add entry for mali-c55 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-c55-v12-7-3eda2dba9554@ideasonboard.com>
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=Cqluj7U/KLSqNIFIlzY5s8rRln1Gzbirj64U1h1UC0w=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lF5T0T9TBninJ9XDpuDKtPGxQb71fmRB+kAw
 VlZHY3e4rWJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5ReQAKCRDISVd6bEV1
 MnG7D/4+WgdEszOfDsBWiw+ftI5SEIqpVwbgDYEYPzwj4BJdAV67v8uOvNI8cMi+wNguTF6tqKh
 AfVQRPuqaDQvFwqqFytvPkTFo/Ux2hhaMxbEkyGfV0HzrkrytWIuXbSEs0ik2+fWAD5DM/5wehN
 /QgTkqr7SnDX49jcq3s4F+k/sivp1GPs51RWPYTq/pCqBjv6YOR9d6Bt1HP13d9Aj+1cBDpQQp0
 eeA7OjV9BOhTJ+Fh1utEtf9GPuGwuiRSkUGXh7kTYM4oibTME5oTrznP0NWCEzg8VajnnSNBs1j
 xbP69joBRjdg20N+5OUY3EV/7zsY9TsQCcpBYkfH4+t1sjBncJcntG5o8zHof03doMmiaoPOkJR
 2fVeeQ7oWZ+MQz/ifOvVNXQzujhj923hzEmXhyN5FixwsMELZ+ezIniQh08TvE1qxaIXxUg0tuU
 BXSll/pnUqcsL1dTyCUQHNd87FvHrufniayeft6GLwYt41C4WGGNLhake93aRB8U8HFPG9rbGq4
 PLrAZqNV3IuARf0e7q3PuW8RTT0yw1O1syxZKC2EmIGmpJsnZNdmsV7aV+CNVdcgdKzofuO3EWu
 C2ExapIttZ7Xm/IRmYdASdMt4EJuIJuiOKBpsp+12ZG4ucoRiosuZuRgKD7CweTUjISIqUlFVvh
 R4fRuBNcGkZh0GQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add a MAINTAINERS entry for the mali-c55 driver and its associated
documentation.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v12:

        - None

Changes in v11:

        - None

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
index b0c5e6c2b21a5d5ebc63d2ae8b5c1b68fa912b33..86a6ec3a629417ace8c79bf89e1868cbeb422b85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2075,6 +2075,18 @@ F:	drivers/gpu/drm/ci/xfails/panfrost*
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
2.43.0


