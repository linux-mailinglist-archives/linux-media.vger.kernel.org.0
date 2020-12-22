Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219E12E082F
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 10:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgLVJgh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 04:36:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgLVJgh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 04:36:37 -0500
Received: from mxf1.seznam.cz (mxf1.seznam.cz [IPv6:2a02:598:a::78:123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8242C0613D3
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 01:35:51 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc24a.ko.seznam.cz (email-smtpc24a.ko.seznam.cz [10.53.18.32])
        id 28fc588273f20ceb295594dc;
        Tue, 22 Dec 2020 10:35:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1608629745; bh=wL/lbQdvQk0RlXL3DINp578pj6X667R4j/wUE0eZbnI=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=lEJKjfhV6546G7b281IgFf06KlKWd9PSsc+/nw1NLi8yFCTAF9QjbVi9Y+EcOPvBA
         7DQyJ6JOdGQksLuFXrtZVOqIazjyLGRkAu6pu8QU/6PEDif1QRVZi6Tj509pTe5tfI
         IDQxamb29kZlwh0DcApvpJ4NcvpmE4hyyaZK92L0=
Received: from localhost.localdomain (ip-228-128.dynamic.ccinternet.cz [212.69.128.228])
        by email-relay24.ko.seznam.cz (Seznam SMTPD 1.3.122) with ESMTP;
        Tue, 22 Dec 2020 10:35:19 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH v3 1/1] media: i2c: imx219: add 1% tolerance on clock frequency
Date:   Tue, 22 Dec 2020 10:32:31 +0100
Message-Id: <20201222093231.13438-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds 1% tolerance on input clock frequency, similar to other
camera sensor drivers.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>

---

changes since v1: default to exactly 24MHz when `clock-frequency` is not 
present
changes since v2: remove the ability to set the clock to a specific
frequency, since assigned-clocks + assigned-clock-rates can be used 1:1
for the same purpose

---
 drivers/media/i2c/imx219.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f64c0ef7a897..fd2157eadac4 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1443,8 +1443,9 @@ static int imx219_probe(struct i2c_client *client)
 		return PTR_ERR(imx219->xclk);
 	}
 
+	/* this driver currently expects 24MHz; allow 1% tolerance */
 	imx219->xclk_freq = clk_get_rate(imx219->xclk);
-	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
+	if (imx219->xclk_freq < 23760000 || imx219->xclk_freq > 24240000) {
 		dev_err(dev, "xclk frequency not supported: %d Hz\n",
 			imx219->xclk_freq);
 		return -EINVAL;
-- 
2.29.2

