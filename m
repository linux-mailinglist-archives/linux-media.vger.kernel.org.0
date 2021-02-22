Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D2832144C
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 11:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhBVKoO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 05:44:14 -0500
Received: from gofer.mess.org ([88.97.38.141]:60687 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229549AbhBVKoM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 05:44:12 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1A95AC63C9; Mon, 22 Feb 2021 10:43:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1613990610; bh=FHB/3IDezxLMlaGEHe5ms+wGYRpk36T1WVVi1ijGUM4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lwK1ON4d9CaLOweXftKpBgYHOFK6sW7//DmVMIdoaYG/czCS0hDjD7Q6K/jZGiP5T
         JJ5tGtZQOCifnMGQJt/kfAZ5IYjfpMWF+3Ux11NVcPLVFG1fgZCRzemd1fuTHTj9ID
         cuFQQBJrq/b+SGPGbsrJDfnfRsu1U4zPtYtnJBEPNewOBEvHAiORI+cdqezcTMb2Gb
         1jyD32cHESLz9UjsJS/qbatw8QFG6ruJt7ebFBZgopleb0TwCKQXnZA8GitYeDwaWZ
         FaErU+CB+KOpWuN3FuHZi9rCkSNqnGrBpHASXfZV3aqYWVk3UNDxpLNAgRTkSoC4q3
         jK2N8DvMeIAgw==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, Matthias Reichl <hias@horus.com>,
        =?UTF-8?q?Juan=20Jes=C3=BAs=20Garc=C3=ADa=20de=20Soria?= 
        <skandalfo@gmail.com>
Subject: [PATCH 2/6] media: ite-cir: set parent device
Date:   Mon, 22 Feb 2021 10:43:25 +0000
Message-Id: <4cec382d16edb64c3604d20f74c2e784479dc8c1.1613989288.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1613989288.git.sean@mess.org>
References: <cover.1613989288.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This ensure that the rc device shows up correctly in sysfs.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ite-cir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index 0c6229592e13..397e317d9726 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -1544,6 +1544,7 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 
 	/* set up ir-core props */
 	rdev->priv = itdev;
+	rdev->dev.parent = &pdev->dev;
 	rdev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	rdev->open = ite_open;
 	rdev->close = ite_close;
-- 
2.29.2

