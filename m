Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B44536C3A7
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238316AbhD0K3J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:48278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235976AbhD0K2P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 735A06140E;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=9XhzsT7qorzb0O8m+AZfDrHyIqnxWFrm1sswMUzcdRI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tf914diWBrl8TDvXMl5MLXGnXhoS7XUaWw5QGfh55jhiWLbSpRdpvTzlw8J5UysaU
         jBsXLJJNXnvdzEzd5UuC4JNMdgz4Apn3uggzXUulqA7iTvZjqMwLrpDUy+UTJpIQhv
         CJat0sLmS/XVxjPR6B8gwIlB9aLieQI8PheQt35mTD0a1cGmLmk4t8ULtrwmgoC5IM
         L2Kld2gSrXRUa4stHtOpUh71/ja/dRGVRGLemrB7h8mI4q9pGNcLH5eAlrasCDTiqe
         h6f3S7+apWzvZimwh2HHitnK1E4i7y2E1fPmelY7kH7j9cnMhxgMb1CmXxl63Q928Q
         l8vs9Z0HYh9ig==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvz-000o32-Tr; Tue, 27 Apr 2021 12:27:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v3 79/79] media: hantro: document the usage of pm_runtime_get_sync()
Date:   Tue, 27 Apr 2021 12:27:09 +0200
Message-Id: <230f22170db7fa57b49cff4570cef15bf11b2ad5.1619519080.git.mchehab+huawei@kernel.org>
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

