Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876FB374EEE
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 07:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbhEFFj7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 01:39:59 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:22012 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhEFFj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 01:39:58 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d79 with ME
        id 1Hez2500521Fzsu03Hez1A; Thu, 06 May 2021 07:38:59 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 May 2021 07:38:59 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, sean@mess.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: rc: i2c: Fix an error message
Date:   Thu,  6 May 2021 07:38:56 +0200
Message-Id: <179fb4cda2b79904fc9cf1d7d8e61153e30fae6b.1620279452.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'ret' is known to be 1 here. In fact 'i' is expected instead.
Store the return value of 'i2c_master_recv()' in 'ret' so that the error
message print the correct error code.

Fixes: acaa34bf06e9 ('media: rc: implement zilog transmitter")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/i2c/ir-kbd-i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index e8119ad0bc71..92376592455e 100644
--- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -678,8 +678,8 @@ static int zilog_tx(struct rc_dev *rcdev, unsigned int *txbuf,
 		goto out_unlock;
 	}
 
-	i = i2c_master_recv(ir->tx_c, buf, 1);
-	if (i != 1) {
+	ret = i2c_master_recv(ir->tx_c, buf, 1);
+	if (ret != 1) {
 		dev_err(&ir->rc->dev, "i2c_master_recv failed with %d\n", ret);
 		ret = -EIO;
 		goto out_unlock;
-- 
2.30.2

