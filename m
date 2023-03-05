Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4FB36AB228
	for <lists+linux-media@lfdr.de>; Sun,  5 Mar 2023 21:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjCEUvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Mar 2023 15:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjCEUvX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Mar 2023 15:51:23 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7294D32F
        for <linux-media@vger.kernel.org>; Sun,  5 Mar 2023 12:51:21 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 16AA585A1F;
        Sun,  5 Mar 2023 21:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1678049479;
        bh=1IIZ5cXT9MjyR4m8kfZh5MLkgJE2lkLpDwB+TkI3y0Y=;
        h=From:To:Cc:Subject:Date:From;
        b=YkLzueQasv7qLjavzVqEITMfHl1saqCyf3udKNeSCggAACg+jtf0czHeCUV+zg8Fm
         JjRVE1dAdGR2ZOIjOjyHOb5dYMw/UC4PejWZdMnc/DCuOSG0xc7EV0Z3VEyVANr6Rr
         Q/rdykJl6so42S7bZsB9pQa3TivCtHlGPhMM/hCLYCdkyDmAoFuAkWrP57FCke3mEt
         e6mcwOCTs8kq6YCsdEmn3+mkQdPsxoSVScPsz8hNHaT6IZSdJ8HditB/r2NzOvOqwg
         5VytB3U2pLL7Sd5LD2SGnuu8TG1jApGERkRFf+ic7RHJWvQJlZPVAh51Dk+dpdEyUl
         zssuffYUD9pqA==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] media: stm32-dcmi: Enable incoherent buffer allocation
Date:   Sun,  5 Mar 2023 21:51:07 +0100
Message-Id: <20230305205107.772931-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set allow_cache_hints to 1 for the vb2_queue capture queue in the
STM32MP15xx DCMI V4L2 driver. This allows us to allocate buffers
with the V4L2_MEMORY_FLAG_NON_COHERENT set. On STM32MP15xx SoCs,
this enables caching for this memory, which improves performance
when being read from CPU.

This change should be safe from race conditions since videobuf2
already invalidates or flushes the appropriate cache lines in
its prepare() and finish() methods.

Tested on a STM32MP157F SoC. Resulted in 4x buffer access speedup.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index ad8e9742e1ae7..2ac508da5ba36 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2084,6 +2084,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->min_buffers_needed = 2;
+	q->allow_cache_hints = 1;
 	q->dev = &pdev->dev;
 
 	ret = vb2_queue_init(q);
-- 
2.39.2

