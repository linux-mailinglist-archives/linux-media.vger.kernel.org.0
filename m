Return-Path: <linux-media+bounces-21131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDF89C1943
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DFCFB23CA6
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792811E4938;
	Fri,  8 Nov 2024 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kz1YJWh8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476D01E47C1;
	Fri,  8 Nov 2024 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058529; cv=none; b=JlV0zGir/SD7tKEpOknm4K6zaBhVv60c/V9n/1OA26zcEQfIkz4TazdFZTqmnjjMjAm0Q0oi0XLPZXZGeBKOdS2SHXl4/nNQlD3YskGnVzGppS3i48tgmKYjoZtmKX1WqnL3hXGhjd72nHwIndMl8p9vziGoQ/jkHBJZ5vaA1sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058529; c=relaxed/simple;
	bh=4OfPIQt0zMS+sz9kFlchXcDE+D5zy5L6pKGSTiX11uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxUgGfHlqOkjfUJM/W5UzE62HkN6hjeoAxrtwcd36BWvZfw8Q0S1COdFyugbGRX0rQHTwzWAyxhuDgAikqNkcTQmI2j5g5DKs7JqN8d/ZHfm2pVtjfS8RWFhix3jXLmdyCKRI7cPBxdXdoIbMXdld19UcywL4gYrMMXMDC3Auvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kz1YJWh8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 250E9193E;
	Fri,  8 Nov 2024 10:35:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058510;
	bh=4OfPIQt0zMS+sz9kFlchXcDE+D5zy5L6pKGSTiX11uc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kz1YJWh8eWDGBrZWoME8sCvDjYZslZSKdCbtxxtuXyf645W7dznBvPZEta2dhMAGh
	 ZjHKuplzmJIogVl0Zwy6nRlnDsHQdGyiQ5y/8JzjI0Rs76UIu7kBMMWLrcYpT3vOjV
	 x6d9cOov0LJUgPQ5Z3Hz2s2mJmaDSaizK74pcrGA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:51 +0200
Subject: [PATCH v2 07/15] media: i2c: ds90ub960: Add support for I2C_RX_ID
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-7-c7db3b2ad89f@ideasonboard.com>
References: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
In-Reply-To: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2244;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=4OfPIQt0zMS+sz9kFlchXcDE+D5zy5L6pKGSTiX11uc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtPeSItwkurJvkmwYyL6atkrUnrD3ogsKlbq
 2ehmSYL8CyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bTwAKCRD6PaqMvJYe
 9VYND/9HFGUGOwsdNlI37fov5B2PNwjn/xFEtCRO/WM11AS2+pM7iTMBFPOKFG5VzE6SvrmFafd
 2NoRzPlLjORo7cGOB7Zj9aDYGfS3zuaGTRYxaYdzNtPQSpaStE2Y/lUeHQBCEI2Z7pi3cjtmXPH
 KDrpiroPStIyaT9Ybtxgft46jlP0BfPLv0cEH1/jpIoNB6X2pK82q+xwNh93e62pNFY87kTe0dp
 0lUqEhnlBFd1SAK9Msf12FxfhypBQYop6eTo9yhwJO50yaxej8scNiiOo7nFlYxDOmX0UNrpsFP
 az+kIhdnOspTmy3FzBcWqsb6nmHOTHEpwq8VZqwYVM9LJjFut0gRCZE7ufWx5Zk3R9mjEzf37AE
 xXLeVs971oKjWJvkhlu/WENs+aUbh49Ty/TnaEiPmU3M0lExFw4MzlSmi4+pdQZT22rnxUjRfje
 gPUlPlTnoIseng+O/uHJLMuQ1ynd7AoF+wHYXJklXW2C1uRoDNGIfgp1NbrA3Y6waMHI9BerFO6
 SnxeqmTxWsSzQcrluiwZ4YFTZ8sM+KJh092UQKT2nzRahUnOaekNKBiWnHt3/WKnNYrjWIsiUN/
 ZT0pAzY6KtJcRoaCFYbzx6S4eZn5PngTzwrqtUYNnzApu2AzLS6b/l0jFHryY4N+UMsIxluJzO5
 YIZ1C55Gu+qvJYA==
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 98d815526341..03938def6ae9 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -55,6 +55,15 @@
 
 #define MHZ(v) ((u32)((v) * 1000000U))
 
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
+	for (unsigned int i = 0; i < 4; i++)
+		ub960_write(priv, UB960_SR_I2C_RX_ID(i),
+			    (UB960_DEBUG_I2C_RX_ID + i) << 1);
+#endif
+
 	return 0;
 
 err_free_sers:

-- 
2.43.0


