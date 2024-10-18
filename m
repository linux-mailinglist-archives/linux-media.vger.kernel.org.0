Return-Path: <linux-media+bounces-19896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BA19A4281
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 435F41F22358
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D6B203710;
	Fri, 18 Oct 2024 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpU7S21h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E02202F9B;
	Fri, 18 Oct 2024 15:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265583; cv=none; b=Ws5xjVJMGQkcU4vk7LYDPsOh7xofd2sRM8yqchDkHtnLNLTf4/XG+N5Bx0wp7mSUrRlMnNj5QaElBWi0FY77K29xH+ax/jBtgBfPY0h9glAKpMf9jfK7CzkSqtCPFj74xE349h9EUOzfN5yC+Pgsm8ra9MN9Ov+KzEkeitlzIMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265583; c=relaxed/simple;
	bh=Qzfskx5gE7hzVdFOg7gkGXwsIqdeGFGWFDkYKGj8+bM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRMuaCda/SRQ1kIhqE/G/Bei1aCpULt6S6pNlcWCaF30rsmqdolgC4a3PN1SkUAwYWURpEz7niq5+wIZGmyQ1IuHQ3a3HvCNpEGEF+UezevVnyndpQPQ6K94vani5gSNqldMgMzFBTQkDHHGloFQ9FSUfLimXy95c4CR+m71cAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpU7S21h; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso17726195e9.0;
        Fri, 18 Oct 2024 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729265579; x=1729870379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UtHV/xK8nj8ytm5nFFtcG2OydlBSaXmemfkd63xN5E=;
        b=HpU7S21hNOEWHC93sfWQp9Iz7dnlzllA5LJ1YRyreCJtG+dldPw73x6oEyWBfUuyJ/
         mDpBZ8E44TdRQ+QQ5nBsnib3JK1VdLKGYc7+yvt4DjoAfD48SUmhsnt744HHjztpNp6B
         mJiULxIUDvDir4awtJKsmGFrboSKLUAhwoJ8PZ2/4xT+6L8YNaKe1PeBOw8Wi/3xFwQR
         NCEijC2oJBNSVI5p+TwvYYcAwZApTZHfmHW+peA4lxRfmEPbTEtB0GWxv9Gl5zrDd76J
         bI6JqeqNoq+uw2BNnLgAWZbAbWCFdWopZFfZ5DY3uIF5ahgYXTtVWOWfyKcU0J9m89tG
         tyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265579; x=1729870379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UtHV/xK8nj8ytm5nFFtcG2OydlBSaXmemfkd63xN5E=;
        b=BdjinPriyqZp6UVZX/dQb6rEL1X6yexz2JesB5Y+qknmF1YKuI4cdehgO0LctiD7eQ
         MtSM6HbBZDA7joC8+Plw9lipQDIMXxb//ExfVxn93O6aZd6oSADW85PbhK7+GrJX30iV
         9jonYECUg0RklQJ7MIim8R2DF1FYTuFZ7H3pfULI+iheFWtk1qrQ71oj4UTotFiFhfq1
         PXSRERmHng56K/6E6H0vwmM1fBBJwYroTMOxMgal59iT0jJ4ByEDZB2qat9XIdFycZd0
         fOtP6S0Keu/sAwZUyyT+Gsk1tsTUpnlHDsv1Iq9vqyRsVHYIT+FrPof350M/20Xt+1un
         o2Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWUE4ROdxGp2sIAE8NeeuUnkNPE3eswXmo0YxETolc3otDLr5c6uDaa5erTPgB7W0P9/IR13KS8UZhHHMQ=@vger.kernel.org, AJvYcCWqaiQeemNIijrFVplQhDwCxD8ZznAFh6jIm2M8JIU64nP4msApE0M3Boj1bbwHLn+z/FoNm+pOUhaoXW38Jw1Yxe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqmwOiRpUz07erFyFOsF1Cpscmce+Lew3vXDrgMFwxzJIhHW8M
	3er2QdaONQGP/Kfevaq07YqJHpXKPrHsWw+B+GNdOWLoy6NsI96T
X-Google-Smtp-Source: AGHT+IHzDKACfjSDXU0ue20G2sWjxfqtc1GnOEY606w/q9YMkOFokKT890dyrDT3H11QGCfJQjYvgg==
X-Received: by 2002:a05:600c:1c0a:b0:42f:7ed4:4c26 with SMTP id 5b1f17b1804b1-431616373ffmr21501365e9.12.1729265578739;
        Fri, 18 Oct 2024 08:32:58 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067e7b9sm30615595e9.6.2024.10.18.08.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:32:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 05/10] media: i2c: ov5645: Drop `power_lock` mutex
Date: Fri, 18 Oct 2024 16:32:25 +0100
Message-ID: <20241018153230.235647-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the `power_lock` mutex used during control applications, as it is
only utilized in the .s_ctrl() function. Since the control framework
already serializes calls to this function, the mutex is unnecessary.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov5645.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 1f2800b3d005..a7d380692673 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -106,8 +106,6 @@ struct ov5645 {
 	u8 timing_tc_reg20;
 	u8 timing_tc_reg21;
 
-	struct mutex power_lock; /* lock to protect power state */
-
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *rst_gpio;
 };
@@ -782,11 +780,8 @@ static int ov5645_s_ctrl(struct v4l2_ctrl *ctrl)
 					     struct ov5645, ctrls);
 	int ret;
 
-	mutex_lock(&ov5645->power_lock);
-	if (!pm_runtime_get_if_in_use(ov5645->dev)) {
-		mutex_unlock(&ov5645->power_lock);
+	if (!pm_runtime_get_if_in_use(ov5645->dev))
 		return 0;
-	}
 
 	switch (ctrl->id) {
 	case V4L2_CID_SATURATION:
@@ -817,7 +812,6 @@ static int ov5645_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	pm_runtime_mark_last_busy(ov5645->dev);
 	pm_runtime_put_autosuspend(ov5645->dev);
-	mutex_unlock(&ov5645->power_lock);
 
 	return ret;
 }
@@ -1133,8 +1127,6 @@ static int ov5645_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov5645->rst_gpio),
 				     "cannot get reset gpio\n");
 
-	mutex_init(&ov5645->power_lock);
-
 	v4l2_ctrl_handler_init(&ov5645->ctrls, 9);
 	v4l2_ctrl_new_std(&ov5645->ctrls, &ov5645_ctrl_ops,
 			  V4L2_CID_SATURATION, -4, 4, 1, 0);
@@ -1258,7 +1250,6 @@ static int ov5645_probe(struct i2c_client *client)
 	media_entity_cleanup(&ov5645->sd.entity);
 free_ctrl:
 	v4l2_ctrl_handler_free(&ov5645->ctrls);
-	mutex_destroy(&ov5645->power_lock);
 
 	return ret;
 }
@@ -1275,7 +1266,6 @@ static void ov5645_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(ov5645->dev))
 		ov5645_set_power_off(ov5645->dev);
 	pm_runtime_set_suspended(ov5645->dev);
-	mutex_destroy(&ov5645->power_lock);
 }
 
 static const struct i2c_device_id ov5645_id[] = {
-- 
2.43.0


