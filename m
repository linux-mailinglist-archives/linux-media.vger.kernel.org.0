Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90110324DEE
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 11:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235309AbhBYKVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 05:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235433AbhBYKSL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 05:18:11 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AFEC061226
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:16:49 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id u12so3016743pjr.2
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+yS+AHb3s866k2lU1xZg4tYpUdbOibtq7glaYxaE4WE=;
        b=G+uLU8+yUATiEZ5HzQaduPeaScP4CKUMHIXLp99zpPe/n1rYF1y5KD8PyO5+Uhb4oZ
         S+oZod2AvWjLkHachJAObSMbOwqQlTr1xTS2cvLtMvtG3S1MR/v5+73nRnNvgOGfvg3J
         uPH+TQjr8WmHfXhrLVK3f3CFm4qtrXr42dWzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+yS+AHb3s866k2lU1xZg4tYpUdbOibtq7glaYxaE4WE=;
        b=RBtptJ8yOBzz5wuMWBIfPI4c3CDBmzkfXNVDcjbhy+gCfDWniOxZf6P9E35zNvc2dS
         EIz/tFMXnyj2wKWHiKTrijBJFE7e/SiQJDY6KBTeUrhLqTQb7xRH8OnH2prQSO4Jd/gq
         yzBwSpXAEOQJHfEBLmmsgD+jOH9xpACSL+dbIz1gxJFQdD5n1x4nRXnqWQyt16mUV7ju
         w29XkeNg6ccEhI4J8qDWHVCPqrPUsTJ6OW8PABSzfBJa693iFi/kYBrgyL2VdwzdGrnJ
         x1JB/SH/aDoMEZ2ugShLHbyw01mrRcNEBIk/dem4dDSZJJPuyGhr/3+y2gtmjl/yuVN8
         1AVg==
X-Gm-Message-State: AOAM530bA4J6spG0fvLCW3aQMdxLOpZb2tshqjRrWvhZK2B0f9n/pVQt
        BFBnE9625n0obKxPhlt/EIZnaw==
X-Google-Smtp-Source: ABdhPJwoIZ6BLFEX8Y/Krce0DGVLg703lQE0bVo0LkyeZhUB7NkSDv4jQgzyoGecoxzT7Z7DOkZAIA==
X-Received: by 2002:a17:90a:1616:: with SMTP id n22mr2620982pja.110.1614248209010;
        Thu, 25 Feb 2021 02:16:49 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:2550:3154:2c53:b6e7])
        by smtp.gmail.com with ESMTPSA id z2sm5848193pfc.8.2021.02.25.02.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 02:16:48 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2 8/8] media: mtk-vcodec: enable MT8183 decoder
Date:   Thu, 25 Feb 2021 19:16:12 +0900
Message-Id: <20210225101612.2832444-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210225101612.2832444-1-acourbot@chromium.org>
References: <20210225101612.2832444-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Now that all the supporting blocks are present, enable decoder for
MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e942e28f96fe..e0526c0900c8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -383,12 +383,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
 
 static const struct of_device_id mtk_vcodec_match[] = {
 	{
 		.compatible = "mediatek,mt8173-vcodec-dec",
 		.data = &mtk_vdec_8173_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8183-vcodec-dec",
+		.data = &mtk_vdec_8183_pdata,
+	},
 	{},
 };
 
-- 
2.30.0.617.g56c4b15f3c-goog

