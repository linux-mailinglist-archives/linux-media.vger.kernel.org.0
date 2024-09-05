Return-Path: <linux-media+bounces-17681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8183996D83D
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 14:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0665B2099B
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 12:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1F719D06C;
	Thu,  5 Sep 2024 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZnvTgOP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1628619B5B5;
	Thu,  5 Sep 2024 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538834; cv=none; b=EQ/GJIfPVxve03L+nYvrTfM+ykNtYco58til8V5YxjGKNLADh4rKuRC+ubkqmf6JQL7pD9EkRASbtgXwx18M96XZpT++e4gb/sKmfKowUa1BF0p2gnudRm0530MHs4fGuDlscgzewkqy0GJ4Ipf6hTVJkWqEiYA2rH0pMm0J41Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538834; c=relaxed/simple;
	bh=+nsYc0R/J6yyR47jX7g2XPKCeUlEQKSjend89KgUB6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=feOx1rGIrrsFLjvlTrW0XUP2FCrB9dcLYPb4aBVCRkAkz3ax/okquo+C5fPV6g9fhG5C2PNmpu6qVarC3w/t2ZOHq2rbwEwzKZNMDcq2+PuQILrBaF7N6wH65pQOoobBI3RsNcENlF10xSy/+Uy/mQmNjqruywFkjLlQ8HEOn2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZnvTgOP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42bb81e795bso5555425e9.1;
        Thu, 05 Sep 2024 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725538831; x=1726143631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muIGiLrUCLNi3XW26Hel1v7n5KuyMeK8a3c4x0CXXRQ=;
        b=ZZnvTgOPkAipWViL/9Yao3xHmbs8cdPdcIY120e5Gb9miug7MAx9BfLIbBnuRVQfhy
         PwDyM3WkiFlU2UyC8pIqSMdz7Ee7uNnbk4M8z2QSy2DYcrWXU/EEYozUsAEoBc6CmaRH
         rpmX11moa9LjXU+Cvl6FqYasxRsgOgjX7boeZ0yU1mUpw1bZcsa1qJ0YYVSVC1VG4KHk
         KatDTqYkYX1U11XIDlfKIfvW9jFtC6QyMMEYTQ+HZY3MY6dlE/e3cFJfnpGTwHbR4w0N
         V7m9arWTjseZ7pNmx1xy9qpfkMT0DsO15ndKgagE0WBseMmExlClaOoV6qOrf/XI+W7M
         evAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538831; x=1726143631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muIGiLrUCLNi3XW26Hel1v7n5KuyMeK8a3c4x0CXXRQ=;
        b=TpWu1PBfcOVJXWQip2UaG/t7C/O0K+VdYaJNE6jObEQH1oflUgUhDk3nnOs0KIrfod
         1turEF9in41tQsjDO2T2Bw/1//LsbWm85z41SKikBLwcr+rSD20Yo4ioSLlfXf1V7cf9
         YDjU5gOqSjnA1UKhrQ5drbz56bewEURwlm8Igf9k8hApPSNHbm8f8VXAzU9o8GLxWLjr
         Z4VN8n4T1zr2tP+yUrMFEFfw+ljRrPufi+rdRYADSGFNPD6i8jzEq2s2YXPPCv6X2Wk1
         KCuf23sZ0Qvy+MXFOyC5P3CTxl1Ys70wSMCTNrn9GkSihPf4IjwVO3gBMIny+E8RVAAm
         ma8w==
X-Forwarded-Encrypted: i=1; AJvYcCVN6SEYc3Dytk4iZxHhKAGu1MpYXnOCGOzilNsqTWd74jVE8yLC9doQjYsq1gNUTw+lPRA75LGL1z4Kqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi4NImaSCn+kOYTFAfAiEBkOWjS7r6Wq5dY0eFnwCTdF64MsMB
	Lb5e4Y8PJA3qTKb/fmxkJL8klqWRaoQMzyhY2Kbm4uvKcLCi4Kd0HUbGFo6JGKY=
X-Google-Smtp-Source: AGHT+IFUNNwmBJcIVUJGlxZRgVHpTFyqgVxyN5zVDO6z7/65Xv0+e9sOH/RJr/4ta7TINh11oUJrYA==
X-Received: by 2002:adf:f0ca:0:b0:374:c847:86d with SMTP id ffacd0b85a97d-374c8470b7cmr8954394f8f.16.1725538830953;
        Thu, 05 Sep 2024 05:20:30 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27364sm230390515e9.34.2024.09.05.05.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:20:29 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 04/18] media: vivid: Include <linux/prandom.h> in vivid-vid-cap.c
Date: Thu,  5 Sep 2024 14:17:12 +0200
Message-ID: <20240905122020.872466-5-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905122020.872466-1-ubizjak@gmail.com>
References: <20240905122020.872466-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usage of pseudo-random functions requires inclusion of
<linux/prandom.h> header.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 69620e0a35a0..184460eb356e 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -10,6 +10,7 @@
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
 #include <linux/videodev2.h>
+#include <linux/prandom.h>
 #include <linux/v4l2-dv-timings.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
-- 
2.46.0


