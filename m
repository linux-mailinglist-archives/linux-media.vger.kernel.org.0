Return-Path: <linux-media+bounces-11242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 996758C14E7
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 20:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53A0F282B72
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355AA80C07;
	Thu,  9 May 2024 18:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y6l4wMuU"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E566E7F470;
	Thu,  9 May 2024 18:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715280011; cv=none; b=RWjbf0UgunkTq78VOkUH4myijUUy6xl8pRBhu+D2b4biOI2fEg6M/e8iXPXd94TQWkcaiu23WPDleEbfK1vjXX7CW+4lWs0liCZLLXpiZzbydLxkH/ZgEDfSbOAqWpjF0d7BqIA+1jKjwMB5yqstgvfWI9w7In+sl5HL2yTjCc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715280011; c=relaxed/simple;
	bh=ho6y2eiGzKmKxS7SJvcX41zaBIRbDgw/6Tjm/gP5XA8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qb1yTm8R+7izH+dzLpR6wlC2HTUWC0DFa5Y0cdHGefFApEO1MCWGRS6ytmCzCQbDx+RdERG5ofUvRcv4LW5Hzp3MiHlzeg17lBRJ4zpGEFxSNOUU7na+FQCEU3fgaDrNdk6nZW5pZ93mX6snuw5wCqNVa7CwpbMK42Cvv93njZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Y6l4wMuU; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 449Ids7A090810;
	Thu, 9 May 2024 13:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715279994;
	bh=lrdTPlSx5uWnTmoVruaPcAiqQdb2LlFFka9SllqeKfQ=;
	h=From:To:CC:Subject:Date;
	b=Y6l4wMuU3sCR4/pnLAByHJRo+7spyl3CQdZm7bJXqaXDi1ofG08qVgz0FQKnTG0Hu
	 qmlmptMVUmE2iB6iWIyRXzeeieINGClAv+9uCGAkJ57bhGflIj10+RICSo4kjYl/6N
	 MU3rJySLo7EwN235+EacWkv1CBtLRqNqe5p0CMkw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 449Idsjr028411
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 May 2024 13:39:54 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 May 2024 13:39:54 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 May 2024 13:39:54 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 449IdrZA004938;
	Thu, 9 May 2024 13:39:53 -0500
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
Subject: [PATCH v7 6/8] math.h Add macros to round to closest specified power of 2
Date: Fri, 10 May 2024 00:09:52 +0530
Message-ID: <20240509183952.4064331-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
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


