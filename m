Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A343AB793
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 13:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404405AbfIFL4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 07:56:08 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41088 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390417AbfIFL4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 07:56:06 -0400
Received: by mail-pg1-f193.google.com with SMTP id x15so3370709pgg.8
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yGxlx3MKmlt/bKN9nc3Oi1GFJ80hfXJe1nLtjwmXCP4=;
        b=iEbqIiTQKpgiBJF2YBK8xmQsBjq8O99b4/SPFDO0jIo8BxTBQQxLeqtCJTy7afP6VL
         xebfwx3o9AaZdUGN4NhSNUU2ZMcKxhMoscCKUGZOCn+qv6ocWexd+MyP0rvFT/dSljXl
         YPgo7OG2X+xaFT8VF7yJ84DPifUCIe7J5A/so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yGxlx3MKmlt/bKN9nc3Oi1GFJ80hfXJe1nLtjwmXCP4=;
        b=DqBw4qxZ9V6q6wvdwHN5U++OxmQVhEtL4tATeipN4E7LygLJlAJ2NLc13I9q+weRHq
         UsxFR4fZewhSz85FsmtkmKhnxCRtSG+Ezm0JelrRz+JDwoOYzgsfI/VRZvpdl0cV4ZAH
         eDf9LSq8asmhCb65xPzuwuiXRqjaenq/VljsqdQARUR0aViaIjEybbyPluDzwO+yWyAc
         Lp38t8ri3NqWyxkRT5bLR62dDodyWhIPtVbsmlGjckCPeXQBy3UpaLprp87ISGpK6m3u
         cOBchUMbt0n2N6lEngKr3TvoHQYs4i0PRJyJPu92mddVWUFGFTG7B9GBOwyJH20QaAa2
         yiWA==
X-Gm-Message-State: APjAAAWxU6dkJSWYN0TZc0b/d4TCmTdkMFL4tu2N0xq3fBFatf/W2WCn
        QzvIhz8WZVHhDP+u8670CP1IKA==
X-Google-Smtp-Source: APXvYqzL8UPBxmIuWjOxv5igGLxQuIVAl7t9p/BozL5Bqd19LANFyc9RLPLnp2L+3tE4UI1iLFGO0A==
X-Received: by 2002:a65:6546:: with SMTP id a6mr7868813pgw.220.1567770966375;
        Fri, 06 Sep 2019 04:56:06 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id o22sm3667394pjq.21.2019.09.06.04.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 04:56:05 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v2 13/13] media: mtk-vcodec: enable MT8183 decoder
Date:   Fri,  6 Sep 2019 20:55:13 +0900
Message-Id: <20190906115513.159705-14-acourbot@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906115513.159705-1-acourbot@chromium.org>
References: <20190906115513.159705-1-acourbot@chromium.org>
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
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 7b4afac18297..cade24bfa555 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -393,6 +393,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
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
2.23.0.187.g17f5b7556c-goog

