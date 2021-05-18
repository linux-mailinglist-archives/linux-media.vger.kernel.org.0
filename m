Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B097387518
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 11:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347875AbhERJ37 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 05:29:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:44184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240100AbhERJ37 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 05:29:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B37A761042;
        Tue, 18 May 2021 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621330121;
        bh=PO6u9YQbB3wB7JoQpRmp62bUHAgeGHuboxhZStRAZnU=;
        h=From:To:Cc:Subject:Date:From;
        b=qKsFkv+V9//XE6m5KtLnDx3JwOoUtcc2Gle4/jakALKhjMZ3P5ndUdO8vAo8rY6+5
         IuU953PpBosBX8BL8/BpXXI1aY4/7w4CnFGGm51/jhNld5DLt8nsnCjcmF7l8TEj4i
         +/NAgIYJtT8FoOSpfzBQ1DyBCyEmqDZiMf6wgGfVrwnU9vn+R8b5eMMdjBud9D95nI
         aM4wBQ5AVHpuqZOg36uKU9ZgzhjgTuEvIXNVzNujKbdJ0S716yaUqMtEjHobvZ95e8
         3UKWpZjYqirqkvNJkTJqoALPKvH6AJ2tt+btVdnarXua30YzaQY09fNGxYP0yn71Yh
         rforhnXhd3nOw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liw1n-0070pH-De; Tue, 18 May 2021 11:28:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: sti: fix obj-$(config) targets
Date:   Tue, 18 May 2021 11:28:37 +0200
Message-Id: <a95148cc90a7202e9518b8a5c5f6910ff2b7d18b.1621330112.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The right thing to do is to add a new object to the building
system when a certain config option is selected, and *not*
override them.

So, fix obj-$(config) logic at sti makefiles, using "+=",
instead of ":=".

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sti/bdisp/Makefile | 2 +-
 drivers/media/platform/sti/delta/Makefile | 2 +-
 drivers/media/platform/sti/hva/Makefile   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sti/bdisp/Makefile b/drivers/media/platform/sti/bdisp/Makefile
index caf7ccd193ea..39ade0a34723 100644
--- a/drivers/media/platform/sti/bdisp/Makefile
+++ b/drivers/media/platform/sti/bdisp/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_VIDEO_STI_BDISP) := bdisp.o
+obj-$(CONFIG_VIDEO_STI_BDISP) += bdisp.o
 
 bdisp-objs := bdisp-v4l2.o bdisp-hw.o bdisp-debug.o
diff --git a/drivers/media/platform/sti/delta/Makefile b/drivers/media/platform/sti/delta/Makefile
index 92b37e216f00..32412fa4c632 100644
--- a/drivers/media/platform/sti/delta/Makefile
+++ b/drivers/media/platform/sti/delta/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_VIDEO_STI_DELTA_DRIVER) := st-delta.o
+obj-$(CONFIG_VIDEO_STI_DELTA_DRIVER) += st-delta.o
 st-delta-y := delta-v4l2.o delta-mem.o delta-ipc.o delta-debug.o
 
 # MJPEG support
diff --git a/drivers/media/platform/sti/hva/Makefile b/drivers/media/platform/sti/hva/Makefile
index 74b41ec52f97..b5a5478bdd01 100644
--- a/drivers/media/platform/sti/hva/Makefile
+++ b/drivers/media/platform/sti/hva/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_VIDEO_STI_HVA) := st-hva.o
+obj-$(CONFIG_VIDEO_STI_HVA) += st-hva.o
 st-hva-y := hva-v4l2.o hva-hw.o hva-mem.o hva-h264.o
 st-hva-$(CONFIG_VIDEO_STI_HVA_DEBUGFS) += hva-debugfs.o
-- 
2.31.1

