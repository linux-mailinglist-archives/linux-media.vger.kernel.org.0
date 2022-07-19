Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A4857A165
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 16:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238571AbiGSO0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 10:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238690AbiGSOZ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 10:25:57 -0400
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E65D886888
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=zMLC2
        v8AapbLONOFTAyzuQMeLZWmkQMmbtekCkl9MEg=; b=Io3OUuwN418KA/drf2wWe
        /p5Bii/BtPluW+QwvoxySLkm+kkaUbfW0rqCnez3d21eMpxkf6EzwDUHGvlPTeJL
        epGCQt6vMnav2FbHBNRDUR/ZooXIm1LOamqRq3t8tsVHRus0IGy3u28ioCm+Qrwv
        dQn9HVNsruuri+c/Ewfx5A=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp9 (Coremail) with SMTP id NeRpCgDHcsdQu9ZizGl0Gw--.64800S2;
        Tue, 19 Jul 2022 22:10:25 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     patrice.chotard@foss.st.com, mchehab@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        windhl@126.com
Subject: [PATCH] media: c8sectpfe: Add of_node_put() when breaking out of loop
Date:   Tue, 19 Jul 2022 22:10:23 +0800
Message-Id: <20220719141023.1245125-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgDHcsdQu9ZizGl0Gw--.64800S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1rAw45Kr1DZr1UAr1kZrb_yoWDJFb_Cr
        yagFy7W3W8Cr4akF1jvr1ru3sFvrsY9rWrA3WxKryjv3yqvr1UG34YyFW5XFyUur4qvF98
        trZ5JFW0kr9xujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNtxhJUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBpDF2JVkbmdPwABsK
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In configure_channels(), we should call of_node_put() when breaking
out of for_each_child_of_node() which will automatically increase
and decrease the refcount.

Fixes: c5f5d0f99794 ("[media] c8sectpfe: STiH407/10 Linux DVB demux support")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index cefe6b7bfdc4..1dbb89f0ddb8 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -925,6 +925,7 @@ static int configure_channels(struct c8sectpfei *fei)
 		if (ret) {
 			dev_err(fei->dev,
 				"configure_memdma_and_inputblock failed\n");
+			of_node_put(child);
 			goto err_unmap;
 		}
 		index++;
-- 
2.25.1

