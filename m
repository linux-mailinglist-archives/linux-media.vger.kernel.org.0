Return-Path: <linux-media+bounces-44277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BCABD3662
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16A4E3A598A
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AB42D2384;
	Mon, 13 Oct 2025 14:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EcCgmV32"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEE426FA56
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364897; cv=none; b=goAPnsaCecpbE6cwE59IY7YhQQfhXne48SVWaJFtDeniCZKpuGPXlZ/TKi1j2ITnrOyK6/Y9kTi/Akw4bNTJFvCDOQzeA62KQ8PFJ23jD/55DEBRbMsJb2OaO2qLLnnVD5oSTwcrDLdBoEYDDNHbiZiW3BxlzTrgSY0ilYEj0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364897; c=relaxed/simple;
	bh=EWbKp6zVXKla0AyI4Ib0EFYpCMHe2Dydv7j+omIlI14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KstFGDVwhwFgWLu3arWcxgsPZFLCqJ+p0EiKgr7Z38FBGJ+XMqm1tkZbuRBtbMF7TlJZ6H9aFT4llyL8zk1mGQzR6ERkzDxbx/f7bItIU7kCbx1dviwhK/byItRNgrjszRC2p+6h9LXj7UXFQFV7UnJenWqf+SS3k4gteTzXXdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EcCgmV32; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso1150003e87.1
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364892; x=1760969692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDkvCYuJbKI5HTEwyE65VkdYWfgRYyc1U+blXUUQVgU=;
        b=EcCgmV32a0HZiXFDs48CmHwrDNUra3ZYW+Wy+oy/Ht6eVil+Ec7Zv9cYLEC7SJv8qJ
         KBkiBXHRv+q2REcjasnsufbfhFeNofaCaBBDW0Bz88I4hUS4OHj7oV79TNdL9TyDv/e0
         c38ZPmus3+8/WQGqx3zZAj1FGQbEZZdxpfzoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364892; x=1760969692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDkvCYuJbKI5HTEwyE65VkdYWfgRYyc1U+blXUUQVgU=;
        b=wkI4bjQv53xbJiycfgXQdq0ANZe5iqwlhigFgI7RopDseypzZcajlute3YdDLfpc61
         wTVwYqBux9btCTiYsfMHx9XSLvxOkqeWFXnM9qyaa3ov6DVcyNumftLk/rpztkOYDpxj
         CS3xFwk/ccqOlDllxzhr4FHsQO1pDJF8bypIZeRnVCt/8ezZJ0iKXDxqjY+KVcedZqQJ
         0Ggs88RdkktpiuSGw3Q0TEDxTTgbjtJytvaZ0cnQOZF3Epeqy57QEtfXaxllhVGcMi1m
         J9bUqK7E2Odm2gQoXsaq2VdcWuNB5j0iTttxdj1W4u8OsazkGgx29o14uGdz/jOpX7XS
         TSYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPRwZqM2OZmCqJaXXfq1mX9w26sttVWrrhmpa6tv+eHf18RXX7HZxL1r+FTAz6ATOgmVyiKyTsQe5DQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy82GS4339EMKmrciN16QVriOKd3fsN/442xBAgisueMrhgsirl
	IV8crFmgi87QfOg7pdX756/Ap9DRtnUB1C9Y4E3AAggCXxb6kKzGJLOBrPv98sAFJQ==
X-Gm-Gg: ASbGncsXn3fXR8oaSV7lk828CidXotprwDI1ZaATQMEJXQR/0NqQ+fEgG6jvSCIBYkZ
	x+dshuF2cxn/7K0BiL8WmNxELsKdSa7cAsS8pbl2rei81kCKvRe4mFyfPbJMIpLVYubwrEM8rp6
	ZRNjXQq8imV56IGD74QDb6pINcEYgSFFJ0Dfj0G18Mh2ZDmcq+KXf+CpivqthoVzwEA0uCFRPra
	+KqMd+Z1J74+F1QJh4rngECZH8JR25OOuNlb1y9pGjdC+JHzsSi0bI+lMcXfeVtmBnVLyuy+FJO
	8UIS/z/h3wnPSFihmaIiopcIW2RCCdKz87z6eVnUMX8BHv9odWSuzO7jOVkZ++CKF+sehusdhgV
	n8D6lyyhTs1b7jrFhPK2GIAKkMzUnEZ+igPOPbyT2Mx5D+IueR4as8BsFasYL6myZz/FmscFi1o
	ewc8JomgTI4dBudTYclg==
X-Google-Smtp-Source: AGHT+IERp0UGzsms3m0FKqLtDNsdKrYzy/yeu64vwUTfcVOJBQFfqT4aKP9avdaubkT+3l9KavisJQ==
X-Received: by 2002:a05:6512:6192:b0:579:f4b3:bc3c with SMTP id 2adb3069b0e04-5906de86e2fmr5500248e87.55.1760364892337;
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:44 +0000
Subject: [PATCH 04/32] media: adv7842: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-4-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR()

This patch fixes this cocci report:
./i2c/adv7842.c:3470:16-23: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7842.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 9780082db8415a3d65860666d0dce8399f57e4e3..a35077178a0950090369e17b4aaf9904da041a00 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3466,8 +3466,8 @@ static struct i2c_client *adv7842_dummy_client(struct v4l2_subdev *sd, const cha
 
 	cp = i2c_new_dummy_device(client->adapter, io_read(sd, io_reg) >> 1);
 	if (IS_ERR(cp)) {
-		v4l2_err(sd, "register %s on i2c addr 0x%x failed with %ld\n",
-			 desc, addr, PTR_ERR(cp));
+		v4l2_err(sd, "register %s on i2c addr 0x%x failed with %pe\n",
+			 desc, addr, cp);
 		cp = NULL;
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


