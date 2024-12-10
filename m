Return-Path: <linux-media+bounces-22990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 772D49EAC08
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5B4028CB7A
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960AC3DABF9;
	Tue, 10 Dec 2024 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oFjv7dbs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A08D78F27
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822937; cv=none; b=eJjiysrqc4mOpwpPEi/s8PUIQu1CkJRNkfcBTIqNTlXtdqYWscYZcruAlN/kHgoT8KG0v/YdLJAtANe16as3Njng+l2XuRP2Fg52zjAlwebtIouGt6Sps0Q5ebnBDu5uScJBxN3/V2LgZtfRIA6KChJEAJt5OGAts9iZz06pmAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822937; c=relaxed/simple;
	bh=QTPQ1DyM59FTFwoOCCInfTij+St4lWshfJMO2MNF9Jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EpkaQkCqsxzhNUbqHQDnUYBRaRjn6Qgte9uCcO87DkrFWdDZWJVBXJF74wcnhF70VQX1Qt3qGWWEWeS9S9NmODgp8RhPathRZy5q9O/ktNozWzBA6z1X6aXxYE60Q96lj8oKQ8xeCOkiHTkXEGY+zx7gVSVGYpcuWhmuXFquRIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oFjv7dbs; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4676859b911so13632131cf.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822934; x=1734427734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldrzuJki4Bob493jggNorXy/00Sxo1CNpTeJmfaThng=;
        b=oFjv7dbs4fTghKaTgXmydmb0q2pp6SL3AQf5k0vgT4+t9iFQxKwg3BNZ1yZn/SPTsR
         Rhjj+aY69aiclQQEFg8pqNYc1L+yyPB65sq8b4ABJ9LDjjsMgxhxUudgaSUdJWpSSzRM
         wktubWoFYBaOMz5fMgo1+xtSLTMUS6WZaYKLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822934; x=1734427734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldrzuJki4Bob493jggNorXy/00Sxo1CNpTeJmfaThng=;
        b=V4K9l1vtfPvzVy2PiwbrVOQlqzUK1/Kcw5Kweam7FkvXJzY2qU/x1nmaRjw6FV/jQY
         GrchkCknxvDikeq06ZApqJtK6oA5CkZ8F/aZ1D+Ve9YM2tWdmCkBYgxIZ+fbYpBE+myK
         kLXssafDyRGWGrmYxKkqyhaq5QK0JM7iNn100xkRhUWAJl1K7dneSbVXI9msk9480W6a
         TgcKwSwbTUsQUnDIYpsarCJ2CAz7LLrnU3Czdn2pFqtrISK4iFa0qFnlcJxgZTz32ONL
         7X9lXBlNa2WRShABRkj2vsoePmSB2II+ghFWHFvdjcTtYdiJ6bLsAQteul936ICrEnG7
         0kfw==
X-Gm-Message-State: AOJu0YyX5D1ATnttU/cBXb0OpeaH/+RM5yspB01RkFTDi82XbYugoGgW
	WcanVPNciT8+YluwZi5HOBnOAef/0lV46su6N61C3TouumQtC3WVsQuUzRrv8Q==
X-Gm-Gg: ASbGncvloCcWbZ66r5HaDmZ/vnrEB8pFkZizzzQAjLpCqOX/HsRFSMxQADkbGzPyJAX
	UYu75o1YBcOUMcTh9ME3WhaRUiK+npWUNGMl1Yjwyd7Ux2WXYY8SVXnQNJf0syiFd01eo4xwXBn
	PgwjOQKyFyNmOQ29lElVIweEu/N6QbHa8IoeAIu+HIhZGIsII0l56nK9/pk78GJd+adjrxIuB46
	FrQCXmAzgLZrneYJBtr9zvj9mxIvRoR7AKIDKXNuZUuJrRX6k8QeSdM11Yjnh0CAAQBopTRoa5J
	YRiDLGVNk6XGCRwoVBNeGzYi/Jfw
X-Google-Smtp-Source: AGHT+IGAAxP3Bb8dp8EUNxps8UjQFg2XrkM8eTt6qptwkb9cgt4CUX5Y2k7W1aHCNPf6K0Nheydqdg==
X-Received: by 2002:a05:622a:118d:b0:467:6092:8414 with SMTP id d75a77b69052e-4676092879amr124695261cf.0.1733822934276;
        Tue, 10 Dec 2024 01:28:54 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:53 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:47 +0000
Subject: [PATCH v2 03/11] media: pvrusb2: Remove g/s_ctrl callbacks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-3-c0a33d69f416@chromium.org>
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
In-Reply-To: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
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

The ioctl helpers can emulate g/s_ctrl with g/s_ext_ctrl. Simplify the
code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 7c8be6a0cf7c..ad38e1240541 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -574,31 +574,6 @@ static int pvr2_querymenu(struct file *file, void *priv, struct v4l2_querymenu *
 	return ret;
 }
 
-static int pvr2_g_ctrl(struct file *file, void *priv, struct v4l2_control *vc)
-{
-	struct pvr2_v4l2_fh *fh = file->private_data;
-	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
-	int val = 0;
-	int ret;
-
-	ret = pvr2_ctrl_get_value(pvr2_hdw_get_ctrl_v4l(hdw, vc->id),
-			&val);
-	vc->value = val;
-	return ret;
-}
-
-static int pvr2_s_ctrl(struct file *file, void *priv, struct v4l2_control *vc)
-{
-	struct pvr2_v4l2_fh *fh = file->private_data;
-	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
-	int ret;
-
-	ret = pvr2_ctrl_set_value(pvr2_hdw_get_ctrl_v4l(hdw, vc->id),
-			vc->value);
-	pvr2_hdw_commit_ctl(hdw);
-	return ret;
-}
-
 static int pvr2_g_ext_ctrls(struct file *file, void *priv,
 					struct v4l2_ext_controls *ctls)
 {
@@ -817,8 +792,6 @@ static const struct v4l2_ioctl_ops pvr2_ioctl_ops = {
 	.vidioc_streamoff		    = pvr2_streamoff,
 	.vidioc_query_ext_ctrl		    = pvr2_query_ext_ctrl,
 	.vidioc_querymenu		    = pvr2_querymenu,
-	.vidioc_g_ctrl			    = pvr2_g_ctrl,
-	.vidioc_s_ctrl			    = pvr2_s_ctrl,
 	.vidioc_g_ext_ctrls		    = pvr2_g_ext_ctrls,
 	.vidioc_s_ext_ctrls		    = pvr2_s_ext_ctrls,
 	.vidioc_try_ext_ctrls		    = pvr2_try_ext_ctrls,

-- 
2.47.0.338.g60cca15819-goog


