Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA434665689
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 09:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236100AbjAKIw5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 03:52:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235850AbjAKIwu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 03:52:50 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA945F014
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 00:52:44 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id b17so8576966pld.7
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 00:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flIhO45h+mwJLw1XX1p4rJpdGUR0h1OEp/Ako5axtJg=;
        b=hMc8jI1K1VoA2Oz/6g/H4SgZ1M+wv0nts25v+cfYIGnHub05Thjt5mZMJ90mo149iW
         LLkjWYL96OFBEcEJKZzjLgT/K6OiHl7YZp1KJvSucokcRDcjLglyIbXvugeBDtVBo+oK
         YPEmj+RMakWFOlG9w7WSSQqnB1r9NivNnuoMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flIhO45h+mwJLw1XX1p4rJpdGUR0h1OEp/Ako5axtJg=;
        b=hQKtJcwZ/zGhEtgaDXhAk74nCJQazmEdPnIUUYjgfDs1oQEDFfp+OZWsNWqq2kTw+r
         oG/6zhupuASDgnraBeSg3lN/1kreWh4hbmCtkG3eylgbi/1nR8gZuSEwDTXz3ZSsoPlS
         P2SVZ63Qr03ER6gJt+Z2YPA8BixwYQx62Q4VxLmFSSmEBP5aNQzKPJcN+zhB0cMpw4sw
         Ucu/SjebdoO0gGt/wQ8aeVZq1J1p6bydohhoA+XHiDTfhhB6LgJh151TZ2W/htv3bqwP
         JYBUGhMZUw6T0PGmMLqmPiGdEbyluBsc44aLnMHRrXoun9VFO+mz9RFSJ+W2aUWc07XY
         vv7Q==
X-Gm-Message-State: AFqh2kpwZnYoBXGEMMbo6rQEKgVTPRhCYUuJJhUYKh7aHFR6GhDify1u
        2tFW99VJabApJWJcSEEi8HPy5w==
X-Google-Smtp-Source: AMrXdXsSJsIFBuA/d45r8k5J1kxFK5aNDcnKRC5HH1dSgUuy2J2TMrpHEEhl9oozjl9WyqtaXXMLFg==
X-Received: by 2002:a17:902:ebc3:b0:189:361f:89ac with SMTP id p3-20020a170902ebc300b00189361f89acmr86973770plg.64.1673427164224;
        Wed, 11 Jan 2023 00:52:44 -0800 (PST)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:c84:581:fd3a:b32b])
        by smtp.gmail.com with ESMTPSA id ik9-20020a170902ab0900b00183c67844aesm9566612plb.22.2023.01.11.00.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 00:52:43 -0800 (PST)
From:   Yunke Cao <yunkec@chromium.org>
Date:   Wed, 11 Jan 2023 17:52:38 +0900
Subject: [PATCH RFC 1/3] media: v4l2-ctrls: Expose v4l2_ctrl_fill_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230111-uvc_privacy_subdev-v1-1-f859ac9a01e3@chromium.org>
References: <20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org>
In-Reply-To: <20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Yunke Cao <yunkec@chromium.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.11.0-dev-4d321
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename fill_event() to v4l2_ctrl_fill_event() and expose it to drivers.

Signed-off-by: Yunke Cao <yunkec@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c |  9 +++++----
 include/media/v4l2-ctrls.h                | 12 ++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 29169170880a..184e03d032d9 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -16,8 +16,8 @@
 
 static const union v4l2_ctrl_ptr ptr_null;
 
-static void fill_event(struct v4l2_event *ev, struct v4l2_ctrl *ctrl,
-		       u32 changes)
+void v4l2_ctrl_fill_event(struct v4l2_event *ev, struct v4l2_ctrl *ctrl,
+			  u32 changes)
 {
 	memset(ev, 0, sizeof(*ev));
 	ev->type = V4L2_EVENT_CTRL;
@@ -38,6 +38,7 @@ static void fill_event(struct v4l2_event *ev, struct v4l2_ctrl *ctrl,
 		ev->u.ctrl.step = ctrl->step;
 	ev->u.ctrl.default_value = ctrl->default_value;
 }
+EXPORT_SYMBOL(v4l2_ctrl_fill_event);
 
 void send_initial_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl)
 {
@@ -46,7 +47,7 @@ void send_initial_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl)
 
 	if (!(ctrl->flags & V4L2_CTRL_FLAG_WRITE_ONLY))
 		changes |= V4L2_EVENT_CTRL_CH_VALUE;
-	fill_event(&ev, ctrl, changes);
+	v4l2_ctrl_fill_event(&ev, ctrl, changes);
 	v4l2_event_queue_fh(fh, &ev);
 }
 
@@ -57,7 +58,7 @@ void send_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 changes)
 
 	if (list_empty(&ctrl->ev_subs))
 		return;
-	fill_event(&ev, ctrl, changes);
+	v4l2_ctrl_fill_event(&ev, ctrl, changes);
 
 	list_for_each_entry(sev, &ctrl->ev_subs, node)
 		if (sev->fh != fh ||
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index e59d9a234631..52b2f366cdb6 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -847,6 +847,18 @@ void v4l2_ctrl_auto_cluster(unsigned int ncontrols,
  */
 struct v4l2_ctrl *v4l2_ctrl_find(struct v4l2_ctrl_handler *hdl, u32 id);
 
+/**
+ * v4l2_ctrl_fill_event() - Fill the v4l2 event for a control.
+ *
+ * @ev:		The event to fill.
+ * @ctrl:	The struct v4l2_ctrl for the control event.
+ * @changes:	A bitmask that tells what has changed.
+ *
+ * This function assumes that the control handler is locked.
+ */
+void v4l2_ctrl_fill_event(struct v4l2_event *ev, struct v4l2_ctrl *ctrl,
+			  u32 changes);
+
 /**
  * v4l2_ctrl_activate() - Make the control active or inactive.
  * @ctrl:	The control to (de)activate.

-- 
b4 0.11.0-dev-4d321
