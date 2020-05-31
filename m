Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC931E969F
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2020 11:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgEaJkq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 May 2020 05:40:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:38154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgEaJkp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 May 2020 05:40:45 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E38D2070B;
        Sun, 31 May 2020 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590918045;
        bh=498vV3wFsLFm1truFcBU/hb44KJqgkDqO1OJZpZhwO0=;
        h=From:To:Cc:Subject:Date:From;
        b=vTE/pctZJiP0BK3oSI5gmXRtWxiNpS3upSMpObABHMVnfF/RuKfg2k9zGk4Fsvxqv
         m1/ZiKP7vipEMdKioCMEr87vKGjyZWB9VeYc7Cr5j9d8Z1eq4dOj/qYWX9WOca75yU
         oJkjX+jSaSk83Mp1njR9q8yclR2CbRQvOIfvNwoY=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jfKSQ-003TMW-AP; Sun, 31 May 2020 11:40:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, kbuild test robot <lkp@intel.com>
Subject: [PATCH 1/2] media: atomisp: get rid of a left-over wrapper function
Date:   Sun, 31 May 2020 11:40:40 +0200
Message-Id: <1e056919536d65daf06091345a62523f827fde7a.1590918032.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The abstraction layer for kvfree() was removed, but there
is still a left-over code there.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 9c754e29fa00..9f3e421cd717 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1861,14 +1861,6 @@ ia_css_enable_isys_event_queue(bool enable) {
 	return 0;
 }
 
-void sh_css_free(void *ptr)
-{
-	if (is_vmalloc_addr(ptr))
-		vfree(ptr);
-	else
-		kfree(ptr);
-}
-
 /* For Acceleration API: Flush FW (shared buffer pointer) arguments */
 void
 sh_css_flush(struct ia_css_acc_fw *fw)
-- 
2.26.2

