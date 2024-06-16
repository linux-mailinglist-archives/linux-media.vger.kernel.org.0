Return-Path: <linux-media+bounces-13342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D369390A0BF
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FAE9282058
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8631873472;
	Sun, 16 Jun 2024 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IpsMMtGs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABE473450
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 23:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579656; cv=none; b=UuSlwgyWTun+KEOzuvpbBsERcQSezZTZCBW9DP579dmE469fMsVHgYxn4QgNL8IYfL4JNCEmTetl+duK11F4bhKkdfJjKGeQoPC1dpb3NFQAmCufo7PBIE8v90taAH/3a0uwoAtV4Ma2ifiyjT7K05wXP4bgcPGVnD1krXiaj58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579656; c=relaxed/simple;
	bh=OkYuXRPELbzjnKK+cdd1oa91gXltMLc59yndUkH5+y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqWwMRVJBPR/qZurgOaaxl+mbdb4ypr9mmiPQUIjtKLikTlWtH6Uh63b/tXfPFHANK1PUGsAcamyVYYazVSdDkwJa0Wz8jn4H2f7O6rIPhzkIKoBAVSeXuvaaPuX952qkY4BR3AIIt8WLOh2zOAt+DrGbW+K/Yl4Q0ADBUEQOWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IpsMMtGs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B598E9C1;
	Mon, 17 Jun 2024 01:13:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718579636;
	bh=OkYuXRPELbzjnKK+cdd1oa91gXltMLc59yndUkH5+y4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IpsMMtGsNjM/YjU+6O9J79I0a4iPNtAma46fcdXwtG8yc2bP7/DChTM25Dt7R5k7d
	 KvN0y/RG+DoIWy7DY6XeqSuEXMQ2CGfXlqZwva4bqi2FosFDHIZpR6I5j7kxxin3lS
	 /vhQYReFBqy7u5ya2My6rt3DEVQuLVR/8mUfNRc8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 1/6] media: uvcvideo: Allow custom control mapping
Date: Mon, 17 Jun 2024 02:13:45 +0300
Message-ID: <20240616231350.6787-2-laurent.pinchart@ideasonboard.com>
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

Some advanced controls might not be completely implemented by vendors.

If the controls are a enumeration, UVC does not gives a way to probe
what is implemented and what is not.

Let's create a new callback function where heuristics can be implemented
to detect what is implemented and what not and update the control
mapping accordingly.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Replace .add_mapping() with .filter_mapping()
- Modify the filtering logic: mappings whose filter function return NULL
  as skipped
---
 drivers/media/usb/uvc/uvc_ctrl.c | 7 +++++++
 drivers/media/usb/uvc/uvcvideo.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4b685f883e4d..bc30af516afd 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2652,6 +2652,13 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
 		const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
 
+		/* Let the device provide a custom mapping. */
+		if (mapping->filter_mapping) {
+			mapping = mapping->filter_mapping(chain, ctrl);
+			if (!mapping)
+				continue;
+		}
+
 		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 		    ctrl->info.selector == mapping->selector)
 			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index e5b12717016f..93b421918d3b 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -87,7 +87,9 @@
 
 struct gpio_desc;
 struct sg_table;
+struct uvc_control;
 struct uvc_device;
+struct uvc_video_chain;
 
 /*
  * TODO: Put the most frequently accessed fields at the beginning of
@@ -126,6 +128,9 @@ struct uvc_control_mapping {
 	s32 master_manual;
 	u32 slave_ids[2];
 
+	const struct uvc_control_mapping *(*filter_mapping)
+				(struct uvc_video_chain *chain,
+				struct uvc_control *ctrl);
 	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
 		   const u8 *data);
 	void (*set)(struct uvc_control_mapping *mapping, s32 value,
-- 
Regards,

Laurent Pinchart


