Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02028712002
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 08:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242203AbjEZGcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 02:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242225AbjEZGcB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 02:32:01 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5185213A
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 23:31:56 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64d2981e3abso484795b3a.1
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685082716; x=1687674716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WcusQp6OcfSqJMF8NpXBP2EIksMc7QBaKN7KQDMVLt0=;
        b=BAEHHZCadJWD1FnUb7y5eXB/7raIJI60nN5wNAnIP/9PoFUnwvRLEVWCtljflKEZaZ
         xb37jsqSRWK/ETW3hgPcdttl8XPE/ehOk2iw2E16jcUTjQies2WUHlILX9ndDK/sT9Iq
         mdLFc3/TNbXq1L9NBTfFKY7eTxvKx37hQjs+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685082716; x=1687674716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcusQp6OcfSqJMF8NpXBP2EIksMc7QBaKN7KQDMVLt0=;
        b=MJ7lDHg4xNjFrr5BH4Q9SPMo0El8vfUKYzKh3RzEmhDC7w1P09kDdzv8fGoE4XPVRZ
         UezwF8VL4Cnac3/OXBdUuF37UbVsrSnwJTNUAqXO9u4yyg40zDKoAN8gHosiOdjGkfHs
         f+GrAWRSixx70b/F/ViDiYLM6Ephf+t46butC0UMiFuakayDMIsqTna+OFT1mLcpw+ZT
         PW1dlMP/hH6TuQTAsZeotjnZWRVcu7hnAMIF1bvg5v3vyWxWzlo0oO6pFt+ErE0naZQt
         IeX9M3LG1XgRW/1RZHXpt3HtGDdEjsBxLKB3MQtgykU+mnmNhp4nljZzAS1+Wm0QWMrA
         zQQQ==
X-Gm-Message-State: AC+VfDy9IlselgKqxyW/CkXuEK4tfu5m+9LZBXUufOFfToxXtOXXEERQ
        +b3mGs1qk8tcZ788KU13JyO3xA==
X-Google-Smtp-Source: ACHHUZ57rV6GznshDRQuv9znwOTR7CCeO7CD9y+SnsBEvFdpWmBi8Ki20RhpnN5UHsrOuDByFKK3eA==
X-Received: by 2002:a05:6a20:2444:b0:10c:dd4f:faa7 with SMTP id t4-20020a056a20244400b0010cdd4ffaa7mr1430744pzc.1.1685082715786;
        Thu, 25 May 2023 23:31:55 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:9579:4741:86ee:bf02])
        by smtp.gmail.com with ESMTPSA id y4-20020a62b504000000b0063b17b58822sm2075414pfe.74.2023.05.25.23.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:31:55 -0700 (PDT)
From:   Pin-yen Lin <treapking@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        linux-media@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v6] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
Date:   Fri, 26 May 2023 14:31:39 +0800
Message-ID: <20230526063149.1801196-1-treapking@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
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

From: Alexandre Courbot <acourbot@chromium.org>

When running memcpy_toio:
memcpy_toio(send_obj->share_buf, buf, len);
it was found that errors appear if len is not a multiple of 8:

[58.350841] mtk-mdp 14001000.rdma: processing failed: -22

This is because in ARM64, memcpy_toio does byte-size access
when the length is not a multiple of 8 while access to the
vpu iomem must be 4 aligned.

This patch ensures the copy of a multiple of 8 size by calling
round_up(len, 8) when copying.

Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---
This is a re-send of v5 because it was marked obsolete, but this patch
is required for MT8173 platforms.

Changes in v6:
- Collect review tag

 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 5e2bc286f168..19ff4afea456 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -349,7 +349,22 @@ int vpu_ipi_send(struct platform_device *pdev,
 		}
 	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
 
-	memcpy_toio(send_obj->share_buf, buf, len);
+	/*
+	 * On Arm64, the memcpy_toio does byte-size access as long as address or length are
+	 * not 8 aligned. Access to the vpu iomem must be 4 aligned. Byte-size access is
+	 * not allowed and cause processing to fail. Therefore make sure the length
+	 * sent to memcpy_toio is a multiply of 8.
+	 */
+	if (len % 8 != 0) {
+		unsigned char data[sizeof(send_obj->share_buf)];
+
+		memset(data + len, 0, sizeof(data) - len);
+		memcpy(data, buf, len);
+		memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
+	} else {
+		memcpy_toio(send_obj->share_buf, buf, len);
+	}
+
 	writel(len, &send_obj->len);
 	writel(id, &send_obj->id);
 
-- 
2.41.0.rc0.172.g3f132b7071-goog

