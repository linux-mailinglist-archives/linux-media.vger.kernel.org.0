Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA7F1A9997
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 11:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896066AbgDOJxD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 05:53:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:46392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895867AbgDOJtc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 05:49:32 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 900382078A;
        Wed, 15 Apr 2020 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586944170;
        bh=XXiwzaSAcbds9tPSVXUQN0GTxvW9D8eWFTjZyuQP4cY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ogwX4ZUY1cCk3S5rl6dB5nb9pQGdDgb7u0cnpiSxxAOmCq1n+oPLIJAvtcsoZgsm5
         W4p7SWegfXcul8g/o6rHt+EAj+Gde9lQboJwUCJjoTTwnCHQdGb0WQF3ZxDx3tWbF/
         CF1+uAB+6ibvHi8f45aDBrrdTuvKu43Jk4C+2S00=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOefg-006WIK-1A; Wed, 15 Apr 2020 11:49:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/4] media: cec: move the core to a separate directory
Date:   Wed, 15 Apr 2020 11:49:24 +0200
Message-Id: <e8d4d58d4269b63c53603fde978707e65ce82179.1586944045.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586944045.git.mchehab+huawei@kernel.org>
References: <cover.1586944045.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for moving CEC drivers to the CEC directory,
move the core to a separate place.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/cec/Makefile                       | 16 +---------------
 drivers/media/cec/core/Makefile                  | 16 ++++++++++++++++
 drivers/media/cec/{ => core}/cec-adap.c          |  0
 drivers/media/cec/{ => core}/cec-api.c           |  0
 drivers/media/cec/{ => core}/cec-core.c          |  0
 drivers/media/cec/{ => core}/cec-notifier.c      |  0
 drivers/media/cec/{ => core}/cec-pin-error-inj.c |  0
 drivers/media/cec/{ => core}/cec-pin-priv.h      |  0
 drivers/media/cec/{ => core}/cec-pin.c           |  0
 drivers/media/cec/{ => core}/cec-priv.h          |  0
 10 files changed, 17 insertions(+), 15 deletions(-)
 create mode 100644 drivers/media/cec/core/Makefile
 rename drivers/media/cec/{ => core}/cec-adap.c (100%)
 rename drivers/media/cec/{ => core}/cec-api.c (100%)
 rename drivers/media/cec/{ => core}/cec-core.c (100%)
 rename drivers/media/cec/{ => core}/cec-notifier.c (100%)
 rename drivers/media/cec/{ => core}/cec-pin-error-inj.c (100%)
 rename drivers/media/cec/{ => core}/cec-pin-priv.h (100%)
 rename drivers/media/cec/{ => core}/cec-pin.c (100%)
 rename drivers/media/cec/{ => core}/cec-priv.h (100%)

diff --git a/drivers/media/cec/Makefile b/drivers/media/cec/Makefile
index ad8677d8c896..3fdbc22b1530 100644
--- a/drivers/media/cec/Makefile
+++ b/drivers/media/cec/Makefile
@@ -1,16 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-cec-objs := cec-core.o cec-adap.o cec-api.o
-
-ifeq ($(CONFIG_CEC_NOTIFIER),y)
-  cec-objs += cec-notifier.o
-endif
-
-ifeq ($(CONFIG_CEC_PIN),y)
-  cec-objs += cec-pin.o
-endif
-
-ifeq ($(CONFIG_CEC_PIN_ERROR_INJ),y)
-  cec-objs += cec-pin-error-inj.o
-endif
-
-obj-$(CONFIG_CEC_CORE) += cec.o
+obj-y += core/
diff --git a/drivers/media/cec/core/Makefile b/drivers/media/cec/core/Makefile
new file mode 100644
index 000000000000..ad8677d8c896
--- /dev/null
+++ b/drivers/media/cec/core/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+cec-objs := cec-core.o cec-adap.o cec-api.o
+
+ifeq ($(CONFIG_CEC_NOTIFIER),y)
+  cec-objs += cec-notifier.o
+endif
+
+ifeq ($(CONFIG_CEC_PIN),y)
+  cec-objs += cec-pin.o
+endif
+
+ifeq ($(CONFIG_CEC_PIN_ERROR_INJ),y)
+  cec-objs += cec-pin-error-inj.o
+endif
+
+obj-$(CONFIG_CEC_CORE) += cec.o
diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/core/cec-adap.c
similarity index 100%
rename from drivers/media/cec/cec-adap.c
rename to drivers/media/cec/core/cec-adap.c
diff --git a/drivers/media/cec/cec-api.c b/drivers/media/cec/core/cec-api.c
similarity index 100%
rename from drivers/media/cec/cec-api.c
rename to drivers/media/cec/core/cec-api.c
diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/core/cec-core.c
similarity index 100%
rename from drivers/media/cec/cec-core.c
rename to drivers/media/cec/core/cec-core.c
diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
similarity index 100%
rename from drivers/media/cec/cec-notifier.c
rename to drivers/media/cec/core/cec-notifier.c
diff --git a/drivers/media/cec/cec-pin-error-inj.c b/drivers/media/cec/core/cec-pin-error-inj.c
similarity index 100%
rename from drivers/media/cec/cec-pin-error-inj.c
rename to drivers/media/cec/core/cec-pin-error-inj.c
diff --git a/drivers/media/cec/cec-pin-priv.h b/drivers/media/cec/core/cec-pin-priv.h
similarity index 100%
rename from drivers/media/cec/cec-pin-priv.h
rename to drivers/media/cec/core/cec-pin-priv.h
diff --git a/drivers/media/cec/cec-pin.c b/drivers/media/cec/core/cec-pin.c
similarity index 100%
rename from drivers/media/cec/cec-pin.c
rename to drivers/media/cec/core/cec-pin.c
diff --git a/drivers/media/cec/cec-priv.h b/drivers/media/cec/core/cec-priv.h
similarity index 100%
rename from drivers/media/cec/cec-priv.h
rename to drivers/media/cec/core/cec-priv.h
-- 
2.25.2

