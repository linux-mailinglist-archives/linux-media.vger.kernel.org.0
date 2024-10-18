Return-Path: <linux-media+bounces-19860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 600889A3F45
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D8A31C24851
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EB31F4265;
	Fri, 18 Oct 2024 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zVRx0C3F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D926D1DB929
	for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 13:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729257240; cv=none; b=Hnnjp/c6VfN4ypEwG+12GoDNz1IMEqvBu/2LmCR7PnstQZ57/W257ZN6o9ryG/IJG0w6cfoDXKUBerGqqRzaMQLQ5uCnH9E25k8sIGiIKJ398hsi9RapSY6pGMWlfTmSmdox1cBoAOzGYkYrbUyW5vhlhpwmRf+tkEs64F2PtP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729257240; c=relaxed/simple;
	bh=NB45991K7Ms9jsA44c2xcFQtcsIBGFYUerUIzKgBLM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BBC1ZQtmkFZdhftw0mnzG4Ajyu2YvIeczQiC74LGRkZ92t1OnfaAH4bHnlVlKcbVzlCEg0+HSdvnIoMPYhVCf3gfRp61714cBbBg4KHsTqJ5JAK7sXTJ2AqJUCMwytUyW3TkpuLzcYPGFkjclxhm/GDXw5EfVNZJoIJQfs6IFpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zVRx0C3F; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso16148265e9.0
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 06:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729257236; x=1729862036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AlSYa9vfuktlSXtZvjf22SWyJ4rTX6wmBTHW3NREoxk=;
        b=zVRx0C3F8tCLSYy8ij8USM10shDdXUAsnULoVjQS+enFt9d0jgQR6DEbGtmDw4Cw5P
         o7BQxPFLTSNcZzCtzjriflyNe+Jg4Lu3mmAysjhj+esgXnJyjwN34helUBoGRk29YLk2
         4L+OE+RJ3WyUvoHQpIPTbHRBSF/QH0jKhQE+9yZeOO8KsdkhrEfVda6ZAoOnjFxgR5rb
         gStqFdQLRR6E0QoZsqeCOIgGAAebTzdhPtaK/a8z4lJEKps6dQzlfzz7QvwkgAtn2Vn0
         1pdCSC0N1xi14BO/r44r6nBwg5xeRTON8a/Opr6LhgDbaamWCadic/+GN7rVZrsvTwsd
         yeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729257236; x=1729862036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlSYa9vfuktlSXtZvjf22SWyJ4rTX6wmBTHW3NREoxk=;
        b=edr4ApQ38qCGfJVduH1hDAW6qWDlTUebvIQFo7hI0efE5XMmd+tUOj7LKQcNlOH0ys
         lHV+RqbCSDHJ+RBvVjXq2mUYQzrWCFgYkeUZY3JoPI932xfzITiFY/kDycrcC7BLJo6O
         TUkCQ+nnmRY0/W+rJXqZX5OqD4xTplD1Tu23DuMxODvY7VhP+CtxgfUmlMgcY1KZBITN
         1twkonfIIhZ1GbxtD6ACvOJIKgizzlBVeho8VS0b1zCMbVPj4JtqBKRzCWoWMC91x6CZ
         yBogVfnnR3qhabYAFHjbLHArCCvomewxKcJfsEvaMEXZm7sMHifK4XcJFwKZqZjj8+5S
         2lpw==
X-Gm-Message-State: AOJu0YxbqfNgKLC37iw2E82npKWIZdcAwzsP8sKnHO1vsBYkxjx9LZCV
	pK6lSxXhzo39KheIosI3/hqi2hviKLC+YDfSRRa2fCrshQ2dbSdn8XFeJPp78O0=
X-Google-Smtp-Source: AGHT+IFtrLhtA4RdfGFjondj6Bc9qeEUws8zUg4yiVAIXWGgN6H2GsWFhKhx0HqWC/5WiPZ+dm1LxA==
X-Received: by 2002:adf:e791:0:b0:37d:5299:c406 with SMTP id ffacd0b85a97d-37eb4769230mr1778709f8f.38.1729257235956;
        Fri, 18 Oct 2024 06:13:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:45a3:93e:5196:d8ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf114a26sm1897561f8f.90.2024.10.18.06.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:13:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] media: v4l2-core: constify the class struct
Date: Fri, 18 Oct 2024 15:13:51 +0200
Message-ID: <20241018131351.70563-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All functions that take the class address as argument expect a const
pointer so we can make the video class constant.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index dbd6fba93179..5bcaeeba4d09 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -229,7 +229,7 @@ static void v4l2_device_release(struct device *cd)
 		v4l2_device_put(v4l2_dev);
 }
 
-static struct class video_class = {
+static const struct class video_class = {
 	.name = VIDEO_NAME,
 	.dev_groups = video_device_groups,
 };
-- 
2.43.0


