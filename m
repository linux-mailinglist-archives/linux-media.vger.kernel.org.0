Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC88B3756DA
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235319AbhEFP14 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:27:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:40884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235239AbhEFP1m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C5786192E;
        Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314783;
        bh=WMp2TYCwNpx5gqoBY3FxSLCFIcbo/CZW59R5D62z+MU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AWt4hW2ZGZ3f85/eVQEa+XswyEFLuEpZnXpzJwBWHNQFjmoRz1fmS+qqwF2eKDIAj
         UWE+exzGn8DQp2upxeh45HWmwA7mZwfwTZHvY5WltSGNfEfYzuqJ/PSUTYVkGqksHo
         dBEVX/wFE01aSUs+RGsYTIpQPMo+K4Qqu43246mWwr4K6ExLmYY4ckV6KhSQ+KvA3/
         YM5GPsJYtMFZNeRDUT8xYlGF743M0LBfNEtn5KpIN6euQb1c2VlzBBq4HEmyzhn7t7
         E97PPTP8pvq0qxz31OaS6jtA4eTh+/gcuS/L2qdH61WDAL6QMZOljxw9TvRTJwJfcK
         eOblnxezeWNkg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left7-000SBb-UQ; Thu, 06 May 2021 17:26:05 +0200
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
Subject: [PATCH v5 09/25] media: ipu3: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:47 +0200
Message-Id: <af2a45be02dc5d19c756918c3aca5547291dd17b.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
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

