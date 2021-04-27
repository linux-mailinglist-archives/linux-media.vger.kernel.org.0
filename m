Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5FDD36C2CB
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235747AbhD0KQI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:34910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235582AbhD0KOr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 205886191E;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=WMp2TYCwNpx5gqoBY3FxSLCFIcbo/CZW59R5D62z+MU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lf0kshXPK/rxqeTBI355c54YmL5dHtYmnPWjeN34v1sBREFxEAlBS1lNBlb2PTjq6
         di2EqkvfryMOgFlSKNQfzSWGSkQA5FkD4TnFZToTpWQCQOYALVk/PRkQZ8poivnKNj
         qoSP9BAt9wZpojA4ExnskRHcRjy/YaaGmfffGAMPoXEyZhKJthkPPA8dFXO55IHAVn
         EAfSraa5n4DVu6KaxADyMkldS0dWdNalNSe5jlWJbeNvthXLN+V5dfzn7MviVmeCnq
         51xPZdBmtA58Ob0j4YE6jqAdMsTGijzJOWp9vP8c4RM3lJKGnXNwWPjBQD8FKWLNfX
         apErN54b7iO4w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj1-000j7U-Bj; Tue, 27 Apr 2021 12:13:51 +0200
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
Subject: [PATCH v2 60/79] media: ipu3: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:27 +0200
Message-Id: <fbaa777d2a3b9c8e659967c88e6809e63561bf9c.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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

