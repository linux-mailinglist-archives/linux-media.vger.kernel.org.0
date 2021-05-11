Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFDD037ADE8
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 20:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbhEKSJ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 14:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbhEKSJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 14:09:20 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84503C061761
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:13 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id v4so6467847qtp.1
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pJYwKRHFC9D/v9YyZLrvmmyEi/XV3e15DsNSkgBPrrQ=;
        b=ardgnsNY1LGrRvNmUx4y6Cz8UX7daqhNOpl0uUiaLlhp/Yq0TkYXpz+Ew+IoaYrHv/
         TYBk3mKIDOvJbikex1W4tdjua7SyaLuJtmeXXinOdPV+rqCKmO6cIyy/03Y9DePyXJYz
         +DMsbVlTiQdKcYR2b01oDtbp5dVsBcxRQtBciEOaq4V0Hp35ptQRNTrK/Z0Y9WoOsyDF
         LdpmF7BaQnvPaG+DZZy2DKaU/V+IJrPjVFW4Pn5w5bQnuuU65UP0om6kUO2LuL/OfKzD
         vFQxjLlhHA338PAjiMSY1+eHuFzOpZL0zD0d+nOKjE9gtBooNLqjtYF+OiLSYz3/WWXE
         Q+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pJYwKRHFC9D/v9YyZLrvmmyEi/XV3e15DsNSkgBPrrQ=;
        b=sLhDp/gmUClRo18W6HqIaFAEgVHgeJ3IwLfAqYLVPS2ptYz+Y99guvBX/x4+9DS3Ja
         /BnRMlr6tWL+R11FiZtQvNCQVkG+NksyfbacrW4b4ZFr/MK5FF3fg8nLCoteSWWIq3mK
         sWFpKnf/aIvykUQs7N6a0IQ1r2nLaKjy1Abw9tRqzDgGtB1YvHKA11KutYJumSqIzQR8
         QKWJ3vZ+ieWowQhvpl9y3YI56vUsCAUJx0/T1T/nHmlyxx7sEcD4TBb1Y+y7qfop/eaj
         q1G1uFQawmxtL+/qrAUcW5Rd7pwzQgBqzqZrR+g4BZNIOdSaZ7RBaCnpcAPtw6XtitUV
         GEIw==
X-Gm-Message-State: AOAM532lPOtEWNORLcX8PYzYL4SzAMwtlDM/YtExKwjQ9NsHm+gQQkzL
        xyTLqMsxMsA8FadsH75AbXpmXQ==
X-Google-Smtp-Source: ABdhPJz/FVqvhR7snsZrZW+H8n25D/ATHAZ7q+6c2450W2oz89pFWCcicBuT9Tw1YrUd2crzDX5VLw==
X-Received: by 2002:a05:622a:10e:: with SMTP id u14mr28711681qtw.229.1620756492817;
        Tue, 11 May 2021 11:08:12 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:12 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/17] media: camss: csid-170: don't enable unused irqs
Date:   Tue, 11 May 2021 14:07:12 -0400
Message-Id: <20210511180728.23781-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

csid_isr() only checks for the reset irq, so enabling any other irqs
doesn't make sense. The "RDI irq" comment is also wrong, the register
should be CSID_CSI2_RDIN_IRQ_MASK. Without this fix there may be an
excessive amount of irqs.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index a81cc94c075f..2bc695819919 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -443,12 +443,6 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
 
-	/* error irqs start at BIT(11) */
-	writel_relaxed(~0u, csid->base + CSID_CSI2_RX_IRQ_MASK);
-
-	/* RDI irq */
-	writel_relaxed(~0u, csid->base + CSID_TOP_IRQ_MASK);
-
 	val = 1 << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
 }
-- 
2.26.1

