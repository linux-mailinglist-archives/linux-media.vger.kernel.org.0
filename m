Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B4A2DFFCC
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgLUSbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbgLUSbl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:31:41 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E922BC0611CA
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:31:00 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id v14so10770853wml.1
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JUU/kBHu4HGyyU4lEfHmeqtlxPdX9da5tT69I1KN5l0=;
        b=RWPF+0/oIbWQeDALXn2RpugXOROfawoQb+MqopV9BlmzeSpPAK2+HxXhIMisSBUoME
         hmKnuJ+QNwO5Aotg8ayGcrUi5hq5IeyW1sMKEzXYNW5QrTCvU+3jJpDoSxW7FZ81xZ4v
         S74ggY32Eyb+vTSXutpARpZ8Dy3fWFQ/g94oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JUU/kBHu4HGyyU4lEfHmeqtlxPdX9da5tT69I1KN5l0=;
        b=RU0plL6vwSvYdKyPACwlJJAQRxvjZeWHBLoXftRN3YtuA0YjCX4aU9B4pSK2hkXpqJ
         FZ6ZwJPKia3G+uO7arLoWhjcyANoXEBCkbo5d2Pxa6DyxkETE0hNY68cNeDTmJZHMuQ6
         rQ/aKQFDMxfal/g72/RJPj3BMIlVT/UywwksNIEweqedD1T0A0cApPedb7AavkrLkL7r
         QFW1P0O+dbTN3kzU8ccalF0pLA8SrSonoSj/mWJEiIF0sXIf1SpUK8egz6YdeRX5YZdH
         DrbCVIzSlJnmOvCAQKOQz2CrQMu/AsO3hK3g1I9SL7QR3r7r34luAwSynLpjznEtFfvu
         qwdw==
X-Gm-Message-State: AOAM530kI39Z3VOvtpLQy5F+9OH7xaCI29j0V0xNioF0ituAuDEfdAt3
        k7QqAXjMmBMD5YPqPBPNNggtlmquG8C7aERshdE=
X-Google-Smtp-Source: ABdhPJzy9mh3U6pQMxNO/zWfgHQ0T3XCX+bncmTrEkG545InEDWoLdm0B+Cen1oUnpgSs/JWtU9OvA==
X-Received: by 2002:a1c:6402:: with SMTP id y2mr17003057wmb.43.1608569303631;
        Mon, 21 Dec 2020 08:48:23 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o125sm24581109wmo.30.2020.12.21.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:48:23 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 02/12] media: uvcvideo: Allow more that one asyc_ctrl
Date:   Mon, 21 Dec 2020 17:48:09 +0100
Message-Id: <20201221164819.792019-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201221164819.792019-1-ribalda@chromium.org>
References: <20201221164819.792019-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current implementation allocates memory for only one async_control.
If we get a second event before we have processed the previous one, the
old one gets lost.

Introduce a dynamic memory allocation and a list to handle the
async_controls.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 49 ++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h | 19 ++++++++-----
 2 files changed, 52 insertions(+), 16 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index aa18dcdf8165..69b2fc6ce12c 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1275,11 +1275,9 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
 }
 
-static void uvc_ctrl_status_event_work(struct work_struct *work)
+static void __uvc_ctrl_status_event_work(struct uvc_device *dev,
+					 struct uvc_ctrl_work *w)
 {
-	struct uvc_device *dev = container_of(work, struct uvc_device,
-					      async_ctrl.work);
-	struct uvc_ctrl_work *w = &dev->async_ctrl;
 	struct uvc_video_chain *chain = w->chain;
 	struct uvc_control_mapping *mapping;
 	struct uvc_control *ctrl = w->ctrl;
@@ -1321,23 +1319,54 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
 			   ret);
 }
 
+static void uvc_ctrl_status_event_work(struct work_struct *work)
+{
+	struct uvc_device *dev = container_of(work, struct uvc_device,
+					      async_ctrl_work);
+	struct uvc_ctrl_work *w;
+
+	do {
+		mutex_lock(&dev->async_ctrl_lock);
+		w = list_first_entry_or_null(&dev->async_ctrl_list,
+					     struct uvc_ctrl_work,
+					     list);
+		if (w)
+			list_del(&w->list);
+		mutex_unlock(&dev->async_ctrl_lock);
+
+		if (!w)
+			return;
+
+		__uvc_ctrl_status_event_work(dev, w);
+		kfree(w);
+	} while (w);
+}
+
 bool uvc_ctrl_status_event(struct urb *urb, struct uvc_video_chain *chain,
 			   struct uvc_control *ctrl, const u8 *data)
 {
 	struct uvc_device *dev = chain->dev;
-	struct uvc_ctrl_work *w = &dev->async_ctrl;
+	struct uvc_ctrl_work *w;
 
 	if (list_empty(&ctrl->info.mappings)) {
 		ctrl->handle = NULL;
 		return false;
 	}
 
+	w = kzalloc(sizeof(*w), GFP_KERNEL);
+	if (WARN(!w, "Not enough memory to trigger uvc event"))
+		return false;
+
 	memcpy(w->data, data, ctrl->info.size);
 	w->urb = urb;
 	w->chain = chain;
 	w->ctrl = ctrl;
 
-	schedule_work(&w->work);
+	mutex_lock(&dev->async_ctrl_lock);
+	list_add_tail(&w->list, &dev->async_ctrl_list);
+	mutex_unlock(&dev->async_ctrl_lock);
+
+	schedule_work(&dev->async_ctrl_work);
 
 	return true;
 }
@@ -2277,7 +2306,9 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 	struct uvc_entity *entity;
 	unsigned int i;
 
-	INIT_WORK(&dev->async_ctrl.work, uvc_ctrl_status_event_work);
+	INIT_WORK(&dev->async_ctrl_work, uvc_ctrl_status_event_work);
+	mutex_init(&dev->async_ctrl_lock);
+	INIT_LIST_HEAD(&dev->async_ctrl_list);
 
 	/* Walk the entities list and instantiate controls */
 	list_for_each_entry(entity, &dev->entities, list) {
@@ -2348,8 +2379,8 @@ void uvc_ctrl_cleanup_device(struct uvc_device *dev)
 	unsigned int i;
 
 	/* Can be uninitialized if we are aborting on probe error. */
-	if (dev->async_ctrl.work.func)
-		cancel_work_sync(&dev->async_ctrl.work);
+	if (dev->async_ctrl_work.func)
+		cancel_work_sync(&dev->async_ctrl_work);
 
 	/* Free controls and control mappings for all entities. */
 	list_for_each_entry(entity, &dev->entities, list) {
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 0db6c2e0bd98..afcaf49fad1a 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -637,6 +637,14 @@ struct uvc_device_info {
 	u32	meta_format;
 };
 
+struct uvc_ctrl_work {
+	struct list_head list;
+	struct urb *urb;
+	struct uvc_video_chain *chain;
+	struct uvc_control *ctrl;
+	u8 data[UVC_MAX_STATUS_SIZE];
+};
+
 struct uvc_device {
 	struct usb_device *udev;
 	struct usb_interface *intf;
@@ -673,13 +681,10 @@ struct uvc_device {
 	struct input_dev *input;
 	char input_phys[64];
 
-	struct uvc_ctrl_work {
-		struct work_struct work;
-		struct urb *urb;
-		struct uvc_video_chain *chain;
-		struct uvc_control *ctrl;
-		u8 data[UVC_MAX_STATUS_SIZE];
-	} async_ctrl;
+	/* Async control */
+	struct work_struct async_ctrl_work;
+	struct list_head async_ctrl_list;
+	struct mutex async_ctrl_lock;
 };
 
 enum uvc_handle_state {
-- 
2.29.2.684.gfbc64c5ab5-goog

