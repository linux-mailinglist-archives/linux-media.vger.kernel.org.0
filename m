Return-Path: <linux-media+bounces-19098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E661D9906C6
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A45392884B1
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B8E1C304F;
	Fri,  4 Oct 2024 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J5liEe//"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455B83DABF4;
	Fri,  4 Oct 2024 14:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053250; cv=none; b=rcVhbL8McEedswos7F6cjSoKVlPhDIbS+3ZEd7G3Zr/jCYZlNmewoZ5fYuj5Ct+zOC7bFi9OJWeKQl9u5V8JS4Ucp3asS4F+QVP7C/749nmcJbusmNpJxf+mYkvvVQe+X1lxulldR7q7bqiSe1bpMzcG16YgSMg0jed31ib+wAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053250; c=relaxed/simple;
	bh=jgGbPlVw9htVnBapbccOdLIZ3VXgt0d8E6hbJmD4w3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aiFqJjBFCHd9uryDJfOmnFQbnc1WFRY/mhE/rTHKzU6mZrDq4HlfsVvIcLLNjZNZ9ImYt9SclWTFN/8/TrJ8SDgOnIw2FlPEVga5MJITRJJXxUM/FXQSjHxqmUSCuwPXvaIb5aJwDgWhF6BBvj9KokyVS99A7V3+ysJl6cpJ34w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J5liEe//; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AF6FFF6;
	Fri,  4 Oct 2024 16:45:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053144;
	bh=jgGbPlVw9htVnBapbccOdLIZ3VXgt0d8E6hbJmD4w3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J5liEe//47vwdet1Vi3VkdQxrjr0HpaGRaUr2N0bLMNr/HV+EB1bsYxqRrlIXR+sW
	 qoUVW31t9hY4tfpQa4rl9LM+eXAEoy7/p36g4HtM5RD5gFlmpryLQW376Lekq0yHWR
	 xk7ycxengNlRH92nDz3adlSLj4vT1NzMug3mkTDs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:39 +0300
Subject: [PATCH 08/13] media: i2c: ds90ub953: Clear CRC errors in
 ub953_log_status()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-8-e30a4633c786@ideasonboard.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
In-Reply-To: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jgGbPlVw9htVnBapbccOdLIZ3VXgt0d8E6hbJmD4w3s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///uSS6hBrAAn1miI2EzxaG0vQiaM+wrwnSS4
 A0WPHv9eI+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//7gAKCRD6PaqMvJYe
 9TiLEACK8QVnLwYhpNxlu51TOjeJfsInR9/w9mwDP3YgCgzd96nJ9QqPU5mQrZ8jCSjp5+LDR9z
 iKL58KRfclXiD247cEMldLB+tkEmam4fNhIaTnR1ah4BT1m9OC+khm8JrC0okBV3uv1NDfkBQ4v
 9NIW/WmNZEH3AMVh6Kz9is814zx9eYw6bZBiqIUGg0WI7OQCTv2tS1mUbq7ruVUlXkXiag1px27
 o8A51dDcwj/USHSh12dChaNmCZQSVP25rt75zCnpmSiDVr1ebkUJg0eckWmx9YOSf2tmLdWMny/
 kagvEd3ovChMQsRppZFVowf3FYB0W/ikhH+MqUv+f0+z49bzFKWYEU6LiSSFqT+LPTEqee67ppL
 rNvE7ZLn27O66w6MBdQk2S31NHIVtVMY8XO+EdEATRRx8710LZaZQUITRw2/OqvLeqaDhrTI/u1
 sJaEAUB6yLmHpkRXEv7gXwPataUFBWoXDR4qITi+ycjaS60kCkr5+sPMvA4ZpAYRm6DzXJP7epw
 x1ylLrLm13B+rJqMdRABpGZlD7iScQXIGdqRvhpkZQj6xw/4MhCvw2gZwCw3awlwIHA5f0I4GDv
 9MOdfw9NVsjje04+82F8IU/xixxsyns3tHnR5HSwv5Ra0tM7G8X7AxwC67kf36PSp8r7Plnml9j
 fx679SfuEg2QFew==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Clear the CRC error counter after showing it in ub953_log_status() to
make its behavior match the other counter values.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 10daecf6f457..b6451811f906 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -66,6 +66,9 @@
 #define UB953_REG_GPIO_INPUT_CTRL_OUT_EN(n)	BIT(4 + (n))
 #define UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(n)	BIT(0 + (n))
 
+#define UB953_REG_BC_CTRL			0x49
+#define UB953_REG_BC_CTRL_CRC_ERR_CLR		BIT(3)
+
 #define UB953_REG_REV_MASK_ID			0x50
 #define UB953_REG_GENERAL_STATUS		0x52
 
@@ -619,6 +622,12 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2);
 	dev_info(dev, "CRC error count %u\n", v1 | (v2 << 8));
 
+	/* Clear CRC error counter */
+	if (v1 || v2)
+		regmap_update_bits(priv->regmap, UB953_REG_BC_CTRL,
+				   UB953_REG_BC_CTRL_CRC_ERR_CLR,
+				   UB953_REG_BC_CTRL_CRC_ERR_CLR);
+
 	ub953_read(priv, UB953_REG_CSI_ERR_CNT, &v);
 	dev_info(dev, "CSI error count %u\n", v);
 

-- 
2.43.0


