Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E743BB6E9
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 07:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhGEFgk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 01:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhGEFgh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 01:36:37 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBD8C061574
        for <linux-media@vger.kernel.org>; Sun,  4 Jul 2021 22:34:01 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id i184so2748522pfc.12
        for <linux-media@vger.kernel.org>; Sun, 04 Jul 2021 22:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Wsby3LClrEo2/xvJaYmxPCAce43LH7aBkEp9Egxfy4=;
        b=ciOeWZgPMFrOVTP7nqd3vh4BK2H/kDoECH0M4NTEkvLjqklwcEvMZ6pOyuiZv+QQ6h
         lDrBMGCeKRXaGAWDSu0UEiP0bU0dHHUbj1LyFXD8974EHU34QZf923FQPLIIHzmY+Flg
         kSfePNmu2lWtckpm/B5Wfe4iQykGWcWzyPyRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Wsby3LClrEo2/xvJaYmxPCAce43LH7aBkEp9Egxfy4=;
        b=MtNDsujQi2vj1yQn+b73GQGek5ovVdu9hJAVosZ3MSBXUJwOOcPFiM886Ga7OveHEn
         gM9arrIdK5fJfh7utn/lOzOO6geiUgqcnYINVDuALj2+wzRNJkDVc9UjZwH5a7/ZeXpk
         pH2emCfJLCMtbodPH3U01PtcyKpt+sLdBLTh7LdgUBD2GvPHiK5Kwdsdbe/KCFLbI5eP
         /CWFwYToeooaRYgsNBHmedqX4yfPZzhH+KDZ2oWVjxIggWJasHvGNq1RWQC2ec1vkS1m
         7+V3thKK6pbDiAv7w0u9jRi/Hdz7fHKZ3afTXCLk6wUIFDJRnu9FUsq4CPOZY/aRRYdz
         Nkiw==
X-Gm-Message-State: AOAM533tW6iOeIuAsZ9u31eJGf0GMUbVZD/8Ri224YYlQ8GKdDe3gJRv
        G3g8np7FMDhcozDiJnPA6qwJqg==
X-Google-Smtp-Source: ABdhPJzP2yjoBz66yyuwQKfBYNR+vQPbMTqUfKLq82KBIzHKMAhnU++++X2fY97oynm7v9ff5u19nQ==
X-Received: by 2002:a63:fb11:: with SMTP id o17mr13787214pgh.177.1625463240848;
        Sun, 04 Jul 2021 22:34:00 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:3fed:7130:60f:265a])
        by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 22:34:00 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v6 14/14] media: mtk-vcodec: enable MT8183 decoder
Date:   Mon,  5 Jul 2021 14:32:58 +0900
Message-Id: <20210705053258.1614177-15-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705053258.1614177-1-acourbot@chromium.org>
References: <20210705053258.1614177-1-acourbot@chromium.org>
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
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index c8a84fa11e4a..55ae198dbcf9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -374,12 +374,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
2.32.0.93.g670b81a890-goog

