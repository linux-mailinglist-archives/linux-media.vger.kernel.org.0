Return-Path: <linux-media+bounces-13329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D9B909FAB
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 22:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D16B1C20FE7
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 20:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509BB4F881;
	Sun, 16 Jun 2024 20:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcYVtAfn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAA462171;
	Sun, 16 Jun 2024 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718569499; cv=none; b=Qp/WqnlXizUJVOC3dezvBazpVxZsrhFGz8lehhu0Hlw7kVpNYXwVBEl86Co6MG85uzAmYWm40T3DVKxpYyr9/dp+a6jJaP5+9r16Xy1+vwI6gKfApFSHFa76J1D15mynhBrSjc1mvfYiUp9sEYBzEIhkVrJWI6QgR9s8aiAgn+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718569499; c=relaxed/simple;
	bh=jnGTYHfrf6Tcb78A5ansFb8GO5g6fEqI8aoKZhALh9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pImoFE+J6fh7eXVz+t5t1hYPjqKpvGyvRs/SiULcakkWwOIJyZKlx+HXZEdFipWIYqcxpiulgzL3F0ilsArCas1WkYqUV31j61+GzHi3nE3TOWcc1S4CC6L9mRBrpDzq73Fedcn8NquFFN9SC4xUB5DpChjrw5frkQ/ARpTMlZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcYVtAfn; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso5186389e87.1;
        Sun, 16 Jun 2024 13:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718569495; x=1719174295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1b+eyp8MMZyvdW8STOmPiipnxtTLNchIWNRaoDZQIw=;
        b=JcYVtAfnIdnkQXzYR6wDh/qozDcTJyptvbtWHbmLmrQnrlyIPOKbwSvOsX6ru7Hb3R
         n5cofXgPhGuq/W4pP2l5J1SXV93qumWfCy23foxslr33r+Q8qcH6+vMSbPsCdI6fOqoF
         VAEJlGN+UnFL/wpVafzSRoDCIcHEb3kabx7zu2ZebHsIhFHz88jyAXu6zygtMoOWWDyZ
         oThtavOIMLSwK3ezN8XtR66mGHIyHqptp2Pnt/aIhm0I3sxSV3ej9q6uVndhRfPvB0KV
         bsxmX0wJ2COr9WaHnoWvoOrwUgKkM566zZhsHnDQp/ouWyLGJ0fQ6Gqzu+qaahkR6AkE
         edDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718569495; x=1719174295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1b+eyp8MMZyvdW8STOmPiipnxtTLNchIWNRaoDZQIw=;
        b=mSR7X/2qX7M35ndXUwNu87XdN6T57M8CGkvMPqgAqiGGApe2DdDhjJ0NvX3CKNFKHm
         K5oSiz1O0AKowiXsmLo6AsWbzfnCDHSMueLEDk+6vCrBkUOaBRraFkUHjlqDs8u8XWbY
         M705yFHU7nbrm9RUs/D+oWbmdT39ebF4IVzIVW5IkkUnfWzFH2+9qAnPpmZ1lZbaaU+p
         HZY294BYnnTqiS7hM/O2zPIAc6Erq1f48SkN9z8SxPhvivN6ZOAN/oE5KbCXizJVuQZO
         XxJPheHkHI36dLN2FO8E3/EIRTHtNXg2HAHqr9X0P1LwPfup1WsOKXrqjRsyPtohtbAf
         OGtg==
X-Forwarded-Encrypted: i=1; AJvYcCXmDP86/an/ZAZJGT2pEw5PJuQyO8NSdJPbwOpJX0vZeYQN1wmCcjNfvzLs7IQ2H1WV2d5o3DhMIoL0N09yX55C9jX1Rsno27DZgcc5
X-Gm-Message-State: AOJu0YyfhmQaCH4gbbvSQZSPPQQg2G3lCmJPTkLoPgwWQp8A21u9XCCb
	6cwGmOaRomF1RutuAeW3QC0ZF08ytAQDfJZLE9DveBK1uM8zkZK5Gold+dqh
X-Google-Smtp-Source: AGHT+IEBxZ2nP3hIatUVK2ovMtLnsmPUaZXp4COiUTeaFkgRJfCSKAwJm2bVMmZFdN1ZEembYFv4pA==
X-Received: by 2002:ac2:4d8e:0:b0:52b:bdbd:2c54 with SMTP id 2adb3069b0e04-52ca6e6e8bbmr5922857e87.34.1718569495273;
        Sun, 16 Jun 2024 13:24:55 -0700 (PDT)
Received: from localhost (95-24-152-217.broadband.corbina.ru. [95.24.152.217])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2888ac3sm1058869e87.287.2024.06.16.13.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 13:24:54 -0700 (PDT)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH 3/4] media: i2c: ov4689: Refactor ov4689_s_stream
Date: Sun, 16 Jun 2024 23:24:32 +0300
Message-ID: <20240616202433.227895-4-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240616202433.227895-1-mike.rudenko@gmail.com>
References: <20240616202433.227895-1-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split ov4689_s_stream into ov4689_stream_on and ov4689_stream_off
functions. Also remove repetitive pm_runtime_put calls and call
pm_runtime_put once at the end of the ov4689_stream_on function if any
error occurred.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov4689.c | 100 ++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 47 deletions(-)

diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index affc6e3d5467..c4c7c462672a 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -537,61 +537,67 @@ static int ov4689_setup_blc_anchors(struct ov4689 *ov4689,
 	return ret;
 }
 
+static int ov4689_stream_on(struct ov4689 *ov4689,
+			    struct v4l2_subdev_state *sd_state)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(ov4689->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = cci_multi_reg_write(ov4689->regmap, ov4689_common_regs,
+				  ARRAY_SIZE(ov4689_common_regs), NULL);
+	if (ret)
+		goto error;
+
+	ret = ov4689_setup_timings(ov4689, sd_state);
+	if (ret)
+		goto error;
+
+	ret = ov4689_setup_blc_anchors(ov4689, sd_state);
+	if (ret)
+		goto error;
+
+	ret = __v4l2_ctrl_handler_setup(&ov4689->ctrl_handler);
+	if (ret)
+		goto error;
+
+	ret = cci_write(ov4689->regmap, OV4689_REG_CTRL_MODE,
+			OV4689_MODE_STREAMING, NULL);
+	if (ret)
+		goto error;
+
+	return 0;
+
+error:
+	pm_runtime_put(ov4689->dev);
+	return ret;
+}
+
+static int ov4689_stream_off(struct ov4689 *ov4689)
+{
+	cci_write(ov4689->regmap, OV4689_REG_CTRL_MODE, OV4689_MODE_SW_STANDBY,
+		  NULL);
+	pm_runtime_mark_last_busy(ov4689->dev);
+	pm_runtime_put_autosuspend(ov4689->dev);
+
+	return 0;
+}
+
 static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
 {
 	struct ov4689 *ov4689 = to_ov4689(sd);
 	struct v4l2_subdev_state *sd_state;
-	struct device *dev = ov4689->dev;
-	int ret = 0;
+	int ret;
 
 	sd_state = v4l2_subdev_lock_and_get_active_state(&ov4689->subdev);
 
-	if (on) {
-		ret = pm_runtime_resume_and_get(dev);
-		if (ret < 0)
-			goto unlock_and_return;
-
-		ret = cci_multi_reg_write(ov4689->regmap,
-					  ov4689_common_regs,
-					  ARRAY_SIZE(ov4689_common_regs),
-					  NULL);
-		if (ret) {
-			pm_runtime_put(dev);
-			goto unlock_and_return;
-		}
-
-		ret = ov4689_setup_timings(ov4689, sd_state);
-		if (ret) {
-			pm_runtime_put(dev);
-			goto unlock_and_return;
-		}
-
-		ret = ov4689_setup_blc_anchors(ov4689, sd_state);
-		if (ret) {
-			pm_runtime_put(dev);
-			goto unlock_and_return;
-		}
-
-		ret = __v4l2_ctrl_handler_setup(&ov4689->ctrl_handler);
-		if (ret) {
-			pm_runtime_put(dev);
-			goto unlock_and_return;
-		}
-
-		ret = cci_write(ov4689->regmap, OV4689_REG_CTRL_MODE,
-				OV4689_MODE_STREAMING, NULL);
-		if (ret) {
-			pm_runtime_put(dev);
-			goto unlock_and_return;
-		}
-	} else {
-		cci_write(ov4689->regmap, OV4689_REG_CTRL_MODE,
-			  OV4689_MODE_SW_STANDBY, NULL);
-		pm_runtime_mark_last_busy(dev);
-		pm_runtime_put_autosuspend(dev);
-	}
+	if (on)
+		ret = ov4689_stream_on(ov4689, sd_state);
+	else
+		ret = ov4689_stream_off(ov4689);
 
-unlock_and_return:
 	v4l2_subdev_unlock_state(sd_state);
 
 	return ret;
-- 
2.45.2


