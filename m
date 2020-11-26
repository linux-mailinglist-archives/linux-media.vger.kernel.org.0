Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5CC2C4DAB
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 04:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733186AbgKZDIw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 22:08:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730696AbgKZDIw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 22:08:52 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395EFC0613D4
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 19:08:52 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w202so332428pff.10
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 19:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=atnJehQZVO119pd4VO6r7q8kYsvyqoBTmsMlSh7A/i8=;
        b=BM3vd/ZFTSIIrKiVzBBNSfoocvC2mblhZ+0r6qJV9fNEKYFCP90dXn3R9CA4G5/2pW
         C99fiMkTeWf0gmDuqNgO58YNoGNW1I2ngQc3mvSf6PCpZpMlhxlsTxuUVEldMDeg00F8
         f2LEf6I/A7CjN2hp8bOumSlFwDFEcFucwQ3L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=atnJehQZVO119pd4VO6r7q8kYsvyqoBTmsMlSh7A/i8=;
        b=ffLDDcnfyH2zAl0IrsjEXbsOIcuL/kT0aD/ANMBIx0PopAh3e4mVVC2xxhM5/F5HEN
         NYAF7Kgy4BnEog2nXYEu70lw6Dq2CUDl1h7aEzfQMzzH2MrYpwCK2SO39v6K6cqsdNSs
         bmszKjQdI/l1Odwn4quIatqZYQP5ZDvTjDHIAOZQAL+ZmHzvrCh4LXGmKBHyWrWrRDWT
         yV3BHpoHc5/HdWn0d9VKDnaMQ6EHvbPFxujDPFXlu61cxdmtz+t5JV93kneU3kWxnQay
         Ro4Oatis9c86dXNfdtkdiWGpMh/8BriPknWaSpobiN1uGqeI8mMMsObl8aCmHG7vt6BC
         pd2w==
X-Gm-Message-State: AOAM530xnQ1phxDAhnAaOualbyx9rtZOb8zVzjbAvj0H7lvKe2/oWgFq
        FXeUTL43RgJayXAvFlJ11Un83SjLj/J+H6Go
X-Google-Smtp-Source: ABdhPJyAC2YiZ6o3LkjuCB38jzADK3Pw3TNqQRc+UnVcBfB1j9l5XRJ1Br9UH0oCUYWbT3uXJ1Z9ww==
X-Received: by 2002:a17:90b:30cb:: with SMTP id hi11mr1119711pjb.94.1606360131611;
        Wed, 25 Nov 2020 19:08:51 -0800 (PST)
Received: from localhost.localdomain ([120.152.32.152])
        by smtp.gmail.com with ESMTPSA id y9sm4323663pjj.8.2020.11.25.19.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 19:08:51 -0800 (PST)
From:   Evan Benn <evanbenn@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Evan Benn <evanbenn@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mtk-vcodec: Fix order of log arguments
Date:   Thu, 26 Nov 2020 14:08:42 +1100
Message-Id: <20201126140839.1.I723c6846bc6913bd0831a78874aa767dcbdae470@changeid>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Evan Benn <evanbenn@chromium.org>

---

 drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
index a3c7a380c9308..785ec0df445ec 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
@@ -27,11 +27,11 @@ int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx  *ctx, int command,
 
 	if (!ret) {
 		status = -1;	/* timeout */
-		mtk_v4l2_err("[%d] cmd=%d, ctx->type=%d, wait_event_interruptible_timeout time=%ums out %d %d!",
+		mtk_v4l2_err("[%d] ctx->type=%d, cmd=%d, wait_event_interruptible_timeout time=%ums out %d %d!",
 				ctx->id, ctx->type, command, timeout_ms,
 				ctx->int_cond, ctx->int_type);
 	} else if (-ERESTARTSYS == ret) {
-		mtk_v4l2_err("[%d] cmd=%d, ctx->type=%d, wait_event_interruptible_timeout interrupted by a signal %d %d",
+		mtk_v4l2_err("[%d] ctx->type=%d, cmd=%d, wait_event_interruptible_timeout interrupted by a signal %d %d",
 				ctx->id, ctx->type, command, ctx->int_cond,
 				ctx->int_type);
 		status = -1;
-- 
2.29.2.454.gaff20da3a2-goog

