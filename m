Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7587710224C
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 11:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbfKSKvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 05:51:22 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:43677 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727640AbfKSKvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 05:51:22 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X16MiClSQcs92X16OiynYK; Tue, 19 Nov 2019 11:51:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574160680; bh=9U+inmzg5NrDx5i6uhSFqhpwKs50Qq/7assBwITEC2U=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=HCcV+aS3b95/a481mRSNssdcmECUPmfJyV3vR3H5r3Fei8d7TIEH14tCou+6c+1aC
         TEbw5khaiRzswxJ2ViEJtvnCEoDD9wiuoqeW5z92lk57uLlxCJ/ZvOk4F3ZehZ2caD
         brxSWw4nMlR5oVQJo+jS5SpsZc6FnTMnWbkZBuAfpzSS+3CtWGg4cb05C8dhfbn+6K
         FJhcSP7SiDFTRzEhqeTbPKD6AfkNG435xiE7tmoCbdaGXRVrvcAqvptSRW1N68kP/9
         eBXNFmF9COSBFK9uGVKItc+8Lmc7nlJTjokt9eSMavCvWVY95NfScpVrYghihrAgfS
         y+15JMo0t6ZaQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/5] input/rmi4/rmi_driver: check if irq_find_mapping returns 0
Date:   Tue, 19 Nov 2019 11:51:17 +0100
Message-Id: <20191119105118.54285-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfITl6e8i82InOTHwXM3kdwYO2AxR8EsKQ3NIN50rAHb0nE7+NpDfx3mE0aarPKfcSasr0Ef93osdW5It+tibHUdNgekdaia7RnK1JLNhQe9ASaSRaj5Y
 01ScKcty+LNeFJk7S1KoU3uHCHNR/+GdaMmzWBexrnJQPZUBleqd1VFwyAiHcrwbjijryb0SIzJh+/W2xGnIofAyh8nccKoptJ2IxRw+4eHaVoINciU5/fmh
 uQYCUsTe1oqd//1y1LMgbJZpGVxy/vx86+7G1kdQdSKiTkDO09acp4XttZL7PEBZSHHh/y2lgAWQWtk1xlr2rXqF1UXKshBJgGpyjlzb0etJDqBE0XPFq7y+
 tUhSg0KxnAq6nkJf2uQFDKq+b2McMvnzVWvHUFmD+tVqsN7xzqyGGlKKlH+6JsKJXhVQ9hpSAkrXbw+FAUBtInmWE7pekAYhRS/+AbkWgAIru+kBPUm5qThf
 olwcCYk9h6xgzTBzYbBaB+ImNTreFf8npd3UDT5T+dh67J53wJ2Cu5wS9q4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The irq_find_mapping() function can return 0 when called in the
rmi_process_interrupt_requests() function.

This causes a kernel crash. Check for a 0 value and skip calling
handle_nested_irq() in that case.

This was tested with the F54 function enabled on a Lenovo X1 Carbon.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to irq_domain")
---
 drivers/input/rmi4/rmi_driver.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 772493b1f665..6085ec424a84 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -154,8 +154,12 @@ static int rmi_process_interrupt_requests(struct rmi_device *rmi_dev)
 	 */
 	mutex_unlock(&data->irq_mutex);
 
-	for_each_set_bit(i, data->irq_status, data->irq_count)
-		handle_nested_irq(irq_find_mapping(data->irqdomain, i));
+	for_each_set_bit(i, data->irq_status, data->irq_count) {
+		unsigned int irq = irq_find_mapping(data->irqdomain, i);
+
+		if (irq)
+			handle_nested_irq(irq);
+	}
 
 	if (data->input)
 		input_sync(data->input);
-- 
2.23.0

