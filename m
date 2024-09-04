Return-Path: <linux-media+bounces-17626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE396C939
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5729428A79B
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34AD1885AA;
	Wed,  4 Sep 2024 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AexVnjM7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFE917D8A6;
	Wed,  4 Sep 2024 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484073; cv=none; b=RE6rZswOD86hdcbqDVb0BLShQlObZczkm9vgDWP0O0a3UcSfT8u+uzzh9QbvWf0cbZYtIrGrGWfnA7FaKRnnTr6lpW6XBo5muuKClJXE7evUNb3/s8urJntjSentRelQT772ZKm1DYdvOu0Ndh4GnBkNBFwZYK+O2hIA13tyuUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484073; c=relaxed/simple;
	bh=mAqO79O3l/OvTSDmMNjmx02R4NEoM9pQ3zCM/ZFlJSg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lSADhIXxl3sxr9/O8LzPvma5zgXZi842a3KxZy6aX5SH0UH0bFdbZ6l779Ifckye9uE/u2FPw0xEPevGb7n4V6Y6hkKsBwPgaKBFJBncishnT6uu6FTDc5NpYgYCtMbOxep1vYqJWe5Bi6oGLxeFQ+zqAhvtPPn9CW9j8BfyJYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AexVnjM7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42c79deb7c4so38336085e9.3;
        Wed, 04 Sep 2024 14:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484070; x=1726088870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlCGmlbK8knhiNdPKYD3AWEcb7dTp9/GfV8SpqAQwLI=;
        b=AexVnjM7nCGVVzpwKnIfxSJ/ArLkdGcPc6AHHH0W62d93ITsstbPmDLkWATOwBZydG
         zwG7zw17W3wCcekH+oZrH5qanN3+Dl3F9haVtnISpGwnfAH1vR6esQEfLRN+7li265Xc
         mSSj1SCDbcB4AVdXyXVBePfFkcZZtDim+W+LFBhF+bI47Dzjrw2OZm/rfWz6l+P8zqvj
         ds2Py5/FX+1BUOgkMn3s8qwiZKnscfQHhaqtJg21pqqi1zoktmr+ueSjsFv4JFasbuul
         dk7feEHW1FWrQ9YEy9+sDJyq28iGO9/AaE4ydBj0szCXqLCGHkdx+cTmvpyWCVpLKuLT
         N4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484070; x=1726088870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlCGmlbK8knhiNdPKYD3AWEcb7dTp9/GfV8SpqAQwLI=;
        b=uGY0sFc0mkj67ZgsFCW0vYtz7j4kNvmUmRv0w9Qty1pRr91O2oufWwb5DsPbykh7e8
         9jL1vkKUFwG9IDxIbFK+R8RukCePX/c+XlOhEmvQq2Y2ychJRfiyJNHcnYwL2piyzALV
         8q0zNZRnuTj+cUkkjhOhO2XjSza+9oTomjw+cl9MS+wYWk2YtLN5bI3K3GbSayMMXEgc
         W3/Qg4Oca9QmME5YWEcs5yVyqU0LZVCfU1VbdnL1yTQek/lVITzjMTZZFBtcTiqZXTEi
         nwa6r11RcE4qPMdXwkshHK86Fc+1vAvTdt05FER2Eu7jIBA2MSWV3FlPoUI4gLgy6mdV
         uUdw==
X-Forwarded-Encrypted: i=1; AJvYcCVyZUOnpZyzQfwjRwZO7KEJr9TZAX0l8ilt3V5XdAa7QK1amM2RyBPRaI+XkcKIg4SadmfiRhCNO20EO4gXLHNyEiw=@vger.kernel.org, AJvYcCXMNRVxRiCh1j/+T05F+vcyr25jOPuCTHQf2ic46d954lUp3TEnTfLFa/Px0/XlIf2b5mf/pFYcaLQxeio=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkP+Y/UOKr9uRa+RjNTFmYhccET6Vuvhps5JUw597AaEIpykZL
	Yi3JZmOvRb6AAKWXCGHYTPXFIMfMPbHygopNpxm8FGAu1vHU1kBV
X-Google-Smtp-Source: AGHT+IFnV/SeymYrLZnIp7dDYpEEy8cLjhEhsc8/peer0h3tQKe72voH7q46naIO52wikLgYpiGV1g==
X-Received: by 2002:a05:600c:3511:b0:426:6f1e:ce93 with SMTP id 5b1f17b1804b1-42c7b5f0e91mr93465055e9.33.1725484069973;
        Wed, 04 Sep 2024 14:07:49 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 06/12] media: i2c: ov5645: Drop `power_lock` mutex
Date: Wed,  4 Sep 2024 22:07:13 +0100
Message-Id: <20240904210719.52466-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Drop mutex while applying controls and just rely on
pm_runtime_get_if_in_use() call.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 45687d004004..25c60afcc0ec 100644
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
@@ -1124,8 +1118,6 @@ static int ov5645_probe(struct i2c_client *client)
 	if (IS_ERR(ov5645->rst_gpio))
 		return dev_err_probe(dev, PTR_ERR(ov5645->rst_gpio), "cannot get reset gpio\n");
 
-	mutex_init(&ov5645->power_lock);
-
 	v4l2_ctrl_handler_init(&ov5645->ctrls, 9);
 	v4l2_ctrl_new_std(&ov5645->ctrls, &ov5645_ctrl_ops,
 			  V4L2_CID_SATURATION, -4, 4, 1, 0);
@@ -1245,7 +1237,6 @@ static int ov5645_probe(struct i2c_client *client)
 	media_entity_cleanup(&ov5645->sd.entity);
 free_ctrl:
 	v4l2_ctrl_handler_free(&ov5645->ctrls);
-	mutex_destroy(&ov5645->power_lock);
 
 	return ret;
 }
@@ -1262,7 +1253,6 @@ static void ov5645_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(ov5645->dev))
 		ov5645_set_power_off(ov5645->dev);
 	pm_runtime_set_suspended(ov5645->dev);
-	mutex_destroy(&ov5645->power_lock);
 }
 
 static const struct i2c_device_id ov5645_id[] = {
-- 
2.34.1


