Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03B21505A4D
	for <lists+linux-media@lfdr.de>; Mon, 18 Apr 2022 16:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344871AbiDROxz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Apr 2022 10:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344904AbiDROxr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Apr 2022 10:53:47 -0400
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CE71025C7B
        for <linux-media@vger.kernel.org>; Mon, 18 Apr 2022 06:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=rFyM7
        UM+tTaCOB7Y90lIkPaGdVr5Em85KHIfQrFKKao=; b=c3mAn5GAHY6bbFBZce1zD
        Vx4VYTN1aGiDJMMAocopFKx0TaO76KAtRsVs/jr+OOvfB+QF8yYUnSw9RH+VUeiV
        dTACo2NxT72F7Pt5XPj3g7q9Y9yipoeonBwfbA6DBNoYfGHewIdZQJRpXKhUnYJh
        z2h9J7hnBCavL6wcobAsbo=
Received: from localhost.localdomain.localdomain (unknown [115.197.34.188])
        by smtp9 (Coremail) with SMTP id DcCowAAn73Esal1iLY8pCA--.17729S2;
        Mon, 18 Apr 2022 21:39:56 +0800 (CST)
From:   chinayanlei2002@163.com
To:     linux-media@vger.kernel.org
Cc:     Yan Lei <yan_lei@dahuatech.com>
Subject: [PATCH] media: dvb-frontends: fix leak of memory fw
Date:   Sun, 10 Apr 2022 14:19:25 +0800
Message-Id: <20220410061925.4107-1-chinayanlei2002@163.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAAn73Esal1iLY8pCA--.17729S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF18XrWftF1xZF48KFWrGrg_yoW3AFb_Gw
        nrXFnxZr1rGF98A3s2yFWxZ34qy398Wr4vyFyfAr4xJrW0vF15XwsYyanxCFyxJayj9FyY
        yF1UXF1DAFyYkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1bdb5UUUUU==
X-Originating-IP: [115.197.34.188]
X-CM-SenderInfo: xfkl0tx1dqzvblsqiji6rwjhhfrp/1tbiMw3mLFXmA012gAAAs-
X-Spam-Status: No, score=1.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yan Lei <yan_lei@dahuatech.com>

Signed-off-by: Yan Lei <yan_lei@dahuatech.com>
---
 drivers/media/dvb-frontends/bcm3510.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-frontends/bcm3510.c b/drivers/media/dvb-frontends/bcm3510.c
index da0ff7b44..68b92b441
--- a/drivers/media/dvb-frontends/bcm3510.c
+++ b/drivers/media/dvb-frontends/bcm3510.c
@@ -649,6 +649,7 @@ static int bcm3510_download_firmware(struct dvb_frontend* fe)
 		deb_info("firmware chunk, addr: 0x%04x, len: 0x%04x, total length: 0x%04zx\n",addr,len,fw->size);
 		if ((ret = bcm3510_write_ram(st,addr,&b[i+4],len)) < 0) {
 			err("firmware download failed: %d\n",ret);
+			release_firmware(fw);
 			return ret;
 		}
 		i += 4 + len;
-- 
2.30.0

