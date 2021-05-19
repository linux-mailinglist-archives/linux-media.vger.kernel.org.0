Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C092E3890F4
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 16:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354301AbhESOdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 10:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354168AbhESOcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 10:32:47 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA86EC061348
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:31:18 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso3508470pjb.5
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pxHWIv8mtXKu/R/yk/BzKvnm7qsRzpUVYJfZeXwk3dw=;
        b=fXkuTtpeHQgusVE75tuFUeKE9nPDphT70P4L4q+fYAHlAj+GnhdKAXE7840oEYdytQ
         OKXKEf3OKBJruOF7UFGUIjYdgsEyfHFMyCoqTP3q+0BxEu3yfNw66MpUSL9GqcrIBP83
         J32QI06OgpG05IDlxcBtnJ0F5xMEzKXmAWxow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pxHWIv8mtXKu/R/yk/BzKvnm7qsRzpUVYJfZeXwk3dw=;
        b=inUs608naPhew77DV1WdvVPydEJ/QY7GZbHMRuysktfwWTXlxfhzS91FMUCDLorFhq
         QpNQ8SUR/eqBnKBjuCvFJ2lU7mHNpJ3H/hCINc0bpinobKhp85VWkH4RXmQHCE73ArHj
         DYzbhF3K65WOV1ETMXzmYf4/8O0T4SxOoiwrO7sjdbuk6IS8v9bFhd4ue1FTr6Z2Q5B8
         Uk+ONMggiFPkpvl5wrd5EdU91V6EwS7EnwmDldamyOLMpAky9r2DalxRElpl7vGsDrMm
         MIZYp5v/d3do+rxeCxW/8KxBj/RdyUUBpFO1uMu1KzVr1u063uwgfi24zOhgceAtwgqJ
         hEfg==
X-Gm-Message-State: AOAM531u+sdxkqtzWB6YX2eoy/bxatGYr7MX4w4Sx0owxsDw7glP7j0a
        oJRhVJZYHdZlLWzDlMGyuVeOqA==
X-Google-Smtp-Source: ABdhPJzeqnOqsJpS5veow9PnfCXMTVK27upTC7YKtWnpvDe+ecqqvMOsYEizM4mYpgTDHsDyLTdEFw==
X-Received: by 2002:a17:90b:19d3:: with SMTP id nm19mr11510188pjb.215.1621434678224;
        Wed, 19 May 2021 07:31:18 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:87ab:ff82:1544:697])
        by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:31:17 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v5 14/14] media: mtk-vcodec: enable MT8183 decoder
Date:   Wed, 19 May 2021 23:30:11 +0900
Message-Id: <20210519143011.1175546-15-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
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
index f1e9261cbcf0..00f160ca0f12 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -375,12 +375,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
2.31.1.751.gd2f1c929bd-goog

