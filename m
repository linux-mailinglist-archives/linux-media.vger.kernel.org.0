Return-Path: <linux-media+bounces-1292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB5D7FC528
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 21:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A3D282E33
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 20:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1118540C0C;
	Tue, 28 Nov 2023 20:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i9if6Z85"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC0F19A7
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 12:19:38 -0800 (PST)
Received: from umang.jain (unknown [103.238.109.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 498FA158A;
	Tue, 28 Nov 2023 21:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701202741;
	bh=5pll2VerSf91Fns9zcYO9btUaPO0qhwODTjYgteRDQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i9if6Z85fsRCFoRrqN0qZqilWta3jzhsO6CTJIhopnzL4o5BoKLmQhAMSvqXFvft+
	 BkxHMnFLbh1i3DTUd0fx7XXQSM6jC76Jkr/Kn9Dm9gVkjC3duRUbg7RRj4j5Iu13uf
	 P+OEfM9GuRCnVsmtx9q5y3MvXvcwU65xzx6YVgt0=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 1/5] staging: vc04_services: Do not pass NULL to vchiq_log_error()
Date: Wed, 29 Nov 2023 01:49:22 +0530
Message-ID: <20231128201926.489269-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231128201926.489269-1-umang.jain@ideasonboard.com>
References: <20231128201926.489269-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vchiq_add_connected_callback() logs using vchiq_log_error() macro,
but passes NULL instead of a struct device pointer. Fix it.

vchiq_add_connected_callback() is not used anywhere in the vc04_services
as of now. It will be used when we add new drivers(VC shared memory and
bcm2835-isp), hence it kept as it is for now.

Fixes: 1d8915cf8899 ("staging: vc04: Convert vchiq_log_error() to use dynamic debug")
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_connected.c       | 4 ++--
 .../vc04_services/interface/vchiq_arm/vchiq_connected.h       | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
index b3928bd8c9c6..21f9fa1a1713 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
@@ -27,7 +27,7 @@ static void connected_init(void)
  * be made immediately, otherwise it will be deferred until
  * vchiq_call_connected_callbacks is called.
  */
-void vchiq_add_connected_callback(void (*callback)(void))
+void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
 {
 	connected_init();
 
@@ -39,7 +39,7 @@ void vchiq_add_connected_callback(void (*callback)(void))
 		callback();
 	} else {
 		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
-			vchiq_log_error(NULL, VCHIQ_CORE,
+			vchiq_log_error(&device->dev, VCHIQ_CORE,
 					"There already %d callback registered - please increase MAX_CALLBACKS",
 					g_num_deferred_callbacks);
 		} else {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
index 4caf5e30099d..e4ed56446f8a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
@@ -1,10 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
 /* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
 
+#include "vchiq_bus.h"
+
 #ifndef VCHIQ_CONNECTED_H
 #define VCHIQ_CONNECTED_H
 
-void vchiq_add_connected_callback(void (*callback)(void));
+void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
 void vchiq_call_connected_callbacks(void);
 
 #endif /* VCHIQ_CONNECTED_H */
-- 
2.41.0


