Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481D736DA0C
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240349AbhD1Oxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240275AbhD1Ox3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA62061456;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=Dz4yuaAkE3G30hsowoZG+/b+CgXUAS8PpNDZLkNm+lU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZX0mpl7M//ITWSgBZLCl23vqF5s2RBkEojQYiSSpy0rGP778niLf1vZz0oLfpxrYS
         vOuPDOsEkhRSt/HvAQJjXoQ9JAuE/YV3ins38c1TyEYw7KLhZJd2Sk0hPwmSjWKOvC
         adV903dRVKslctm7I6WYk0crbX6NVHPawVs3mcIA4o6YS0WGU4VN6Qn19uf4fubNYH
         v7Fx4pOvdk2LAmRjKQQGROrbnvAdnUvpl7wcOy/ZHc7ypyiC+d9AbCZG0Lw79GmPIy
         PaojTD7NLxiy2fxThwFLXY/PlPCcTK56rVceNQ7wJcoZQrMHKN4EBERMBgroqF9ooy
         6+xvzoW0RNeig==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYP-001Dph-KT; Wed, 28 Apr 2021 16:52:41 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 03/79] media: i2c: ccs-core: return the right error code at suspend
Date:   Wed, 28 Apr 2021 16:51:24 +0200
Message-Id: <e4160546ef150e605579b17328aa802d7797a4da.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If pm_runtime resume logic fails, return the error code
provided by it, instead of -EAGAIN, as, depending on what
caused it to fail, it may not be something that would be
recovered.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Fixes: cbba45d43631 ("[media] smiapp: Use runtime PM")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 9dc3f45da3dc..b05f409014b2 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3093,7 +3093,7 @@ static int __maybe_unused ccs_suspend(struct device *dev)
 	if (rval < 0) {
 		pm_runtime_put_noidle(dev);
 
-		return -EAGAIN;
+		return rval;
 	}
 
 	if (sensor->streaming)
-- 
2.30.2

