Return-Path: <linux-media+bounces-45941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1330DC1A7BF
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 14:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F34E1A27937
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 12:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D27335084;
	Wed, 29 Oct 2025 12:36:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD2632D43D;
	Wed, 29 Oct 2025 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741388; cv=none; b=SDnnoLY0Z1JptC6zLZghXZKf6MTodfPhnZg/dEeqjqrtS7AouQzxLG1l7R3QVCQi5jLrelcln7LAjtV2qLTME5LfJR8HjVGLdcy/k5Z5pu3FPYeh0Se/o1J4O/HpIR8xvOwjykkst8Uh4dh4idWRE2OKi4DPi7TzyNW8C3nOckY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741388; c=relaxed/simple;
	bh=g2tCA1c0wgCVxsWr/6OQq2Lv5bqTgMVQCD5F8dnwgpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uhSyoi4Ym11lo4fp8li3q+eCi5X52QEJ5A8DktjGbjUK1dLgxhvd37fknRO8vWQLTSM6yD80dFWYCaYu20DQpJ1QGUBx3oAlbAwJCIEUE5kzh2T9fThfFoveEitk/NNBwXTPb4zNCOLs3YCSrwOIMWqW1GJJ/muFBGELV8ctzkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id BF36481E17;
	Wed, 29 Oct 2025 13:26:35 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH] media: pci: mgb4: Fix DV capabilities
Date: Wed, 29 Oct 2025 13:26:20 +0100
Message-ID: <20251029122620.2079-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Use the same value (4096) for the maximum height as used for width. The HW
limits are a 4K video, but the orientation does not matter. Fixes issues with
some portrait oriented Audi displays that exceed the old height value (2160).

The same applies for the minimal width.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c  | 4 ++--
 drivers/media/pci/mgb4/mgb4_vout.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 42c327bc50e1..4b38076486ff 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -64,10 +64,10 @@ static const struct mgb4_i2c_kv gmsl_i2c[] = {
 static const struct v4l2_dv_timings_cap video_timings_cap = {
 	.type = V4L2_DV_BT_656_1120,
 	.bt = {
-		.min_width = 320,
+		.min_width = 240,
 		.max_width = 4096,
 		.min_height = 240,
-		.max_height = 2160,
+		.max_height = 4096,
 		.min_pixelclock = 1843200, /* 320 x 240 x 24Hz */
 		.max_pixelclock = 530841600, /* 4096 x 2160 x 60Hz */
 		.standards = V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index c179c425e167..fd93fbbaf755 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -44,10 +44,10 @@ static const struct mgb4_i2c_kv fpdl3_i2c[] = {
 static const struct v4l2_dv_timings_cap video_timings_cap = {
 	.type = V4L2_DV_BT_656_1120,
 	.bt = {
-		.min_width = 320,
+		.min_width = 240,
 		.max_width = 4096,
 		.min_height = 240,
-		.max_height = 2160,
+		.max_height = 4096,
 		.min_pixelclock = 1843200, /* 320 x 240 x 24Hz */
 		.max_pixelclock = 530841600, /* 4096 x 2160 x 60Hz */
 		.standards = V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |

base-commit: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
-- 
2.51.0


