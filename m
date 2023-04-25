Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E375F6EDCB5
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 09:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbjDYHfR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 03:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233454AbjDYHeh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 03:34:37 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D41C17E
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 00:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682408033; x=1713944033;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GDszWvWnhjV8dQNA6YgEIGwnLFA67xQjEoHcx1jUV1Q=;
  b=nO4L7IlcSDZxSAUK8OZnNbkBP9H542YMANITWqQZow892itaRpx6ZXop
   iuDCzXsMOKVn1/U24Y55ckBDTRCcF/pOwTqaNGjvcD75hmYPnPbYSNXeZ
   +SkJBAmJvy0mU1TcehTwtmkQHw1L13c3zcZ+7ZMdz3ER7BfDEyJsWTOXq
   1jSdpmdNQVMsIV408+iYphFaDrpRQraW1un38zmOVWDVlgsuvYSNMXnd8
   yMctWg18/jWNMljKmc7FkcTyFHgRHmrMm1SvsfYeQTfYfmZ4Zl4w36aWJ
   H1KsxrEEInnqMXhajsQKh/byIyEFpx2NzZFI8OeVdbxOe+q5R4q/bYH0A
   A==;
X-IronPort-AV: E=Sophos;i="5.99,224,1677538800"; 
   d="scan'208";a="30536225"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 25 Apr 2023 09:33:51 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 25 Apr 2023 09:33:51 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 25 Apr 2023 09:33:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682408031; x=1713944031;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GDszWvWnhjV8dQNA6YgEIGwnLFA67xQjEoHcx1jUV1Q=;
  b=VjTyS8V4Zcwrek7rBEggApb00iCpKjcS9L7sAVYGdyRWi8UpMLbkI44/
   G5zGOqI0siS27tOnh2ku9LREiWPh9vVnXn5ZsPyL/ZapTH7OENPPJQyX8
   ZD+iGEcDqhko1DmtZZTl42/YfMZd/H127tE3qE2LzbErHNzqvghsDZXWq
   Ran5dqggH/EH5QKy4dvHbyntvQ6vRRgY+fLKmA1Nc9IOsGposrfdQPCKh
   aFSxElZlQJ3kWRw7pMXLF4vrogMVinZ53+QC0UYFknpkRyIdoRGtWkuxX
   +6sg2JP7XfnKjYV8ybosDc+LWaMYte5bvpvzakxDV8chKd8vkqlMWtIoM
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,224,1677538800"; 
   d="scan'208";a="30536224"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 25 Apr 2023 09:33:51 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 050DD280056;
        Tue, 25 Apr 2023 09:33:51 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: tc358743: Add error code to error message
Date:   Tue, 25 Apr 2023 09:33:46 +0200
Message-Id: <20230425073346.636871-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the error code of a failed i2c transfer to the error message.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/tc358743.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 9197fa0b1bc2..ad6a72b2bcf5 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -133,8 +133,8 @@ static void i2c_rd(struct v4l2_subdev *sd, u16 reg, u8 *values, u32 n)
 
 	err = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (err != ARRAY_SIZE(msgs)) {
-		v4l2_err(sd, "%s: reading register 0x%x from 0x%x failed\n",
-				__func__, reg, client->addr);
+		v4l2_err(sd, "%s: reading register 0x%x from 0x%x failed: %d\n",
+				__func__, reg, client->addr, err);
 	}
 }
 
@@ -165,8 +165,8 @@ static void i2c_wr(struct v4l2_subdev *sd, u16 reg, u8 *values, u32 n)
 
 	err = i2c_transfer(client->adapter, &msg, 1);
 	if (err != 1) {
-		v4l2_err(sd, "%s: writing register 0x%x from 0x%x failed\n",
-				__func__, reg, client->addr);
+		v4l2_err(sd, "%s: writing register 0x%x from 0x%x failed: %d\n",
+				__func__, reg, client->addr, err);
 		return;
 	}
 
-- 
2.34.1

