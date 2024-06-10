Return-Path: <linux-media+bounces-12903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E12902C4B
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 01:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B78A4284D36
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFFE1553A4;
	Mon, 10 Jun 2024 23:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M7dQmIL4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F751552F8
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 23:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718061005; cv=none; b=ATNDEOstKvBAL66J5tW9nTZVRbftE1k5PCRP+e0bsVXtWSf9p9qc0ylEXuN5saF3n/LR4k9LFwLU9sQXrubPBpZifwViykb7aUP8MgCpSzU2DA+ElKTkUyOjQVBf6mgfDnQIPrRxLDX4OFO19v+UJZDLLdle00sZ/AlLFZ48cvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718061005; c=relaxed/simple;
	bh=3YQ1MREPZcXZY8Rzdf2ucSaUl0qgCLccvMpvwcUdRxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USlT3NjOg2QCN6neKDc9CUXTK62dDtrdI7sz9murW7byG0+sspuL+gr+ixVBVWMN2Uumww11kOel5owxB/YqOav1B9aBQGD70oK4q7uhKn4+yYILhj8LjP2dzAEqfejipk2pZphLp5l3h24FN5QbDAOnUpPhS4/7RzgRyggjpq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M7dQmIL4; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5b9f9e7176eso2333534eaf.2
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 16:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718061003; x=1718665803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOfU1pocYD2Scfhf5kButvETql9ENuAv9ka+WIo4LyM=;
        b=M7dQmIL40ddmTKpyo9O1PINEm/XLjvqsWwa6sqa437yr1uDbzKH0502VeC1sBoKrrC
         45soHcL4ZS7jAi+ZYxxejaRiFsHMBAhCPVRTBOdqrlIBOFFpg2X2rsKckfmXNlcsmSHz
         sUq6qvMSu9DDYg2EIfg+MNmJb1qRV7ciX1Ce0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718061003; x=1718665803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOfU1pocYD2Scfhf5kButvETql9ENuAv9ka+WIo4LyM=;
        b=V2sKvsBcOgVIswpLghvNvEzmaTrwpxtYQ4Cwuz2Z1FFMihSeMVbRL2i8bynuhK4ENz
         LxpxQygph+GRFtqKdVRPro9mampqgZYfK5c5iTvJPeQWc3X0Sp5nFdILDhxtaw8khQk5
         ookWxjELS0GKKvXJ+/dB2g0wBKwccYAqyNPKlWbtKHZaXeuPRhowGJX8v7YY/2Vx5J0I
         mwzFvZLJpPOGjDs4DodoeuFyjbf3KoXqQ2k4S/VLQmnpXu88yC2A0pJZxr0Di9ptOizh
         7ww4WficqwgzEmVVstnHDZ1kBqhU3YWB/pQNU38q6EV0/LYmkWHtQ9jFXCmy2MrdHiMA
         AK0g==
X-Forwarded-Encrypted: i=1; AJvYcCVP7NmQ/OZ+7Gzz/BbcfGtq8C3SV1g8nITUao2xxzHkpPi6xtGuPbvDlqzPLDQwpvukNqJ7Mculn2BW24MrPAzeZUyfH0UBL0n7eh4=
X-Gm-Message-State: AOJu0Yzu0BevGTfcfdXbRvNTv4RWX5DNT9fDPFWmT6BadN4noiGbjr9+
	buolMQ0SFHQambtdPqq5q3tN0YcHwm6pDL5uWq1wOvkf7xGQYL9VvxHVhfpmwA==
X-Google-Smtp-Source: AGHT+IFGj2VK+72l/JFB5SBb2/B+u/t8MIDQowXQChyupB5qIsFTtEzAdZedl985d4NSC3brJeqMYQ==
X-Received: by 2002:a05:6358:57a3:b0:19f:4553:5514 with SMTP id e5c5f4694b2df-19f45535aadmr801047355d.29.1718061002738;
        Mon, 10 Jun 2024 16:10:02 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b06519d521sm35256946d6.65.2024.06.10.16.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:10:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 10 Jun 2024 23:09:58 +0000
Subject: [PATCH v2 7/7] media: uvcvideo: Replace get_mapping with
 filter_mapping
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-billion-v2-7-38e861475f85@chromium.org>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
In-Reply-To: <20240610-billion-v2-0-38e861475f85@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

If the callback returns a mapping instead of adding it, the codeflow is
more clean and we do not need a forward declaration of
__uvc_ctrl_add_mapping_to_list().

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 40 ++++++++++++++++++----------------------
 drivers/media/usb/uvc/uvcvideo.h |  6 +++---
 2 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 1c1710e3c486..4a13f2685d9e 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -495,11 +495,8 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
 				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
 };
 
-static int __uvc_ctrl_add_mapping_to_list(struct uvc_video_chain *chain,
-	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping);
-
-static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
-	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
+static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping
+		(struct uvc_video_chain *chain, struct uvc_control *ctrl)
 {
 	const struct uvc_control_mapping *out_mapping =
 					&uvc_ctrl_power_line_mapping_uvc11;
@@ -509,7 +506,7 @@ static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
 
 	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
 	if (!buf)
-		return -ENOMEM;
+		return NULL;
 
 	/* Save the default PLF value, so we can restore it. */
 	ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
@@ -517,7 +514,7 @@ static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
 			     buf, sizeof(*buf));
 	/* If we cannot read the control skip it. */
 	if (ret)
-		return ret;
+		return NULL;
 	init_val = *buf;
 
 	/* If PLF value cannot be set to off, it is limited. */
@@ -526,8 +523,7 @@ static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
 			     chain->dev->intfnum, ctrl->info.selector,
 			     buf, sizeof(*buf));
 	if (ret)
-		return __uvc_ctrl_add_mapping_to_list(chain, ctrl,
-					&uvc_ctrl_power_line_mapping_limited);
+		return &uvc_ctrl_power_line_mapping_limited;
 
 	/* UVC 1.1 does not define auto, we can exit. */
 	if (chain->dev->uvc_version < 0x150)
@@ -548,7 +544,7 @@ static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
 		       chain->dev->intfnum, ctrl->info.selector,
 		       buf, sizeof(*buf));
 
-	return __uvc_ctrl_add_mapping_to_list(chain, ctrl, out_mapping);
+	return out_mapping;
 }
 
 static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
@@ -843,7 +839,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	{
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-		.add_mapping	= uvc_ctrl_add_plf_mapping,
+		.filter_mapping	= uvc_ctrl_filter_plf_mapping,
 	},
 };
 
@@ -2411,8 +2407,9 @@ static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
 /*
  * Add a control mapping to a given control.
  */
-static int __uvc_ctrl_add_mapping_to_list(struct uvc_video_chain *chain,
-	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
+static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
+				  struct uvc_control *ctrl,
+				  const struct uvc_control_mapping *mapping)
 {
 	struct uvc_control_mapping *map;
 	unsigned int size;
@@ -2485,14 +2482,6 @@ static int __uvc_ctrl_add_mapping_to_list(struct uvc_video_chain *chain,
 	return -ENOMEM;
 }
 
-static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
-	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
-{
-	if (mapping && mapping->add_mapping)
-		return mapping->add_mapping(chain, ctrl, mapping);
-	return __uvc_ctrl_add_mapping_to_list(chain, ctrl, mapping);
-}
-
 int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	const struct uvc_control_mapping *mapping)
 {
@@ -2681,7 +2670,14 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 
 	/* Process common mappings. */
 	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
-		const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
+		const struct uvc_control_mapping *mapping = NULL;
+
+		/* Try to get a custom mapping from the device. */
+		if (uvc_ctrl_mappings[i].filter_mapping)
+			mapping = uvc_ctrl_mappings[i].filter_mapping(chain,
+								      ctrl);
+		if (!mapping)
+			mapping = &uvc_ctrl_mappings[i];
 
 		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 		    ctrl->info.selector == mapping->selector)
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index ff9545dcf716..a9547795fe22 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -125,9 +125,9 @@ struct uvc_control_mapping {
 	s32 master_manual;
 	u32 slave_ids[2];
 
-	int (*add_mapping)(struct uvc_video_chain *chain,
-			   struct uvc_control *ctrl,
-			   const struct uvc_control_mapping *mapping);
+	const struct uvc_control_mapping *(*filter_mapping)
+				(struct uvc_video_chain *chain,
+				struct uvc_control *ctrl);
 	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
 		   const u8 *data);
 	void (*set)(struct uvc_control_mapping *mapping, s32 value,

-- 
2.45.2.505.gda0bf45e8d-goog


