Return-Path: <linux-media+bounces-995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE2F7F80BF
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 19:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 091D21C2161E
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 18:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A0C33CC7;
	Fri, 24 Nov 2023 18:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ek20PJmB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B72A1BCE;
	Fri, 24 Nov 2023 10:49:18 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-548a2c20f50so3062059a12.1;
        Fri, 24 Nov 2023 10:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700851757; x=1701456557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFy/9Swy0nVL292Sr+H5OQDTykZcfrct9MdwEGt+ZX8=;
        b=ek20PJmBhPDFhu9z/MpOV1Vaq2zIt8YMe+dq1kTrPHPIfsFVlJ68mh+oWQxRCiV6Ee
         GIgFZbZ3RGAMvtKBrVsB+YlwiK98G7xg/hTf5DuBTwcMbzXUR6idljJELhbPZj1ztS45
         D+FkPgbXRDtMER3F09Ox83AQhsvzpRJBs2MiOLfRU92TOUSJQ3XO0nkBns6ztGUv7Zbr
         TlO0sTHHd/52puU2sEM949r0esqKYqvU+25Su1Q8B5GKoiXWu/olNtw+RtOvXHcbyzhH
         srzddvLQ/TvRCgWWqarYOYCPxbmYJ+P9x6fs/NIjvUqMUTDIG6hz6Q4r1VEsLaBldMVa
         Zw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700851757; x=1701456557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFy/9Swy0nVL292Sr+H5OQDTykZcfrct9MdwEGt+ZX8=;
        b=qQH2nAvkQROzX8O6DvFJK4Pk1gdis1TN9pli78mKN8yAv6oQ4I9eIzucoAw/bUb0sw
         4fJfu/jj3EtPPZljTVqjwNcCbXCiy6TIHCQitn2i8BLj8T3XAFbfMZzyPveRMRbQPuZw
         g6yxSy4iBf7/h2dnQDbGJvkXnUbOQDNo0gl43kY29j9+utQMO0oIiJXslW3l1gvN15VR
         9crsxuUWz2UbJWY2aYv860ptMYwI6M8ElDtYJhdIhLoJ4frqOgY1a0Tjx2gYrVjKYHs4
         TpV1/9R1BqljGcxm4r8O22JjB1eAStRbHgk3lkTsHzrtAW6vVQOXlQWij+mi+sA35bjd
         r1Hg==
X-Gm-Message-State: AOJu0YzxEzCEMy8OWe3ZZl82wcVQzKifxguegDZT4MeUFd1iL4EJ428X
	/2wUeid0wdTswXNtOlNXEeBX+4dg9WI=
X-Google-Smtp-Source: AGHT+IEAzF1fbt8ouA4LKE2Woe0cjgW5E5MlrK+5YdnokLIt7m9eZzR2YgjWCzDWn8qBpVxA3z9rWg==
X-Received: by 2002:a17:907:3ac2:b0:9c7:5a14:ecf2 with SMTP id fi2-20020a1709073ac200b009c75a14ecf2mr2498318ejc.56.1700851756476;
        Fri, 24 Nov 2023 10:49:16 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-2-39-142-131.cust.vodafonedsl.it. [2.39.142.131])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906080800b009fdc15b5304sm2385388ejd.102.2023.11.24.10.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 10:49:16 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	laurent.pinchart@ideasonboard.com,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: ov5640: add missing v4l2_subdev_init_finalize
Date: Fri, 24 Nov 2023 19:49:13 +0100
Message-Id: <20231124184913.2574925-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the ov5640 configurations steps let's add v4l2_subdev_init_finalize
that finalizes the initialization of the subdevice.

References:
 - https://linuxtv.org/downloads/v4l-dvb-apis/driver-api/v4l2-subdev.html

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/ov5640.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 3f79a3b77044..338eea802ab8 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3924,6 +3924,12 @@ static int ov5640_probe(struct i2c_client *client)
 	if (ret)
 		goto entity_cleanup;
 
+	ret = v4l2_subdev_init_finalize(&sensor->sd);
+	if (ret < 0) {
+		dev_err(dev, "subdev init error: %d\n", ret);
+		goto entity_cleanup;
+	}
+
 	ret = ov5640_sensor_resume(dev);
 	if (ret) {
 		dev_err(dev, "failed to power on\n");
-- 
2.34.1


