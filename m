Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52486ED369
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 14:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbfKCNHX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 08:07:23 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:43371 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727377AbfKCNHW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Nov 2019 08:07:22 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iRFbE-0000Tq-OM; Sun, 03 Nov 2019 13:07:20 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: siano: fix spelling mistake "ENBALE" -> "ENABLE"
Date:   Sun,  3 Nov 2019 13:07:20 +0000
Message-Id: <20191103130720.22459-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Macros MSG_SMS_ENBALE_TS_INTERFACE_REQ and MSG_SMS_ENBALE_TS_INTERFACE_RES
contain a spelling mistake. Fix these by replacing ENBALE with ENABLE.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/common/siano/smscoreapi.c | 4 ++--
 drivers/media/common/siano/smscoreapi.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
index 0ba51dacc580..c1511094fdc7 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -230,8 +230,8 @@ static char *siano_msgs[] = {
 	[MSG_SMS_FLASH_DL_REQ                        - MSG_TYPE_BASE_VAL] = "MSG_SMS_FLASH_DL_REQ",
 	[MSG_SMS_EXEC_TEST_1_REQ                     - MSG_TYPE_BASE_VAL] = "MSG_SMS_EXEC_TEST_1_REQ",
 	[MSG_SMS_EXEC_TEST_1_RES                     - MSG_TYPE_BASE_VAL] = "MSG_SMS_EXEC_TEST_1_RES",
-	[MSG_SMS_ENBALE_TS_INTERFACE_REQ             - MSG_TYPE_BASE_VAL] = "MSG_SMS_ENBALE_TS_INTERFACE_REQ",
-	[MSG_SMS_ENBALE_TS_INTERFACE_RES             - MSG_TYPE_BASE_VAL] = "MSG_SMS_ENBALE_TS_INTERFACE_RES",
+	[MSG_SMS_ENABLE_TS_INTERFACE_REQ             - MSG_TYPE_BASE_VAL] = "MSG_SMS_ENABLE_TS_INTERFACE_REQ",
+	[MSG_SMS_ENABLE_TS_INTERFACE_RES             - MSG_TYPE_BASE_VAL] = "MSG_SMS_ENABLE_TS_INTERFACE_RES",
 	[MSG_SMS_SPI_SET_BUS_WIDTH_REQ               - MSG_TYPE_BASE_VAL] = "MSG_SMS_SPI_SET_BUS_WIDTH_REQ",
 	[MSG_SMS_SPI_SET_BUS_WIDTH_RES               - MSG_TYPE_BASE_VAL] = "MSG_SMS_SPI_SET_BUS_WIDTH_RES",
 	[MSG_SMS_SEND_EMM_REQ                        - MSG_TYPE_BASE_VAL] = "MSG_SMS_SEND_EMM_REQ",
diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index a2f95f4899c2..b3b793b5caf3 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -434,8 +434,8 @@ enum msg_types {
 	MSG_SMS_FLASH_DL_REQ = 732,
 	MSG_SMS_EXEC_TEST_1_REQ = 734,
 	MSG_SMS_EXEC_TEST_1_RES = 735,
-	MSG_SMS_ENBALE_TS_INTERFACE_REQ = 736,
-	MSG_SMS_ENBALE_TS_INTERFACE_RES = 737,
+	MSG_SMS_ENABLE_TS_INTERFACE_REQ = 736,
+	MSG_SMS_ENABLE_TS_INTERFACE_RES = 737,
 	MSG_SMS_SPI_SET_BUS_WIDTH_REQ = 738,
 	MSG_SMS_SPI_SET_BUS_WIDTH_RES = 739,
 	MSG_SMS_SEND_EMM_REQ = 740,
-- 
2.20.1

