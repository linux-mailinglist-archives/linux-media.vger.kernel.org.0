Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6438ABBC7
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 17:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405698AbfIFPI2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 11:08:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48601 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbfIFPI2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 11:08:28 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i6FqZ-0001Eg-V9; Fri, 06 Sep 2019 15:08:24 +0000
From:   Colin King <colin.king@canonical.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: imx7-mipi-csis: make array 'registers' static const, makes object smaller
Date:   Fri,  6 Sep 2019 16:08:23 +0100
Message-Id: <20190906150823.30859-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array 'registers' on the stack but instead make it
static const. Makes the object code smaller by 10 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  20138	   5196	    128	  25462	   6376	staging/media/imx/imx7-mipi-csis.o

After:
   text	   data	    bss	    dec	    hex	filename
  20032	   5292	    128	  25452	   636c	staging/media/imx/imx7-mipi-csis.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 73d8354e618c..f8a97b7e2535 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -293,7 +293,7 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 	struct device *dev = &state->pdev->dev;
 	unsigned int i;
 	u32 cfg;
-	struct {
+	static const struct {
 		u32 offset;
 		const char * const name;
 	} registers[] = {
-- 
2.20.1

