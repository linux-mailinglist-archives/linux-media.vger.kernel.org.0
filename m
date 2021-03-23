Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858D8345AAC
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 10:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhCWJWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 05:22:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52880 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhCWJVp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 05:21:45 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lOdEM-0008PZ-3G; Tue, 23 Mar 2021 09:21:42 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: imx-jpeg: Fix spelling mistake "Canot" -> "Cannot"
Date:   Tue, 23 Mar 2021 09:21:41 +0000
Message-Id: <20210323092141.231744-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index 2d29558f1864..adb1715c75d7 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -947,7 +947,7 @@ static void mxc_jpeg_device_run(void *priv)
 		goto end;
 	}
 	if (!mxc_jpeg_alloc_slot_data(jpeg, ctx->slot)) {
-		dev_err(dev, "Canot allocate slot data\n");
+		dev_err(dev, "Cannot allocate slot data\n");
 		goto end;
 	}
 
-- 
2.30.2

