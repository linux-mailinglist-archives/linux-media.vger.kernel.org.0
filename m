Return-Path: <linux-media+bounces-38612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC897B148DB
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 09:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01F83188305F
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 07:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F5A25D216;
	Tue, 29 Jul 2025 07:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rn0SQqDd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64486290F;
	Tue, 29 Jul 2025 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753772459; cv=none; b=Yc50de+nu+KsuhjhDtc8EkpypLCAguUQBeeF3NSTdmGgbbt1TbYjS6E7H016Lpu/mWy93HBAlCu2/bsFh/tjiSIVGmw524IbLVxXMpNeDo+jgmQT8+A8CRkxV7FR4OMIFuH0cAJgf40328Zpyq48Xkj7YMjAehV15k1PDIWoKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753772459; c=relaxed/simple;
	bh=4zir6EZFKxTAw5jAMxPZ3bM9r0SW/RrUbrbCmKXQq7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NllnLQHhrG7zBEiyMPaEJhHk70AN0hHlizo4hRXfSEO1TkGM3ODYvx8Pvy2lO7DVMco03bn+c7iQugdaWLNK4vd08LF8gx/0ZKCTQBzo5HusBJJi9acg1ZnT+o56DtHxb484XyZtJX9j/Ydnays0djBTPH24s8qcn8yJyRMDh8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rn0SQqDd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so31535555e9.1;
        Tue, 29 Jul 2025 00:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753772456; x=1754377256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttNeMXJ7C0/yz0Q1cFAKO+GXt2M48g6T6K0pnZ0/AhI=;
        b=Rn0SQqDddBtHqCrF15Fjk/DqDsOqa2N+YRWWVbXOED2j5SGBGr5JKrG/CcoD1lbYsw
         PEbUl2n3FrE7tX/J/qKazDykOFCczqCSCMhQGKFZTVNIXsSRUqzbOSORNyloF6a/FKr8
         65N7S23zSqfcvIg638DvW0f83hi3m+CvxJl6cm5aNAoX5n40zbJ2rsHELHf3H9gtCt16
         oeYik4jj75oXaTZk3K0+Q/ZTavGf0khwyI/KrGwx52R1wSNFbn79hhcWdI48qCtzwO/e
         SpJUJDBw3eQ+qZcdRLMkAGHTQpRagAMD0wHf7RHz5iO/Mu6xDIM3IOgTBSBygQcePGWU
         veCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753772456; x=1754377256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttNeMXJ7C0/yz0Q1cFAKO+GXt2M48g6T6K0pnZ0/AhI=;
        b=YpEGpkXtInTB37mQ+OD1ocrsys9vd9w4M0F6u+uoRWgRvt+syMYOeP55I10+UoE0RC
         yqQze93Coc8dx3pdqbK7VXRvRBO7NpEKEeKnhdrdx62/tAJC7hxx01KxlisXAcVbCaqI
         m2j/QKQXB5BiNctaEVcMJAcOknePKr0wf3RIQZAOMwain9hdYlFr/f3PYET1aKF4kYA3
         wPo8n+xF7iKrpPN1q0DHfTx444JueVZJBA6ZEeaQ+RdhKwLQePCHdA/UtU47ZDB0NkYt
         Kxyw8lBhD1Ph5gfg/7dN3zWd54k3R5R0JWs+zQlSsAqylufYkHA5HOtSnR/WDgtINb9h
         CU+A==
X-Forwarded-Encrypted: i=1; AJvYcCUS8AE8EGIy8d9ucQZ0vGGNStxWSw9Q3AvnMYFIx7pcrQTIJowx/b4IlS/03GMhCGYhWUFSGRSeaOs+1dM=@vger.kernel.org, AJvYcCUjdhzIWF11wapgR2V/8tWsnI7mWi9a4Ke1JtPMF3gRYuAP91UqCXz0m0JFxvYh+2EjcykypMFt+oGwllk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr7MsQReHdUIYaE9Sav4p+iYg+4t8krcuueQL31m4Sg9+4n059
	dRYGLp4dj0rAq7mQeHctdK+alsR7kgxH5xQY+S2IZJla/0CahazWzbGT
X-Gm-Gg: ASbGncshw3/vnUrOMelX5HUpxDdMpN3obdEmZyewOCMzQmMFxMhqnOPwGxBBrYi9jSg
	TpQfi8NI2ioJOY3Z5N8oxZvmxGwQYisYgJc1oovnYTPwU4TnK9VkAyQzjz1WvC8ek3xWdBeJd0F
	jGmI0H5rnqur7V3cHFdfN2d5lL5Q+dfSZ73H0ln2sFRikZA34q0pwS+rd94vZ6As/NaqOBMMJiJ
	2JcGcC7IvuEkqAZuNcoD/00NkfLjnlVkXSy9VyNiCQkyEWtGYRlcAr7aa7/W1qkPARU+jQxxM2f
	KCe0QJ6OA1l210dUtgatdg99zXde0t+SuXhGS3Yj0GfsnnU2QXtJXhJah5GviIhjasoTEfF6fMS
	Ef6Sazrpzr57cq6XtaQ44
X-Google-Smtp-Source: AGHT+IGF3754rBDu14/bYmKAnzfiy/mo2VV5nBc+fe9fTEAHSBar23LpWafsxPoAvG1Ah6venOuKlg==
X-Received: by 2002:a05:600c:518d:b0:456:24aa:9586 with SMTP id 5b1f17b1804b1-45876449ee6mr91588465e9.21.1753772455275;
        Tue, 29 Jul 2025 00:00:55 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b778f034a6sm11271145f8f.47.2025.07.29.00.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 00:00:54 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5648: make read-only arrays regs and values static const
Date: Tue, 29 Jul 2025 08:00:21 +0100
Message-ID: <20250729070021.1659848-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only arrays regs and values on the stack at run
time, instead make them static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/i2c/ov5648.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 4b86d2631bd1..02bfb948e2fb 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -1061,8 +1061,8 @@ static int ov5648_sw_standby(struct ov5648_sensor *sensor, int standby)
 
 static int ov5648_chip_id_check(struct ov5648_sensor *sensor)
 {
-	u16 regs[] = { OV5648_CHIP_ID_H_REG, OV5648_CHIP_ID_L_REG };
-	u8 values[] = { OV5648_CHIP_ID_H_VALUE, OV5648_CHIP_ID_L_VALUE };
+	static const u16 regs[] = { OV5648_CHIP_ID_H_REG, OV5648_CHIP_ID_L_REG };
+	static const u8 values[] = { OV5648_CHIP_ID_H_VALUE, OV5648_CHIP_ID_L_VALUE };
 	unsigned int i;
 	u8 value;
 	int ret;
-- 
2.50.0


