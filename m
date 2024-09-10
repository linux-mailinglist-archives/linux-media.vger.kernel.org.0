Return-Path: <linux-media+bounces-18077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD629738F9
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 15:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57249B22C31
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 13:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6A4197A97;
	Tue, 10 Sep 2024 13:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csI4qfwP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A38A193431;
	Tue, 10 Sep 2024 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725975878; cv=none; b=YFp04NBQgqwwcsrNG4n7Aks4fi8FNx8vsZc9Rg6qiI1QANgFzmguBB+apVN11sfebLhL2coaQhqwW8LPD6/Io3btV/Xi40P8VGJl5cnMepNtzOS0Q+1gxPSRtgj2tzcT+voLJj+vzZ6t0qIc+Ux0dCZCrT2awmNth3bBa2mHGsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725975878; c=relaxed/simple;
	bh=KtonDYOXEpp/PwTCf4FJoCSaK6mTCHpUsP0I3lZBfnE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n3K2mODy1r4fXr/eX0NzkbSM6PSZ7IGFiBKRsMzHn+XND3DF9qoSDW7TYu/s7f4cuEE9PnEV6Sbvwu1UBLLj71cqv/CV+X2ExT7i4lkL0HOqStGkwmq3BFuVIIhUPo/07iDxoHp902wI9q5N789lRdtRXbe/4r2swk6syV1SEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csI4qfwP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so448316666b.0;
        Tue, 10 Sep 2024 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725975875; x=1726580675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVE5qf5oEoMqz9tJclveN6/57bRQsuIxIFvelwF+vF0=;
        b=csI4qfwPu5ZF+U3ersI6daZehJQ4h8iB8LhCmSbgrJia/pLgdOOX/soc6n+jsCT9rT
         QaDNMs24Iy+r4fjUJkS874qM+0M6ajbQCDWgjDYR1TOjHsGocmi7eTr23VvQuMj9JOAy
         MzPGDN7S9+5VIlH0NQPnbL7+EgSHfTj8D11/RfS7jBy1Lf4TXl0iJ7R8Rmb0vGmBYUYp
         GYaYXsgmmRQnplSoLu/upFw4L6zP/PpZ5O4qHL+Ov6iY9nSz6JOlKJnbnb0c3ETIOF35
         wCa34AhyKI/CFvhxtYG3FqyS9KQU+zpmDZEnkk4dw0Krj1mdS/bGQzIBWMCkXvviGw2c
         Ic0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725975875; x=1726580675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVE5qf5oEoMqz9tJclveN6/57bRQsuIxIFvelwF+vF0=;
        b=W3wMuizCoy4KFJ0GrutcpTzzxbubNaN3z5owSveIkH7xy7cmPEDF4hzG/tMjLM+ZX7
         FEWeQGixmvuaM9qS0A9bc5a6/IaDNmdQsgarzJeEBBJx6ZUc4aRk2N2huySUm1gMkqjA
         hqz9M06BvEyXcP5YhQfww2Y+m6//dafffW6FEulv1zjPFj9ONAoEBp2QGTdrEt9+5F9z
         acCyuiP6YwAfv4zhlwRo5+aCpBzFuSDUeva3Wq/o2/tuicMCXfZ17yjHwTtQ3fdTBBnT
         6984w2IWlNZ8VS+M6jxDmxpLO/tgAn0zPrl5zzPH4oXkuWt+BwWXK25UsReT5f6+u2rI
         5M9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWotGN7GF5U88uUztvPiNAQiTcdgtXiMQlBa70B58I8WKxfoCqPqIwFKWlsj1NaeVK7D0Kjl3VJxNe1F9c=@vger.kernel.org, AJvYcCWsKJqL1G1mNWpPiMAFVMjGjl/l2Yb+jGoT9hBZxp6ABRSFuIuCgd+nYJA595DuYSMV5D6GUq+WbYehnIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJbifDSR5df8jYGVgRWVsK8PFzmgFaDt6C1jutLfbFB/bThuSD
	1vrZ4RiylQ2JNRBTDZUlKYeLkLQPHVTLEZqMwc8NoyfQn0bXLtxd
X-Google-Smtp-Source: AGHT+IGgmBNn9n7Zz+dl7We6MKzVkjD+lV6mVgqAHaivbtrqUXkPMSc8BfhJpB/KTLPdx8RFDHAEJA==
X-Received: by 2002:a17:907:3e21:b0:a8d:439d:5c3c with SMTP id a640c23a62f3a-a8ffaaad23dmr89543166b.8.1725975874420;
        Tue, 10 Sep 2024 06:44:34 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d65cf6sm481182966b.222.2024.09.10.06.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 06:44:34 -0700 (PDT)
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
Subject: [PATCH 2/2] media: i2c: max96717: add HAS_EVENTS subdev flag
Date: Tue, 10 Sep 2024 15:44:28 +0200
Message-Id: <20240910134428.795273-3-tomm.merciai@gmail.com>
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
 drivers/media/i2c/max96717.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 4e85b8eb1e77..da534999e1ff 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -689,7 +689,8 @@ static int max96717_subdev_init(struct max96717_priv *priv)
 		goto err_free_ctrl;
 	}
 
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &max96717_entity_ops;
 
-- 
2.34.1


