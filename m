Return-Path: <linux-media+bounces-21136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 009AE9C194F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B24BB281746
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF571E1C3F;
	Fri,  8 Nov 2024 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P77SAF9T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DA11E9064;
	Fri,  8 Nov 2024 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058539; cv=none; b=n39603ooQ43NXQjczYCeix7ZYHaY6w+HTCVvptccJRisIZO8K+KyD1hwWOA4DKMhNN0CfB8OsUZMu4cliRjHc4iNzWLxW0FDFQXWkDEfqEM7H7+eOp7EFBwA9moyHtn7TY7I0nkYXil8dNX6oPkgGLtntKehoZyBMcDkWPoj190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058539; c=relaxed/simple;
	bh=+aGStSJXTWqelGHlqRUtWZzk5xBxaNgQWiqlHT0OzxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PMFgLUk23QOMVfQZBaLiH0kILi8ZGahPH6R5rs1e0PRvtQd9QEXuk+tq1/d31tQatfvaZGlTQd1+0DZmgRbtWnOrq3XQ5Sb6KOOwLTnmCF1R+P6N0JmIApW4vzcdWvPIFpgRPJsjcaWmzOeM3XANG1U//iDJOPa8hdozPyDcEwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P77SAF9T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D2BEBC0;
	Fri,  8 Nov 2024 10:35:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058514;
	bh=+aGStSJXTWqelGHlqRUtWZzk5xBxaNgQWiqlHT0OzxU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P77SAF9Tkl4xw2BfrAR9Z7qU+UjiCfPbcnSeJYwB+yj/azD9ccoACR+ARAQ6CQZxE
	 2PNIKWcDpqUjTT4NIYQeo/DaOzTYPQD35iKQGU1J2XEh4P/60LinvW9RdVca5aCNSH
	 vyCxXJT997Sqh+3EVD/XmVLMasGrHYyeLTjufac0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:57 +0200
Subject: [PATCH v2 13/15] media: i2c: ds90ub913: Add error handling to
 ub913_hw_init()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-13-c7db3b2ad89f@ideasonboard.com>
References: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
In-Reply-To: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+aGStSJXTWqelGHlqRUtWZzk5xBxaNgQWiqlHT0OzxU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtSfROzJv7xaijYKElEQV72lDFBQ4JjwB9Ww
 0S3RSJfNOKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bUgAKCRD6PaqMvJYe
 9UjWD/9aOH+XOJaJ26NTlH3iIDlVd0Y/giIHGSOlKUPBnyLen9xM3E8GGf+5jwbhyxrRraA9R9V
 cNqMDeoEo+1AFYq3b48TRwHb8V4MrTvH5ujb8QeHnDIdoGYOOCMvHrPK2PYKGpETRcHWCBhReBN
 xT8SRVEQSG/olzBejWDNEWDrqngEGUBvnpo3QxB1DpBUnLbJbuD42qS8AxI2/shR7YKO3vi9d4E
 6HtqRIOWYSkoqYBUMhzzA6SwemBMu5s0WtUhPTpha4Y23kRqudh23crRYp8B9/e+7EMbFX/3kFA
 CbfEB0aD2z65AKejlB9Lhan7srVnkj7shKHb/qk9t+S1bxSpkpacXoWvQZrXIXJl5Pc5bfrB905
 M5o8OgkxgXZgUMZmNXK6/k+BUdW/E/kyYOa+sv+2EkRfh6qqTdWG1slIif08mFcCQ4inaqwJWDH
 oJvhUtdTYFLx8rQGYS4HbR7OHgFOjtuHmTfII+x2IO37VALGGWaFw61aiiszgQC98O71n/W2G1q
 synCUW5KU5BsKpAOPXW1Jku3aN3aC8szu/cM+xrNtp6jGJ5l3XaaKL+9iFi6F9gJpMeUbSq+ZMD
 jsEtkQ7Bspmcd6SKXd3WQLjIQTnBPPa0EO1YGNswN0r7o14ATvaWEZwTAYEYb/iHghlZeSpaQ/k
 q7UWMDbAfSumPuA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling to ub913_hw_init() using a new helper function,
ub913_update_bits().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 150d6641516f..5db11b6e7e2b 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -146,6 +146,19 @@ static int ub913_write(const struct ub913_data *priv, u8 reg, u8 val)
 	return ret;
 }
 
+static int ub913_update_bits(const struct ub913_data *priv, u8 reg, u8 mask,
+			     u8 val)
+{
+	int ret;
+
+	ret = regmap_update_bits(priv->regmap, reg, mask, val);
+	if (ret < 0)
+		dev_err(&priv->client->dev,
+			"Cannot update register 0x%02x %d!\n", reg, ret);
+
+	return ret;
+}
+
 /*
  * GPIO chip
  */
@@ -733,10 +746,13 @@ static int ub913_hw_init(struct ub913_data *priv)
 	if (ret)
 		return dev_err_probe(dev, ret, "i2c master init failed\n");
 
-	ub913_read(priv, UB913_REG_GENERAL_CFG, &v);
-	v &= ~UB913_REG_GENERAL_CFG_PCLK_RISING;
-	v |= priv->pclk_polarity_rising ? UB913_REG_GENERAL_CFG_PCLK_RISING : 0;
-	ub913_write(priv, UB913_REG_GENERAL_CFG, v);
+	ret = ub913_update_bits(priv, UB913_REG_GENERAL_CFG,
+				UB913_REG_GENERAL_CFG_PCLK_RISING,
+				FIELD_PREP(UB913_REG_GENERAL_CFG_PCLK_RISING,
+					   priv->pclk_polarity_rising));
+
+	if (ret)
+		return ret;
 
 	return 0;
 }

-- 
2.43.0


