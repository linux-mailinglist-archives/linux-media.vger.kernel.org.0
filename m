Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66C15CD25C
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2019 17:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfJFPEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Oct 2019 11:04:31 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55527 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfJFPEb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Oct 2019 11:04:31 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iH85F-0004Ds-HB; Sun, 06 Oct 2019 15:04:29 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: vpx3220: make array input_vals static, makes object smaller
Date:   Sun,  6 Oct 2019 16:04:29 +0100
Message-Id: <20191006150429.24311-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array input_vals on the stack but instead make it
static. Makes the object code smaller by 106 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  11744	   3536	    128	  15408	   3c30	drivers/media/i2c/vpx3220.o

After:
   text	   data	    bss	    dec	    hex	filename
  11574	   3600	    128	  15302	   3bc6	drivers/media/i2c/vpx3220.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/vpx3220.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vpx3220.c b/drivers/media/i2c/vpx3220.c
index 39f66e7a0e42..8be03fe5928c 100644
--- a/drivers/media/i2c/vpx3220.c
+++ b/drivers/media/i2c/vpx3220.c
@@ -375,7 +375,7 @@ static int vpx3220_s_routing(struct v4l2_subdev *sd,
 		 input = 1: COMPOSITE  input
 		 input = 2: SVHS       input  */
 
-	const int input_vals[3][2] = {
+	static const int input_vals[3][2] = {
 		{0x0c, 0},
 		{0x0d, 0},
 		{0x0e, 1}
-- 
2.20.1

