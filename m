Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49207271448
	for <lists+linux-media@lfdr.de>; Sun, 20 Sep 2020 14:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgITMQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Sep 2020 08:16:36 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:34001 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726376AbgITMQc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Sep 2020 08:16:32 -0400
X-IronPort-AV: E=Sophos;i="5.77,282,1596492000"; 
   d="scan'208";a="468612198"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256; 20 Sep 2020 14:08:58 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/14] [media] saa7146: drop double zeroing
Date:   Sun, 20 Sep 2020 13:26:24 +0200
Message-Id: <1600601186-7420-13-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

sg_init_table zeroes its first argument, so the allocation of that argument
doesn't have to.

the semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,n,flags;
@@

x = 
- kcalloc
+ kmalloc_array
  (n,sizeof(struct scatterlist),flags)
...
sg_init_table(x,n)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/common/saa7146/saa7146_core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/media/common/saa7146/saa7146_core.c b/drivers/media/common/saa7146/saa7146_core.c
--- a/drivers/media/common/saa7146/saa7146_core.c
+++ b/drivers/media/common/saa7146/saa7146_core.c
@@ -140,7 +140,7 @@ static struct scatterlist* vmalloc_to_sg
 	struct page *pg;
 	int i;
 
-	sglist = kcalloc(nr_pages, sizeof(struct scatterlist), GFP_KERNEL);
+	sglist = kmalloc_array(nr_pages, sizeof(struct scatterlist), GFP_KERNEL);
 	if (NULL == sglist)
 		return NULL;
 	sg_init_table(sglist, nr_pages);

