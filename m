Return-Path: <linux-media+bounces-4436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCDA842979
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 17:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F37BAB2AC27
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 16:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A06F1272C7;
	Tue, 30 Jan 2024 16:36:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5DF823A7;
	Tue, 30 Jan 2024 16:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706632571; cv=none; b=kWS1i4vYPhVb45zkcBxj0dKs/K+aOMTmqKUTFBGnGEEJuqEUyTd54SXr7wS+wR3DazTPQDdx+RoHwd5UbL0uQzXPLu0HKw91ulqsWwRMZ7T6Jxr7OKQr1i8V/BssMMYTPDXnlZVBBjsDTXm/6Oa63z5xtvjzYmY/nJcd3oArYek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706632571; c=relaxed/simple;
	bh=TE2iirVtYoKCAw2/bL3eaJ6pOiqwebJxGNDjY7hZ40E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tMW45nAUcVa+fueY/mPPsTUzsC+BLJwgJXGE550S/qCHhODFN4cYd8smEhBB1LsS+CbKKZy49dyxe1lGwidYWMjvV/V01W5zrdhmrZ8gg3Os1Io1YEPvKScxVQe1RX6Kkk0caoWyIwqgijdYqb+nmB5aANWJ2r9UuswTDYlQaVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,230,1701097200"; 
   d="scan'208";a="192260854"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Jan 2024 01:36:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.244])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9FC994021750;
	Wed, 31 Jan 2024 01:36:04 +0900 (JST)
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
Subject: [PATCH v2 2/4] media: platform: rzg2l-cru: rzg2l-ip: Add delay after D-PHY reset
Date: Tue, 30 Jan 2024 16:35:51 +0000
Message-Id: <20240130163553.116249-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240130163553.116249-1-biju.das.jz@bp.renesas.com>
References: <20240130163553.116249-1-biju.das.jz@bp.renesas.com>
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


