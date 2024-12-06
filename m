Return-Path: <linux-media+bounces-22781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DB79E68D0
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33D62166CB5
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2481DFDAE;
	Fri,  6 Dec 2024 08:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QArz5pH3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60E91F8F03;
	Fri,  6 Dec 2024 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473649; cv=none; b=WkxT2pqLK4YiUAQFbcgD5+bQWehCfYXbxYD+6Ei322XhKE9toRaeDDC3CCmba3E0pX06VufmFq/dYpAxIDE+VmnUlYUITP+IMTSAyuDComrr6dHrVvUnwyRmkMCWFXzGq5uVBLd18A4pRxPse2Wmtp8nLFcpgKG9cD3dlT3gdaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473649; c=relaxed/simple;
	bh=GWJwFSuB1YRWNMi1zmAD0t90+bvcyNMh2WeX8gJmBeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8fitqICS2RlqxV11HP+0Fd3xhUy8/kiPoaIxdTSLNrIbuVXbZNj0RRhofn/pq2eUPWMl81Awv4umYAAfzV1b2DoVAbmxQ3PPrj5hHlOFx4Ih5h0aKrirDNlOmjXbZNpFMjlUhgP7UcHm+VJEA69+TYdP1T0wdb3P1BE3azQ9QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QArz5pH3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAE031966;
	Fri,  6 Dec 2024 09:26:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473609;
	bh=GWJwFSuB1YRWNMi1zmAD0t90+bvcyNMh2WeX8gJmBeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QArz5pH39BF7A/3MKtmKkVT8ZzTtZwTXAaX6oy2N0vvtDX8SDV0bDxcWF9XdXBwxJ
	 uQq/KATEX3h0qrFYab8QM0Nq9YcaAjkYuvltudDhlFM2rGt3vkjgF6PoLmUQWxfq2K
	 RcwpRkO84OAmFJr6LRXtBj6Lr+fQi+BlfYnhsRB0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:43 +0200
Subject: [PATCH v4 07/15] media: i2c: ds90ub960: Add support for I2C_RX_ID
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-7-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=GWJwFSuB1YRWNMi1zmAD0t90+bvcyNMh2WeX8gJmBeA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVdQLJSFp6rSfrjGYqsTp/MlUQGvao0gVKit
 cBHLU5bDQKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1XQAKCRD6PaqMvJYe
 9RA8D/93AVwmXH6mVCtSZ9DMr066z2SaPDxh8DFA0irQ40+Zj117K+d81axuFOi7O4Wf6jAUpiQ
 lQS1DpPxMHdMm/9jiQuQT+dKoTX9ZZYrTU6OQaL736jnHHRCI82Gd0QhjURbKPQ5W9hEmGcoOva
 qptN5cBcPCP5rAWo7a3EnvajSOSx/g6Y4qKjjoavVmD6P3bxjVyC2SruWlHAQrTZIA/4S6xIAgL
 qshbFQoXIw/uBR2aSpCV0nKGLpX50OfMyVkfc8ZxdIeJU8aSHq5Pm17GEuiT5vhmEW1kDZRdog/
 KRI9ccblUJ0EHX26ocKqFBVx/clAOfBZRiT6nRRT/UBvok0avu+4SyUHDWuqbVi6n4GAPqHCQBj
 9yf6xvgoYHevgD0+I8BybdVzA3lwqpkb1+PPz+UG+k+i3NaclXLHGr/llqD4Ezz/jdvvkwE7n/q
 //Ffa+IjBHxff1duLw1ykXRgm2G0AsZH7Bp5E5oH4m3Ae08u31mVbvtKp8xi2lolOTY9Q0R92AO
 E2TuzcNdJFo5NEP9itNbX8I8gDmp0K1E45rKIieAtSB++Qk3BJMvXFzYzvMWmbofzLX4yiL3/7w
 xDrBg0wD/ObQuXe4K7zz47SgMnhDBBfM0qI7IZM5gycNvDFs8IUgHvgT6ES785StNEaMbBJYUnL
 gdM00Rc/e1AiddQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Normally the driver accesses both the RX and the TX port registers via a
paging mechanism: one register is used to select the page (i.e. the
port), which dictates the port used when accessing the port specific
registers.

The downside to this is that while debugging it's almost impossible to
access the port specific registers from the userspace, as the driver can
change the page at any moment.

The hardware supports another access mechanism: using the I2C_RX_ID
registers (one for each RX port), i2c addresses can be chosen which,
when accessed, will always use the specific port's registers, skipping
the paging mechanism.

The support is only for the RX port, but it has proven very handy while
debugging and testing. So let's add the code for this, but hide it
behind a disabled define.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 84631909635c..bd575bca2b42 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -55,6 +55,15 @@
 
 #define MHZ(v) ((u32)((v) * HZ_PER_MHZ))
 
+/*
+ * If this is defined, the i2c addresses from UB960_DEBUG_I2C_RX_ID to
+ * UB960_DEBUG_I2C_RX_ID + 3 can be used to access the paged RX port registers
+ * directly.
+ *
+ * Only for debug purposes.
+ */
+/* #define UB960_DEBUG_I2C_RX_ID	0x40 */
+
 #define UB960_POLL_TIME_MS	500
 
 #define UB960_MAX_RX_NPORTS	4
@@ -351,7 +360,7 @@
 #define UB960_SR_FPD3_RX_ID(n)			(0xf0 + (n))
 #define UB960_SR_FPD3_RX_ID_LEN			6
 
-#define UB960_SR_I2C_RX_ID(n)			(0xf8 + (n)) /* < UB960_FPD_RX_NPORTS */
+#define UB960_SR_I2C_RX_ID(n)			(0xf8 + (n))
 
 #define UB9702_SR_REFCLK_FREQ			0x3d
 
@@ -4001,6 +4010,12 @@ static int ub960_probe(struct i2c_client *client)
 	schedule_delayed_work(&priv->poll_work,
 			      msecs_to_jiffies(UB960_POLL_TIME_MS));
 
+#ifdef UB960_DEBUG_I2C_RX_ID
+	for (unsigned int i = 0; i < priv->hw_data->num_rxports; i++)
+		ub960_write(priv, UB960_SR_I2C_RX_ID(i),
+			    (UB960_DEBUG_I2C_RX_ID + i) << 1);
+#endif
+
 	return 0;
 
 err_free_sers:

-- 
2.43.0


