Return-Path: <linux-media+bounces-18096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318D973E24
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A16301C24B94
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B331A4F23;
	Tue, 10 Sep 2024 17:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMmuvmh5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C881A4AA4;
	Tue, 10 Sep 2024 17:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987987; cv=none; b=AskC60uLPyXxYY73KnVnQ+47bumebL4RzcZYJglZq2Ji9Ev9otoV2d/x1IfasbKHjxakhhXy9G5Ado7a6R2FCEiZoihpi23t1MZzuegDLpimpMANav0CZH3Ko+f3pGTPkxqIpnwiF8DGd789sPxGQfKW65ysmopp0mA079dRJoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987987; c=relaxed/simple;
	bh=Kiv17uNGthDImT4AMacEgbQWK5UrKLL4azvkUaL16aU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rn7chlPzts/kgCN+Q19c2726LpS3tTXQ5vS50E/sTiOtA9SDrX4cO07M57b80tetwMTH2CySFAMytqduKiGjb+mK6tJKtcyVXztquwkAKXGlXja4VOkhMcpDienybHXMa3vbgZQUV4TG1MJUEaHntxqmirv4dows+6+09WcqZhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMmuvmh5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cbc22e1c4so14730275e9.2;
        Tue, 10 Sep 2024 10:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987983; x=1726592783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbuGE6Z/iK7gyKdugxbHWm8tH5fwf4V7+4tVK51cDIA=;
        b=TMmuvmh5i2h7e5LHsUI3ybin8e32LMFCqm1qeiAvnHaCZLp8OGqEArLcvFiA51QT13
         CLvmYOZ00t9SUZsyqXa7ERtXtHoYrYdQ5cqfKmVNXLfccU6jJXZpt4R8A4M6q7eJbByu
         obOWPl1LdUhELEN6Wep5Np8y1AMvnlxv5DgaO++FOPtUcA3TFfxP2BY5hfLbnoiWhW4T
         4mq1HOXusDeH0h9YOGC1GsOXR8s3kNNOTPO/MmnQZSRi5N7M5ryJGhIjafITgIMIgNv8
         fML3cSOI4kLBB/P3Nsn3NtNQ1cNfie6E26A2B2Ia/2sBorrnIO3uIJa6SBTtSE1D8h05
         9ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987983; x=1726592783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbuGE6Z/iK7gyKdugxbHWm8tH5fwf4V7+4tVK51cDIA=;
        b=gPOa8w9fMB/ip8GUTasf7ROsAA2kuLXtFI4+su42EBLYT0jBors/UwvzLiYf3jxXh0
         +pbXFAp2baFoWSPOHiDzTIPI2SFcvDuk2vEULCKdl0IdVwQ40sk01iWiamZpBgAAuALt
         XYlzsy6WA8p+r4IIXqLx+yBbB9sVQEwoGbFZ04FayODvXDYP92Ghb+fbHYlDQdleX5Za
         pyTLH5+FAVV247LLyIANUWuZZhEVD/Sghr1992+RrMmh0MlltLloTWNp5Fd5htQ9MHXs
         8DqzHq1xQLs3aRKLqkSiOEBp9wk4X73FLimvp6dJX0/lC4Sxnv+yfWh6l1sRWXx6E15G
         G4OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuhwtxBnEGOmSrKoSvrd7V/DfWWkefOxtWDcWouumN5rfJoTWzqIcn0/Th+f1sSTd7OkmeHh4o2V+r2Ls=@vger.kernel.org, AJvYcCXjqzUdEB38y6eNdrUcJ78xZqeF2A2v5I9ilPnWDsoYQolcRffXMIL9wuGQUEAN45qEnp4gQqIOZ034+ZDcIyL+PMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqB0b6AZxVyTYknsMpGDy/G9sq3ebtSx4luMGmcY5LHhyf/Cnx
	VmNsGstOL3DITFln9hVSdJW2efSqmWQq+CAF4rhAxZ+pU3pSuMj9
X-Google-Smtp-Source: AGHT+IEswm6La4EzEWhNFU2RPVCnYzqnXEXKsbo6y5trocbjO7FWGhqWOfirTDT+flFELtTsIALGDQ==
X-Received: by 2002:a05:600c:1c03:b0:428:36e:be59 with SMTP id 5b1f17b1804b1-42cae70f2b9mr82363625e9.11.1725987983481;
        Tue, 10 Sep 2024 10:06:23 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de4b9sm9438925f8f.111.2024.09.10.10.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:06:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 05/11] media: i2c: ov5645: Use v4l2_async_register_subdev_sensor()
Date: Tue, 10 Sep 2024 18:06:04 +0100
Message-Id: <20240910170610.226189-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make use v4l2_async_register_subdev_sensor() helper to register
the subdev.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 9e6ff1f1b9ac..45687d004004 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1223,7 +1223,7 @@ static int ov5645_probe(struct i2c_client *client)
 
 	ov5645_init_state(&ov5645->sd, NULL);
 
-	ret = v4l2_async_register_subdev(&ov5645->sd);
+	ret = v4l2_async_register_subdev_sensor(&ov5645->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "could not register v4l2 device\n");
 		goto power_down;
-- 
2.34.1


