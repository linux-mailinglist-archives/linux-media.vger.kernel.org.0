Return-Path: <linux-media+bounces-18694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBAA9882EE
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0875CB21C04
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D2418A6BF;
	Fri, 27 Sep 2024 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qv2F5Ryc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E286818952C
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727434758; cv=none; b=XXBSvdaf/7wb0ga9qA5JB15F4pgB0kL6M+iAiY6+yqeWwz6daNAyxmhodotmuKvRIcZ1uSJDEO6mmlpJO6salqEaIe2Y71vWKEz/gOpE8KM4mZGj7uvDuncUMJ43titC/w8wbdxu7nu05uIW0mleCP4QBqfn912jKt38pA/I2Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727434758; c=relaxed/simple;
	bh=K+n6eQ2cPWYy/Q7xBym5coeLQ4dzkxS9PZcW+gm5rL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DFzeauRwZv/9q7lkBPKPVddY0758oalB6g9icKnBO0n8RGBMfIUqTl9r4zZbycqn8uEPzPXB/+xsgTVHJ4fv1f8h+JR9rP4s8Dx4F52BaFb5SwAm/IFxvIAsAE1V8HURtOLDWMSstC5QT7ieEyn1UizUGavB+Qx6S3ZDLQkNVTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qv2F5Ryc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so18218705e9.1
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727434755; x=1728039555; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOcCuvst5c9aq1+1+H/oqsCFu72PdUTTrjxJNpE5Onw=;
        b=qv2F5RyckjRqVpbqJIPQ8/jP/gmP+3Q6dj63pUQZ8dbBMN4k0+H6ipeJbPmPV1XaUV
         0xzbE8e1k6lUbB49zUKAGPAnDZt6E/gKG/ywzR7Cf+Uk/N9gv62zgipykLSfMKO++C/2
         sxu4kpBen01Lpyizy5FtJvXBCS1wtVakdIf4AkqqHMQMyOUs3SeD8XFqRhDSmcQISHiT
         V38DIk9oTLZIjKyqIIhx8fAyVZGt72jeg4asnMMaPkEd9a34W4wwwdle9M8hZY6jlYOr
         ftAc7KdGwEd2ZW1ZQ3wyFc67BbxJSgVPS8edjAUPoXAwUpzm+j+MOhq/T1LhJOzaiS2L
         VcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727434755; x=1728039555;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOcCuvst5c9aq1+1+H/oqsCFu72PdUTTrjxJNpE5Onw=;
        b=mPRnQ/3PUaHbeue/GZyeVeRAmCFz9gK0cmk1JRptEkn+FOj51KSbN1gpG6ed9gYJlq
         2ExgFixd2YeaeCbsxhMgelx8mvA6eDcisHSSIpXFO9uRspMsiXLa6XqVK8UCCOp5stmZ
         TRL8BllcwU5vGvx/f7eJdF1ZIL9CnGXxh2jV1FLi++6GZsaU9EwoJ76GrJha1jZjwMxj
         t5wEvSrIj0Ntq0g8ZsURf4I02WbJc1mJZBCwPZbdFBNq7QoIR48pAmDSMMxfmakCY9t+
         K3UHXziG+ojtWLrSLz/XUWDceFhAMl8colLflz3ZmZw1qmPCAAiKMLE6mFEY9DRfXI4u
         McfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvVZj7I5l8kgXAggW05DqtAt5+ksI/Wg9DdTPRwB9cEYhDj5xPoC8GJURshVmvaQEaOjGzQyD7M6vHAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyATtBfOXGxL7QPtWwBDrxl2sxtxkKrTK3UnFSiwP0MyeNUgh0O
	oEMaGxe3YuDBhUb+HZ8zX1f4uk0O1CMREU48j58FFi0Tjk6MZbHn45dId0HGvMg=
X-Google-Smtp-Source: AGHT+IHi/PHDsl62KtWlOzp+Dcam2NyjyJD0k5ABYyerS+WOMWUgAw79d/BmDfY9Wq76LyxaPHp8MA==
X-Received: by 2002:a05:600c:5251:b0:42c:b8cc:205a with SMTP id 5b1f17b1804b1-42f58491029mr18750485e9.32.1727434755137;
        Fri, 27 Sep 2024 03:59:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd565e433sm2172388f8f.36.2024.09.27.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:59:14 -0700 (PDT)
Date: Fri, 27 Sep 2024 13:59:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julien Massot <julien.massot@collabora.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] media: i2c: max96717: clean up on error in
 max96717_subdev_init()
Message-ID: <ZvaP_pm7gucwK8Vz@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Call v4l2_ctrl_handler_free() to clean up from v4l2_ctrl_handler_init().

Fixes: 19b5e5511ca4 ("media: i2c: max96717: add test pattern ctrl")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
---
v2: Use correct Fixes tag

 drivers/media/i2c/max96717.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 4e85b8eb1e77..9259d58ba734 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -697,8 +697,10 @@ static int max96717_subdev_init(struct max96717_priv *priv)
 	priv->pads[MAX96717_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to init pads\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to init pads\n");
+		goto err_free_ctrl;
+	}
 
 	ret = v4l2_subdev_init_finalize(&priv->sd);
 	if (ret) {
-- 
2.45.2

