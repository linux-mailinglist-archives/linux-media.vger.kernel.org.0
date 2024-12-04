Return-Path: <linux-media+bounces-22597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73969E3851
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A561516152E
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0F71C1F12;
	Wed,  4 Dec 2024 11:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SN02lYlj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC81BD014;
	Wed,  4 Dec 2024 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310357; cv=none; b=hJ/vmLc3JvwTFosFCDFzVicNNUY8Gtaj3LQZUNfuWEWWqMcWQQUWRnSM4Bz7oJ6+lKB9mhGOzHRafdA8Y99YSooA9DZkUPPjOwSX3URCh5iae6CcQ3M7lY0k0l8BDyjkEQKI7hvW0aolQ9vuWMb7Bl5IkYysuCT+7v2aQ9KBn0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310357; c=relaxed/simple;
	bh=LcTkzRMj8n16JAAp2ctpyU8mBul44P0JDcLlKMR2mlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fCKWesHHFwP/4hwmj8ZpObMJGplb8P2DdQo9pq2kjSe9Bo4UpaZeXZ8wDesUK07mCWVvTV+KgRLzyAVE9sf1WHeZo/XFC0+5Vv2OBZ/T5Y24ruH6wQ+URWAMb/ZwIH20RSqEHGcl/UmwLP5C4vFLVwtyWCUbPdapcS6cRawz3ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SN02lYlj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAB9D157E;
	Wed,  4 Dec 2024 12:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310320;
	bh=LcTkzRMj8n16JAAp2ctpyU8mBul44P0JDcLlKMR2mlU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SN02lYlj4CLu2hyyXlZbuz8fSWVMIgn8Jor4OM44zw1+f15RIhelyfF9u1A9D5EhA
	 sDLJ332RDPDL6veyLBaIg2pFPom747fhzYA4I8nj84xE9LOS3X5M33Lp2holewZG0K
	 II1zPY4oEH/wjyDsq6U0pKblHvqwkQitc39u6gxM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:20 +0200
Subject: [PATCH v3 06/15] media: i2c: ds90ub960: Use HZ_PER_MHZ
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-6-a933c109b323@ideasonboard.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=LcTkzRMj8n16JAAp2ctpyU8mBul44P0JDcLlKMR2mlU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeDDj2N1BDnEYZnNtlEnXNb/4CrhhGkctte1
 XncBjmHwtGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3gwAKCRD6PaqMvJYe
 9SmoEACgX2EoExcCknhpChKYeuh8W6UFJr+to6FBICFba3vlOeal7GtKzK00JS6cyXQup98IDr1
 +EzL0VlVHFNS2DC8gS5IZuzikavqkIEBb6SNJ6TR+8sKxhqTGy73P3sjwrgyfVvC2hVseZN0XRh
 dfA4HogHxtSaWXWkmj2L7cmNZeakwQwCuGxCKgQYXweFFvH95VFiAJwPjyWZSIykmtqEgEH1YBz
 9SPlFZaZxulm6zPGiX2SxMR8KOX1SSvOXXFZu1kRojjFj+EtnwS1NQRvPbumG9IWzJ6c2wjCdCQ
 YAo7muRZv/X5lIRvvbk0h4NBOhl3ivxFmmoKfbVomo0/4hIbw6hhDQUKQ0BCd5O73wDkBdVQd4D
 loh+XCNSm60CIab/y5dV0XKah0CDoKJ7GfIZ+01d9CKHMd395kt4tAHDWnIN37Zsf4N6/zpKKoQ
 yKhQaDT7YFW9MK43hopZs7fybsV+u0q0tQlPYC90PGiFFsG/oY9ONnAnrZVu/LE9GwyYBLK40+x
 r1YYMPMjPRvVkhWF0lJNZ9HFr9hMxFnUqoKEtsgoDHHO2Oaq2jtE1zykZ9lfmTZgsGytycIxpe4
 IUAvPHwpsVhNyP0QvWUrMWJYcHuUNhqenkxRNYzbzf2FrtfFQd31doaeotDr+7xSh5vJX3Lu26E
 jCavL+j2t0UiCZw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use HZ_PER_MHZ instead of 1000000U.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index bfffa14e2049..98d815526341 100644
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
 
@@ -3066,7 +3067,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 		dev_info(dev, "\trx_port_sts2 %#02x\n", v);
 
 		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v16);
-		dev_info(dev, "\tlink freq %llu Hz\n", (v16 * 1000000ULL) >> 8);
+		dev_info(dev, "\tlink freq %llu Hz\n", ((u64)v16 * HZ_PER_MHZ) >> 8);
 
 		ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v16);
 		dev_info(dev, "\tparity errors %u\n", v16);
@@ -3866,7 +3867,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 
 	dev_dbg(dev, "refclk valid %u freq %u MHz (clk fw freq %lu MHz)\n",
 		!!(dev_sts & BIT(4)), refclk_freq,
-		clk_get_rate(priv->refclk) / 1000000);
+		clk_get_rate(priv->refclk) / HZ_PER_MHZ);
 
 	/* Disable all RX ports by default */
 	ret = ub960_write(priv, UB960_SR_RX_PORT_CTL, 0);

-- 
2.43.0


