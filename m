Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2666DB82C0
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 22:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404682AbfISUjm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 16:39:42 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54278 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392750AbfISUje (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 16:39:34 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdXnV073308;
        Thu, 19 Sep 2019 15:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568925573;
        bh=4AxNmIxxGvgr2uIp2fxIL46eCkuXfMeHXM5eby2OiO4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wcjoyd0BwJqWbzrhdZD7unEkimBq7BSp72DCBI9eo66QKAsOSwFTV4xO14Pc0jnij
         7ak/m6LMisl2q4nPFnwTFL0hNWmaZOyA9YxHB9nih2Qpr4VSGkaoGMrDMsAN9NFlWh
         X+H+6A/5x9CKxgrCfc5XU7PFnIa0Zd0fduRoia+k=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdXsC122925;
        Thu, 19 Sep 2019 15:39:33 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 15:39:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 15:39:33 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdKIg014276;
        Thu, 19 Sep 2019 15:39:33 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 13/13] media: am437x-vpfe: Switch to SPDX Licensing
Date:   Thu, 19 Sep 2019 15:41:25 -0500
Message-ID: <20190919204125.15254-14-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919204125.15254-1-bparrot@ti.com>
References: <20190919204125.15254-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch to SPDX licensing and drop the redundant GPL text.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c      | 14 +-------------
 drivers/media/platform/am437x/am437x-vpfe.h      | 14 +-------------
 drivers/media/platform/am437x/am437x-vpfe_regs.h | 10 +---------
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 6416b7955fb7..5a66b0e9cff5 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * TI VPFE capture Driver
  *
@@ -5,19 +6,6 @@
  *
  * Benoit Parrot <bparrot@ti.com>
  * Lad, Prabhakar <prabhakar.csengg@gmail.com>
- *
- * This program is free software; you may redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
  */
 
 #include <linux/delay.h>
diff --git a/drivers/media/platform/am437x/am437x-vpfe.h b/drivers/media/platform/am437x/am437x-vpfe.h
index 7556cca308c2..fa5b85bcd8db 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.h
+++ b/drivers/media/platform/am437x/am437x-vpfe.h
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright (C) 2013 - 2014 Texas Instruments, Inc.
  *
  * Benoit Parrot <bparrot@ti.com>
  * Lad, Prabhakar <prabhakar.csengg@gmail.com>
- *
- * This program is free software; you may redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
  */
 
 #ifndef AM437X_VPFE_H
diff --git a/drivers/media/platform/am437x/am437x-vpfe_regs.h b/drivers/media/platform/am437x/am437x-vpfe_regs.h
index 0746c48ec23f..63ecdca3b908 100644
--- a/drivers/media/platform/am437x/am437x-vpfe_regs.h
+++ b/drivers/media/platform/am437x/am437x-vpfe_regs.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * TI AM437x Image Sensor Interface Registers
  *
@@ -5,15 +6,6 @@
  *
  * Benoit Parrot <bparrot@ti.com>
  * Lad, Prabhakar <prabhakar.csengg@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef AM437X_VPFE_REGS_H
-- 
2.17.1

