Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0423F711554
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 20:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242380AbjEYSp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 14:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242496AbjEYSoc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 14:44:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0792C19B6;
        Thu, 25 May 2023 11:40:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 39D3361CBB;
        Thu, 25 May 2023 18:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB50EC4339C;
        Thu, 25 May 2023 18:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685039977;
        bh=grmV5ECNjfhpFqaQa+XnCtRocR2jGhVqdQsXK4lL7gM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IytHkL0ljb4+bXHNRQhizGzEW+SEy+5Hmiy5CKfnlj4rruZIBT6UqB7Zk3iiUT8Dq
         PpxUmepO+dr3oKsuRUjupx7hdQmK4J75sV9NspOaElwIV/15rWH84NJ9bD8kOvp/pX
         NydRVmQxjzuK8ON5OCeLbAT9dt6Qn7tVKCohd4HrDKd9O27GqGsdYBjIkeREBy8lBG
         TzebmQu0TmxXdqxvGj1cQ0X6IrbH03n0cSt3OZPOgIIVillTxfFd+MW/fIAHO45Kwt
         7XVuJWMbG2bIbxl9fTw89TdwrV0SYf8M9adCOA4kNFi5NEVM6BYj1Ndd0Vo8GhutD5
         Q3EXpUlgLkStA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Wei Chen <harperchen1110@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, crope@iki.fi,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 11/43] media: dvb-usb-v2: ec168: fix null-ptr-deref in ec168_i2c_xfer()
Date:   Thu, 25 May 2023 14:38:22 -0400
Message-Id: <20230525183854.1855431-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183854.1855431-1-sashal@kernel.org>
References: <20230525183854.1855431-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Wei Chen <harperchen1110@gmail.com>

[ Upstream commit a6dcefcc08eca1bf4e3d213c97c3cfb75f377935 ]

In ec168_i2c_xfer, msg is controlled by user. When msg[i].buf is null
and msg[i].len is zero, former checks on msg[i].buf would be passed.
If accessing msg[i].buf[0] without sanity check, null pointer deref
would happen. We add check on msg[i].len to prevent crash.

Similar commit:
commit 0ed554fd769a ("media: dvb-usb: az6027: fix null-ptr-deref in az6027_i2c_xfer()")

Link: https://lore.kernel.org/linux-media/20230313085853.3252349-1-harperchen1110@gmail.com
Signed-off-by: Wei Chen <harperchen1110@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/dvb-usb-v2/ec168.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb-usb-v2/ec168.c
index 7ed0ab9e429b1..0e4773fc025c9 100644
--- a/drivers/media/usb/dvb-usb-v2/ec168.c
+++ b/drivers/media/usb/dvb-usb-v2/ec168.c
@@ -115,6 +115,10 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 	while (i < num) {
 		if (num > i + 1 && (msg[i+1].flags & I2C_M_RD)) {
 			if (msg[i].addr == ec168_ec100_config.demod_address) {
+				if (msg[i].len < 1) {
+					i = -EOPNOTSUPP;
+					break;
+				}
 				req.cmd = READ_DEMOD;
 				req.value = 0;
 				req.index = 0xff00 + msg[i].buf[0]; /* reg */
@@ -131,6 +135,10 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 			}
 		} else {
 			if (msg[i].addr == ec168_ec100_config.demod_address) {
+				if (msg[i].len < 1) {
+					i = -EOPNOTSUPP;
+					break;
+				}
 				req.cmd = WRITE_DEMOD;
 				req.value = msg[i].buf[1]; /* val */
 				req.index = 0xff00 + msg[i].buf[0]; /* reg */
@@ -139,6 +147,10 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 				ret = ec168_ctrl_msg(d, &req);
 				i += 1;
 			} else {
+				if (msg[i].len < 1) {
+					i = -EOPNOTSUPP;
+					break;
+				}
 				req.cmd = WRITE_I2C;
 				req.value = msg[i].buf[0]; /* val */
 				req.index = 0x0100 + msg[i].addr; /* I2C addr */
-- 
2.39.2

