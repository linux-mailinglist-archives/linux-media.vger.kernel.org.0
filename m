Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27126120E79
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 16:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbfLPPvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 10:51:52 -0500
Received: from sauhun.de ([88.99.104.3]:41922 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728392AbfLPPvv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 10:51:51 -0500
Received: from localhost (p54B33297.dip0.t-ipconnect.de [84.179.50.151])
        by pokefinder.org (Postfix) with ESMTPSA id BD2412C2D92;
        Mon, 16 Dec 2019 16:51:49 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 02/16] media: dvb-frontends: cxd2820r_core: convert to use i2c_new_client_device()
Date:   Mon, 16 Dec 2019 16:51:29 +0100
Message-Id: <20191216155146.8803-3-wsa+renesas@sang-engineering.com>
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
 drivers/media/dvb-frontends/cxd2820r_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/dvb-frontends/cxd2820r_core.c
index d137199e13e6..b1618339eec0 100644
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -530,8 +530,8 @@ struct dvb_frontend *cxd2820r_attach(const struct cxd2820r_config *config,
 	strscpy(board_info.type, "cxd2820r", I2C_NAME_SIZE);
 	board_info.addr = config->i2c_address;
 	board_info.platform_data = &pdata;
-	client = i2c_new_device(adapter, &board_info);
-	if (!client || !client->dev.driver)
+	client = i2c_new_client_device(adapter, &board_info);
+	if (!i2c_client_has_driver(client))
 		return NULL;
 
 	return pdata.get_dvb_frontend(client);
-- 
2.20.1

