Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F29FAB478
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 10:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392789AbfIFI6m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 04:58:42 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59518 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730412AbfIFI6l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 04:58:41 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i6A4l-0001EK-CW; Fri, 06 Sep 2019 08:58:39 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: em28xx: make various arrays static const, makes object smaller
Date:   Fri,  6 Sep 2019 09:58:39 +0100
Message-Id: <20190906085839.24344-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the arrays on the stack but instead make them
static const. Makes the object code smaller by 767 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  41567	  15088	    192	  56847	   de0f	em28xx/em28xx-dvb.o

After:
   text	   data	    bss	    dec	    hex	filename
  39872	  16016	    192	  56080	   db10	em28xx/em28xx-dvb.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/em28xx/em28xx-dvb.c | 30 +++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index a73faf12f7e4..0ab6c493bc74 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -471,13 +471,13 @@ static void hauppauge_hvr930c_init(struct em28xx *dev)
 {
 	int i;
 
-	struct em28xx_reg_seq hauppauge_hvr930c_init[] = {
+	static const struct em28xx_reg_seq hauppauge_hvr930c_init[] = {
 		{EM2874_R80_GPIO_P0_CTRL,	0xff,	0xff,	0x65},
 		{EM2874_R80_GPIO_P0_CTRL,	0xfb,	0xff,	0x32},
 		{EM2874_R80_GPIO_P0_CTRL,	0xff,	0xff,	0xb8},
 		{	-1,			-1,	-1,	-1},
 	};
-	struct em28xx_reg_seq hauppauge_hvr930c_end[] = {
+	static const struct em28xx_reg_seq hauppauge_hvr930c_end[] = {
 		{EM2874_R80_GPIO_P0_CTRL,	0xef,	0xff,	0x01},
 		{EM2874_R80_GPIO_P0_CTRL,	0xaf,	0xff,	0x65},
 		{EM2874_R80_GPIO_P0_CTRL,	0xef,	0xff,	0x76},
@@ -493,7 +493,7 @@ static void hauppauge_hvr930c_init(struct em28xx *dev)
 		{	-1,			-1,	-1,	-1},
 	};
 
-	struct {
+	static const struct {
 		unsigned char r[4];
 		int len;
 	} regs[] = {
@@ -537,20 +537,20 @@ static void hauppauge_hvr930c_init(struct em28xx *dev)
 static void terratec_h5_init(struct em28xx *dev)
 {
 	int i;
-	struct em28xx_reg_seq terratec_h5_init[] = {
+	static const struct em28xx_reg_seq terratec_h5_init[] = {
 		{EM2820_R08_GPIO_CTRL,		0xff,	0xff,	10},
 		{EM2874_R80_GPIO_P0_CTRL,	0xf6,	0xff,	100},
 		{EM2874_R80_GPIO_P0_CTRL,	0xf2,	0xff,	50},
 		{EM2874_R80_GPIO_P0_CTRL,	0xf6,	0xff,	100},
 		{	-1,			-1,	-1,	-1},
 	};
-	struct em28xx_reg_seq terratec_h5_end[] = {
+	static const struct em28xx_reg_seq terratec_h5_end[] = {
 		{EM2874_R80_GPIO_P0_CTRL,	0xe6,	0xff,	100},
 		{EM2874_R80_GPIO_P0_CTRL,	0xa6,	0xff,	50},
 		{EM2874_R80_GPIO_P0_CTRL,	0xe6,	0xff,	100},
 		{	-1,			-1,	-1,	-1},
 	};
-	struct {
+	static const struct {
 		unsigned char r[4];
 		int len;
 	} regs[] = {
@@ -594,14 +594,14 @@ static void terratec_htc_stick_init(struct em28xx *dev)
 	 * 0xe6: unknown (does not affect DVB-T).
 	 * 0xb6: unknown (does not affect DVB-T).
 	 */
-	struct em28xx_reg_seq terratec_htc_stick_init[] = {
+	static const struct em28xx_reg_seq terratec_htc_stick_init[] = {
 		{EM2820_R08_GPIO_CTRL,		0xff,	0xff,	10},
 		{EM2874_R80_GPIO_P0_CTRL,	0xf6,	0xff,	100},
 		{EM2874_R80_GPIO_P0_CTRL,	0xe6,	0xff,	50},
 		{EM2874_R80_GPIO_P0_CTRL,	0xf6,	0xff,	100},
 		{	-1,			-1,	-1,	-1},
 	};
-	struct em28xx_reg_seq terratec_htc_stick_end[] = {
+	static const struct em28xx_reg_seq terratec_htc_stick_end[] = {
 		{EM2874_R80_GPIO_P0_CTRL,	0xb6,	0xff,	100},
 		{EM2874_R80_GPIO_P0_CTRL,	0xf6,	0xff,	50},
 		{	-1,			-1,	-1,	-1},
@@ -611,7 +611,7 @@ static void terratec_htc_stick_init(struct em28xx *dev)
 	 * Init the analog decoder (not yet supported), but
 	 * it's probably still a good idea.
 	 */
-	struct {
+	static const struct {
 		unsigned char r[4];
 		int len;
 	} regs[] = {
@@ -642,14 +642,14 @@ static void terratec_htc_usb_xs_init(struct em28xx *dev)
 {
 	int i;
 
-	struct em28xx_reg_seq terratec_htc_usb_xs_init[] = {
+	static const struct em28xx_reg_seq terratec_htc_usb_xs_init[] = {
 		{EM2820_R08_GPIO_CTRL,		0xff,	0xff,	10},
 		{EM2874_R80_GPIO_P0_CTRL,	0xb2,	0xff,	100},
 		{EM2874_R80_GPIO_P0_CTRL,	0xb2,	0xff,	50},
 		{EM2874_R80_GPIO_P0_CTRL,	0xb6,	0xff,	100},
 		{	-1,			-1,	-1,	-1},
 	};
-	struct em28xx_reg_seq terratec_htc_usb_xs_end[] = {
+	static const struct em28xx_reg_seq terratec_htc_usb_xs_end[] = {
 		{EM2874_R80_GPIO_P0_CTRL,	0xa6,	0xff,	100},
 		{EM2874_R80_GPIO_P0_CTRL,	0xa6,	0xff,	50},
 		{EM2874_R80_GPIO_P0_CTRL,	0xe6,	0xff,	100},
@@ -660,7 +660,7 @@ static void terratec_htc_usb_xs_init(struct em28xx *dev)
 	 * Init the analog decoder (not yet supported), but
 	 * it's probably still a good idea.
 	 */
-	struct {
+	static const struct {
 		unsigned char r[4];
 		int len;
 	} regs[] = {
@@ -704,7 +704,7 @@ static void pctv_520e_init(struct em28xx *dev)
 	 * digital demodulator and tuner are routed via AVF4910B.
 	 */
 	int i;
-	struct {
+	static const struct {
 		unsigned char r[4];
 		int len;
 	} regs[] = {
@@ -800,7 +800,7 @@ static int em28xx_mt352_terratec_xs_init(struct dvb_frontend *fe)
 static void px_bcud_init(struct em28xx *dev)
 {
 	int i;
-	struct {
+	static const struct {
 		unsigned char r[4];
 		int len;
 	} regs1[] = {
@@ -818,7 +818,7 @@ static void px_bcud_init(struct em28xx *dev)
 		{{ 0x85, 0x7a }, 2},
 		{{ 0x87, 0x04 }, 2},
 	};
-	static struct em28xx_reg_seq gpio[] = {
+	static const struct em28xx_reg_seq gpio[] = {
 		{EM28XX_R06_I2C_CLK,		0x40,	0xff,	300},
 		{EM2874_R80_GPIO_P0_CTRL,	0xfd,	0xff,	60},
 		{EM28XX_R15_RGAIN,		0x20,	0xff,	0},
-- 
2.20.1

