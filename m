Return-Path: <linux-media+bounces-50506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5672D17229
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 08:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ED2A305CAB9
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 07:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7502A312821;
	Tue, 13 Jan 2026 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AqTHmoeA"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DF830FC36;
	Tue, 13 Jan 2026 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291078; cv=none; b=t9zdK23YzV8DD+SOG+Wkkd8pxoWd09sxfAxz8gav+XtEBhs7wX5K95H7vaKH8iutJO8d7wn8f+gcgrsIGW8s82J8tNbdhFvBedCQ1+74KW067RLNs2gdMxrCs68QgZ2Ym3r9Bl3apay0enS4bLgLglvhAghFe16WNSle8dxhqsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291078; c=relaxed/simple;
	bh=RSwUxRFF6Z/dPuUyC8jeEFPS51IHNjDAEBSyaOM/Rd8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i4PKccZsYwMxv8vv59bhvS8ZE98Gsd+oBfLL0H+fHqzUpjqR/dNzdDo37w41JfclZEyQBmiOmlov270N/xZzK8gI8M9YH4cwn7q0vQhUYYARklgsLMW10dUpUTB1SzF582RYizk6izsCnz75bRniFZ6Uk2eMihhDnMJepfG5CzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AqTHmoeA; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=n8
	t6Gfh26cV4Yl2r+TklcwvlkWArlrbACINPjCxbpIA=; b=AqTHmoeAOrzwIZZAW5
	xuBk5UrvOQ97gMcOAllqnV4ERHAJZOgVcF7Ug3HVfLuYXOyyCN7ZGyAqWwpb3rAe
	mgNLqWGlXuFlmgRGpuraJBh8dQ31y93C4UThboQaqoc5fqu0ptFg35zc4u5VI23W
	/ipdAJ56FmlTWxvzktTyH59Bs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wCHMIzj+mVpY0+FFQ--.125S2;
	Tue, 13 Jan 2026 15:57:25 +0800 (CST)
From: "jempty.liang" <imntjempty@163.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"jempty.liang" <imntjempty@163.com>
Subject: [PATCH] media: mali-c55: Fix NULL dev stream alert for tpg sub-device
Date: Tue, 13 Jan 2026 07:57:22 +0000
Message-Id: <20260113075722.143238-1-imntjempty@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCHMIzj+mVpY0+FFQ--.125S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr15AF4DAF4kAFy7Zw1DZFb_yoW5XrW8pF
	48JFWxZry7GF1jgw1UA3W7ZFW5Gw1Fqayj9r97uw4aqa4DCF9rJr1aka4ayFy5CF1UA3W3
	JFWIqr4Y9rs0vw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU2hF7UUUUU=
X-CM-SenderInfo: hlpq3yxhps35i6rwjhhfrp/xtbC3AWrrGll+uUiAAAA3v

Fix "(NULL device *): collect_streams: sub-device 'mali-c55 tpg'
does not support streams" by setting `sd->dev = mali_c55->dev`
for isp/resizer/tpg modules.

Signed-off-by: jempty.liang <imntjempty@163.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c     | 1 +
 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c | 1 +
 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index 497f25fbdd13..ce84aad9f1d5 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -610,6 +610,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
 	sd->entity.ops = &mali_c55_isp_media_ops;
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
 	sd->internal_ops = &mali_c55_isp_internal_ops;
+	sd->dev = mali_c55->dev;
 	strscpy(sd->name, MALI_C55_DRIVER_NAME " isp", sizeof(sd->name));
 
 	isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
index a8d739af74b6..c4f46651dcee 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
@@ -1070,6 +1070,7 @@ static int mali_c55_register_resizer(struct mali_c55 *mali_c55,
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
 	sd->internal_ops = &mali_c55_resizer_internal_ops;
+	sd->dev = mali_c55->dev;
 
 	rsz->pads[MALI_C55_RSZ_SINK_PAD].flags = MEDIA_PAD_FL_SINK;
 	rsz->pads[MALI_C55_RSZ_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
index 1af5d2759a83..894f4cf377af 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
@@ -370,6 +370,7 @@ int mali_c55_register_tpg(struct mali_c55 *mali_c55)
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	sd->internal_ops = &mali_c55_tpg_internal_ops;
+	sd->dev = mali_c55->dev;
 	strscpy(sd->name, MALI_C55_DRIVER_NAME " tpg", sizeof(sd->name));
 
 	pad->flags = MEDIA_PAD_FL_SOURCE;
-- 
2.25.1


