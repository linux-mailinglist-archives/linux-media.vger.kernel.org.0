Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3627A120E81
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 16:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbfLPPwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 10:52:01 -0500
Received: from sauhun.de ([88.99.104.3]:41968 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728527AbfLPPv5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 10:51:57 -0500
Received: from localhost (p54B33297.dip0.t-ipconnect.de [84.179.50.151])
        by pokefinder.org (Postfix) with ESMTPSA id 8E9F82C2DA6;
        Mon, 16 Dec 2019 16:51:55 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 08/16] media: pci: smipcie: smipcie-main: convert to use i2c_new_client_device()
Date:   Mon, 16 Dec 2019 16:51:35 +0100
Message-Id: <20191216155146.8803-9-wsa+renesas@sang-engineering.com>
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
 drivers/media/pci/smipcie/smipcie-main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/smipcie/smipcie-main.c b/drivers/media/pci/smipcie/smipcie-main.c
index 1fb78462e081..9ca0fc3e6f80 100644
--- a/drivers/media/pci/smipcie/smipcie-main.c
+++ b/drivers/media/pci/smipcie/smipcie-main.c
@@ -484,8 +484,8 @@ static struct i2c_client *smi_add_i2c_client(struct i2c_adapter *adapter,
 	struct i2c_client *client;
 
 	request_module(info->type);
-	client = i2c_new_device(adapter, info);
-	if (client == NULL || client->dev.driver == NULL)
+	client = i2c_new_client_device(adapter, info);
+	if (!i2c_client_has_driver(client))
 		goto err_add_i2c_client;
 
 	if (!try_module_get(client->dev.driver->owner)) {
-- 
2.20.1

