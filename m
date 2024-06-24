Return-Path: <linux-media+bounces-14039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CDC9146C6
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F086A1F247A3
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07271353FF;
	Mon, 24 Jun 2024 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OV1kVDJ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793FA13248E
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719222969; cv=none; b=i1LOux8sMCpmn16Jpb8jgxErigj96N31K8cZS9Tylf0bQg6Diov0j5/WTG4jYiM1UWGpDLGa7935iBfVrFGmhHVfRQKagk7Jb+3DRkvc4mUax1t8P5dowfiOgHT/s61qvbzcGGUsmI+RZNxD8Mg0CHmsjZ4RHTSKaIXuDzamX4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719222969; c=relaxed/simple;
	bh=qmHKEKDnN45JhCq/y1mfhsYJUYs57zV4/K11uePgzR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tiU+/R5y/3vIn+Os4d4xcwdj9IM4ngVmZgJUzFdvW/UwCYILuwWFCEHbfSW1BCcqhMVf1it93gj8Zs43YNZHMI4LbOlrDqZcU4zQr1oZoWjVORLGaBqqv/0/13GJqybCZHOYqMTVjzCLdzl9XSW8yo2TQA77/sCC3aQG+VaMVhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OV1kVDJ5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-421757d217aso45141465e9.3
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 02:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719222966; x=1719827766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLiiebCYn2vPGhf2nnjMbWinX/JVBJIu6bSK5TOGy64=;
        b=OV1kVDJ5ThQHRp5zV5/7XeuwqL2G+xI7aMl/fqM+6SBlammUhILw7rX8BzdQIF2kz4
         n2ZlxV0g5PG7/ssG7zkDIsGmcWvwgghB6Ag8duAH0qdzZ/dW22mLnweeDlj3bIlY8V9L
         bwLftYu5EzNxS8T13H2J/MhUlFHw5KBiBdf/Bg7fpyJXYl/ftsWCNcBuWyYuBdGb5IEF
         N+JhCOJh2RG6SVW40ELRPyzI+ihzZAfxvotQMOW6L6fvQw9p0vKxehGtSplyemOgYVnO
         zDvYUJoXUDoFOG+8KWCPV5kh0Pb83quoSTy2oIPFOg0W6Q3jebOlEEBYDibFjEd/blVt
         Wc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222966; x=1719827766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLiiebCYn2vPGhf2nnjMbWinX/JVBJIu6bSK5TOGy64=;
        b=q7v92vmk8Yf0BEwGj0Hu/hjXUsVbF9vu28ZKzxCcLzVj55UIZofRfCY1GZJCz1RZfP
         j0xAL8OHboHVxQ/EX5S4usbjcYSYww/8KrqyWmqZchKXxPoo7WsSyk5nk/KYk5IvOw3s
         CQ3qGBo/tnsQ5tJlDmlJ/XgppTTsbhHV9yVqiVmIl5vIUAu7G9zTgLQNiNqerIyfkChJ
         Od8IrMqjTdYLhqvpBCqtySnCU/+sP7vJ1HOwBW7rYVhItehjOVLbxdMU0fc804qVubIC
         cSES4qzvwNWeALvIWF9xFXTZeHD8gwxlMAD3tn0KkGSKNVrU4GS3Rh6glHZMbeTVF119
         BI3A==
X-Gm-Message-State: AOJu0YxGaWpPdQj+a2kFuCxR57Ltr/YooI/IcATnEfjMH5mg0PXOHvyb
	B3T1n0dHyz/rVyEYf+2Goh/6iz2xDs3rVTz6X6qMAU8bAD6Z+yPGj8TW2vY=
X-Google-Smtp-Source: AGHT+IH6L5gbSEKxI57b1KxuVDcZO4s7as7lcAJsCLgTmyB+XwJHs067PgIS7+rGWox6aOlnsCcRkw==
X-Received: by 2002:a05:600c:470d:b0:424:784c:b134 with SMTP id 5b1f17b1804b1-4248cc17964mr36730135e9.6.1719222965752;
        Mon, 24 Jun 2024 02:56:05 -0700 (PDT)
Received: from localhost.localdomain ([105.163.2.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5ca0sm128258475e9.24.2024.06.24.02.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:56:05 -0700 (PDT)
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
To: linux-media@vger.kernel.org
Cc: anonolitunya@gmail.com,
	jaffe1@gmail.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 07/10] media: vivid: add instance number to input/output names
Date: Mon, 24 Jun 2024 12:53:00 +0300
Message-Id: <20240624095300.745567-8-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624095300.745567-1-anonolitunya@gmail.com>
References: <20240624095300.745567-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Add the instance number before the input or output number.
So "HDMI 1" becomes "HDMI 000-1".

This is helps identifying which input or output belongs to
which vivid instance.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 16 ++++++++--------
 drivers/media/test-drivers/vivid/vivid-vid-out.c |  8 ++++----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index de4cb85e397f..fcbef8b58127 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -1072,13 +1072,13 @@ int vidioc_enum_input(struct file *file, void *priv,
 	inp->type = V4L2_INPUT_TYPE_CAMERA;
 	switch (dev->input_type[inp->index]) {
 	case WEBCAM:
-		snprintf(inp->name, sizeof(inp->name), "Webcam %u",
-				dev->input_name_counter[inp->index]);
+		snprintf(inp->name, sizeof(inp->name), "Webcam %03u-%u",
+			 dev->inst, dev->input_name_counter[inp->index]);
 		inp->capabilities = 0;
 		break;
 	case TV:
-		snprintf(inp->name, sizeof(inp->name), "TV %u",
-				dev->input_name_counter[inp->index]);
+		snprintf(inp->name, sizeof(inp->name), "TV %03u-%u",
+			 dev->inst, dev->input_name_counter[inp->index]);
 		inp->type = V4L2_INPUT_TYPE_TUNER;
 		inp->std = V4L2_STD_ALL;
 		if (dev->has_audio_inputs)
@@ -1086,16 +1086,16 @@ int vidioc_enum_input(struct file *file, void *priv,
 		inp->capabilities = V4L2_IN_CAP_STD;
 		break;
 	case SVID:
-		snprintf(inp->name, sizeof(inp->name), "S-Video %u",
-				dev->input_name_counter[inp->index]);
+		snprintf(inp->name, sizeof(inp->name), "S-Video %03u-%u",
+			 dev->inst, dev->input_name_counter[inp->index]);
 		inp->std = V4L2_STD_ALL;
 		if (dev->has_audio_inputs)
 			inp->audioset = (1 << ARRAY_SIZE(vivid_audio_inputs)) - 1;
 		inp->capabilities = V4L2_IN_CAP_STD;
 		break;
 	case HDMI:
-		snprintf(inp->name, sizeof(inp->name), "HDMI %u",
-				dev->input_name_counter[inp->index]);
+		snprintf(inp->name, sizeof(inp->name), "HDMI %03u-%u",
+			 dev->inst, dev->input_name_counter[inp->index]);
 		inp->capabilities = V4L2_IN_CAP_DV_TIMINGS;
 		if (dev->edid_blocks == 0 ||
 		    dev->dv_timings_signal_mode[dev->input] == NO_SIGNAL)
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index 1653b2988f7e..a299b872c05a 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -964,16 +964,16 @@ int vidioc_enum_output(struct file *file, void *priv,
 	out->type = V4L2_OUTPUT_TYPE_ANALOG;
 	switch (dev->output_type[out->index]) {
 	case SVID:
-		snprintf(out->name, sizeof(out->name), "S-Video %u",
-				dev->output_name_counter[out->index]);
+		snprintf(out->name, sizeof(out->name), "S-Video %03u-%u",
+			 dev->inst, dev->output_name_counter[out->index]);
 		out->std = V4L2_STD_ALL;
 		if (dev->has_audio_outputs)
 			out->audioset = (1 << ARRAY_SIZE(vivid_audio_outputs)) - 1;
 		out->capabilities = V4L2_OUT_CAP_STD;
 		break;
 	case HDMI:
-		snprintf(out->name, sizeof(out->name), "HDMI %u",
-				dev->output_name_counter[out->index]);
+		snprintf(out->name, sizeof(out->name), "HDMI %03u-%u",
+			 dev->inst, dev->output_name_counter[out->index]);
 		out->capabilities = V4L2_OUT_CAP_DV_TIMINGS;
 		break;
 	}
-- 
2.34.1


