Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4906750CCCC
	for <lists+linux-media@lfdr.de>; Sat, 23 Apr 2022 20:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235339AbiDWSEU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Apr 2022 14:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiDWSET (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Apr 2022 14:04:19 -0400
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8583BA47
        for <linux-media@vger.kernel.org>; Sat, 23 Apr 2022 11:01:21 -0700 (PDT)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id D8D5D4C1393;
        Sat, 23 Apr 2022 18:01:20 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (unknown [127.0.0.6])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id E5C7D4C1946;
        Sat, 23 Apr 2022 18:01:19 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1650736880; a=rsa-sha256;
        cv=none;
        b=2Vn3Fv5LQvJatxPAsAUmGnexYL1e90YCHTdRYna/QttD7ELNsKKoTkkx1Sz+MLCqZzm7JL
        ggmSvJytl1CDAQ3ndJbVDlUwfxyiRnBBH/6PB6njICpwEsvD/q0Upk2s0RdxtgBQDjdceG
        +yTU2TJNCe79aed12fpQfe4yeqzrGV7nvZq9gAcL5pLDRRKhj7OmRTUe3QYVlh8/MB3x5N
        HtpILjvmG17vfW+q9ON8hmp/OLclHmX3hHyO2DOnpE+5Qq6lPB3DeAxLKXpEfdTUHxvtgq
        NL8jeuYWhO//9Mj7joNje0J5J8vnPb2XHNQfXsjkWE8wj9O4lw6oJijb3bz6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1650736880;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:dkim-signature;
        bh=KROeqUDGOquU8fmdmA9JdIiToKeZSZx+X3UvjGo7Oe4=;
        b=zCKlGEJVZwBDfwiegd5lZ+8TSBqBxSTSBMj3jGtoosNvOcN76HBs8j0DuV1SJjpcNGzVj0
        yFYzVadYGmJqdKvxj7ZiM/d09mmpBvGCvjN0bOa8c7/HrYmMcmpNkSZibk+iKTg/hyZ8g3
        jvFvLriwlS8BPQj1x3JQIzVfyIUQJ1bODIl5oOJo4pzbGIXXHpHzQ8jsV9+GiopkaKZ6jT
        Oi/F0IWJJDYLJKlOjoDybROapPt3nVsXD2oGCFsstZOaAWRt6DlK54qnLItsdc6hnx5Ox+
        VIRVeduPYVvuWcnAokOJNHvnYoJkuLKf4d1salI1Q2Dk6Jj8MVEHxzpSgZHbbQ==
ARC-Authentication-Results: i=1;
        rspamd-67b64f579b-chnfp;
        auth=pass smtp.auth=dreamhost smtp.mailfrom=ian@linux.cowan.aero
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ian@linux.cowan.aero
X-MailChannels-Auth-Id: dreamhost
X-Stretch-Lettuce: 06d9101737a68436_1650736880630_4253762475
X-MC-Loop-Signature: 1650736880630:2496170403
X-MC-Ingress-Time: 1650736880629
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.107.255.136 (trex/6.7.1);
        Sat, 23 Apr 2022 18:01:20 +0000
Received: from localhost.localdomain (unknown [69.12.38.97])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ian@linux.cowan.aero)
        by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4Klzby4Xmmz2g;
        Sat, 23 Apr 2022 11:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.cowan.aero;
        s=dreamhost; t=1650736879;
        bh=KROeqUDGOquU8fmdmA9JdIiToKeZSZx+X3UvjGo7Oe4=;
        h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
        b=Cc6tk2+gGqjEY00FnyCgRAA8RzjzMOIn0bczudgrJ1uTRLFK4i7g3XPO7e1ugbUNz
         MQqgPaA97C4x7SmlTCInBr1rou834doMyHFxfefhAX6aqvW04DplrclrvjP36dny+S
         AGve9Zk3hLzm2KWfRsb2I8CrRtwEitNP+byPwHVfkl7OFtOcI5No+fI7eX42obYZic
         0X9zvSCTvY2RGmwxEbtadffrad1sL+6KNdyoReekPo3khrfujV+l5pzMwmwOkZCYQB
         i/TjLelD9vgqsRQ6RF6qqcRf+w+sgH4k1DO7PrFWVKgG5UnNvp17BZQRSSM3zCKC0S
         BFQL31UtldOZQ==
From:   Ian Cowan <ian@linux.cowan.aero>
To:     mripard@kernel.org
Cc:     paul.kocialkowski@bootlin.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        ian@linux.cowan.aero
Subject: [PATCH] staging: sunxi: cedrus: centralize cedrus_open exit
Date:   Sat, 23 Apr 2022 14:01:11 -0400
Message-Id: <20220423180111.91602-1-ian@linux.cowan.aero>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor the cedrus_open() function so that there is only one exit to
the function instead of 2. This prevents a future change from preventing
the mutex from being unlocked after a successful exit.

Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 68b3dcdb5df3..5236d9e4f4e8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -348,14 +348,14 @@ static int cedrus_open(struct file *file)
 
 	v4l2_fh_add(&ctx->fh);
 
-	mutex_unlock(&dev->dev_mutex);
-
-	return 0;
+	ret = 0;
+	goto succ_unlock;
 
 err_ctrls:
 	v4l2_ctrl_handler_free(&ctx->hdl);
 err_free:
 	kfree(ctx);
+succ_unlock:
 	mutex_unlock(&dev->dev_mutex);
 
 	return ret;
-- 
2.35.1

