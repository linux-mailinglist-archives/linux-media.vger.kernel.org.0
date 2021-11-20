Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA02457E03
	for <lists+linux-media@lfdr.de>; Sat, 20 Nov 2021 13:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237491AbhKTMft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Nov 2021 07:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237521AbhKTMfs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Nov 2021 07:35:48 -0500
X-Greylist: delayed 550 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 20 Nov 2021 04:32:45 PST
Received: from danwin1210.me (danwin1210.me [IPv6:2a01:4f8:c010:d56::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A34C06173E
        for <linux-media@vger.kernel.org>; Sat, 20 Nov 2021 04:32:45 -0800 (PST)
Received: from danwin1210.me (unknown [10.9.0.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X448 server-signature ECDSA (P-384)
         client-signature ED448)
        (Client CN "danwin1210.me", Issuer "danwin1210.me" (verified OK))
        by mail.danwin1210.me (Postfix) with ESMTPS id C04D21F4B7;
        Sat, 20 Nov 2021 12:23:33 +0000 (UTC)
Received: from prine.. (unknown [10.9.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
        (No client certificate requested)
        by danwin1210.me (Postfix) with ESMTPSA id CF0493C73F;
        Sat, 20 Nov 2021 12:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danwin1210.me;
        s=mail; t=1637411012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1D6TK4pBt+NhUD9V+WvMMJAWVBcNVUjT9h+cnTkVwa4=;
        b=lGqKcqM1w4bzz8fvqwwRkdQlQWLcNE7VjVfY5lBAiE3H0Xng3QMa5IpOz8Gc51LojS1L/B
        gN+b78QHgc4gFNhiFA8yHPIKzGCXjJvS2zAtB0qJdiHLa9saQ38qLkDa1F0TtDgHjItf7t
        G5jiHsnSVLPB7M8TjMAjJdO5KAgUtK7yCqV1Uu4oENhSkd0iNlzR/shwYQqvmFHTAi6Z6/
        ooM2ljJpP3i8CaGaeBVI6hiNNdc9IZpVR17tzjIeE5kKCIT5o4XIv0bkb31EDzzuWu+hTS
        piukyCFnyIxY9dCrWpLspKQ8vtdPvjT4GOu5PFm2CSP6OxxT9JGpuGbs2Rs50rUhUk79C9
        m/5nKxVvnRHWVTv9c3Fyiugzams10SukBr2VmYNG4qMPan4Fy9nnmOyXUFUcJf6t06Kez0
        1dzHJotCm6v8GUDd6SO1vUEGJGoVdm7zDJBMyECyyN+W0UDaLDsU2HwE+Yk0uN8HvAp3R6
        kU3QALwN02tgnaOMbSJLuVHfJWI7UIdOuESaBOOA+EGlAo7zFLlLCTzjXEB/vNeI/ewisR
        Fp3LRNE3Do2IjVcjp4ozCm7V6ThmanxlM86uX5eJ56Y7fZhyaEny7p7RTNNrg44UXWJJKa
        BWkgufRYOOZsgzTPUF+O+V8qmc4WXpM400PO7wNzdnlcEm8iuvuZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=danwin1210.me;
        s=ed25519; t=1637411013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1D6TK4pBt+NhUD9V+WvMMJAWVBcNVUjT9h+cnTkVwa4=;
        b=KfAvgOaW3xIq59Ehg6Er/7s4YExuLtnJW/GBF57Bcrdn1nO0kJNqeoTUXk81yuTrWxj4PJ
        siZqwcX5VgRbPHAw==
From:   Kyle Copperfield <kmcopper@danwin1210.me>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kyle Copperfield <kmcopper@danwin1210.me>,
        Dragan Simic <dragan.simic@gmail.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: rockchip/rga: do proper error checking in probe
Date:   Sat, 20 Nov 2021 12:23:02 +0000
Message-Id: <20211120122321.20253-1-kmcopper@danwin1210.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The latest fix for probe error handling contained a typo that causes
probing to fail with the following message:

  rockchip-rga: probe of ff680000.rga failed with error -12

This patch fixes the typo.

Fixes: e58430e1d4fd (media: rockchip/rga: fix error handling in probe)
Reviewed-by: Dragan Simic <dragan.simic@gmail.com>
Signed-off-by: Kyle Copperfield <kmcopper@danwin1210.me>
---
 drivers/media/platform/rockchip/rga/rga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 6759091b15e0..d99ea8973b67 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -895,7 +895,7 @@ static int rga_probe(struct platform_device *pdev)
 	}
 	rga->dst_mmu_pages =
 		(unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
-	if (rga->dst_mmu_pages) {
+	if (!rga->dst_mmu_pages) {
 		ret = -ENOMEM;
 		goto free_src_pages;
 	}
-- 
2.34.0

