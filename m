Return-Path: <linux-media+bounces-12896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04207902C3E
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 01:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F40081C20D83
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6B015250D;
	Mon, 10 Jun 2024 23:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MLHWCuCh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F261514DE
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060997; cv=none; b=hE0/9+UmvOB3sNQyOmS7aQkkbU4qIUI0t8UMBj7GBM45oaxL9ZNNyEsyDEXoqU9axvPP+Zck0XFJpTHskL/BE8bk1nMtLtbmauSeTWdeGFwwcly5BTmis1pYq3vYNT1eCseuWYLqCoVe/LV66L6m+U6MtVelcXSFG8NZmfzuj8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060997; c=relaxed/simple;
	bh=mmRiog2A0uIil7zCDWbDB/RKRQKrz+dasll7tr7FLWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pl+y4Pw+LPlWV+evYfBBbI2l/9FUTuCG45DjaC5J6uPqwA3VnbswrH7dA8S6kDn5xrUsR0VXoFOn4ByQLBGmbiFiAu1/jWht/aebTL66Qcgct0oIoFDtJjkB/3ywpCPAPgW5Rc69SoCoQ+QF/z8RzDVDOerx1jee2/46v8ZyqLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MLHWCuCh; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6b08857f3b8so3296756d6.2
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718060995; x=1718665795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vu2oMVYEjcsFAa+zF1RhnzGy00bzVv1v7T1Od5qxCIk=;
        b=MLHWCuChNAbVxsAqb/olKWGzXJ5m80Ww2uKLaIjEhulDndbnxldWgzQDQiGiSUpyOa
         bNshPVMgKl8ljlR0WdRvSCFlDcPM3gZF2h2ogHjqRR10ahvU2qbiSZvMbc+NtUWYKQH5
         5/23EfXkGFn4YVZCnJqU+Ng1Xe9T3ayNs90uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060995; x=1718665795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vu2oMVYEjcsFAa+zF1RhnzGy00bzVv1v7T1Od5qxCIk=;
        b=g4lL3rDfg+hfVV2850isvXla2mh+j8dSpZEdfdYELUIVgEVaN4fl8mWd4rWCeODMQ9
         iF7UZgdrXS5omuEmKyaTMlUlD0uGu18VofeOk0LiIKCZ8cQmhzaYwHV/qpiav14D3Amp
         0lKsGQYO2ll0nvj3+zqLbDasv8J77bGKFAYAotbQhBezIHkaolDGEdQGrstpCztlUMak
         xAa/w4H08laa+g+KdlxmNuAQpIzxs0jWZUNFYXDdK7qF9Pmp8Kkk6ylPQU21BsZs1YG5
         p7t8gnoCIt9sGzNpRGRBJAkTUqEFzy2clfDKL8wpDtRyvWIoDSgeAc2/w4aSxS0okA3r
         2Zvw==
X-Forwarded-Encrypted: i=1; AJvYcCW7AkHJG4mQS/Dp77jRLAcXXd1U5Uq6Rh8h7bGP6y15biX7T6e6vCmnIrVqK/FMzR52EC2RUraP5DJS9PzoAE9u6tbMcoDIoqkiQqA=
X-Gm-Message-State: AOJu0YzkyjEcFSQsImNIQqT9PJSO7uLGenUvoDici4pDstiPBuJ0Inl6
	zUWom7Vh/Op4V7q6Vf5HulQWg/TyEP/4q2fTkCbDA4fdCnLrP40rVB8QDNB7rw==
X-Google-Smtp-Source: AGHT+IFSMLwcHePmJYpuKv8V2B4L07cpCeuaHyXPO3dO9KZYt9s0uHdtA5t5lc2zXRfrWt6NJanmiQ==
X-Received: by 2002:a05:6214:2dc8:b0:6b0:7afb:5c85 with SMTP id 6a1803df08f44-6b07afb6026mr69292796d6.3.1718060995102;
        Mon, 10 Jun 2024 16:09:55 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b06519d521sm35256946d6.65.2024.06.10.16.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:09:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 10 Jun 2024 23:09:52 +0000
Subject: [PATCH v2 1/7] media: uvcvideo: Allow custom control mapping
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-billion-v2-1-38e861475f85@chromium.org>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
In-Reply-To: <20240610-billion-v2-0-38e861475f85@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Some advanced controls might not be completely implemented by vendors.

If the controls are a enumeration, UVC does not gives a way to probe
what is implemented and what is not.

Let's create a new callback function where heuristics can be implemented
to detect what is implemented and what not.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 10 +++++++++-
 drivers/media/usb/uvc/uvcvideo.h |  5 +++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c2761..44ec185a8c8b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2360,7 +2360,7 @@ static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
 /*
  * Add a control mapping to a given control.
  */
-static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
+static int __uvc_ctrl_add_mapping_to_list(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
 {
 	struct uvc_control_mapping *map;
@@ -2434,6 +2434,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	return -ENOMEM;
 }
 
+static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
+	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
+{
+	if (mapping && mapping->add_mapping)
+		return mapping->add_mapping(chain, ctrl, mapping);
+	return __uvc_ctrl_add_mapping_to_list(chain, ctrl, mapping);
+}
+
 int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	const struct uvc_control_mapping *mapping)
 {
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6fb0a78b1b00..fa0396dd5b35 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -84,7 +84,9 @@
 
 struct gpio_desc;
 struct sg_table;
+struct uvc_control;
 struct uvc_device;
+struct uvc_video_chain;
 
 /*
  * TODO: Put the most frequently accessed fields at the beginning of
@@ -123,6 +125,9 @@ struct uvc_control_mapping {
 	s32 master_manual;
 	u32 slave_ids[2];
 
+	int (*add_mapping)(struct uvc_video_chain *chain,
+			   struct uvc_control *ctrl,
+			   const struct uvc_control_mapping *mapping);
 	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
 		   const u8 *data);
 	void (*set)(struct uvc_control_mapping *mapping, s32 value,

-- 
2.45.2.505.gda0bf45e8d-goog


