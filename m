Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0B73BB019
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 01:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhGDXHf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jul 2021 19:07:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:45806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230194AbhGDXHa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 4 Jul 2021 19:07:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 231ED61283;
        Sun,  4 Jul 2021 23:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625439894;
        bh=EKY1OlRJO93TJiFmqfgVZB3HH1bgpwa6v7NyZcI16Qg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CwxK62jX1VAjRxS8S8XVjh8LrXcYFFD/CkCOPiqCezYopAfn/r6qiYmoJ/CJPaD7c
         aIwj+fgUhodAMYJLhXrccd+6Zi/AZpo5j+/PVGddWcwJIftLPd74zzolvxkXqLcxIr
         rZWLwcLFqE8UKTu7YgLzmz4itYZrec7e7e77tDDlyATHUMwWyyJfJMG5lMSJpZ1rt/
         DGzkPDONBm/4qtunhC0Li6evHX3vQF3rx1nP/vv1CY0UbHgdKp7qjMLD8exoqhulsX
         XgnRAgJJNHA7cIegEYi78687prRopxkRRPfgiUMs8NilocpupQPGU3Z2jyJljKQbnN
         +eDmzyLDhd4lQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 24/85] media: sti: fix obj-$(config) targets
Date:   Sun,  4 Jul 2021 19:03:19 -0400
Message-Id: <20210704230420.1488358-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230420.1488358-1-sashal@kernel.org>
References: <20210704230420.1488358-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

[ Upstream commit 56c1f0876293888f686e31278d183d4af2cac3c3 ]

The right thing to do is to add a new object to the building
system when a certain config option is selected, and *not*
override them.

So, fix obj-$(config) logic at sti makefiles, using "+=",
instead of ":=".

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.30.2

