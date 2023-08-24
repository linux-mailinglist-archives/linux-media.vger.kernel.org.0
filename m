Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCA8D7864BD
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 03:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239107AbjHXBj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 21:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239128AbjHXBja (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 21:39:30 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D900610FC
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 18:39:11 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 78638807C4;
        Thu, 24 Aug 2023 03:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1692841149;
        bh=66jlWYI6u7UpHycVpxDeaFTO7Z2w8Drh+F3eeYqhcqk=;
        h=From:To:Cc:Subject:Date:From;
        b=t8/Ey5ppHIIVgGvVVTFGdBlSeXtxzhEjZ6+QvYAzTjE36HCs80yxXcdFrlpd0gTYO
         9sa6WCUaIoNsoKjjE/FEK/kk0EJH1SR/qpGd3o9v1lHs0mzf0bxW7E8nJks+zUDsFk
         51sklLBAe6pmyetqhJLzj9WwA4p7xC2q5gqnwDXJmtSdN44OmGqNYdHFIEOjFdiYcm
         7aS5+m3Wi3gi8ZPoCgC1z8tHC4NNXgPR60xqh2dzoJhmHJ5ppPowwnOIJMxzDKrj7T
         ZW1Siwb0Os44EOmZswgvoaOqwbxfLP6Yn8XKxicd4ZqReV0C2B822d7cSsK3qDkZLu
         ogmbky8r3rWjA==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH] media: hantro: Check whether reset op is defined before use
Date:   Thu, 24 Aug 2023 03:38:58 +0200
Message-Id: <20230824013858.303105-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX8MM/N/P does not define the .reset op since reset of the VPU is
done by genpd. Check whether the .reset op is defined before calling it
to avoid NULL pointer dereference.

Note that the Fixes tag is set to the commit which removed the reset op
from i.MX8M Hantro G2 implementation, this is because before this commit
all the implementations did define the .reset op.

Fixes: 6971efb70ac3 ("media: hantro: Allow i.MX8MQ G1 and G2 to run independently")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/media/platform/verisilicon/hantro_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 423fc85d79ee3..50ec24c753e9e 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -125,7 +125,8 @@ void hantro_watchdog(struct work_struct *work)
 	ctx = v4l2_m2m_get_curr_priv(vpu->m2m_dev);
 	if (ctx) {
 		vpu_err("frame processing timed out!\n");
-		ctx->codec_ops->reset(ctx);
+		if (ctx->codec_ops->reset)
+			ctx->codec_ops->reset(ctx);
 		hantro_job_finish(vpu, ctx, VB2_BUF_STATE_ERROR);
 	}
 }
-- 
2.40.1

