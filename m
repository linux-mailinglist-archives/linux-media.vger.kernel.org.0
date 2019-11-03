Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13A6BED317
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 12:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbfKCLXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 06:23:45 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:59081 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727379AbfKCLXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 Nov 2019 06:23:44 -0500
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RDysiydASTzKrRDywigk78; Sun, 03 Nov 2019 12:23:43 +0100
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/8] mtk-vpu: fix two smatch warnings
Date:   Sun,  3 Nov 2019 12:23:33 +0100
Message-Id: <20191103112338.22569-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
References: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfF9N1XjMO4LG1hfV4UyZx9hju8VApJwxpnIxUJ20CORVPpddgMXZLwFx8NNB9O4vdKh/FlBUkHTyHk0WSx9uvYRJ01MXADmtuvHXuBJ1ZOSprfX9DIPX
 sx9Ta10UmYMEGd6IAixMBiKSM8aDCUAr3w055qR5eVykeks+ZeuyUZJ5/1+G3z2l1/SaUVW5vTeaqoCS47vPshXfcbO52eqkJgigRghAyT0b2GHAO+EEibFU
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the "id >= 0" test in two conditions to fix these warnings:

drivers/media/platform/mtk-vpu/mtk_vpu.c:276 vpu_ipi_register() warn: always true condition '(id >= 0) => (0-u32max >= 0)'
drivers/media/platform/mtk-vpu/mtk_vpu.c:401 vpu_wdt_reg_handler() warn: always true condition '(id >= 0) => (0-u32max >= 0)'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index cc2ff40d060d..a768707abb94 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -273,7 +273,7 @@ int vpu_ipi_register(struct platform_device *pdev,
 		return -EPROBE_DEFER;
 	}
 
-	if (id >= 0 && id < IPI_MAX && handler) {
+	if (id < IPI_MAX && handler) {
 		ipi_desc = vpu->ipi_desc;
 		ipi_desc[id].name = name;
 		ipi_desc[id].handler = handler;
@@ -398,7 +398,7 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 
 	handler = vpu->wdt.handler;
 
-	if (id >= 0 && id < VPU_RST_MAX && wdt_reset) {
+	if (id < VPU_RST_MAX && wdt_reset) {
 		dev_dbg(vpu->dev, "wdt register id %d\n", id);
 		mutex_lock(&vpu->vpu_mutex);
 		handler[id].reset_func = wdt_reset;
-- 
2.23.0

