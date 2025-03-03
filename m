Return-Path: <linux-media+bounces-27367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0748FA4C61D
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A27C189458A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F26122ACF2;
	Mon,  3 Mar 2025 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wfaTBfTL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2A82135CB;
	Mon,  3 Mar 2025 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017781; cv=none; b=NOPLzZln+wXSyvY8gXpdMaQ91auKL1/iNCniL6WX9kNPycnJGQceGtYNzdjZvUc+SjkwqbHN1Ij0BlhOqSoPJjSe5kG2LcD6XxS++GCCvx3LBtveXRbR6HKoIXP9tiXbXzbdVTR+uXivk0A5tLpCm+exe2Hsvotpe0fhrx1LBJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017781; c=relaxed/simple;
	bh=czBTmpZfnooV5Lyf9ne91pF0c/KGEb0bQZxbCikkAaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsgFGKYWkFmt8a6mvG28EtgQMrEPXpS8t6zWN+wXkGFn6nM7U28ZTlsF1rv5KKqP0LO4t8R8hkL2b9GqdFuK93amDVC9KxtKQrs0KP9QmwUHL3jOAbo+BHTR0lqzLjfHd8+1qR9j0I3ZgSYPF8xOF8cVrWF+1PStWdg5HuPeaHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wfaTBfTL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 026AB1189;
	Mon,  3 Mar 2025 17:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017687;
	bh=czBTmpZfnooV5Lyf9ne91pF0c/KGEb0bQZxbCikkAaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wfaTBfTLHBwW0jakFXp8JM64xTpgYmqz6b8Jd4A5xhelPbKbXK4KrYjtWb7LiJklQ
	 sJw766G+kHh09XirJcNEczkqaE89Uwsojyg6Ni0BIJh5wwVZfWHSLxcOyLaP1mgmSs
	 XVwV/9CCbgRV8xZlLJRFxAfGwirT8JMs0Ej8ysOM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:11 +0530
Subject: [PATCH v3 08/19] media: i2c: ds90ub953: Speed-up I2C watchdog
 timer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-8-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=czBTmpZfnooV5Lyf9ne91pF0c/KGEb0bQZxbCikkAaY=;
 b=owEBbAKT/ZANAwAIAUPekfkkmnFFAcsmYgBnxdJ/jpOhLF4h6b407RhAwwGmIJbtc8XY3L4rb
 nqtwuOEBjmJAjIEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSfwAKCRBD3pH5JJpx
 RUWYD/Y/naI4y2HjgIO+LbudtMlcBJ9YjHVorxqiwpPttiqiKcHG1mdxSL0MiEK24HlnXNhQORr
 XUl3jvFS3Hl9DTZYxyJyZYN0oa1JEIbD9DJTkZlGM558GPBRJUcXhJ6lGi3dmU8rlis6vxFJ4L9
 GKcOY60nJCqW8AzXGsmU84yCEeq08HTy79EK6MwW2mqMJyT+Ii1YAz2Kfy/3AKPW/js4LukmI40
 q/OMe4RaaSQUJKqWz/Fm/4Ly+lnI6ABg5SswUXcOW64PfidXKHSiUJXacteVpjCj0uuo8GZxkDO
 W/TwP4/9trYVhuUMEQ4dPoZVRYSqwxZGy0/F29M8JPNHhdh2hZjfU2wfuyDEVazlbIAaEH3Dfkh
 LFsuZMqLCOOVU36zcMnvadSCAXWjz10QXKklgROpX7SberRisYmcc2mWGBKk5kig8U501Jgj3Zt
 XqUQYl6DEsJ1HAEO/mm7CZFlB0UBfjTT/AKYt9dPTLpXeJspzKaYjXty97nakFObbBE1SdIohFf
 /R6TSLrLyr1CuchkghxbN5JeC5Tb9GJDjU8V+/YmZvlgPPmsWa854frNvvI39ZvpepB5VnVTZy4
 hXwe/IyGBb97ihRO43IY6XFKGw1SF67wI7dNWRAAASGV20ev6o1cGc/XvpNIbiIXnxmH1Dtw8N5
 8v7ZQIneoXeqB
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

On the I2C bus for remote clients (sensors), by default the watchdog
timer expires in 1s. To allow for a quicker system bring-up time, TI
recommends to speed it up to 50us [1].

[1]: Section 7.3.1.1 - https://www.ti.com/lit/gpn/ds90ub953-q1

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes from v2:
- Use unsigned value for left shifting
- Re-introduce temp variable v that was dropped as it makes it easier to
  read IMHO
- Remove redundancies like initializing v = 0 and if (ret) return ret at
  the end of the function
---
 drivers/media/i2c/ds90ub953.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index a08aad3f7fe09f7b396da9c720ed9993d392410c..a5c23e94f4eab5896a2114cfdf2e5f68cde77568 100644
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
 
@@ -1320,7 +1324,12 @@ static int ub953_hw_init(struct ub953_data *priv)
 	if (ret)
 		return ret;
 
-	return 0;
+	v = 1U << UB953_REG_I2C_CONTROL2_SDA_OUTPUT_SETUP_SHIFT;
+	v |= UB953_REG_I2C_CONTROL2_BUS_SPEEDUP;
+
+	ret = ub953_write(priv, UB953_REG_I2C_CONTROL2, v, NULL);
+
+	return ret;
 }
 
 static int ub953_subdev_init(struct ub953_data *priv)

-- 
2.48.1


