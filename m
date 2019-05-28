Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 771A22BEDF
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 07:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbfE1F5v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 01:57:51 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43707 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbfE1F5p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 01:57:45 -0400
Received: by mail-pl1-f193.google.com with SMTP id gn7so7838152plb.10
        for <linux-media@vger.kernel.org>; Mon, 27 May 2019 22:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GqYVB277WEFaDrjqHl9u9gzan9xp6pYbuiY2CwT3+wA=;
        b=AadNY3xF3iC0+GIj+AEcn/1/ebmF5bRb4x1ra9pHFJ24l47TmWvTXmPE7BrP8SspLO
         SgbojQcgijYA22qNoy/MhFCU4A2X+iyJdfyLFYTbao2CqYB4Ilo+6qs6fee9BcslVD93
         myeKCwSC+QF2PDXzcx/2qaV9jofGKwHdNF+D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GqYVB277WEFaDrjqHl9u9gzan9xp6pYbuiY2CwT3+wA=;
        b=spYgJpkMbUdNglrej0H23HYdZnCN0B3E98dJ1tHYr5tBlVT9e8B4NpW5KpMmitV6vp
         Ju/VJgNgn3VLu4xF+04NBYmx6Cl2hJ189xmKhq1GrHM4e2WilgFU+252XuQq5NW4H0Q7
         xwZGnGs891eBpmW4S8P3wHX/UZRlQ7H9bSrcmBRV1hGZW3eHsjBBcDymVn6/D2RR+qaJ
         6YugRer8GNe2VuBImNAjei60TXvRsGi7X9OoDkN11MuqXavAhBYEA26tPc6gOyBppxey
         c/LQ1PQ5bAbNl1uKvcO7Yk8kMozKUNcf44N5ta02771o8tdOElNMd+AMWVYlDULq0bBj
         9o0w==
X-Gm-Message-State: APjAAAW4CeAnNpiWpKKC2VYvZ4IxZDb0wttU9q53uw+S+95PGBu5iQrq
        gqMe6SiMQXwgMDmYf2Xo/V43jw==
X-Google-Smtp-Source: APXvYqxIBAI0HKWcz4VbpCo99CLIBzk+Qjzv17nOkj2dGauUT7BgjmEXMM+WYYbthMzYg7QjlTOctg==
X-Received: by 2002:a17:902:bf08:: with SMTP id bi8mr20531914plb.206.1559023064671;
        Mon, 27 May 2019 22:57:44 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id w1sm13950551pfg.51.2019.05.27.22.57.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 22:57:44 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFCv1 12/12] media: mtk-vcodec: enable MT8183 decoder
Date:   Tue, 28 May 2019 14:56:35 +0900
Message-Id: <20190528055635.12109-13-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190528055635.12109-1-acourbot@chromium.org>
References: <20190528055635.12109-1-acourbot@chromium.org>
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
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
[acourbot: refactor, cleanup and split]

Change-Id: I5696b186fae16f12b97745247331732beb1192e2
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 8be0c04f7e81..60dd312500a4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -401,6 +401,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
 		.compatible = "mediatek,mt8173-vcodec-dec",
 		.data = &mtk_frame_8173_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8183-vcodec-dec",
+		.data = &mtk_req_8183_pdata,
+	},
 	{},
 };
 
-- 
2.22.0.rc1.257.g3120a18244-goog

