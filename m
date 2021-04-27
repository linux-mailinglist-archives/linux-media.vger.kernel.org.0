Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F7B36C392
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238212AbhD0K2z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:48226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235745AbhD0K2L (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6488961401;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=9FSuKWFuUqPUC2dP9taAm5sC7kLWnC4fEOP9jl+QpYQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QY/7spUb4xHt2c+pEbJSl8E7YK4mRX7fk2MMnW+kU0w2o7g3bdn+6a1hPrMmZJSfi
         fntk3BoV7yh4E7NRP7I3n7LDfWvDCzYpN9Nk4JlztFbLmeDBtppIQWtZ3sjng1mm8u
         ebJMRz/muLX2vi/Q/lAmcBdkJ0LFsvOi2SGEBOanrLLTnbZ77TwrBkx1BEwFM3+VYo
         JAXm74kBxtNh/YR4iax3T8V+irNYOziZ6in1f9iMlEuXpYlwQ4GECl3GQorGys6yyY
         Lfk7s7h9sW0xRf15A+JyQL8zEkMut2k3xr4+wVw1vZJx9rZiRxrImaxrNWJZhICAiQ
         lE/ds4RgcLGjQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvw-000o0K-4u; Tue, 27 Apr 2021 12:27:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3 23/79] staging: media: ipu3: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:13 +0200
Message-Id: <ffd5c32851bd65f9e4399d1925ae03d46a7ed57b.1619519080.git.mchehab+huawei@kernel.org>
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

