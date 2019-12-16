Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD71E120E80
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 16:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728624AbfLPPwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 10:52:01 -0500
Received: from sauhun.de ([88.99.104.3]:41976 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728581AbfLPPv5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 10:51:57 -0500
Received: from localhost (p54B33297.dip0.t-ipconnect.de [84.179.50.151])
        by pokefinder.org (Postfix) with ESMTPSA id 39BD82C2DAA;
        Mon, 16 Dec 2019 16:51:56 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 09/16] media: platform: sti: c8sectpfe: c8sectpfe-dvb: convert to use i2c_new_client_device()
Date:   Mon, 16 Dec 2019 16:51:36 +0100
Message-Id: <20191216155146.8803-10-wsa+renesas@sang-engineering.com>
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

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c
index a79250a7f812..103872266565 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c
@@ -170,8 +170,8 @@ int c8sectpfe_frontend_attach(struct dvb_frontend **fe,
 
 		/* attach tuner */
 		request_module("tda18212");
-		client = i2c_new_device(tsin->i2c_adapter, &tda18212_info);
-		if (!client || !client->dev.driver) {
+		client = i2c_new_client_device(tsin->i2c_adapter, &tda18212_info);
+		if (!i2c_client_has_driver(client)) {
 			dvb_frontend_detach(*fe);
 			return -ENODEV;
 		}
-- 
2.20.1

