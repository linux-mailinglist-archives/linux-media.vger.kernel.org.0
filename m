Return-Path: <linux-media+bounces-28212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED92AA61184
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 13:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83FE4176001
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 12:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8373D1FF5F3;
	Fri, 14 Mar 2025 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ct0fMGqj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D79C1FECA5
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741955880; cv=none; b=ZHvu9TPOZ2rdwL/c8cmt+pf397aA9Hj2PkX1YHzMzYFxiZ3pHBV0SIZkXjt/K2yEnsRsUbA4Qpdso4POUJd4OwmliaMUhH95BCEf0GG9XIpeXvFXmGyLNDwR8aQ0ufL4/PKjjES/Lb/DBFMsOlFbq0OC2s8trbkyW1jixzkJe0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741955880; c=relaxed/simple;
	bh=Z4vVBZrwdsora5jaavoKvH4SBMRfW+n+z+2ksvCX0uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IEq69o/4MptraQVuBs1OJRDyDdrS5x5YhIrkw2nxZAGw5rqe23JjbLzU7GpVpAWWi9RLpRRpygeLdKAyktCDcwdBnn4TzyQRintbA1dwnMIP4xfXwdwGTuAcZNXAbK8eRimhtST9luSB74oU+753GfartptmzCo3T4zhEAXLLcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ct0fMGqj; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c0818add57so222857485a.3
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741955876; x=1742560676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Mt1R0EC3FYz66XqhH4MaCDZ6sflbyDD7zxn5LRYO4w=;
        b=Ct0fMGqj0Zq8y6F7+IU1iK0RUohll3LgpOZJf7Cidnyoh+M6nk52fghd+lNBG/dRPA
         XXBj0FYXMtZKcOJBMRKpx4NXtc2xWcJ3DRW9fg37sV7rG9bRnpqFWRvGGyNnOdGOkGWz
         1GXlZ9oBOGwt72dDKU4fD7P0gaNiR0YtC/Unk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741955876; x=1742560676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Mt1R0EC3FYz66XqhH4MaCDZ6sflbyDD7zxn5LRYO4w=;
        b=sdKdUEpuqgpavZQcMBN0qfTZZPnQ7d3wRV5znaXyynaCjmdufzR/GB5j44se1x19ai
         85RvhzV90rR/JeQ4LEQIhZy4QruFfS0vVCja5FgHmGf31No4C8guuP7yf6Fr+E+267T4
         v52gYt7VPrGVgOhOR6gUtu5su+/FYddrOH7IIdU53ocUkGdrDhjyKhmD7DzprnJgsvxy
         6evhekSIYzRbyU05/ARASabDlaoR0EZyoSXxof3SOTkJN2vZQD1vfdYPWDFuYUAbvbi3
         Qt6tqyiOJUWY62cHr8s5HTQk3XXRuSVDsL5wtttyfMm7IY5sc8XRklmZi7VXhR6gaTVw
         Ikgw==
X-Forwarded-Encrypted: i=1; AJvYcCV57b9gNTOH+J2R7qSaWY4Al2ADflhjRxebjolQmSds+5calqzLBMOMUnMMSoSqK/JVRLskR8zMKqi1aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHSY5ARelcIApZR8yUaOy6X78Swk256toRefi2hLZUWQdavWz8
	HfucX3TH0nCpuAQR9o9E1MG9seAuk8yzLBFQMoYO1wWcS8gux9GqOOZ7I/r3XzhJGoL9IC6UggI
	+4g==
X-Gm-Gg: ASbGncsm6APKddnIw1oevS+ci9OU5vKKbxVx9tka5+pA41hix63zXClEPjgHLh/TiPk
	r/DjFWGh4OwztfP6eJpSrbBp5/gQtf95Rwj2V6KW8Fy3iXAlNJTA4+EmUQj2aEjcUddVQ2zaVB9
	dhOJlhDyL0lFJNRvIC6bGDZssAkngxccDE7wkd1ddsqrngHQlwkQAOAb3sEpWjSaTHS0h/tIcH7
	oDA34gA5CyuatRNLn6y7iDRmKjowYzm+cCaPAxzXnLKyYU5bU/MwVD4UG3rvWHtFxcnnnNPMwsu
	smLZb+u3JN+VGIPSAdyxampQpltDLBOQMZdm/u7Jv281yO28GHTDa6Xo0PEnMj7cMxHdGZm0V9A
	hee68F6EVt/6HCBtLuMDF4w==
X-Google-Smtp-Source: AGHT+IGMU11VsoezNLSdINUAsRSlE0CW48Y+kQb7z5VQcOk1VIrvuaXDWSla6So21S8lMPm/2Jii/g==
X-Received: by 2002:a05:6214:300a:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6eaeab5a2bfmr28487096d6.38.1741955876613;
        Fri, 14 Mar 2025 05:37:56 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade24dda0sm23168706d6.58.2025.03.14.05.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 05:37:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 14 Mar 2025 12:37:52 +0000
Subject: [PATCH 2/2] media: vivid: Add more webcam resolutions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-vivid-fix-twice-v1-2-7463c2b0ba63@chromium.org>
References: <20250314-vivid-fix-twice-v1-0-7463c2b0ba63@chromium.org>
In-Reply-To: <20250314-vivid-fix-twice-v1-0-7463c2b0ba63@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hidenori Kobayashi <hidenorik@chromium.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Add 3 more common resolution for webcams. This is required to increase
the test coverage of unit tests based on vivid.

Co-developed-by: Hidenori Kobayashi <hidenorik@chromium.com>
Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 623ba1e5e54791c0ac62aa2f0fcc3dcd444c873a..df726961222be874c39d19e1fb457bd816ab45fd 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -25,9 +25,12 @@
 /* Sizes must be in increasing order */
 static const struct v4l2_frmsize_discrete webcam_sizes[] = {
 	{  320, 180 },
+	{  320, 240 },
 	{  640, 360 },
 	{  640, 480 },
 	{ 1280, 720 },
+	{ 1280, 960 },
+	{ 1600, 1200 },
 	{ 1920, 1080 },
 	{ 3840, 2160 },
 };

-- 
2.49.0.rc1.451.g8f38331e32-goog


