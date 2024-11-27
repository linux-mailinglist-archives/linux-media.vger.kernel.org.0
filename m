Return-Path: <linux-media+bounces-22163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FDD9DA6B5
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1707EB2A3FC
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 11:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEA51F1315;
	Wed, 27 Nov 2024 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="AobZesyZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com [209.85.128.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC62E1EF0AD
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 11:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732706124; cv=none; b=jkaWaQWUyL9lBVBJRbvQI9Iiqf412WipJSg8DZRZ+aSqKdut92MO5d2TD6s+njpW2/ZCdliGjVv0PgpckyMJFtFiXlozGCFjw4MHkXOkX09QQUzJqRHiMg6E5QrRYNRNbVK5ChN62CiQWc6ubxJIv2yu8L/I6zWEjIc7fW1FbBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732706124; c=relaxed/simple;
	bh=6GnAB8AluBnog7NYl4+hJYVAAOZJGkmDUBrswi9xVtY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hy2yXWXIq+9eWWh0s9VUb9NDzehkabapEPUYXINQFkdxgZEOJutzhZu2rSYsxqLV3lZi3G0LIWgtrvdlujEr/Zaga7OXYMtX664YcB1ZJiKq5nBgm5W1epMUeozdNSvq+5575KNu2bkjqdTh6Bm4OOg5crAW1JzEbq5ODoMBQbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=AobZesyZ; arc=none smtp.client-ip=209.85.128.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f99.google.com with SMTP id 5b1f17b1804b1-434a044dce2so33469075e9.2
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 03:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732706121; x=1733310921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8u/tqgNbTDWlnzWRktGlQ9tYzEXbqX8e0KFyaCvDAo=;
        b=AobZesyZ8E7j3C71TYrOJAH7NDf1o5LrcepcRO3w580ZEYfIdebIP1hP/KD409sMJQ
         NfiWVntSB5ezBYpHSgfvJTVL5W8W4b3eylFzL4hCp4dDlhPZnHT5gjTh9IXr5BjZHs6+
         LWdEaVJdSg4lbjuk4lAO4bh1lzdf4Sfh6KrF9kSvQgLf0lHfGo61tepnt9aFoDtSk/dP
         GFxxYjBCUDa1KwRzJk6OhMQipu0x5I5De+oqEZMpCvbX46jUpS/klBappqowMNEz7W2h
         kS/PjpDSibO2uhM6jtcfUVu6/g5TJYnAUcIZIEtikiTOFz5bI3kt/1ITh4b306OLuNu6
         M/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706121; x=1733310921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8u/tqgNbTDWlnzWRktGlQ9tYzEXbqX8e0KFyaCvDAo=;
        b=Gntj64OEKQcwSvpFt0z5OGRF7E0T3XCyjLMRgiTJxIxAq9D6RKWKIh5t4Cgl2rrEQP
         vl9622Zg+CuISqVH5jF2BHHmbBdiiZ60RFmH8k+uVdz+8SbdmcQTIOwX4x+IR/+RIAjm
         71UorK6RuVrBE8IBGOlF+xVeYZvtH5w2LPR5em6KVfj1nr5zO0rCQtHK8RAJ09fRiith
         /CpOhkQyZ4tecwPfivKNhPleJhLl3lOVTiHKTi/6SYAJClFpcFdVYQdKd3gojaikFvs5
         XPaGdlirqh+HF9RYSgg0qhkSK+IpWixFgi1Fvnx2yEd5Um1j/lQoWwjKhbvfNiatwXeR
         JldQ==
X-Gm-Message-State: AOJu0Yzxll782LGGA42jVMwx/D+jiU1u+AlMdooBq6YF4Bo+68JFju7f
	AzoG+oEQPv3XQHQbwYw8BxnYK8LPrCW2ah7N2wOfy5L8FqRAkIHMnec+5e2iNZzHCuFGX6im/kk
	D9RP96Y3lxSJFDKa5hJu/mPzavIzgnyrk
X-Gm-Gg: ASbGncuRskbK06sTixMHpJjzLK5b1N/d5nJ8xzh1FrDUCH9r+kFS7OAvCH/w2+gLPTY
	Jaho8bjTtJg6SVEprPyu5K+KssgulrMAZn1++ZZ9nt7rrgihFU8VEhDIG+vxyyK+e3vNfcdDCf1
	WRohDOGpK2ZDbL9D62rLmDwvn0sAEG8g78xaLYFFiYGHKLCu6Er1og6YSZRar1uFNf+4G1Flc3u
	WqWMecqmlJGuUwa1oFnqi7jfV67v3mRXNjQSZU4xW2lKwpzSASZy4gW5R0LIaDVGA==
X-Google-Smtp-Source: AGHT+IF6UYuhlMZWwu6G6XRnHvnHedKpIlZ7ngLVPHb1A9KO+apfgpcWvh597QK+I/YFytjWK0k3yOJSuLhK
X-Received: by 2002:a05:6000:389:b0:381:d890:b5b7 with SMTP id ffacd0b85a97d-385c6edd314mr2620035f8f.52.1732706121160;
        Wed, 27 Nov 2024 03:15:21 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id ffacd0b85a97d-3825fbee19dsm441144f8f.82.2024.11.27.03.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:15:21 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v2 3/4] drivers: media: bcm2835-unicam: Disable trigger mode operation
Date: Wed, 27 Nov 2024 11:15:14 +0000
Message-Id: <20241127111515.565992-4-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127111515.565992-1-naush@raspberrypi.com>
References: <20241127111515.565992-1-naush@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The imx219/imx708 sensors frequently generate a single corrupt frame
(image or embedded data) when the sensor first starts. This can either
be a missing line, or invalid samples within the line. This only occurrs
using the upstream Unicam kernel driver.

Disabling trigger mode elimiates this corruption. Since trigger mode is
a legacy feature copied from the firmware driver and not expected to be
needed, remove it. Tested on the Raspberry Pi cameras and shows no ill
effects.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index d573d4d89881..550eb1b064f1 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -834,11 +834,6 @@ static irqreturn_t unicam_isr(int irq, void *dev)
 		}
 	}
 
-	if (unicam_reg_read(unicam, UNICAM_ICTL) & UNICAM_FCM) {
-		/* Switch out of trigger mode if selected */
-		unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
-		unicam_reg_write_field(unicam, UNICAM_ICTL, 0, UNICAM_FCM);
-	}
 	return IRQ_HANDLED;
 }
 
@@ -1002,8 +997,7 @@ static void unicam_start_rx(struct unicam_device *unicam,
 
 	unicam_reg_write_field(unicam, UNICAM_ANA, 0, UNICAM_DDL);
 
-	/* Always start in trigger frame capture mode (UNICAM_FCM set) */
-	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_FCM | UNICAM_IBOB;
+	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_IBOB;
 	line_int_freq = max(fmt->height >> 2, 128);
 	unicam_set_field(&val, line_int_freq, UNICAM_LCIE_MASK);
 	unicam_reg_write(unicam, UNICAM_ICTL, val);
-- 
2.34.1


