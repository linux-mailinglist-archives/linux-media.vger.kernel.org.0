Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29EDE36C3C3
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235555AbhD0K3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:48156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237957AbhD0K2b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A17046142E;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519237;
        bh=WMp2TYCwNpx5gqoBY3FxSLCFIcbo/CZW59R5D62z+MU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RGghy5CizAQ4cGRG3F08+R71O0onTP2CoJTE+NNH9LVpyKN+NegeomgZOjKcp8XzO
         gKsauzHXBUxpfc0E3b7wPtvOH/NmquSPcHaLiDNZGDT0xCeqYw9nzh9vXhsIOP45eX
         zG1ks1f4ktXBpItrpi10e988WdGczY7dvnlwXb9/VJSWXgL/GRu2l37NgEl42pTHp7
         0NzKcMnyL6Xk+2YahXBhVTZqnuz4BG9LR/1oAo/0Q+/rFh8mQRrwkR/OTfUhGexEZE
         uLqITCMpjj7x3Q/9JSXhdn1ucBkKy6XhNw0Ze4x9IxNqiGfm+GG/1GdPURgiESWVAa
         qsFmLa1GQp9Wg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvy-000o27-BM; Tue, 27 Apr 2021 12:27:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Yong Zhi <yong.zhi@intel.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3 60/79] media: ipu3: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:50 +0200
Message-Id: <f6c6562434a52386845491990c5af58286ca8414.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index fecef85bd62e..ca8040d1a725 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -975,10 +975,9 @@ static int cio2_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cio2->cur_queue = q;
 	atomic_set(&q->frame_sequence, 0);
 
-	r = pm_runtime_get_sync(&cio2->pci_dev->dev);
+	r = pm_runtime_resume_and_get(&cio2->pci_dev->dev);
 	if (r < 0) {
 		dev_info(&cio2->pci_dev->dev, "failed to set power %d\n", r);
-		pm_runtime_put_noidle(&cio2->pci_dev->dev);
 		return r;
 	}
 
-- 
2.30.2

