Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (unknown [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C883E4662
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 15:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235416AbhHINU2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 09:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbhHINU2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 09:20:28 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3016C061796
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 06:20:07 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id w5-20020a170902e885b029012cf3ddd763so4102329plg.17
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=B9pfgHx94Mp6VS74RBiZjYF3tpik3lJpO946s0UsSic=;
        b=mAuIQtkaP0fzYFW6h6JQa1cEz9AoQfPARLqb+YpSwBvFqfEfZKQSAaVbFoKFeaNcJd
         cydTti3lobCvmQGsRBpQg59HWlDCqo8Uw1xZNVeFi+eOTti9jtI/b9awQul606CQAFoP
         I9uClYw8qm7bBimTcc/VZKLXqTMH7IMB0OgPikzz5fo3vR4DGXXq4x56iKUt01f6lqNV
         yg68CHhUPHT10W0kQ/douHD9tA/fYY6MhUaundwT4sEVWnVNmE/wrEoL1oCsViqHGwbe
         5bZwgU1zlNnVn9woI7LciBvWYb6ywvXOhQB3U6hdyFr5YYDhz+wltSuMYtjxusBx5xb6
         o+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=B9pfgHx94Mp6VS74RBiZjYF3tpik3lJpO946s0UsSic=;
        b=LT77HSlOwkYjyF76dAjYim6xAXmeRB697iRhoIPu+J3V5bIvvAUL20EjmaS/W05t02
         J0KVjAu0hevUNRqOpF+4S8DZA5ON2OZtAJt24BwkNBH6HQ2me0pHCH7ZMNSdYWzn7124
         uwhPUZ9JhFrtOmsbhypDodZKXpLtqca/S3f7wT9SXgvM31HyGBhadoMVv22GkXEj4d6n
         yLGr8haKEb1ypfaMD3g4cjeuisU7yV3TquLycXa5+dMKhg/Uskz9ofCRwO3BqV52UFcA
         bCoA8rM4l9EESxWROdGP7J3DEhn9+JQO6BegKc6XGggDDQ61NXVFPMcKgn/FkOiu/3HP
         KFlA==
X-Gm-Message-State: AOAM533LBEZL8u+AiTwBSvUGZ6Yd5Jvs1/MlJKJ13M2vK6L70Cqu9mw1
        mhvG591q/7X2PsuQ4O96naqEfkaFde84
X-Google-Smtp-Source: ABdhPJxIewl0V72VGtEJkuskjE1bDRXXbrFucVnESfeYsyGu9cj4xHe6y8NbEVYV0E1hDY1gZAG7egqHh8t7
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:8c61:f7b3:b14d:6bb2])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:7886:: with SMTP id
 x6mr121pjk.1.1628515207043; Mon, 09 Aug 2021 06:20:07 -0700 (PDT)
Date:   Mon,  9 Aug 2021 21:19:40 +0800
Message-Id: <20210809131940.2890108-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH] media: mtk-vcodec: fix warnings: symbol XXX was not declared
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes sparse warnings:
- warning: symbol 'mtk_vdec_8173_pdata' was not declared. Should it be
static?
- warning: symbol 'mtk_vdec_8183_pdata' was not declared. Should it be
static?

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
The patch applies after series [1] to fix the follow up sparse warnings.

[1]: https://patchwork.linuxtv.org/project/linux-media/cover/20210806041530.4170869-1-tzungbi@google.com/

 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h     | 2 ++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index 9fbd24186c1a..46783516b84a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -65,6 +65,8 @@ struct mtk_video_dec_buf {
 extern const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops;
 extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
 extern const struct media_device_ops mtk_vcodec_media_ops;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
 
 
 /*
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 36ae3e6017f0..e6e6a8203eeb 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -372,9 +372,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
-extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
-
 static const struct of_device_id mtk_vcodec_match[] = {
 	{
 		.compatible = "mediatek,mt8173-vcodec-dec",
-- 
2.32.0.605.g8dce9f2422-goog

