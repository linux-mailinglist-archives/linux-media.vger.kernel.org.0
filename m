Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94B8B102255
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 11:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbfKSKvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 05:51:24 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:49605 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727646AbfKSKvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 05:51:22 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X16MiClSQcs92X16OiynYV; Tue, 19 Nov 2019 11:51:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574160680; bh=K6hYpltp/ZoW+ANAksmPQOMy+7HBkZ0IaQfGtBZ5Za0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=NUt1JnFA/XPdbnxDDH4N7+74icOwoBnc1hXVAppiZyaGuFzvg3qZUnzwx7Scepe2Z
         F245OjL9zxvWfGaXOMNLLSugiHlGV0ZeUWLPjpT5dD4AVw6yQtHESZcGu3TvPtZGgm
         xBv0Jkddr2ge/nCJJuwSR46E+E6PmhDNIOGjBpz+RMzVOLK1kdAyv9Bt2+LbI3dOyz
         3AQcYm7nwX0I5bVV4PXXuAB3UCIMjtdqoA7rDwx5zIT+MbWUDUfxIH7svBlvLTHqzh
         mQGsbSEfiMop3qXtXBWV2AZfGkOkWRTcVcu04xgcz2tGQ/ZZWhU13Qmmbl9AG4fkO0
         4wSDfO4xVTQog==
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
Subject: [PATCH 5/5] input/rmi4/rmi_smbus.c: don't increment rmiaddr in rmi_smb_read_block()
Date:   Tue, 19 Nov 2019 11:51:18 +0100
Message-Id: <20191119105118.54285-6-hverkuil-cisco@xs4all.nl>
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

This increment of rmi_smbus causes garbage to be returned.
The first read of SMB_MAX_COUNT bytes is fine, but after that
it is nonsense. Trial-and-error showed that by dropping the
increment of rmiaddr everything is fine and the F54 function
properly works.

Even going back to the original code when F54 was added, I
could not make it work without this patch. So I do not understand
how this ever worked.

My guess is that the same change is needed in rmi_smb_write_block,
but I wouldn't know how to test this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/input/rmi4/rmi_smbus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
index 2407ea43de59..79ecea5edacc 100644
--- a/drivers/input/rmi4/rmi_smbus.c
+++ b/drivers/input/rmi4/rmi_smbus.c
@@ -215,7 +215,6 @@ static int rmi_smb_read_block(struct rmi_transport_dev *xport, u16 rmiaddr,
 		/* prepare to read next block of bytes */
 		cur_len -= SMB_MAX_COUNT;
 		databuff += SMB_MAX_COUNT;
-		rmiaddr += SMB_MAX_COUNT;
 	}
 
 	retval = 0;
-- 
2.23.0

