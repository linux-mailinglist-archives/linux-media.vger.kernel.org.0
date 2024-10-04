Return-Path: <linux-media+bounces-19096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5E09906C2
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C68781F22AB0
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6281AA7B7;
	Fri,  4 Oct 2024 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HmGQ9Fd9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026CE1AA781;
	Fri,  4 Oct 2024 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053247; cv=none; b=Nt+HIn0LxlzeuYldzVKlNImNv0EWOK8TPWu0jJz/4Fw2j3Ksx6CrNxk0tBbHkYKArNQxz8zAhkuYosMCzaQSdWM8Qt3NOeGR/3vsrQNbfz5J+xoWvKhiKN6smmojzFRrazUf6KgXu3rbycg1nPeLGerK5JUDewoH3pkIyFbiurY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053247; c=relaxed/simple;
	bh=qSsCPcVGpH7f2IeTssjNx0a1UIzRf92jRLnvfrYF2BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+hob0S7bIs0FTD8PSfKVQKm/APQXpDyI3FCB9yGBzXoywoApcF+lVMklGLN23jVVQWzQGOzSIqIqE1oJRR65jf6XlGiS5fCGC7rMzFIwhiSbF37dYIQJMzUW63T7nUk25Cea4KRivqpN55+7nGpBd3rVuNJLjgxGo7k6rBk8NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HmGQ9Fd9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6EE7EF3;
	Fri,  4 Oct 2024 16:45:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053143;
	bh=qSsCPcVGpH7f2IeTssjNx0a1UIzRf92jRLnvfrYF2BM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HmGQ9Fd9gK75DtvorqrZRhgDi3a9h/kdvRxATmYLjzQ6NM+ZfXRF33ojGrshY9x7b
	 s2/6bI1iZmZcJ8U18RIDjt/gUwLdvSmfDudA35qmf3cf2DPCiKgvQ64uwpuwq8JQg/
	 eiKyWsWZDhRxtNxo+eHE+oJ0/LlShDQf0+YrlgD4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:37 +0300
Subject: [PATCH 06/13] media: i2c: ds90ub960: Add support for I2C_RX_ID
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-6-e30a4633c786@ideasonboard.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
In-Reply-To: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
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
 bh=qSsCPcVGpH7f2IeTssjNx0a1UIzRf92jRLnvfrYF2BM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///tNONn6XaEMKvmcyGfNpIXPYdLRgDOf7P6z
 D7dnvDkcKaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//7QAKCRD6PaqMvJYe
 9SfyD/9vQ/T9R79l5MBY96j8Uhwh0l9YK8FvGuvfkMe9Flkpt+wXCKy6rpkUjYfcUEm06wdZKjH
 /39OCQILrbuXMUlhTapg8WGIc3z+C+LAokb8obV5uziCx6aLDObXgn0h7XqucuoeTYLS+grFXCu
 T+b+Q55f/B48PbF8e5voG48LkU10c3TKKT7nrUntXsxRQN1XkcZ5lNKdKeFBfgz05S5XJYsH9Sg
 +gU+WA+CDaVdGYhs1CyCWx1iOnxYYF437hEt8wRmz30w/mDNjXa7+Qjvc3W32rReiA0k4JRH/5J
 IlcFK9KLATNEF8TbM8T3KTlPNRVGcUwXvkMTp5nKcL2HVSD030dwa6nibtw1TgvzocQpPMBaMLw
 khmjVt8ohGolz8ZnJGWXzLQ4CBtN63ga7NzAe0YiDpyhSbzEJ+tHzpEb6FqeUczUywKffOZSgSF
 umgWaZ+qg4E7aFF83Y2AktqCSDYPb3+tyex4rwIvN+cskDKr9txXr35NmVW+epj2Z9CSAuA8WF/
 vzzAfRz/UTnZl76G2Ba3f4yRRSKyVIE+tRx7scKefSVb3BcYjTv0/yL/vqk5vHxQWxbcYWc9Jog
 1zSRoQCwiudT4mGyNHVg6WChqhpKcPipWWUWhsHn/BAsUq0SCWtaH6kebOhobGcInLYpjNXaSHx
 y3v7SHlkTSJzRCg==
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
index 9dc36bba0a87..5238088e23e2 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -54,6 +54,15 @@
 
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
@@ -350,7 +359,7 @@
 #define UB960_SR_FPD3_RX_ID(n)			(0xf0 + (n))
 #define UB960_SR_FPD3_RX_ID_LEN			6
 
-#define UB960_SR_I2C_RX_ID(n)			(0xf8 + (n)) /* < UB960_FPD_RX_NPORTS */
+#define UB960_SR_I2C_RX_ID(n)			(0xf8 + (n))
 
 #define UB9702_SR_REFCLK_FREQ			0x3d
 
@@ -4002,6 +4011,12 @@ static int ub960_probe(struct i2c_client *client)
 	schedule_delayed_work(&priv->poll_work,
 			      msecs_to_jiffies(UB960_POLL_TIME_MS));
 
+#ifdef UB960_DEBUG_I2C_RX_ID
+	for (unsigned int i = 0; i < 4; ++i)
+		ub960_write(priv, UB960_SR_I2C_RX_ID(i),
+			    (UB960_DEBUG_I2C_RX_ID + i) << 1);
+#endif
+
 	return 0;
 
 err_free_sers:

-- 
2.43.0


