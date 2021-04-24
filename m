Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E21369F36
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236970AbhDXGqf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:35790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231921AbhDXGqM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EF5B61581;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=MOd3YN2iujeWfGs9BuWAFWWI6F9dHQCi3uqQZM46wqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UXoy4Z/7ZCyLyH/yxUfWN+kckMgoPnt7Ekj4coXxi65oKnGaUXP+LXufCT5XAfgWM
         J+RS3GuV6AQBcjIIQi88AJA+TvGBBtQ8ml4uGBL+afchY2j13EpCg0BFrY+NnAx0WR
         cNEP9vIBOQaJPWyvn+ZIHTsKDqkLjNmcQWGumrZ0GYsT4Q8q507QNQCwK1G4+4PEps
         4kvnPFXHHi+Qc9uKzLoefBa9PRyWDAuDUXTQvwebJzOiQKPZQ5HRFGkg4nz06bnt/Q
         slFaqRKNuOW45p7E4NsFkw1j2/OH6Ae2sfU5xl0dQCHJDqkjT4X9+YoelVxX7iWk4p
         NRNDPdyHCuNFA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004JeL-87; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 13/78] staging: media: hantro_drv: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:23 +0200
Message-Id: <0021158fb27035a56089683ee712fb3ed6f6032d.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/staging/media/hantro/hantro_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 595e82a82728..3147dcbebeb9 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -155,7 +155,7 @@ static void device_run(void *priv)
 	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
 	if (ret)
 		goto err_cancel_job;
-	ret = pm_runtime_get_sync(ctx->dev->dev);
+	ret = pm_runtime_resume_and_get(ctx->dev->dev);
 	if (ret < 0)
 		goto err_cancel_job;
 
-- 
2.30.2

