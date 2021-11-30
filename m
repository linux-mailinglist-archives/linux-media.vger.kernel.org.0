Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186C54630BB
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 11:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240730AbhK3KNX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 05:13:23 -0500
Received: from gofer.mess.org ([88.97.38.141]:60715 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235778AbhK3KNV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 05:13:21 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D0603C636D; Tue, 30 Nov 2021 10:10:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1638267001; bh=SYj7DxEyzlAHtOl+Yl00Jx13kTh7kakeUs/3TO+ZzcE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GFqHf84PCbUMvMzhzi4mSYbkghDusbDg9VROED/qfHqkMwXfEfqP8LXFRsEThH9J+
         6Bj6rgUmTIbFHg59p4ojftqs2QcByFJFkPHAqmrtckcMCQpG9cDyHkHBiBk2Q9YCm0
         nIBn5Qnkhf9AVq9f1aU4UcvJShhxPofGZmSNojm/LcQqLXjRg/u67mmGlaTABlc/fg
         RG4rtq262b2yVWg2Fe9VavY42i9rj2p1NeQrlrz4eXe8+08ml8dC4433gy6XaIfJCf
         bAl18m2knVRT9MMi6f/c45JTh8a1KZWk1GNbxRHt3TD2xtpuDJCEkjsHxZ7jd2pRef
         Ld/2bb2AG200A==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/3] media: iguanair: no need for reset after IR receiver enable
Date:   Tue, 30 Nov 2021 10:10:00 +0000
Message-Id: <831d12fe5ec195c27a4ebe1c8ae562f525df54d4.1638266939.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <7d4ef3b31c3fc45741154db622b71fd6d0f5f9e7.1638266939.git.sean@mess.org>
References: <7d4ef3b31c3fc45741154db622b71fd6d0f5f9e7.1638266939.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

An IR reset is only used when the IR hardware reports an error.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/iguanair.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
index 84949baf9f6b..f8d080e41f4c 100644
--- a/drivers/media/rc/iguanair.c
+++ b/drivers/media/rc/iguanair.c
@@ -262,9 +262,6 @@ static int iguanair_receiver(struct iguanair *ir, bool enable)
 	ir->packet->header.direction = DIR_OUT;
 	ir->packet->header.cmd = enable ? CMD_RECEIVER_ON : CMD_RECEIVER_OFF;
 
-	if (enable)
-		ir_raw_event_reset(ir->rc);
-
 	return iguanair_send(ir, sizeof(ir->packet->header));
 }
 
-- 
2.33.1

