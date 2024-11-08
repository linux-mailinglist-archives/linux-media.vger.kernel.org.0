Return-Path: <linux-media+bounces-21128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C69C193D
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 000381F24556
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E5B1E3DF0;
	Fri,  8 Nov 2024 09:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NFf5V4YJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E51E1E3777;
	Fri,  8 Nov 2024 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058525; cv=none; b=T7Xj/4jutAYfe0pijG3fl8IRU0q/AP0gZS3CtdBn5CT3p6erFiQErmlbXCii/mLttbt8Emv753O6xxu9aqvWoaYoP0Rl0j87Z8xOcCcKPMRxMA1f9R0wLtTGiBBF+byaTVfDAiQKrYm4mqlylZWfYvhrkZpOt6ZxPXnGhp6vQP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058525; c=relaxed/simple;
	bh=B28bP5gitkgMyKQMXM8TB9xGzVrPus9N9HaZDbrOPW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ArvyLxe+2y+hp2Yy+0hp/kxX8qgNEild479TkaPsVWGZWAqm5szBdfL6QhY+SmNVmXtuJW7kG2/9fC0pKkOzbTnUvAdFbAQpUrIXSXYqgT1Vra7vXkcCdBAlAYwkdqaptOjjWEiNC02pxjXdPmrREZNjKM2l0beg6geQ9ciCiQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NFf5V4YJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 634CBE7C;
	Fri,  8 Nov 2024 10:35:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058508;
	bh=B28bP5gitkgMyKQMXM8TB9xGzVrPus9N9HaZDbrOPW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NFf5V4YJVG/ndo+9Co48JfCSCrMn+lG8aXEIwQLZybDqZU53ciK4EjhDEO+pR6l1d
	 3O1LVGwzuevJbYobw0TuDmNSGkwUK0OsoxMnnkhzl5dZrTgJyo23Vbbd/64bHQOnU9
	 HXg0EBbuGealwg2PXrkyHeAfFfTJv2h7bZ9cLNRY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:48 +0200
Subject: [PATCH v2 04/15] media: i2c: ds90ub960: Use HZ_PER_MHZ
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-4-c7db3b2ad89f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=B28bP5gitkgMyKQMXM8TB9xGzVrPus9N9HaZDbrOPW8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtOT/G6nkqb1ne0/12bzGsFLUemd5CtBhBug
 svemUVIxFSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bTgAKCRD6PaqMvJYe
 9ShJD/9ooDicadY0kFLETGXH7NBnr2yLGSLOZrn2Fuxpc1NjREY6TLTLQVGAdemii2hqiPFdKZZ
 2jtx4PnUQteSGvk1Errr9ZqYJbdIXIxasR7c29+Y5wtej906HtmlySeYPjHAnPE6+Brsbnlv4Ds
 wEUlvd6FsVgOJf7XUPvA2ia9KbwSzNNK+RMhSXcTsk9yy1su8A7qBQgrfGKLWtm1XAtQqTr1yb3
 mskrMpLF3H2kRsDz8dcf+T7OkU/th/9VHSyh2S7Im7f6i8JUUXv4OGKoENw7IovWNupvoWpjuyQ
 8t+5HV/erMszOpTU/A/qGH3exzwGzzHa62N2JUv8/TtxDMiFj5z0sIV3icWrO/bNOjNIZU0a3Wi
 4GKNlOrhcqlVWd8+1VMI1wtqmNz0q/J4fe9ILvM+pTVWFUX5pyw4u+SB9oo3SszTwurw+IYMiKR
 SebT5yDfn8OLgPAoo+XYcT8jTObFJ/0jYrh4NOQyz2F51CADeObMA1qVf9nOR93Y9kQke0070Q9
 2B9cEL05F3WVR4KcPFkKSJKyx6vL5uv33nkxzIoqRMUg2l7TC2JPY/GEEVAsyGCwpIvSGM2loMU
 Xz9S1uWjbAH7XBNUokziybtiehcnV5SNDJwt7ik4Aumpa4kxolInKSM2K8wAgI8nuFDIGcRz6ih
 M3CkSSPhM1ONMHQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use HZ_PER_MHZ instead of 1000000U.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 24198b803eff..6266a4558eb8 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -43,6 +43,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 #include <linux/workqueue.h>
 
 #include <media/i2c/ds90ub9xx.h>
@@ -1579,7 +1580,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 
 		if (priv->hw_data->is_ub9702) {
 			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
-				nport, (v * 1000000ULL) >> 8);
+				nport, ((u64)v * HZ_PER_MHZ) >> 8);
 		} else {
 			ret = ub960_rxport_get_strobe_pos(priv, nport,
 							  &strobe_pos);
@@ -1593,7 +1594,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 			dev_dbg(dev,
 				"\trx%u: locked, SP: %d, EQ: %u, freq %llu Hz\n",
 				nport, strobe_pos, eq_level,
-				(v * 1000000ULL) >> 8);
+				((u64)v * HZ_PER_MHZ) >> 8);
 		}
 	}
 
@@ -3020,7 +3021,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 		dev_info(dev, "\trx_port_sts2 %#02x\n", v);
 
 		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v16);
-		dev_info(dev, "\tlink freq %llu Hz\n", (v16 * 1000000ULL) >> 8);
+		dev_info(dev, "\tlink freq %llu Hz\n", ((u64)v16 * HZ_PER_MHZ) >> 8);
 
 		ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v16);
 		dev_info(dev, "\tparity errors %u\n", v16);
@@ -3856,7 +3857,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 
 	dev_dbg(dev, "refclk valid %u freq %u MHz (clk fw freq %lu MHz)\n",
 		!!(dev_sts & BIT(4)), refclk_freq,
-		clk_get_rate(priv->refclk) / 1000000);
+		clk_get_rate(priv->refclk) / HZ_PER_MHZ);
 
 	/* Disable all RX ports by default */
 	ret = ub960_write(priv, UB960_SR_RX_PORT_CTL, 0);

-- 
2.43.0


