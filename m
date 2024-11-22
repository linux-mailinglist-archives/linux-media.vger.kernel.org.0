Return-Path: <linux-media+bounces-21793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3999D5B2C
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22ABD1F22DCE
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 08:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10C61BD4EB;
	Fri, 22 Nov 2024 08:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="goSbbh1t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f98.google.com (mail-lf1-f98.google.com [209.85.167.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D5118A6C8
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732264929; cv=none; b=I0+vT7IHEseavgffWgAxw1l79sHV61gRO02X/+dKVeFnF/j6LG9npadalbMi2evWVkt6R9PdG8AymcUdJX0bbHEsYbQMP/ias1AO0Hed6OjCRHsM7VbpeGAAXeoJDZkRZGiGHwm1Vehj0iofEoNiXFyGFSoiaiEnn+1QsSRa2tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732264929; c=relaxed/simple;
	bh=dGEolcwuEISeHo+7O9hBTplgIF/4B00JAkeGfZf51eU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mpNdp0+WwxpjZ1/s8Jd6lBH4u429i3Gz35r2YPl26oY6l1P+MsDgdhULjLv9lqiICcKYD9TwkpjhLPKPQTjTWXI4bIhCBW2sxKExI5kQFWukLYGfVcak5Wsl1VtCji2q3sjtJj3PyKq9ch5DHuo7bSZJ2zx9xoYlny1N88+Frr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=goSbbh1t; arc=none smtp.client-ip=209.85.167.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-lf1-f98.google.com with SMTP id 2adb3069b0e04-53da3545908so2125542e87.1
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 00:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732264925; x=1732869725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxccnoYuwLE+PxJ9V2hHsdBypkFSFevlZOlX7TLkWt4=;
        b=goSbbh1tLBnWRD3/jZ6Adt82mkxSV4ieZlhqi8X6Th5r0f0T3rjyJ+nEUThBiEYA6M
         O4fqMwjZeoaiBESsyCDl3XmIyxz/tsD4T4AgZcBGBAZLVTNajISLSX52/pt0qs0YfZLs
         1mj21miLULW+/UXIao8zo7YmUz1k7VwLh3dfZNUrCADOr0eOB/Nrrfb7ZBakVL1GbWv3
         fgUbsuZZFoloJnErOXPOYS/WdjL3XmxMJH4Ytl2NMHgUuo/dnOD8NvqYCXhmsylqCg5I
         Rqwqze9DY+tjHiwlIV75KK7Fg4Vrmz383BGKueml6zUU7kLYeMmj3TMmvLh4l7kahh1H
         8D8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732264925; x=1732869725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxccnoYuwLE+PxJ9V2hHsdBypkFSFevlZOlX7TLkWt4=;
        b=EgZIF7c/lvNnDSLC8mfOV13AKpEFrJoH0B/LBCD34E5uLkX/wrpcqXyIjxe89gsPn/
         R4As6kKbRN+WPw9cnPcdvJCqned7U1S7dwwnXBKwFeBCZvA5g0ivmNVFoGtHVIVWC9nv
         r8ICHho5lwoBeUi+yaK8MtNJC1YAq0PF7UGvLmDHyyDmLh/+veUSjZgdxH/MEBRf1tKV
         QAuvGTD16gbVfgZkb7hZh703WTQaX2wE71o+npbZNhyCCGzdKyJLw88/OeVF1UrDu2/V
         fGls89r2M3+llq4OKOwCa08SeZ5YKj675GnAZeX0oypr6xY0kEqhfEZL1ln95gr9FGsC
         0jwQ==
X-Gm-Message-State: AOJu0YwDAEwBPP054QA064WjygQEBXZiJRw4jZtQFjDfBR6zBWRwI5/q
	hQnXNIo6L+WquZXp3UWmWmePedzYGz5/arSzilLiG1Vsdupj82W1YP1lWTciF/YkJfEujfrR3RK
	dRQNbxUHXfYKlEn/CIFUsE+lYW/JAv/31
X-Gm-Gg: ASbGnctjd2ncihM2pMXE+ipYw9Zl6V8AY1iicIuB4CZyduZe2tnpn/R7U3UFbejUCQS
	z2W+GAxzAMPsawlbwuNly7HNHLA7FWxojHblB0Q8GHJPQ51aPCJYOHx+HBIpt1nJ+CVCE2Rn5xl
	5FK/FzohAKiYySEwDCFJ5BOBX1TDqZfQsltGVZMvSyPWnK8gOaQCY0JWnewFgXTpX+j08UIBaUr
	Vn2MrjhLbnHJ81xlhvJu+SzoT1G/B7I2g3mHL+6DlIUjqPCpgfV4h9oTRgyvznM1w==
X-Google-Smtp-Source: AGHT+IHwAlWOag/sSwnY+xt8RVwblyGZ6BChTdlH0nZynOM3MgSiC7yPR98H0nrko8vSm39gGYDDmHy7pXJn
X-Received: by 2002:a05:6512:b9a:b0:533:43e2:6ac4 with SMTP id 2adb3069b0e04-53dd3aaff94mr774659e87.49.1732264925192;
        Fri, 22 Nov 2024 00:42:05 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-433b45acd1csm3682485e9.17.2024.11.22.00.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:42:05 -0800 (PST)
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
Subject: [PATCH v1 3/5] drivers: media: bcm2835-unicam: Disable trigger mode operation
Date: Fri, 22 Nov 2024 08:41:50 +0000
Message-Id: <20241122084152.1841419-4-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122084152.1841419-1-naush@raspberrypi.com>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
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


