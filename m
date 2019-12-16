Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB65C120E76
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 16:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbfLPPvv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 10:51:51 -0500
Received: from sauhun.de ([88.99.104.3]:41912 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728389AbfLPPvu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 10:51:50 -0500
Received: from localhost (p54B33297.dip0.t-ipconnect.de [84.179.50.151])
        by pokefinder.org (Postfix) with ESMTPSA id C8DB42C2D6D;
        Mon, 16 Dec 2019 16:51:48 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 01/16] media: dvb-core: dvbdev: convert to use i2c_new_client_device()
Date:   Mon, 16 Dec 2019 16:51:28 +0100
Message-Id: <20191216155146.8803-2-wsa+renesas@sang-engineering.com>
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
 drivers/media/dvb-core/dvbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 917fe034af37..80b6a71aa33e 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -983,8 +983,8 @@ struct i2c_client *dvb_module_probe(const char *module_name,
 	board_info->addr = addr;
 	board_info->platform_data = platform_data;
 	request_module(module_name);
-	client = i2c_new_device(adap, board_info);
-	if (client == NULL || client->dev.driver == NULL) {
+	client = i2c_new_client_device(adap, board_info);
+	if (!i2c_client_has_driver(client)) {
 		kfree(board_info);
 		return NULL;
 	}
-- 
2.20.1

