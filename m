Return-Path: <linux-media+bounces-17625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AF096C936
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53EBD1C2486E
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B595E186610;
	Wed,  4 Sep 2024 21:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwiWTeu/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8245517ADE3;
	Wed,  4 Sep 2024 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484072; cv=none; b=sNfZ6z4HEELwcYp6a8IyxTi+7IIw4iCVrgnTeJzitqe85wgilrdRqc5MYci8sLk4TVUL0TbPVbwwob1EeszQULhdzl+7KlBGqgCO525Vm7NtYUGvLe30HdhwcNIqYGBmvCfMoWUMu3pk2gEP2mNEXPUJEpRjE94zxK+YTWoXC8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484072; c=relaxed/simple;
	bh=Kiv17uNGthDImT4AMacEgbQWK5UrKLL4azvkUaL16aU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cc7oa+06S6f9V5ylA2FOxPxYIgpGAEUPzS1v3hDSDQFOj0V/1btzt1BPHPxBCO13BrMi/VNRbQQpAb54wGNXfFT4ZWPF2pBjZK80gyvbPUn1pybCgY1hN3EKRC/8yn4qPxWGm1zZ0YdY3ogEV5KN07aB4Z55zsytlNLjze0ZIqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwiWTeu/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42c7a384b18so38409315e9.0;
        Wed, 04 Sep 2024 14:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484069; x=1726088869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbuGE6Z/iK7gyKdugxbHWm8tH5fwf4V7+4tVK51cDIA=;
        b=jwiWTeu//CaIkc2E0PoXRakN+zvI52qVnwz4Bhwuqsfg1jMWWOLkNPo5n/82Cq4sje
         XPmwf9VGty05HZ+tpkY7rXaU2oySB4+M1eIEnbqrlKfQz+2WxK/CExMMC5cnTHa6ml2F
         u7CoKmNWLqyodP9AggOXOBNq+SemasTFgHVId4TObfIDUxb4T4RspFOCuOM9VTJpq7Bd
         wVfC33AT320atjueAWFKz6QzRLRKyF0gzmw75YKpaH/W5NWulbqur2CuzUmoMf5hyOTr
         fmfcAdPOPV52R8gy1I/0ZETIvyTiI3P1nGos6Obi2L+Tqz3/v0Xa/Jex0Ijh8mOsAdto
         mKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484069; x=1726088869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbuGE6Z/iK7gyKdugxbHWm8tH5fwf4V7+4tVK51cDIA=;
        b=aSkCfsGFA02N0LzlVPflBRbhBhy/4vBxwdVPEaVBhoyx/h56D9oJoxtEgaobfd6V+N
         92TLEYOqUQ1t0fJv3THo9lUPolVFmw034dPPTSxhFXP2YJ4V8B3aewh7SZstRlDXAhiX
         P9HqDu2nJVpdqi+lTFEnAZX5wuuXsdAWUPdbXWlmMn8mymuJ/vLdKlPpiMhfGg+8iDOr
         cq2i2oMZhnuW0ogA5/UhWoWCkofg8xH0RH9HgMd2QHpaNGiT1VSfzdP6RNqHf3QPht7O
         mD3SRl9xzYd54PtF+28oj4bCOcgMmKl2b+NI0k2QqVRE1d0xITzOM2SId3E7HnXhvsPO
         66NQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4v4vllz/5GaOrg0rHkWVa5cd/px9WhYhIInq1rKLf9Ji2y4lit2OclnxMGJScBPDTDA5zaZFqdk3eJYarV+dxb7I=@vger.kernel.org, AJvYcCXhC+BVgZjJhBVzuXFcCvY1H3GlC2onU/zhtxZnQXGD+6ZEr9kDRQDsTZkef7fjgdZIlpSdKoML8hoth1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmpLIkrT7ZxHrhUK8P67a5O+Q+Wasmy/r7w2C2aq83o4VOmTaC
	voZcOH3OY0FFQ4d/cyyKs5fSF3iegKG4us2anaum2ZwcP+Yqp/ye
X-Google-Smtp-Source: AGHT+IFfoLmN74tHSM1gS2e0hyRY3c4mok1G+mSB4+mlKuPUEVTrGwadMKpokwpNQfXY+mm+ZgMGkA==
X-Received: by 2002:a05:600c:3146:b0:428:16a0:1c3f with SMTP id 5b1f17b1804b1-42be48faa09mr124645185e9.32.1725484068909;
        Wed, 04 Sep 2024 14:07:48 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:48 -0700 (PDT)
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
Subject: [RFC PATCH 05/12] media: i2c: ov5645: Use v4l2_async_register_subdev_sensor()
Date: Wed,  4 Sep 2024 22:07:12 +0100
Message-Id: <20240904210719.52466-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


