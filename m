Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA5622E438
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 05:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgG0DIt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 23:08:49 -0400
Received: from smtpbgbr2.qq.com ([54.207.22.56]:33582 "EHLO smtpbgbr2.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgG0DIt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 23:08:49 -0400
X-QQ-mid: bizesmtp12t1595819273txqw0pfa
Received: from localhost.localdomain (unknown [210.242.163.205])
        by esmtp6.qq.com (ESMTP) with 
        id ; Mon, 27 Jul 2020 11:07:51 +0800 (CST)
X-QQ-SSF: 01400000002000P0ZF20B00A0000000
X-QQ-FEAT: QjnoOdcw2Yw8E9sswuoGlMhfjozJc3UzV+uxJJRW9L8bW2UUuzlmi9RtxA2un
        6jIf2edYYxIVguVktR54n0/c1J+yGpBAQMD1bup3kJ3866tMU44A/kH7z96gtAWba9ITirD
        BkFufO1TuxXtgv+ZoClMpPgAI68wM6q9odr80+Vo61rK7NQ9C3IauxMljLcXlCU3dTgJ+Mr
        ldj/ey/pUI4pNfJpLen0+qgBTQJAeyD9uRFCPxwlcB+L9DcCIMtmhAc06cSXBXtVWDF8BWl
        iL4qssoSahfpiXAsc2pnTrEoU4/X2kh/jcvwzazceq2UBtO9c8mW0UUmx/RXkJoYQSnP3ZS
        VI+6SOUBlFBTKImTr+pUyu1rLd6Yg==
X-QQ-GoodBg: 2
From:   David Lu <david.lu@bitland.com.cn>
To:     david.lu@bitland.com.cn
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ov8856: decrease hs_trail time
Date:   Mon, 27 Jul 2020 11:07:48 +0800
Message-Id: <20200727030748.3791-1-david.lu@bitland.com.cn>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bitland.com.cn:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To meet mipi hi speed transmission, decrease hs_trail time to pass mipi
test.

Signed-off-by: David Lu <david.lu@bitland.com.cn>
---
 drivers/media/i2c/ov8856.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 4ca27675cc5a..1f1835b14a24 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -284,7 +284,7 @@ static const struct ov8856_reg mode_3280x2464_regs[] = {
 	{0x4601, 0x80},
 	{0x4800, 0x44},
 	{0x4816, 0x53},
-	{0x481b, 0x58},
+	{0x481b, 0x42},
 	{0x481f, 0x27},
 	{0x4837, 0x16},
 	{0x483c, 0x0f},
@@ -474,7 +474,7 @@ static const struct ov8856_reg mode_1640x1232_regs[] = {
 	{0x4601, 0x80},
 	{0x4800, 0x44},
 	{0x4816, 0x53},
-	{0x481b, 0x58},
+	{0x481b, 0x42},
 	{0x481f, 0x27},
 	{0x4837, 0x16},
 	{0x483c, 0x0f},
-- 
2.17.1



