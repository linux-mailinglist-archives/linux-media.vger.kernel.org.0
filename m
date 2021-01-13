Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB542F484A
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 11:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727292AbhAMKGE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 05:06:04 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:36176 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbhAMKGC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 05:06:02 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kzd1h-0002s7-Ed; Wed, 13 Jan 2021 10:05:17 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>, linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: i2c: fix spelling mistakes: "enpoint" -> "endpoint"
Date:   Wed, 13 Jan 2021 10:05:17 +0000
Message-Id: <20210113100517.10959-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two spelling mistakes in dev_err messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/ov5648.c | 2 +-
 drivers/media/i2c/ov8865.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 609aa67b54ce..46ad0a539853 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2453,7 +2453,7 @@ static int ov5648_probe(struct i2c_client *client)
 
 	handle = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
 	if (!handle) {
-		dev_err(dev, "unable to find enpoint node\n");
+		dev_err(dev, "unable to find endpoint node\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index fda5a55979aa..fd5be8ef079c 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2799,7 +2799,7 @@ static int ov8865_probe(struct i2c_client *client)
 
 	handle = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
 	if (!handle) {
-		dev_err(dev, "unable to find enpoint node\n");
+		dev_err(dev, "unable to find endpoint node\n");
 		return -EINVAL;
 	}
 
-- 
2.29.2

