Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52A267165C5
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 17:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbjE3PDU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 11:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232960AbjE3PDL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 11:03:11 -0400
X-Greylist: delayed 312 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 30 May 2023 08:03:06 PDT
Received: from forward201a.mail.yandex.net (forward201a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A275F8F
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 08:03:06 -0700 (PDT)
Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d103])
        by forward201a.mail.yandex.net (Yandex) with ESMTP id B507F6518A
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 17:57:56 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:5d0f:0:640:79fc:0])
        by forward103a.mail.yandex.net (Yandex) with ESMTP id E3B0341C67;
        Tue, 30 May 2023 17:57:52 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id mvNimdLDdKo0-XbnNgggk;
        Tue, 30 May 2023 17:57:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1685458672;
        bh=XbzqnISKW5QdyNvPVUfZiZD+y9jzEY8/8Cw+GVIvcWI=;
        h=Message-Id:Date:Cc:Subject:To:From;
        b=R2J9NRoKhM2PgXls+IZxFW6Hrq0zW3PZC3SDw108pTfgxz3F0JaavpTef4L7gEvQO
         AJwUh05q4qsaWkBu/8Brm6ZNrXF4AVys/FLG/FfQobs5pO1VpioWP8aTQei2pedQjh
         3si1ibONCaIe2c6EwRvUwTPAJGQ3MI2c8TE9Hexc=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From:   Dmitry Antipov <dmantipov@yandex.ru>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, lvc-project@linuxtesting.org,
        Dmitry Antipov <dmantipov@yandex.ru>,
        Dmitriy Antipov <Dmitriy.Antipov@softline.com>
Subject: [PATCH] media: pulse8-cec: handle possible ping error
Date:   Tue, 30 May 2023 17:56:14 +0300
Message-Id: <20230530145614.536898-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Handle possible error waiting for MSGCODE_PING result.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitriy Antipov <Dmitriy.Antipov@softline.com>
---
 drivers/media/cec/usb/pulse8/pulse8-cec.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index 04b13cdc38d2..6b3d6add6967 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -809,8 +809,11 @@ static void pulse8_ping_eeprom_work_handler(struct work_struct *work)
 
 	mutex_lock(&pulse8->lock);
 	cmd = MSGCODE_PING;
-	pulse8_send_and_wait(pulse8, &cmd, 1,
-			     MSGCODE_COMMAND_ACCEPTED, 0);
+	if (pulse8_send_and_wait(pulse8, &cmd, 1,
+				 MSGCODE_COMMAND_ACCEPTED, 0)) {
+		dev_info(pulse8->dev, "failed to ping EEPROM\n");
+		goto unlock;
+	}
 
 	if (pulse8->vers < 2)
 		goto unlock;
-- 
2.40.1

