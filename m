Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE1B6120E99
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 16:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbfLPPww (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 10:52:52 -0500
Received: from sauhun.de ([88.99.104.3]:41936 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728504AbfLPPvw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 10:51:52 -0500
Received: from localhost (p54B33297.dip0.t-ipconnect.de [84.179.50.151])
        by pokefinder.org (Postfix) with ESMTPSA id 9C7AA2C2D94;
        Mon, 16 Dec 2019 16:51:50 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 03/16] media: dvb-frontends: lgdt330x: convert to use i2c_new_client_device()
Date:   Mon, 16 Dec 2019 16:51:30 +0100
Message-Id: <20191216155146.8803-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216155146.8803-1-wsa+renesas@sang-engineering.com>
References: <20191216155146.8803-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newer API returning an ERRPTR and use the new helper to bail
out.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/dvb-frontends/lgdt330x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/lgdt330x.c b/drivers/media/dvb-frontends/lgdt330x.c
index 651c8aa75e17..da3a8c5e18d8 100644
--- a/drivers/media/dvb-frontends/lgdt330x.c
+++ b/drivers/media/dvb-frontends/lgdt330x.c
@@ -922,8 +922,8 @@ struct dvb_frontend *lgdt330x_attach(const struct lgdt330x_config *_config,
 	strscpy(board_info.type, "lgdt330x", sizeof(board_info.type));
 	board_info.addr = demod_address;
 	board_info.platform_data = &config;
-	client = i2c_new_device(i2c, &board_info);
-	if (!client || !client->dev.driver)
+	client = i2c_new_client_device(i2c, &board_info);
+	if (!i2c_client_has_driver(client))
 		return NULL;
 
 	return lgdt330x_get_dvb_frontend(client);
-- 
2.20.1

