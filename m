Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B11DE6FE192
	for <lists+linux-media@lfdr.de>; Wed, 10 May 2023 17:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237441AbjEJPcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 May 2023 11:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjEJPcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 May 2023 11:32:07 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B0F2D66
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 08:32:04 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6436dfa15b3so4972421b3a.1
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683732724; x=1686324724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=juWcyeSBe03nI7TSodOkq9zFpeZ4gErVFi+Ebwz3Ux8=;
        b=bH/rifR2+9qrvGxj7TGq/T7hSFeNNm8MW8DaYbysKrlNYXI5LR0Q61vXSzKVOX3W5B
         SHCCJhYLlyXR9pxGi++ZILCd2enTcwsaL8oDkHLgOgamlJgrF9mxYAKBxJk8Gv4L5BTs
         G0tGHCfpEqXhjee9B+2Qe71/0+qn3cDmiOBLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683732724; x=1686324724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juWcyeSBe03nI7TSodOkq9zFpeZ4gErVFi+Ebwz3Ux8=;
        b=IGt4PhU/INt2D66PwmOVu+dUyhXSkMyjYfIezWvQeKM4xaDwVqs5YDyVX+fNDrHwnb
         7z8zhijz4NzYCwf/lXly0mtUJnp8ZwRXV6GbdEUUzTSaEJqQTPmzhdvyhy8q4K7SDQeD
         +3lkZxgj9rpW1f+L/yWcriFWoaQwcEHcxQYqOkF4sEChZMU/PIxIKqqtKtW03lAOA6pb
         5qYXroih7JR5pBBffUuq/7dMwJnlHwxCuJHKgpUiWhvEJsmbMFVq9lQP3R9W68OTLM2x
         fbXHc2zfNVUogMl1ojXvBtBH/CBiYxiPadZTcXqLdD7uYZwLl0kDvEneTfbOsJaUcGYr
         uPiQ==
X-Gm-Message-State: AC+VfDycuOMtG22aHdp/00Stzi/A9zEmWcqqWPPVIq1N6ohnu2LE1pJ5
        u01L91zgem9LoOWYCVNfarX6+g==
X-Google-Smtp-Source: ACHHUZ4covKpZINnEbCbA63hw2wkSQsa8YuVFl+q+NfVOLrvs4TpM1hHNJVz6obDsAcae18eoOtPEA==
X-Received: by 2002:a05:6a20:9187:b0:dd:e6f5:a798 with SMTP id v7-20020a056a20918700b000dde6f5a798mr23115371pzd.6.1683732724336;
        Wed, 10 May 2023 08:32:04 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:d50a:c03e:3f7a:7e5f])
        by smtp.gmail.com with ESMTPSA id y10-20020a62b50a000000b00643b04b515fsm3643210pfe.160.2023.05.10.08.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 08:32:03 -0700 (PDT)
From:   Fei Shao <fshao@chromium.org>
To:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Fei Shao <fshao@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: Convert mtk_vcodec_dec_hw platform remove callback
Date:   Wed, 10 May 2023 23:31:35 +0800
Message-ID: <20230510233117.1.I7047714f92ef7569bd21f118ae6aee20b3175a92@changeid>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This aligns with [1] and converts the platform remove callback to
.remove_new(), which returns void.

[1]: commit a3afc5b10661 ("media: mtk_vcodec_dec_drv: Convert to
     platform remove callback returning void")

Signed-off-by: Fei Shao <fshao@chromium.org>

---

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
index b753bf54ebd9..bd5743723da6 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
@@ -193,16 +193,14 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_vdec_hw_remove(struct platform_device *pdev)
+static void mtk_vdec_hw_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static struct platform_driver mtk_vdec_driver = {
 	.probe	= mtk_vdec_hw_probe,
-	.remove = mtk_vdec_hw_remove,
+	.remove_new = mtk_vdec_hw_remove,
 	.driver	= {
 		.name	= "mtk-vdec-comp",
 		.of_match_table = mtk_vdec_hw_match,
-- 
2.40.1.521.gf1e218fcd8-goog

