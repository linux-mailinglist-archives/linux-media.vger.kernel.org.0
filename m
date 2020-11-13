Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2FB2B1D71
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 15:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgKMO2f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 09:28:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgKMO2f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 09:28:35 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F479C0617A6
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 06:28:35 -0800 (PST)
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1605277712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3e/1y5NTiNN/fPrJk51XZMUVt9qy7d3oPOhWRi5QioE=;
        b=qwxSTpA39i6rxZjIy4xqWoKdn1Tcd42lQERjhK0j/xFuC69PDLWFnLKSiCZy7mZRX0Y5Un
        beG3BYVYH5lmiimaP7ouiQ8TTPA3LWA0689/50he/QOX9ggyjqeyH9/3Qj+wSN4HD41hht
        2lczCNhIiZrNPrKNb6QENITTe/CdYGdK23uLa9CpIqwGeukyLGDBvTeOkmIWfQ6jW1JCFD
        5+CSfMmuFpTnF+K2ZfP6Nqg5fRm3TIyimVvxzcHEl14CXS6dASnzX+Uu9PICdr9rowSN8g
        vZUzVRm3itVTvtV0twbOoKjRzPp3w79lczSEryb6arKgPjbxwpepaMzABINGLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1605277713;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3e/1y5NTiNN/fPrJk51XZMUVt9qy7d3oPOhWRi5QioE=;
        b=tWJCq6roNi/vfYfNBmCKd+cvLDLUoAkfYgSfErHu3qdmiXXgGpV9DMykgOrsBP6xe/QS/t
        vXOpdTpaHrC1YeAg==
To:     linux-media@vger.kernel.org
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH REPOST] media: omap3isp: Remove misleading comment
Date:   Fri, 13 Nov 2020 15:28:31 +0100
Message-Id: <20201113142831.2215880-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Thomas Gleixner <tglx@linutronix.de>

in_interrupt() covers hard and soft interrupt servicing and bottom half
disabled contexts, which is semantically undefined and useless.

The comment for __ccdc_lsc_configure() "Context: in_interrupt()" is
therefore as useful as "Context: unknown'. Remove it.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
---
Repost of https://lore.kernel.org/linux-media/20201013143731.704783731@linu=
tronix.de/
The other patches in this thread were applied.

 drivers/media/platform/omap3isp/ispccdc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/omap3isp/ispccdc.c b/drivers/media/plat=
form/omap3isp/ispccdc.c
index 0fbb2aa6dd2c0..4e8905ef362f2 100644
--- a/drivers/media/platform/omap3isp/ispccdc.c
+++ b/drivers/media/platform/omap3isp/ispccdc.c
@@ -299,11 +299,10 @@ static int ccdc_lsc_busy(struct isp_ccdc_device *ccdc)
 			     ISPCCDC_LSC_BUSY;
 }
=20
-/* __ccdc_lsc_configure - Apply a new configuration to the LSC engine
+/*
+ * __ccdc_lsc_configure - Apply a new configuration to the LSC engine
  * @ccdc: Pointer to ISP CCDC device
  * @req: New configuration request
- *
- * context: in_interrupt()
  */
 static int __ccdc_lsc_configure(struct isp_ccdc_device *ccdc,
 				struct ispccdc_lsc_config_req *req)
--=20
2.29.2

