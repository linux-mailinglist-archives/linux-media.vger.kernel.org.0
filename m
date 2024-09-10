Return-Path: <linux-media+bounces-18076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC629738F6
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 15:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BB582882C6
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 13:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93F319309D;
	Tue, 10 Sep 2024 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFL29ft0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A0E192B9F;
	Tue, 10 Sep 2024 13:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725975876; cv=none; b=hB8ni817il2Y6R4DTA47Xa9JQ1RlX8Kcso95Q8YrVXZ6UQ5JY2IGvDQO+Crts/j5hPmiLGMn0d2Q8l0cjQa9fNWcCnAS5pfmR7pfyv7Xyep+PFiD62MIHDjfG9Bn0IeE0jLhcJzcKv/tjBq6qAixKKaozbaL4iRqp+hmfnheWLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725975876; c=relaxed/simple;
	bh=gJ2iGBT8m0+22dXvfS8aPrz1Cy1xiIyCwevFtI0pX9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rZ4Avx88fDr5+NNaXwJ4VWM/OSwSSeu/wziHSOSXEVet2M6bPqGL5GYGlPdNeiB9RgPt1EEYmcu/ptH5V+YiTd9uzkBYGfL8ZMihg1ADPqqXh1w7GvXWZB/j66hDBusWABwtzgzl8hk+wYsMGzUFYwP6xV6ZuUCSDyG7kRqLDCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFL29ft0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d4093722bso445959566b.0;
        Tue, 10 Sep 2024 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725975873; x=1726580673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZK5/fPfxbHWHBEamEKmYQ8aw1Jaskmo2Su7MAgVeEI=;
        b=lFL29ft0z2Sb6uipidyKbo2LSUE8+1xEU3mjPkh7prQvFM8tBo3klJGuOjElRSB9db
         IxgTnohIlRqn+q7g8V7hokYoXnTNZIqIwzDJH8egoruKmhmagyTpCXKcM2d8jX1m50Sl
         4AuDWom+sjfh2DiDC9fJ1QI54APAar58tCgsypyLnA1Htfezp1jhZ14hxwv6fTrJECLD
         xDN96eoZ3YijmztVqbK+XZXrWvXY63sYMbH83r5aNy2ouP8Mo7bUBnLYD2Vn4w3jMWk3
         DLu8/YHymkcOaI3828lcKoLtE6uM9yGDSZYxatIG20CHXrfT3DBJSCATRnbNbQ/88vPL
         dBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725975873; x=1726580673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZK5/fPfxbHWHBEamEKmYQ8aw1Jaskmo2Su7MAgVeEI=;
        b=PVC2KDs806KR259gJsA/mAPCO2BlQk+KP3Z78tDSq3B4FsyOQ66HgAZ3EWK4xQGAnk
         JIRADPWd06dtxgFDx6nPu4xJiDPj0ZHmlTmH+0xkX+UdOOSTPoHkYS6c/ZE0l0mldqnG
         3eQ70+HZjPECWTN96AlCr+tXmd4pyKdMkAuzORIl5j2nFKWx/iRNHKZih7a6JPFG9zEy
         iuYR5tEVZlFlQXruNKDo6runCPlBaa5y/FWv06VxYZtMQcB9APCuJewlS7w6W6bFLCgX
         E2+5R8ht+1ceDzYPjlpPQSgK0G5arBeM5PrWIV5yiyrj9hQZ+w6yIdcczkbzw2D5l8a2
         MBrw==
X-Forwarded-Encrypted: i=1; AJvYcCVDRAAYVsp9r4dONXZP3GF9bZrGApvMAOcxpXwTMCCX1YB2/EelPeTadjJqhMnmNUoxFMPGS+qV2z9GpWM=@vger.kernel.org, AJvYcCVy6PYXaV14yUtB+wZOoj8kDJcPauHq3rlqTkSR8MboMk54KW6f2BfOwIt+8UrJP4kCGaSfsTA5zWEWZPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YznN3Yw/WEqEp0vIUDseNhX+due4thwXbtVq42sfPPwd0t+QEYu
	tHYE+QwSOjQT++sKoff5WHrCVdRRjk/I0Lyvg2XA+iv81CQLzOoj
X-Google-Smtp-Source: AGHT+IH8B8jBz9MxEl/6FhMVxHYtYlQFkVC4GUntY3K+xvxZRaHU6kME/QADkZKs0eC65BKtg43WNA==
X-Received: by 2002:a17:906:7953:b0:a8a:53fb:d571 with SMTP id a640c23a62f3a-a8ffaaad13cmr86740166b.11.1725975872892;
        Tue, 10 Sep 2024 06:44:32 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d65cf6sm481182966b.222.2024.09.10.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 06:44:31 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: max96714: add HAS_EVENTS subdev flag
Date: Tue, 10 Sep 2024 15:44:27 +0200
Message-Id: <20240910134428.795273-2-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910134428.795273-1-tomm.merciai@gmail.com>
References: <20240910134428.795273-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Controls can be exposed to userspace via a v4l-subdevX device, and
userspace has to be able to subscribe to control events so that it is
notified when the control changes value. Add missing HAS_EVENTS flag.

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/max96714.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index 159753b13777..94b1bc000e48 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -602,7 +602,8 @@ static int max96714_create_subdev(struct max96714_priv *priv)
 		goto err_free_ctrl;
 	}
 
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &max96714_entity_ops;
 
-- 
2.34.1


