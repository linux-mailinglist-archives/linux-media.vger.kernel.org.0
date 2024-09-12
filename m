Return-Path: <linux-media+bounces-18188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 259039764F0
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 10:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56E7B1C22C08
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 08:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D4F19258B;
	Thu, 12 Sep 2024 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sgq2vzHJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6AB18FDBA
	for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 08:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726131104; cv=none; b=J9Z1xHyvf/wqsl09L9slVHkRv8PZTs+wSGSNuGeeQYEoBYFaIp3bMHggAtBjoFMGlawbJdXTpQv6cCcUYE1JI0f7n0jdI5CqUHsYsIUNIFAw77hsi0J4fHq2fjvDmF6S5efJSXZiOmhHrk5vxsM13RO14UyMA955rYUqPz4PQOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726131104; c=relaxed/simple;
	bh=ZW9q90WrD+G0PAKw9e8G1vmoJHNTZdJBVRRsoqphIxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ej/o3zHa7tZJ2qlq33JhYfdoNxD4+aGQvweFEFNkcn7KLtShXMKXM5XThzTm1LabDuId++XO+kGZmd0bTF1en8f7f2RXcxVIMYpkX6ZKLayOtTwdzkfBBL3r38aA0TviVXIqbUw+7eXHWdJMfoBmIRYv0AwBpyfY4NSHETnKsSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sgq2vzHJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so5250435e9.3
        for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 01:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726131101; x=1726735901; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81XtS8l9mSMS4c/2nDpcx8nr5/0qweJ+8RlF2VnBxMA=;
        b=Sgq2vzHJYTzK/jIvF0o/jECGn4rrANu9qf8tpT3BA7R2fiIESfKEa/XzjSwgiWwqAR
         SvBEqot6obIjZ4ViCWs/PR7qci7vmtrx7wMOp7TbeESAzW1hku38lJ9wAXsZd5Sw9uMF
         yODQ4KWaR3rzh/wMW2kv5qu7rZ9tH4fqGviyMkbwC/Fx7v4smwZBavNHmcoXBT9WnEt0
         /UdlaaCp52KigrdWpR22PRi8IkpGOO05v4JUYx4IPxu59VwhuMM4VN2Bpgu0zbXG9d3K
         +LCIt65C2QHTqdn+o9QfB8k6iUoRrti3BZifQ7bPk1ofPqyPC82o0aQNpB6yw0+0mcet
         fPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726131101; x=1726735901;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81XtS8l9mSMS4c/2nDpcx8nr5/0qweJ+8RlF2VnBxMA=;
        b=lNEiECHSrXupjy1kZ71YHpVBCVllZNAJlY0uAlb6s5QlIc9v8SAk3X8JbfqSa45hmE
         ndiXx0NsHrwVyXTRYGr/x8ju+GI4uPR1bC5kswJ2fcNS/N7OGyl6lJqBhUeOt+O99wo4
         Ng+3Btw2nN4zNAxi6t6gP0PvphG52sT9hCYud97scxsF8q9kpTkx0YgyRLJ8NT0Jcghc
         rh/XcI+Xdj6GxQtIVLy54vGv1o/Mr7PILFXem6NoyHQC1Q/gYOXXtsSwpDBeLXHpkKE7
         44bqU2XgE4HUzM7Hr0dt/84OMMTdZo65vUiqXX6UqWCw/DK1mq8MPeQUmzPh6KuekywF
         HelQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6t/Q2e+W1PXFY87sViidWoOdNYww+hBMCzAFxSSOb6xRpE0JezWvobsJ/DXKspG1IwbcKjmiPd4ftlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUHb+PSEjq20j2Po//mAAnA4fg1a+CSDYDojbPHD4q1LOmel2T
	r50aRLHrLPs5u0T6GEvm4S9064h909YFgUm7g2Op18ReqdU4ZuRuFjuDfZFDKas=
X-Google-Smtp-Source: AGHT+IGMgDiKAbBW7n/kM+sVyZkco74cXOo2c6V3865Igi3TJeLceEdfuNeJlBvdLqEo3zo9Zo5mkQ==
X-Received: by 2002:a05:600c:3ba4:b0:426:6e86:f82 with SMTP id 5b1f17b1804b1-42cdb57ecbemr15170135e9.22.1726131101129;
        Thu, 12 Sep 2024 01:51:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c56sm14168144f8f.57.2024.09.12.01.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 01:51:40 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:51:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: i2c: max96717: clean up on error in
 max96717_subdev_init()
Message-ID: <23251b8e-c148-44ef-bc9b-f39cecc4fb12@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call v4l2_ctrl_handler_free() to clean up from v4l2_ctrl_handler_init().

Fixes: 50f222455793 ("media: i2c: add MAX96717 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

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


