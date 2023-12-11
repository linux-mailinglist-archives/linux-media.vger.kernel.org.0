Return-Path: <linux-media+bounces-2119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D172A80D47A
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 18:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A152B21527
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 17:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929A94EB57;
	Mon, 11 Dec 2023 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hShG54bi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD19793;
	Mon, 11 Dec 2023 09:50:46 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50bf69afa99so6052929e87.3;
        Mon, 11 Dec 2023 09:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702317044; x=1702921844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVL1A/XuQPswwKjRrHcQ3Q+mQNKL8W1neWWaIk0mGMo=;
        b=hShG54bigAXEIv7Qbg2NHieK/LptHaQj8iXPKw2ocIY0kY/OBsIWqHrHBzmLsHg4gd
         NkyLrxpJ54CsJr0MLtzZy3tFJXlOuBJ6bx032Do6iuV9yyZh0zSh79QIUwMhFQ/Jy+AI
         uSpFC6hrYoF9fhNaGokKovO15he3hcTD/27esxBxVdJk9p16GFllz5RNLef7uQyUQdzj
         PrMVzXPCtXnxhK2EwxPQhGzYWaWMdDoqLakqcY5QObQ9gLShlTeNNL1rtWC9zqlrwl58
         wJcL1vOuiEzRSmhre9kzXpQ4pEh67u0SeO5OBf3N2V1Lxi6hpHs+2J7sNS5J/dWlUKzJ
         uZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702317044; x=1702921844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVL1A/XuQPswwKjRrHcQ3Q+mQNKL8W1neWWaIk0mGMo=;
        b=B2v098CaDzrLzX2w0Ml1i97cc7+6Gw8JmWKu91MpDPoB7ZDCS8LjtonoJ0J8XoUYbe
         BYwyG+AN488gWHz0ryvORyyhjA19UeA28ArW56UFrL/Eydv1e9I9Dy+2Fvct5v0PkT5q
         82FxyD6coghrnus0itdZ75IgAbgm4zIJgfAKsPzH2pXYFdMLd6HkhMCS2npyybXU/OF1
         c134/4NqSAa3zNBaetR1tZmY1ONtq31VlIyJ8DZgFpaf7hwwvDjt9iHwMKLhWHuhJj9T
         ND+s7tLUw4LDIbqsxuTATBT+p7vqnRXq638qw7gHK7XIr8XR60+/335h5UYjTCYbcXq6
         NqEw==
X-Gm-Message-State: AOJu0Ywg5SsM98QQ78B4BmtTN/dCUF//TPG78A5r8JUWslTPiVgfo68n
	kRXphV0qXKIASDqiJMsR4272yPTUbRo+v9R0
X-Google-Smtp-Source: AGHT+IF4tVmQSQ35mI4v3I2tcKoJpRf6N0w6CjNwhrJYpIBT5hxg8+3fYQOJPj2vwq1zR49a8c7RVw==
X-Received: by 2002:a05:6512:2316:b0:50b:f30b:5499 with SMTP id o22-20020a056512231600b0050bf30b5499mr3065839lfu.80.1702317044420;
        Mon, 11 Dec 2023 09:50:44 -0800 (PST)
Received: from localhost ([83.149.246.185])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b0050d14ce3958sm1077170lfs.81.2023.12.11.09.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 09:50:43 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH 02/19] media: i2c: ov4689: Fix typo in a comment
Date: Mon, 11 Dec 2023 20:50:05 +0300
Message-ID: <20231211175023.1680247-3-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211175023.1680247-1-mike.rudenko@gmail.com>
References: <20231211175023.1680247-1-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling error in a comment.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/media/i2c/ov4689.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index ff5213862974..53dcfc8685d4 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -692,7 +692,7 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
-		/* 4 least significant bits of expsoure are fractional part */
+		/* 4 least significant bits of exposure are fractional part */
 		ret = ov4689_write_reg(ov4689->client, OV4689_REG_EXPOSURE,
 				       OV4689_REG_VALUE_24BIT, ctrl->val << 4);
 		break;
-- 
2.43.0


