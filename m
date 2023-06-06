Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3E3C723674
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 06:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbjFFEof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 00:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjFFEod (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 00:44:33 -0400
X-Greylist: delayed 349 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Jun 2023 21:44:32 PDT
Received: from forward206b.mail.yandex.net (forward206b.mail.yandex.net [178.154.239.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34AE196
        for <linux-media@vger.kernel.org>; Mon,  5 Jun 2023 21:44:32 -0700 (PDT)
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d102])
        by forward206b.mail.yandex.net (Yandex) with ESMTP id 3B5686556B
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 07:38:43 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:6e01:0:640:627f:0])
        by forward102b.mail.yandex.net (Yandex) with ESMTP id 6D54B6002F;
        Tue,  6 Jun 2023 07:38:39 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id LcKrcHBDbGk0-skq9KE1C;
        Tue, 06 Jun 2023 07:38:38 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1686026318;
        bh=7agHiN3HVUAMX2jR7vlOVb/qv31mFFJ7hosJot/nDHs=;
        h=Message-Id:Date:Cc:Subject:To:From;
        b=akcKdL83dsPge4fviP0H7dFsZVavYyvLOBNsFZEcF9Mnm0ixtgYhudDhpqYlP9WVn
         z9UXCBsa4gjapk/MowqKjUqzKIlYV7puijfXK1owQqbIfDjrx9w7TOrOdpnMg5jTp4
         wkhaZIMNtxZFTPWOucjVap1RyqLASuWNbNYNbbtg=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From:   Dmitry Antipov <dmantipov@yandex.ru>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lvc-project@linuxtesting.org,
        Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] media: pulse8-cec: handle possible ping error
Date:   Tue,  6 Jun 2023 07:38:15 +0300
Message-Id: <20230606043815.19705-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Handle (and warn about) possible error waiting for MSGCODE_PING result.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/cec/usb/pulse8/pulse8-cec.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index 04b13cdc38d2..ba67587bd43e 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -809,8 +809,11 @@ static void pulse8_ping_eeprom_work_handler(struct work_struct *work)
 
 	mutex_lock(&pulse8->lock);
 	cmd = MSGCODE_PING;
-	pulse8_send_and_wait(pulse8, &cmd, 1,
-			     MSGCODE_COMMAND_ACCEPTED, 0);
+	if (pulse8_send_and_wait(pulse8, &cmd, 1,
+				 MSGCODE_COMMAND_ACCEPTED, 0)) {
+		dev_warn(pulse8->dev, "failed to ping EEPROM\n");
+		goto unlock;
+	}
 
 	if (pulse8->vers < 2)
 		goto unlock;
-- 
2.40.1

