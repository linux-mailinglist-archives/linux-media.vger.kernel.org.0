Return-Path: <linux-media+bounces-44892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52236BE8F37
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8695C424E18
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2B82F6912;
	Fri, 17 Oct 2025 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgAPyHo0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3F52F690C
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708312; cv=none; b=NpGELbTsPQA87m9GMnDpbaa/L/ZMDG9JIK7/aG9jKGc6TR1YabiaMbfADvEBnLB4tv3YrTFpqeLNbtCNgJ4J9y+K+9PCeKGDRRdeHvwzclgq5ODM3+IhK4hcqZKOz/a8m2YIhg06NYfjiN8bhDTw1/zRrU0V6+NDrZhG+dlidDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708312; c=relaxed/simple;
	bh=l6a6yKJRRNer4vOS7+wAhtjWWDdpCMjltSAGSo7brb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dp/6S1r2BITHM/iZgKp1HPs0ZZoWaeRVIqnzmVkl6ywfoyP5z5Iyjdy+ylUd/XMdyuPsID2xVjaL6T+j/5o5acJfuFbSqNrwBQrHgpwVEjU8tnve42Hd/sbg54ZbttBqjZ+nhHb93CWu9TTBjCA6HOHIK1eNRw6rIIH3XkaummU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgAPyHo0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4DEC4CEF9;
	Fri, 17 Oct 2025 13:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708312;
	bh=l6a6yKJRRNer4vOS7+wAhtjWWDdpCMjltSAGSo7brb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IgAPyHo05nD04Xe5FcG2f3nOWC/oHEBawyWBplUMvUWrVhSK1VrNDo9pwbQ1vSBwT
	 U8t998o1CaXY0M109kr8ZlCgloMcO5Qcd0z1NhOt95QLV+YthqHeFvP9X1FN5/FQBK
	 keG8MrVD7yTAt5jZ+Eg94eaMi+ketJdLKmIeSaMlvUCC0bz4PqCXmORm0PlqdVHjZq
	 9cKNObefglrBFcsZIqdvkQnkFiTg2P9+FhzSDn3bfC/kmXKzuaU4HSwV9/x4KUwV5w
	 tXcC9jNsKOy+6yk/JG14w4vwIRzXb1LxEfs4rll+IyI9vs7vMlEcQVjIU88h+dUkbL
	 4O4rhI/NDrgsw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 01/14] media: omap3isp: configure entity functions
Date: Fri, 17 Oct 2025 15:26:38 +0200
Message-ID: <9d6e9be52c23633cf88a365cb4b42e9df487f5e8.1760707611.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760707611.git.hverkuil+cisco@kernel.org>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the various subdevices, set the function field.

This fixes v4l2-compliance errors:

$ v4l2-compliance -M0
v4l2-compliance 1.33.0-5410, 32 bits, 64-bit time_t
v4l2-compliance SHA: c12c89c5bd70 2025-10-05 09:58:42

Compliance test for omap3isp device /dev/media0:

Media Driver Info:
Driver name      : omap3isp
Model            : TI OMAP3 ISP
Serial           :
Bus info         : platform:480bc000.isp
Media version    : 6.17.0
Hardware revision: 0x000000f0 (240)
Driver version   : 6.17.0

Required ioctls:
test MEDIA_IOC_DEVICE_INFO: OK
test invalid ioctls: OK

Allow for multiple opens:
test second /dev/media0 open: OK
test MEDIA_IOC_DEVICE_INFO: OK
test for unlimited opens: OK

Media Controller ioctls:
fail: v4l2-test-media.cpp(108): function == MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN
fail: v4l2-test-media.cpp(196): checkFunction(ent.function, true)
test MEDIA_IOC_G_TOPOLOGY: FAIL
fail: v4l2-test-media.cpp(398): num_data_links != num_links
test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL
test MEDIA_IOC_SETUP_LINK: OK

Total for omap3isp device /dev/media0: 8, Succeeded: 6, Failed: 2, Warnings: 0

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispccdc.c    | 1 +
 drivers/media/platform/ti/omap3isp/ispccp2.c    | 1 +
 drivers/media/platform/ti/omap3isp/ispcsi2.c    | 1 +
 drivers/media/platform/ti/omap3isp/isppreview.c | 1 +
 drivers/media/platform/ti/omap3isp/ispresizer.c | 1 +
 drivers/media/platform/ti/omap3isp/ispstat.c    | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/media/platform/ti/omap3isp/ispccdc.c b/drivers/media/platform/ti/omap3isp/ispccdc.c
index 55ee14e8b449..9dbf06ac058d 100644
--- a/drivers/media/platform/ti/omap3isp/ispccdc.c
+++ b/drivers/media/platform/ti/omap3isp/ispccdc.c
@@ -2675,6 +2675,7 @@ static int ccdc_init_entities(struct isp_ccdc_device *ccdc)
 	pads[CCDC_PAD_SOURCE_OF].flags = MEDIA_PAD_FL_SOURCE;
 
 	me->ops = &ccdc_media_ops;
+	me->function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_ENC_CONV;
 	ret = media_entity_pads_init(me, CCDC_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/media/platform/ti/omap3isp/ispccp2.c b/drivers/media/platform/ti/omap3isp/ispccp2.c
index 1204ee221c9e..f4147c79639c 100644
--- a/drivers/media/platform/ti/omap3isp/ispccp2.c
+++ b/drivers/media/platform/ti/omap3isp/ispccp2.c
@@ -1086,6 +1086,7 @@ static int ccp2_init_entities(struct isp_ccp2_device *ccp2)
 	pads[CCP2_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
 	me->ops = &ccp2_media_ops;
+	me->function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	ret = media_entity_pads_init(me, CCP2_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/media/platform/ti/omap3isp/ispcsi2.c b/drivers/media/platform/ti/omap3isp/ispcsi2.c
index ae574e1b6528..f227042b61b6 100644
--- a/drivers/media/platform/ti/omap3isp/ispcsi2.c
+++ b/drivers/media/platform/ti/omap3isp/ispcsi2.c
@@ -1251,6 +1251,7 @@ static int csi2_init_entities(struct isp_csi2_device *csi2)
 				    | MEDIA_PAD_FL_MUST_CONNECT;
 
 	me->ops = &csi2_media_ops;
+	me->function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	ret = media_entity_pads_init(me, CSI2_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/media/platform/ti/omap3isp/isppreview.c b/drivers/media/platform/ti/omap3isp/isppreview.c
index e383a57654de..26f7167d1f4f 100644
--- a/drivers/media/platform/ti/omap3isp/isppreview.c
+++ b/drivers/media/platform/ti/omap3isp/isppreview.c
@@ -2294,6 +2294,7 @@ static int preview_init_entities(struct isp_prev_device *prev)
 	pads[PREV_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
 	me->ops = &preview_media_ops;
+	me->function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	ret = media_entity_pads_init(me, PREV_PADS_NUM, pads);
 	if (ret < 0)
 		goto error_handler_free;
diff --git a/drivers/media/platform/ti/omap3isp/ispresizer.c b/drivers/media/platform/ti/omap3isp/ispresizer.c
index 87d821b02e5c..5dff48489394 100644
--- a/drivers/media/platform/ti/omap3isp/ispresizer.c
+++ b/drivers/media/platform/ti/omap3isp/ispresizer.c
@@ -1738,6 +1738,7 @@ static int resizer_init_entities(struct isp_res_device *res)
 	pads[RESZ_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
 	me->ops = &resizer_media_ops;
+	me->function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
 	ret = media_entity_pads_init(me, RESZ_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/media/platform/ti/omap3isp/ispstat.c b/drivers/media/platform/ti/omap3isp/ispstat.c
index 07bd62a93d99..64bc71d830c4 100644
--- a/drivers/media/platform/ti/omap3isp/ispstat.c
+++ b/drivers/media/platform/ti/omap3isp/ispstat.c
@@ -1037,6 +1037,7 @@ static int isp_stat_init_entities(struct ispstat *stat, const char *name,
 
 	stat->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	me->ops = NULL;
+	me->function = MEDIA_ENT_F_PROC_VIDEO_STATISTICS;
 
 	return media_entity_pads_init(me, 1, &stat->pad);
 }
-- 
2.51.0


