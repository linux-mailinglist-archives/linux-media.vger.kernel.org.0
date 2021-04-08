Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DED5357D74
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 09:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhDHHkV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 03:40:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:53596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229517AbhDHHkT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 03:40:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 537676113A;
        Thu,  8 Apr 2021 07:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617867608;
        bh=wapQTnSFiV1ZtG9q0iplLDk1SJVcJTFJRTo/iVI10D8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jY6qUnRldNElEAzowUqgaGbn3nss6H995XeWKFHfCivqJw5fC+mo3agAPVF6BzVTU
         esWgX7Vlx/edCn0aXgEITCTtDQYhVRo/xV927aCJcWB7JqN3kOof8zU/3wajQR2FM1
         9b9IchiOQV9AZJ4LTUxi1vKWKPLRKzv9ZW5mT/INyOrWxtGYfOdG9I/QObX7Oij3lL
         AVxDbg9jB0GO/dWsNtSh3VBnrp/yTB44CGhOR9k4Xipux2QLC4EGWBuhSDjMM78dQb
         l8cWsme+uXUxK/W48W3NZQh0ySry6PYTyxBXIimZPgSNLK4ufND+bWKs+iECzTgm8U
         daEIo7482tFgA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lUPGn-000jTz-VS; Thu, 08 Apr 2021 09:40:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/3] media: rdacm21: describe better a truncation
Date:   Thu,  8 Apr 2021 09:40:03 +0200
Message-Id: <b64509683e6d3e24c32795f3cad9b3046de6e2a0.1617867599.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <b6f139947e93fec1ade5faf3517dfb2b3b9bcd41.1617867599.git.mchehab+huawei@kernel.org>
References: <b6f139947e93fec1ade5faf3517dfb2b3b9bcd41.1617867599.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As warned by sparse:

	drivers/media/i2c/rdacm21.c:348:62: warning: cast truncates bits from constant value (300a becomes a)

the intention of the code is to get just the lowest 8 bits.
So, instead of using a typecast, use a bit and logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/rdacm21.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index dcc21515e5a4..179d107f494c 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -345,7 +345,7 @@ static int ov10640_initialize(struct rdacm21_device *dev)
 	/* Read OV10640 ID to test communications. */
 	ov490_write_reg(dev, OV490_SCCB_SLAVE0_DIR, OV490_SCCB_SLAVE_READ);
 	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_HIGH, OV10640_CHIP_ID >> 8);
-	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, (u8)OV10640_CHIP_ID);
+	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, OV10640_CHIP_ID & 0xff);
 
 	/* Trigger SCCB slave transaction and give it some time to complete. */
 	ov490_write_reg(dev, OV490_HOST_CMD, OV490_HOST_CMD_TRIGGER);
-- 
2.30.2

