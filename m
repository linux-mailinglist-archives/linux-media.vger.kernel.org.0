Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81701655F62
	for <lists+linux-media@lfdr.de>; Mon, 26 Dec 2022 04:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiLZDPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Dec 2022 22:15:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiLZDPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Dec 2022 22:15:46 -0500
X-Greylist: delayed 335 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 25 Dec 2022 19:15:44 PST
Received: from mail.nfschina.com (unknown [42.101.60.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25703AD
        for <linux-media@vger.kernel.org>; Sun, 25 Dec 2022 19:15:44 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id 109581A009D9;
        Mon, 26 Dec 2022 11:10:15 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfs.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id P_amldgy5JXR; Mon, 26 Dec 2022 11:10:14 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
        (Authenticated sender: chuanjian@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id 3102E1A0087E;
        Mon, 26 Dec 2022 11:10:14 +0800 (CST)
From:   Dong Chuanjian <chuanjian@nfschina.com>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dong Chuanjian <chuanjian@nfschina.com>
Subject: [PATCH] drivers/media/common/siano/smsendian.c : eliminate unnecessary type conversions
Date:   Mon, 26 Dec 2022 11:10:05 +0800
Message-Id: <20221226031005.5482-1-chuanjian@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_05,RDNS_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

remove unnecessary void* type casting.

Signed-off-by: Dong Chuanjian <chuanjian@nfschina.com>

diff --git a/drivers/media/common/siano/smsendian.c b/drivers/media/common/siano/smsendian.c
index 8cb8853a1edb..a3573814919b 100644
--- a/drivers/media/common/siano/smsendian.c
+++ b/drivers/media/common/siano/smsendian.c
@@ -17,7 +17,7 @@
 void smsendian_handle_tx_message(void *buffer)
 {
 #ifdef __BIG_ENDIAN
-	struct sms_msg_data *msg = (struct sms_msg_data *)buffer;
+	struct sms_msg_data *msg = buffer;
 	int i;
 	int msg_words;
 
-- 
2.18.2

