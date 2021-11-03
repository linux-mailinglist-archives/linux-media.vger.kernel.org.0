Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209CF4449AD
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 21:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhKCUsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 16:48:50 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:57807 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbhKCUsu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 16:48:50 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 86D9D200005;
        Wed,  3 Nov 2021 20:46:11 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] media: max9271: Fail loudly on bus read errors
Date:   Wed,  3 Nov 2021 21:46:53 +0100
Message-Id: <20211103204654.223699-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103204654.223699-1-jacopo+renesas@jmondi.org>
References: <20211103204654.223699-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Read errors were silently going ignored. Fail louder to make sure such
errors are visible.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9271.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
index ff86c8c4ea61..aa9ab6831574 100644
--- a/drivers/media/i2c/max9271.c
+++ b/drivers/media/i2c/max9271.c
@@ -30,7 +30,7 @@ static int max9271_read(struct max9271_device *dev, u8 reg)
 
 	ret = i2c_smbus_read_byte_data(dev->client, reg);
 	if (ret < 0)
-		dev_dbg(&dev->client->dev,
+		dev_err(&dev->client->dev,
 			"%s: register 0x%02x read failed (%d)\n",
 			__func__, reg, ret);
 
-- 
2.33.1

