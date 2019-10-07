Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 084FBCDF17
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 12:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbfJGKSw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 06:18:52 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42756 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbfJGKSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 06:18:51 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iHQ6K-0001Gu-8G; Mon, 07 Oct 2019 10:18:48 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: gspca: make array st6422_bridge_init static, makes object smaller
Date:   Mon,  7 Oct 2019 11:18:48 +0100
Message-Id: <20191007101848.30540-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array st6422_bridge_init on the stack but instead
make it static. Makes the object code smaller by 231 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
   3419	    752	     64	   4235	   108b	gspca/stv06xx/stv06xx_st6422.o

After:
   text	   data	    bss	    dec	    hex	filename
   3124	    816	     64	   4004	    fa4	gspca/stv06xx/stv06xx_st6422.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c b/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c
index 7104a88b1e43..aac19d449be2 100644
--- a/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c
+++ b/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c
@@ -117,7 +117,7 @@ static int st6422_init(struct sd *sd)
 {
 	int err = 0, i;
 
-	const u16 st6422_bridge_init[][2] = {
+	static const u16 st6422_bridge_init[][2] = {
 		{ STV_ISO_ENABLE, 0x00 }, /* disable capture */
 		{ 0x1436, 0x00 },
 		{ 0x1432, 0x03 },	/* 0x00-0x1F brightness */
-- 
2.20.1

