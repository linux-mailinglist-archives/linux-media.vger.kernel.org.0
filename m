Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0481E3756F0
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235255AbhEFP2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:28:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:41066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235573AbhEFP1y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B58F26101D;
        Thu,  6 May 2021 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314799;
        bh=MXpnKbLLJHoaKaSDG9Nm2cU25Bmpfhlpa/FbF9E3XvE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W8ip/QxH+Y0Etz5pdi/g8HQMWk5RcQl3yV626phIa7/INWQEP7huliglW1N5k5vKa
         Lxk8oKnLEHOGbZ7hu48dwEFxZ3XWfclHeA3g4OdJcAqneWqIM1Ai8ru2JgGYSma2Pf
         vxXdqNxQlboOkM+xfovZ92fvT0AByRGoWaJbVLvmqPFa18Dzgb61fzCGV+TVPBwDzP
         Yxd7NAqDG8GFh9Ldnm8zwkyKynfQ/bgWmoFS6N7LXqPGNGnxwiDlyf/j30IlaDewrI
         LM1w9YAYx+v0XkIKrutyF2LSdBNU+URCHf2pufpsRsN7/Lq4Bt3H1oOls7XXcV4+l/
         KDnAFT/pXUoag==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left7-000SBD-O8; Thu, 06 May 2021 17:26:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v5 03/25] staging: media: ipu3: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:41 +0200
Message-Id: <a32caa4bce0341ab99a4440a431b4aebd55f8498.1620314616.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/ipu3/ipu3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index ee1bba6bdcac..8e1e9e46e604 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -392,10 +392,9 @@ int imgu_s_stream(struct imgu_device *imgu, int enable)
 	}
 
 	/* Set Power */
-	r = pm_runtime_get_sync(dev);
+	r = pm_runtime_resume_and_get(dev);
 	if (r < 0) {
 		dev_err(dev, "failed to set imgu power\n");
-		pm_runtime_put(dev);
 		return r;
 	}
 
-- 
2.30.2

