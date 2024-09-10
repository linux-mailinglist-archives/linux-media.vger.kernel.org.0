Return-Path: <linux-media+bounces-18097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A86E973E27
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF2691C24B90
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4321A7047;
	Tue, 10 Sep 2024 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjLR4I1b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A911A4AD7;
	Tue, 10 Sep 2024 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987988; cv=none; b=Rjncc0hJab/yugz2V0jDK2UPW00G2TjbwUU/4sc3h7NQuymPOFIuYZodOZij0ELnOGBRfU54zOUbL8PUL5UJEtKSKimX6250GBu8lgVlPdtBPZIRAo6S2V1sN+xNo7gbyaaFgMmJxHuGk0crkOMWXCS2D9lBpSz37C6L91sbCLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987988; c=relaxed/simple;
	bh=mAqO79O3l/OvTSDmMNjmx02R4NEoM9pQ3zCM/ZFlJSg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OlzngoRdM+FySQ3/sS4YvcWF0oe4NtilOBovOki8qmWOEMFHh40JuYpfdWTlELIQb61iFQMRI7MsOLz5KFqVP2R6tV/tvNKTchEhJO3VJLtxGdN5qgcmiEIRVlw/Db2F4HN1nJ5znUVjsBc8oxO8baNKvNFu5AmcgLOuHaz/YqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjLR4I1b; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so5177158f8f.3;
        Tue, 10 Sep 2024 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987985; x=1726592785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlCGmlbK8knhiNdPKYD3AWEcb7dTp9/GfV8SpqAQwLI=;
        b=NjLR4I1b1vNKWbuqDbPd33q9bMMo8GFAIb+aH9RqSzjNMqnQHe7FfMEVrd9A3qwIC/
         +DTbvbMjJ3kJBbLRE+n5iYHWxX1pNATDJlp/RMbA4lfHk0FHAENx9AVqFFGJLV1NnIlQ
         7LCTkF60b4TY6fnSDtLLjU/PBaYZ22+n1x/ivcdFOR4i21PqNvkw/YoNbxDTwOmnrDqO
         Scq6pM4ioSVm1jm8rusab0YCPqg8bVHMgagek2Lz5mCniDpeCVebsaZ74U1weRtg3jUb
         wwHYBO4ynxzx6yuLM37jM8FHR4WINKSWkLskfJ4juP/YBxEkGRFpnL3ccCqC3p0Bjday
         fh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987985; x=1726592785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlCGmlbK8knhiNdPKYD3AWEcb7dTp9/GfV8SpqAQwLI=;
        b=t7YqWNJhkeOmQzup++bhVYpJ2IDD/8TYR4YyBqgmpqQNPQna0N6sVCU8Zb/Wfml9MG
         e6XVa4j8eB5ZuckMvv1Lm8G3s6FR0qvCgZtkSF3rUu8YxZy/SZlHTyVPl+DPh4aP/G7L
         o8aSD5yQ1dj/lyLAMcmUHEOoDfDmHH1TrMXI8IHlk4aXU+zpVWdUzzvGr6CVLbJ6gVuM
         KB74oZoJkIQEWkZXW9xQlPnekHzyD5iFFwT3pjhfXw9uN/4vSykufCIfXGPb0G0yHrp5
         vSpRHABtCqDY8qlnLC5naM0DhL/DzN/7webi2FKiv0jo/6b7MSR0hSHZJLGG1PPLnmiJ
         Puag==
X-Forwarded-Encrypted: i=1; AJvYcCVByyhP5G4HkaTe8wXZUrBwZGJ+Na48l4eHRU1WZNAbXWIvQv4VB2aeNSFWMbEDiD+AyIuR/rvTf0KGKpk=@vger.kernel.org, AJvYcCWbPZDsPKR+trcmsFCdK/cxprBjIVarOmrHiwRzoPdy3vmx9GGxW5u556+88IWvYhDQljgiPbrAlaZdzJu96pB1ZGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg8Mp3ywdjJ+cQvsCfo/VNY5kXCfaYV3hCFrvj7eZ6U9nR6xAe
	ERyBHDGMaEgm0cSTn73xPT2Wrn0PwYydnyjSJ8PGCsKnPJ/aqPPr
X-Google-Smtp-Source: AGHT+IFJ18NP6xZuWGZfWy6nwzJBgaGs+52ZtI9KSSEYZxPmtL4+Gc4LfrAvXiDM4guD2wSo+ngvJA==
X-Received: by 2002:adf:a413:0:b0:374:c7a5:d610 with SMTP id ffacd0b85a97d-3789243fbc7mr9707544f8f.43.1725987984910;
        Tue, 10 Sep 2024 10:06:24 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de4b9sm9438925f8f.111.2024.09.10.10.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:06:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 06/11] media: i2c: ov5645: Drop `power_lock` mutex
Date: Tue, 10 Sep 2024 18:06:05 +0100
Message-Id: <20240910170610.226189-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


