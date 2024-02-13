Return-Path: <linux-media+bounces-5099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD947853999
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 19:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23B5D1C21DE7
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 18:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5372B605B5;
	Tue, 13 Feb 2024 18:12:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BE0604D8;
	Tue, 13 Feb 2024 18:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707847971; cv=none; b=RycPI9roEk5ZfVDHe1CwNcFOb/O+Kknr4oMAK7uVf4i5as7YztQ6KherhHSp2WSvZvvSKgUqv/PNUjD18YlDEI0KUP89cAfr1iuhID/f/MHbYPOhMAxaEx7F+npDkdNjf79xadIua5IALwm8POyTr6LuDgEeOAZyyHMsrQRMICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707847971; c=relaxed/simple;
	bh=eK6uG3GcZ1THvy84JU4bRFxLCn+fIRwKR2wL3qQSzVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IKIVDUV1rXdc1WHcv53YEPY6icqKXZJG047LF698lCWgtm2svGdty9SlWheK7Jy4wjOabP5OJddkCvJkRdi6AB+yXeDhIZCFwmxwMi4icFXh6q3TqCH1vaPxwQ3ZeXiObxR6dUpLxqSt0djvFEMHlRjOAOBeVXQmlf8loA4b3NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,157,1705330800"; 
   d="scan'208";a="197718672"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Feb 2024 03:12:48 +0900
Received: from localhost.localdomain (unknown [10.226.93.58])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8AA8B40617B1;
	Wed, 14 Feb 2024 03:12:44 +0900 (JST)
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
Subject: [PATCH v3 2/5] media: platform: rzg2l-cru: rzg2l-ip: Add delay after D-PHY reset
Date: Tue, 13 Feb 2024 18:12:30 +0000
Message-Id: <20240213181233.242316-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240213181233.242316-1-biju.das.jz@bp.renesas.com>
References: <20240213181233.242316-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * No change.
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


