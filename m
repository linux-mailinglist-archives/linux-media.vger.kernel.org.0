Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6581E008B
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 18:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729097AbgEXQZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 12:25:07 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39607 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgEXQZH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 12:25:07 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jctQt-0008Kc-BJ; Sun, 24 May 2020 16:25:03 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [PATCH] media: gspca: remove redundant assignment to variable retval
Date:   Sun, 24 May 2020 17:25:03 +0100
Message-Id: <20200524162503.20902-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable retval is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/gspca/jl2005bcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/jl2005bcd.c b/drivers/media/usb/gspca/jl2005bcd.c
index 80ce7448b3dd..ca12f33f3e12 100644
--- a/drivers/media/usb/gspca/jl2005bcd.c
+++ b/drivers/media/usb/gspca/jl2005bcd.c
@@ -165,7 +165,7 @@ static int jl2005c_get_firmware_id(struct gspca_dev *gspca_dev)
 {
 	struct sd *sd = (struct sd *)gspca_dev;
 	int i = 0;
-	int retval = -1;
+	int retval;
 	unsigned char regs_to_read[] = {0x57, 0x02, 0x03, 0x5d, 0x5e, 0x5f};
 
 	gspca_dbg(gspca_dev, D_PROBE, "Running jl2005c_get_firmware_id\n");
-- 
2.25.1

