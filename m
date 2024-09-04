Return-Path: <linux-media+bounces-17623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA4496C92F
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3B811C25197
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F17179958;
	Wed,  4 Sep 2024 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKEh1Qwj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31953155730;
	Wed,  4 Sep 2024 21:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484069; cv=none; b=irId6KVbMHZNErwX764JpCSfs0jnCDOgLQKM/qZlImLgofhGG8dnf1+dFGE//I6afLrteryo2IZOjBsOAXxBtebNAl73xn8xGsW7zhIR1YHzIIeey5FmHCk/O2eXMGLmXlguWkQ0qmNZf4daRgk0WpvE3kbSpWaQ+FaRMtmceZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484069; c=relaxed/simple;
	bh=ZShCPWFSW/sqGfuamWtEEwCfgDxJvKsb2CpN+xf6TmM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qnDjbg4bH6eTVJ5DQNX7oB3rldJaR2nGeKJA95k8inw/L6oaQwhW/qg0NRhSRZxiz7q2bl/iZDqW3HCRrwgppHsm5CuXjdj2uUXOuJdzYUQl+trd7XxEGLDiiIeKILrMuaQo+ZE6UhpVwGJwrI5vvIB+9MnAqGPIezrclqkQd9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKEh1Qwj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42bbdf7f860so49602505e9.3;
        Wed, 04 Sep 2024 14:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484066; x=1726088866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bviiKkM7wyJK2q4unJEl7wvx3EhZ5MDlCK2md31apcY=;
        b=SKEh1QwjrNZB0EgB4tcnkGE5+9061I8DgEkkBZgAyRduODZNwxwuqTVoqPZOlVWVdi
         WU1A1ZpVoh4K5D1BiCg/MZEYwTuoWwZCafQzVn0I3F3I4penkJtiLdZSeXhVXV8e0Eff
         YncmKFKvnl7QvCsyDVCXFZYwwbAkMU+rX5bFU2vq8d+kx9+vYpC6NSWFO24VLIkJC9vO
         AxpnXe5N5pMHK0ku6U1vpyWD40BSsthuyRXifRcujnUJWpdh6mXI6OsBYO4ekX4GE7+V
         nyNOrwcM9Byg2XdyUpTbiLDsmxUxDRCGti55EBmBQjX+Hlqln58w5dFleLs9h8LYLwUH
         HIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484066; x=1726088866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bviiKkM7wyJK2q4unJEl7wvx3EhZ5MDlCK2md31apcY=;
        b=AB+ex+poePJrLb1RTasUQ68xATd1RyIFDWhuCP3y8dioXiJybXuSBtXfagRZDLv8mQ
         otozLLPBeo+rKtas+u/ROmjfgPO3BypBEj0oI1vtzYLHt6cy9DWItsacM1KLIEKxJymm
         grLdkuPgDEpbym8CpVzzbMEYtANbVwje9eI9H3+OA0AFGdXKP5ERUHmPY27EY/6vWCkl
         LnWSxZCpZqyyXqApwzlMu7i8EJ4J/oc6Lzd/5r74d5B2q1vavugk/ptFvpb8TimfYebo
         wmRLmggLmza1R5IYMrUVFnl8WN8SbfiI/JMHGUk1Laxd1bjnLNnS0HwnND8HWpKX35I7
         cyew==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8aq7QPqAmPI1b5nXx0bSP1PtwBjJbamD32DbYBopnzbHafCNBOGsPMYGZNqg6PRYvlqEY9kqfDBljtRyDzbyWSw=@vger.kernel.org, AJvYcCXxMQ1hHZE7WSbHh0+AxURNZoSNTvlW88mxnwqwPd4AkBYbQDUUy0QZR36GItXzm1pl/aYcPz9//Ijhpc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZCziY1EWihUMP9I88oGUZOQEPQAF02MRUySaxXEjKybmYOUWK
	zzWgDYkZQHnqH1QQ5kgUfYwQpRx87ILrXfbm5kQaYZxK356F/jHBD4TvqN5Y
X-Google-Smtp-Source: AGHT+IEoXSP87wrRFdk7Ds9PuCqQ6FnuJW8gUgmKIEgIap4lxBZMxsuTOXKY/agSUQrCywIB2nz3Hw==
X-Received: by 2002:a05:600c:1c83:b0:426:5440:8541 with SMTP id 5b1f17b1804b1-42bb01e5f83mr160393635e9.27.1725484066515;
        Wed, 04 Sep 2024 14:07:46 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 03/12] media: i2c: ov5645: Enable runtime PM after v4l2_async_register_subdev()
Date: Wed,  4 Sep 2024 22:07:10 +0100
Message-Id: <20240904210719.52466-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

To simplify the probe error path, enable runtime PM after the
v4l2_async_register_subdev() call.

This change ensures that runtime PM is only enabled once the subdevice
registration is successful, avoiding unnecessary cleanup in the error
path.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index ab3a419df2df..78b86438c798 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1239,18 +1239,17 @@ static int ov5645_probe(struct i2c_client *client)
 		goto power_down;
 	}
 
-	pm_runtime_set_active(dev);
-	pm_runtime_get_noresume(dev);
-	pm_runtime_enable(dev);
-
 	ov5645_init_state(&ov5645->sd, NULL);
 
 	ret = v4l2_async_register_subdev(&ov5645->sd);
 	if (ret < 0) {
 		dev_err(dev, "could not register v4l2 device\n");
-		goto err_pm_runtime;
+		goto power_down;
 	}
 
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
@@ -1258,9 +1257,6 @@ static int ov5645_probe(struct i2c_client *client)
 
 	return 0;
 
-err_pm_runtime:
-	pm_runtime_disable(dev);
-	pm_runtime_put_noidle(dev);
 power_down:
 	ov5645_set_power_off(dev);
 free_entity:
-- 
2.34.1


