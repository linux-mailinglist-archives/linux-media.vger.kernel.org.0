Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9696242BEEF
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 13:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhJMLfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 07:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhJMLfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 07:35:00 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DFCDC061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 04:32:57 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9FDABC63B0; Wed, 13 Oct 2021 12:32:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1634124773; bh=9qXvei4FjAU6HNHpjx2tc+nq8sA/ndqrYZ9udmmQ5Z8=;
        h=From:To:Cc:Subject:Date:From;
        b=PJ/22WnnIkcD3H6tvDbnej8PMU6S9wwUTttwQZcNY4PaA95WeRE5oXVGKVtc5kORx
         bButxEJmQz6xuZRveC1gt9T4qg/i/solL1STdJqiA1to1y/EKCkmcnHD1GqSf+I6Q4
         DhvzoPtlihhCflAdnP3gBboQXxIs6p5b5qGZPaX6C7qYT/iRrxDg8fYeJDWliLW6Eo
         xARTwmX5RbWknHK9bXIz7is5pa3C5YdXwSHvfNEmS5WsnL3dOTHngoTNN/CEr1wjwS
         a2rTcrnRSQgsOfahAd1p9iabU/GnfQEvy4aNHTxSnhYrMO1XP+wZYkxBmD/nckYe6X
         5zcTl/8E++60g==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: ir_toy: assignment to be16 should be of correct type
Date:   Wed, 13 Oct 2021 12:32:53 +0100
Message-Id: <20211013113253.24707-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

commit f0c15b360fb6 ("media: ir_toy: prevent device from hanging during
transmit") removed a cpu_to_be16() cast, which causes a sparse warning.

Fixes: f0c15b360fb6 ("media: ir_toy: prevent device from hanging during transmit")

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir_toy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
index 71aced52248f..7e98e7e3aace 100644
--- a/drivers/media/rc/ir_toy.c
+++ b/drivers/media/rc/ir_toy.c
@@ -318,7 +318,7 @@ static int irtoy_tx(struct rc_dev *rc, uint *txbuf, uint count)
 		buf[i] = cpu_to_be16(v);
 	}
 
-	buf[count] = 0xffff;
+	buf[count] = cpu_to_be16(0xffff);
 
 	irtoy->tx_buf = buf;
 	irtoy->tx_len = size;
-- 
2.31.1

