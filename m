Return-Path: <linux-media+bounces-26279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1EBA39D1F
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 14:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 187B816F730
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 13:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BF5269AF7;
	Tue, 18 Feb 2025 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SfuWBYV0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CFB26981D
	for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883958; cv=none; b=hoQj4htAkfaBiSba8m7gpcYgPryljCKX7xrgNou3cqNg3f46ccRu0OBMURjZjZddY7WsjRxw53mYJYRkDucdLJ4TcQ5G014DQzQXWExZygN/juWFMuANp8Ub772rIDIGzZwo1TLIuARHqp39Q7Na+c2F62cNfg20leNS30E8qXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883958; c=relaxed/simple;
	bh=4qkh8yLy8dDdZM21T9lsKyPTqQzhKGIVigwfv4cqQ2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N7O3TWqW7ZBYbb5EgRMfizODjSBfYcHOiXvRBKQW0rTDWxWIFPNsF8YNNfFfkf3aUm7WpJikImbu0vemr35ZX1CF0KyEyfhpEM0Mfo/zrpBxePaCwlgM9f4bqe13Rqnw2WAdbMnKptHKPJKlY7BeXv1OPRlcEJ+UmYpvA8DRaJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SfuWBYV0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaecf50578eso1052457766b.2
        for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 05:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739883955; x=1740488755; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kasHUX4bzeiCrVBmf7mcD2rXkVNVkykZ6gjvVSR3ULQ=;
        b=SfuWBYV0e6WFQq9q6DWaRHs/D5VVlhArm4iAsWWis9S4c+B9STONknQ5vwHbX72XHK
         A24MtlGLOISPMGcoX50Z+GkIgI/CWynSiHxOxNBUIamyUs7QoBMwf3822Ayj7evV0VFK
         gw51z18ADrNYGjdZHHTyO7bZr2ua7FLKOfKS2EgX4wdjePcm7cxCIIOZ7VtGy2mJ7wWs
         ydsNRX6MpmBvMeQwlz/Zvo20fOm8P3Oc3tvs9t/0WvuZlB2sX8/kDmcSIYHXBrBF8ewb
         E3wRtC7clgMxSu++ZpIkmCEOiGOsIjkE/grgOJrpl4utZl385xMeBARkMPzrFd4KPxjv
         Acew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739883955; x=1740488755;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kasHUX4bzeiCrVBmf7mcD2rXkVNVkykZ6gjvVSR3ULQ=;
        b=N0np3DswLOZFOR1LVU5And4h366GkUiUbzyEDckqMRMfIRvKJVvUpFt/TFka0mdTOy
         aIKVK3mLdvVdmG0oEigwtLe7/y/Belof/Edz78ocEijjm+kfQNJQAB2rxXEPxglZpoNL
         qWgMxjA6EsC1hvlr8NISfL8t2wrqOoCVP7PpxXnr4rGF5HAUWMqnDUH8Lm2emr5hp+f2
         RzimYBArPzy/jUnFVeSQCpLs6xvf0U4JBdQVxVT8P5mtm6ZxHfFf3LWr9WwWXWXcldrY
         aPSNKGfZQX+DMCCw8hGcGcu2ad3Xv+3LKO1/MYbgNGqOGqhs0w7OsbBe/7DDpsRn0q5+
         a+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUV+E6qFBc0UnOiyhjj23Gy8HF2vUD8jbF8mgjrV9tJKoTfZsZQU2T95Wm4vH2EuBvrrvu1wBCbmIbKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0D3bUnORLiIoJ6gcgvScpiC9VszYIovgiwDMg/T843K2tD4uf
	g1JO5QNROScWBbUiIGV2LJ5xc+pqLLfA3Yj/qHgAz0bVRxrGeb2TBtzFuK1gho8=
X-Gm-Gg: ASbGncuY+o3h3OuDmn82zTWjoUBFIF00S4lmikub6HDOcEsJjRQP974TFhbGx1Mr6o7
	qlCRNB6qKSYaq33rQSyHi/5LvDWCL3wmhBbr0HshMy0UAj3UGvq3BnilkfAPym24f1erPYFxNtI
	Stg12LnwyYk75/JQSg2K2/VKKU2abUIoSXHYixJJY0xR7mySDeSqTxpP0ys+JjdvZMC92KepDvr
	t1BtdYOeDohyqiicXRwVrh/iQdfgm2i1/Wi2WHicRyLI/6malPZEy97AarUWp/QF6Rj0BSdi9vI
	OcEbzpv90V73TMwp8ROH
X-Google-Smtp-Source: AGHT+IF2qeAel4OTdeuho/BN/9zq3dRQjnmGfMFgYzkqOj53acAaPZ+YeAFgAYZN9+aL4nEgHblvKA==
X-Received: by 2002:a17:907:1c21:b0:ab7:faca:a323 with SMTP id a640c23a62f3a-abb70d677c5mr1438999266b.39.1739883954756;
        Tue, 18 Feb 2025 05:05:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abba9bd6e3asm261505566b.58.2025.02.18.05.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 05:05:54 -0800 (PST)
Date: Tue, 18 Feb 2025 16:05:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: i2c: imx214: Fix uninitialized variable in
 imx214_set_ctrl()
Message-ID: <1e4da85e-b975-4638-bd14-09ba0675d9d6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

You can't pass uninitialized "ret" variables to cci_write().  It has to
start as zero.

Fixes: 4f0aeba4f155 ("media: i2c: imx214: Convert to CCI register access helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/i2c/imx214.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 6c3f6f3c8b1f..68775ee8256e 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -795,7 +795,7 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 					     struct imx214, ctrls);
 	const struct v4l2_mbus_framefmt *format = NULL;
 	struct v4l2_subdev_state *state;
-	int ret;
+	int ret = 0;
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
-- 
2.47.2


