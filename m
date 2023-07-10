Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B06F374CDA2
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 08:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjGJGv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 02:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjGJGv5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 02:51:57 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AEAA6
        for <linux-media@vger.kernel.org>; Sun,  9 Jul 2023 23:51:56 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-262ea2ff59dso1879645a91.0
        for <linux-media@vger.kernel.org>; Sun, 09 Jul 2023 23:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688971916; x=1691563916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OHTjYXmEzIxUquNxc12N2ed97hoxj5Q5yMhXNmLYxUg=;
        b=dWRiLXZrSKSFSMWsHBCQVAB/OlaHEOIh/Oml1FQLpvcm3sfSG6ev2fCiruI7p3ku7T
         5K625KuWeejYo4UbkfJukPnHuiZaAm5ajcflQvjH11+2dW7FXXGIR/6kcsAN/6BQat8b
         7klmo5pQBs08mERbff+G4nguqLH+zekW7LJ7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688971916; x=1691563916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHTjYXmEzIxUquNxc12N2ed97hoxj5Q5yMhXNmLYxUg=;
        b=Q5ztZ70LOoI6ltdkk18e0lZVx2wWtH+zjNDTO9m3Y0RF52WOH+MoxyKHxI+6NYPEkw
         /7KqbShPmI1kCv76uO/3B/lxbmky5upuPh2KzpFVHP/nAAKw74YPYGZDZR9RlFui0qZT
         1p2F23fIhMIv15/G9M0vbQcLMVjKyFQgLdN6MejtvgGG+oz4e8295aOXbab9FY9MkA5w
         W8zAT2+4sNyRWra4ij/nW/hNzKjAsJkesoj0g0Npx5yXidPS45KcWeo9/lnEaF5R/fBe
         3P+hr5DuVCo7tHnVuJLQ/GYZKj84jUc0ysR8JcmZcYfVKfFrGmtYkD9AwMmIYJOmu8j5
         CD3w==
X-Gm-Message-State: ABy/qLYPeYm3+bGNbT4b0lcDhhqA6YyAAXIsC9ZEAXXhEicrPCKxYj2g
        fKnffLPB2I5qUTGpQJz9mmlZQA==
X-Google-Smtp-Source: APBJJlEsK/dk4vJ7TGYCMmKUwZ7bo7xtcJrx/4aPs/O3RjBKNkmBBpuDQjFcEeGNWyeUrP7crV8msA==
X-Received: by 2002:a17:90a:5317:b0:262:d2ca:e209 with SMTP id x23-20020a17090a531700b00262d2cae209mr8935382pjh.18.1688971916071;
        Sun, 09 Jul 2023 23:51:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:be97:1d05:f9b6:36a6])
        by smtp.gmail.com with ESMTPSA id s24-20020a17090aba1800b0026302348ee4sm5537135pjr.30.2023.07.09.23.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 23:51:55 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Bin Liu <bin.liu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kyrie.wu@mediatek.com,
        irui.wang@mediatek.com
Subject: [PATCH] media: mtk-jpeg: Set platform driver data earlier
Date:   Mon, 10 Jul 2023 14:51:36 +0800
Message-ID: <20230710065139.1763695-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the multi-core JPEG encoder/decoder setup, the driver for the
individual cores references the parent device's platform driver data.
However, in the parent driver, this is only set at the end of the probe
function, way later than devm_of_platform_populate(), which triggers
the probe of the cores. This causes a kernel splat in the sub-device
probe function.

Move platform_set_drvdata() to before devm_of_platform_populate() to
fix this.

Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Not sure what caused this to surface just now, given that the driver
changes were merged in v6.2-rc1, and the corresponding dts entries
in v6.3-rc1.

This fixes boot failures on MT8195. Please apply and send to Linus ASAP.

 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 4768156181c9..6a8eea9dde67 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1312,6 +1312,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	jpeg->dev = &pdev->dev;
 	jpeg->variant = of_device_get_match_data(jpeg->dev);
 
+	platform_set_drvdata(pdev, jpeg);
+
 	ret = devm_of_platform_populate(&pdev->dev);
 	if (ret) {
 		v4l2_err(&jpeg->v4l2_dev, "Master of platform populate failed.");
@@ -1383,8 +1385,6 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		  jpeg->variant->dev_name, jpeg->vdev->num,
 		  VIDEO_MAJOR, jpeg->vdev->minor);
 
-	platform_set_drvdata(pdev, jpeg);
-
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
-- 
2.41.0.255.g8b1d071c50-goog

