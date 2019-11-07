Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7F3DF29CB
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 09:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733299AbfKGIwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 03:52:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:49748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733257AbfKGIwn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Nov 2019 03:52:43 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E8AB2077C;
        Thu,  7 Nov 2019 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573116760;
        bh=43ByQ6gvlhf2y6ofhwaPxlvBGJvkeMGzp+inDYYgrfI=;
        h=Date:From:To:Cc:Subject:From;
        b=z8uYIU8wqrkyNcEFvQuzRuOr9tiCMMrrdqxbNb/qMMylJ26mbGKzc/LLTm/ROUeef
         vKuMNa+1Z5qtDIxhdz8aAmOpPCdOV65i2iW2jgrkVK9SIrqsdYs1R02wHHk3Tgyx7r
         IbOYhgAaBQzByOc+kJgwCVhU+P0cyExytWeGLYMk=
Date:   Thu, 7 Nov 2019 09:52:38 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Patrice Chotard <patrice.chotard@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: c8sectpfe: no need to check return value of
 debugfs_create functions
Message-ID: <20191107085238.GA1285658@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 .../sti/c8sectpfe/c8sectpfe-debugfs.c         | 26 +++----------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-debugfs.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-debugfs.c
index 8f0ddcbeed9d..301fa10f419b 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-debugfs.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-debugfs.c
@@ -225,36 +225,16 @@ static const struct debugfs_reg32 fei_sys_regs[] = {
 
 void c8sectpfe_debugfs_init(struct c8sectpfei *fei)
 {
-	struct dentry		*root;
-	struct dentry		*file;
-
-	root = debugfs_create_dir("c8sectpfe", NULL);
-	if (!root)
-		goto err;
-
-	fei->root = root;
-
 	fei->regset =  devm_kzalloc(fei->dev, sizeof(*fei->regset), GFP_KERNEL);
 	if (!fei->regset)
-		goto err;
+		return;
 
 	fei->regset->regs = fei_sys_regs;
 	fei->regset->nregs = ARRAY_SIZE(fei_sys_regs);
 	fei->regset->base = fei->io;
 
-	file = debugfs_create_regset32("registers", S_IRUGO, root,
-				fei->regset);
-	if (!file) {
-		dev_err(fei->dev,
-			"%s not able to create 'registers' debugfs\n"
-			, __func__);
-		goto err;
-	}
-
-	return;
-
-err:
-	debugfs_remove_recursive(root);
+	fei->root = debugfs_create_dir("c8sectpfe", NULL);
+	debugfs_create_regset32("registers", S_IRUGO, fei->root, fei->regset);
 }
 
 void c8sectpfe_debugfs_exit(struct c8sectpfei *fei)
-- 
2.23.0

