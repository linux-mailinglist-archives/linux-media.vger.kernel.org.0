Return-Path: <linux-media+bounces-13343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A322690A0C0
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 568CE1F21CD4
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C1973509;
	Sun, 16 Jun 2024 23:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gbWTXv5f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6F973478
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579658; cv=none; b=ofq15u9v/ogUQB92kNBhHlFCjjaXHeILJFWxX0trW9Fha24tAftR4KkmTmTZKwympR+tMD5l+5Tc6dLY0Cvjh9u5JbZoO/Na9nxlP8uc9hd1IKp2iUNek9Q0Fq3mZRzDmey7NqgMQMpawsUgNZFPFT9B68LzOwM4qIq9NgY1LD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579658; c=relaxed/simple;
	bh=6V8J3QaDwNPnRAk5BdnLdU2EXdLR36H4UYXJ/lKg66Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UcjseCcHADi+1sgUwEVK5wfxxPz5v046zA5E7plZv+zMYfkS+ah3VeF0aqOc6FeKCu7Irqzui6pzJKCLcnVKieaUKVj9xmce5696G2wLrYgeppmSa1ijvRPyk0NbT+fhau1fSzymU5yaJT8+gw12wojHQkdHl5wcRvhr6llKPns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gbWTXv5f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AA6FA9A;
	Mon, 17 Jun 2024 01:13:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718579638;
	bh=6V8J3QaDwNPnRAk5BdnLdU2EXdLR36H4UYXJ/lKg66Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gbWTXv5ffDSXBjIlvBxw4VvgE/wfFHzoblpoh2elgI8gf7tnes0oP8A66d8ptNGmu
	 aMSghlcTwk5sa+uEaaIjaKNHVtZ7Q+tKJTLK6+8YjUp32XY0ozohSEzEU+enOlnD54
	 L24e6SspMcK+AZ5ssrmt6i1Aq59dRM8tjHwEfoIE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 2/6] media: uvcvideo: Refactor Power Line Frequency limit selection
Date: Mon, 17 Jun 2024 02:13:46 +0300
Message-ID: <20240616231350.6787-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
References: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

Move the PLF mapping logic to its own mapping filter function. This
commit does not introduce any new functionality to the logic, it is just
a preparation patch.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Update to use .filter_mapping()
---
 drivers/media/usb/uvc/uvc_ctrl.c | 88 ++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 38 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index bc30af516afd..2ef443233f50 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -459,6 +459,51 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
 	data[first+1] = min_t(int, abs(value), 0xff);
 }
 
+const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
+	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
+	.entity		= UVC_GUID_UVC_PROCESSING,
+	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
+	.size		= 2,
+	.offset		= 0,
+	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
+				  V4L2_CID_POWER_LINE_FREQUENCY_50HZ),
+};
+
+const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11 = {
+	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
+	.entity		= UVC_GUID_UVC_PROCESSING,
+	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
+	.size		= 2,
+	.offset		= 0,
+	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
+				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
+};
+
+static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
+	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
+	.entity		= UVC_GUID_UVC_PROCESSING,
+	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
+	.size		= 2,
+	.offset		= 0,
+	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_AUTO,
+				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
+};
+
+static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping(
+	struct uvc_video_chain *chain, struct uvc_control *ctrl)
+{
+	if (chain->dev->uvc_version < 0x150)
+		return &uvc_ctrl_power_line_mapping_uvc11;
+	else
+		return &uvc_ctrl_power_line_mapping_uvc15;
+}
+
 static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	{
 		.id		= V4L2_CID_BRIGHTNESS,
@@ -748,51 +793,18 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
-};
-
-const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
-	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
-	.entity		= UVC_GUID_UVC_PROCESSING,
-	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-	.size		= 2,
-	.offset		= 0,
-	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
-	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
-	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
-				  V4L2_CID_POWER_LINE_FREQUENCY_50HZ),
-};
-
-const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11 = {
-	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
-	.entity		= UVC_GUID_UVC_PROCESSING,
-	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-	.size		= 2,
-	.offset		= 0,
-	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
-	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
-	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
-				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
+	{
+		.entity		= UVC_GUID_UVC_PROCESSING,
+		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
+		.filter_mapping	= uvc_ctrl_filter_plf_mapping,
+	},
 };
 
 static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc11[] = {
-	&uvc_ctrl_power_line_mapping_uvc11,
 	NULL, /* Sentinel */
 };
 
-static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
-	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
-	.entity		= UVC_GUID_UVC_PROCESSING,
-	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-	.size		= 2,
-	.offset		= 0,
-	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
-	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
-	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_AUTO,
-				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
-};
-
 static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc15[] = {
-	&uvc_ctrl_power_line_mapping_uvc15,
 	NULL, /* Sentinel */
 };
 
-- 
Regards,

Laurent Pinchart


