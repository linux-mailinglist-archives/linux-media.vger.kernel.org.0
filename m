Return-Path: <linux-media+bounces-11297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 952ED8C1FDA
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C64331C21583
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7E514A0AD;
	Fri, 10 May 2024 08:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="s9ihxDya"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B97E5339A;
	Fri, 10 May 2024 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715330235; cv=none; b=ms4lC2fq4/rLtSYT6mcWi+qXB/3JooEhSnx82OrQ9tk72pnlGcAUVKMJJe3oF2CMNQPGAj/8mt8BqICqjhWW/GAfGvzWZQhXXBOhnyT4PUUvJcoSqJr8AzhwZ8qwaQn+r8FORFZDWwYWZs4eTvP/qNZoHs2QTmHxULUmcpSmvLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715330235; c=relaxed/simple;
	bh=ho6y2eiGzKmKxS7SJvcX41zaBIRbDgw/6Tjm/gP5XA8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IAHTBMcu91N3ql+jpSDq+SvSeFbkuuwdsC2R7wjYArVoUElq4FfAetk3FnLB5vBmeufj1xz2bpcOamtPJ0LGsJ/FitSVd5Pr/wGs+3IV1vU5XbAsaebtX8cmEPHxVV0nArsGpj3JwL/iteWrrQAYKB7scJmvbppelg0wGa3HDtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=s9ihxDya; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44A8avDI125634;
	Fri, 10 May 2024 03:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715330217;
	bh=lrdTPlSx5uWnTmoVruaPcAiqQdb2LlFFka9SllqeKfQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=s9ihxDyaEkFoT1qugagSFAZqnMrFjFJT4bZxrZHjNX76TqLPV/S7fTiCwDAyVefbO
	 mpDbb7wkkTYcJeUAHj4le3pfGlNxtfWTX/Hcku1VrTs7LWWHLz3U+tzXnBh0T+t4wS
	 pwMqCF8M3wFllwNLX6ehlVeHHeheZeE488hBEbFs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44A8avfc019127
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 May 2024 03:36:57 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 May 2024 03:36:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 May 2024 03:36:57 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44A8auaK080419;
	Fri, 10 May 2024 03:36:56 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
        <andriy.shevchenko@linux.intel.com>, <adobriyan@gmail.com>,
        <jani.nikula@intel.com>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>
Subject: [PATCH RESEND v7 6/8] math.h Add macros to round to closest specified power of 2
Date: Fri, 10 May 2024 14:06:55 +0530
Message-ID: <20240510083655.1281540-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240510082603.1263256-1>
References: <20240510082603.1263256-1>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Add macros to round to nearest specified power of 2. Two macros are added :
round_closest_up and round_closest_down which round up to nearest multiple
of 2 with a preference to round up or round down respectively if there are
two possible nearest values to the given number.

This patch is inspired from the Mentor Graphics IPU driver [1] which uses
similar macro locally and which can be updated to use this generic macro
instead along with other drivers having similar requirements.

[1]:
https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V1->V6 (No change, patch introduced in V7)
---
 include/linux/math.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/math.h b/include/linux/math.h
index dd4152711de7..82ee3265c910 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -34,6 +34,42 @@
  */
 #define round_down(x, y) ((x) & ~__round_mask(x, y))
 
+/**
+ * round_closest_up - round to nearest specified power of 2 with preference
+ *		      to rounding up
+ * @x: the value to round
+ * @y: multiple to round to (must be a power of 2)
+ *
+ * Rounds @x to nearest multiple of @y (which must be a power of 2).
+ * The rounded value can be greater than or less than @x depending
+ * upon it's nearness to @x. If there are two nearest possible values,
+ * then preference will be given to the greater value.
+ *
+ * Examples :
+ * round_closest_up(17, 4) = 16
+ * round_closest_up(15, 4) = 16
+ * round_closest_up(14, 4) = 16
+ */
+#define round_closest_up(x, y) round_down((x) + (y) / 2, (y))
+
+/**
+ * round_closest_down - round to nearest specified power of 2 with preference
+ *			to rounding down
+ * @x: the value to round
+ * @y: multiple to round down to (must be a power of 2)
+ *
+ * Rounds @x to nearest multiple of @y (which must be a power of 2).
+ * The rounded value can be greater than or less than @x depending
+ * upon it's nearness to @x. If there are two nearest possible values,
+ * then preference will be given to the lesser value.
+ *
+ * Examples :
+ * round_closest_down(17, 4) = 16
+ * round_closest_down(15, 4) = 16
+ * round_closest_down(14, 4) = 12
+ */
+#define round_closest_down(x, y) round_up((x) - (y) / 2, (y))
+
 #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
 
 #define DIV_ROUND_DOWN_ULL(ll, d) \
-- 
2.39.1


