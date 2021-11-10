Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19F544C042
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 12:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhKJLqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 06:46:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:47584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230440AbhKJLqj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 06:46:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4D9461107;
        Wed, 10 Nov 2021 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636544631;
        bh=cij5tqc7NOVk9YF9EKFeRZ9Z4y/NvBQ97G0hC0bPCb4=;
        h=From:To:Cc:Subject:Date:From;
        b=D+oBXRGLIV6VqhXgjoD4Lr4QE6xCyDuyrwh8MVVRskshhGB1zVw7Easzt5DZHu4Fg
         Z89hwoOgILPovQh+kkPxtmteAqmmk8PWt+oAXjv0M18oygcASixtY+u0MQtCxQ2fPo
         MT1zbS1wFASXzasD2oKTy92GZnTy2DHwKJFGdLzIZBxPtdnh55X291aIsc1ehct8kK
         NrYU6STLBZrft5Hc98ysYImU4RC5AFgdZkDnjQOgCV3j4V5ya0K68LqosIY+a7ozBq
         wbp1/9t51j51bvH9QNtvEIA7nJWSKIr35hrYqeRNxnhLAtzk80GMFLqndEQaDFQ6+x
         CVSuhtU3oLLig==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mkm16-003Lvd-3p; Wed, 10 Nov 2021 11:43:48 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alan <alan@linux.intel.com>, Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: get rid of atomisp_get_frame_pgnr() abstraction
Date:   Wed, 10 Nov 2021 11:43:46 +0000
Message-Id: <80ea920d14379124ba92aab2e6a6d12a92d79b2b.1636544620.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify the code by getting rid of this function, as it ends
being just a single line of code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c  | 16 ----------------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h  |  2 --
 drivers/staging/media/atomisp/pci/atomisp_fops.c |  2 +-
 3 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 4ef5d728cd2f..4bd5ab3a7863 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1931,22 +1931,6 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 	return IRQ_HANDLED;
 }
 
-/*
- * utils for buffer allocation/free
- */
-
-int atomisp_get_frame_pgnr(struct atomisp_device *isp,
-			   const struct ia_css_frame *frame, u32 *p_pgnr)
-{
-	if (!frame) {
-		dev_err(isp->dev, "%s: NULL frame pointer ERROR.\n", __func__);
-		return -EINVAL;
-	}
-
-	*p_pgnr = DIV_ROUND_UP(frame->data_bytes, PAGE_SIZE);
-	return 0;
-}
-
 /*
  * Get internal fmt according to V4L2 fmt
  */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index fb848d716947..ebc729468f87 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -74,8 +74,6 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
 const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
     u32 mbus_code);
 bool atomisp_is_mbuscode_raw(uint32_t code);
-int atomisp_get_frame_pgnr(struct atomisp_device *isp,
-			   const struct ia_css_frame *frame, u32 *p_pgnr);
 void atomisp_delayed_init_work(struct work_struct *work);
 
 /* Get internal fmt according to V4L2 fmt */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7ac313a2edf..0a8023aaf73d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -1094,7 +1094,7 @@ static int frame_mmap(struct atomisp_device *isp,
 
 	host_virt = vma->vm_start;
 	isp_virt = frame->data;
-	atomisp_get_frame_pgnr(isp, frame, &pgnr);
+	pgnr = DIV_ROUND_UP(frame->data_bytes, PAGE_SIZE);
 
 	if (do_isp_mm_remap(isp, vma, isp_virt, host_virt, pgnr))
 		return -EAGAIN;
-- 
2.33.1

