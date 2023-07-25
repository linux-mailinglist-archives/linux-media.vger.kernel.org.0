Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6513C7606BF
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 05:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbjGYDhP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jul 2023 23:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbjGYDgl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jul 2023 23:36:41 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E8C171FF9
        for <linux-media@vger.kernel.org>; Mon, 24 Jul 2023 20:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=mYJ8dLUgJSzlR3N1cc
        1V3/lWiUK3eh1lHjD08Ze6yD8=; b=RJ1gsbCNo68Rvkce8iqtYMScCC7XGuen1s
        akSl2zsC5koSqFDcwD8AV+0bCeHoCNP+WS07tiV4Eaavg7p6hUZ5JGo84ZHuYLuU
        4kf+GX1LYoc8a8yoWAzWUY2rqSfIw4QKvD1rw561KFjWFe8q2kqObckhR8qnz6sJ
        rcoLX0LTg=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id _____wAndqbzQr9keenuBA--.24840S4;
        Tue, 25 Jul 2023 11:35:23 +0800 (CST)
From:   Yuanjun Gong <ruc_gongyuanjun@163.com>
To:     hverkuil@xs4all.nl
Cc:     crope@iki.fi, linux-media@vger.kernel.org, ruc_gongyuanjun@163.com
Subject: [PATCH v2 1/1] media: dvb: mb86a16: check the return value of mb86a16_read()
Date:   Tue, 25 Jul 2023 11:35:13 +0800
Message-Id: <20230725033513.20713-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <6fc14d76-a0c6-50a6-e5ea-5099eab4fa9c@xs4all.nl>
References: <6fc14d76-a0c6-50a6-e5ea-5099eab4fa9c@xs4all.nl>
X-CM-TRANSID: _____wAndqbzQr9keenuBA--.24840S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFyDXr1fGry3Ar1UtFW5KFg_yoWDCFg_W3
        Z3WF4fJF9Ykw4Syw1qvF1rZ348tF4UZry8Xa48KasxGayrKryrJw4vvF1DJrWxuFW5AFyY
        kr1ruFn5KF17JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMgAwUUUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbBiA635VaEF6OFjAABs6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

return an error code if mb86a16_read() gets an unexpected return
value.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/media/dvb-frontends/mb86a16.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/mb86a16.c b/drivers/media/dvb-frontends/mb86a16.c
index d3e29937cf4c..7efe00f47850 100644
--- a/drivers/media/dvb-frontends/mb86a16.c
+++ b/drivers/media/dvb-frontends/mb86a16.c
@@ -1487,10 +1487,11 @@ static int mb86a16_set_fe(struct mb86a16_state *state)
 		}
 	}
 
-	mb86a16_read(state, 0x15, &agcval);
-	mb86a16_read(state, 0x26, &cnmval);
-	dprintk(verbose, MB86A16_INFO, 1, "AGC = %02x CNM = %02x", agcval, cnmval);
-
+	if (mb86a16_read(state, 0x15, &agcval) != 2 ||	mb86a16_read(state, 0x26, &cnmval) != 2) {
+		dprintk(verbose, MB86A16_ERROR, 1, "I2C transfer error");
+		ret = -EREMOTEIO;
+	} else
+		dprintk(verbose, MB86A16_INFO, 1, "AGC = %02x CNM = %02x", agcval, cnmval);
 	return ret;
 }
 
-- 
2.17.1

