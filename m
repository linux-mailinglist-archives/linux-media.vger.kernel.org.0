Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F361354C85C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 14:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348413AbiFOMVS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 08:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348025AbiFOMVR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 08:21:17 -0400
X-Greylist: delayed 3690 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Jun 2022 05:21:15 PDT
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A35AE3818D;
        Wed, 15 Jun 2022 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qRBqy
        tTLZ34Rt4thGWj9lEN5JpUglvigXgFN4dG4FQ0=; b=CJv5DMjNu1qbzk88jQzZt
        wYvxeUMZXC2JlwDpysvEUok80Emg4pFK38BmU6dTwgMEzaHHwN0zu8VkeDUhYyb0
        qqez4OVvCKvg1GyYOgbd9krmTITdHL8AEZD3kf5dfay//BL+yFqdH1/OzfzW6I1Z
        hpnvAzvaDfYHFqD90IfNJM=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp8 (Coremail) with SMTP id NORpCgD3mZYCualig72aFg--.47285S2;
        Wed, 15 Jun 2022 18:48:36 +0800 (CST)
From:   heliang <windhl@126.com>
To:     ldewangan@nvidia.com, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, p.zabel@pengutronix.de,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, windhl@126.com
Subject: [PATCH] drivers: tty: serial: Add missing of_node_put() in serial-tegra.c
Date:   Wed, 15 Jun 2022 18:48:33 +0800
Message-Id: <20220615104833.3963552-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgD3mZYCualig72aFg--.47285S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurW3KFyUCryDCw13JFWrZrb_yoW3CFb_Ww
        nrW3s7Xr4j9FsYqanavry3ur9Ivrn8WFnYqF92qas7W345ZF4DJrZ0qrn7J3sF93yxCrW3
        GrsrWFsrAr1DXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREWEE7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAQhF2JVj36C6QAAsn
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

Signed-off-by: heliang <windhl@126.com>
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

