Return-Path: <linux-media+bounces-45741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F766C13493
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4F091350F1C
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29C82C15A5;
	Tue, 28 Oct 2025 07:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gWrCpmmW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D559D2C0293;
	Tue, 28 Oct 2025 07:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636495; cv=none; b=MwdroX1MYyrfINPigqFD+xBQj40j8lVXZAXyG0BqDbcXryF4h82RyfgDSRcFGf7SSmWAeWpjoepr9jaLNGu3XaarlU/gstj5mo4UnRVzLDZLF0eHih6u9zqV3H/tmjlQvNDdSrRFEvsc97wLNynqABi+eoR/U/fSWLxMhiY503A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636495; c=relaxed/simple;
	bh=Fh80gJ3lgO5wPHm6q3smMCDKrH9wSJ1/al9aJipyqDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GV+Ym/tgcaIaVATrMZFBH/Y3ipGv32ezx/Hn0PaSWSagzzgZ4fJ9Qo4QWq6rZ+pbf0a+IOMaBQra29GjSj3hm4vyp6aKr2JzFkhLxi/8lP/950elneXZHKi8tQqYsA5XeesxASA91dHgQ0EdGF8LD/2d1AO/xuliuKW2gSKOABc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gWrCpmmW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2400416CD;
	Tue, 28 Oct 2025 08:26:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636383;
	bh=Fh80gJ3lgO5wPHm6q3smMCDKrH9wSJ1/al9aJipyqDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gWrCpmmWXudked9fq+1WeZDgdsvABB6yBwn3AY3Uq2FdhMQo6Mqho4SjNKFiVSAH9
	 1L5kflxFdqfaJ4teXc0z+DQrDuEY64ufF9A2XyPmTIDXCuIfvsFH+uix+zRUGbQbPd
	 8Oepd9QsFtI2iXkRzneZ4RKQbLCq4GQIuZXknyoU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 12:57:14 +0530
Subject: [PATCH 03/13] media: i2c: ov5647: Correct minimum VBLANK value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-rpi-ov5647-v1-3-098413454f5e@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=txOyxp6ia1h8UAHDRUonSqN/ZHogzMl/0zPZ6skqky0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHBssG5A18DKQ/N9wRq1TUQpGsr/4J3VJEnca
 5r9EKpfwpuJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwbAAKCRBD3pH5JJpx
 RXz6EADBOnadJip4LwDCzTE5txUSlFVY2Hmdf3nyepFGvLr2wb/O16vzYST+/j8uOv9iNJ+6xHh
 ZZLRq10I394kiKEnhNp0YXIR4DHcFebyEWrr78u72AmI5RMp8yAL8laJ3/RdCLtkB8uVWFCmwPC
 NwIG8flyr+k+pg+HOX4MGsq6qx/vo7oqjGixL1RIAOBqTN2l9/z/jbmbucXrAtdek7CsmG6yWvM
 w+ZsHHTSP/GGO6mg35QKyGgqDjSyzpEiDihQdxLryM8gTClWiI1vtIjHYA2NnW7Xy7grN9JfhkY
 iHfCwvtgSSFgKabUMZcice3R3VoF5gA0+Dx57aVmK9kcynR1GDObdRWUAmgtO/ut8PpSL2yOGQq
 eE9uRo1O0t1loH7BLdQ8teWp6uoA791kgxSjmrXhQXKnYRL58H53r7Cnma/5yN8D+iSSSPzm5cs
 HqJpDjDI4IZZzbnNhR1idnnpyZZOFfhZWxYS1vt8DCOw19oEdzZyp7vKCQTSnqshmKSyN/WO38J
 zuuN3pMfqxv9UVOiek6alPyUxKrT39v/GB/ak48YVMIHGbz4HoB5ZKAVDIB4tMGum9xWbh7IkBc
 zIlI2hxtlOGtnMa1qAX/DQh6rbGPXAY+MYjclBwukz9svqjLBpRff3f4zzGwPLCslSqIm1Y61fN
 przmWS7uG5CMTQQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

Trial and error reveals that the minimum vblank value appears to be 24
(the OV5647 data sheet does not give any clues). This fixes streaming
lock-ups in full resolution mode.

Fixes: 2512c06441e3 ("media: ov5647: Support V4L2_CID_VBLANK control")
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 4fed655f5a11c38e76d1ccc9ae9155cf945684ab..dfe36116e6d3936aa0568f172c79ad4dad21f8c2 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -73,7 +73,7 @@
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 
-#define OV5647_VBLANK_MIN		4
+#define OV5647_VBLANK_MIN		24
 #define OV5647_VTS_MAX			32767
 
 #define OV5647_EXPOSURE_MIN		4

-- 
2.51.0


