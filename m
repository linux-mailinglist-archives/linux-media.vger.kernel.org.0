Return-Path: <linux-media+bounces-20079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A84999AC1A3
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 10:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A1122831C6
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 08:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423A915A849;
	Wed, 23 Oct 2024 08:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCffsi8r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0404861FF2
	for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672262; cv=none; b=qGo2P9XDEqlvYdmt4oQ7cCejUzcBp5cIyHOStHeUoedTBQs3JEzG90UNeSSFL7pHPbKTOJ/5iaVPHzjDOl89yICGh9UoSOPK56A9LQ6zbUJxQAZ2isBl0kqRv5Zx2YZWCZoeYVc+TkePM18BkVAU85OTS5Sqv4l1vw0TElGLbWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672262; c=relaxed/simple;
	bh=OdA/Lx/g/+rhQ0Eyv42s39kdQJ47dqmOO55WQ9F/BNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DOUDf+CRWQ0N0vmIyo9SUt05Sad5PhhSIVTp7YtGM17sIY5jyhXdx0VyghmNjfePrF50YUv2OxHsM6y2eluCUroa5GBt5gTm9o/VeCQsGPBszrD5kAg1vmSHkUo5/UTQkqr45hhCqeVMs/LBKuvyJ+ZuPpoJmjvylkMaMXRvpgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCffsi8r; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d58377339so6755507f8f.1
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 01:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672259; x=1730277059; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJjPAsY+OlQh98BPt/llnxV3HvdF91YFt70SYWdsuBw=;
        b=UCffsi8ruJeTbOB+j7Ita1rNp5XIQYORV4U4xd1kLr3gJsfTp2Eky9MjmnpvE0aNb2
         pk7lzbpud6jko6DJyrxuvm79bc/f8UPsCOjbUcW98QmumfFLiAoPYnbgSKpiA609wFoP
         vFJ9IBwRXeCD++rhCJj07wxdjiqhr8QSkdNdBqzg+bg0Exr9p11qQgogbT2nqmrILBnm
         jbQbSNbwYXY6Z8HOt/dTgqMM1Uynpee82hM9QQZUTgYZsje4MY7qBArIACjyo8pcYA3t
         IrxK5fM3h6STIsF1hEwQgC9w2483mS7uqPmHyuf8M2hkhGft89NzqHxy8rEbPwznqRls
         CoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672259; x=1730277059;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJjPAsY+OlQh98BPt/llnxV3HvdF91YFt70SYWdsuBw=;
        b=nLPDnDORR4V689ONXVo6roP05dp5+xzAf/9FDHnBWbRZCioOb659ahcYqEsRmwMCyA
         +WzLwj0OMYQqM2JZUAAwyixIVHOe9uc93X1/e/FgNjUgoRXOIWBFXHHfz9ivCGOAe3V5
         G24dNLm9oM9XokSuTWlqC5YjtYwd/dFjscDlHGhfDfno7EAlcPDUeOXRiF51Yw83yORs
         qRa8OHYdiv8tvh2sDZzdUiFfgv99N6WDwCvfVSBbsWYWls8T6Yz4wjXpTOAfsRyqRyA4
         cnniidGZDXeHj2awBu+zDNPpbSarvJcqi6PURMREAHhAPF9sZdgYKsX6xIvZHbH55ATQ
         K1AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWjdaNFl8fJDacl4e6wlQhc+8m++fRr8jptiUBJmwlqqKosVevCswfYCw0LxwxNJa+4brPP0a90QLgjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkRqL5M8hvzPV8L1ctYATU8mfaYkzIzI2wUyAqFdee1xGGkNQN
	1ojZ7f4FoN36ij8W3cX+S9Y0bSXGtkp+fArt4wlkc6uuo82szaShzfnzo7+8bqo=
X-Google-Smtp-Source: AGHT+IHPU6nYNwgDM+9I4opxX+G8CARI27qe3xwEGfD9/YcLKJqmhTD/E8EfYj2M4UlFJjONaqKbmA==
X-Received: by 2002:a5d:51c4:0:b0:37d:47e0:45fb with SMTP id ffacd0b85a97d-37efcf060f6mr1389418f8f.21.1729672259340;
        Wed, 23 Oct 2024 01:30:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a58cc2sm8381119f8f.54.2024.10.23.01.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:30:58 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:30:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: raspberrypi: Do some cleanup in probe()
Message-ID: <fff40b7a-20cd-4933-9534-1f72435bded8@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If devm_clk_get() fails then we need to free "cfe" before returning.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 045910de6c57..1da58b07c1d3 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2343,9 +2343,11 @@ static int cfe_probe(struct platform_device *pdev)
 
 	/* TODO: Enable clock only when running. */
 	cfe->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(cfe->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cfe->clk),
-				     "clock not found\n");
+	if (IS_ERR(cfe->clk)) {
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(cfe->clk),
+				    "clock not found\n");
+		goto err_cfe_put;
+	}
 
 	cfe->mdev.dev = &pdev->dev;
 	cfe->mdev.ops = &cfe_media_device_ops;
-- 
2.45.2


