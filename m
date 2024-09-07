Return-Path: <linux-media+bounces-17880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E857970415
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 22:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 495DC1C21861
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 20:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70D71684A2;
	Sat,  7 Sep 2024 20:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="a49ZGUjP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA5915CD58;
	Sat,  7 Sep 2024 20:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725741406; cv=none; b=mybswkfWisHcNLJFiINaSbUgaSoRk5R/Je5ESHeP/JZj7fDePG1QRNSTfrLcSSe5erLf8ykYOc1tpxpT7xIIljTFdfCz+w59xKNmla26kaXIJPdsA+qN47QDnbcXi3SL6KFZEQc7Hlw0Wxr7kK0Fe63rP0dcEKchvjRbbNWaTUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725741406; c=relaxed/simple;
	bh=RR6yXN175BjtOXUBtar8RiCNkzkmikLpWth/FnTQHAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kFExgAF40NVH+mpjXheiPO4+zCZSPOo5aHU6g8ukqWXkkhyMs6fycHdPPupyBP4VJjbN+zE5vwIszeZ7uS++FGrrl3as0JJnqNT3lWqQXjvd7T4ZSSGtmBxHEm58axVAzniyvhdFKXTB3p3KezN7ERCqUfRromMgm7ZD+SLGpXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=a49ZGUjP; arc=none smtp.client-ip=80.12.242.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id n2AhsUvywLYfJn2AisJqXe; Sat, 07 Sep 2024 22:36:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725741401;
	bh=Lkr4PJeRYxJJnnG3uAkmlvx4P1pDfp4UMrKXLWox2bQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=a49ZGUjPA6VeW+gueUdc9glcAVZYXIC5HviSZxB1qvkX0XwrvYAKGPIzdBPsVh2mm
	 9P6jByqmzzk5F+zvvyJUs11iMHcmr51IBD3ysGcCk+DykexTGbbrcRByh5CZty4cFO
	 0YqL0bId5eK/VrlFo5yBZtkDrFFw5gIs+/JmVU4sCwF68+cLOTuKdteoGUADhke5IT
	 Bw9yGGUDmKxFx6BQw98gYk784VkjDBo9TkyPULMQcSAZXGpPNhjLCPx3TCraVsTQAK
	 iau3jTLKoPNSax8sOmPgI8mQKGud+OOuGGpv8RkK6yb2rJWJKNoNIcgvxdLLrAjyIh
	 PUtkLgK2C3SfQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Sep 2024 22:36:41 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Krufky <mkrufky@linuxtv.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: dvb-usb: Constify struct i2c_algorithm
Date: Sat,  7 Sep 2024 22:36:29 +0200
Message-ID: <ff9883ee252207b74aa7bb76a150d8be2cca6c65.1725741366.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct i2c_algorithm' are not modified in these drivers.

Constifying this structure moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers.

More over, dvb_usb_device_properties->i2c_algo seems to only be copied in
i2c_adapter->algo, which is already a "const struct i2c_algorithm".
This is done in dvb_usb_i2c_init()

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  30571	   5916	     36	  36523	   8eab	drivers/media/usb/dvb-usb/af9005.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  30667	   5852	     36	  36555	   8ecb	drivers/media/usb/dvb-usb/af9005.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
--
Compile tested only
---
 drivers/media/usb/dvb-usb/af9005.c         |  2 +-
 drivers/media/usb/dvb-usb/az6027.c         |  2 +-
 drivers/media/usb/dvb-usb/cxusb.c          |  2 +-
 drivers/media/usb/dvb-usb/digitv.c         |  2 +-
 drivers/media/usb/dvb-usb/dtv5100.c        |  2 +-
 drivers/media/usb/dvb-usb/dvb-usb.h        |  2 +-
 drivers/media/usb/dvb-usb/dw2102.c         | 14 +++++++-------
 drivers/media/usb/dvb-usb/m920x.c          |  2 +-
 drivers/media/usb/dvb-usb/opera1.c         |  2 +-
 drivers/media/usb/dvb-usb/pctv452e.c       |  2 +-
 drivers/media/usb/dvb-usb/technisat-usb2.c |  2 +-
 drivers/media/usb/dvb-usb/ttusb2.c         |  2 +-
 12 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/af9005.c b/drivers/media/usb/dvb-usb/af9005.c
index 13604e6acdb8..30e615958293 100644
--- a/drivers/media/usb/dvb-usb/af9005.c
+++ b/drivers/media/usb/dvb-usb/af9005.c
@@ -445,7 +445,7 @@ static u32 af9005_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm af9005_i2c_algo = {
+static const struct i2c_algorithm af9005_i2c_algo = {
 	.master_xfer = af9005_i2c_xfer,
 	.functionality = af9005_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb/az6027.c b/drivers/media/usb/dvb-usb/az6027.c
index 2bc27710427d..03dd40e3833e 100644
--- a/drivers/media/usb/dvb-usb/az6027.c
+++ b/drivers/media/usb/dvb-usb/az6027.c
@@ -1062,7 +1062,7 @@ static u32 az6027_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm az6027_i2c_algo = {
+static const struct i2c_algorithm az6027_i2c_algo = {
 	.master_xfer   = az6027_i2c_xfer,
 	.functionality = az6027_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index 1d98d3465e28..5b80320501f5 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -287,7 +287,7 @@ static u32 cxusb_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 }
 
-static struct i2c_algorithm cxusb_i2c_algo = {
+static const struct i2c_algorithm cxusb_i2c_algo = {
 	.master_xfer   = cxusb_i2c_xfer,
 	.functionality = cxusb_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb/digitv.c b/drivers/media/usb/dvb-usb/digitv.c
index 32134be16914..57df884931c4 100644
--- a/drivers/media/usb/dvb-usb/digitv.c
+++ b/drivers/media/usb/dvb-usb/digitv.c
@@ -88,7 +88,7 @@ static u32 digitv_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm digitv_i2c_algo = {
+static const struct i2c_algorithm digitv_i2c_algo = {
 	.master_xfer   = digitv_i2c_xfer,
 	.functionality = digitv_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb/dtv5100.c b/drivers/media/usb/dvb-usb/dtv5100.c
index 56c9d521a34a..a960186479db 100644
--- a/drivers/media/usb/dvb-usb/dtv5100.c
+++ b/drivers/media/usb/dvb-usb/dtv5100.c
@@ -97,7 +97,7 @@ static u32 dtv5100_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm dtv5100_i2c_algo = {
+static const struct i2c_algorithm dtv5100_i2c_algo = {
 	.master_xfer   = dtv5100_i2c_xfer,
 	.functionality = dtv5100_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb/dvb-usb.h b/drivers/media/usb/dvb-usb/dvb-usb.h
index cbb0541d4dc1..9f7a897b33ea 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb.h
@@ -309,7 +309,7 @@ struct dvb_usb_device_properties {
 		struct dvb_rc core;
 	} rc;
 
-	struct i2c_algorithm *i2c_algo;
+	const struct i2c_algorithm *i2c_algo;
 
 	int generic_bulk_ctrl_endpoint;
 	int generic_bulk_ctrl_endpoint_response;
diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 79e2ccf974c9..ec9e0cfaf581 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -839,37 +839,37 @@ static u32 dw210x_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm dw2102_i2c_algo = {
+static const struct i2c_algorithm dw2102_i2c_algo = {
 	.master_xfer = dw2102_i2c_transfer,
 	.functionality = dw210x_i2c_func,
 };
 
-static struct i2c_algorithm dw2102_serit_i2c_algo = {
+static const struct i2c_algorithm dw2102_serit_i2c_algo = {
 	.master_xfer = dw2102_serit_i2c_transfer,
 	.functionality = dw210x_i2c_func,
 };
 
-static struct i2c_algorithm dw2102_earda_i2c_algo = {
+static const struct i2c_algorithm dw2102_earda_i2c_algo = {
 	.master_xfer = dw2102_earda_i2c_transfer,
 	.functionality = dw210x_i2c_func,
 };
 
-static struct i2c_algorithm dw2104_i2c_algo = {
+static const struct i2c_algorithm dw2104_i2c_algo = {
 	.master_xfer = dw2104_i2c_transfer,
 	.functionality = dw210x_i2c_func,
 };
 
-static struct i2c_algorithm dw3101_i2c_algo = {
+static const struct i2c_algorithm dw3101_i2c_algo = {
 	.master_xfer = dw3101_i2c_transfer,
 	.functionality = dw210x_i2c_func,
 };
 
-static struct i2c_algorithm s6x0_i2c_algo = {
+static const struct i2c_algorithm s6x0_i2c_algo = {
 	.master_xfer = s6x0_i2c_transfer,
 	.functionality = dw210x_i2c_func,
 };
 
-static struct i2c_algorithm su3000_i2c_algo = {
+static const struct i2c_algorithm su3000_i2c_algo = {
 	.master_xfer = su3000_i2c_transfer,
 	.functionality = dw210x_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb/m920x.c b/drivers/media/usb/dvb-usb/m920x.c
index c88a202daf5f..809f69e90975 100644
--- a/drivers/media/usb/dvb-usb/m920x.c
+++ b/drivers/media/usb/dvb-usb/m920x.c
@@ -319,7 +319,7 @@ static u32 m920x_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm m920x_i2c_algo = {
+static const struct i2c_algorithm m920x_i2c_algo = {
 	.master_xfer   = m920x_i2c_xfer,
 	.functionality = m920x_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb/opera1.c b/drivers/media/usb/dvb-usb/opera1.c
index 268f05fc8691..301b16e33e5f 100644
--- a/drivers/media/usb/dvb-usb/opera1.c
+++ b/drivers/media/usb/dvb-usb/opera1.c
@@ -155,7 +155,7 @@ static u32 opera1_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm opera1_i2c_algo = {
+static const struct i2c_algorithm opera1_i2c_algo = {
 	.master_xfer = opera1_i2c_xfer,
 	.functionality = opera1_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb/pctv452e.c b/drivers/media/usb/dvb-usb/pctv452e.c
index 2aab49003493..3ec1c9a14d93 100644
--- a/drivers/media/usb/dvb-usb/pctv452e.c
+++ b/drivers/media/usb/dvb-usb/pctv452e.c
@@ -906,7 +906,7 @@ static struct stb6100_config stb6100_config = {
 };
 
 
-static struct i2c_algorithm pctv452e_i2c_algo = {
+static const struct i2c_algorithm pctv452e_i2c_algo = {
 	.master_xfer   = pctv452e_i2c_xfer,
 	.functionality = pctv452e_i2c_func
 };
diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
index df90c6c5f3b9..b36800870024 100644
--- a/drivers/media/usb/dvb-usb/technisat-usb2.c
+++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
@@ -199,7 +199,7 @@ static u32 technisat_usb2_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm technisat_usb2_i2c_algo = {
+static const struct i2c_algorithm technisat_usb2_i2c_algo = {
 	.master_xfer   = technisat_usb2_i2c_xfer,
 	.functionality = technisat_usb2_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb/ttusb2.c b/drivers/media/usb/dvb-usb/ttusb2.c
index 373ffa7f641e..af80e02b26ee 100644
--- a/drivers/media/usb/dvb-usb/ttusb2.c
+++ b/drivers/media/usb/dvb-usb/ttusb2.c
@@ -434,7 +434,7 @@ static u32 ttusb2_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm ttusb2_i2c_algo = {
+static const struct i2c_algorithm ttusb2_i2c_algo = {
 	.master_xfer   = ttusb2_i2c_xfer,
 	.functionality = ttusb2_i2c_func,
 };
-- 
2.46.0


