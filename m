Return-Path: <linux-media+bounces-12517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9ED8FB06B
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 12:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C9392842F3
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 10:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF95144D2E;
	Tue,  4 Jun 2024 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uYlZsMCp"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F42144D00;
	Tue,  4 Jun 2024 10:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717498304; cv=none; b=F441D9mvDiH2jGynqOWfV3t9a7fBOPLwbnCcyBuYb3gl4R4xSVlBwxEqWDnnC9cmjXGYFg4fAk8xrr9VrQBbqmVjslQZh878IJWso9wsDFt3PecYgboWipXxM3eEW1Oubrlz/WSPmbq5M7z5i+bfnHN88WlEmIpFWhbAUlPmwu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717498304; c=relaxed/simple;
	bh=5H4TcUpSxTjfANRWJBSgJ/tN3LuXrKy0u1q8b7GKM48=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qKoOUcR63MJzU7tyjtcNCGo9uQW1SHZSlYDv5lJYx+P0PCLT4CK7VrOq0i5TkestTVQcTix8mlqtfeVPVtXmuiOvDWRt+i5d+ZTg6B/tAMkDem6PfHqvsk0ALfKbwo05JyR3/OKZFoPDeLZza2CA62KNC8Rs5w+fq95ylJLn1As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uYlZsMCp; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454ApPwF104288;
	Tue, 4 Jun 2024 05:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717498285;
	bh=frKIkup1rya8/oIVCuozYgIkw2YiLenjI5YJiYQbdwo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uYlZsMCpO6BmzI29pbfN5isqhCyS6MeEhchQVcV9XC4rTasy+ZAw59O8daz0q6ovI
	 +vNr8ES3x82DCSiLF7igMc2FtCk/ZSzL1DIV+qotCk9UdoR3zFD7yG6JFBqRWnAJtp
	 ANAGafJqWWacz5LDW2wUyIeYB4jrg8Fb4gsjvZy4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454ApP1o032028
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 05:51:25 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 05:51:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 05:51:25 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454ApOF8119625;
	Tue, 4 Jun 2024 05:51:25 -0500
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
Subject: [PATCH v12 07/13] math.h: Add macros for rounding to closest value
Date: Tue, 4 Jun 2024 16:21:24 +0530
Message-ID: <20240604105124.2253786-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240604104001.2235082-1-devarsht@ti.com>
References: <20240604104001.2235082-1-devarsht@ti.com>
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
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
NOTE: This patch is inspired from the Mentor Graphics IPU driver [1]
which uses similar macro locally and which is updated in further patch
in the series to use this generic macro instead along with other drivers
having similar requirements.

Link: https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480 [1]
V12:
- Add Acked-by
V11:
- Fix commenting style per review comments and remove extra whitespace

V10:
- Update example comment to fix formatting issues as observed with html docs

V9:
- No change

V8:
- Add new macro to round to nearest value for non-multiple of 2
- Update commit message as suggested:

V1->V6 (No change, patch introduced in V7)
---
 include/linux/math.h | 63 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/include/linux/math.h b/include/linux/math.h
index dd4152711de7..79e3dfda77fc 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -34,6 +34,52 @@
  */
 #define round_down(x, y) ((x) & ~__round_mask(x, y))
 
+/**
+ * round_closest_up - round closest to be multiple of specified value (which is
+ *                    power of 2) with preference to rounding up
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
+ * Examples:
+ * * round_closest_up(17, 4) = 16
+ * * round_closest_up(15, 4) = 16
+ * * round_closest_up(14, 4) = 16
+ */
+#define round_closest_up(x, y) round_down((x) + (y) / 2, (y))
+
+/**
+ * round_closest_down - round closest to be multiple of specified value (which
+ *			is power of 2) with preference to rounding down
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
+ * Examples:
+ * * round_closest_down(17, 4) = 16
+ * * round_closest_down(15, 4) = 16
+ * * round_closest_down(14, 4) = 12
+ */
+#define round_closest_down(x, y) round_up((x) - (y) / 2, (y))
+
 #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
 
 #define DIV_ROUND_DOWN_ULL(ll, d) \
@@ -77,6 +123,23 @@
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
+ * Examples:
+ * * roundclosest(21, 5) = 20
+ * * roundclosest(19, 5) = 20
+ * * roundclosest(17, 5) = 15
+ */
+#define roundclosest(x, y) rounddown((x) + (y) / 2, (y))
+
 /*
  * Divide positive or negative dividend by positive or negative divisor
  * and round to closest integer. Result is undefined for negative
-- 
2.39.1


