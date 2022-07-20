Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFE457B889
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 16:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbiGTOa0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 10:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiGTOaZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 10:30:25 -0400
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3EDAD1DA66
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=mnFOC
        QPTOzA+WXBXkp2XvlBnOlhZaOisuT82eV6CqR8=; b=cYwefv4bcDpYPsq9dZZo0
        6w7Xw7/NnB0oX/8N6b2OcArcJsFusu15pRPzYJBVoIZxhj1fpYYPGOQKLjrmsyWk
        DGrie3Sf7jQdSQMZ2TOJ4kggIljs425uPpqwYZPsYoDEtFiNSg/pFTw2A6gGim54
        Dgu3uxklJ7H9hvnJlHcVr4=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp8 (Coremail) with SMTP id NORpCgCHj3NsEdhiD8rOIA--.5370S2;
        Wed, 20 Jul 2022 22:30:05 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     s.nawrocki@samsung.com, mchehab@kernel.org,
        alim.akhtar@samsung.com, linux-media@vger.kernel.org,
        windhl@126.com
Subject: [PATCH] media: exynos4-is: fimc-is: Add of_node_put() when breaking out of loop
Date:   Wed, 20 Jul 2022 22:30:03 +0800
Message-Id: <20220720143003.1288010-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgCHj3NsEdhiD8rOIA--.5370S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF18tFykZFWDuFyruF1xXwb_yoWkGFg_GF
        yIgay7ur95JrsF93y0yr93u340yrZ8W393Wa1ftrW7Kwn8ZF1UJr4vyry5Z347CrW7try3
        Wrs8AFy3CrnxtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKrWF7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgVEF1-HZiHNcQAAsv
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In fimc_is_register_subdevs(), we need to call of_node_put() for
the reference 'i2c_bus' when breaking out of the
for_each_compatible_node() which has increased the refcount.

Fixes: 9a761e436843 ("[media] exynos4-is: Add Exynos4x12 FIMC-IS driver")
Signed-off-by: Liang He <windhl@126.com>
---
 while commit-9a761e436843 is not the one using current nested
for_each_*, it also did not calll of_node_put() when breaking
out of loop for the out_side for_each_*.

 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index e3072d69c49f..a7704ff069d6 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -213,6 +213,7 @@ static int fimc_is_register_subdevs(struct fimc_is *is)
 
 			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM) {
 				of_node_put(child);
+				of_node_put(i2c_bus);
 				return ret;
 			}
 			index++;
-- 
2.25.1

