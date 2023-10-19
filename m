Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD8527CF9AD
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 14:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345863AbjJSMxW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 08:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345840AbjJSMws (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 08:52:48 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E961A3;
        Thu, 19 Oct 2023 05:52:45 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 3099A660733B;
        Thu, 19 Oct 2023 13:52:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1697719964;
        bh=QC82AXVc6xizeIJsB4Zdjgq5ICrOlS6NNBj04+AQSGQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nzQY/3yHzKSqzUJ/818B/ENYDwEWXb655pNJKShse15WkbIBah45tDltRimhXDOXF
         FFioq7uxFmA0d6hPu9kCRES+odyRSa5DYsBqZTgfx9Di8kv9CuQd7GHdDzWfpLv4r1
         yBrxjpXxhTBtwv2ADBTWvM/zhsKq14hELbsLn9dQ+G8030syc88oa/huHOH8T3O7Eq
         6B9ESm9mdABUvtWaNw0vZoitj56FLQBeR8R/i2JBNFCzOyEKAizyyl/1zNoItuLMEm
         aeZf/AIzspP8ZOuxl1UM/8ERHd3GpdpiYxReKsHVsELRgbSTrJty2EGggxtswHr+k3
         cUMcw8VBxTscQ==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v13 26/56] media: i2c: video-i2c: Stop direct calls to queue num_buffers field
Date:   Thu, 19 Oct 2023 14:51:52 +0200
Message-Id: <20231019125222.21370-27-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
This allows us to change how the number of buffers is computed in the
future.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/media/i2c/video-i2c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 178bd06cc2ed..ebf2ac98a068 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -405,9 +405,10 @@ static int queue_setup(struct vb2_queue *vq,
 {
 	struct video_i2c_data *data = vb2_get_drv_priv(vq);
 	unsigned int size = data->chip->buffer_size;
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2;
+	if (q_num_bufs + *nbuffers < 2)
+		*nbuffers = 2 - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
-- 
2.39.2

