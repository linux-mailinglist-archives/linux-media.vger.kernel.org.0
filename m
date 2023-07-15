Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF1A5754808
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 11:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjGOJqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jul 2023 05:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjGOJqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jul 2023 05:46:02 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1E52A35A2
        for <linux-media@vger.kernel.org>; Sat, 15 Jul 2023 02:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=713+03xgy9eRajGqHA
        OGUuP+8EHeBWjkjk8H55fpPAI=; b=oUppqej5tiUcn55p3kyBg+RU7G7OXkb5ZN
        durviGSNIs/CMusgNzwMuokLDssq9Bt52PTl437hVeJaOhWQMsbSI4Fe8kjODcOn
        qNqcfX3go0bCk+/P6T2hr8ph2xeRfdy71nUm9QOkfHdXsfp6OpbgeKJ2xIFufV1I
        4Mqvq5qR4=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by zwqz-smtp-mta-g4-1 (Coremail) with SMTP id _____wDX9DG8arJkTQ9tAQ--.17796S4;
        Sat, 15 Jul 2023 17:45:46 +0800 (CST)
From:   Yuanjun Gong <ruc_gongyuanjun@163.com>
To:     Yuanjun Gong <ruc_gongyuanjun@163.com>,
        Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org
Subject: [PATCH 1/1] media:dvb: check the return value of mb86a16_read()
Date:   Sat, 15 Jul 2023 17:45:30 +0800
Message-Id: <20230715094530.36820-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDX9DG8arJkTQ9tAQ--.17796S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFyDXr1fGry3Cr1UJFWxCrg_yoWDCFc_W3
        Z3WF4fJF9Yyw4Syw1vyF10v348tF4DZry8X3WxKa43Ga1rKryrJw4vyFn8JrWxuFW5AFyY
        kr1ruFn5KF17JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRhL05UUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiJxCt5V5vExShjAABsl
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

return an error code if mb86a16_read() gets an unexpected return
value.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/media/dvb-frontends/mb86a16.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/mb86a16.c b/drivers/media/dvb-frontends/mb86a16.c
index d3e29937cf4c..f04188a72e7a 100644
--- a/drivers/media/dvb-frontends/mb86a16.c
+++ b/drivers/media/dvb-frontends/mb86a16.c
@@ -1487,9 +1487,12 @@ static int mb86a16_set_fe(struct mb86a16_state *state)
 		}
 	}
 
-	mb86a16_read(state, 0x15, &agcval);
-	mb86a16_read(state, 0x26, &cnmval);
-	dprintk(verbose, MB86A16_INFO, 1, "AGC = %02x CNM = %02x", agcval, cnmval);
+	if (mb86a16_read(state, 0x15, &agcval) != 2 ||	mb86a16_read(state, 0x26, &cnmval) != 2){
+		dprintk(verbose, MB86A16_ERROR, 1, "I2C transfer error");
+		ret = -EREMOTEIO;
+	}
+	else
+		dprintk(verbose, MB86A16_INFO, 1, "AGC = %02x CNM = %02x", agcval, cnmval);
 
 	return ret;
 }
-- 
2.17.1

