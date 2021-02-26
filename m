Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949433260E5
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhBZKG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhBZKE2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:04:28 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8EE6C061222
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:26 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id n10so5902808pgl.10
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WQNDkU+500oaLNnr6/H87wLcS76179lgtjRrVGbRbo0=;
        b=l2WhSkGpCkFNMw34fBmnRV9rSwS8Nn+50Rp/1Amx+5a3ZFCVm3W368JJVBq/7pUlK6
         THRAyocynBiFi0dEZz83aA28m9Nu/XWbwo+ogouGmuTiZ+7HyWcxNAFW06Mp96/BuWXu
         mqH/HshaCcS4iR0faPqQwNCNOFBDzqQq7M8DM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WQNDkU+500oaLNnr6/H87wLcS76179lgtjRrVGbRbo0=;
        b=i5IFu8053RBPIzuwHVHr8camilgW63nne/9st4ODzJ4OZ1Cci3qCJ7MbojmM+JXNyR
         Itp97XCPf2LEn6IGYCQGpDP+GBf2gq12nAKbq/BUXBuRd2fboElyZgOm2/ytpsUMIF5x
         vNi9tQA4hm0NmWE0rAzHI0dDaot51oOGCAk59+eCBw/x+eKjHqydkBr1Lr2+x0xyaOWk
         AV0/QQbAfVI/fRn+smI0hjVdnu85kzh/pmQQz3EDqEP0aDUuJJ3tpJQvdUHAU8tbTs0A
         bsExRoHAEeIos7OAbkXzrqwS5n7GVETQAbI9b1UZnhqSQkBrNdK1S7SRPplAyyFNQ8Pr
         vFKw==
X-Gm-Message-State: AOAM532FFNYIy2fBC7fLTntKZVkejnpiFPUBQVXOUoHW7VSZkDrcor2N
        mKK3oI+vJ4jDqmcRTN0ZwEMGLw==
X-Google-Smtp-Source: ABdhPJyjC694FGK1elv0PdV59eZd0IgHmTfbCH66cTKytZPmlOb1dIm1+gj/IenqpVaHvv3cs9lT1g==
X-Received: by 2002:a63:4d52:: with SMTP id n18mr2177885pgl.237.1614333746419;
        Fri, 26 Feb 2021 02:02:26 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
        by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 02:02:25 -0800 (PST)
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
Subject: [PATCH v3 09/15] media: mtk-vcodec: enable MT8183 decoder
Date:   Fri, 26 Feb 2021 19:01:42 +0900
Message-Id: <20210226100148.1663389-10-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
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
2.30.1.766.gb4fecdf3b7-goog

