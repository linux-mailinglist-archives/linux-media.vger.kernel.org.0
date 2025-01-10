Return-Path: <linux-media+bounces-24582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A713A08B15
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6308169B52
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2A620A5EA;
	Fri, 10 Jan 2025 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UJktk0Dh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB4820A5DB;
	Fri, 10 Jan 2025 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500515; cv=none; b=K/SZlL8LFu81yEpPtLyqo8Yl/Xv8TAjHFPrnY+kqyNkD3AVnt1rchV956eOb8tTu95vWhPj76Im2NTgwY5Dl60WolkYbJjG4ArhPXLczafhf9UQT/RhfLmxTSf7B5HDeyi4H26nzoNFQo0Ys36vo0lmFHUAxUn8QgO2UB6TmMQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500515; c=relaxed/simple;
	bh=+DE5YTRUaU0uLXaCLCAHD4D+g+T1LPnw/BYv7lanzh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qIedzVXoUKqZLcpKnIs1S8h72xFm/HukwN3k+I1urp5wv3F6H1fa11E4E3MDcnJx2WGw3CBK1Zfcpkz/ylirL6/Fwo3dlaR23PxPTi8G9sY8bzY8V3/XFxgKBHbwVlh7LrfoQPmQuYZJ4IItZUpTtU4Oec0a87IkVjPETAnRwtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UJktk0Dh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FD9F11E9;
	Fri, 10 Jan 2025 10:14:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500451;
	bh=+DE5YTRUaU0uLXaCLCAHD4D+g+T1LPnw/BYv7lanzh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UJktk0Dhty+WdlxqyLnPH7/LUeFeoL86qr8kF2d6HTioXe9NDcT4WQ5WPJU4Dm/tG
	 70Xr1FKgXt6iLvoBUQS44ccV71zIxvT2SZjADW8ebbnesQDqKdXeOnHre0N937ix7d
	 Jxk2LLgku6dNpzb+JgqZ0Fbv4s5aecRwNHEVPuCA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:02 +0200
Subject: [PATCH 02/19] media: i2c: ds90ub913: Align ub913_read() with other
 similar functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-2-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+DE5YTRUaU0uLXaCLCAHD4D+g+T1LPnw/BYv7lanzh4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOURh6idaw0SbKrF8aJF3TYpqWEWXUEeXYpBV
 GJ4G9aVgmSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlEQAKCRD6PaqMvJYe
 9RZ7D/9ZLledoqvcvUgsxfufyzof1rAYR4Mq/TqA8H+vGy0FOooVWzvBzLmdnd29h4OeZM/tySt
 Lr9wXaTufjJBe7lMkagMf/3ki7C+D7JvGVx4Z9OYXqpDqqRrZI4JYjqKTwzm5TfST2kAckW6Lqe
 F/gYbkJt8uc7ZHPg6XLA04q1qnsaBdiMjRFx4PEhtOtm5+EwTcENbxYUA+jk9DNkZQnUEBh1mli
 iGtfM9EftiWhqcjuj47tF6vNY05BIsmycoJK7hB7PYRuhtM5aCKnuy/UjNI6pyrZAJHGFTZak2a
 eAQv7TDaVRrScInHQNTNwZa2ij5VKMExKLkiScIRwSz+2C4NM0u8w+aOMWzHLyvsZQ9AN+7i65l
 btcUo3Hr5OYWdM6zMIBMWXST09xTAaZIue0Vq8DX4wWSUgc3c56MHUxWZROp+q8k8UZ0PR2SNPJ
 i27K5hm89kse+b6fXRWrrQ4eKuu4ocetv88pz59kiJK/Roa4Ds8SFCL2+AJVcO7yJPCgMZ0PT62
 kXsIrcLIX/yQurIDY0cUiJCo3TeIrSWMAk4gsAryVcT4Ue5giHofXYoWZhfQC5LrNLi/gjNZh/w
 JW+IgLpD9AQ9oSazThZdxRMRX4kG+0dDoXwDZ38xiJuwO2ltizotBeptljkUqh316iafMwCTMPd
 T4ZgH8nKIafwBzw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Adjust the ub913_read() to have similar form than the other similar
functions in ub9xx drivers. This makes it easier to deal with all the
read/write functions with a semantic patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 7670d6c82d92..1daf0b8ba726 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -125,14 +125,16 @@ static int ub913_read(const struct ub913_data *priv, u8 reg, u8 *val)
 	int ret;
 
 	ret = regmap_read(priv->regmap, reg, &v);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&priv->client->dev,
 			"Cannot read register 0x%02x: %d!\n", reg, ret);
-		return ret;
+		goto out;
 	}
 
 	*val = v;
-	return 0;
+
+out:
+	return ret;
 }
 
 static int ub913_write(const struct ub913_data *priv, u8 reg, u8 val)

-- 
2.43.0


