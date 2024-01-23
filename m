Return-Path: <linux-media+bounces-4081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CCD838E05
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 12:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 913F5283EB6
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 11:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16F55DF03;
	Tue, 23 Jan 2024 11:58:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0B457892;
	Tue, 23 Jan 2024 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706011119; cv=none; b=e8BjTb6Y9kMfNR8OxD4O8o+P8FMEOYEkHZ3eeVIwTwYAIkixWlI0c4B79jXuDOj8F2t25suSz5DYPv9HY+NO/hAkE4rsBL/gyusF4L2LkHU/Xo0ZHsOJDVdY7uoesc1QU3FWHIbl5IBSLOxOhW3k1cM9JZj8o8IFeqFmJElD9+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706011119; c=relaxed/simple;
	bh=BUw9TTsVDS60eT0qfOA78akA/WMdYmQLh4P8oVbfh5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ddmIVzTtqrYDxEizLzh4bckvCtW3fT9FEgJbExHRB+p6ffW14BLWsSY+fx+9JY9ruf8LvJQ0XU318weFUX25VO5DhtUBNV4VL1Eka4DiPlojOG/Juw65LI1Du0q0ZJcXChnJ/cs/qNWwKrFma+EVmqpSHoivNpr4FKomWEanNB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,214,1701097200"; 
   d="scan'208";a="195342064"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jan 2024 20:58:36 +0900
Received: from localhost.localdomain (unknown [10.226.93.36])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 28DA24009419;
	Tue, 23 Jan 2024 20:58:32 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] media: platform: rzg2l-cru: rzg2l-ip: Add delay after D-PHY reset
Date: Tue, 23 Jan 2024 11:58:19 +0000
Message-Id: <20240123115821.292787-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
latest hardware manual(R01UH0914EJ0140 Rev.1.40) it is mentioned that
after DPHY reset, we need to wait for 1 msec or more before start
receiving data from the sensor. So add a delay after pre_streamon().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 9f351a05893e..5468dc179de7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2022 Renesas Electronics Corp.
  */
 
+#include <linux/delay.h>
 #include "rzg2l-cru.h"
 
 struct rzg2l_cru_ip_format {
@@ -71,6 +72,8 @@ static int rzg2l_cru_ip_s_stream(struct v4l2_subdev *sd, int enable)
 		if (ret)
 			return ret;
 
+		usleep_range(1000, 2000);
+
 		ret = rzg2l_cru_start_image_processing(cru);
 		if (ret) {
 			v4l2_subdev_call(cru->ip.remote, video, post_streamoff);
-- 
2.25.1


