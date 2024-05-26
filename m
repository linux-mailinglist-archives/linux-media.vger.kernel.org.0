Return-Path: <linux-media+bounces-11895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C388C8CF539
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 20:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8F44B20BEF
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 18:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E7012BE8B;
	Sun, 26 May 2024 18:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dIowYBlv"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88A412B143;
	Sun, 26 May 2024 18:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716746959; cv=none; b=MYG6PNMQD0rbGldX1EAPUYVQzXS7yHOfF/M/r8+el+nrseKCzBbsTQzulI1SMRRwhtnfY/ZQQ5KaoIRmi/i4aq3pfa8HffZF0iw58V87p9vhQc0rThNLrZwRzNP2ohrr5zGfE6sM2GxUlZkeTb+VlBbAe6a3lSjSgtnDUXO4Mjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716746959; c=relaxed/simple;
	bh=Tq9RID1eGKmAb/zrMSygHUy03Gm5AHToA9chpozOKRc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SBhxfn4P4wm4iROuwn9mDex0Sui9YhCKHczOh/XZ/jhX+3RiWjR8uol+u6ziAxWr4GlDbe8W1hWhKRBHYY7t0urepqsde819x+Pc8OJSYYzpL3vWVeXyGNsiKDxqGMNNw39ZVhRza5PcvgOkp7fyVNgFRudwonEdSqnmkVPxyjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dIowYBlv; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44QI8wBY104298;
	Sun, 26 May 2024 13:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716746938;
	bh=/myx6+rpJkcV9HaO4usFwZu1ENnKeJ95GZJJe/8hHwc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dIowYBlvb0rbGG1vxCGjSwfcUpzc2DQtmAeaZxIkAPKNW+o5pqKwkH/o0MK2FVwf8
	 CjbThW8KYtbv4FrcwnNrFprOoHfCKvASrpPZfjYKfkaX0sFlPDu/4g23FzSBDrb3kU
	 jE9JRwqdYhYdnw7pxB3PFZkGUISQGPqjoWLHnWCs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44QI8vlc107620
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 26 May 2024 13:08:57 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 26
 May 2024 13:08:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 26 May 2024 13:08:57 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44QI8ujr097209;
	Sun, 26 May 2024 13:08:57 -0500
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
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
Subject: [PATCH v9 06/10] math.h: Add macros for rounding to closest value
Date: Sun, 26 May 2024 23:38:56 +0530
Message-ID: <20240526180856.1124470-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240526175655.1093707-1-devarsht@ti.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Add below rounding related macros:

round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
power of 2, with a preference to round up in case two nearest values are
possible.

round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
power of 2, with a preference to round down in case two nearest values are
possible.

roundclosest(x, y) : Rounds x to closest multiple of y, this macro should
generally be used only when y is not multiple of 2 as otherwise
round_closest* macros should be used which are much faster.

Examples:
 * round_closest_up(17, 4) = 16
 * round_closest_up(15, 4) = 16
 * round_closest_up(14, 4) = 16
 * round_closest_down(17, 4) = 16
 * round_closest_down(15, 4) = 16
 * round_closest_down(14, 4) = 12
 * roundclosest(21, 5) = 20
 * roundclosest(19, 5) = 20
 * roundclosest(17, 5) = 15

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
NOTE: This patch is inspired from the Mentor Graphics IPU driver [1]
which uses similar macro locally and which is updated in further patch
in the series to use this generic macro instead along with other drivers
having similar requirements.

[1]:
https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480

V9:
- No change

V8:
- Add new macro to round to nearest value for non-multiple of 2
- Update commit message as suggested:

V1->V6 (No change, patch introduced in V7)
---
 include/linux/math.h | 65 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/include/linux/math.h b/include/linux/math.h
index dd4152711de7..e2cc3769ed0e 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -34,6 +34,54 @@
  */
 #define round_down(x, y) ((x) & ~__round_mask(x, y))
 
+/**
+ * round_closest_up - round closest to be multiple of specified value (which is
+ *                    power of 2) with preference to rounding up
+
+ * @x: the value to round
+ * @y: multiple to round closest to (must be a power of 2)
+ *
+ * Rounds @x to closest multiple of @y (which must be a power of 2).
+ * The value can be either rounded up or rounded down depending upon rounded
+ * value's closeness to the specified value. If there are two closest possible
+ * values, i.e. the difference between the specified value and it's rounded up
+ * and rounded down values is same then preference is given to rounded up
+ * value.
+ *
+ * To perform arbitrary rounding to closest value (not multiple of 2), use
+ * roundclosest().
+ *
+ * Examples :
+ * round_closest_up(17, 4) = 16
+ * round_closest_up(15, 4) = 16
+ * round_closest_up(14, 4) = 16
+ */
+#define round_closest_up(x, y) round_down((x) + (y) / 2, (y))
+
+/**
+ * round_closest_down - round closest to be multiple of specified value (which
+ *			is power of 2) with preference to rounding down
+ *
+ * @x: the value to round
+ * @y: multiple to round closest to (must be a power of 2)
+ *
+ * Rounds @x to closest multiple of @y (which must be a power of 2).
+ * The value can be either rounded up or rounded down depending upon rounded
+ * value's closeness to the specified value. If there are two closest possible
+ * values, i.e. the difference between the specified value and it's rounded up
+ * and rounded down values is same then preference is given to rounded up
+ * value.
+ *
+ * To perform arbitrary rounding to closest value (not multiple of 2), use
+ * roundclosest().
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
@@ -77,6 +125,23 @@
 }							\
 )
 
+/**
+ * roundclosest - round to nearest multiple
+ * @x: the value to round
+ * @y: multiple to round nearest to
+ *
+ * Rounds @x to nearest multiple of @y.
+ * The rounded value can be greater than or less than @x depending
+ * upon it's nearness to @x. If @y will always be a power of 2, consider
+ * using the faster round_closest_up() or round_closest_down().
+ *
+ * Examples :
+ * roundclosest(21, 5) = 20
+ * roundclosest(19, 5) = 20
+ * roundclosest(17, 5) = 15
+ */
+#define roundclosest(x, y) rounddown((x) + (y) / 2, (y))
+
 /*
  * Divide positive or negative dividend by positive or negative divisor
  * and round to closest integer. Result is undefined for negative
-- 
2.39.1


