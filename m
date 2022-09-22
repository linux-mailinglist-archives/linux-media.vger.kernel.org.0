Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEBD5E5D4B
	for <lists+linux-media@lfdr.de>; Thu, 22 Sep 2022 10:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiIVIUB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 04:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiIVIT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 04:19:59 -0400
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA4832DB5
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 01:19:52 -0700 (PDT)
Received: from mail02.huawei.com (unknown [172.30.67.143])
        by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4MY7Sb29WKzKN7s
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 16:17:51 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.102.38])
        by APP2 (Coremail) with SMTP id Syh0CgAnenOlGixj44fdBA--.59445S4;
        Thu, 22 Sep 2022 16:19:51 +0800 (CST)
From:   Wei Yongjun <weiyongjun@huaweicloud.com>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>, linux-media@vger.kernel.org
Subject: [PATCH] media: rc: ir-spi: Silence no spi_device_id warnings
Date:   Thu, 22 Sep 2022 08:37:03 +0000
Message-Id: <20220922083703.1761143-1-weiyongjun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgAnenOlGixj44fdBA--.59445S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Gw4DXw1rXr45Xr4fZF4Dtwb_yoW8Jr1kpF
        W5Xa45AFykWw45Gw4Sg3yxWF90ganagayFgry3Gw1Y9as7Zry3JFWxtFy7Xr1DGFWUJ3W3
        tFy0qryxJF4rArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
        6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
        vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
        xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
        0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
        6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
        Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
        c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
        CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
        MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJV
        Cq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
        CTnIWIevJa73UjIFyTuYvjxUzsqWUUUUU
X-CM-SenderInfo: 5zhl50pqjm3046kxt4xhlfz01xgou0bp/
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

SPI devices use the spi_device_id for module autoloading even on
systems using device tree, after commit 5fa6863ba692 ("spi: Check
we have a spi_device_id for each DT compatible"), kernel warns as
follows since the spi_device_id is missing:

SPI driver ir-spi has no spi_device_id for ir-spi-led

Add spi_device_id entries to silence the warning, and ensure driver
module autoloading works.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/media/rc/ir-spi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
index 51aa55a84bb5..bbc81bed4f90 100644
--- a/drivers/media/rc/ir-spi.c
+++ b/drivers/media/rc/ir-spi.c
@@ -158,8 +158,15 @@ static const struct of_device_id ir_spi_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ir_spi_of_match);
 
+static const struct spi_device_id ir_spi_ids[] = {
+	{ "ir-spi-led" },
+	{},
+};
+MODULE_DEVICE_TABLE(spi, ir_spi_ids);
+
 static struct spi_driver ir_spi_driver = {
 	.probe = ir_spi_probe,
+	.id_table = ir_spi_ids,
 	.driver = {
 		.name = IR_SPI_DRIVER_NAME,
 		.of_match_table = ir_spi_of_match,
-- 
2.34.1

