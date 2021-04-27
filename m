Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D37636C2E9
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237890AbhD0KQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:34658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236047AbhD0KPO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:15:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 359A36196E;
        Tue, 27 Apr 2021 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518434;
        bh=9XhzsT7qorzb0O8m+AZfDrHyIqnxWFrm1sswMUzcdRI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=homNswZsvi3mGrB+l98sroFS+C/F69CJQA+9KlUyxudW74Xi+ByY6ffj9t9pty0oW
         FYXGAGj4eQvOAlOjxHYdmWM7AfKSOtbfXnvOoKlORsojpR0Srlv/xGdiLrTZWhnQhq
         21ZL05Qiwme2NsO12Oq5nal3qRX+lK7scfhjCNDDm8Micc1frReWiNqg4jR1xgxQy8
         7/958He9RkPM/f9Njh/2KDGtyHv++RK5fa5eI2aZL1sBez0PzbgpA4tOhDsf/x9pPC
         lzut5TGIjsXxw9UAWXjvu7Vc8BRNzyE5omQiYa0pNduj9esu1e0x8IHZjYKwvlLj5z
         iV7WA6drJOYyQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj2-000j8P-Cq; Tue, 27 Apr 2021 12:13:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 79/79] media: hantro: document the usage of pm_runtime_get_sync()
Date:   Tue, 27 Apr 2021 12:13:46 +0200
Message-Id: <29a5f9cf9680a36fc1f6277364aa7c53776ed0cc.1619518193.git.mchehab+huawei@kernel.org>
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

Despite other *_get()/*_put() functions, where usage count is
incremented only if not errors, the pm_runtime_get_sync() has
a different behavior, incrementing the counter *even* on
errors.

That's an error prone behavior, as people often forget to
decrement the usage counter.

However, the hantro driver depends on this behavior, as it
will decrement the usage_count unconditionally at the m2m
job finish time, which makes sense.

So, intead of using the pm_runtime_resume_and_get() that
would decrement the counter on error, keep the current
API, but add a documentation explaining the rationale for
keep using pm_runtime_get_sync().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/hantro/hantro_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 595e82a82728..96f940c1c85c 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -155,6 +155,13 @@ static void device_run(void *priv)
 	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
 	if (ret)
 		goto err_cancel_job;
+
+	/*
+	 * The pm_runtime_get_sync() will increment dev->power.usage_count,
+	 * even on errors. That's the expected behavior here, since the
+	 * hantro_job_finish() function at the error handling code
+	 * will internally call pm_runtime_put_autosuspend().
+	 */
 	ret = pm_runtime_get_sync(ctx->dev->dev);
 	if (ret < 0)
 		goto err_cancel_job;
-- 
2.30.2

