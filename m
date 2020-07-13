Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E015321CF55
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 08:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgGMGJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 02:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729313AbgGMGJp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 02:09:45 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3D6C08C5DD
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2020 23:09:45 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id k27so5586247pgm.2
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2020 23:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8vtvohJFj5DhHOwcKV42+FAe6eItys47TuzDpZd6Sp0=;
        b=JbHX0YdTuTKPraV5j0+Ujs09z3xmVLzJBs5dtbV2ca2zlEIpw9/Xwx2cr8kRrzd5zL
         WMhXzbgQmxy4ma6ZB4meDw7ruUpf5RClj2KFH+fzH/rThCe+0uM0s0+va0IQqpPBd0+n
         FimYaQ9nAce5kSkWg50D4Onk1O0RXwlS7HOHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8vtvohJFj5DhHOwcKV42+FAe6eItys47TuzDpZd6Sp0=;
        b=rYhoIzOoF2iA3afypw6F8nOyYhoZsPk7y9daWZQCfSsXrsfR5X7Et/NRSMfT/MhngR
         RYKl095HBpf35cfqF/3jGaqV3YC1alwzJ+VUiHyIwNNte1C0Q7Yd6U8fgUZCcMoTHLQq
         1cswbIbdHsOgs1s1IO7R34xLTF2Av48nOXfehbr7lbvm70gzF0V0QJK7tHkh2MPPFGiQ
         txi82CYKkbXHMT4oMpECVSyE8gIVcz3CwuLv7vcS8qijqmPCVs3FBMVc/7F1xPDJ3O47
         Z/pFtsZbiQmgL07prdKx1LexajsvsDe/nFJPhsJKBdDBZMo9qbLlKmv5TTR8IwHydOTE
         6BOg==
X-Gm-Message-State: AOAM531w3cap6OglVmcdoKNK/eqv0cKAyvwWKWPPT7CV3eATjHVz+FF6
        K4aGdavPOBbq6Kb7L6pSRqhojQ==
X-Google-Smtp-Source: ABdhPJx40QbqJZpmVOJjZEznYEBEY1KsemgvYMG41NmDSjiFnZj8wuKUzbGtLGNNdplayD3iq4xSFQ==
X-Received: by 2002:a63:757:: with SMTP id 84mr68486625pgh.275.1594620584647;
        Sun, 12 Jul 2020 23:09:44 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 23:09:43 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 11/16] media: mtk-vcodec: venc support MIN_OUTPUT_BUFFERS control
Date:   Mon, 13 Jul 2020 15:08:37 +0900
Message-Id: <20200713060842.471356-12-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This control is required by v4l2-compliance for encoders. A value of 1
should be suitable for all scenarios.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index f2ba19c32400..f833aee4a06f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -1206,6 +1206,8 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 
 	v4l2_ctrl_handler_init(handler, MTK_MAX_CTRLS_HINT);
 
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
+			  1, 1, 1, 1);
 	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE,
 			  ctx->dev->venc_pdata->min_bitrate,
 			  ctx->dev->venc_pdata->max_bitrate, 1, 4000000);
-- 
2.27.0.383.g050319c2ae-goog

