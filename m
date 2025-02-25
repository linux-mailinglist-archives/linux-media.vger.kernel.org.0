Return-Path: <linux-media+bounces-26950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A503A43FDF
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 14:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E53457AA9EF
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 12:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43B7268FEE;
	Tue, 25 Feb 2025 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BG8uNxup"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7C2676DA;
	Tue, 25 Feb 2025 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488410; cv=none; b=BBXlw1nKKODWcO+ZWgM6J5rKk88iCzno7SPZ5M51R2jqOdsC1XKvtZ/2LJSRiVuNuuGQhrePrFUqxluqbSYWJOx6NOvu1eCOyyBgDDMB25ST8kaIhaD5qlUTVGlkNfnb4NMqkXMgEJD5LKscdyJZYR3Y8BDdilJT+Xm8b/UkVHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488410; c=relaxed/simple;
	bh=bvMpoQhDog3/J1ZwGwsnib37zReYIuMapBWpIzR68DI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dzBXURPRddVrt85qdV3Fe3YsmbpwiQlWkDDlVtCaFRv5YrfmhLMvn+F9e2s0QN5SovU8Jj1CMrwU+0OGYk91I5boDpI8ZeQdUh5lUPcG5tH40jBoec/zJueYKwumRBBKQDDKG32/biJTOIqQeuxETUEKuBwTnbOH7LlfbEqoLs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BG8uNxup; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f5fc33602so3176903f8f.0;
        Tue, 25 Feb 2025 05:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740488407; x=1741093207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mL9gUXt1ZdkJEy9Fw6Q/1gDLR1RV1GDWUbxOHo/kh70=;
        b=BG8uNxups75D2Gp9gygRn9+E81QAezBoE65Qll5ba9eeIQ5wHtIGTsB4plO8p7tvFP
         eMGobO/G++56Gw5+5YV7iXvjD8jtP/MXK6yZ7tHxII7zfCsYhS+dVt6E/xwEOEl+g/tt
         hiiFQoeL3K5uQswKfOH+zo0KF6QqRkGt+Pi0fjNeVbz+ARZKSawvQ6UFrJfRxfp2bdC4
         sOfZDKB8jyGWTnvytL2NAs5RSi8YQ4HjAVqXVbzcMwfL5NrIpZ7bY3RPXNrKzJzuInkx
         j8Ca664Jw5TdhGeErZ/7JbiDjSdOPZbgz6evf1231mLGa+lRQKi95xZ3hwAt2boJHIEu
         kZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740488407; x=1741093207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mL9gUXt1ZdkJEy9Fw6Q/1gDLR1RV1GDWUbxOHo/kh70=;
        b=wlclq+nCa8PTWi21y3OFlhC/Y8J+gPO9U0lygUNQ0l/0ZNEKc3cZ65qA2Ul3Pcu1Dv
         rUneXN30UvgRf5sxA2rp84MV4Zbe0Y/r8O+Oro0KD5k1cIVCsO7Kb86WT1PuN8Kd4BR5
         r8bQdANUNQclpzWtuib7laNrorsWxwG5Um/0fqgihVkVUi3x8gRQuyAOhcM6VWpM+o0A
         3zTTsmxzRby8XjKZL+CTWw1BIEO8FsoHH0noG0eKdZbKn+8+B0oW68MAztVgvNXWFegX
         GJcY6QtkXj6w41fnZnPXcrSQl6k3F2Sht7vhhPI/5Lh+4w+Sn7sGSQTPZjCNp73CeIkv
         VHJg==
X-Forwarded-Encrypted: i=1; AJvYcCWZHJBln6tM9o9KkhUFO8NkDRrkBUU0fG+1DarPL1NHh/T5OeDF7T6/AZZOZ7xlgmKdKlejjS5UoG9pw+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPWw+HwA3lruE1CssRGkLJ3TSVCUVUizZ7E2wCGfIF132xx27x
	bt+BeRtY+ofTXevSkJgGScMeJrD0Ddj/b/PyOQ2ZgTsTXMnMtHQwIytGo9/8
X-Gm-Gg: ASbGncsQXIbWEkIL9/NMcBJNdxa7vRIuYswthwau7sxOKkvgW+7POKJPRnSMUEvX6nA
	WAl0/DcD1OS2LqUVwxGSnwRj8yAW5adV5jt9C5E2KyMOhXoayOfqZJrwvrj2ranQSMSoK8e1oEA
	rnqW8ku9YP83qkWnVBWIPDU2OkENatFtgXqbdHHazZH2RDQDBb7gIMG2N3tYyRz82a1eZ2JR/C3
	xmzEqItVysBMczTuW0jb+T2cpe8hdPTvMTe5XkNeq8zN+M1r4znOcsTNXptLHoaPvhZI+JMcjfv
	zbCD7aYKSs6O7eOmeO0sYafkAKE1vBYPvfCngbE=
X-Google-Smtp-Source: AGHT+IGOQtdn0FjBSqnsv1taRF7VQLWRqAxKS2YZHeDb+Wnh6ZnELJGTdawhV5WhDMT+jiIHe6ogRg==
X-Received: by 2002:a05:6000:401e:b0:38d:d414:124d with SMTP id ffacd0b85a97d-38f6160faedmr17035240f8f.19.1740488406501;
        Tue, 25 Feb 2025 05:00:06 -0800 (PST)
Received: from localhost.localdomain ([2a02:c7c:6696:8300:7c3b:8f00:8531:eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fb9d8sm2176358f8f.83.2025.02.25.05.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 05:00:06 -0800 (PST)
From: Qasim Ijaz <qasdev00@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: Replace nested min() with single min3()
Date: Tue, 25 Feb 2025 12:59:37 +0000
Message-Id: <20250225125937.20413-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use min3() macro instead of nesting min() to simplify the return
statement.

Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/media/i2c/vgxy61.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
index d77468c8587b..5b0479f3a3c0 100644
--- a/drivers/media/i2c/vgxy61.c
+++ b/drivers/media/i2c/vgxy61.c
@@ -892,8 +892,8 @@ static u32 vgxy61_get_expo_long_max(struct vgxy61_dev *sensor,
 	third_rot_max_expo = (sensor->frame_length / 71) * short_expo_ratio;
 
 	/* Take the minimum from all rules */
-	return min(min(first_rot_max_expo, second_rot_max_expo),
-		   third_rot_max_expo);
+	return min3(first_rot_max_expo, second_rot_max_expo,
+		    third_rot_max_expo);
 }
 
 static int vgxy61_update_exposure(struct vgxy61_dev *sensor, u16 new_expo_long,
-- 
2.39.5


