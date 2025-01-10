Return-Path: <linux-media+bounces-24586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EFCA08B20
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E96B3A61D4
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA7B209F55;
	Fri, 10 Jan 2025 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bgpS6jiD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9C820ADE1;
	Fri, 10 Jan 2025 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500525; cv=none; b=FSp9sw8IIveY4M7dY3UvqeX60AETyk/a/0ITtGHADxH6yRncP3gcoc32VTt9v21MJQGeV+P8raOcBs06mLuBt30G43ASfOEo2MSJmfbejR6zMqH1vlYa2aLNtI5EN1654TyQN0/Z0r6cHn03RtNsUQjKECZMCUYNHrDhtEUyFKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500525; c=relaxed/simple;
	bh=oXOtB1VaBWrBP8APSbLI3Nh6kPe3N7eP/+LzdenabzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3y9L3E6Mud4SZ/mxbVRdA4rEizAqC9aK/gB4ofWdTaVQYAxrx+rbORNnMnIF3KU8ypq44HzjawS3IbmrFJTqVcaIYsx7y2Vl8QKlD/sfM8in1f7sM5vyGz5rmJ8cjYu/2+cEUPHtu60d048ZFF+Wj1VdrlaIC2aQxq3B6+PJ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bgpS6jiD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C737B14A6;
	Fri, 10 Jan 2025 10:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500454;
	bh=oXOtB1VaBWrBP8APSbLI3Nh6kPe3N7eP/+LzdenabzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bgpS6jiDvdoKW1q8nVUC7aNYg6cKHRn5UD/xki4qZShp6ZTaSWvB6Wi4XdebJAYRx
	 F5ywBnfxUh+V4vWcGKcanWnYcaQq4khuiOSFZr3DXAwy+fJQpx3JVl/JHwuunlG2nd
	 9aHwuRE9PBvhSnZ24eGHxNsbGWjW+9VXQkuCvcXg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:06 +0200
Subject: [PATCH 06/19] media: i2c: ds90ub913: Add error handling to
 ub913_log_status()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-6-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2004;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oXOtB1VaBWrBP8APSbLI3Nh6kPe3N7eP/+LzdenabzA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUSGTCym3FB5u/+dbyl5OHefR3ryip6mlTn+
 WWFnethRduJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlEgAKCRD6PaqMvJYe
 9VQSD/99MA7q9c7/yqeN+fAk4wSUe49+1BvJe+nFLfzV0qji/tQYVtsL/2m+Chj5lJEe70eKD0Z
 0KrdYZkcxAhbt726ClWSM10ZoYrv3n6jny5TLICS73+9mmub0pQvABmrZuW7ruGiRPAO9HmxSKd
 8PvroMSqAljU8M341Lc8a38SZFrcs8CKoh+k6yghVQ4Dow8lWluXRvK3aRvYMTChH0NndL/87C0
 1IuVKYLDjtwlyi+4BnVxDuoGhTy/MMoPCA7CfMZM+Ssz2JIC4UXLf0+MKC5RAtXeOEQZIhTnTj2
 qvwzI1ksA3LciYXvR+aCHfDQBWnTWMH4fqKwObRZvA7ThcbgTv+5qJ3PyqQ9vZ7iUaNbl07Xsfz
 uE0kOv6TMGezJmmcPL5lBzVy9nNmzyJeou0a4NS95VHDMJD9zgF9KFMSCMHEUYDX+Xu0uo/ihZj
 we7xrpK8wjdbQDvXI/EGIJ98p6tIjyz4F12N9jF6lFc4qqr7ouO4GO96IC3FX32JKXkJIbCGZQX
 I3yDryu5p3AZbPucemUhvOzTR5O0TSbtLk5h2OR2GGOKWPJUVmQghzp9uelAdW8cVt0HxxM+Ztj
 N9uvLslVv9x6nB8KjS0LBreNnT3xJ9pRtiN4PWGY6RRkfSQ/XpQ62Fi/bP3PK9LXrn3yB1ce3kT
 7Gra3HK+SHmbVnw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling to ub913_log_status().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 34f92aa1c56c..111166dbbce3 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -504,25 +504,41 @@ static int ub913_log_status(struct v4l2_subdev *sd)
 {
 	struct ub913_data *priv = sd_to_ub913(sd);
 	struct device *dev = &priv->client->dev;
-	u8 v = 0, v1 = 0, v2 = 0;
+	u8 v, v1, v2;
+	int ret;
+
+	ret = ub913_read(priv, UB913_REG_MODE_SEL, &v, NULL);
+	if (ret)
+		return ret;
 
-	ub913_read(priv, UB913_REG_MODE_SEL, &v, NULL);
 	dev_info(dev, "MODE_SEL %#02x\n", v);
 
-	ub913_read(priv, UB913_REG_CRC_ERRORS_LSB, &v1, NULL);
-	ub913_read(priv, UB913_REG_CRC_ERRORS_MSB, &v2, NULL);
+	ub913_read(priv, UB913_REG_CRC_ERRORS_LSB, &v1, &ret);
+	ub913_read(priv, UB913_REG_CRC_ERRORS_MSB, &v2, &ret);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "CRC errors %u\n", v1 | (v2 << 8));
 
 	/* clear CRC errors */
-	ub913_read(priv, UB913_REG_GENERAL_CFG, &v, NULL);
+	ub913_read(priv, UB913_REG_GENERAL_CFG, &v, &ret);
 	ub913_write(priv, UB913_REG_GENERAL_CFG,
-		    v | UB913_REG_GENERAL_CFG_CRC_ERR_RESET, NULL);
-	ub913_write(priv, UB913_REG_GENERAL_CFG, v, NULL);
+		    v | UB913_REG_GENERAL_CFG_CRC_ERR_RESET, &ret);
+	ub913_write(priv, UB913_REG_GENERAL_CFG, v, &ret);
+
+	if (ret)
+		return ret;
+
+	ret = ub913_read(priv, UB913_REG_GENERAL_STATUS, &v, NULL);
+	if (ret)
+		return ret;
 
-	ub913_read(priv, UB913_REG_GENERAL_STATUS, &v, NULL);
 	dev_info(dev, "GENERAL_STATUS %#02x\n", v);
 
-	ub913_read(priv, UB913_REG_PLL_OVR, &v, NULL);
+	ret = ub913_read(priv, UB913_REG_PLL_OVR, &v, NULL);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "PLL_OVR %#02x\n", v);
 
 	return 0;

-- 
2.43.0


