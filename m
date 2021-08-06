Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D773E226C
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 06:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242819AbhHFERB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 00:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242769AbhHFERA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 00:17:00 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B609CC061798
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 21:16:44 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id k1-20020a17090a39c1b0290176898bbb9cso9079530pjf.8
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 21:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=VRCp1gt1+Tm8DKrP/bEBz4/wYC+uwc+iQhHn0pgVUPM=;
        b=qqjK53VfiiIyZXKieqMrPne4RfS+RoIGd+Vs+zgcRBTVQ2or7efv+fyQDpWwa/v6yc
         V2Nm8vCaiHPeMuv0tWK3acbZMTTGJDO2oJoTzidqaYzCZWcB7J2DhUhxwHKq53O8JkJj
         SK1Rbi6+5eeC95kPp0xm8PkPJ/3MiwEdsG0raX5T/LIC3AANrZBoQJC5bjEdBN19taKt
         56LPVMFcKBRQ2XWEXM4WGz6TQAEbMHjUXAUGOaoupgKZGLBfCfCUN+ygKSi1umW+qeBT
         l4U4qvtDOxXKoCDa8E+CsPe6LE9rR/fz8oUc2TPmRpmzzPA2zYjWsQjq1ZWbd0GKvZTC
         WX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=VRCp1gt1+Tm8DKrP/bEBz4/wYC+uwc+iQhHn0pgVUPM=;
        b=oTNxF9PPrir4pJH/I78BigCc6Q/Q4cNedSw5tg9Ya7ENq/1Xyb9CD9ZFAwDQBlpQy1
         fg/Q48HDcjXmowj59QhRR3ntljKYBqCPXwZlmYOibhQ1KeHhxaSTjg6DUbhVQWqJZF90
         9gnBmWHnQr2A5pUgVpOryf7RdnSvDpFsgvpJ2+OEBingDo/CwSJ83dRbZRGXFeUOpjae
         ATEgmmgRCh68FZI/isKpx8zW94DYRRxx8APIWY9fdlragE0Th5tYKueHMasTcJmXh2Pv
         KajxzfP6BKtljDETKi/9zQPwPNrdTtdA365virWLJsdoJ+YKLUv/1iWKP7QsolqiwRxL
         x2tw==
X-Gm-Message-State: AOAM532C3ACH0+RvrbG5as6BPO2F4INQXWpy2AvrbZU5EyQ/mcFSqhPe
        G+OD1H2B87fNvVO4qElwu4CckTzmn0bm
X-Google-Smtp-Source: ABdhPJxYcHrjQQ4a3Sxpy0Mj49WvdIyMPVK6N5vcc2g+T/OMwr+DJisr+Meut0Leq4TWpLJPRTzKEAjWkSfK
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a17:902:d652:b029:12b:45c1:21ba with SMTP
 id y18-20020a170902d652b029012b45c121bamr4702610plh.9.1628223404249; Thu, 05
 Aug 2021 21:16:44 -0700 (PDT)
Date:   Fri,  6 Aug 2021 12:15:30 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-15-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 14/14] media: mtk-vcodec: enable MT8183 decoder
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com,
        acourbot@chromium.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        dafna.hirschfeld@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
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
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index fe345aab9853..36ae3e6017f0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -373,12 +373,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
2.32.0.605.g8dce9f2422-goog

