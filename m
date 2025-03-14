Return-Path: <linux-media+bounces-28211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D6DA61181
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 13:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8408319C2A22
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 12:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695EC1FF1B5;
	Fri, 14 Mar 2025 12:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fa8iduWn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499811FDA89
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741955878; cv=none; b=Gq8J2qG8Ru2+vJD+AIiKOefEBtmkutOy9hLCpouu6viS66amuqaeVt9k1cKrhhzihFBcXfvgO/KQ+tF3/qnJagIRKVLRPZq527UJgOq2zHSB2MV6+KFEaV8aXbi/YWbLXYpVPiqePjhGXl3TtsjRtF0iJPXiP8f/dEgCQep39n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741955878; c=relaxed/simple;
	bh=qIm+gMdvupKqwS9Xu6DPAYAhkyp9bxQv0TScmBCRWAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvngP1/viqe1LnRS6koxsqgg4vA4WkyfaIltMoKIyoFnD4no1P9XYXBjRH74vvZ5SsR9Pcu6itpWrb0VWvUyLyHNdgsd7GrmQkE93Ya4hVztzv2oGgBHR5vL8mB36LH1zrBtiI7omFQmp/JhrtJwp+uOUBA1XoTsoVOxKpLthRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fa8iduWn; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso18353016d6.1
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741955876; x=1742560676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Au/TjH3+zjUdDPhRJAjj0/vsDAjgHCF7V+hbXHtsO9U=;
        b=fa8iduWndcsK9L7/pmbrHFddq+M2vwWCH13NcPwywJnpfUGxW+Us8VutCZ+kkF4U1X
         WGlx0/31lK9yihFLuqPEBgPMB8C0ev1T45ANHHaEvPg3I554zttVC81M4wZMml4ByNcE
         tJKc6/W9bwzIdqFyZ4/RAIaKs3prEYJROZlu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741955876; x=1742560676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Au/TjH3+zjUdDPhRJAjj0/vsDAjgHCF7V+hbXHtsO9U=;
        b=s+NgDclQQT6ca6Q4IblIy2kH/0ugYJDeap3ZYv4Tfxm2okohyvLNFuyQD/X2lG+UpU
         vmzCWJEZLwEl1nl2nRrI69DyfE9PVmW/HzjRrjG8ueccBJaYxkAdFBPlIKu0wKWiY0yp
         rIXJAhbahvmywVoemZRQ+irYcwKwrPIXLd4GnJJ7WXJp3YgoO2V+eGn7P4/QUEf46HC3
         u5g55Viu6cee6y5Hm6BsBBCX+CZ2+2YQQZH1+7pvUZtKtMGDXika3errRu9dWq6Pa9T9
         UVSjxlD7OzW5g3rfs/Xy9Yt24vqWy2RKMhW8rTbsu56uwkRxthTr5SERufEi5unhC7RW
         SuAw==
X-Forwarded-Encrypted: i=1; AJvYcCWk+RKl1PvfZ5DFVHxaZQKWG+4Oy6vbBSizFAb6wd9C8mvu+KPQ/2YQAUkubL6dPHJr1i07lgKW9kPHrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLmW6V8DS3G4/QMiYm6YjVXH39rqmQdsS9lNWfMAh4H0UXX8yj
	bM1lfbQ9Dkjv8j/THOY33rHC2BpGX2AsFSOSrwzTPFgIxcKtsbA6K/GCa1dzOq7qogm/dkfY7cO
	Iow==
X-Gm-Gg: ASbGnctZ5SBkGICFKPh3BqNNXHoXQN/jhXRJpLvIdrZQQ17KmxwkD+R6TJDjY6z7t/o
	uAIMV5i32IrWiVUJKJ3svpBBP66ZFjT/vVp6i0B2sHHT+E7FetlegyIIPuZ5B+LnJeH7NtnH7CM
	tXg0HgGYMaR3iyj5JYxcUrvewHRkcbC2Nn8/QD9RD/IZzvH2TbsTAMYXYZWEpIQk7OfNzIruVV4
	hoOOMNifm6KjcgNttlS/BL38XFA/gFOICYc/Y593D6SLfwKIUGWuqMlyx4LgHhf3KfBjyFYOyr0
	X3sHAypwGcXEz7L1Fv0eXeCNmlWq5wIY2HnD6YCqKvoZFU+aUNv4o1xUUuGz6DCpuvsajGZmXBF
	R4Re80ADg26Hd/yBi0LieNQ==
X-Google-Smtp-Source: AGHT+IG1soI/f8SA1zxak+RF/DcH11J2/WsE7iepmItBe5lAxghxQPzlLhQXGTbEnZnAJSzvs34p/Q==
X-Received: by 2002:a05:6214:2483:b0:6e8:eabf:fd55 with SMTP id 6a1803df08f44-6eaeaae0998mr29795736d6.39.1741955875895;
        Fri, 14 Mar 2025 05:37:55 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade24dda0sm23168706d6.58.2025.03.14.05.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 05:37:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 14 Mar 2025 12:37:51 +0000
Subject: [PATCH 1/2] media: vivid: Fix requirement about webcam_intervals
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-vivid-fix-twice-v1-1-7463c2b0ba63@chromium.org>
References: <20250314-vivid-fix-twice-v1-0-7463c2b0ba63@chromium.org>
In-Reply-To: <20250314-vivid-fix-twice-v1-0-7463c2b0ba63@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hidenori Kobayashi <hidenorik@chromium.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Since commit f0b4a2c037c0 ("media: vivid: Extend FPS rates offered by
simulated webcam") we do not require twice as many intervals as sizes. In
fact, now we have 13 intervals and 6 sizes.

Fix the comment.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index b166d90177c641eed8116e791daeec8822973ff0..623ba1e5e54791c0ac62aa2f0fcc3dcd444c873a 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -33,8 +33,7 @@ static const struct v4l2_frmsize_discrete webcam_sizes[] = {
 };
 
 /*
- * Intervals must be in increasing order and there must be twice as many
- * elements in this array as there are in webcam_sizes.
+ * Intervals must be in increasing order.
  */
 static const struct v4l2_fract webcam_intervals[] = {
 	{  1, 1 },

-- 
2.49.0.rc1.451.g8f38331e32-goog


