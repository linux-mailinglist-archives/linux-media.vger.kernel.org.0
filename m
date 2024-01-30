Return-Path: <linux-media+bounces-4442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3868429BA
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 17:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C1A287846
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 16:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B289A12BEBE;
	Tue, 30 Jan 2024 16:41:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A85B1272C5;
	Tue, 30 Jan 2024 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706632894; cv=none; b=bjzdfXKg0a05PcrgpTkUH3IOa1QvjwLvS3BoVKZY6aO83dEz8k05bZEKU8tTaEWi+OTq/jqlcmOUh754KRdZYsMU0cn0WawGANmBc7AaiY0rI+jaulbBn2l6oGuzt/d+O5u0GvRAjUjYB+lDp8bG0AUKkrF43xc/h+3QbzTs8C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706632894; c=relaxed/simple;
	bh=TE2iirVtYoKCAw2/bL3eaJ6pOiqwebJxGNDjY7hZ40E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nIYYDkpV3GdagBykk/VdNBD2/W1sJIWKD8KDwTWPwRm63En9k9zxat2N6qJxFA7HwlJ3w2OxkMFNnjGHIBs67ZpgEpgBR614vSlmihofbRyaMpLVfve6i/Fie3z09WErE0fevh3KQqf8Xp2eZeWqWfMl2nZMEqNc1gzCij0k5xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,230,1701097200"; 
   d="scan'208";a="192261118"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 31 Jan 2024 01:41:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.244])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6C6C1400297E;
	Wed, 31 Jan 2024 01:41:26 +0900 (JST)
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
	linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 RESEND 2/4] media: platform: rzg2l-cru: rzg2l-ip: Add delay after D-PHY reset
Date: Tue, 30 Jan 2024 16:41:13 +0000
Message-Id: <20240130164115.116613-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240130164115.116613-1-biju.das.jz@bp.renesas.com>
References: <20240130164115.116613-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
latest hardware manual (R01UH0914EJ0140 Rev.1.40) it is mentioned that
after DPHY reset, we need to wait for 1 msec or more before start
receiving data from the sensor. So add a delay after pre_streamon().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v1->v2:
 * Added Rb tag from Laurent.
 * Replaced usleep_range()->fsleep().
 * Added blank space after manual in commit description.
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 9f351a05893e..8466b4e55909 100644
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
 
+		fsleep(1000);
+
 		ret = rzg2l_cru_start_image_processing(cru);
 		if (ret) {
 			v4l2_subdev_call(cru->ip.remote, video, post_streamoff);
-- 
2.25.1


