Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB4FA370A9
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 11:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbfFFJr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 05:47:56 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40671 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728106AbfFFJrh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 05:47:37 -0400
Received: by mail-lf1-f65.google.com with SMTP id a9so1061527lff.7
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 02:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tqLAHFWcFPPRWg/WUmIKVQXRfjbKzLHes3un8tM9Gvg=;
        b=vHUW3+ZZeGk/a3xl67ZoRzH2OeuOzTB13K64lPfM8o6ubuED7MfpLkMU42xD3KDTGG
         htbekOtb95OTRxYqsJ57kJ+7eBDSb9YsOUmpEOfAcgfbUH9drA+CYkDRQb87juXm2gDt
         PRFJrv4x5Ttdpe+wr/kbs1XGegjxwq3YM3U0+pItUlRiB/RsC1+ymGjhCv80Qtj5/TQ8
         AqvCFqeTSw5zMAvuBjLvyf9ZiJ4xirXkcbH6DZ2pUywixzEe4js0aoa9r9FrXYnmpn5M
         vZnPIw5AOdPXDPoJIijX0vfgQCekmdrDEIiznGfYyqbX9Z1nQdeDTa0Oszi4RPnzcCdd
         nFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tqLAHFWcFPPRWg/WUmIKVQXRfjbKzLHes3un8tM9Gvg=;
        b=jaqMGTvJdOVPxuxsBlDXUSrIcxJAkgzE7BPGpbkIlR101f2sMfjFeOOYDP1d/yoAmT
         XmsqxPlJ3JhSXRj01fHoGlaExeqpLx+mPOSH1gmhyGGSe0F9RHxTkmOSZ4BQEwgMOGtb
         SvXYyrgLuaR/fKTEeR/S4Or81h14Y9hUcpXA0Asy7PEToNZyRA6OVMF/idrsxgmhsI6J
         VmKMD16wfhfe96GB/eK0VZpQorigjo5aozfUHM1fEhSFRN4N8iwuVx+RfLVcGpKdoKdA
         0xCjtUzF8J3q9mSuCepAJI2IY1utpz3mMu+AI6Sg4EtXseJF4h1B526d1fkRLrTgyfl6
         LB+Q==
X-Gm-Message-State: APjAAAW31ijlqjJb4641kbagDsq0vQ31jrQhwrMAz868kaoFBFAYfCU3
        64L87h8uVZQUFlNRbHowQhVe/w==
X-Google-Smtp-Source: APXvYqzwnsLpfjtk0CIHJjGAd3PHOuMbYbXAW2joQUfJaemcbv8dWKNOhuhIygzLFkH6KdzB5dTdug==
X-Received: by 2002:a19:e05c:: with SMTP id g28mr8736392lfj.167.1559814455812;
        Thu, 06 Jun 2019 02:47:35 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se. [213.112.54.28])
        by smtp.gmail.com with ESMTPSA id u13sm220277lfl.61.2019.06.06.02.47.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 02:47:35 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     lee.jones@linaro.org
Cc:     andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
        marex@denx.de, stefan@agner.ch, airlied@linux.ie, daniel@ffwll.ch,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        b.zolnierkie@samsung.com, a.hajda@samsung.com, mchehab@kernel.org,
        p.zabel@pengutronix.de, hkallweit1@gmail.com, lgirdwood@gmail.com,
        broonie@kernel.org, davem@davemloft.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-media@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 7/8] drivers: mfd: 88pm800: fix warning same module names
Date:   Thu,  6 Jun 2019 11:47:31 +0200
Message-Id: <20190606094731.23918-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When building with CONFIG_MFD_88PM800 and CONFIG_REGULATOR_88PM800
enabled as loadable modules, we see the following warning:

warning: same module names found:
  drivers/regulator/88pm800.ko
  drivers/mfd/88pm800.ko

Rework so the names matches the config fragment.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/mfd/Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 52b1a90ff515..5e870eef6a20 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -5,8 +5,11 @@
 
 88pm860x-objs			:= 88pm860x-core.o 88pm860x-i2c.o
 obj-$(CONFIG_MFD_88PM860X)	+= 88pm860x.o
-obj-$(CONFIG_MFD_88PM800)	+= 88pm800.o 88pm80x.o
-obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
+obj-$(CONFIG_MFD_88PM800)	+= mfd-88pm800.o mfd-88pm80x.o
+mfd-88pm800-objs		:= 88pm800.o
+obj-$(CONFIG_MFD_88PM805)	+= mfd-88pm805.o mfd-88pm80x.o
+mfd-88pm805-objs		:= 88pm805.o
+mfd-88pm80x-objs		:= 88pm80x.o
 obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
 obj-$(CONFIG_MFD_SM501)		+= sm501.o
 obj-$(CONFIG_MFD_ASIC3)		+= asic3.o tmio_core.o
-- 
2.20.1

