Return-Path: <linux-media+bounces-1002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8C57F88DC
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 08:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C85F2281810
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 07:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9509C79C4;
	Sat, 25 Nov 2023 07:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/0jWPiI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2402510F4;
	Fri, 24 Nov 2023 23:38:09 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6c4eb5fda3cso2505110b3a.2;
        Fri, 24 Nov 2023 23:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700897888; x=1701502688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4JkLSQxu72A0kXiJvpqBGPzheBm60khT4FXTWA7Mes=;
        b=m/0jWPiIiT1caqQE0pv/LeDSjzItgUW8EabCfZtGmdAU5XVIxti09bihW+oJ5lNqla
         sPbXXXShVPWouzXy/wieZi4r6vq9Xum9OLekOcky4eaPaHRzySJu2lcDxRQ09C/CgIOQ
         NDU3741oDlMbXQkKNDISOVUlSOD2YqoLwR8SOyYxIz2gI9u9gvy+cmWo2M227YoZrKqn
         kcgEQDzWX6bGnsBmg+fec8kLSwImNLi4pGqeJEiCcsUCT42GQqq4xzbR1wVgFnSn/1HN
         30iA+RjRQMk3e8qEYd6KNEKcG1rB86NJ1hVA7ryDHtPPLzvUpqpQJ4i7w79hphkNnh/D
         fXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700897888; x=1701502688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4JkLSQxu72A0kXiJvpqBGPzheBm60khT4FXTWA7Mes=;
        b=NmvWLNBW+RwEIrqVG5WbJUwhWfIxHYsW7i4AAkMnMP67+lrF7k5jo/uu4gAQoG4YP0
         n2paUCnDESe6xDA/OrOWus6Hrcc6EEIb0dP0La0/wv+4xUz7OfV5rHUbMlPb19PAQWU6
         A09aFi4JwpumJRyy31LKXpc4FXNksp91GyYZeXtmgYYvZPzYBrxepw665/71MjoMtiZH
         7hftnfhBPt5KHVXOEzvydj/BtdoNxIV+eKVfum1C6qS96pj40wuslksQwIj3vPkPfkcQ
         tkQVVddhjg+Ufy9e+bMuLzhQ7fJsG1KclIwCYj8+t4ijuycRnvGleIWG/qiCUCqk02id
         M3tQ==
X-Gm-Message-State: AOJu0YyUdT0Wg4d2ShxJ2yI7G/jiIF4qo5D1nzcIgSEwZOsCSegqrZdY
	C/c3J/OVZvl+i6uEfXHls68=
X-Google-Smtp-Source: AGHT+IGDI1LFtz9dBYBNDPR5osoWC6EhBp6lcBl4dvBLfPB5E8nzXe7WawYfRjW/cy3U92EQ1xa+oA==
X-Received: by 2002:a05:6a00:e0f:b0:6cb:d2cb:5234 with SMTP id bq15-20020a056a000e0f00b006cbd2cb5234mr6181755pfb.32.1700897888435;
        Fri, 24 Nov 2023 23:38:08 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:716a:b035:3f6f:ef07:d897:b98e])
        by smtp.gmail.com with ESMTPSA id j7-20020a62e907000000b0069323619f69sm3911981pfh.143.2023.11.24.23.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 23:38:08 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org
Cc: Ghanshyam Agrawal <ghanshyam1898@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Phillip Potter <phil@philpotter.co.uk>
Subject: [PATCH V3] media: stk1160: Fixed high volume of stk1160_dbg messages
Date: Sat, 25 Nov 2023 13:07:38 +0530
Message-Id: <20231125073738.649948-1-ghanshyam1898@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function stk1160_dbg gets called too many times, which causes
the output to get flooded with messages. Since stk1160_dbg uses
printk, it is now replaced with printk_ratelimited directly.

Suggested-by: Phillip Potter <phil@philpotter.co.uk>
Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
V3:
Fixed the issue with my patch needing previous versions being applied
first.

Used printk_ratelimited instead of dev_warn_ratelimited because
of compiler error "incompatible pointer type".

V2:
To add KERN_WARNING in printk_ratelimited, and later as per warning by
the checkpatch script, replaced  printk_ratelimited with 
dev_warn_ratelimited.

V1:
The function stk1160_dbg gets called too many times, which causes
the output to get flooded with messages. Since stk1160_dbg uses
printk, it is now replaced with dev_warn_ratelimited.

 drivers/media/usb/stk1160/stk1160-video.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 4e966f6bf608..98417fa31d70 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -107,8 +107,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 
 	/*
 	 * TODO: These stk1160_dbg are very spammy!
-	 * We should 1) check why we are getting them
-	 * and 2) add ratelimit.
+	 * We should check why we are getting them.
 	 *
 	 * UPDATE: One of the reasons (the only one?) for getting these
 	 * is incorrect standard (mismatch between expected and configured).
@@ -151,7 +150,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 
 	/* Let the bug hunt begin! sanity checks! */
 	if (lencopy < 0) {
-		stk1160_dbg("copy skipped: negative lencopy\n");
+		printk_ratelimited(KERN_WARNING "copy skipped: negative lencopy\n");
 		return;
 	}
 
-- 
2.25.1


