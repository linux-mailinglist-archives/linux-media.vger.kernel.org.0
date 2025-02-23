Return-Path: <linux-media+bounces-26731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A02EEA41135
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E9C23B781B
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C3D21146F;
	Sun, 23 Feb 2025 18:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZvtngmJB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFBB20FAB6
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 18:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337187; cv=none; b=YTlBjy/GANKsCcrBfIcXKvZnTJUDiYHOjU1DqmXQjXfYCrteWm51lPKJov1N431YWn97Ha0pFFl5edshXRq7uv3+yRrtriYciBfd9XJomOY8maZSuatpTIvxitlHFwLNXk3aPJmPcsg6K5pX6tThWcGyfsa0p/RAz9rna434uNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337187; c=relaxed/simple;
	bh=dnwNReE1hPulb+Tc8iZo/fcErBj/zFU9VbifxtAwbsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PIkCI3O8/d52iJQAPgQjvpCLyvI9GbjIrtiie4ZAiVcNbtBRMfq/S9RsyntKSoSxCdwHYZdU7W2o57mWUfoEjpSSGl4ItM4FzVXdqz4mVMbNsPqPbrjB+g4itoTziVyoXNslN0hd5tB8hBE3AJeX7vGacta62IPaQkSEPNLeSxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZvtngmJB; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c0a3d6a6e4so357980985a.1
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 10:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337185; x=1740941985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1ZNr+zAsbdRe6SnCCPjc7UJkoW/yg5cRHdJ7D9R9Hg=;
        b=ZvtngmJBQl9C27rYRt+X+FHVcXHm8b8taPsOH+hMlheQD3nFZ9LlBFPHq4HB5HmXBn
         WbV2LzrkvRZjsSyZ9vmugp8hchSiTko3xNu033TdYjkySkoKZh1KHVRFh+aoe+36kDRU
         AKS6ez8J+fL5jHzNts8/KNMyWzGgKl7zPvBos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337185; x=1740941985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1ZNr+zAsbdRe6SnCCPjc7UJkoW/yg5cRHdJ7D9R9Hg=;
        b=VBdzP0nT5+20z0g+1kZpHVT2O9ej4p6gj2AOQeT9zjTvDH6MW7oqyIJtC7q8coBdfF
         59B2a7JvtNNL5lj7nHScTpt4/gRt8yYnQdrktTpaN4+Zb/f78fsAfkyLpqE2ouYk12Lm
         mEn5I2FUewBp+ezIwRJywDoPzfH5NA40ccph9vxg6oXkTT57uumQx2GRh2zs6+Kr8H4k
         XkI004yIumF5R1sjEtwx9CA9ys8/UIuc8NvvqCRIC0EKvsxQiOgpH7kxDYyTIh4N3GMM
         2lfNTy3CYIAaMaWnbw87SXLHXnr/micn3SBEbwtvyFCwexf+hvPX3dTC2moif5J7fz/h
         DElg==
X-Gm-Message-State: AOJu0YxOTwmFjxP3Xw4dULM0x48PU8HjZ3WqyoLHmbEYgCl+r7Wj7C5r
	ORvG4mM2DwnehUaqyTf6Nr9s6I0dyFRUShHEQLL+h8aMPjMDQ4NkTu8WLufIIA==
X-Gm-Gg: ASbGncu9mokCd+LJHh9BXPGCkD9dcNqLpm6sJsG5cgwhRnwiBWXzI/G1r+lwfAdl4rf
	UBdLNdnN4O0g3FAgAZ4yebAsANt6QR67yaE9iXSoM2h4GDiMDotkXKn8LHEZPGwY63wCvHaF6PN
	NRAnIA1InYlGA1sJt+Dh8CPuQ6A7cBnYecqTtJbVhOUnOvbVY2Cu9rt46zSvvxyuyZbSFh67eRQ
	4pgwbzbPvW7Gy2/GTYnNuOTU59Dc05qMSc/1fgM9lMq3kwxBFhlmNdEI4Xpj4yXZxwzSYrieReZ
	3hTRfAbJ4hJlg1EMFie1ZuhliuGSGsxYFnd5OUYXUDFJKGvJ612yVOc9HhL1M1Ud22WAGUrPBAl
	PGK4=
X-Google-Smtp-Source: AGHT+IERdPcmnp8DFkM7FzQDBmkbwLEcVj462XFjOmf0I55eocLBJbotx9VABzofXN7Sh0Nf0lYF2A==
X-Received: by 2002:a05:620a:470d:b0:7c0:be0f:2dad with SMTP id af79cd13be357-7c0ceef9875mr1290641485a.21.1740337184802;
        Sun, 23 Feb 2025 10:59:44 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:44 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:15 +0000
Subject: [PATCH v3 12/12] media: radio-wl1273: Rename
 wl1273_fm_vidioc_s_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-12-4292911cab6b@chromium.org>
References: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
In-Reply-To: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Now that vidioc_s_ctrl is gone we want to remove that string from all
the codebase.

Besides, it isn't the correct name of this function anyway. It's clearly a
left-over from the past.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/radio/radio-wl1273.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/radio/radio-wl1273.c b/drivers/media/radio/radio-wl1273.c
index 511a8ede05ec..f55217ccf2b8 100644
--- a/drivers/media/radio/radio-wl1273.c
+++ b/drivers/media/radio/radio-wl1273.c
@@ -1407,7 +1407,7 @@ static inline struct wl1273_device *to_radio(struct v4l2_ctrl *ctrl)
 	return container_of(ctrl->handler, struct wl1273_device, ctrl_handler);
 }
 
-static int wl1273_fm_vidioc_s_ctrl(struct v4l2_ctrl *ctrl)
+static int wl1273_fm_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct wl1273_device *radio = to_radio(ctrl);
 	struct wl1273_core *core = radio->core;
@@ -1945,7 +1945,7 @@ static void wl1273_vdev_release(struct video_device *dev)
 }
 
 static const struct v4l2_ctrl_ops wl1273_ctrl_ops = {
-	.s_ctrl = wl1273_fm_vidioc_s_ctrl,
+	.s_ctrl = wl1273_fm_s_ctrl,
 	.g_volatile_ctrl = wl1273_fm_g_volatile_ctrl,
 };
 

-- 
2.48.1.601.g30ceb7b040-goog


