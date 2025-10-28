Return-Path: <linux-media+bounces-45740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 611D9C134B1
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834011AA0ED0
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6837A29CB3A;
	Tue, 28 Oct 2025 07:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fscolYsD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD102221714;
	Tue, 28 Oct 2025 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636489; cv=none; b=a/67Na0lFEIRlV0LtOqYBdnC+vOb1InA9YG/nFggqZQbIjZQTE6/hjYCde/MyiVHingQtuKuvfsnbmWCg6B8vWMMO9Vp+mQfz8L/H1Mih/YWS/rQMoJ6Uk9f3AJKwjYuxtZHPDodYzaYxSGz1jTrECoPWUGYeN4WAAFhYsEjBKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636489; c=relaxed/simple;
	bh=30ILoPo77xBySjkLXEw7QlvqmU5skf7BIfuEYHZdR98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5srEhbuhBJunPffCuR/ihCda/zfIBHptfBHRe85BwcGbFuT0AohF4qOHgqCldDzpRwbE7/IjVqb6QQoc0KFqN4Kke5zpMAvK86lZb7RC3WLVmWUt9+FyjtuZUGrmHU/Z3kZ0rQQ/6HFFkW9m/Lsyf0C5BZoTeh9JePyxS3cZeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fscolYsD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C73C616CD;
	Tue, 28 Oct 2025 08:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636378;
	bh=30ILoPo77xBySjkLXEw7QlvqmU5skf7BIfuEYHZdR98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fscolYsDGzTMBnZVwO9bJdofCml2Q8L3gWfif4PfIb8W+8XbNscMk26M2yfeWoKtx
	 7DiTDVbUu5xPsOhq4henR4UjQXv3oTQl7pW1QoG4KMHYbayEoCHQ6Swg/WTaHojiSq
	 QEadO8lyQbr8DOI8z2V5nzBxmmYSGTP6SVviA4zw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 12:57:13 +0530
Subject: [PATCH 02/13] media: i2c: ov5647: Correct pixel array offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-rpi-ov5647-v1-2-098413454f5e@ideasonboard.com>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
In-Reply-To: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=885;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=CJs7e9E+Hg5gO+HcnPJdxVoMvaJYhqSv0fuOv7YG5f0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHBriJGY9PeKO+7BJRX3vHbKElUWEMTMO/gh+
 qgg3kSDiWGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwawAKCRBD3pH5JJpx
 RcezD/9/hUDud7CVVpXygBnrcmgkz22uA8mD92QmuvUuGfkM+tJc/5GTrqQzNZ8/eNefGxlfSVK
 Ysr8MIsAYg6KC56McKq1TbPSl2JPMEi1ZQQsQAQ/yPIUzoSU7o7w/L3AEmtK+O6UXY18///YoRy
 YMtWhXM4DGGYmSVlp3oIstJbvWkjF3k+v6SdWUa7Yqe9iviVmD1bG/RDJeNbdKXtfSGlkZL/qIv
 7V1DimKWdeiG9fGaqcly+id+vu8QN3HQ/Y64cAR7F+e6wZ0WJuYk+1TiBjJ3TXGUspfM+3/Yh96
 cOpomWW7TWz3NbvB0hV7USqZjri0KTtWLONohxZCeSwR2qwq79auWm5krM7Ol4L+7xMU9wzxpdX
 MfaeOm/WyL1fd6BIXwAB6HBXdOCegNlQkhLQafkUz1OvRgtmF/wcupP4sZgCczOwXd9sB40rxkj
 +5Ne+AsMwCHK3T8LmI8dYoZDin6Jhl+/keZRmDo0lxQLFdOSbgHPkcdzPYOidpcDDFfnFUh4zbt
 bswBr3iUR2Nc+kFF7b2GPI/9CEM03jUGKDUwzA3BcUO8VJ4Vv04QuIt6jWeO3BfP+zp+mur6O63
 uTUrwqX92GEAMeaAW3jqmHPWG0WhTHCZ0WdmpSybeTpvzWZcY2iZtWll2de1yQS48AIZEfDPn3q
 gXlTdwqdqQ3Dm2w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

The top offset in the pixel array is actually 6 (see page 3-1 of the
OV5647 data sheet).

Fixes: 14f70a3232aa ("media: ov5647: Add support for get_selection()")
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 985a8e81529d2f88cb38ccb8c94f8605026a28a9..4fed655f5a11c38e76d1ccc9ae9155cf945684ab 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -69,7 +69,7 @@
 #define OV5647_NATIVE_HEIGHT		1956U
 
 #define OV5647_PIXEL_ARRAY_LEFT		16U
-#define OV5647_PIXEL_ARRAY_TOP		16U
+#define OV5647_PIXEL_ARRAY_TOP		6U
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 

-- 
2.51.0


