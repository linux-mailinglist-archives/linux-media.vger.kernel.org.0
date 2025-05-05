Return-Path: <linux-media+bounces-31796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F290CAAB6CA
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 07:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F4F117F7A9
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 05:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0330E215767;
	Tue,  6 May 2025 00:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iP3frJMb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60E23899E8;
	Mon,  5 May 2025 23:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486054; cv=none; b=giun41b4qRO8Q2Ad4ypgxPOAbuWVG/J5YEGncS8NMhtD7Dtj6otS+mrqclDmypXOFqARJnxKABNiw51pwMq0FRWLTFIHxAsFtjiZOLf+oiIxLq/+WeGIZBPzXrhN1L9fex/sAo+I3trQZWeCxpBPh/pbICTPo2NvzAbmDRSDjnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486054; c=relaxed/simple;
	bh=otCOWJG6YRdM730a62hXw38ZLebPfilfEAfuCxr/aU4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kVh7inWRZBki/4FupHllo1ylDWEOOxDgbeEbm705aqOb4UThpca+d+jGDv/drOlMH02lrMRg2kgcicJxUhRijxnx3aQDDqKUhFahEgJ//FUJBw8HIW6jyiImJCY7nbTVbkzRTmrXOrYlRDCJtlELWcLKhTFoTRI4fFGPTC/IPLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iP3frJMb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB69C4CEED;
	Mon,  5 May 2025 23:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486053;
	bh=otCOWJG6YRdM730a62hXw38ZLebPfilfEAfuCxr/aU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iP3frJMbIzwZRNAb9hlnHhP+ARw8SHjn9hEUhGStLzxQe2PzQxfscG5KB66k3Y1nl
	 LxfE+9DkE5dDC1LNjQDXJUseZA8ygYO7e47v/ysztxxxgvz6SVlsn+51xBnc6QD4O+
	 dOtcrMXPB2/kH5uxphfU+Dg94ns7EohMgdDYmHG4MM7awOLiJCVmP2iXLCN591psMl
	 eMTw7C+DbXLF6pfKzwH6BcJtnvlEGCpuzWwJLKipQ/oOOO+n57Abq11S4noDONxMPd
	 /9J8BvgD7MTrISIWv0Ihw1EuPUgK0xoNYpAE0hS4diKC/p1EWYbDBSNeheR2urO+hP
	 sinCW08nCchaA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Yunke Cao <yunkec@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 129/294] media: uvcvideo: Handle uvc menu translation inside uvc_get_le_value
Date: Mon,  5 May 2025 18:53:49 -0400
Message-Id: <20250505225634.2688578-129-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 9109a0b4cb10fd681e9c6e9a4497a6fec5b91c39 ]

map->get() gets a value from an uvc_control in "UVC format" and converts
it to a value that can be consumed by v4l2.

Instead of using a special get function for V4L2_CTRL_TYPE_MENU, we
were converting from uvc_get_le_value in two different places.

Move the conversion to uvc_get_le_value().

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20250203-uvc-roi-v17-4-5900a9fed613@chromium.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 77 +++++++++++++-------------------
 1 file changed, 32 insertions(+), 45 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 028c4a5049af9..5926a9dfb0b1f 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -815,6 +815,25 @@ static inline void uvc_clear_bit(u8 *data, int bit)
 	data[bit >> 3] &= ~(1 << (bit & 7));
 }
 
+static s32 uvc_menu_to_v4l2_menu(struct uvc_control_mapping *mapping, s32 val)
+{
+	unsigned int i;
+
+	for (i = 0; BIT(i) <= mapping->menu_mask; ++i) {
+		u32 menu_value;
+
+		if (!test_bit(i, &mapping->menu_mask))
+			continue;
+
+		menu_value = uvc_mapping_get_menu_value(mapping, i);
+
+		if (menu_value == val)
+			return i;
+	}
+
+	return val;
+}
+
 /*
  * Extract the bit string specified by mapping->offset and mapping->size
  * from the little-endian data stored at 'data' and return the result as
@@ -849,6 +868,16 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 	if (mapping->data_type == UVC_CTRL_DATA_TYPE_SIGNED)
 		value |= -(value & (1 << (mapping->size - 1)));
 
+	/* If it is a menu, convert from uvc to v4l2. */
+	if (mapping->v4l2_type != V4L2_CTRL_TYPE_MENU)
+		return value;
+
+	switch (query) {
+	case UVC_GET_CUR:
+	case UVC_GET_DEF:
+		return uvc_menu_to_v4l2_menu(mapping, value);
+	}
+
 	return value;
 }
 
@@ -1013,32 +1042,6 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
 	return 0;
 }
 
-static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
-				const u8 *data)
-{
-	s32 value = mapping->get(mapping, UVC_GET_CUR, data);
-
-	if (mapping->v4l2_type == V4L2_CTRL_TYPE_MENU) {
-		unsigned int i;
-
-		for (i = 0; BIT(i) <= mapping->menu_mask; ++i) {
-			u32 menu_value;
-
-			if (!test_bit(i, &mapping->menu_mask))
-				continue;
-
-			menu_value = uvc_mapping_get_menu_value(mapping, i);
-
-			if (menu_value == value) {
-				value = i;
-				break;
-			}
-		}
-	}
-
-	return value;
-}
-
 static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
 			       struct uvc_control *ctrl)
 {
@@ -1089,8 +1092,8 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ret < 0)
 		return ret;
 
-	*value = __uvc_ctrl_get_value(mapping,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	*value = mapping->get(mapping, UVC_GET_CUR,
+			      uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
 	return 0;
 }
@@ -1240,7 +1243,6 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 {
 	struct uvc_control_mapping *master_map = NULL;
 	struct uvc_control *master_ctrl = NULL;
-	unsigned int i;
 
 	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
 	v4l2_ctrl->id = mapping->id;
@@ -1283,21 +1285,6 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		v4l2_ctrl->minimum = ffs(mapping->menu_mask) - 1;
 		v4l2_ctrl->maximum = fls(mapping->menu_mask) - 1;
 		v4l2_ctrl->step = 1;
-
-		for (i = 0; BIT(i) <= mapping->menu_mask; ++i) {
-			u32 menu_value;
-
-			if (!test_bit(i, &mapping->menu_mask))
-				continue;
-
-			menu_value = uvc_mapping_get_menu_value(mapping, i);
-
-			if (menu_value == v4l2_ctrl->default_value) {
-				v4l2_ctrl->default_value = i;
-				break;
-			}
-		}
-
 		return 0;
 
 	case V4L2_CTRL_TYPE_BOOLEAN:
@@ -1580,7 +1567,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 		uvc_ctrl_set_handle(handle, ctrl, NULL);
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
-		s32 value = __uvc_ctrl_get_value(mapping, data);
+		s32 value = mapping->get(mapping, UVC_GET_CUR, data);
 
 		/*
 		 * handle may be NULL here if the device sends auto-update
-- 
2.39.5


