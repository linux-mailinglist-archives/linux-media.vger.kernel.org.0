Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C99B60230
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 10:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfGEIcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 04:32:48 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38234 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbfGEIcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 04:32:48 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hjJeA-0005fi-AX; Fri, 05 Jul 2019 08:32:46 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [media] saa7134: remove redundant assignment to variable value
Date:   Fri,  5 Jul 2019 09:32:46 +0100
Message-Id: <20190705083246.15849-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable value is being assigned with a value that is never
read and it is being updated later with a new value. The
assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/saa7134/saa7134-tvaudio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/saa7134/saa7134-tvaudio.c b/drivers/media/pci/saa7134/saa7134-tvaudio.c
index 5beff534d5e1..79e1afb71075 100644
--- a/drivers/media/pci/saa7134/saa7134-tvaudio.c
+++ b/drivers/media/pci/saa7134/saa7134-tvaudio.c
@@ -319,7 +319,6 @@ static int tvaudio_checkcarrier(struct saa7134_dev *dev, struct mainscan *scan)
 	__s32 left,right,value;
 
 	if (!(dev->tvnorm->id & scan->std)) {
-		value = 0;
 		audio_dbg(1, "skipping %d.%03d MHz [%4s]\n",
 			  scan->carr / 1000, scan->carr % 1000, scan->name);
 		return 0;
-- 
2.20.1

