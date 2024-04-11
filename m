Return-Path: <linux-media+bounces-9103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 206218A1421
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 14:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D04ED282965
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 12:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEED214B088;
	Thu, 11 Apr 2024 12:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZDCP2AVr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923D6149C75
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 12:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712837649; cv=none; b=IYCZRbYdbPwQkaWpHVtRUjgeCZmz9zP1ZB/Sn3buF+xz5KW1Jzsguf247FHUMOpGB4rbkxIpZBku0TycVmXVoE2MQjDl/poJLhNQ+OS09EZ+KMZ39RWcDy+pG4JaKLKMGAuCjVyiLY+HntLI7OxU9CLmywczpdOg0WKw2/7vnHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712837649; c=relaxed/simple;
	bh=BakRmhmicJbDKcrReng5xepS9oRzju+Zi4eHkXz5Gjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LgX0MVIjWjhDsXhN/EzW1UCLwiera53aH+i+rFe5ij8i+0drf0WmrDepW22WufyNClqVT/AaE5pB5i9ogbjv2BfIj5E+a4tREiNx3pHBW39fOKRLMy8OOL6bxXnMccK0hpOa1BOD2bUEa7HuNQMsczOVCBpH1Xms1wD6ghnZv4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZDCP2AVr; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4dac5a3fbeaso1821526e0c.3
        for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 05:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712837646; x=1713442446; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1vhafsI5LvdFGZSOAF0fGhLimdJSORh40J/r9x8oZUU=;
        b=ZDCP2AVr58e+6I9Laiyd9ffuj/n6oixpjNdGqpamYQDXQmJwzn3CiyVohbQZdHagsI
         wZftIm6B/bnfuZWsoX04Gf0nBGgqagm0EP/CPYQ6NTiHqgWMGfTbcat/HpfpyR/oGnBe
         oO1O1VYEDoSaKwTazzcPdhNKnvl/FKEga6kDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712837646; x=1713442446;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vhafsI5LvdFGZSOAF0fGhLimdJSORh40J/r9x8oZUU=;
        b=tDVM71JMqLWtDQyxWXNYX3xvfWaVRDv6i5/ARWTUDVPGnDD1kQW59DCaVJZX3O4ZQ3
         nZMletQdwF3vxF4QL42xcTJvzKJ5GKVPE4RBRRWS0lk9J1/f3hu0wj9ffNLxLCqjswBt
         KbTVsFJwsY/+2ZAaWnY1mXb12wGfLhrNn7/g1/8EMj8865XSEIJpvIVPxGy/4mJrtZdC
         T6SOcg8a6njJHjGPhaAOKXXVsi/Hay+a5kehkaXBCTI5r3QzGfO8/0h9V2dZBhCA5hFE
         BBovcLsMfwEEHInjvzUso/AjCDqDJHVoQCMS+gEixUkMAbFS8HwHJVRqti/e/amTGRi4
         3P6A==
X-Forwarded-Encrypted: i=1; AJvYcCV6UzxHgzXY/SAjkv36oe6eNwXr1X+cy//DnrP+nY4E2I6J87CY7IA0SOxpU6N1idnRiIje+2xEAb0uNrbVLAVawPRg5ucyd9ii/bU=
X-Gm-Message-State: AOJu0YzMAmdL02HB3CCu9/r2k9ubsHAiIFhwyplVbAZOWy++jpHQJXPP
	6EkiXPN++83dH0Tqz94bJQppS11+niANDovR3XKm8VK4I8YKXFATQ+SOYeVaKw==
X-Google-Smtp-Source: AGHT+IGrz19TKSvIV3DMbiUB+Anzc4f3GG8bD5xEZa2OJ57IT5TTkk/P+nBFmtMj28v6ucHX2QJjqQ==
X-Received: by 2002:a05:6102:290e:b0:47a:2545:12e with SMTP id cz14-20020a056102290e00b0047a2545012emr4256388vsb.5.1712837645325;
        Thu, 11 Apr 2024 05:14:05 -0700 (PDT)
Received: from denia.c.googlers.com (200.234.86.34.bc.googleusercontent.com. [34.86.234.200])
        by smtp.gmail.com with ESMTPSA id l18-20020a0ce092000000b0069b12b5ab57sm855799qvk.89.2024.04.11.05.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 05:14:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 11 Apr 2024 12:14:03 +0000
Subject: [PATCH] media: c8sectpfe: Do not depend on DEBUG_FS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-debugfs-v1-1-220c164afaf5@chromium.org>
X-B4-Tracking: v=1; b=H4sIAArUF2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDE0ND3ZTUpNL0tGLdtBSzZEPjRANzk7QUJaDqgqLUtMwKsEnRsbW1ANs
 Oln5ZAAAA
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Make dependency on DEBUG_FS conditional, that way we are not forced to
enable DEBUG_FS if we can to use this driver.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/st/sti/c8sectpfe/Kconfig             | 1 -
 drivers/media/platform/st/sti/c8sectpfe/Makefile            | 7 +++++--
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h | 5 +++++
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/Kconfig b/drivers/media/platform/st/sti/c8sectpfe/Kconfig
index 702b910509c9c..01c33d9c9ec37 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/Kconfig
+++ b/drivers/media/platform/st/sti/c8sectpfe/Kconfig
@@ -5,7 +5,6 @@ config DVB_C8SECTPFE
 	depends on PINCTRL && DVB_CORE && I2C
 	depends on ARCH_STI || ARCH_MULTIPLATFORM || COMPILE_TEST
 	select FW_LOADER
-	select DEBUG_FS
 	select DVB_LNBP21 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_STV090x if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_STB6100 if MEDIA_SUBDRV_AUTOSELECT
diff --git a/drivers/media/platform/st/sti/c8sectpfe/Makefile b/drivers/media/platform/st/sti/c8sectpfe/Makefile
index aedfc725cc19d..99425137ee0a9 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/Makefile
+++ b/drivers/media/platform/st/sti/c8sectpfe/Makefile
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
-c8sectpfe-y += c8sectpfe-core.o c8sectpfe-common.o c8sectpfe-dvb.o \
-		c8sectpfe-debugfs.o
+c8sectpfe-y += c8sectpfe-core.o c8sectpfe-common.o c8sectpfe-dvb.o
+
+ifneq ($(CONFIG_DEBUG_FS),)
+c8sectpfe-y += c8sectpfe-debugfs.o
+endif
 
 obj-$(CONFIG_DVB_C8SECTPFE) += c8sectpfe.o
 
diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
index d2c35fb32d7ef..8e1bfd8605247 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
@@ -12,7 +12,12 @@
 
 #include "c8sectpfe-core.h"
 
+#if defined(CONFIG_DEBUG_FS)
 void c8sectpfe_debugfs_init(struct c8sectpfei *);
 void c8sectpfe_debugfs_exit(struct c8sectpfei *);
+#else
+static inline void c8sectpfe_debugfs_init(struct c8sectpfei *) {};
+static inline void c8sectpfe_debugfs_exit(struct c8sectpfei *) {};
+#endif
 
 #endif /* __C8SECTPFE_DEBUG_H */

---
base-commit: 34d7bf1c8e59f5fbf438ee32c96389ebe41ca2e8
change-id: 20240411-debugfs-fd6c13a074fd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


