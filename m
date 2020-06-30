Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4920D20EE71
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 08:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730302AbgF3G22 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 02:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730164AbgF3G2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 02:28:11 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E716C03E979
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 23:28:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o22so3992035pjw.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 23:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vnusw8KVqmLccr+Bdv13JEwKXnPkBiMBiOXb/M8oVMY=;
        b=M7C4kgCjEpA50jHKkWe85wOubmGWK8xwuqsTPKt+wHoE27ZCA1qckzlDHJCq6NmChV
         KvWaoJiBVO6rhLrZB3uImVw8sLEznZpDoVqfqGNaBJOJAdDs9ar2ahNJ9OQ4Biu0mBG+
         tYRqQeUuhqnHrVQCowSF6tPkhBpUrdmQIfI3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vnusw8KVqmLccr+Bdv13JEwKXnPkBiMBiOXb/M8oVMY=;
        b=LL5PDtpmwG2TqT4SrCWolSvGozBStUi12j1DvU8+8C0ge/4sTIyIXv7b3X2ZNdtxPo
         pULDEE9leqvi+hASVVFI1CQ/T7q1HGLtJ7Likxj8dwQM5Q+6UHmw95KSicxqrkEGedQj
         rVt5N5wVBNSDmZ1mjksvnulfRJIJ0wn3fyjf4suTBRzjrSOicOyuWRzXl2htrVuL/EdO
         bRUFZJe8AiXZWFmvYOSQC57pAFbDCg+HjchLUuLU8agzzxyA1p328QQkJ52rmtIl5Kct
         xBPi5fczedAO7XA5FgO87H2b6VCtDDdqsP/zG02Cl9dII81a7tkqi4A7hiKEB5PKctNZ
         Godw==
X-Gm-Message-State: AOAM533IYJnyiXitXRK83jJXv3Dgum07yIGtCdA5lbwemOLMZruw+fxB
        nHzXQMOfUYmBzKBjb1oAE4M/qg==
X-Google-Smtp-Source: ABdhPJw8i9JTTps6ZptKXBHaxLspml/Eo/P9js2FIrue/Tbn2dxpRndQnCqSmtPZXoqxK5wFrl9TUg==
X-Received: by 2002:a17:90a:70c6:: with SMTP id a6mr19142972pjm.16.1593498490609;
        Mon, 29 Jun 2020 23:28:10 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id d1sm1463366pfq.113.2020.06.29.23.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 23:28:09 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 8/9] media: mtk-vcodec: enable MT8183 decoder
Date:   Tue, 30 Jun 2020 15:27:10 +0900
Message-Id: <20200630062711.4169601-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200630062711.4169601-1-acourbot@chromium.org>
References: <20200630062711.4169601-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
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
index e723f8573322..e7d90973e626 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -381,12 +381,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
2.27.0.212.ge8ba1cc988-goog

