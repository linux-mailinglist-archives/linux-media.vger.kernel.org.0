Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452AF32F2E8
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 19:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhCESkV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 13:40:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbhCESjx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 13:39:53 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554EFC061762
        for <linux-media@vger.kernel.org>; Fri,  5 Mar 2021 10:39:40 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id lr13so5388378ejb.8
        for <linux-media@vger.kernel.org>; Fri, 05 Mar 2021 10:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ay/VePmX2E/QdxtPcN6EVcrY1//aOiSoLhu5+Byfit4=;
        b=a6a3cisX0udcGADfxE4OE2hEwPSsWnQDpdAmXJJc+Vy1RKa3JKLMgmD/eKbNdVfA4A
         StQZOtXuo3QZh1t/6ubhyM3b2+NpyGJ3lhuLQXKGQ8yEKNp51WNB/Q1YUUn28F7LxAZR
         wL7GM/MAGl+djORupYY6CXx/DcB4t6yUj5K6wSnP67wVDe5epFqhSh5Rcn0gLufmrOlT
         NY9Bvw9rZ/oGTblMv60mnLyDaoI9/xks0ECCKT6Xguqzd3cXmirXnFnJ4Lok7+k4G1o/
         dyHvOFKQ/O34Kpj9USKsyRxf7VOIB7+r2cAq5uAKsI7SQI/NDnVFokFQJ2UbVxrrweCl
         PqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ay/VePmX2E/QdxtPcN6EVcrY1//aOiSoLhu5+Byfit4=;
        b=F95SuOQ8zLQ3pMXK5qPgYGPw469VIu+zPuj9IHmgBO0lPBtYKtdACrkjqbozX+mKVS
         KBBFhpmw8pJ95e3M4haUMm3mb7okSnWcQIsH2VzZ3cHh2e4aGh8QnuWCF+pGVaT86gRT
         JYgnmlIU/ENbbvmzstzlrLJx8Jgipzu/u8hROivojw8T9wQf+P/6J3pKW7bkByYS8doZ
         WxZQQi7v6ng2MXJFWyWs4vPyxpcQ9BNSc43N7AST79ufb55qOWyLkqXSGPDfRGboZyp7
         RRw7ahXDqiFvLiOaFNq2rFi9niKiALMv8yU0lm79Ve8XHl4VS3p+0/pfBhOBCE82Is7p
         KUXA==
X-Gm-Message-State: AOAM530uOAVUlTNLOfYCauFNqNRC9uL7uOQ5zO7+ZL8meO8k3cpgEE1C
        umtdZidBZ3LKNtge3L81+UY=
X-Google-Smtp-Source: ABdhPJwEwactJjc4D3Bx7DICv+mc4VyjqP52lF84bycTxInNNIhN5/8ERDGvF9ftNFCzrlU/cOdTVg==
X-Received: by 2002:a17:906:9243:: with SMTP id c3mr3279149ejx.388.1614969579120;
        Fri, 05 Mar 2021 10:39:39 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id o1sm2121808eds.26.2021.03.05.10.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 10:39:38 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 3/7] media: hantro: imx: remove duplicate dec_base init
Date:   Fri,  5 Mar 2021 18:39:20 +0000
Message-Id: <20210305183924.1754026-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

The vpu->dec_base is already set by the hantro driver itself.

Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 1f48c1956cd2..cb1ac02c03d2 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -150,7 +150,6 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
 
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
-	vpu->dec_base = vpu->reg_bases[0];
 	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
 
 	return 0;
-- 
2.30.1

