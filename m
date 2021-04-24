Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5380369F44
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237233AbhDXGqm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:35994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232775AbhDXGqN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 457106161F;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=WMp2TYCwNpx5gqoBY3FxSLCFIcbo/CZW59R5D62z+MU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Pb0FEUVsstM+Ka+SkQXcxBAZ6ZpJMMXFngkYhhd6CadyNpITWzT76YSGBH3SAQCRl
         9OX0YLcnJNWDMOrbkA4N0EI5dzjD/wSrI8UedQhXMPnK9kOhh+gmg0z/ujpIfYe97u
         39QS+c8PGENgVvW0gbaKq14m3bpoo22M1yxXA8F8xIqGUYhBMM+oboHlllP3r7C28L
         GVEDa9qF/hrRkuIsF4f9HEQF9JIcMNtua0OSLQa0yFWCyDJstDSrntL2LAumR7ZqSk
         tYf8RJcrIpPB33Jl8uBbftVxQglMTmkm4uZO+A2DdXGb/lxzdX2DkTGxCdjhuteU6b
         zWci+lF6KHNsw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004JgN-Fm; Sat, 24 Apr 2021 08:45:32 +0200
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
Subject: [PATCH 55/78] media: ipu3: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:05 +0200
Message-Id: <8c2efb8ac0ead829bbcc9a5586b1e12491048c2b.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
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

