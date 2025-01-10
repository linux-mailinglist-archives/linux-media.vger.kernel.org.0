Return-Path: <linux-media+bounces-24587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D479A08B22
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1C5D7A27C3
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748AE20B7EE;
	Fri, 10 Jan 2025 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sNW/B5Df"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162920A5FB;
	Fri, 10 Jan 2025 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500526; cv=none; b=Smj4rH9fTbezILQ72uKR5PbogtQcwyoLdopQJWcUQmLy96mc2uzzb5nHDMIfapZoBSmbJ1uZlpNHNgJMUiK9G/hNpBlN4aGpr8g9U0P8HGdEge7evL/rvbKkFdlOvOBDU8Dlewb3MBlX00KWjzBFJDItuKjQSTnK0o1vsKRGwgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500526; c=relaxed/simple;
	bh=p8Bj8Thaw/dlePmOBdZcBbm5AP9EbnHTYCi+x/1ar6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ttk+p8cWE9rVHJh1j/Ws9jt9MW+u1BMe86f7KhB9xFPJGchP8PQLAP3alkbBiTQHBrisOgHl9E8+ukC5iOlNlbDyWlPjtXFE0Itz5vl1qCAHn3XegKVGTjovZ1yqV9JbYDQbvGf9fh1JQz/4OffnvKBBlr5TQ1PCMbx/h8J0lFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sNW/B5Df; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 548171624;
	Fri, 10 Jan 2025 10:14:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500454;
	bh=p8Bj8Thaw/dlePmOBdZcBbm5AP9EbnHTYCi+x/1ar6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sNW/B5DfVsxPIlWs/gbDaOOxgTQIqNtndBMRrhhqWUD8dYBTiZIZpNSsIOyCVCOQO
	 uADsh07yPOZWPSjMJ9gR0N3/WNCQInCL5fHasihmZ30ofpSJY6obPRB/5gyFOSPBNG
	 NPkDbw2zhmiNs7AysDTn55g/cqSmFqG4B/oYT8UU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:07 +0200
Subject: [PATCH 07/19] media: i2c: ds90ub953: Speed-up I2C watchdog timer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-7-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dJ8Ay7yVp08Tnuu7iFHmWAeN4NOSMAkgHjh6Cw+88WE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUS4WBAO/hSAnDZ2LE77PqklVNfLRurmeoVR
 ZA8t/z+8vuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlEgAKCRD6PaqMvJYe
 9fv+D/0QVOa8We2WZqUExanJH7qxVr/sh8QiUGcKln+rojpbwWW7mUbJq38+TMWqNUJUfRdI5jI
 dFJ5/zRSicvw50YN8/PJZlooLO6rZuLBSrMRwcympNblfdOyPpFHGjiXSbl6dzUk+bjLMgNH+ac
 eLebJuh3Tj5DSJr4yD3PO2PeZ+4ANBvkXQw54hvZw764fR2GZenS2UoCt5F6YmNTTSjmdypk7Dm
 ATuZgXgtYb2WmTauuNUpqqOU3zrIw5SkBpe9w0ur2IGjmS72HZ+HLzAhlUMkJ0oHnb1Xj3oK6A0
 0Ij0eJztYXm7c9i0vxsWTG4usWFJy8Bsx8PksXbOmR/q2Q87plrInssM1pOWCjKAmmMcTMztwnV
 MsXyY1ydYur/ZMZKTMhETBxr/udS2BgUJ8SQE9zwneZlkL4HbkHvBWTlAmg6dPvimf27BBxv0Y1
 IxFC/QiG3L6vxzenvdgXGdV3kvZjQxKfDwp8jKYGWExB8vwjePeBozyFwfRrNT1j5eDpeZ4D5re
 NOspPyGft/qYSExut6r0FLyVdRoFf+cqST9uxSHq8LS6g5rE8dLzmkWrJ5Hrrc+toYMYG8IoD/B
 V936QvOcY5/7f+FMog4hRjw2MT00yOCoLpTiLCg9lVIwgNDruJ8rShUut9OVm+gzHNQ0p61o8Vs
 BFfmodCZpKsSGaw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Jai Luthra <jai.luthra@ideasonboard.com>

On the I2C bus for remote clients (sensors), by default the watchdog
timer expires in 1s. To allow for a quicker system bring-up time, TI
recommends to speed it up to 50us [1].

[1]: Section 7.3.1.1 - https://www.ti.com/lit/gpn/ds90ub953-q1

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 99a4852b9381..6c36980e8beb 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -54,6 +54,10 @@
 #define UB953_REG_CLKOUT_CTRL0			0x06
 #define UB953_REG_CLKOUT_CTRL1			0x07
 
+#define UB953_REG_I2C_CONTROL2			0x0a
+#define UB953_REG_I2C_CONTROL2_SDA_OUTPUT_SETUP_SHIFT	4
+#define UB953_REG_I2C_CONTROL2_BUS_SPEEDUP	BIT(1)
+
 #define UB953_REG_SCL_HIGH_TIME			0x0b
 #define UB953_REG_SCL_LOW_TIME			0x0c
 
@@ -1320,6 +1324,13 @@ static int ub953_hw_init(struct ub953_data *priv)
 	if (ret)
 		return ret;
 
+	v = 0;
+	v |= 1 << UB953_REG_I2C_CONTROL2_SDA_OUTPUT_SETUP_SHIFT;
+	v |= UB953_REG_I2C_CONTROL2_BUS_SPEEDUP;
+	ret = ub953_write(priv, UB953_REG_I2C_CONTROL2, v, NULL);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 

-- 
2.43.0


