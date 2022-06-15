Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEBC854C7B6
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 13:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343705AbiFOLts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 07:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237723AbiFOLtr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 07:49:47 -0400
X-Greylist: delayed 1877 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Jun 2022 04:49:45 PDT
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9D03248331;
        Wed, 15 Jun 2022 04:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=QqKPV
        BGfow1c4ZMlx0YSYTPT8kkKDZgzEU0kwf4SuA4=; b=iU8zznYKuLyz1drshpTqO
        UeX4dBnETWilJ5oDPVg0IeQWmZAK+TVvp30JV3ZVerG0n6Zoeu5AmWPz1U9zy5pb
        Qg3zT4bGYEhCYL9FDGlt1No38v/GeusGfJMRkDlqjwTRaDvN58dOr2r7tSni71L2
        a+8ilkCnwIJdhU8q9+6h1M=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp1 (Coremail) with SMTP id C8mowAD3Jifbv6liZhOoEQ--.58335S2;
        Wed, 15 Jun 2022 19:17:47 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     ldewangan@nvidia.com, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, p.zabel@pengutronix.de,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, windhl@126.com
Subject: [PATCH] drivers: tty: serial: Add missing of_node_put() in serial-tegra.c
Date:   Wed, 15 Jun 2022 19:17:47 +0800
Message-Id: <20220615111747.3963930-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowAD3Jifbv6liZhOoEQ--.58335S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurW3KFyUCryDCw13JFWrZrb_yoW3CFb_Ww
        nrW3s7Zr4j9FsYqanavry3ur9IvFn8WFnYqF92qas7W345ZF4DJrWqqrn7A3sF93y7CrW3
        CrsrWFsrAr1DXjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRimhFDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhwhF18RPTCjAAAAsE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In tegra_uart_init(), of_find_matching_node() will return a node
pointer with refcount incremented. We should use of_node_put()
when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/tty/serial/serial-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index d942ab152f5a..5c4850a3762c 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -1667,6 +1667,7 @@ static int __init tegra_uart_init(void)
 	node = of_find_matching_node(NULL, tegra_uart_of_match);
 	if (node)
 		match = of_match_node(tegra_uart_of_match, node);
+	of_node_put(node);
 	if (match)
 		cdata = match->data;
 	if (cdata)
-- 
2.25.1

