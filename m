Return-Path: <linux-media+bounces-22959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C749E9F7A
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 334CA2832F8
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 19:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198E119AA72;
	Mon,  9 Dec 2024 19:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j3J9HS76"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FAB1990A7
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 19:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772340; cv=none; b=lN7veF611AprT1F7WN9U4TI8RmGTzG/vKAtALMafc2tU8BkUE4M+2xxZJx6BJLemor3E7FcangFoEF+3DvE1M7vd/8Zuz/scfxgkkCBFP537oZsDQRyzZ3ET4UrenahPJUpU7XsR/c/68w+9AcpDK5NHuUTsQE7fREuLMKKgLkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772340; c=relaxed/simple;
	bh=64tvBdAJsYjij/MYhZgHmQi1NAwPb0Ws3Nyiuj2wFEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nV2sn49wsX4+5BFL623aeMH+g4gcSnvzTOE0u22n/7qgkjB2fGFxFMKXxsP7hyN18v0FrArHuDJhVHy5Z8Unge/YLbdwEiMX5bhr1Zd2Y2eHYdrX8/bmzPtvefPM5LC22aMETqoGc/DjTIuS1AV87Y1HOBpzoCWQB4aHFEvLEwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j3J9HS76; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b15467f383so415481085a.3
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 11:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772338; x=1734377138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjvmPnf8Z5eA5SFOWcK4xqjLhjw4Qhz4HdUq4wZg+ks=;
        b=j3J9HS768c3Ch4LlgB/MDrznPR/pg595aotX7TfjwmFVjR2ac+VnuiBAncyLub2zLG
         BaxyEfzr964Oqis7d9iVfNPFHXtOFrTJcjewHVoTw6oVM4mgJ4RtoSsRCn5PuloKELrV
         ZYNrVK2dwz/fY5T1ncqf+dibKvgdxbIJzbfrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772338; x=1734377138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjvmPnf8Z5eA5SFOWcK4xqjLhjw4Qhz4HdUq4wZg+ks=;
        b=v689jCRdV6rS6BhCbFP0hFwwrZkgNJ1PIiSfQtacIBwSR3UUGZ4gXoKOzpzuC5QA7X
         usDEJ0qbz4kUPVSi/l1NP5hTtvoDTvRWi+uV5GWsiwyt/JFDlplV1J5p78CGXcNLKWuC
         iqnHApM4qyDuG6TPmSdIBL/F3X++rcY322hyP037yUtUIxUYQj0wbf9p06TiYO5PgDKE
         89AKTlGujuCbPQB+4G0+x1MHZgGVyL3pQMbjz0wQoAPE5niJsLf7k67UVXmy/Z98ZnJJ
         84hmVL9JFItVhU3t9HiuTXweqOIM9CIIOig/Qwf5S5rhXZrA60axZRRc6IrzMRfCH6Ra
         hPjw==
X-Gm-Message-State: AOJu0Yw35xqGmUJDGE+5UEy32tqE82GO1Cl+VKk9An3UKoCP7rTG62Iy
	ZDbJt1vj/wgjrXInm9RqKHrbuPnSbetQ7AS4dG/OyRb8egc5XD6MilnV3cBSCw==
X-Gm-Gg: ASbGnct6gUMxF2jYqzLNXScyalvcPTyqYWzi/InQHuL5Kn3gcBeaWSVyoO7UXpUwiX1
	DXVQcyeHBOD8KBcQ4z9gYadtEU63ocNxa7YWsyeOjqWxgrAK04h3DnHj2KB7PFIQaXpGBb6YR7Z
	+GHaYW23g88V8h0oSPDk3B5AKw4pKIiB7mwuAIPu5QWgx4HiuDD2IQiGyovHABvI/1n4lbSDPb/
	eyUGv00suGr+kWnkliUHr2aMcHm1M4cIM5rup1mHHA8sIdVaOiz3TOL/JSUCWiVsGMoMD4W3cqf
	OaRlJJsuYoVNy5eoeMaOi6/M
X-Google-Smtp-Source: AGHT+IH1wzP+i+irxWUKaESGp3CH30PU34aVuj1OORJWuuu0GU8d5eHV3sDCSLEwq9q3e/12onKEKQ==
X-Received: by 2002:a05:620a:8904:b0:7b6:dc74:82a5 with SMTP id af79cd13be357-7b6dcdcdcd8mr249752585a.10.1733772337958;
        Mon, 09 Dec 2024 11:25:37 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:37 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:35 +0000
Subject: [PATCH 04/10] media: uvcvideo: Remove vidioc_queryctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-4-deff7acfcdcb@chromium.org>
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
In-Reply-To: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
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

It can be implemented by the v4l2 ioctl framework using
vidioc_query_ext_ctrl.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 97c5407f6603..39f0ddb6d01c 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1014,15 +1014,6 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 	return ret;
 }
 
-static int uvc_ioctl_queryctrl(struct file *file, void *fh,
-			       struct v4l2_queryctrl *qc)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_video_chain *chain = handle->chain;
-
-	return uvc_query_v4l2_ctrl(chain, qc);
-}
-
 static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
 				    struct v4l2_query_ext_ctrl *qec)
 {
@@ -1563,7 +1554,6 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_enum_input = uvc_ioctl_enum_input,
 	.vidioc_g_input = uvc_ioctl_g_input,
 	.vidioc_s_input = uvc_ioctl_s_input,
-	.vidioc_queryctrl = uvc_ioctl_queryctrl,
 	.vidioc_query_ext_ctrl = uvc_ioctl_query_ext_ctrl,
 	.vidioc_g_ext_ctrls = uvc_ioctl_g_ext_ctrls,
 	.vidioc_s_ext_ctrls = uvc_ioctl_s_ext_ctrls,

-- 
2.47.0.338.g60cca15819-goog


